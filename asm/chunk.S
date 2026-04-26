	.file	"chunk.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=48 --param=l1-cache-line-size=64 --param=l2-cache-size=12288 -mtune=arrowlake-s -masm=intel -O3
	.text
	.p2align 4
	.globl	initChunk
	.type	initChunk, @function
initChunk:
.LFB12:
	.cfi_startproc
# src/chunk.c:7:     chunk->count = 0;
	mov	QWORD PTR [rdi], 0	# MEM <vector(2) int> [(int *)chunk_3(D)],
# src/chunk.c:9:     chunk->code = NULL;
	mov	QWORD PTR 8[rdi], 0	# chunk_3(D)->code,
# src/chunk.c:10:     chunk->lineCount = 0;
	mov	QWORD PTR 16[rdi], 0	# MEM <vector(2) int> [(int *)chunk_3(D) + 16B],
# src/chunk.c:12:      chunk->lines = NULL;
	mov	QWORD PTR 24[rdi], 0	# chunk_3(D)->lines,
# src/chunk.c:13:     initValueArray(&chunk->constants);
	add	rdi, 32	# _1,
	jmp	initValueArray@PLT	#
	.cfi_endproc
.LFE12:
	.size	initChunk, .-initChunk
	.p2align 4
	.globl	freeChunk
	.type	freeChunk, @function
freeChunk:
.LFB13:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/chunk.c:17:     FREE_ARRAY(uint8_t, chunk->code, chunk->capacity);
	xor	edx, edx	#
# src/chunk.c:16: void freeChunk(Chunk* chunk) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi	# chunk, chunk
# src/chunk.c:19:     freeValueArray(&chunk->constants);
	lea	rbp, 32[rbx]	# _8,
# src/chunk.c:16: void freeChunk(Chunk* chunk) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/chunk.c:17:     FREE_ARRAY(uint8_t, chunk->code, chunk->capacity);
	movsxd	rsi, DWORD PTR 4[rdi]	# _2, chunk_10(D)->capacity
	mov	rdi, QWORD PTR 8[rdi]	# chunk_10(D)->code, chunk_10(D)->code
	call	reallocate@PLT	#
# src/chunk.c:18:     FREE_ARRAY(LineStart, chunk->lines, chunk->lineCapacity);
	movsxd	rsi, DWORD PTR 20[rbx]	# _5, chunk_10(D)->lineCapacity
	mov	rdi, QWORD PTR 24[rbx]	# chunk_10(D)->lines, chunk_10(D)->lines
	sal	rsi, 3	# _6,
	xor	edx, edx	#
	call	reallocate@PLT	#
# src/chunk.c:19:     freeValueArray(&chunk->constants);
	mov	rdi, rbp	#, _8
	call	freeValueArray@PLT	#
# src/chunk.c:7:     chunk->count = 0;
	mov	QWORD PTR [rbx], 0	# MEM <vector(2) int> [(int *)chunk_10(D)],
# src/chunk.c:9:     chunk->code = NULL;
	mov	QWORD PTR 8[rbx], 0	# chunk_10(D)->code,
# src/chunk.c:10:     chunk->lineCount = 0;
	mov	QWORD PTR 16[rbx], 0	# MEM <vector(2) int> [(int *)chunk_10(D) + 16B],
# src/chunk.c:12:      chunk->lines = NULL;
	mov	QWORD PTR 24[rbx], 0	# chunk_10(D)->lines,
# src/chunk.c:21: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
# src/chunk.c:13:     initValueArray(&chunk->constants);
	mov	rdi, rbp	#, _8
# src/chunk.c:21: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/chunk.c:13:     initValueArray(&chunk->constants);
	jmp	initValueArray@PLT	#
	.cfi_endproc
.LFE13:
	.size	freeChunk, .-freeChunk
	.p2align 4
	.globl	writeChunk
	.type	writeChunk, @function
writeChunk:
.LFB14:
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
# src/chunk.c:24:     if (chunk->capacity < chunk->count + 1) {
	movsxd	rdx, DWORD PTR [rdi]	#, chunk_39(D)->count
# src/chunk.c:24:     if (chunk->capacity < chunk->count + 1) {
	movsxd	rsi, DWORD PTR 4[rdi]	#, chunk_39(D)->capacity
# src/chunk.c:27:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	mov	rdi, QWORD PTR 8[rdi]	# prephitmp_73, chunk_39(D)->code
# src/chunk.c:24:     if (chunk->capacity < chunk->count + 1) {
	cmp	edx, esi	# _1, _2
	jl	.L6	#,
# src/chunk.c:26:         chunk->capacity = GROW_CAPACITY(oldCapacity);
	cmp	esi, 7	# _2,
	jg	.L16	#,
	mov	edx, 8	# _70,
# src/chunk.c:26:         chunk->capacity = GROW_CAPACITY(oldCapacity);
	mov	eax, 8	# iftmp.0_33,
.L7:
# src/chunk.c:26:         chunk->capacity = GROW_CAPACITY(oldCapacity);
	mov	DWORD PTR 4[rbx], eax	# chunk_39(D)->capacity, iftmp.0_33
	mov	DWORD PTR 12[rsp], ecx	# %sfp, byte
# src/chunk.c:27:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	call	reallocate@PLT	#
# src/chunk.c:27:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	mov	QWORD PTR 8[rbx], rax	# chunk_39(D)->code, prephitmp_73
# src/chunk.c:30:     chunk->code[chunk->count] = byte;
	movsxd	rdx, DWORD PTR [rbx]	#, chunk_39(D)->count
	mov	ecx, DWORD PTR 12[rsp]	# byte, %sfp
# src/chunk.c:27:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	mov	rdi, rax	# prephitmp_73, prephitmp_73
.L6:
# src/chunk.c:30:     chunk->code[chunk->count] = byte;
	mov	BYTE PTR [rdi+rdx], cl	# *_10, byte
# src/chunk.c:31:     chunk->count++;
	mov	edx, DWORD PTR [rbx]	# _11, chunk_39(D)->count
# src/chunk.c:33:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	mov	rdi, QWORD PTR 24[rbx]	# prephitmp_85, chunk_39(D)->lines
# src/chunk.c:31:     chunk->count++;
	lea	eax, 1[rdx]	# tmp132,
	mov	DWORD PTR [rbx], eax	# chunk_39(D)->count, tmp132
# src/chunk.c:33:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	movsxd	rax, DWORD PTR 16[rbx]	#, chunk_39(D)->lineCount
# src/chunk.c:33:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	test	eax, eax	# _13
	jle	.L8	#,
# src/chunk.c:33:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	movsxd	rcx, eax	# _15, _13
# src/chunk.c:33:     if (chunk->lineCount > 0 && chunk->lines[chunk->lineCount - 1].line == line) {
	cmp	DWORD PTR -4[rdi+rcx*8], ebp	# _17->line, line
	je	.L14	#,
.L8:
# src/chunk.c:37:     if (chunk->lineCapacity < chunk->lineCount + 1) {
	movsxd	rsi, DWORD PTR 20[rbx]	#, chunk_39(D)->lineCapacity
# src/chunk.c:37:     if (chunk->lineCapacity < chunk->lineCount + 1) {
	cmp	eax, esi	# _13, _19
	jl	.L10	#,
# src/chunk.c:39:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	cmp	esi, 7	# _19,
	jle	.L13	#,
# src/chunk.c:39:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	lea	eax, [rsi+rsi]	# iftmp.1_34,
# src/chunk.c:40:         chunk->lines = GROW_ARRAY(LineStart, chunk->lines, oldCapacity, chunk->lineCapacity);
	movsxd	rdx, eax	# _81, iftmp.1_34
	sal	rdx, 3	# _83,
.L11:
# src/chunk.c:39:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	mov	DWORD PTR 20[rbx], eax	# chunk_39(D)->lineCapacity, iftmp.1_34
# src/chunk.c:40:         chunk->lines = GROW_ARRAY(LineStart, chunk->lines, oldCapacity, chunk->lineCapacity);
	sal	rsi, 3	# _23,
	call	reallocate@PLT	#
# src/chunk.c:44:     lineStart->offset = chunk->count - 1;
	mov	ecx, DWORD PTR [rbx]	# tmp148, chunk_39(D)->count
# src/chunk.c:40:         chunk->lines = GROW_ARRAY(LineStart, chunk->lines, oldCapacity, chunk->lineCapacity);
	mov	QWORD PTR 24[rbx], rax	# chunk_39(D)->lines, prephitmp_85
# src/chunk.c:40:         chunk->lines = GROW_ARRAY(LineStart, chunk->lines, oldCapacity, chunk->lineCapacity);
	mov	rdi, rax	# prephitmp_85, prephitmp_85
# src/chunk.c:43:     LineStart* lineStart = &chunk->lines[chunk->lineCount++];
	movsxd	rax, DWORD PTR 16[rbx]	#, chunk_39(D)->lineCount
# src/chunk.c:44:     lineStart->offset = chunk->count - 1;
	lea	edx, -1[rcx]	# _11,
.L10:
# src/chunk.c:43:     LineStart* lineStart = &chunk->lines[chunk->lineCount++];
	lea	ecx, 1[rax]	# tmp139,
	mov	DWORD PTR 16[rbx], ecx	# chunk_39(D)->lineCount, tmp139
# src/chunk.c:44:     lineStart->offset = chunk->count - 1;
	mov	DWORD PTR [rdi+rax*8], edx	# lineStart_54->offset, _11
# src/chunk.c:45:     lineStart->line = line;
	mov	DWORD PTR 4[rdi+rax*8], ebp	# lineStart_54->line, line
.L14:
# src/chunk.c:46: }
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
.L16:
	.cfi_restore_state
# src/chunk.c:26:         chunk->capacity = GROW_CAPACITY(oldCapacity);
	lea	eax, [rsi+rsi]	# iftmp.0_33,
# src/chunk.c:27:         chunk->code = GROW_ARRAY(uint8_t, chunk->code, oldCapacity, chunk->capacity);
	movsxd	rdx, eax	# _70, iftmp.0_33
	jmp	.L7	#
	.p2align 4,,10
	.p2align 3
.L13:
	mov	edx, 64	# _83,
# src/chunk.c:39:         chunk->lineCapacity = GROW_CAPACITY(oldCapacity);
	mov	eax, 8	# iftmp.1_34,
	jmp	.L11	#
	.cfi_endproc
.LFE14:
	.size	writeChunk, .-writeChunk
	.p2align 4
	.globl	addConstant
	.type	addConstant, @function
addConstant:
.LFB15:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/chunk.c:48: int addConstant(Chunk* chunk, Value value) {
	mov	rbx, rdi	# chunk, chunk
# src/chunk.c:49:     writeValueArray(&chunk->constants, value);
	lea	rdi, 32[rdi]	# _1,
	call	writeValueArray@PLT	#
# src/chunk.c:50:     return chunk->constants.count - 1;
	mov	eax, DWORD PTR 36[rbx]	# chunk_3(D)->constants.count, chunk_3(D)->constants.count
# src/chunk.c:51: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/chunk.c:50:     return chunk->constants.count - 1;
	sub	eax, 1	# _6,
# src/chunk.c:51: }
	ret	
	.cfi_endproc
.LFE15:
	.size	addConstant, .-addConstant
	.p2align 4
	.globl	writeConstant
	.type	writeConstant, @function
writeConstant:
.LFB16:
	.cfi_startproc
	push	r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12d, ecx	# line, line
	push	rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	rbp, rdi	# chunk, chunk
# src/chunk.c:49:     writeValueArray(&chunk->constants, value);
	lea	rdi, 32[rdi]	# _15,
# src/chunk.c:53: void writeConstant(Chunk* chunk, Value value, int line) {
	push	rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 48
# src/chunk.c:49:     writeValueArray(&chunk->constants, value);
	call	writeValueArray@PLT	#
# src/chunk.c:50:     return chunk->constants.count - 1;
	mov	eax, DWORD PTR 36[rbp]	# tmp128, chunk_5(D)->constants.count
# src/chunk.c:56:         writeChunk(chunk, OP_CONSTANT, line);
	mov	edx, r12d	#, line
# src/chunk.c:50:     return chunk->constants.count - 1;
	lea	ebx, -1[rax]	# _17,
# src/chunk.c:55:     if (index < 256) {
	cmp	ebx, 255	# _17,
	jg	.L20	#,
# src/chunk.c:56:         writeChunk(chunk, OP_CONSTANT, line);
	xor	esi, esi	#
	mov	rdi, rbp	#, chunk
	call	writeChunk	#
# src/chunk.c:57:         writeChunk(chunk, (uint8_t) index, line);
	mov	edx, r12d	#, line
	movzx	esi, bl	#, _17
.L22:
# src/chunk.c:64: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	#
	.cfi_def_cfa_offset 32
# src/chunk.c:62:         writeChunk(chunk, (uint8_t) ((index >> 16) & 0xff), line);
	mov	rdi, rbp	#, chunk
# src/chunk.c:64: }
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
# src/chunk.c:62:         writeChunk(chunk, (uint8_t) ((index >> 16) & 0xff), line);
	jmp	writeChunk	#
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
# src/chunk.c:59:         writeChunk(chunk, OP_CONSTANT_LONG, line);
	mov	esi, 1	#,
	mov	rdi, rbp	#, chunk
	call	writeChunk	#
# src/chunk.c:60:         writeChunk(chunk, (uint8_t) (index & 0xff), line);
	movzx	esi, bl	#, _17
	mov	edx, r12d	#, line
	mov	rdi, rbp	#, chunk
	call	writeChunk	#
# src/chunk.c:61:         writeChunk(chunk, (uint8_t) ((index >> 8) & 0xff), line);
	movzx	esi, bh	# _7, _17
	mov	edx, r12d	#, line
	mov	rdi, rbp	#, chunk
# src/chunk.c:62:         writeChunk(chunk, (uint8_t) ((index >> 16) & 0xff), line);
	sar	ebx, 16	# _2,
# src/chunk.c:61:         writeChunk(chunk, (uint8_t) ((index >> 8) & 0xff), line);
	call	writeChunk	#
# src/chunk.c:62:         writeChunk(chunk, (uint8_t) ((index >> 16) & 0xff), line);
	movzx	esi, bl	# _6, _2
	mov	edx, r12d	#, line
	jmp	.L22	#
	.cfi_endproc
.LFE16:
	.size	writeConstant, .-writeConstant
	.p2align 4
	.globl	getLine
	.type	getLine, @function
getLine:
.LFB17:
	.cfi_startproc
# src/chunk.c:68:     int end = chunk->lineCount - 1;
	mov	eax, DWORD PTR 16[rdi]	# tmp126, chunk_16(D)->lineCount
# src/chunk.c:72:         LineStart* line = &chunk->lines[mid];
	mov	rdi, QWORD PTR 24[rdi]	# _3, chunk_16(D)->lines
# src/chunk.c:68:     int end = chunk->lineCount - 1;
	lea	r10d, -1[rax]	# end,
# src/chunk.c:66: int getLine(Chunk* chunk, int instruction) {
	mov	r8d, esi	# instruction, instruction
# src/chunk.c:67:     int start = 0;
	xor	r9d, r9d	# start
# src/chunk.c:68:     int end = chunk->lineCount - 1;
	mov	esi, r10d	# end, end
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L24:
# src/chunk.c:71:         int mid = (start + end) / 2;
	lea	edx, [r9+rsi]	# _2,
# src/chunk.c:71:         int mid = (start + end) / 2;
	mov	eax, edx	# tmp117, _2
	shr	eax, 31	# tmp117,
	add	eax, edx	# tmp118, _2
	sar	eax	# mid_18
# src/chunk.c:72:         LineStart* line = &chunk->lines[mid];
	movsxd	rdx, eax	# _4, mid_18
# src/chunk.c:72:         LineStart* line = &chunk->lines[mid];
	lea	rcx, [rdi+rdx*8]	# line,
# src/chunk.c:73:         if (instruction < line->offset) {
	cmp	DWORD PTR [rcx], r8d	# line_19->offset, instruction
	jle	.L25	#,
# src/chunk.c:74:             end = mid - 1;
	lea	esi, -1[rax]	# end,
	jmp	.L24	#
	.p2align 4,,10
	.p2align 3
.L25:
# src/chunk.c:75:         } else if (mid == chunk->lineCount - 1 || instruction < chunk->lines[mid + 1].offset) {
	cmp	r10d, eax	# end, mid_18
	je	.L28	#,
# src/chunk.c:75:         } else if (mid == chunk->lineCount - 1 || instruction < chunk->lines[mid + 1].offset) {
	cmp	DWORD PTR 8[rdi+rdx*8], r8d	# _11->offset, instruction
	jg	.L28	#,
# src/chunk.c:78:             start = mid + 1;
	lea	r9d, 1[rax]	# start,
	jmp	.L24	#
	.p2align 4,,10
	.p2align 3
.L28:
# src/chunk.c:76:             return line->line;
	mov	eax, DWORD PTR 4[rcx]	# line_19->line, line_19->line
# src/chunk.c:81: }
	ret	
	.cfi_endproc
.LFE17:
	.size	getLine, .-getLine
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
