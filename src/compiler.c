#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "common.h"
#include "compiler.h"
#include "memory.h"
#include "scanner.h"

#include "debug.h"

// Maximum cases in a switch block
#define MAX_CASES 256

// Maximum breaks in nested loops
#define MAX_BREAKS 256

/**
 * Parser struct encapsulating recent tokens, all source, and error recovery states.
 */
typedef struct {
    Token current;
    Token previous;
    const char* source;
    bool hadError;
    bool panicMode;
} Parser;

/**
 * Precedence enum for operators
 */
typedef enum {
    PREC_NONE,
    PREC_ASSIGNMENT,    // =
    PREC_TERNARY,       // ?
    PREC_OR,            // or
    PREC_AND,           // and
    PREC_BITWISE_OR,    // |
    PREC_BITWISE_XOR,   // ^
    PREC_BITWISE_AND,   // &
    PREC_EQUALITY,      // == !=
    PREC_COMPARISON,    // < > <= >=
    PREC_BITWISE_SHIFT, // << >>
    PREC_TERM,          // + -
    PREC_FACTOR,        // * /
    PREC_UNARY,         // ! - ~
    PREC_CALL,          // . ()
    PREC_PRIMARY
} Precedence;

// Encapsulation of a parse function
typedef void (*ParseFn) (bool canAssign);

/**
 * A parsing rule, for both prefix and infix functions and a precedence for the Pratt Parser
 */
typedef struct {
    ParseFn prefix;
    ParseFn infix;
    Precedence precedence;
} ParseRule;

/**
 * A compile-time local, fields:
 * Name and depth, and most importantly:
 * isCaptured, if the local has been captured as an upvalue
 */
typedef struct {
    Token name;
    int depth;
    bool isCaptured;
} Local;

/**
 * A compile-time upvalue, containing its index in either the global table or the local stack.
 */
typedef struct {
    uint8_t index;
    bool isLocal;
} Upvalue;

/**
 * Enum of types of function
 */
typedef enum {
    TYPE_FUNCTION,
    TYPE_INITIALIZER,
    TYPE_METHOD,
    TYPE_SCRIPT
} FunctionType;

/**
 * A struct encapsulating a loop at compile time.
 * Contains:
 * - start (offset) and scope depth
 * - number of breaks and array of break jumps
 */
typedef struct {
    int start;
    int scopeDepth;

    int breakJumps[MAX_BREAKS];
    int breakCount;
} Loop;

/**
 * Compiler struct, requiring entirely unnecessary amounts of memory.
 */
typedef struct Compiler {
    struct Compiler* enclosing;
    ObjFunction* function;
    FunctionType type;

    Local locals[ARB_COUNT];
    int localCount;
    Upvalue upvalues[UINT8_COUNT];
    int scopeDepth;
} Compiler;

/**
 * Compiler for dealing with nested classes
 */
typedef struct ClassCompiler {
    struct ClassCompiler* enclosing;
    bool hasSuperclass;
} ClassCompiler;

#ifdef CONSTANT_OPTIMIZATIONS

/**
 * For constant folding and propagation
 */
typedef struct {
    bool  isConst;
    Value value;
    int   chunkSizeBefore;   // chunk->count before this expr was emitted
    int   constPoolBefore;   // chunk->constants.count before this expr
} ExprResult;

static ExprResult lastExpr;

static Table compileTimeConsts; // For constant propagation

#endif

Parser parser;
Compiler* current = NULL;
ClassCompiler* currentClass = NULL;
Chunk* compilingChunk;

Loop* currentLoop = NULL;

int currentTryDepth = 0;

/**
 * Helper function
 */
static Chunk* currentChunk() {
    return &current->function->chunk;
}

/**
 * Prints a parser error at the given token
 */
static void errorAt(Token* token, const char* message) {
    if (parser.panicMode) return;
    parser.panicMode = true;
    fprintf(stderr, "[line %04d, col %02d] Error", token->line, token->column);

    if (token->type == TOKEN_EOF) {
        fprintf(stderr, " at end");
    } else if (token->type == TOKEN_ERROR) {
    } else {
        fprintf(stderr, " at '%.*s'", token->length, token->start);
    }

    fprintf(stderr, ": %s\n", message);

    // Print the source line and underline the offending token.
    // Not available for string tokens (their start points to a heap buffer, not the source).
    if (token->type != TOKEN_ERROR && token->type != TOKEN_EOF && token->type != TOKEN_STRING) {
        // Walk back from token->start to find the beginning of the line.
        const char* lineStart = token->start;
        while (lineStart > parser.source && lineStart[-1] != '\n') lineStart--;

        // Print the line.
        const char* lineEnd = token->start + token->length;
        while (*lineEnd != '\n' && *lineEnd != '\0') lineEnd++;
        fprintf(stderr, "  %.*s\n", (int)(lineEnd - lineStart), lineStart);

        // Print spaces up to the token, then carets under it.
        int pad = (int)(token->start - lineStart);
        fprintf(stderr, "  ");
        for (int i = 0; i < pad; i++) fprintf(stderr, " ");
        for (int i = 0; i < token->length; i++) fprintf(stderr, "^");
        fprintf(stderr, "\n");
    }

    parser.hadError = true;
}

/**
 * Print an error at the previous token
 */
static void error(const char *message) {
    errorAt(&parser.previous, message);
}

/**
 * Print an error at the current token
 */
static void errorAtCurrent(const char* message) {
    errorAt(&parser.current, message);
}

/**
 * Advance to the next token
 */
static void advance() {
    parser.previous = parser.current;

    for (;;) {
        // Consume every invalid token
        parser.current = scanToken();
        if (parser.current.type != TOKEN_ERROR) break;

        errorAtCurrent(parser.current.start);
    }
}

/**
 * Expect a given token
 */
static void consume(TokenType type, const char* message) {
    if (parser.current.type == type) {
        advance();
        return;
    }

    errorAtCurrent(message);
}

/**
 * Check if the current token is of the given type
 */
static bool check(TokenType type) {
    return parser.current.type == type;
}

/**
 * Advance if the current token matches the give type.
 */
static bool match(TokenType type) {
    if (!check(type)) return false;
    advance();
    return true;
}

/**
 * Write one byte to the current chunk
 */
static void emitByte(uint8_t byte) {
    writeChunk(currentChunk(), byte, parser.previous.line);
}

/**
 * Write two bytes to the current chunk, i.e. a word
 */
static void emitWord(uint8_t byte1, uint8_t byte2) {
    emitByte(byte1);
    emitByte(byte2);
}

/**
 * Write four bytes to the current chunk, i.e. a double-word
 */
static void emitDoubleWord(uint8_t byte1, uint8_t byte2, uint8_t byte3, uint8_t byte4) {
    emitByte(byte1);
    emitByte(byte2);
    emitByte(byte3);
    emitByte(byte4);
}

/**
 * emit bytecode for a loop back to the given offset
 */
static void emitLoop(int loopStart) {
    emitByte(OP_LOOP);

    int offset = currentChunk()->count - loopStart + 2;
    if (offset > UINT16_MAX) error("Loop body too large.");

    emitWord((offset >> 8) & 0xff, offset & 0xff);
}

/**
 * Emit a jump placeholder to be "patched" later
 * returns the offset of the jump
 */
static int emitJump(uint8_t instruction) {
    emitByte(instruction);
    emitByte(0xff);
    emitByte(0xff);
    return currentChunk()->count - 2;
}

/**
 * Emits a return.
 */
static void emitReturn() {
    if (current->type == TYPE_INITIALIZER) {
        emitWord(OP_GET_LOCAL, 0);
    } else emitByte(OP_NULL);

    emitByte(OP_RETURN);
}

/**
 * Adds a constant to the constants array and returns the index
 */
static int makeConstant(Value value) {
    return addConstant(currentChunk(), value);
}

/**
 * Writes a constant to the chunk.
 */
static void emitConstant(Value value) {
    if (IS_NUMBER(value)) {
        // Specialized optimization
        if (AS_NUMBER(value) == 1) {
            emitByte(OP_ONE); return;
        } else if (AS_NUMBER(value) == 0) {
            emitByte(OP_ZERO); return;
        }
    }
    writeConstant(currentChunk(), value, parser.previous.line);
}

/**
 * Patches a jump at the given offset.
 * Calculates the jump distance and writes it to the offset.
 */
static void patchJump(int offset) {
    int jump = currentChunk()->count - offset - 2;

    if (jump > UINT16_MAX) {
        error("Too much code to jump over.");
    }

    currentChunk()->code[offset] = (jump >> 8) & 0xff;
    currentChunk()->code[offset + 1] = jump & 0xff;
}

/**
 * Initializes a compiler.
 * Zeros all fields
 */
static void initCompiler(Compiler* compiler, FunctionType type) {
    compiler->enclosing = current;
    compiler->function = NULL;
    compiler->type = type;
    compiler->localCount = 0;
    compiler->scopeDepth = 0;
    compiler->function = newFunction();
    compiler->function->arity = 0;
    current = compiler;

    if (type != TYPE_SCRIPT) {
        current->function->name = copyString(parser.previous.start, parser.previous.length);
    }

    Local* local = &current->locals[current->localCount++];
    local->depth = 0;
    local->isCaptured = false;

    if (type != TYPE_FUNCTION) {
        local->name.start = "this";
        local->name.length = 4;
    } else {
        local->name.start = "";
        local->name.length = 0;
    }
}

/**
 * Finishes the current compiler and returns the function it was working on
 */
static ObjFunction* endCompiler() {
    emitReturn();
    ObjFunction* function = current->function;

    if (disassembleFlag) {
        if (!parser.hadError) {
            FILE* f = fopen("output.text", "a");
            dissassembleChunk(
                currentChunk(), 
                function->name != NULL ? function->name->chars : "<script>",
                f
            );
            fprintf(f, "\n\n");
            fflush(f);
            fclose(f);
        }
    }

    current = current->enclosing;
    return function;
}

/**
 * Increments scope depth.
 */
static void beginScope() {
    current->scopeDepth++;
}

/**
 * Decrements scope depth and pops all relevant locals.
 */
static void endScope() {
    current->scopeDepth--;

    while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
        if (current->locals[current->localCount - 1].isCaptured) {
            emitByte(OP_CLOSE_UPVALUE);
        } else {
            emitByte(OP_POP);
        }
        current->localCount--;
    }
}

static void emitSet(int, uint8_t, bool);

static void expression();
static void statement();
static void declaration();

static uint8_t argumentList();
static ParseRule* getRule(TokenType type);
static void parsePrecedence(Precedence precedence);
static int resolveLocal(Compiler* compiler, Token* name);
static int resolveUpvalue(Compiler* compiler, Token* name);

/**
 * Parses an array literal
 */
static void arrLit(bool canAssign) {
    int count = 0;

    if (!check(TOKEN_RIGHT_BRACE)) {
        do {
            expression();
            if (count == 0xffffff) {
                // Shouldn't ever happen unless you are using a script to generate code
                // Or that new fancy thing everyone's using... What was it called?
                errorAtCurrent("Cannot have more than 16777215 elements in initializer list.");
            }
            count++;
        } while (match(TOKEN_COMMA));
    }

    consume(TOKEN_RIGHT_BRACE, "Expect '}' after array initializer.");

    if (count <= 255) {
        emitWord(OP_ARRAY_INIT, (uint8_t) count);
    } else {
        emitDoubleWord(
            OP_ARRAY_INIT_LONG,
            (uint8_t) (count & 0xff),
            (uint8_t) ((count >> 8) & 0xff),
            (uint8_t) ((count >> 16) & 0xff)
        );
    }
}

/**
 * Parses a binary expression.
 */
static void binary(bool canAssign) {
    TokenType operatorType = parser.previous.type;
    ParseRule* rule = getRule(operatorType);

#ifdef CONSTANT_OPTIMIZATIONS
    ExprResult left = lastExpr;
    lastExpr.isConst = false;
#endif

    parsePrecedence((Precedence)(rule->precedence + 1));

#ifdef CONSTANT_OPTIMIZATIONS
    ExprResult right = lastExpr;

    // Detecting if we can propagate constants. If there should be an error, stop folding and break.
    if (left.isConst && right.isConst &&
        IS_NUMBER(left.value) && IS_NUMBER(right.value)) {

        double a = AS_NUMBER(left.value);
        double b = AS_NUMBER(right.value);
        bool fold = true;
        bool isBool = false;
        double numResult = 0;
        bool boolResult = false;

        switch (operatorType) {
            case TOKEN_PLUS:          numResult = a + b; break;
            case TOKEN_MINUS:         numResult = a - b; break;
            case TOKEN_STAR:          numResult = a * b; break;
            case TOKEN_SLASH:
                if (b == 0.0) { fold = false; break; }
                numResult = a / b; break;
            case TOKEN_PERCENT:
                if (b == 0.0) { fold = false; break; }
                numResult = fmod(a, b); break;
            case TOKEN_AMPERSAND:     numResult = (double) (((int32_t) a) & ((int32_t) b)); break;
            case TOKEN_PIPE:          numResult = (double) (((int32_t) a) | ((int32_t) b)); break;
            case TOKEN_CARET:         numResult = (double) (((int32_t) a) ^ ((int32_t) b)); break;
            case TOKEN_LEFT_SHIFT:    numResult = (double) (int32_t) (((uint32_t) a) << ((uint32_t) b & 31)); break;
            case TOKEN_RIGHT_SHIFT:   numResult = (double) (int32_t) (((uint32_t) a) >> ((uint32_t) b & 31)); break;
            case TOKEN_GREATER:       isBool = true; boolResult = a > b;  break;
            case TOKEN_LESS:          isBool = true; boolResult = a < b;  break;
            case TOKEN_EQUAL_EQUAL:   isBool = true; boolResult = a == b; break;
            case TOKEN_BANG_EQUAL:    isBool = true; boolResult = a != b; break;
            case TOKEN_GREATER_EQUAL: isBool = true; boolResult = a >= b; break;
            case TOKEN_LESS_EQUAL:    isBool = true; boolResult = a <= b; break;
            default: fold = false; break;
        }

        // Folding constants
        if (fold) {
            // Retract both operands' bytecode and constant pool entries
            currentChunk()->count          = left.chunkSizeBefore;
            currentChunk()->constants.count = left.constPoolBefore;

            if (isBool) {
                lastExpr.chunkSizeBefore  = currentChunk()->count;
                lastExpr.constPoolBefore  = currentChunk()->constants.count;
                emitByte(boolResult ? OP_TRUE : OP_FALSE);
                lastExpr.isConst = true;
                lastExpr.value   = BOOL_VAL(boolResult);
            } else {
                Value folded = NUMBER_VAL(numResult);
                lastExpr.chunkSizeBefore  = currentChunk()->count;
                lastExpr.constPoolBefore  = currentChunk()->constants.count;
                emitConstant(folded);
                lastExpr.isConst = true;
                lastExpr.value   = folded;
            }
            return;
        }
    }

    lastExpr.isConst = false;
#endif

    switch (operatorType) {
        case TOKEN_BANG_EQUAL:    emitWord(OP_EQUAL, OP_NOT); break;
        case TOKEN_EQUAL_EQUAL:   emitByte(OP_EQUAL); break;
        case TOKEN_GREATER:       emitByte(OP_GREATER); break;
        case TOKEN_GREATER_EQUAL: emitWord(OP_LESS, OP_NOT); break;
        case TOKEN_LESS:          emitByte(OP_LESS); break;
        case TOKEN_LESS_EQUAL:    emitWord(OP_GREATER, OP_NOT); break;
        case TOKEN_PLUS:          emitByte(OP_ADD); break;
        case TOKEN_MINUS:         emitByte(OP_SUBTRACT); break;
        case TOKEN_STAR:          emitByte(OP_MULTIPLY); break;
        case TOKEN_SLASH:         emitByte(OP_DIVIDE); break;
        case TOKEN_PERCENT:       emitByte(OP_MODULUS); break;
        case TOKEN_AMPERSAND:     emitByte(OP_BITAND); break;
        case TOKEN_PIPE:          emitByte(OP_BITOR); break;
        case TOKEN_CARET:         emitByte(OP_BITXOR); break;
        case TOKEN_LEFT_SHIFT:    emitByte(OP_BITLEFT); break;
        case TOKEN_RIGHT_SHIFT:   emitByte(OP_BITRIGHT); break;
        default: return;
    }
}

/**
 * Calling a value. Comes from the '(' token
 * Parses the argument list and emits a call opcode.
 */
static void call(bool canAssign) {
    uint8_t argCount = argumentList();
    emitWord(OP_CALL, argCount);
}

static int identifierConstant(Token*);
static void emitGet(int, uint8_t, bool);

/**
 * Parses a dot expression which is either a get property or set property.
 * Invoke optimization is also applied here.
 */
static void dot(bool canAssign) {
    consume(TOKEN_IDENTIFIER, "Expect property name after '.'.");

    int name = identifierConstant(&parser.previous);

    if (canAssign && match(TOKEN_EQUAL)) {
        expression();
        if (name < 256) emitSet(name, OP_SET_PROPERTY, false);
        else emitSet(name, OP_SET_PROPERTY_LONG, true);
    } else if (match(TOKEN_LEFT_PAREN)) {
        uint8_t argCount = argumentList();
        if (name < 256) emitGet(name, OP_INVOKE, false);
        else emitGet(name, OP_INVOKE_LONG, true);
        emitByte(argCount);
    } else {
        if (name < 256) emitGet(name, OP_GET_PROPERTY, false);
        else emitGet(name, OP_GET_PROPERTY_LONG, true);
    }
}

/**
 * Parses an index expression.
 */
static void index_(bool canAssign) {
    expression();
    consume(TOKEN_RIGHT_BRACKET, "Expect ']' after index");

    if (canAssign) {
        if (match(TOKEN_EQUAL)) { 
            // A flat set index
            expression();   // value to assign
            emitByte(OP_SET_INDEX);
        } else if (match(TOKEN_PLUS_EQUAL)) { // +=
            emitByte(OP_DUP2);      // Reserve stack values for later set operation
            emitByte(OP_GET_INDEX); // Gets the value
            expression();           // Parses the expression
            emitByte(OP_ADD);       // Add the values together
            emitByte(OP_SET_INDEX); // Sets it using the earlier duplicated values
        } else if (match(TOKEN_MINUS_EQUAL)) { // -=
            emitByte(OP_DUP2);
            emitByte(OP_GET_INDEX);
            expression();
            emitByte(OP_SUBTRACT);
            emitByte(OP_SET_INDEX);
        } else if (match(TOKEN_STAR_EQUAL)) { // *=
            emitByte(OP_DUP2);
            emitByte(OP_GET_INDEX);
            expression();
            emitByte(OP_MULTIPLY);
            emitByte(OP_SET_INDEX);
        } else if (match(TOKEN_SLASH_EQUAL)) { // /=
            emitByte(OP_DUP2);
            emitByte(OP_GET_INDEX);
            expression();
            emitByte(OP_DIVIDE);
            emitByte(OP_SET_INDEX);
        } else if (match(TOKEN_PERCENT_EQUAL)) { // %=
            emitByte(OP_DUP2);
            emitByte(OP_GET_INDEX);
            expression();
            emitByte(OP_MODULUS);
            emitByte(OP_SET_INDEX);
        } else {  
            // Else case if nothing is being assigned or mutated
            emitByte(OP_GET_INDEX);
        }
    } else {
        emitByte(OP_GET_INDEX);
    }
}

/**
 * Parses a literal expression and potentially starts a constant folding chain
 */
static void literal(bool canAssign) {
    switch (parser.previous.type) {
        case TOKEN_FALSE:
#ifdef CONSTANT_OPTIMIZATIONS
            lastExpr.chunkSizeBefore = currentChunk()->count;
            lastExpr.constPoolBefore = currentChunk()->constants.count;
            lastExpr.isConst = true;
            lastExpr.value   = BOOL_VAL(false);
#endif
            emitByte(OP_FALSE);
            break;
        case TOKEN_TRUE:
#ifdef CONSTANT_OPTIMIZATIONS
            lastExpr.chunkSizeBefore = currentChunk()->count;
            lastExpr.constPoolBefore = currentChunk()->constants.count;
            lastExpr.isConst = true;
            lastExpr.value   = BOOL_VAL(true);
#endif
            emitByte(OP_TRUE);
            break;
        case TOKEN_NULL:
#ifdef CONSTANT_OPTIMIZATIONS
            lastExpr.isConst = false;
#endif
            emitByte(OP_NULL);
            break;
        default: return;
    }
}

/**
 * Parses a grouping expression, e.g. (1+5)
 */
static void grouping(bool canAssign) {
    expression();
    consume(TOKEN_RIGHT_PAREN, "Expect ')' after expression.");
}

/**
 * Parses a number literl. Potentially starts a constant folding chain.
 */
static void number(bool canAssign) {
    double value = strtod(parser.previous.start, NULL);

#ifdef CONSTANT_OPTIMIZATIONS
    lastExpr.chunkSizeBefore = currentChunk()->count;
    lastExpr.constPoolBefore = currentChunk()->constants.count;
    lastExpr.isConst = true;
    lastExpr.value   = NUMBER_VAL(value);
#endif

    emitConstant(NUMBER_VAL(value));
}

/**
 * Parses an or expression.
 */
static void or_(bool canAssign) {
    // These jumps are a pseudo-optimization that is expected in most languages.
    int elseJump = emitJump(OP_JUMP_IF_FALSE);
    int endJump = emitJump(OP_JUMP);

    patchJump(elseJump);
    emitByte(OP_POP);

    parsePrecedence(PREC_OR);
    patchJump(endJump);
}

/**
 * THE TERNARY OPERATOR
 * ?: ?: ?: ?: ?: ?: ?: ?: ?: ?: ?: ?:
 */
static void ternary(bool canAssign) {
    int elseJump = emitJump(OP_JUMP_IF_FALSE);
    emitByte(OP_POP);

    parsePrecedence(PREC_ASSIGNMENT);

    int endJump = emitJump(OP_JUMP);

    patchJump(elseJump);
    emitByte(OP_POP);

    consume(TOKEN_COLON, "Expect ':' after then branch of ternary operator.");

    parsePrecedence(PREC_TERNARY);
    
    patchJump(endJump);
}

static void and_(bool);

/**
 * Parses a string literal.
 */
static void string(bool canAssign) {
    emitConstant(OBJ_VAL(copyString(parser.previous.start, parser.previous.length)));
    free(parser.previous.start);
}

static void emitGet(int arg, uint8_t instruction, bool longOp) {
    if (longOp) {
        emitDoubleWord(
            instruction,
            (uint8_t) ((arg)       & 0xff),
            (uint8_t) ((arg >> 8)  & 0xff),
            (uint8_t) ((arg >> 16) & 0xff)
        );
    } else {
        emitWord(instruction, (uint8_t) arg);
    }
}

static void emitSet(int arg, uint8_t instruction, bool longOp) {
    if (longOp) {
        emitDoubleWord(
            instruction,
            (uint8_t) ((arg)       & 0xff),
            (uint8_t) ((arg >> 8)  & 0xff),
            (uint8_t) ((arg >> 16) & 0xff)
        );
    } else {
        emitWord(instruction, (uint8_t) arg);
    }
}

static int resolveVariable(Token name, uint8_t* getOp, uint8_t* setOp, bool* longOp) {
    int arg = resolveLocal(current, &name);

    if (arg != -1) {
        if (arg <= UINT8_MAX) {
            *getOp = OP_GET_LOCAL;
            *setOp = OP_SET_LOCAL;
            *longOp = false;
        } else {
            *getOp = OP_GET_LOCAL_LONG;
            *setOp = OP_SET_LOCAL_LONG;
            *longOp = true;
        }
    } else if ((arg = resolveUpvalue(current, &name)) != -1) {
        *getOp = OP_GET_UPVALUE;
        *setOp = OP_SET_UPVALUE;
        *longOp = false;
    } else {
        arg = identifierConstant(&name);
        if (arg <= UINT8_MAX) {
            *getOp = OP_GET_GLOBAL;
            *setOp = OP_SET_GLOBAL;
            *longOp = false;
        } else {
            *getOp = OP_GET_GLOBAL_LONG;
            *setOp = OP_SET_GLOBAL_LONG;
            *longOp = true;
        }
    }

    return arg;
}

static void preInc(bool canAssign) {
    consume(TOKEN_IDENTIFIER, "Expect identifier after '++'.");
    Token name = parser.previous;

    uint8_t getOp, setOp;
    bool longOp;

    int arg = resolveVariable(name, &getOp, &setOp, &longOp);

    emitGet(arg, getOp, longOp);
    emitConstant(NUMBER_VAL(1));
    emitByte(OP_ADD);
    emitSet(arg, setOp, longOp);
}

static void preDec(bool canAssign) {
    consume(TOKEN_IDENTIFIER, "Expect identifier after '--'.");
    Token name = parser.previous;

    uint8_t getOp, setOp;
    bool longOp;

    int arg = resolveVariable(name, &getOp, &setOp, &longOp);

    emitGet(arg, getOp, longOp);
    emitConstant(NUMBER_VAL(1));
    emitByte(OP_SUBTRACT);
    emitSet(arg, setOp, longOp);
}

static void namedVariable(Token name, bool canAssign) {
    uint8_t getOp, setOp;
    bool longOp;
    int arg = resolveVariable(name, &getOp, &setOp, &longOp);

#ifdef CONSTANT_OPTIMIZATIONS
    // --- const propagation ---
    if ((getOp == OP_GET_GLOBAL || getOp == OP_GET_GLOBAL_LONG) && !canAssign) {
        ObjString* nameStr = copyString(name.start, name.length);
        Value constVal;
        if (tableGet(&compileTimeConsts, nameStr, &constVal)) {
            lastExpr.chunkSizeBefore  = currentChunk()->count;
            lastExpr.constPoolBefore  = currentChunk()->constants.count;
            emitConstant(constVal);
            lastExpr.isConst = true;
            lastExpr.value   = constVal;
            return;
        }
    }
    // --- end propagation ---

    lastExpr.isConst = false;
#endif

    if (match(TOKEN_PLUS_PLUS)) {
        emitGet(arg, getOp, longOp);
        emitGet(arg, getOp, longOp);
        emitConstant(NUMBER_VAL(1));
        emitByte(OP_ADD);
        emitSet(arg, setOp, longOp);
        emitByte(OP_POP);

        return;
    } if (match(TOKEN_MINUS_MINUS)) {
        emitGet(arg, getOp, longOp);
        emitGet(arg, getOp, longOp);
        emitConstant(NUMBER_VAL(1));
        emitByte(OP_SUBTRACT);
        emitSet(arg, setOp, longOp);
        emitByte(OP_POP);

        return;
    }

    if (canAssign) {
        if (match(TOKEN_EQUAL)) {
            expression();
            emitSet(arg, setOp, longOp);
        } else if (match(TOKEN_PLUS_EQUAL)) {
            emitGet(arg, getOp, longOp);
            expression();
            emitByte(OP_ADD);
            emitSet(arg, setOp, longOp);
        } else if (match(TOKEN_MINUS_EQUAL)) {
            emitGet(arg, getOp, longOp);
            expression();
            emitByte(OP_SUBTRACT);
            emitSet(arg, setOp, longOp);
        } else if (match(TOKEN_STAR_EQUAL)) {
            emitGet(arg, getOp, longOp);
            expression();
            emitByte(OP_MULTIPLY);
            emitSet(arg, setOp, longOp);
        } else if (match(TOKEN_SLASH_EQUAL)) {
            emitGet(arg, getOp, longOp);
            expression();
            emitByte(OP_DIVIDE);
            emitSet(arg, setOp, longOp);
        } else if (match(TOKEN_PERCENT_EQUAL)) {
            emitGet(arg, getOp, longOp);
            expression();
            emitByte(OP_MODULUS);
            emitSet(arg, setOp, longOp);
        } else {
            emitGet(arg, getOp, longOp);
        }
    } else {
        emitGet(arg, getOp, longOp);
    }
}

static void variable(bool canAssign) {
    namedVariable(parser.previous, canAssign);
}

static Token syntheticToken(const char* text) {
    Token token;
    token.start = text;
    token.length = (int) strlen(text);
    return token;
}

static void super_(bool canAssign) {
    if (currentClass == NULL) {
        error("Cannot use 'super' outside a class.");
    } else if (!currentClass->hasSuperclass) {
        error("Cannot use 'super' in a class with no superclass.");
    }

    consume(TOKEN_DOT, "Expect '.' after 'super'.");
    consume(TOKEN_IDENTIFIER, "Expect superclass method name.");

    int name = identifierConstant(&parser.previous);

    namedVariable(syntheticToken("this"), false);
    if (match(TOKEN_LEFT_PAREN)) {
        uint8_t argCount = argumentList();
        namedVariable(syntheticToken("super"), false);
        if (name < 256) {
            emitGet(name, OP_SUPER_INVOKE, false);
        } else {
            emitGet(name, OP_SUPER_INVOKE_LONG, true);
        }
        emitByte(argCount);
    } else {
        namedVariable(syntheticToken("super"), false);

        if (name < 256) {
            emitGet(name, OP_GET_SUPER, false);
        } else {
            emitGet(name, OP_GET_SUPER_LONG, true);
        }
    }
}

static void this_(bool canAssign) {
    if (currentClass == NULL) {
        error("Cannot use 'this' outside a class.");
        return;
    }

    variable(false);
}

static void unary(bool canAssign) {
    TokenType operatorType = parser.previous.type;

#ifdef CONSTANT_OPTIMIZATIONS
    lastExpr.isConst = false;
#endif

    parsePrecedence(PREC_UNARY);

#ifdef CONSTANT_OPTIMIZATIONS
    if (lastExpr.isConst && IS_NUMBER(lastExpr.value)) {
        if (operatorType == TOKEN_MINUS) {
            currentChunk()->count           = lastExpr.chunkSizeBefore;
            currentChunk()->constants.count = lastExpr.constPoolBefore;
            Value folded = NUMBER_VAL(-AS_NUMBER(lastExpr.value));
            lastExpr.chunkSizeBefore  = currentChunk()->count;
            lastExpr.constPoolBefore  = currentChunk()->constants.count;
            emitConstant(folded);
            lastExpr.isConst = true;
            lastExpr.value   = folded;
            return;
        } else if (operatorType == TOKEN_TILDE) {
            currentChunk()->count           = lastExpr.chunkSizeBefore;
            currentChunk()->constants.count = lastExpr.constPoolBefore;
            Value folded = NUMBER_VAL((double)(~(int32_t)AS_NUMBER(lastExpr.value)));
            lastExpr.chunkSizeBefore  = currentChunk()->count;
            lastExpr.constPoolBefore  = currentChunk()->constants.count;
            emitConstant(folded);
            lastExpr.isConst = true;
            lastExpr.value   = folded;
            return;
        }
    }
    lastExpr.isConst = false;
#endif

    switch (operatorType) {
        case TOKEN_BANG:  emitByte(OP_NOT);    break;
        case TOKEN_MINUS: emitByte(OP_NEGATE); break;
        case TOKEN_TILDE: emitByte(OP_BITNOT); break;
        default: return;
    }
}

ParseRule rules[] = {
    [TOKEN_LEFT_PAREN]    = {grouping, call,    PREC_CALL},
    [TOKEN_RIGHT_PAREN]   = {NULL,     NULL,    PREC_NONE},
    [TOKEN_LEFT_BRACKET]  = {NULL,     index_,  PREC_CALL},
    [TOKEN_RIGHT_BRACKET] = {NULL,     NULL,    PREC_NONE},
    [TOKEN_LEFT_BRACE]    = {arrLit,   NULL,    PREC_NONE},
    [TOKEN_RIGHT_BRACE]   = {NULL,     NULL,    PREC_NONE},
    [TOKEN_COLON]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_COMMA]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_DOT]           = {NULL,     dot,     PREC_CALL},
    [TOKEN_MINUS]         = {unary,    binary,  PREC_TERM},
    [TOKEN_MINUS_MINUS]   = {preDec,   NULL,    PREC_CALL},
    [TOKEN_PLUS]          = {NULL,     binary,  PREC_TERM},
    [TOKEN_PLUS_PLUS]     = {preInc,   NULL,    PREC_CALL},
    [TOKEN_PERCENT]       = {NULL,     binary,  PREC_FACTOR},
    [TOKEN_SEMICOLON]     = {NULL,     NULL,    PREC_NONE},
    [TOKEN_AMPERSAND]     = {NULL,     binary,  PREC_BITWISE_AND},
    [TOKEN_PIPE]          = {NULL,     binary,  PREC_BITWISE_OR},
    [TOKEN_CARET]         = {NULL,     binary,  PREC_BITWISE_XOR},
    [TOKEN_TILDE]         = {unary,    NULL,    PREC_UNARY},
    [TOKEN_LEFT_SHIFT]    = {NULL,     binary,  PREC_BITWISE_SHIFT},
    [TOKEN_RIGHT_SHIFT]   = {NULL,     binary,  PREC_BITWISE_SHIFT},
    [TOKEN_SLASH]         = {NULL,     binary,  PREC_FACTOR},
    [TOKEN_STAR]          = {NULL,     binary,  PREC_FACTOR},
    [TOKEN_BANG]          = {unary,    NULL,    PREC_NONE},
    [TOKEN_BANG_EQUAL]    = {NULL,     binary,  PREC_EQUALITY},
    [TOKEN_EQUAL]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_EQUAL_EQUAL]   = {NULL,     binary,  PREC_EQUALITY},
    [TOKEN_GREATER]       = {NULL,     binary,  PREC_COMPARISON},
    [TOKEN_GREATER_EQUAL] = {NULL,     binary,  PREC_COMPARISON},
    [TOKEN_LESS]          = {NULL,     binary,  PREC_COMPARISON},
    [TOKEN_LESS_EQUAL]    = {NULL,     binary,  PREC_COMPARISON},
    [TOKEN_IDENTIFIER]    = {variable, NULL,    PREC_NONE},
    [TOKEN_STRING]        = {string,   NULL,    PREC_NONE},
    [TOKEN_NUMBER]        = {number,   NULL,    PREC_NONE},
    [TOKEN_AND]           = {NULL,     and_,    PREC_AND},
    [TOKEN_BREAK]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_CASE]          = {NULL,     NULL,    PREC_NONE},
    [TOKEN_CATCH]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_CLASS]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_CONST]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_CONTINUE]      = {NULL,     NULL,    PREC_NONE},
    [TOKEN_DEFAULT]       = {NULL,     NULL,    PREC_NONE},
    [TOKEN_ELSE]          = {NULL,     NULL,    PREC_NONE},
    [TOKEN_FALSE]         = {literal,  NULL,    PREC_NONE},
    [TOKEN_FOR]           = {NULL,     NULL,    PREC_NONE},
    [TOKEN_FN]            = {NULL,     NULL,    PREC_NONE},
    [TOKEN_IF]            = {NULL,     NULL,    PREC_NONE},
    [TOKEN_NULL]          = {literal,  NULL,    PREC_NONE},
    [TOKEN_OR]            = {NULL,     or_,     PREC_OR},
    [TOKEN_PRINT]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_QUESTION]      = {NULL,     ternary, PREC_TERNARY},
    [TOKEN_RETURN]        = {NULL,     NULL,    PREC_NONE},
    [TOKEN_SUPER]         = {super_,   NULL,    PREC_NONE},
    [TOKEN_TRY]           = {NULL,     NULL,    PREC_NONE},
    [TOKEN_SWITCH]        = {NULL,     NULL,    PREC_NONE},
    [TOKEN_THIS]          = {this_,    NULL,    PREC_NONE},
    [TOKEN_TRUE]          = {literal,  NULL,    PREC_NONE},
    [TOKEN_DECL]          = {NULL,     NULL,    PREC_NONE},
    [TOKEN_WHILE]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_ERROR]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_EOF]           = {NULL,     NULL,    PREC_NONE},
};

static void parsePrecedence(Precedence precedence) {
    advance();
    ParseFn prefixRule = getRule(parser.previous.type)->prefix;
    if (prefixRule == NULL) {
        error("Expect expression.");
        return;
    }

    bool canAssign = precedence <= PREC_ASSIGNMENT;
    prefixRule(canAssign);

    while (precedence <= getRule(parser.current.type)->precedence) {
        advance();
        ParseFn infixRule = getRule(parser.previous.type)->infix;

        infixRule(canAssign);
    }

    if (canAssign && match(TOKEN_EQUAL)) {
        error("Invalid assignment target.");
    }
}

static int identifierConstant(Token* name) {
    return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
}

static bool identifiersEqual(Token* a, Token* b) {
    if (a->length != b->length) return false;
    return memcmp(a->start, b->start, a->length) == 0;
}

static int resolveLocal(Compiler* compiler, Token* name) {
    for (int i = compiler->localCount - 1; i >= 0; i--) {
        Local* local = &compiler->locals[i];
        if (identifiersEqual(name, &local->name)) {
            if (local->depth == -1) {
                error("Cannot read local variable in own initializer.");
            }

            return i;
        }
    }

    return -1;
}

static int addUpvalue(Compiler* compiler, uint8_t index, bool isLocal) {
    int upvalueCount = compiler->function->upvalueCount;

    for (int i = 0; i < upvalueCount; i++) {
        Upvalue* upvalue = &compiler->upvalues[i];
        if (upvalue->index == index && upvalue->isLocal == isLocal) {
            return i;
        }
    }

    if (upvalueCount == UINT8_COUNT) {
        error("Too many closure variables in function.");
        return 0;
    }

    compiler->upvalues[upvalueCount].isLocal = isLocal;
    compiler->upvalues[upvalueCount].index = index;
    return compiler->function->upvalueCount++;
}

static int resolveUpvalue(Compiler* compiler, Token* name) {
    if (compiler->enclosing == NULL) return -1;

    int local = resolveLocal(compiler->enclosing, name);
    if (local != -1) {
        if (local >= 256) {
            error("Cannot capture local variable beyond slot 255.");
            return 0;
        }

        compiler->enclosing->locals[local].isCaptured = true;
        return addUpvalue(compiler, (uint8_t) local, true);
    }

    int upvalue = resolveUpvalue(compiler->enclosing, name);
    if (upvalue != -1) {
        return addUpvalue(compiler, (uint8_t) upvalue, false);
    }

    return -1;
}

static void addLocal(Token name) {
    if (current->localCount >= ARB_COUNT) {
        error("Too many local variables currently in scope.");
        return;
    }

    Local* local = &current->locals[current->localCount++];
    local->name = name;
    local->depth = -1;
    local->isCaptured = false;
}

static void declareVariable() {
    if (current->scopeDepth == 0) return;

    Token* name = &parser.previous;

    for (int i = current->localCount - 1; i >= 0; i--) {
        Local* local = &current->locals[i];
        if (local->depth != -1 && local->depth < current->scopeDepth) {
            break;
        }

        if (identifiersEqual(name, &local->name)) {
            error("Already a variable with this name in this scope.");
        }
    }

    addLocal(*name);
}

static int parseVariable(const char* errorMessage) {
    consume(TOKEN_IDENTIFIER, errorMessage);

    declareVariable();
    if (current->scopeDepth > 0) return 0;

    return identifierConstant(&parser.previous);
}

static void markInitialized() {
    if (current->scopeDepth == 0) return;

    current->locals[current->localCount - 1].depth = current->scopeDepth;
}

static void defineVariable(int global) {
    if (current->scopeDepth > 0) {
        markInitialized();
        return;
    }

    if (global <= UINT8_MAX) {
        emitWord(OP_DEFINE_GLOBAL, (uint8_t) global);
    } else {
        emitDoubleWord(
            OP_DEFINE_GLOBAL_LONG,
            (uint8_t) (global & 0xff),
            (uint8_t) ((global >> 8) & 0xff),
            (uint8_t) ((global >> 16) & 0xff)
        );
    }   
}

static uint8_t argumentList() {
    uint8_t argCount = 0;
    if (!check(TOKEN_RIGHT_PAREN)) {
        do {
            expression();
            if (argCount == 255) {
                error("Cannot have more than 255 arguments.");
            }
            argCount++;
        } while (match(TOKEN_COMMA));
    }
    consume(TOKEN_RIGHT_PAREN, "Expect ')' after arguments.");
    return argCount;
}

static void and_(bool canAssign) {
    int endJump = emitJump(OP_JUMP_IF_FALSE);

    emitByte(OP_POP);
    parsePrecedence(PREC_AND);

    patchJump(endJump);
}

static void defineConst(int global) {
    if (global <= UINT8_MAX) {
        emitWord(OP_DEFINE_CONST, (uint8_t) global);
    } else {
        emitDoubleWord(
            OP_DEFINE_CONST_LONG,
            (uint8_t) (global & 0xff),
            (uint8_t) ((global >> 8) & 0xff),
            (uint8_t) ((global >> 16) & 0xff)
        );
    }
}

static ParseRule* getRule(TokenType type) {
    return &rules[type];
}

static void expression() {
    parsePrecedence(PREC_ASSIGNMENT);
}

static void block() {
    while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
        declaration();
    }

    consume(TOKEN_RIGHT_BRACE, "Expect '}' after block.");
}

static void function(FunctionType type){
    Compiler* compiler = malloc(sizeof(Compiler));
    initCompiler(compiler, type);
    beginScope();

    consume(TOKEN_LEFT_PAREN, "Expect '(' after function name.");
    if (!check(TOKEN_RIGHT_PAREN)) {
        do {
            current->function->arity++;
            if (current->function->arity > 255) {
                errorAtCurrent("Cannot have more than 255 parameters.");
            }
            int constant = parseVariable("Expect parameter name.");
            defineVariable(constant);
        } while (match(TOKEN_COMMA));
    }
    consume(TOKEN_RIGHT_PAREN, "Expect ')' after function parameters.");
    consume(TOKEN_LEFT_BRACE, "Expect '{' before function body.");
    block();

    ObjFunction* function = endCompiler();
    int index = makeConstant(OBJ_VAL(function));
    if (index <= 255) {
        emitWord(OP_CLOSURE, (uint8_t) index);
    } else {
        emitDoubleWord(OP_CLOSURE_LONG,
            (uint8_t) ((index) & 0xff),
            (uint8_t) ((index >> 8) & 0xff),
            (uint8_t) ((index >> 16) & 0xff)
        );
    }

    for (int i = 0; i < function->upvalueCount; i++) {
        emitByte(compiler->upvalues[i].isLocal ? 1 : 0);
        emitByte(compiler->upvalues[i].index);
    }

    free(compiler);
}

static void method() {
    consume(TOKEN_IDENTIFIER, "Expect method name.");
    int constant = identifierConstant(&parser.previous);

    FunctionType type = TYPE_METHOD;
    if (parser.previous.length == 4 && memcmp(parser.previous.start, "init", 4) == 0) {
        type = TYPE_INITIALIZER;
    } 

    function(type);

    if (constant <= 255) {
        emitWord(OP_METHOD, (uint8_t) constant);
    } else {
        emitDoubleWord(OP_METHOD_LONG,
            (uint8_t) ((constant) & 0xff),
            (uint8_t) ((constant >> 8) & 0xff),
            (uint8_t) ((constant >> 16) & 0xff)
        );
    }
}

static void classDeclaration() {
    consume(TOKEN_IDENTIFIER, "Expect class name.");
    Token className = parser.previous;
    int nameConstant = identifierConstant(&parser.previous);
    declareVariable();

    if (nameConstant < 256) {
        emitWord(OP_CLASS, (uint8_t) nameConstant);
    } else {
        emitDoubleWord(OP_CLASS_LONG,
            (uint8_t) ((nameConstant) & 0xff),
            (uint8_t) ((nameConstant >> 8) & 0xff),
            (uint8_t) ((nameConstant >> 16) & 0xff)
        );
    }
    defineVariable(nameConstant);

    ClassCompiler classCompiler;
    classCompiler.hasSuperclass = false;
    classCompiler.enclosing = currentClass;
    currentClass = &classCompiler;

    if (match(TOKEN_COLON)) {
        consume(TOKEN_IDENTIFIER, "Expect superclass name.");
        variable(false);

        if (identifiersEqual(&className, &parser.previous)) {
            error("A class cannot inherit from itself.");
        }

        beginScope();
        addLocal(syntheticToken("super"));
        defineVariable(0);

        namedVariable(className, false);
        emitByte(OP_INHERIT);
        classCompiler.hasSuperclass = true;
    }

    namedVariable(className, false);
    consume(TOKEN_LEFT_BRACE, "Expect '{' before class body.");

    while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
        method();
    }

    consume(TOKEN_RIGHT_BRACE, "Expect '}' after class body.");
    emitByte(OP_POP);

    if (classCompiler.hasSuperclass) {
        endScope();
    }

    currentClass = currentClass->enclosing;
}

static void fnDeclaration() {
    int global = parseVariable("Expect function name.");
    markInitialized();

    function(TYPE_FUNCTION);

    defineVariable(global);
}

static void varDeclaration() {
    int arraySize = -1;
    bool hasArraySize = false;

    int global = parseVariable("Expect variable name.");

    if (match(TOKEN_EQUAL)) {
        expression();
    } else {
        emitByte(OP_NULL);
    }
    consume(TOKEN_SEMICOLON, "Expect ';' after variable declaration.");

    defineVariable(global);
}

static void constDefinition() {
    if (current->scopeDepth > 0) {
        error("Constants must be top-level.");
    }

    int global = parseVariable("Expect variable name.");

#ifdef CONSTANT_OPTIMIZATIONS
    Token nameTok = parser.previous; // capture here — consume() below will overwrite previous
#endif

    consume(TOKEN_EQUAL, "Constants must be defined at declaration.");
#ifdef CONSTANT_OPTIMIZATIONS
    lastExpr.isConst = false;
#endif
    expression();
    consume(TOKEN_SEMICOLON, "Expect ';' after constant declaration.");

#ifdef CONSTANT_OPTIMIZATIONS
    if (lastExpr.isConst) {
        // push to keep GC-safe while copyString might allocate
        push(lastExpr.value);
        ObjString* nameStr = copyString(nameTok.start, nameTok.length);
        tableSet(&compileTimeConsts, nameStr, lastExpr.value);
        pop();
    }
#endif

    defineConst(global); // still emit OP_DEFINE_CONST for runtime mutation checks
}

static void expressionStatement() {
    expression();
    consume(TOKEN_SEMICOLON, "Expect ';' after expression statement.");
    emitByte(OP_POP);
}

static void breakStatement() {
    if (currentLoop == NULL) {
        error("Cannot use 'break' outside a loop.");
    } 

    if (currentTryDepth > 0) {
        error("Cannot use 'break' inside a try block.");
    }
    
    if (currentLoop->breakCount == MAX_BREAKS) {
        error("Too many break statements in current loop.");
    }

    consume(TOKEN_SEMICOLON, "Expect ';' after 'break'.");

    for (int i = current->localCount - 1;
         i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
        emitByte(OP_POP);
    }

    int jump = emitJump(OP_JUMP);
    currentLoop->breakJumps[currentLoop->breakCount++] = jump;
}

static void continueStatement() {
    if (currentLoop == NULL) {
        error("Cannot use 'continue' outside of a loop.");
    }

    if (currentTryDepth > 0) {
        error("Cannot use 'continue' inside a try block.");
    }

    consume(TOKEN_SEMICOLON, "Expect ';' after 'continue'");

    for (int i = current->localCount - 1; 
         i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
        emitByte(OP_POP);
    }

    emitLoop(currentLoop->start);
}

static void forStatement() {
    beginScope();
    consume(TOKEN_LEFT_PAREN, "Expect '(' after 'for'.");

    if (match(TOKEN_SEMICOLON)) {
    } else if (match(TOKEN_DECL)) {
        varDeclaration();
    } else {
        expressionStatement();
    }

    Loop loop;
    loop.start = currentChunk()->count;
    loop.scopeDepth = current->scopeDepth;
    loop.breakCount = 0;

    Loop* enclosingLoop = currentLoop;
    currentLoop = &loop;

    int exitJump = -1;
    if (!match(TOKEN_SEMICOLON)) {
        expression();
        consume(TOKEN_SEMICOLON, "Expect ';' after loop condition.");

        exitJump = emitJump(OP_JUMP_IF_FALSE);
        emitByte(OP_POP);
    }

    if (!match(TOKEN_RIGHT_PAREN)) {
        int bodyJump = emitJump(OP_JUMP);
        int incrementStart = currentChunk()->count;
        expression();
        emitByte(OP_POP);
        consume(TOKEN_RIGHT_PAREN, "Expect ')' after for clauses.");

        emitLoop(currentLoop->start);
        currentLoop->start = incrementStart;
        patchJump(bodyJump);
    }

    statement();
    emitLoop(currentLoop->start);

    if (exitJump != -1) {
        patchJump(exitJump);
        emitByte(OP_POP);
    }

    for (int i = 0; i < currentLoop->breakCount; i++) {
        patchJump(currentLoop->breakJumps[i]);
    }

    currentLoop = enclosingLoop;

    endScope();
}

static void ifStatement() {
    consume(TOKEN_LEFT_PAREN, "Expect '(' after 'if'.");
    expression();
    consume(TOKEN_RIGHT_PAREN, "Expect ')' after if statement condition.");

    int thenJump = emitJump(OP_JUMP_IF_FALSE);
    emitByte(OP_POP);
    statement();

    int elseJump = emitJump(OP_JUMP);

    patchJump(thenJump);
    emitByte(OP_POP);

    if (match(TOKEN_ELSE)) statement();
    patchJump(elseJump);
}

static void printStatement() {
    consume(TOKEN_LEFT_PAREN, "Expect left parentheses after 'print'.");

    uint8_t argCount = 0;

    do {
        expression();
        if (argCount == 255) {
            errorAtCurrent("Can only have 255 arguments.");
        }
        argCount++;
    } while (match(TOKEN_COMMA));

    consume(TOKEN_RIGHT_PAREN, "Expect right parentheses after arguments.");
    consume(TOKEN_SEMICOLON, "Expect ';' after print.");

    emitWord(OP_PRINT, argCount);
}

static void returnStatement() {
    if (current->type == TYPE_SCRIPT) {
        error("Cannot return from top-level code.");
    }

    for (int i = 0; i < currentTryDepth; i++) {
        emitByte(OP_END_TRY);
    }

    if (match(TOKEN_SEMICOLON)) {
        emitReturn();
    } else {
        if (current->type == TYPE_INITIALIZER) {
            error("Cannot return value from an initializer.");
        }

        expression();
        consume(TOKEN_SEMICOLON, "Expect ';' after return value.");
        emitByte(OP_RETURN);
    }
}

static void switchStatement() {
    consume(TOKEN_LEFT_PAREN, "Expect '(' after 'switch'.");
    expression();
    consume(TOKEN_RIGHT_PAREN, "Expect ')' after value.");
    consume(TOKEN_LEFT_BRACE, "Expect '{' before switch cases.");

    int state = 0; // 0: before all cases, 1: before default, 2: after default.
    int caseEnds[MAX_CASES];
    int caseCount = 0;
    int previousCaseSkip = -1;

    while (!match(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
        if (match(TOKEN_CASE) || match(TOKEN_DEFAULT)) {
            TokenType caseType = parser.previous.type;

            if (state == 2) {
                error("Can't have another case or default after the default case.");
            }

            if (state == 1) {
                // At the end of the previous case, jump over the others.
                caseEnds[caseCount++] = emitJump(OP_JUMP);

                // Patch its condition to jump to the next case (this one).
                patchJump(previousCaseSkip);
                emitByte(OP_POP);
            }

            if (caseType == TOKEN_CASE) {
                state = 1;

                // See if the case is equal to the value.
                emitByte(OP_DUP);
                expression();

                consume(TOKEN_COLON, "Expect ':' after case value.");

                emitByte(OP_EQUAL);
                previousCaseSkip = emitJump(OP_JUMP_IF_FALSE);

                // Pop the comparison result.
                emitByte(OP_POP);
            } else {
                state = 2;
                consume(TOKEN_COLON, "Expect ':' after default.");
                previousCaseSkip = -1;
            }
        } else {
            if (state == 0) {
                error("Can't have statements before any case.");
            }
            statement();
        }
    }

    if (state == 1) {
        patchJump(previousCaseSkip);
        emitByte(OP_POP);
    }

    for (int i = 0; i < caseCount; i++) {
        patchJump(caseEnds[i]);
    }

    emitByte(OP_POP);
}

static void tryStatement() {
    int errorJump = emitJump(OP_TRY);
    currentTryDepth++;

    statement();

    emitByte(OP_END_TRY);
    int successJump = emitJump(OP_JUMP);
    consume(TOKEN_CATCH, "Expect 'catch' after try.");
    consume(TOKEN_LEFT_PAREN, "Expect '(' after 'catch'.");
    consume(TOKEN_IDENTIFIER, "Expect variable name.");

    beginScope();
    patchJump(errorJump);
    addLocal(parser.previous);
    markInitialized();

    consume(TOKEN_RIGHT_PAREN, "Expect ')' after variable name.");

    statement();
    endScope();

    currentTryDepth--;
    patchJump(successJump);
}

static void whileStatement() {
    Loop loop;
    loop.start = currentChunk()->count;
    loop.scopeDepth = current->scopeDepth;
    loop.breakCount = 0;

    Loop* enclosingLoop = currentLoop;
    currentLoop = &loop;

    consume(TOKEN_LEFT_PAREN, "Expect '(' after 'while'.");
    expression();
    consume(TOKEN_RIGHT_PAREN, "Expect ')' after loop condition.");

    int exitJump = emitJump(OP_JUMP_IF_FALSE);
    emitByte(OP_POP);
    statement();
    emitLoop(currentLoop->start);

    patchJump(exitJump);
    emitByte(OP_POP);

    for (int i = 0; i < currentLoop->breakCount; i++) {
        patchJump(currentLoop->breakJumps[i]);
    }

    currentLoop = enclosingLoop;
}

static void synchronize() {
    parser.panicMode = false;

    while (parser.current.type != TOKEN_EOF) {
        if (parser.previous.type == TOKEN_SEMICOLON) return;
        switch(parser.current.type) {
            case TOKEN_CLASS:
            case TOKEN_CONST:
            case TOKEN_FN:
            case TOKEN_DECL:
            case TOKEN_FOR:
            case TOKEN_IF:
            case TOKEN_WHILE:
            case TOKEN_PRINT:
            case TOKEN_RETURN:
            case TOKEN_TRY:
                return;

            default:
                ;
        }

        advance();
    }
}

static void declaration() {
    if (match(TOKEN_CLASS)) {
        classDeclaration();
    } else if (match(TOKEN_FN)) {
        fnDeclaration();
    } else if (match(TOKEN_DECL)) {
        varDeclaration();
    } else if (match(TOKEN_CONST)) {
        constDefinition();
    } else {
        statement();
    }

    if (parser.panicMode) synchronize();
}

static void statement() {
    if (match(TOKEN_PRINT)) {
        printStatement();
    } else if (match(TOKEN_BREAK)) {
        breakStatement();
    } else if (match(TOKEN_CONTINUE)) {
        continueStatement();
    } else if (match(TOKEN_FOR)) {
        forStatement();
    } else if (match(TOKEN_IF)) {
        ifStatement();
    } else if (match(TOKEN_RETURN)) {
        returnStatement();
    } else if (match(TOKEN_SWITCH)) {
        switchStatement();
    } else if (match(TOKEN_TRY)) {
        tryStatement();
    } else if (match(TOKEN_WHILE)) {
        whileStatement();
    } else if (match(TOKEN_LEFT_BRACE)) {
        beginScope();
        block();
        endScope();
    } else {
        expressionStatement();
    }
}

ObjFunction* compile(const char* source) {
    initScanner(source);
    currentTryDepth = 0;
    Compiler* compiler = malloc(sizeof(Compiler));
    initCompiler(compiler, TYPE_SCRIPT);
    initTable(&compileTimeConsts);

    parser.hadError = false;
    parser.panicMode = false;
    parser.source = source;

    advance();
    
    while (!match(TOKEN_EOF)) {
        declaration();
    }

    ObjFunction* function = endCompiler();
    freeTable(&compileTimeConsts);

    if (parser.hadError) {
        free(compiler);
        return NULL;
    } else {
        return function;
    }
}

void markCompilerRoots() {
    Compiler* compiler = current;
    while (compiler != NULL) {
        markObject((Obj*) compiler->function);
        compiler = compiler->enclosing;
    }
#ifdef CONSTANT_OPTIMIZATIONS
    markTable(&compileTimeConsts);
#endif
}