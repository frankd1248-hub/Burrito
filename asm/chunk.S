	.file	"chunk.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.globl	"initChunk"
	.type	"initChunk", @function
"initChunk":
.LFB26:
	.cfi_startproc
# src/chunk.c:8:     chunk->count = 0;
	mov	QWORD PTR [rdi], 0	# MEM <vector(2) int> [(int *)chunk_3(D)],
# src/chunk.c:14:     initValueArray(&chunk->constants);
	add	rdi, 32	# _1,
# src/chunk.c:10:     chunk->code = NULL;
	mov	QWORD PTR -24[rdi], 0	# chunk_3(D)->code,
# src/chunk.c:11:     chunk->lineCount = 0;
	mov	QWORD PTR -16[rdi], 0	# MEM <vector(2) int> [(int *)chunk_3(D) + 16B],
# src/chunk.c:13:      chunk->lines = NULL;
	mov	QWORD PTR -8[rdi], 0	# chunk_3(D)->lines,
# src/chunk.c:14:     initValueArray(&chunk->constants);
	jmp	"initValueArray"@PLT	#
	.cfi_endproc
.LFE26:
	.size	"initChunk", .-"initChunk"
	.p2align 4
	.globl	"freeChunk"
	.type	"freeChunk", @function
"freeChunk":
.LFB27:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/chunk.c:18:     FREE_ARRAY(uint8_t, chunk->code, chunk->capacity);
	xor	edx, edx	#
# src/chunk.c:17: void freeChunk(Chunk* chunk) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi	# chunk, chunk
# src/chunk.c:20:     freeValueArray(&chunk->constants);
	lea	rbp, 32[rbx]	# _8,
# src/chunk.c:17: void freeChunk(Chunk* chunk) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/chunk.c:18:     FREE_ARRAY(uint8_t, chunk->code, chunk->capacity);
	movsxd	rsi, DWORD PTR 4[rdi]	# _2, chunk_10(D)->capacity
	mov	rdi, QWORD PTR 8[rdi]	# chunk_10(D)->code, chunk_10(D)->code
	call	"reallocate"@PLT	#
# src/chunk.c:19:     FREE_ARRAY(LineStart, chunk->lines, chunk->lineCapacity);
	movsxd	rsi, DWORD PTR 20[rbx]	# _5, chunk_10(D)->lineCapacity
	mov	rdi, QWORD PTR 24[rbx]	# chunk_10(D)->lines, chunk_10(D)->lines
	xor	edx, edx	#
	sal	rsi, 3	# _6,
	call	"reallocate"@PLT	#
# src/chunk.c:20:     freeValueArray(&chunk->constants);
	mov	rdi, rbp	#, _8
	call	"freeValueArray"@PLT	#
# src/chunk.c:8:     chunk->count = 0;
	mov	QWORD PTR [rbx], 0	# MEM <vector(2) int> [(int *)chunk_10(D)],
# src/chunk.c:14:     initValueArray(&chunk->constants);
	mov	rdi, rbp	#, _8
# src/chunk.c:10:     chunk->code = NULL;
	mov	QWORD PTR 8[rbx], 0	# chunk_10(D)->code,
# src/chunk.c:11:     chunk->lineCount = 0;
	mov	QWORD PTR 16[rbx], 0	# MEM <vector(2) int> [(int *)chunk_10(D) + 16B],
# src/chunk.c:13:      chunk->lines = NULL;
	mov	QWORD PTR 24[rbx], 0	# chunk_10(D)->lines,
# src/chunk.c:22: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/chunk.c:14:     initValueArray(&chunk->constants);
	jmp	"initValueArray"@PLT	#
	.cfi_endproc
.LFE27:
	.size	"freeChunk", .-"freeChunk"
	.p2align 4
	.globl	"writeChunk"
	.type	"writeChunk", @function
"writeChunk":
.LFB28:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ecx, esi	# byte, byte
	mov	ebp, edx	# line, line
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi	# chunk, chunk
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 48
# src/chunk.c:25:     if (chunk->capacity < chunk->count + 1) {
	movsxd	rdx, DWORD PTR [rdi]	#, chunk_39(D)->count
# src/chunk.c:25:     if (chunk->capacity < chunk->count + 1) {
	movsxd	rsi, DWORD PTR 4[rdi]	#, chunk_39(D)->capacity
# src/chunk.c:28:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	mov	rdi, QWORD PTR 8[rdi]	# prephitmp_73, chunk_39(D)->code
# src/chunk.c:25:     if (chunk->capacity < chunk->count + 1) {
	cmp	edx, esi	# _1, _2
	jl	.L6	#,
# src/chunk.c:27:         chunk->capacity = GROW_CAPACITY(oldCapacity);
	cmp	esi, 7	# _2,
	jg	.L15	#,
	mov	edx, 8	# _70,
# src/chunk.c:27:         chunk->capacity = GROW_CAPACITY(oldCapacity);
	mov	eax, 8	# iftmp.0_33,
.L7:
# src/chunk.c:27:         chunk->capacity = GROW_CAPACITY(oldCapacity);
	mov	DWORD PTR 4[rbx], eax	# chunk_39(D)->capacity, iftmp.0_33
	mov	BYTE PTR 15[rsp], cl	# %sfp, byte
# src/chunk.c:28:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	call	"reallocate"@PLT	#
# src/chunk.c:31:     chunk->code[chunk->count] = byte;
	movsxd	rdx, DWORD PTR [rbx]	#, chunk_39(D)->count
	movzx	ecx, BYTE PTR 15[rsp]	# byte, %sfp
# src/chunk.c:28:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	mov	QWORD PTR 8[rbx], rax	# chunk_39(D)->code, prephitmp_73
# src/chunk.c:28:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	mov	rdi, rax	# prephitmp_73, prephitmp_73
.L6:
# src/chunk.c:31:     chunk->code[chunk->count] = byte;
	mov	BYTE PTR [rdi+rdx], cl	# *_10, byte
# src/chunk.c:32:     chunk->count++;
	mov	edx, DWORD PTR [rbx]	# _11, chunk_39(D)->count
# src/chunk.c:34:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	mov	rdi, QWORD PTR 24[rbx]	# prephitmp_85, chunk_39(D)->lines
# src/chunk.c:32:     chunk->count++;
	lea	eax, 1[rdx]	# tmp131,
	mov	DWORD PTR [rbx], eax	# chunk_39(D)->count, tmp131
# src/chunk.c:34:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	mov	eax, DWORD PTR 16[rbx]	# _13, chunk_39(D)->lineCount
# src/chunk.c:34:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	test	eax, eax	# _13
	jle	.L8	#,
# src/chunk.c:34:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	mov	ecx, eax	# _15, _13
# src/chunk.c:34:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	cmp	DWORD PTR -4[rdi+rcx*8], ebp	# _17->line, line
	je	.L5	#,
.L8:
# src/chunk.c:38:     if (chunk->lineCapacity < chunk->lineCount + 1) {
	movsxd	rsi, DWORD PTR 20[rbx]	#, chunk_39(D)->lineCapacity
# src/chunk.c:38:     if (chunk->lineCapacity < chunk->lineCount + 1) {
	cmp	eax, esi	# _13, _19
	jl	.L10	#,
# src/chunk.c:40:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	cmp	esi, 7	# _19,
	jle	.L13	#,
# src/chunk.c:40:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	lea	edx, [rsi+rsi]	#,
	mov	rax, rdx	#,
# src/chunk.c:41:         chunk->lines = GROW_ARRAY(LineStart, chunk->lines, oldCapacity, chunk->lineCapacity);
	sal	rdx, 3	# _83,
.L11:
# src/chunk.c:40:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	mov	DWORD PTR 20[rbx], eax	# chunk_39(D)->lineCapacity, iftmp.1_34
# src/chunk.c:41:         chunk->lines = GROW_ARRAY(LineStart, chunk->lines, oldCapacity, chunk->lineCapacity);
	sal	rsi, 3	# _23,
	call	"reallocate"@PLT	#
# src/chunk.c:45:     lineStart->offset = chunk->count - 1;
	mov	ecx, DWORD PTR [rbx]	# tmp149, chunk_39(D)->count
# src/chunk.c:41:         chunk->lines = GROW_ARRAY(LineStart, chunk->lines, oldCapacity, chunk->lineCapacity);
	mov	QWORD PTR 24[rbx], rax	# chunk_39(D)->lines, prephitmp_85
# src/chunk.c:41:         chunk->lines = GROW_ARRAY(LineStart, chunk->lines, oldCapacity, chunk->lineCapacity);
	mov	rdi, rax	# prephitmp_85, prephitmp_85
# src/chunk.c:44:     LineStart* lineStart = &chunk->lines[chunk->lineCount++];
	mov	eax, DWORD PTR 16[rbx]	# _13, chunk_39(D)->lineCount
# src/chunk.c:45:     lineStart->offset = chunk->count - 1;
	lea	edx, -1[rcx]	# _11,
.L10:
# src/chunk.c:44:     LineStart* lineStart = &chunk->lines[chunk->lineCount++];
	lea	ecx, 1[rax]	# tmp140,
	cdqe
	mov	DWORD PTR 16[rbx], ecx	# chunk_39(D)->lineCount, tmp140
# src/chunk.c:45:     lineStart->offset = chunk->count - 1;
	mov	DWORD PTR [rdi+rax*8], edx	# lineStart_54->offset, _11
# src/chunk.c:46:     lineStart->line = line;
	mov	DWORD PTR 4[rdi+rax*8], ebp	# lineStart_54->line, line
.L5:
# src/chunk.c:47: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
# src/chunk.c:27:         chunk->capacity = GROW_CAPACITY(oldCapacity);
	lea	edx, [rsi+rsi]	#,
	mov	rax, rdx	#,
	jmp	.L7	#
	.p2align 4,,10
	.p2align 3
.L13:
# src/chunk.c:40:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	mov	edx, 64	# _83,
# src/chunk.c:40:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	mov	eax, 8	# iftmp.1_34,
	jmp	.L11	#
	.cfi_endproc
.LFE28:
	.size	"writeChunk", .-"writeChunk"
	.p2align 4
	.globl	"addConstant"
	.type	"addConstant", @function
"addConstant":
.LFB29:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi	# chunk, chunk
# src/chunk.c:50:     push(value);
	mov	rdi, rsi	#, value
# src/chunk.c:49: int addConstant(Chunk* chunk, Value value) {
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/chunk.c:50:     push(value);
	mov	QWORD PTR 8[rsp], rsi	# %sfp, value
	call	"push"@PLT	#
# src/chunk.c:51:     writeValueArray(&chunk->constants, value);
	mov	rsi, QWORD PTR 8[rsp]	# value, %sfp
	lea	rdi, 32[rbx]	# _1,
	call	"writeValueArray"@PLT	#
# src/chunk.c:52:     pop();
	call	"pop"@PLT	#
# src/chunk.c:53:     return chunk->constants.count - 1;
	mov	eax, DWORD PTR 36[rbx]	# chunk_6(D)->constants.count, chunk_6(D)->constants.count
# src/chunk.c:54: }
	add	rsp, 16	#,
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/chunk.c:53:     return chunk->constants.count - 1;
	sub	eax, 1	# _9,
# src/chunk.c:54: }
	ret	
	.cfi_endproc
.LFE29:
	.size	"addConstant", .-"addConstant"
	.p2align 4
	.globl	"writeConstant"
	.type	"writeConstant", @function
"writeConstant":
.LFB30:
	.cfi_startproc
	push	r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12d, edx	# line, line
	push	rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rdi	# chunk, chunk
# src/chunk.c:50:     push(value);
	mov	rdi, rsi	#, value
# src/chunk.c:56: void writeConstant(Chunk* chunk, Value value, int line) {
	push	rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
# src/chunk.c:56: void writeConstant(Chunk* chunk, Value value, int line) {
	mov	rbx, rsi	# value, value
# src/chunk.c:50:     push(value);
	call	"push"@PLT	#
# src/chunk.c:51:     writeValueArray(&chunk->constants, value);
	mov	rsi, rbx	#, value
	lea	rdi, 32[rbp]	# _20,
	call	"writeValueArray"@PLT	#
# src/chunk.c:52:     pop();
	call	"pop"@PLT	#
# src/chunk.c:53:     return chunk->constants.count - 1;
	mov	eax, DWORD PTR 36[rbp]	# tmp121, chunk_9(D)->constants.count
# src/chunk.c:59:         writeChunk(chunk, OP_CONSTANT, line);
	mov	edx, r12d	#, line
# src/chunk.c:53:     return chunk->constants.count - 1;
	lea	ebx, -1[rax]	# _22,
# src/chunk.c:58:     if (index < 256) {
	cmp	ebx, 255	# _22,
	jg	.L19	#,
# src/chunk.c:59:         writeChunk(chunk, OP_CONSTANT, line);
	xor	esi, esi	#
	mov	rdi, rbp	#, chunk
	call	"writeChunk"	#
.L21:
# src/chunk.c:65:         writeChunk(chunk, (uint8_t) ((index >> 16) & 0xff), line);
	movzx	esi, bl	# _5, _5
	mov	edx, r12d	#, line
# src/chunk.c:67: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# src/chunk.c:65:         writeChunk(chunk, (uint8_t) ((index >> 16) & 0xff), line);
	mov	rdi, rbp	#, chunk
# src/chunk.c:67: }
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
# src/chunk.c:65:         writeChunk(chunk, (uint8_t) ((index >> 16) & 0xff), line);
	jmp	"writeChunk"	#
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore_state
# src/chunk.c:62:         writeChunk(chunk, OP_CONSTANT_LONG, line);
	mov	esi, 1	#,
	mov	rdi, rbp	#, chunk
	call	"writeChunk"	#
# src/chunk.c:63:         writeChunk(chunk, (uint8_t) (index & 0xff), line);
	movzx	esi, bl	# _26, _22
	mov	edx, r12d	#, line
	mov	rdi, rbp	#, chunk
	call	"writeChunk"	#
# src/chunk.c:64:         writeChunk(chunk, (uint8_t) ((index >> 8) & 0xff), line);
	movzx	esi, bh	# _3, _22
	mov	edx, r12d	#, line
	mov	rdi, rbp	#, chunk
	call	"writeChunk"	#
# src/chunk.c:65:         writeChunk(chunk, (uint8_t) ((index >> 16) & 0xff), line);
	sar	ebx, 16	# _5,
	jmp	.L21	#
	.cfi_endproc
.LFE30:
	.size	"writeConstant", .-"writeConstant"
	.p2align 4
	.globl	"getLine"
	.type	"getLine", @function
"getLine":
.LFB31:
	.cfi_startproc
# src/chunk.c:71:     int end = chunk->lineCount - 1;
	mov	eax, DWORD PTR 16[rdi]	# tmp126, chunk_16(D)->lineCount
# src/chunk.c:75:         LineStart* line = &chunk->lines[mid];
	mov	rdi, QWORD PTR 24[rdi]	# _3, chunk_16(D)->lines
# src/chunk.c:69: int getLine(Chunk* chunk, int instruction) {
	mov	r8d, esi	# instruction, instruction
# src/chunk.c:70:     int start = 0;
	xor	r9d, r9d	# start
# src/chunk.c:71:     int end = chunk->lineCount - 1;
	lea	r10d, -1[rax]	# end,
	mov	esi, r10d	# end, end
	.p2align 5
	.p2align 4
	.p2align 3
.L23:
# src/chunk.c:74:         int mid = (start + end) / 2;
	lea	edx, [r9+rsi]	# _2,
# src/chunk.c:74:         int mid = (start + end) / 2;
	mov	eax, edx	# tmp117, _2
	shr	eax, 31	# tmp117,
	add	eax, edx	# tmp118, _2
	sar	eax	# mid_18
# src/chunk.c:75:         LineStart* line = &chunk->lines[mid];
	movsxd	rdx, eax	# _4, mid_18
# src/chunk.c:75:         LineStart* line = &chunk->lines[mid];
	lea	rcx, [rdi+rdx*8]	# line,
# src/chunk.c:76:         if (instruction < line->offset) {
	cmp	DWORD PTR [rcx], r8d	# line_19->offset, instruction
	jle	.L24	#,
# src/chunk.c:77:             end = mid - 1;
	lea	esi, -1[rax]	# end,
	jmp	.L23	#
	.p2align 4,,10
	.p2align 3
.L24:
# src/chunk.c:78:         } else if (mid == chunk->lineCount - 1 || instruction < chunk->lines[mid + 1].offset) {
	cmp	r10d, eax	# end, mid_18
	je	.L27	#,
# src/chunk.c:78:         } else if (mid == chunk->lineCount - 1 || instruction < chunk->lines[mid + 1].offset) {
	cmp	DWORD PTR 8[rdi+rdx*8], r8d	# _11->offset, instruction
	jg	.L27	#,
# src/chunk.c:81:             start = mid + 1;
	lea	r9d, 1[rax]	# start,
	jmp	.L23	#
	.p2align 4,,10
	.p2align 3
.L27:
# src/chunk.c:79:             return line->line;
	mov	eax, DWORD PTR 4[rcx]	# line_19->line, line_19->line
# src/chunk.c:84: }
	ret	
	.cfi_endproc
.LFE31:
	.size	"getLine", .-"getLine"
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
