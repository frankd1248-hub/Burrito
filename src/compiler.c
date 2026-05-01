#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "common.h"
#include "compiler.h"
#include "memory.h"
#include "scanner.h"

#ifdef DEBUG_PRINT_CODE
#include "debug.h"
#endif

#define MAX_CASES 256
#define MAX_BREAKS 256

typedef struct {
    Token current;
    Token previous;
    bool hadError;
    bool panicMode;
} Parser;

typedef enum {
    PREC_NONE,
    PREC_ASSIGNMENT,  // =
    PREC_TERNARY,     // ?
    PREC_OR,          // OR
    PREC_AND,         // AND
    PREC_EQUALITY,    // == !=
    PREC_COMPARISON,  // < > <= >=
    PREC_TERM,        // + -
    PREC_FACTOR,      // * /
    PREC_UNARY,       // ! -
    PREC_CALL,        // . () ++ --
    PREC_PRIMARY
} Precedence;

typedef void (*ParseFn) (bool canAssign);

typedef struct {
    ParseFn prefix;
    ParseFn infix;
    Precedence precedence;
} ParseRule;

typedef struct {
    Token name;
    int depth;
    bool isCaptured;
} Local;

typedef struct {
    uint8_t index;
    bool isLocal;
} Upvalue;

typedef enum {
    TYPE_FUNCTION,
    TYPE_SCRIPT
} FunctionType;

typedef struct {
    int start;
    int scopeDepth;

    int breakJumps[MAX_BREAKS];
    int breakCount;
} Loop;

typedef struct Compiler {
    struct Compiler* enclosing;
    ObjFunction* function;
    FunctionType type;

    Local locals[ARB_COUNT];
    int localCount;
    Upvalue upvalues[UINT8_COUNT];
    int scopeDepth;
} Compiler;

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
Chunk* compilingChunk;

Loop* currentLoop = NULL;

static Chunk* currentChunk() {
    return &current->function->chunk;
}

static void errorAt(Token* token, const char* message) {
    if (parser.panicMode) return;
    parser.panicMode = true;
    fprintf(stderr, "[line %04d] Error", token->line);

    if (token->type == TOKEN_EOF) {
        fprintf(stderr, " at end");
    } else if (token->type == TOKEN_ERROR) {
    } else {
        fprintf(stderr, " at '%.*s'", token->length, token->start);
    }

    fprintf(stderr, ": %s\n", message);
    parser.hadError = true;
}

static void error(const char *message) {
    errorAt(&parser.previous, message);
}

static void errorAtCurrent(const char* message) {
    errorAt(&parser.current, message);
}

static void advance() {
    parser.previous = parser.current;

    for (;;) {
        parser.current = scanToken();
        if (parser.current.type != TOKEN_ERROR) break;

        errorAtCurrent(parser.current.start);
    }
}

static void consume(TokenType type, const char* message) {
    if (parser.current.type == type) {
        advance();
        return;
    }

    errorAtCurrent(message);
}

static bool check(TokenType type) {
    return parser.current.type == type;
}

static bool match(TokenType type) {
    if (!check(type)) return false;
    advance();
    return true;
}

static void emitByte(uint8_t byte) {
    writeChunk(currentChunk(), byte, parser.previous.line);
}

static void emitWord(uint8_t byte1, uint8_t byte2) {
    emitByte(byte1);
    emitByte(byte2);
}

static void emitDoubleWord(uint8_t byte1, uint8_t byte2, uint8_t byte3, uint8_t byte4) {
    emitByte(byte1);
    emitByte(byte2);
    emitByte(byte3);
    emitByte(byte4);
}

static void emitLoop(int loopStart) {
    emitByte(OP_LOOP);

    int offset = currentChunk()->count - loopStart + 2;
    if (offset > UINT16_MAX) error("Loop body too large.");

    emitWord((offset >> 8) & 0xff, offset & 0xff);
}

static int emitJump(uint8_t instruction) {
    emitByte(instruction);
    emitByte(0xff);
    emitByte(0xff);
    return currentChunk()->count - 2;
}

static void emitReturn() {
    emitByte(OP_NULL);
    emitByte(OP_RETURN);
}

static int makeConstant(Value value) {
    return addConstant(currentChunk(), value);
}

static void emitConstant(Value value) {
    writeConstant(currentChunk(), value, parser.previous.line);
}

static void patchJump(int offset) {
    int jump = currentChunk()->count - offset - 2;

    if (jump > UINT16_MAX) {
        error("Too much code to jump over.");
    }

    currentChunk()->code[offset] = (jump >> 8) & 0xff;
    currentChunk()->code[offset + 1] = jump & 0xff;
}

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
    local->name.start = "";
    local->name.length = 0;
}

static ObjFunction* endCompiler() {
    emitReturn();
    ObjFunction* function = current->function;

#ifdef DEBUG_PRINT_CODE
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
#endif

    current = current->enclosing;
    return function;
}

static void beginScope() {
    current->scopeDepth++;
}

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

static void arrLit(bool canAssign) {
    int count = 0;

    if (!check(TOKEN_RIGHT_BRACE)) {
        do {
            expression();
            if (count == 0xffffff) {
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
            (uint8_t)(count & 0xff),
            (uint8_t)((count >> 8) & 0xff),
            (uint8_t)((count >> 16) & 0xff)
        );
    }
}

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
            case TOKEN_GREATER:       isBool = true; boolResult = a > b;  break;
            case TOKEN_LESS:          isBool = true; boolResult = a < b;  break;
            case TOKEN_EQUAL_EQUAL:   isBool = true; boolResult = a == b; break;
            case TOKEN_BANG_EQUAL:    isBool = true; boolResult = a != b; break;
            case TOKEN_GREATER_EQUAL: isBool = true; boolResult = a >= b; break;
            case TOKEN_LESS_EQUAL:    isBool = true; boolResult = a <= b; break;
            default: fold = false; break;
        }

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
        default: return;
    }
}

static void call(bool canAssign) {
    uint8_t argCount = argumentList();
    emitWord(OP_CALL, argCount);
}

static int identifierConstant(Token*);
static void emitGet(int, uint8_t, bool);

static void dot(bool canAssign) {
    consume(TOKEN_IDENTIFIER, "Expect property name after '.'.");

    int name = identifierConstant(&parser.previous);

    if (canAssign && match(TOKEN_EQUAL)) {
        // Wait for instances
    } else {
        if (name < 256)
            emitGet(name, OP_GET_PROPERTY, false);
        else
            emitGet(name, OP_GET_PROPERTY_LONG, true);
    }
}

static void index_(bool canAssign) {
    expression();
    consume(TOKEN_RIGHT_BRACKET, "Expect ']' after index");

    if (canAssign && match(TOKEN_EQUAL)) {
        expression();   // value to assign
        emitByte(OP_SET_INDEX);
    } else {
        emitByte(OP_GET_INDEX);
    }
}

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

static void grouping(bool canAssign) {
    expression();
    consume(TOKEN_RIGHT_PAREN, "Expect ')' after expression.");
}

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

static void or_(bool canAssign) {
    int elseJump = emitJump(OP_JUMP_IF_FALSE);
    int endJump = emitJump(OP_JUMP);

    patchJump(elseJump);
    emitByte(OP_POP);

    parsePrecedence(PREC_OR);
    patchJump(endJump);
}

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

static void string(bool canAssign) {
    emitConstant(OBJ_VAL(copyString(parser.previous.start + 1, parser.previous.length - 2)));
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
        emitConstant(NUMBER_VAL(1));
        emitByte(OP_ADD);
        emitSet(arg, setOp, longOp);

        return;
    } if (match(TOKEN_MINUS_MINUS)) {
        emitGet(arg, getOp, longOp);
        emitConstant(NUMBER_VAL(1));
        emitByte(OP_SUBTRACT);
        emitSet(arg, setOp, longOp);

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

static void unary(bool canAssign) {
    TokenType operatorType = parser.previous.type;

#ifdef CONSTANT_OPTIMIZATIONS
    lastExpr.isConst = false;
#endif

    parsePrecedence(PREC_UNARY);

#ifdef CONSTANT_OPTIMIZATIONS
    if (operatorType == TOKEN_MINUS &&
        lastExpr.isConst && IS_NUMBER(lastExpr.value)) {
        currentChunk()->count           = lastExpr.chunkSizeBefore;
        currentChunk()->constants.count = lastExpr.constPoolBefore;
        Value folded = NUMBER_VAL(-AS_NUMBER(lastExpr.value));
        lastExpr.chunkSizeBefore  = currentChunk()->count;
        lastExpr.constPoolBefore  = currentChunk()->constants.count;
        emitConstant(folded);
        lastExpr.isConst = true;
        lastExpr.value   = folded;
        return;
    }

    lastExpr.isConst = false;
#endif

    switch (operatorType) {
        case TOKEN_BANG:  emitByte(OP_NOT);    break;
        case TOKEN_MINUS: emitByte(OP_NEGATE); break;
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
    [TOKEN_SEMICOLON]     = {NULL,     NULL,    PREC_NONE},
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
    [TOKEN_SUPER]         = {NULL,     NULL,    PREC_NONE},
    [TOKEN_SWITCH]        = {NULL,     NULL,    PREC_NONE},
    [TOKEN_THIS]          = {NULL,     NULL,    PREC_NONE},
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
    if (local != -1 && local < 256) {
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

static void markUninitialized() {
    if (current->scopeDepth == 0) return;

    current->locals[current->localCount - 1].depth = current->scopeDepth;
}

static void defineVariable(int global) {
    if (current->scopeDepth > 0) {
        markUninitialized();
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
    }

    for (int i = 0; i < function->upvalueCount; i++) {
        emitByte(compiler->upvalues[i].isLocal ? 1 : 0);
        emitByte(compiler->upvalues[i].index);
    }

    free(compiler);
}

static void fnDeclaration() {
    int global = parseVariable("Expect function name.");
    markUninitialized();

    function(TYPE_FUNCTION);

    defineVariable(global);
}

static void varDeclaration() {
    int arraySize = -1;
    bool hasArraySize = false;

    int global = parseVariable("Expect variable name.");

    if (match(TOKEN_LEFT_BRACKET)) {
        expression();
        hasArraySize = true;
        consume(TOKEN_RIGHT_BRACKET, "Expect ']' after size.");
    }

    if (match(TOKEN_EQUAL)) {
        if (hasArraySize) emitByte(OP_POP);
        expression();
    } else {
        if (hasArraySize) {
            emitByte(OP_ARRAY_NEW);
        } else {
            emitByte(OP_NULL);
        }
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

static void importStatement() {
    consume(TOKEN_IDENTIFIER, "Expect module name after 'import'.");
    int idx = makeConstant(OBJ_VAL(copyString(parser.previous.start, parser.previous.length)));

    if (idx < 256) {
        emitWord(OP_IMPORT, (uint8_t) idx);
    } else {
        emitDoubleWord(OP_IMPORT_LONG,
            (uint8_t) (idx & 0xff),
            (uint8_t) ((idx >> 8) & 0xff),
            (uint8_t) ((idx >> 16) & 0xff)
        );
    }

    consume(TOKEN_SEMICOLON, "Expect ';' after import.");
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
        error("Can't return from top-level code.");
    }

    if (match(TOKEN_SEMICOLON)) {
        emitReturn();
    } else {
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
            case TOKEN_FN:
            case TOKEN_DECL:
            case TOKEN_FOR:
            case TOKEN_IF:
            case TOKEN_WHILE:
            case TOKEN_PRINT:
            case TOKEN_RETURN:
                return;

            default:
                ;
        }

        advance();
    }
}

static void declaration() {
    if (match(TOKEN_FN)) {
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
    } else if (match(TOKEN_IMPORT)) {
        importStatement();
    } else if (match(TOKEN_RETURN)) {
        returnStatement();
    } else if (match(TOKEN_SWITCH)) {
        switchStatement();
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
    Compiler* compiler = malloc(sizeof(Compiler));
    initCompiler(compiler, TYPE_SCRIPT);
#ifdef CONSTANT_OPTIMIZATIONS
    initTable(&compileTimeConsts);
#endif

    parser.hadError = false;
    parser.panicMode = false;

    advance();
    
    while (!match(TOKEN_EOF)) {
        declaration();
    }

    ObjFunction* function = endCompiler();
#ifdef CONSTANT_OPTIMIZATIONS
    freeTable(&compileTimeConsts);
#endif
    return parser.hadError ? NULL : function;
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