	.file	"debug.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"local"
.LC1:
	.string	"upvalue"
.LC2:
	.string	"%06d "
.LC3:
	.string	"     | "
.LC4:
	.string	"%6d "
.LC5:
	.string	"OP_CONSTANT"
.LC6:
	.string	"%-16s %4d '"
.LC7:
	.string	"'\n"
.LC8:
	.string	"OP_CONSTANT_LONG"
.LC9:
	.string	"OP_NULL"
.LC10:
	.string	"%s\n"
.LC11:
	.string	"OP_TRUE"
.LC12:
	.string	"OP_FALSE"
.LC13:
	.string	"OP_POP"
.LC14:
	.string	"OP_GET_LOCAL"
.LC15:
	.string	"%-16s %4d\n"
.LC16:
	.string	"OP_GET_LOCAL_LONG"
.LC17:
	.string	"OP_SET_LOCAL"
.LC18:
	.string	"OP_SET_LOCAL_LONG"
.LC19:
	.string	"OP_GET_GLOBAL"
.LC20:
	.string	"OP_GET_GLOBAL_LONG"
.LC21:
	.string	"OP_DEFINE_GLOBAL"
.LC22:
	.string	"OP_DEFINE_GLOBAL_LONG"
.LC23:
	.string	"OP_SET_GLOBAL"
.LC24:
	.string	"OP_SET_GLOBAL_LONG"
.LC25:
	.string	"OP_DEFINE_CONST"
.LC26:
	.string	"OP_DEFINE_CONST_LONG"
.LC27:
	.string	"OP_GET_PROPERTY"
.LC28:
	.string	"OP_GET_PROPERTY_LONG"
.LC29:
	.string	"OP_SET_PROPERTY"
.LC30:
	.string	"OP_SET_PROPERTY_LONG"
.LC31:
	.string	"OP_GET_SUPER"
.LC32:
	.string	"OP_GET_SUPER_LONG"
.LC33:
	.string	"OP_GET_INDEX"
.LC34:
	.string	"OP_SET_INDEX"
.LC35:
	.string	"OP_GET_UPVALUE"
.LC36:
	.string	"OP_SET_UPVALUE"
.LC37:
	.string	"OP_ARRAY_INIT"
.LC38:
	.string	"OP_ARRAY_INIT_LONG"
.LC39:
	.string	"OP_ARRAY_NEW"
.LC40:
	.string	"OP_EQUAL"
.LC41:
	.string	"OP_GREATER"
.LC42:
	.string	"OP_LESS"
.LC43:
	.string	"OP_ADD"
.LC44:
	.string	"OP_SUBTRACT"
.LC45:
	.string	"OP_MULTIPLY"
.LC46:
	.string	"OP_DIVIDE"
.LC47:
	.string	"OP_MODULUS"
.LC48:
	.string	"OP_BITAND"
.LC49:
	.string	"OP_BITOR"
.LC50:
	.string	"OP_BITXOR"
.LC51:
	.string	"OP_BITNOT"
.LC52:
	.string	"OP_BITLEFT"
.LC53:
	.string	"OP_BITRIGHT"
.LC54:
	.string	"OP_NOT"
.LC55:
	.string	"OP_NEGATE"
.LC56:
	.string	"OP_PRINT"
.LC57:
	.string	"OP_JUMP"
.LC58:
	.string	"%-16s %4d -> %d\n"
.LC59:
	.string	"OP_JUMP_IF_FALSE"
.LC60:
	.string	"OP_LOOP"
.LC61:
	.string	"OP_CALL"
.LC62:
	.string	"OP_INVOKE"
.LC63:
	.string	"%-16s (%d args) %4d '"
.LC64:
	.string	"OP_INVOKE_LONG"
.LC65:
	.string	"OP_CLOSURE"
.LC66:
	.string	"%-16s %4d "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC67:
	.string	"%04d      |                     %s %d\n"
	.section	.rodata.str1.1
.LC68:
	.string	"OP_CLOSURE_LONG"
.LC69:
	.string	"OP_CLOSE_UPVALUE"
.LC70:
	.string	"OP_TRY"
.LC71:
	.string	"OP_END_TRY"
.LC72:
	.string	"OP_RETURN"
.LC73:
	.string	"OP_CLASS"
.LC74:
	.string	"OP_CLASS_LONG"
.LC75:
	.string	"OP_INHERIT"
.LC76:
	.string	"OP_METHOD"
.LC77:
	.string	"OP_METHOD_LONG"
.LC78:
	.string	"Unknown opcode %d\n"
	.text
	.p2align 4
	.globl	"dissassembleInstruction"
	.type	"dissassembleInstruction", @function
"dissassembleInstruction":
.LFB24:
	.cfi_startproc
	sub	rsp, 56	#,
	.cfi_def_cfa_offset 64
# src/debug.c:87:     if (out == NULL) out = stdout;
	test	rdx, rdx	# out
# src/debug.c:86: int dissassembleInstruction(Chunk* chunk, int offset, FILE* out) {
	mov	QWORD PTR 16[rsp], rbx	#,
	.cfi_offset 3, -48
# src/debug.c:87:     if (out == NULL) out = stdout;
	mov	rbx, rdx	# out, out
	cmove	rbx, QWORD PTR "stdout"[rip]	# stdout,, out
# src/debug.c:89:     fprintf(out, "%06d ", offset);
	mov	edx, esi	#, offset
# src/debug.c:86: int dissassembleInstruction(Chunk* chunk, int offset, FILE* out) {
	mov	QWORD PTR 24[rsp], rbp	#,
# src/debug.c:89:     fprintf(out, "%06d ", offset);
	xor	eax, eax	#
	.cfi_offset 6, -40
# src/debug.c:86: int dissassembleInstruction(Chunk* chunk, int offset, FILE* out) {
	mov	ebp, esi	# offset, offset
	mov	QWORD PTR 32[rsp], r12	#,
# src/debug.c:89:     fprintf(out, "%06d ", offset);
	lea	rsi, .LC2[rip]	#,
	.cfi_offset 12, -32
# src/debug.c:86: int dissassembleInstruction(Chunk* chunk, int offset, FILE* out) {
	mov	r12, rdi	# chunk, chunk
# src/debug.c:89:     fprintf(out, "%06d ", offset);
	mov	rdi, rbx	#, out
	call	"fprintf"@PLT	#
# src/debug.c:91:     int line = getLine(chunk, offset);
	mov	esi, ebp	#, offset
	mov	rdi, r12	#, chunk
	call	"getLine"@PLT	#
	mov	edx, eax	# line,
# src/debug.c:92:     if (offset > 0 && line == getLine(chunk, offset - 1)) {
	test	ebp, ebp	# offset
	jle	.L3	#,
# src/debug.c:92:     if (offset > 0 && line == getLine(chunk, offset - 1)) {
	lea	esi, -1[rbp]	# _1,
	mov	rdi, r12	#, chunk
	mov	DWORD PTR [rsp], eax	# %sfp, line
	call	"getLine"@PLT	#
# src/debug.c:92:     if (offset > 0 && line == getLine(chunk, offset - 1)) {
	mov	edx, DWORD PTR [rsp]	# line, %sfp
	cmp	eax, edx	# _2, line
	je	.L92	#,
.L3:
# src/debug.c:95:         fprintf(out, "%6d ", line);
	lea	rsi, .LC4[rip]	#,
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	call	"fprintf"@PLT	#
.L4:
# src/debug.c:98:     uint8_t instruction = chunk->code[offset];
	mov	rdx, QWORD PTR 8[r12]	# _3, chunk_78(D)->code
# src/debug.c:98:     uint8_t instruction = chunk->code[offset];
	movsxd	r9, ebp	# _4, offset
# src/debug.c:98:     uint8_t instruction = chunk->code[offset];
	movzx	ecx, BYTE PTR [rdx+r9]	# instruction, *_5
# src/debug.c:100:     switch(instruction) {
	cmp	cl, 67	# instruction,
	ja	.L5	#,
	lea	rsi, .L7[rip]	# tmp672,
	movzx	eax, cl	# instruction, instruction
	movsxd	rax, DWORD PTR [rsi+rax*4]	# tmp674,
	add	rax, rsi	# tmp675, tmp672
	jmp	rax	# tmp675
	.section	.rodata
	.align 4
	.align 4
.L7:
	.long	.L71-.L7
	.long	.L70-.L7
	.long	.L69-.L7
	.long	.L68-.L7
	.long	.L67-.L7
	.long	.L66-.L7
	.long	.L65-.L7
	.long	.L64-.L7
	.long	.L63-.L7
	.long	.L62-.L7
	.long	.L61-.L7
	.long	.L60-.L7
	.long	.L59-.L7
	.long	.L58-.L7
	.long	.L57-.L7
	.long	.L56-.L7
	.long	.L55-.L7
	.long	.L54-.L7
	.long	.L53-.L7
	.long	.L52-.L7
	.long	.L51-.L7
	.long	.L50-.L7
	.long	.L49-.L7
	.long	.L48-.L7
	.long	.L47-.L7
	.long	.L46-.L7
	.long	.L45-.L7
	.long	.L44-.L7
	.long	.L43-.L7
	.long	.L42-.L7
	.long	.L41-.L7
	.long	.L40-.L7
	.long	.L39-.L7
	.long	.L38-.L7
	.long	.L37-.L7
	.long	.L36-.L7
	.long	.L35-.L7
	.long	.L34-.L7
	.long	.L33-.L7
	.long	.L32-.L7
	.long	.L31-.L7
	.long	.L30-.L7
	.long	.L29-.L7
	.long	.L28-.L7
	.long	.L27-.L7
	.long	.L26-.L7
	.long	.L25-.L7
	.long	.L24-.L7
	.long	.L5-.L7
	.long	.L23-.L7
	.long	.L22-.L7
	.long	.L21-.L7
	.long	.L20-.L7
	.long	.L19-.L7
	.long	.L18-.L7
	.long	.L19-.L7
	.long	.L18-.L7
	.long	.L17-.L7
	.long	.L16-.L7
	.long	.L15-.L7
	.long	.L14-.L7
	.long	.L13-.L7
	.long	.L12-.L7
	.long	.L11-.L7
	.long	.L10-.L7
	.long	.L9-.L7
	.long	.L8-.L7
	.long	.L6-.L7
	.text
	.p2align 4,,10
	.p2align 3
.L92:
# src/debug.c:93:         fprintf(out, "     | ");
	mov	rcx, rbx	#, out
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC3[rip]	#,
	call	"fwrite"@PLT	#
# src/debug.c:93:         fprintf(out, "     | ");
	jmp	.L4	#
	.p2align 4,,10
	.p2align 3
.L19:
# src/debug.c:35:     uint8_t constant = chunk->code[offset + 1];
	movzx	r8d, BYTE PTR 1[rdx+r9]	#, *_742
# src/debug.c:37:     fprintf(out, "%-16s (%d args) %4d '", name, argCount, constant);
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _748, *_745
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	lea	rdx, .LC62[rip]	#,
	lea	rsi, .LC63[rip]	#,
	mov	BYTE PTR [rsp], r8b	# %sfp, constant
	call	"fprintf"@PLT	#
# src/debug.c:38:     printValue(chunk->constants.values[constant], out);
	movzx	r10d, BYTE PTR [rsp]	# _750, %sfp
# src/debug.c:38:     printValue(chunk->constants.values[constant], out);
	mov	rax, QWORD PTR 40[r12]	# chunk_78(D)->constants.values, chunk_78(D)->constants.values
	mov	rsi, rbx	#, out
	mov	rdi, QWORD PTR [rax+r10*8]	# *_752, *_752
	call	"printValue"@PLT	#
# src/debug.c:39:     fprintf(out, "'\n");
	mov	rcx, rbx	#, out
	mov	edx, 2	#,
	mov	esi, 1	#,
	lea	rdi, .LC7[rip]	#,
	call	"fwrite"@PLT	#
# src/debug.c:40:     return offset + 3;
	lea	r10d, 3[rbp]	# <retval>,
.L1:
# src/debug.c:277: }
	mov	rbx, QWORD PTR 16[rsp]	#,
	mov	rbp, QWORD PTR 24[rsp]	#,
	mov	eax, r10d	#, <retval>
	mov	r12, QWORD PTR 32[rsp]	#,
	add	rsp, 56	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
# src/debug.c:45:                        (chunk->code[offset + 2] << 8) |
	movzx	r8d, BYTE PTR 2[rdx+r9]	# _764, *_762
# src/debug.c:46:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _770, *_768
# src/debug.c:48:     fprintf(out, "%-16s (%d args) %4d '", name, argCount, constant);
	mov	rdi, rbx	#, out
	lea	rsi, .LC63[rip]	#,
	movzx	ecx, BYTE PTR 4[rdx+r9]	# _777, *_775
# src/debug.c:46:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _771,
# src/debug.c:45:                        (chunk->code[offset + 2] << 8) |
	sal	r8d, 8	# _765,
# src/debug.c:45:                        (chunk->code[offset + 2] << 8) |
	or	r8d, eax	# _1143, _771
# src/debug.c:44:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _760, *_758
# src/debug.c:48:     fprintf(out, "%-16s (%d args) %4d '", name, argCount, constant);
	lea	rdx, .LC64[rip]	#,
# src/debug.c:45:                        (chunk->code[offset + 2] << 8) |
	or	r8d, eax	# _772, _760
# src/debug.c:48:     fprintf(out, "%-16s (%d args) %4d '", name, argCount, constant);
	xor	eax, eax	#
	mov	DWORD PTR [rsp], r8d	# %sfp, _772
	call	"fprintf"@PLT	#
# src/debug.c:49:     printValue(chunk->constants.values[constant], out);
	mov	r8d, DWORD PTR [rsp]	# _779, %sfp
# src/debug.c:49:     printValue(chunk->constants.values[constant], out);
	mov	rax, QWORD PTR 40[r12]	# chunk_78(D)->constants.values, chunk_78(D)->constants.values
	mov	rsi, rbx	#, out
	mov	rdi, QWORD PTR [rax+r8*8]	# *_781, *_781
	call	"printValue"@PLT	#
# src/debug.c:50:     fprintf(out, "'\n");
	mov	rcx, rbx	#, out
	mov	edx, 2	#,
	mov	esi, 1	#,
	lea	rdi, .LC7[rip]	#,
	call	"fwrite"@PLT	#
# src/debug.c:51:     return offset + 5;
	lea	r10d, 5[rbp]	# <retval>,
# src/debug.c:212:             return longInvokeInstruction("OP_INVOKE_LONG", chunk, offset, out);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L71:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_276
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC5[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	.p2align 4
	.p2align 3
.L84:
	lea	rsi, .LC6[rip]	#,
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/debug.c:18:     printValue(chunk->constants.values[constant], out);
	movzx	r8d, BYTE PTR [rsp]	# _844, %sfp
# src/debug.c:18:     printValue(chunk->constants.values[constant], out);
	mov	rax, QWORD PTR 40[r12]	# chunk_78(D)->constants.values, chunk_78(D)->constants.values
	mov	rsi, rbx	#, out
	mov	rdi, QWORD PTR [rax+r8*8]	# *_846,* chunk_78(D)->constants.values
	call	"printValue"@PLT	#
# src/debug.c:19:     fprintf(out, "'\n");
	mov	rcx, rbx	#, out
	mov	edx, 2	#,
	mov	esi, 1	#,
	lea	rdi, .LC7[rip]	#,
	call	"fwrite"@PLT	#
# src/debug.c:20:     return offset + 2;
	lea	r10d, 2[rbp]	# <retval>,
# src/debug.c:270:             return constantInstruction("OP_METHOD", chunk, offset, out);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L17:
# src/debug.c:214:             offset++;
	lea	eax, 1[rbp]	# offset_109,
	mov	QWORD PTR 48[rsp], r15	#,
# src/debug.c:215:             uint8_t constant = chunk->code[offset++];
	lea	r10d, 2[rbp]	# <retval>,
# src/debug.c:217:             fprintf(out, "%-16s %4d ", "OP_CLOSURE", constant);
	mov	rdi, rbx	#, out
# src/debug.c:215:             uint8_t constant = chunk->code[offset++];
	cdqe
# src/debug.c:217:             fprintf(out, "%-16s %4d ", "OP_CLOSURE", constant);
	lea	rsi, .LC66[rip]	#,
# src/debug.c:215:             uint8_t constant = chunk->code[offset++];
	mov	DWORD PTR [rsp], r10d	# %sfp, <retval>
# src/debug.c:215:             uint8_t constant = chunk->code[offset++];
	movzx	ecx, BYTE PTR [rdx+rax]	#, *_7
# src/debug.c:217:             fprintf(out, "%-16s %4d ", "OP_CLOSURE", constant);
	lea	rdx, .LC65[rip]	#,
	xor	eax, eax	#
	mov	QWORD PTR 8[rsp], r9	# %sfp, _4
# src/debug.c:215:             uint8_t constant = chunk->code[offset++];
	mov	rbp, rcx	#,
	.cfi_offset 15, -16
# src/debug.c:217:             fprintf(out, "%-16s %4d ", "OP_CLOSURE", constant);
	call	"fprintf"@PLT	#
# src/debug.c:218:             printValue(chunk->constants.values[constant], out);
	mov	rax, QWORD PTR 40[r12]	# chunk_78(D)->constants.values, chunk_78(D)->constants.values
	mov	rsi, rbx	#, out
	mov	rdi, QWORD PTR [rax+rbp*8]	# *_12, *_12
	call	"printValue"@PLT	#
# src/debug.c:219:             fprintf(out, "\n");
	mov	rsi, rbx	#, out
	mov	edi, 10	#,
	call	"fputc"@PLT	#
# src/debug.c:221:             ObjFunction* function = AS_FUNCTION(chunk->constants.values[constant]);
	mov	rax, QWORD PTR 40[r12]	# chunk_78(D)->constants.values, chunk_78(D)->constants.values
# src/debug.c:223:             for (int j = 0; j < function->upvalueCount; j++) {
	mov	r10d, DWORD PTR [rsp]	# <retval>, %sfp
# src/debug.c:221:             ObjFunction* function = AS_FUNCTION(chunk->constants.values[constant]);
	movabs	rdx, 1125899906842623	# tmp991,
	and	rdx, QWORD PTR [rax+rbp*8]	# tmp991, *_15
	mov	r15, rdx	# function, function
# src/debug.c:223:             for (int j = 0; j < function->upvalueCount; j++) {
	mov	edx, DWORD PTR 20[rdx]	#, function_115->upvalueCount
	test	edx, edx	#
	jle	.L83	#,
	mov	r9, QWORD PTR 8[rsp]	# _4, %sfp
	mov	QWORD PTR 40[rsp], r14	#,
# src/debug.c:223:             for (int j = 0; j < function->upvalueCount; j++) {
	xor	ebp, ebp	# j
	.cfi_offset 14, -24
	lea	r14, .LC67[rip]	# tmp1072,
	add	r9, 2	# ivtmp.32,
	.p2align 4
	.p2align 3
.L74:
# src/debug.c:224:                 int isLocal = chunk->code[offset++];
	mov	rax, QWORD PTR 8[r12]	# _18, chunk_78(D)->code
	mov	edx, r10d	# offset, <retval>
# src/debug.c:226:                 fprintf(out, "%04d      |                     %s %d\n",
	lea	rcx, .LC1[rip]	# iftmp.3_66,
# src/debug.c:225:                 int index = chunk->code[offset++];
	add	r10d, 2	# <retval>,
# src/debug.c:225:                 int index = chunk->code[offset++];
	movzx	r8d, BYTE PTR 1[rax+r9]	# index, *_23
# src/debug.c:226:                 fprintf(out, "%04d      |                     %s %d\n",
	cmp	BYTE PTR [rax+r9], 0	# *_20,
	je	.L73	#,
# src/debug.c:226:                 fprintf(out, "%04d      |                     %s %d\n",
	lea	rcx, .LC0[rip]	# iftmp.3_66,
.L73:
# src/debug.c:226:                 fprintf(out, "%04d      |                     %s %d\n",
	xor	eax, eax	#
	mov	rsi, r14	#, tmp1072
	mov	rdi, rbx	#, out
	mov	DWORD PTR 8[rsp], r10d	# %sfp, <retval>
	mov	QWORD PTR [rsp], r9	# %sfp, ivtmp.32
# src/debug.c:223:             for (int j = 0; j < function->upvalueCount; j++) {
	add	ebp, 1	# j,
# src/debug.c:226:                 fprintf(out, "%04d      |                     %s %d\n",
	call	"fprintf"@PLT	#
# src/debug.c:223:             for (int j = 0; j < function->upvalueCount; j++) {
	mov	r9, QWORD PTR [rsp]	# ivtmp.32, %sfp
	mov	r10d, DWORD PTR 8[rsp]	# <retval>, %sfp
	add	r9, 2	# ivtmp.32,
	cmp	DWORD PTR 20[r15], ebp	# function_115->upvalueCount, j
	jg	.L74	#,
.L87:
	mov	r14, QWORD PTR 40[rsp]	#,
	.cfi_restore 14
	mov	r15, QWORD PTR 48[rsp]	#,
	.cfi_restore 15
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L20:
# src/debug.c:61:     fprintf(out, "%-16s %4d\n", name, slot);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _228, *_226
	lea	rdx, .LC61[rip]	#,
	.p2align 4
	.p2align 3
.L88:
	lea	rsi, .LC15[rip]	#,
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/debug.c:62:     return offset + 2;
	lea	r10d, 2[rbp]	# <retval>,
# src/debug.c:118:             return byteInstruction("OP_SET_LOCAL", chunk, offset, out);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L6:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _858, *_856
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _864, *_862
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _859,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _865,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1140, _865
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _854, *_852
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC77[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _866, _854
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _866
	.p2align 4
	.p2align 3
.L85:
	lea	rsi, .LC6[rip]	#,
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/debug.c:29:     printValue(chunk->constants.values[constant], out);
	mov	ecx, DWORD PTR [rsp]	# _869, %sfp
# src/debug.c:29:     printValue(chunk->constants.values[constant], out);
	mov	rax, QWORD PTR 40[r12]	# chunk_78(D)->constants.values, chunk_78(D)->constants.values
	mov	rsi, rbx	#, out
	mov	rdi, QWORD PTR [rax+rcx*8]	# *_871,* chunk_78(D)->constants.values
	call	"printValue"@PLT	#
# src/debug.c:30:     fprintf(out, "'\n");
	mov	rcx, rbx	#, out
	mov	edx, 2	#,
	mov	esi, 1	#,
	lea	rdi, .LC7[rip]	#,
	call	"fwrite"@PLT	#
# src/debug.c:31:     return offset + 4;
	lea	r10d, 4[rbp]	# <retval>,
# src/debug.c:272:             return longConstantInstruction("OP_METHOD_LONG", chunk, offset, out);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L8:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_840
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC76[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L21:
# src/debug.c:75:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _683, *_681
# src/debug.c:76:     jump |= chunk->code[offset + 2];
	movzx	eax, BYTE PTR 2[rdx+r9]	# _688, *_686
# src/debug.c:81:             offset + 3 + sign * jump);
	lea	r10d, 3[rbp]	# <retval>,
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	lea	rdx, .LC60[rip]	#,
	mov	DWORD PTR [rsp], r10d	# %sfp, <retval>
	mov	r8d, r10d	# tmp1129, <retval>
# src/debug.c:75:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	sal	ecx, 8	# jump,
# src/debug.c:76:     jump |= chunk->code[offset + 2];
	or	eax, ecx	# jump_689, jump
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	mov	ecx, ebp	#, offset
# src/debug.c:81:             offset + 3 + sign * jump);
	movzx	eax, ax	# _691, jump_689
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	sub	r8d, eax	# tmp1129, _691
.L90:
	lea	rsi, .LC58[rip]	#,
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/debug.c:258:             return jumpInstruction("OP_TRY", 1, chunk, offset, out);
	mov	r10d, DWORD PTR [rsp]	# <retval>, %sfp
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L22:
# src/debug.c:75:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _667, *_665
# src/debug.c:76:     jump |= chunk->code[offset + 2];
	movzx	eax, BYTE PTR 2[rdx+r9]	# _672, *_670
# src/debug.c:81:             offset + 3 + sign * jump);
	lea	r10d, 3[rbp]	# <retval>,
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	lea	rdx, .LC59[rip]	#,
	mov	DWORD PTR [rsp], r10d	# %sfp, <retval>
# src/debug.c:75:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	sal	ecx, 8	# jump,
# src/debug.c:76:     jump |= chunk->code[offset + 2];
	or	eax, ecx	# jump_673, jump
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	mov	ecx, ebp	#, offset
# src/debug.c:81:             offset + 3 + sign * jump);
	movzx	eax, ax	# _675, jump_673
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	lea	r8d, [rax+r10]	#,
	jmp	.L90	#
	.p2align 4,,10
	.p2align 3
.L23:
# src/debug.c:75:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _651, *_649
# src/debug.c:76:     jump |= chunk->code[offset + 2];
	movzx	eax, BYTE PTR 2[rdx+r9]	# _656, *_654
# src/debug.c:81:             offset + 3 + sign * jump);
	lea	r10d, 3[rbp]	# <retval>,
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	lea	rdx, .LC57[rip]	#,
	mov	DWORD PTR [rsp], r10d	# %sfp, <retval>
# src/debug.c:75:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	sal	ecx, 8	# jump,
# src/debug.c:76:     jump |= chunk->code[offset + 2];
	or	eax, ecx	# jump_657, jump
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	mov	ecx, ebp	#, offset
# src/debug.c:81:             offset + 3 + sign * jump);
	movzx	eax, ax	# _659, jump_657
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	lea	r8d, [rax+r10]	#,
	jmp	.L90	#
	.p2align 4,,10
	.p2align 3
.L24:
# src/debug.c:61:     fprintf(out, "%-16s %4d\n", name, slot);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _223, *_221
	lea	rdx, .LC56[rip]	#,
	jmp	.L88	#
	.p2align 4,,10
	.p2align 3
.L9:
# src/debug.c:55:     fprintf(out, "%s\n", name);
	lea	rdx, .LC75[rip]	#,
	.p2align 4
	.p2align 3
.L86:
	lea	rsi, .LC10[rip]	#,
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/debug.c:56:     return offset + 1;
	lea	r10d, 1[rbp]	# <retval>,
# src/debug.c:268:             return simpleInstruction("OP_INHERIT", offset, out);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L10:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _821, *_819
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _827, *_825
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _822,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _828,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1141, _828
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _817, *_815
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC74[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _829, _817
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _829
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L11:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_803
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC73[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L12:
# src/debug.c:55:     fprintf(out, "%s\n", name);
	lea	rdx, .LC72[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L13:
	lea	rdx, .LC71[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L14:
# src/debug.c:75:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _789, *_787
# src/debug.c:76:     jump |= chunk->code[offset + 2];
	movzx	eax, BYTE PTR 2[rdx+r9]	# _794, *_792
# src/debug.c:81:             offset + 3 + sign * jump);
	lea	r10d, 3[rbp]	# <retval>,
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	lea	rdx, .LC70[rip]	#,
	mov	DWORD PTR [rsp], r10d	# %sfp, <retval>
# src/debug.c:75:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	sal	ecx, 8	# jump,
# src/debug.c:76:     jump |= chunk->code[offset + 2];
	or	eax, ecx	# jump_795, jump
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	mov	ecx, ebp	#, offset
# src/debug.c:81:             offset + 3 + sign * jump);
	movzx	eax, ax	# _797, jump_795
# src/debug.c:78:     fprintf(out, "%-16s %4d -> %d\n",
	lea	r8d, [rax+r10]	#,
	jmp	.L90	#
	.p2align 4,,10
	.p2align 3
.L15:
# src/debug.c:55:     fprintf(out, "%s\n", name);
	lea	rdx, .LC69[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L16:
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	lea	eax, 2[rbp]	# offset_96,
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	lea	ecx, 3[rbp]	# offset_97,
	mov	QWORD PTR 48[rsp], r15	#,
# src/debug.c:238:             fprintf(out, "%-16s %4d ", "OP_CLOSURE_LONG", constant);
	mov	rdi, rbx	#, out
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	cdqe
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	movsxd	rcx, ecx	# _36, offset_97
	lea	r10d, 4[rbp]	# <retval>,
	mov	QWORD PTR 8[rsp], r9	# %sfp, _4
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	movzx	eax, BYTE PTR [rdx+rax]	# _33, *_31
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	movzx	ecx, BYTE PTR [rdx+rcx]	# _39, *_37
# src/debug.c:238:             fprintf(out, "%-16s %4d ", "OP_CLOSURE_LONG", constant);
	lea	rsi, .LC66[rip]	#,
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	mov	DWORD PTR [rsp], r10d	# %sfp, <retval>
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	sal	ecx, 16	# _40,
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	sal	eax, 8	# _34,
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	or	eax, ecx	# _1142, _40
# src/debug.c:235:             offset++;
	lea	ecx, 1[rbp]	# offset_95,
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	movsxd	rcx, ecx	# _26, offset_95
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	movzx	edx, BYTE PTR [rdx+rcx]	# _29, *_27
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	or	eax, edx	# _1142, _29
# src/debug.c:238:             fprintf(out, "%-16s %4d ", "OP_CLOSURE_LONG", constant);
	lea	rdx, .LC68[rip]	#,
# src/debug.c:236:             uint32_t constant = (chunk->code[offset++]) | (chunk->code[offset++] << 8) | (chunk->code[offset++] << 16);
	mov	ebp, eax	#, _1142
# src/debug.c:238:             fprintf(out, "%-16s %4d ", "OP_CLOSURE_LONG", constant);
	xor	eax, eax	#
	mov	ecx, ebp	#, _41
	.cfi_offset 15, -16
	call	"fprintf"@PLT	#
# src/debug.c:239:             printValue(chunk->constants.values[constant], out);
	mov	rax, QWORD PTR 40[r12]	# chunk_78(D)->constants.values, chunk_78(D)->constants.values
	mov	rsi, rbx	#, out
	mov	rdi, QWORD PTR [rax+rbp*8]	# *_45, *_45
	call	"printValue"@PLT	#
# src/debug.c:240:             fprintf(out, "\n");
	mov	rsi, rbx	#, out
	mov	edi, 10	#,
	call	"fputc"@PLT	#
# src/debug.c:242:             ObjFunction* function = AS_FUNCTION(chunk->constants.values[constant]);
	mov	rax, QWORD PTR 40[r12]	# chunk_78(D)->constants.values, chunk_78(D)->constants.values
# src/debug.c:244:             for (int j = 0; j < function->upvalueCount; j++) {
	mov	r10d, DWORD PTR [rsp]	# <retval>, %sfp
# src/debug.c:242:             ObjFunction* function = AS_FUNCTION(chunk->constants.values[constant]);
	movabs	rdx, 1125899906842623	# tmp1012,
	and	rdx, QWORD PTR [rax+rbp*8]	# tmp1012, *_48
# src/debug.c:244:             for (int j = 0; j < function->upvalueCount; j++) {
	mov	eax, DWORD PTR 20[rdx]	#, function_103->upvalueCount
# src/debug.c:242:             ObjFunction* function = AS_FUNCTION(chunk->constants.values[constant]);
	mov	r15, rdx	# function, function
# src/debug.c:244:             for (int j = 0; j < function->upvalueCount; j++) {
	test	eax, eax	#
	jle	.L83	#,
	mov	r9, QWORD PTR 8[rsp]	# _4, %sfp
	mov	QWORD PTR 40[rsp], r14	#,
	.cfi_offset 14, -24
# src/debug.c:244:             for (int j = 0; j < function->upvalueCount; j++) {
	xor	ebp, ebp	# j
	lea	r14, .LC67[rip]	# tmp1072,
	add	r9, 4	# ivtmp.44,
	.p2align 4
	.p2align 3
.L76:
# src/debug.c:245:                 int isLocal = chunk->code[offset++];
	mov	rax, QWORD PTR 8[r12]	# _51, chunk_78(D)->code
	mov	edx, r10d	# offset, <retval>
# src/debug.c:247:                 fprintf(out, "%04d      |                     %s %d\n",
	lea	rcx, .LC1[rip]	# iftmp.9_67,
# src/debug.c:246:                 int index = chunk->code[offset++];
	add	r10d, 2	# <retval>,
# src/debug.c:246:                 int index = chunk->code[offset++];
	movzx	r8d, BYTE PTR 1[rax+r9]	# index, *_56
# src/debug.c:247:                 fprintf(out, "%04d      |                     %s %d\n",
	cmp	BYTE PTR [rax+r9], 0	# *_53,
	je	.L75	#,
# src/debug.c:247:                 fprintf(out, "%04d      |                     %s %d\n",
	lea	rcx, .LC0[rip]	# iftmp.9_67,
.L75:
# src/debug.c:247:                 fprintf(out, "%04d      |                     %s %d\n",
	xor	eax, eax	#
	mov	rsi, r14	#, tmp1072
	mov	rdi, rbx	#, out
	mov	DWORD PTR 8[rsp], r10d	# %sfp, <retval>
	mov	QWORD PTR [rsp], r9	# %sfp, ivtmp.44
# src/debug.c:244:             for (int j = 0; j < function->upvalueCount; j++) {
	add	ebp, 1	# j,
# src/debug.c:247:                 fprintf(out, "%04d      |                     %s %d\n",
	call	"fprintf"@PLT	#
# src/debug.c:244:             for (int j = 0; j < function->upvalueCount; j++) {
	mov	r9, QWORD PTR [rsp]	# ivtmp.44, %sfp
	mov	r10d, DWORD PTR 8[rsp]	# <retval>, %sfp
	add	r9, 2	# ivtmp.44,
	cmp	DWORD PTR 20[r15], ebp	# function_103->upvalueCount, j
	jg	.L76	#,
	jmp	.L87	#
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore 14
	.cfi_restore 15
# src/debug.c:55:     fprintf(out, "%s\n", name);
	lea	rdx, .LC52[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L26:
	lea	rdx, .LC53[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L27:
	lea	rdx, .LC51[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L28:
	lea	rdx, .LC50[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L29:
	lea	rdx, .LC49[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L30:
	lea	rdx, .LC48[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L31:
	lea	rdx, .LC55[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L32:
	lea	rdx, .LC54[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L33:
	lea	rdx, .LC47[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L34:
	lea	rdx, .LC46[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L35:
	lea	rdx, .LC45[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L36:
	lea	rdx, .LC44[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L37:
	lea	rdx, .LC43[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L38:
	lea	rdx, .LC42[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L39:
	lea	rdx, .LC41[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L40:
	lea	rdx, .LC40[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L41:
	lea	rdx, .LC39[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L42:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _630, *_628
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _636, *_634
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _631,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _637,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1144, _637
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _626, *_624
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC38[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _638, _626
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _638
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L43:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_612
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC37[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L44:
# src/debug.c:61:     fprintf(out, "%-16s %4d\n", name, slot);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _201, *_199
	lea	rdx, .LC36[rip]	#,
	jmp	.L88	#
	.p2align 4,,10
	.p2align 3
.L45:
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _196, *_194
	lea	rdx, .LC35[rip]	#,
	jmp	.L88	#
	.p2align 4,,10
	.p2align 3
.L46:
# src/debug.c:55:     fprintf(out, "%s\n", name);
	lea	rdx, .LC34[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L47:
	lea	rdx, .LC33[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L48:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _593, *_591
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _599, *_597
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _594,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _600,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1145, _600
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _589, *_587
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC32[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _601, _589
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _601
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L49:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_575
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC31[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L50:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _556, *_554
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _562, *_560
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _557,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _563,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1146, _563
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _552, *_550
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC30[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _564, _552
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _564
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L51:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_538
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC29[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L52:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _519, *_517
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _525, *_523
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _520,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _526,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1147, _526
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _515, *_513
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC28[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _527, _515
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _527
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L53:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_501
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC27[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L54:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _482, *_480
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _488, *_486
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _483,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _489,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1148, _489
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _478, *_476
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC26[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _490, _478
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _490
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L55:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_464
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC25[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L56:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _445, *_443
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _451, *_449
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _446,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _452,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1149, _452
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _441, *_439
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC24[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _453, _441
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _453
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L57:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_427
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC23[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L58:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _408, *_406
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _414, *_412
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _409,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _415,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1150, _415
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _404, *_402
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC22[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _416, _404
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _416
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L59:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_390
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC21[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L60:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _371, *_369
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _377, *_375
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _372,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _378,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1151, _378
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _367, *_365
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC20[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _379, _367
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _379
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L61:
# src/debug.c:16:     uint8_t constant = chunk->code[offset + 1];
	movzx	ecx, BYTE PTR 1[rdx+r9]	#, *_353
# src/debug.c:17:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC19[rip]	#,
	mov	BYTE PTR [rsp], cl	# %sfp, constant
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L62:
# src/debug.c:67:                    (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _339, *_337
# src/debug.c:68:                    (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _345, *_343
# src/debug.c:67:                    (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _340,
# src/debug.c:68:                    (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _346,
# src/debug.c:67:                    (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _1152, _346
# src/debug.c:66:     uint32_t slot = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _335, *_333
# src/debug.c:70:     fprintf(out, "%-16s %4d\n", name, slot);
	lea	rdx, .LC18[rip]	#,
# src/debug.c:67:                    (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _347, _335
.L89:
# src/debug.c:70:     fprintf(out, "%-16s %4d\n", name, slot);
	lea	rsi, .LC15[rip]	#,
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/debug.c:71:     return offset + 4;
	lea	r10d, 4[rbp]	# <retval>,
# src/debug.c:120:             return longByteInstruction("OP_SET_LOCAL_LONG", chunk, offset, out);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L63:
# src/debug.c:61:     fprintf(out, "%-16s %4d\n", name, slot);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _189, *_187
	lea	rdx, .LC17[rip]	#,
	jmp	.L88	#
	.p2align 4,,10
	.p2align 3
.L64:
# src/debug.c:67:                    (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _319, *_317
# src/debug.c:68:                    (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _325, *_323
# src/debug.c:67:                    (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _320,
# src/debug.c:68:                    (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _326,
# src/debug.c:67:                    (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _116, _326
# src/debug.c:66:     uint32_t slot = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _315, *_313
# src/debug.c:70:     fprintf(out, "%-16s %4d\n", name, slot);
	lea	rdx, .LC16[rip]	#,
# src/debug.c:67:                    (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _327, _315
	jmp	.L89	#
	.p2align 4,,10
	.p2align 3
.L65:
# src/debug.c:61:     fprintf(out, "%-16s %4d\n", name, slot);
	movzx	ecx, BYTE PTR 1[rdx+r9]	# _184, *_182
	lea	rdx, .LC14[rip]	#,
	jmp	.L88	#
	.p2align 4,,10
	.p2align 3
.L66:
# src/debug.c:55:     fprintf(out, "%s\n", name);
	lea	rdx, .LC13[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L67:
	lea	rdx, .LC12[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L68:
	lea	rdx, .LC11[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L69:
	lea	rdx, .LC9[rip]	#,
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L70:
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	movzx	ecx, BYTE PTR 2[rdx+r9]	# _294, *_292
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdx+r9]	# _300, *_298
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	sal	ecx, 8	# _295,
# src/debug.c:26:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _301,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _104, _301
# src/debug.c:24:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdx+r9]	# _290, *_288
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	lea	rdx, .LC8[rip]	#,
# src/debug.c:25:                        (chunk->code[offset + 2] << 8) |
	or	ecx, eax	# _302, _290
# src/debug.c:28:     fprintf(out, "%-16s %4d '", name, constant);
	mov	DWORD PTR [rsp], ecx	# %sfp, _302
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L5:
# src/debug.c:274:             fprintf(out, "Unknown opcode %d\n", instruction);
	movzx	edx, cl	# _59, instruction
	lea	rsi, .LC78[rip]	#,
	mov	rdi, rbx	#, out
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/debug.c:275:             return offset + 1;
	lea	r10d, 1[rbp]	# <retval>,
	jmp	.L1	#
.L83:
	.cfi_offset 15, -16
	mov	r15, QWORD PTR 48[rsp]	#,
	.cfi_restore 15
	jmp	.L1	#
	.cfi_endproc
.LFE24:
	.size	"dissassembleInstruction", .-"dissassembleInstruction"
	.section	.rodata.str1.1
.LC79:
	.string	"== %s ==\n"
	.text
	.p2align 4
	.globl	"dissassembleChunk"
	.type	"dissassembleChunk", @function
"dissassembleChunk":
.LFB15:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi	# chunk, chunk
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/debug.c:8:     if (out == NULL) out = stdout;
	test	rdx, rdx	# out
	cmove	rdx, QWORD PTR "stdout"[rip]	# stdout,, out
# src/debug.c:9:     fprintf(out, "== %s ==\n", name);
	xor	eax, eax	#
# src/debug.c:8:     if (out == NULL) out = stdout;
	mov	rbp, rdx	# out, out
# src/debug.c:9:     fprintf(out, "== %s ==\n", name);
	mov	rdx, rsi	#, name
	lea	rsi, .LC79[rip]	#,
	mov	rdi, rbp	#, out
	call	"fprintf"@PLT	#
# src/debug.c:10:     for (int offset = 0; offset < chunk->count;) {
	mov	eax, DWORD PTR [rbx]	#, chunk_10(D)->count
	test	eax, eax	#
	jle	.L93	#,
# src/debug.c:10:     for (int offset = 0; offset < chunk->count;) {
	xor	esi, esi	# offset
	.p2align 4
	.p2align 3
.L96:
# src/debug.c:11:         offset = dissassembleInstruction(chunk, offset, out);
	mov	rdx, rbp	#, out
	mov	rdi, rbx	#, chunk
	call	"dissassembleInstruction"	#
	mov	esi, eax	# offset, offset
# src/debug.c:10:     for (int offset = 0; offset < chunk->count;) {
	cmp	DWORD PTR [rbx], eax	# chunk_10(D)->count, offset
	jg	.L96	#,
.L93:
# src/debug.c:13: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE15:
	.size	"dissassembleChunk", .-"dissassembleChunk"
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
