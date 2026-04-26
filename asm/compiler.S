	.file	"compiler.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=4096 -mtune=arrowlake-s -masm=intel -O3
	.text
	.p2align 4
	.type	number, @function
number:
.LFB49:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/compiler.c:310:     double value = strtod(parser.previous.start, NULL);
	mov	rdi, QWORD PTR parser[rip+32]	#, parser.previous.start
	xor	esi, esi	#
	call	strtod@PLT	#
# src/compiler.c:311:     emitConstant(NUMBER_VAL(value));
	mov	eax, 2	# D.5216,
	mov	rsi, rax	# value, D.5216
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	ecx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_8->function, current.0_8->function
	vmovq	rdx, xmm0	# D.5216, value
	add	rdi, 24	# _10,
# src/compiler.c:312: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	jmp	writeConstant@PLT	#
	.cfi_endproc
.LFE49:
	.size	number, .-number
	.p2align 4
	.type	string, @function
string:
.LFB52:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/compiler.c:346:     emitConstant(OBJ_VAL(copyString(parser.previous.start + 1, parser.previous.length - 2)));
	mov	eax, DWORD PTR parser[rip+40]	# tmp128, parser.previous.length
	lea	esi, -2[rax]	# _2,
	mov	rax, QWORD PTR parser[rip+32]	# tmp129, parser.previous.start
	lea	rdi, 1[rax]	# _4,
	call	copyString@PLT	#
	mov	rcx, rax	# _5,
	mov	eax, 3	# D.5232,
	mov	rsi, rax	# value, D.5232
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, rcx	# D.5232, _5
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_11->function, current.0_11->function
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	ecx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _13,
# src/compiler.c:347: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	jmp	writeConstant@PLT	#
	.cfi_endproc
.LFE52:
	.size	string, .-string
	.p2align 4
	.type	literal, @function
literal:
.LFB47:
	.cfi_startproc
# src/compiler.c:296:     switch (parser.previous.type) {
	mov	eax, DWORD PTR parser[rip+24]	# _1, parser.previous.type
# src/compiler.c:296:     switch (parser.previous.type) {
	cmp	eax, 43	# _1,
	je	.L7	#,
	cmp	eax, 50	# _1,
	je	.L8	#,
	cmp	eax, 39	# _1,
	jne	.L10	#,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_17->function, current.0_17->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 4	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _19,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L8:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_11->function, current.0_11->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 3	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _13,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L7:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_6->function, current.0_6->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 2	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _8,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L10:
# src/compiler.c:302: }
	ret	
	.cfi_endproc
.LFE47:
	.size	literal, .-literal
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"[line %04d] Error"
.LC1:
	.string	" at end"
.LC2:
	.string	" at '%.*s'"
.LC3:
	.string	": %s\n"
	.text
	.p2align 4
	.type	advance, @function
advance:
.LFB27:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	r14	#
	push	r13	#
	push	r12	#
	push	rbx	#
	and	rsp, -32	#,
	sub	rsp, 64	#,
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
# src/compiler.c:109:     parser.previous = parser.current;
	mov	rbx, QWORD PTR fs:40	# tmp141, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 56[rsp], rbx	# D.6200, tmp141
	lea	rbx, parser[rip]	# tmp141,
	vmovdqa	xmm0, XMMWORD PTR parser[rip]	# parser.current, parser.current
	vmovdqu	XMMWORD PTR parser[rip+24], xmm0	# parser.previous, parser.current
	mov	rax, QWORD PTR 16[rbx]	# parser.current, parser.current
	mov	QWORD PTR parser[rip+40], rax	# parser.previous, parser.current
	.p2align 4,,10
	.p2align 3
.L13:
# src/compiler.c:112:         parser.current = scanToken();
	mov	rdi, rsp	#,
	call	scanToken@PLT	#
	vmovdqu	xmm1, XMMWORD PTR [rsp]	# tmp151,
	vmovdqa	XMMWORD PTR [rbx], xmm1	# parser.current, tmp151
	mov	rax, QWORD PTR 16[rsp]	# tmp119,
	mov	QWORD PTR 16[rbx], rax	# parser.current, tmp119
# src/compiler.c:113:         if (parser.current.type != TOKEN_ERROR) break;
	cmp	DWORD PTR [rsp], 52	#,
	jne	.L11	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbx], 0	# parser.panicMode,
	jne	.L13	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR 20[rbx]	# parser.line, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:115:         errorAtCurrent(parser.current.start);
	mov	r14, QWORD PTR 8[rbx]	# _2, parser.current.start
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR [rbx]	# _12, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _12,
	je	.L24	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _12,
	je	.L15	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 8[rbx]	# parser.start, parser.start
	mov	edx, DWORD PTR 16[rbx]	# parser.length, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L15:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	mov	rdx, r14	#, _2
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L13	#
	.p2align 4,,10
	.p2align 3
.L24:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L15	#
	.p2align 4,,10
	.p2align 3
.L11:
# src/compiler.c:117: }
	mov	rax, QWORD PTR 56[rsp]	# tmp149, D.6200
	sub	rax, QWORD PTR fs:40	# tmp149, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L25	#,
	lea	rsp, -32[rbp]	#,
	pop	rbx	#
	pop	r12	#
	pop	r13	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L25:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE27:
	.size	advance, .-advance
	.p2align 4
	.type	consume, @function
consume:
.LFB28:
	.cfi_startproc
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], edi	# parser.current.type, type
	je	.L39	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L40	#,
	ret	
	.p2align 4,,10
	.p2align 3
.L40:
# src/compiler.c:119: static void consume(TokenType type, const char* message) {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	mov	rbx, rsi	# message, message
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _11, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _11,
	je	.L41	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _11,
	jne	.L42	#,
.L30:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	mov	rdx, rbx	#, message
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:126: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L42:
	.cfi_restore_state
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L30	#
	.p2align 4,,10
	.p2align 3
.L39:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/compiler.c:121:         advance();
	jmp	advance	#
	.p2align 4,,10
	.p2align 3
.L41:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L30	#
	.cfi_endproc
.LFE28:
	.size	consume, .-consume
	.p2align 4
	.type	consume.constprop.0, @function
consume.constprop.0:
.LFB105:
	.cfi_startproc
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], 1	# parser.current.type,
	je	.L56	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L57	#,
	ret	
	.p2align 4,,10
	.p2align 3
.L57:
# src/compiler.c:119: static void consume(TokenType type, const char* message) {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	mov	rbx, rdi	# message, message
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _10, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _10,
	je	.L58	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _10,
	jne	.L59	#,
.L47:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	mov	rdx, rbx	#, message
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:126: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L59:
	.cfi_restore_state
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L47	#
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/compiler.c:121:         advance();
	jmp	advance	#
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L47	#
	.cfi_endproc
.LFE105:
	.size	consume.constprop.0, .-consume.constprop.0
	.p2align 4
	.type	consume.constprop.1, @function
consume.constprop.1:
.LFB104:
	.cfi_startproc
# src/compiler.c:120:     if (parser.current.type == type) {
	mov	eax, DWORD PTR parser[rip]	#, parser.current.type
	test	eax, eax	#
	je	.L73	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L74	#,
	ret	
	.p2align 4,,10
	.p2align 3
.L74:
# src/compiler.c:119: static void consume(TokenType type, const char* message) {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	mov	rbx, rdi	# message, message
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _10, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _10,
	je	.L75	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _10,
	jne	.L76	#,
.L64:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	mov	rdx, rbx	#, message
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:126: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L64	#
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/compiler.c:121:         advance();
	jmp	advance	#
	.p2align 4,,10
	.p2align 3
.L75:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L64	#
	.cfi_endproc
.LFE104:
	.size	consume.constprop.1, .-consume.constprop.1
	.p2align 4
	.type	consume.constprop.2, @function
consume.constprop.2:
.LFB103:
	.cfi_startproc
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], 10	# parser.current.type,
	je	.L90	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L91	#,
	ret	
	.p2align 4,,10
	.p2align 3
.L91:
# src/compiler.c:119: static void consume(TokenType type, const char* message) {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	mov	rbx, rdi	# message, message
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _10, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _10,
	je	.L92	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _10,
	jne	.L93	#,
.L81:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	mov	rdx, rbx	#, message
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:126: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L93:
	.cfi_restore_state
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L81	#
	.p2align 4,,10
	.p2align 3
.L90:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/compiler.c:121:         advance();
	jmp	advance	#
	.p2align 4,,10
	.p2align 3
.L92:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L81	#
	.cfi_endproc
.LFE103:
	.size	consume.constprop.2, .-consume.constprop.2
	.section	.rodata.str1.1
.LC4:
	.string	"Too much code to jump over."
	.text
	.p2align 4
	.type	patchJump, @function
patchJump:
.LFB39:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movsxd	rbp, edi	#, offset
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rax, QWORD PTR 8[rax]	# _16, current.0_18->function
# src/compiler.c:184:     int jump = currentChunk()->count - offset - 2;
	mov	ebx, DWORD PTR 24[rax]	# _2, MEM[(struct Chunk *)_16 + 24B].count
	sub	ebx, ebp	# _2, offset
# src/compiler.c:184:     int jump = currentChunk()->count - offset - 2;
	sub	ebx, 2	# jump,
# src/compiler.c:186:     if (jump > UINT16_MAX) {
	cmp	ebx, 65535	# jump,
	jle	.L95	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L102	#,
.L95:
# src/compiler.c:190:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)prephitmp_49 + 24B].code, MEM[(struct Chunk *)prephitmp_49 + 24B].code
	mov	BYTE PTR [rax+rbp], bh	# *_6, jump
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:191:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 8[rax]	# current.0_21->function, current.0_21->function
# src/compiler.c:191:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)_22 + 24B].code, MEM[(struct Chunk *)_22 + 24B].code
	mov	BYTE PTR 1[rax+rbp], bl	# *_10, jump
# src/compiler.c:192: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L102:
	.cfi_restore_state
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _28, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _28,
	je	.L103	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _28,
	je	.L97	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L97:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC4[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _16, pretmp_46->function
	jmp	.L95	#
	.p2align 4,,10
	.p2align 3
.L103:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L97	#
	.cfi_endproc
.LFE39:
	.size	patchJump, .-patchJump
	.section	.rodata.str1.1
.LC5:
	.string	"Loop body too large."
	.text
	.p2align 4
	.type	emitLoop, @function
emitLoop:
.LFB34:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ebp, edi	# loopStart, loopStart
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 33	#,
# src/compiler.c:154: static void emitLoop(int loopStart) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_13->function, current.0_13->function
	add	rdi, 24	# _15,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _10, current.0_6->function
# src/compiler.c:157:     int offset = currentChunk()->count - loopStart + 2;
	mov	ebx, DWORD PTR 24[rdi]	# _2, MEM[(struct Chunk *)_10 + 24B].count
	sub	ebx, ebp	# _2, loopStart
# src/compiler.c:157:     int offset = currentChunk()->count - loopStart + 2;
	add	ebx, 2	# offset,
# src/compiler.c:158:     if (offset > UINT16_MAX) error("Loop body too large.");
	cmp	ebx, 65535	# offset,
	jle	.L105	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L112	#,
.L105:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _9, offset
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _34,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_37->function, current.0_37->function
# src/compiler.c:161: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bl	# _19, offset
# src/compiler.c:161: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _39,
# src/compiler.c:161: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L112:
	.cfi_restore_state
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _22, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _22,
	je	.L113	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _22,
	je	.L107	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L107:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC5[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _10, pretmp_29->function
	jmp	.L105	#
	.p2align 4,,10
	.p2align 3
.L113:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L107	#
	.cfi_endproc
.LFE34:
	.size	emitLoop, .-emitLoop
	.section	.rodata.str1.1
.LC6:
	.string	"Expect expression."
.LC7:
	.string	"Invalid assignment target."
	.text
	.p2align 4
	.type	parsePrecedence, @function
parsePrecedence:
.LFB61:
	.cfi_startproc
	push	r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12d, edi	# precedence, precedence
	push	rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
# src/compiler.c:568:     ParseFn prefixRule = getRule(parser.previous.type)->prefix;
	lea	rbx, rules[rip]	# tmp206,
# src/compiler.c:566: static void parsePrecedence(Precedence precedence) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 48
# src/compiler.c:567:     advance();
	call	advance	#
# src/compiler.c:568:     ParseFn prefixRule = getRule(parser.previous.type)->prefix;
	mov	eax, DWORD PTR parser[rip+24]	# parser.previous.type, parser.previous.type
	lea	rax, [rax+rax*2]	# tmp133,
	mov	rax, QWORD PTR [rbx+rax*8]	# prefixRule, MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][_1].prefix
# src/compiler.c:569:     if (prefixRule == NULL) {
	test	rax, rax	# prefixRule
	je	.L134	#,
# src/compiler.c:574:     bool canAssign = precedence <= PREC_ASSIGNMENT;
	xor	r13d, r13d	# _2
	cmp	r12d, 1	# precedence,
	setbe	r13b	#, _2
# src/compiler.c:575:     prefixRule(canAssign);
	mov	edi, r13d	#, _2
	call	rax	# prefixRule
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR parser[rip]	#, parser.current.type
	mov	rdx, rax	#,
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	lea	rax, [rax+rax*2]	# tmp160,
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	cmp	DWORD PTR 16[rbx+rax*8], r12d	# MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][_54].precedence, precedence
	jb	.L120	#,
	lea	rbp, parser[rip]	# tmp204,
	.p2align 4,,10
	.p2align 3
.L121:
# src/compiler.c:578:         advance();
	call	advance	#
# src/compiler.c:579:         ParseFn infixRule = getRule(parser.previous.type)->infix;
	mov	eax, DWORD PTR 24[rbp]	# parser.previous.type, parser.previous.type
# src/compiler.c:581:         infixRule(canAssign);
	mov	edi, r13d	#, _2
# src/compiler.c:579:         ParseFn infixRule = getRule(parser.previous.type)->infix;
	lea	rax, [rax+rax*2]	# tmp169,
# src/compiler.c:581:         infixRule(canAssign);
	call	[QWORD PTR 8[rbx+rax*8]]	# MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][_3].infix
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR 0[rbp]	#, parser.current.type
	mov	rdx, rax	#,
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	lea	rax, [rax+rax*2]	# tmp179,
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	cmp	DWORD PTR 16[rbx+rax*8], r12d	# MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][_4].precedence, precedence
	jnb	.L121	#,
.L120:
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	r12d, 1	# precedence,
	jne	.L132	#,
	cmp	edx, 21	# _4,
	je	.L135	#,
.L132:
# src/compiler.c:587: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L135:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L132	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _33, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _33,
	je	.L136	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _33,
	je	.L124	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L124:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC7[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L132	#
	.p2align 4,,10
	.p2align 3
.L134:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L132	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _25, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _25,
	je	.L137	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _25,
	jne	.L138	#,
.L119:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC6[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L132	#
.L138:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L119	#
.L137:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L119	#
.L136:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L124	#
	.cfi_endproc
.LFE61:
	.size	parsePrecedence, .-parsePrecedence
	.p2align 4
	.type	unary, @function
unary:
.LFB60:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:502:     TokenType operatorType = parser.previous.type;
	mov	ebx, DWORD PTR parser[rip+24]	# operatorType, parser.previous.type
# src/compiler.c:504:     parsePrecedence(PREC_UNARY);
	mov	edi, 9	#,
	call	parsePrecedence	#
# src/compiler.c:506:     switch(operatorType) {
	cmp	ebx, 7	# operatorType,
	je	.L140	#,
	cmp	ebx, 19	# operatorType,
	je	.L144	#,
# src/compiler.c:511: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L144:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_7->function, current.0_7->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 27	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _9,
# src/compiler.c:511: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L140:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_13->function, current.0_13->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 28	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _15,
# src/compiler.c:511: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.cfi_endproc
.LFE60:
	.size	unary, .-unary
	.p2align 4
	.type	emitGet, @function
emitGet:
.LFB53:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, sil	# _38, instruction
	movzx	ebp, dil	# _50, arg
# src/compiler.c:349: static void emitGet(int arg, uint8_t instruction, bool longOp) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	ebx, edi	# arg, arg
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:81:     return &current->function->chunk;
	mov	rcx, QWORD PTR current[rip]	# current, current
# src/compiler.c:350:     if (longOp) {
	test	dl, dl	# longOp
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rcx]	# pretmp_28, pretmp_33->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	# pretmp_43, parser.previous.line
# src/compiler.c:350:     if (longOp) {
	je	.L146	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _26,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_29->function,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, ebp	#, _50
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _31,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_34->function, current.0_34->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bh	# _17, arg
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _36,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:368:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebx, 16	# _12,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_39->function, current.0_39->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:360: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bl	# _18, _12
# src/compiler.c:360: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _41,
# src/compiler.c:360: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L146:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _48,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_51->function,
# src/compiler.c:360: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, ebp	#, _50
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _53,
# src/compiler.c:360: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.cfi_endproc
.LFE53:
	.size	emitGet, .-emitGet
	.set	emitSet,emitGet
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"Already a variable with this name in this scope."
	.align 8
.LC9:
	.string	"Too many local variables currently in scope."
	.text
	.p2align 4
	.type	parseVariable, @function
parseVariable:
.LFB67:
	.cfi_startproc
	push	r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	mov	rsi, rdi	# errorMessage, errorMessage
# src/compiler.c:644:     consume(TOKEN_IDENTIFIER, errorMessage);
	mov	edi, 27	#,
# src/compiler.c:643: static int parseVariable(const char* errorMessage) {
	push	r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
# src/compiler.c:644:     consume(TOKEN_IDENTIFIER, errorMessage);
	call	consume	#
# src/compiler.c:625:     if (current->scopeDepth == 0) return;
	mov	r13, QWORD PTR current[rip]	# prephitmp_120, current
# src/compiler.c:625:     if (current->scopeDepth == 0) return;
	mov	edx, DWORD PTR 536870940[r13]	#, current.54_11->scopeDepth
	test	edx, edx	#
	je	.L161	#,
# src/compiler.c:629:     for (int i = current->localCount - 1; i >= 0; i--) {
	movsxd	rax, DWORD PTR 536870936[r13]	#, current.54_11->localCount
	mov	r12, QWORD PTR parser[rip+32]	# name$start, MEM <const char *> [(struct Token *)&parser + 32B]
# src/compiler.c:629:     for (int i = current->localCount - 1; i >= 0; i--) {
	mov	ebx, eax	# i, _36
	sub	ebx, 1	# i,
	mov	r14d, DWORD PTR parser[rip+40]	# name$length, MEM <int> [(struct Token *)&parser + 40B]
	js	.L150	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	lea	rbp, parser[rip]	# tmp217,
	.p2align 4,,10
	.p2align 3
.L156:
	movsxd	rax, ebx	# _100, i
	sal	rax, 5	# _118,
	add	rax, r13	# _136, prephitmp_120
# src/compiler.c:631:         if (local->depth != -1 && local->depth < current->scopeDepth) {
	mov	edx, DWORD PTR 48[rax]	# _17, MEM <int> [(struct Local *)_136 + 48B]
# src/compiler.c:631:         if (local->depth != -1 && local->depth < current->scopeDepth) {
	cmp	edx, -1	# _17,
	je	.L151	#,
# src/compiler.c:631:         if (local->depth != -1 && local->depth < current->scopeDepth) {
	cmp	edx, DWORD PTR 536870940[r13]	# _17, prephitmp_120->scopeDepth
	jl	.L152	#,
.L151:
# src/compiler.c:594:     if (a->length != b->length) return false;
	cmp	DWORD PTR 40[rax], r14d	# MEM <int> [(struct Token *)_136 + 40B], name$length
	jne	.L153	#,
# src/compiler.c:595:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR 32[rax]	# MEM <const char *> [(struct Token *)_136 + 32B], MEM <const char *> [(struct Token *)_136 + 32B]
	movsxd	rdx, r14d	# _21, name$length
	mov	rdi, r12	#, name$start
	call	memcmp@PLT	#
# src/compiler.c:635:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# tmp223
	jne	.L153	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbp], 0	# parser.panicMode,
	jne	.L153	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR 44[rbp]	# pretmp_151, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[rbp]	# _29, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _29,
	je	.L175	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _29,
	jne	.L176	#,
.L155:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC8[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	mov	r12, QWORD PTR 32[rbp]	# name$start, MEM <const char *> [(struct Token *)&parser + 32B]
	mov	r14d, DWORD PTR 40[rbp]	# name$length, MEM <int> [(struct Token *)&parser + 40B]
# src/compiler.c:614:     if (current->localCount >= LOCAL_COUNT) {
	mov	r13, QWORD PTR current[rip]	# prephitmp_120, current
	.p2align 4,,10
	.p2align 3
.L153:
# src/compiler.c:629:     for (int i = current->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# i,
	jnb	.L156	#,
.L152:
# src/compiler.c:614:     if (current->localCount >= LOCAL_COUNT) {
	movsxd	rax, DWORD PTR 536870936[r13]	#, prephitmp_131->localCount
	mov	edx, DWORD PTR parser[rip+44]	# name$line, MEM <int> [(struct Token *)&parser + 44B]
# src/compiler.c:614:     if (current->localCount >= LOCAL_COUNT) {
	cmp	eax, 16777215	# _36,
	jg	.L177	#,
	mov	esi, DWORD PTR parser[rip+24]	# name, MEM <unsigned int> [(struct Token *)&parser + 24B]
.L162:
# src/compiler.c:619:     Local* local = &current->locals[current->localCount++];
	lea	ecx, 1[rax]	# tmp201,
# src/compiler.c:620:     local->name = name;
	sal	rax, 5	# _84,
# src/compiler.c:619:     Local* local = &current->locals[current->localCount++];
	mov	DWORD PTR 536870936[r13], ecx	# current.58_112->localCount, tmp201
# src/compiler.c:620:     local->name = name;
	vmovd	xmm1, r14d	# name$length, name$length
	mov	DWORD PTR 24[r13+rax], esi	# MEM <unsigned int> [(struct  *)_59], name
	mov	QWORD PTR 32[r13+rax], r12	# MEM <const char *> [(struct  *)_59 + 8B], name$start
# src/compiler.c:621:     local->depth = -1;
	mov	DWORD PTR 48[r13+rax], -1	# MEM <struct Compiler> [(struct Local *)current.58_112].locals[_113].depth,
# src/compiler.c:620:     local->name = name;
	vpinsrd	xmm0, xmm1, edx, 1	# _62, name$length, name$line
	vmovq	QWORD PTR 40[r13+rax], xmm0	# MEM <vector(2) int> [(struct  *)_59 + 16B], _62
.L158:
# src/compiler.c:647:     if (current->scopeDepth > 0) return 0;
	mov	eax, DWORD PTR 536870940[r13]	#, prephitmp_140->scopeDepth
	test	eax, eax	#
	jle	.L161	#,
# src/compiler.c:650: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbp	#
	.cfi_def_cfa_offset 32
	pop	r12	#
	.cfi_def_cfa_offset 24
	pop	r13	#
	.cfi_def_cfa_offset 16
	xor	eax, eax	#
	pop	r14	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L176:
	.cfi_restore_state
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[rbp]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[rbp]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L155	#
	.p2align 4,,10
	.p2align 3
.L177:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L158	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _41, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _41,
	je	.L178	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _41,
	jne	.L179	#,
.L160:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC9[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:647:     if (current->scopeDepth > 0) return 0;
	mov	r13, QWORD PTR current[rip]	# prephitmp_120, current
	jmp	.L158	#
	.p2align 4,,10
	.p2align 3
.L161:
# src/compiler.c:590:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR parser[rip+40]	#, MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR parser[rip+32]	#, MEM[(const char * *)&parser + 32B]
	call	copyString@PLT	#
	mov	rcx, rax	# _53,
	mov	eax, 3	# D.6352,
# src/compiler.c:650: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	mov	rsi, rax	# value, D.6352
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:650: }
	pop	rbp	#
	.cfi_def_cfa_offset 32
	pop	r12	#
	.cfi_def_cfa_offset 24
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_54->function, current.0_54->function
# src/compiler.c:650: }
	pop	r13	#
	.cfi_def_cfa_offset 16
	mov	rdx, rcx	# D.6352, _53
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _56,
# src/compiler.c:650: }
	pop	r14	#
	.cfi_def_cfa_offset 8
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	jmp	addConstant@PLT	#
	.p2align 4,,10
	.p2align 3
.L175:
	.cfi_restore_state
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L155	#
.L179:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L160	#
.L150:
	mov	edx, DWORD PTR parser[rip+44]	# name$line, MEM <int> [(struct Token *)&parser + 44B]
	mov	esi, DWORD PTR parser[rip+24]	# name, MEM <unsigned int> [(struct Token *)&parser + 24B]
	jmp	.L162	#
.L178:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L160	#
	.cfi_endproc
.LFE67:
	.size	parseVariable, .-parseVariable
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Expect property name after '.'."
	.text
	.p2align 4
	.type	dot, @function
dot:
.LFB46:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/compiler.c:281:     consume(TOKEN_IDENTIFIER, "Expect property name after '.'.");
	lea	rsi, .LC10[rip]	#,
# src/compiler.c:280: static void dot(bool canAssign) {
	mov	ebp, edi	# canAssign, canAssign
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
# src/compiler.c:281:     consume(TOKEN_IDENTIFIER, "Expect property name after '.'.");
	mov	edi, 27	#,
# src/compiler.c:280: static void dot(bool canAssign) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:281:     consume(TOKEN_IDENTIFIER, "Expect property name after '.'.");
	call	consume	#
# src/compiler.c:590:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR parser[rip+40]	#, MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR parser[rip+32]	#, MEM[(const char * *)&parser + 32B]
	call	copyString@PLT	#
	mov	rcx, rax	# _16,
	mov	eax, 3	# D.6381,
	mov	rsi, rax	# value, D.6381
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, rcx	# D.6381, _16
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_17->function, current.0_17->function
	add	rdi, 24	# _19,
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	call	addConstant@PLT	#
# src/compiler.c:285:     if (canAssign && match(TOKEN_EQUAL)) {
	test	bpl, bpl	# canAssign
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	mov	ebx, eax	# _20,
# src/compiler.c:285:     if (canAssign && match(TOKEN_EQUAL)) {
	je	.L181	#,
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR parser[rip], 21	# parser.current.type,
	je	.L184	#,
.L181:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	# pretmp_65, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_36, pretmp_64->function
	movzx	ebp, bl	# _35, _20
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _26,
# src/compiler.c:288:         if (name < 256)
	cmp	ebx, 255	# _20,
	jg	.L182	#,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 18	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_29->function, current.0_29->function
# src/compiler.c:293: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, ebp	#, _35
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _31,
# src/compiler.c:293: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L182:
	.cfi_restore_state
	mov	esi, 19	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_49->function, current.0_49->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, ebp	#, _35
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _51,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_54->function, current.0_54->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bh	# _37, _20
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _56,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:368:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebx, 16	# _32,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_59->function, current.0_59->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:293: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bl	# _38, _32
# src/compiler.c:293: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _61,
# src/compiler.c:293: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L184:
	.cfi_restore_state
# src/compiler.c:293: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:134:     advance();
	jmp	advance	#
	.cfi_endproc
.LFE46:
	.size	dot, .-dot
	.p2align 4
	.type	parsePrecedence.constprop.0, @function
parsePrecedence.constprop.0:
.LFB111:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
# src/compiler.c:568:     ParseFn prefixRule = getRule(parser.previous.type)->prefix;
	lea	rbx, rules[rip]	# tmp194,
# src/compiler.c:566: static void parsePrecedence(Precedence precedence) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:567:     advance();
	call	advance	#
# src/compiler.c:568:     ParseFn prefixRule = getRule(parser.previous.type)->prefix;
	mov	eax, DWORD PTR parser[rip+24]	# parser.previous.type, parser.previous.type
	lea	rax, [rax+rax*2]	# tmp127,
	mov	rax, QWORD PTR [rbx+rax*8]	# prefixRule, MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][_1].prefix
# src/compiler.c:569:     if (prefixRule == NULL) {
	test	rax, rax	# prefixRule
	je	.L205	#,
# src/compiler.c:575:     prefixRule(canAssign);
	mov	edi, 1	#,
	call	rax	# prefixRule
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR parser[rip]	#, parser.current.type
	mov	rdx, rax	#,
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	lea	rax, [rax+rax*2]	# tmp152,
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	ecx, DWORD PTR 16[rbx+rax*8]	#, MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][_4].precedence
	test	ecx, ecx	#
	je	.L191	#,
	lea	rbp, parser[rip]	# tmp192,
	.p2align 4,,10
	.p2align 3
.L192:
# src/compiler.c:578:         advance();
	call	advance	#
# src/compiler.c:579:         ParseFn infixRule = getRule(parser.previous.type)->infix;
	mov	eax, DWORD PTR 24[rbp]	# parser.previous.type, parser.previous.type
# src/compiler.c:581:         infixRule(canAssign);
	mov	edi, 1	#,
# src/compiler.c:579:         ParseFn infixRule = getRule(parser.previous.type)->infix;
	lea	rax, [rax+rax*2]	# tmp161,
# src/compiler.c:581:         infixRule(canAssign);
	call	[QWORD PTR 8[rbx+rax*8]]	# MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][_6].infix
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR 0[rbp]	#, parser.current.type
	mov	rdx, rax	#,
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	lea	rax, [rax+rax*2]	# tmp171,
# src/compiler.c:577:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR 16[rbx+rax*8]	#, MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][_8].precedence
	test	eax, eax	#
	jne	.L192	#,
.L191:
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	edx, 21	# _8,
	je	.L206	#,
.L203:
# src/compiler.c:587: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L206:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L203	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _32, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _32,
	je	.L207	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _32,
	je	.L195	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L195:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC7[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:587: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L205:
	.cfi_restore_state
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L203	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _24, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _24,
	je	.L208	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _24,
	jne	.L209	#,
.L190:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC6[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L203	#
.L209:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L190	#
.L207:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L195	#
.L208:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L190	#
	.cfi_endproc
.LFE111:
	.size	parsePrecedence.constprop.0, .-parsePrecedence.constprop.0
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Cannot have more than 255 arguments."
	.section	.rodata.str1.1
.LC12:
	.string	"Expect ')' after arguments."
	.text
	.p2align 4
	.type	call, @function
call:
.LFB45:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:678:     if (!check(TOKEN_RIGHT_PAREN)) {
	cmp	DWORD PTR parser[rip], 1	# parser.current.type,
	je	.L223	#,
# src/compiler.c:677:     uint8_t argCount = 0;
	xor	ebx, ebx	# argCount
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:681:             if (argCount == 255) {
	cmp	bl, -1	# argCount,
	lea	rbp, parser[rip]	# tmp174,
	je	.L231	#,
	.p2align 4,,10
	.p2align 3
.L212:
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR 0[rbp]	# _21, parser.current.type
# src/compiler.c:684:             argCount++;
	add	ebx, 1	# argCount,
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 4	# _21,
	je	.L232	#,
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	eax, 1	# _21,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	ebx, bl	# prephitmp_70, argCount
# src/compiler.c:120:     if (parser.current.type == type) {
	je	.L211	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L233	#,
.L218:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_9->function, current.0_9->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 34	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _11,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_14->function, current.0_14->function
# src/compiler.c:275: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, ebx	#, prephitmp_70
# src/compiler.c:275: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _16,
# src/compiler.c:275: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L232:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:681:             if (argCount == 255) {
	cmp	bl, -1	# argCount,
	jne	.L212	#,
.L231:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbp], 0	# parser.panicMode,
	jne	.L212	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR 44[rbp]	# MEM[(struct Token *)&parser + 24B].line, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[rbp]	# _26, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _26,
	je	.L234	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _26,
	jne	.L235	#,
.L214:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC11[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L212	#
	.p2align 4,,10
	.p2align 3
.L233:
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _36, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _36,
	je	.L236	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _36,
	jne	.L237	#,
.L221:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC12[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L218	#
	.p2align 4,,10
	.p2align 3
.L235:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[rbp]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[rbp]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L214	#
	.p2align 4,,10
	.p2align 3
.L223:
	xor	ebx, ebx	# prephitmp_70
.L211:
# src/compiler.c:121:         advance();
	call	advance	#
# src/compiler.c:122:         return;
	jmp	.L218	#
	.p2align 4,,10
	.p2align 3
.L237:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L221	#
	.p2align 4,,10
	.p2align 3
.L234:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L214	#
	.p2align 4,,10
	.p2align 3
.L236:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L221	#
	.cfi_endproc
.LFE45:
	.size	call, .-call
	.section	.rodata.str1.1
.LC13:
	.string	"Expect ')' after expression."
	.text
	.p2align 4
	.type	grouping, @function
grouping:
.LFB48:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], 1	# parser.current.type,
	je	.L248	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L249	#,
# src/compiler.c:307: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L249:
	.cfi_restore_state
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _8, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _8,
	je	.L250	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _8,
	jne	.L251	#,
.L242:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC13[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:307: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L251:
	.cfi_restore_state
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L242	#
	.p2align 4,,10
	.p2align 3
.L248:
# src/compiler.c:307: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:121:         advance();
	jmp	advance	#
	.p2align 4,,10
	.p2align 3
.L250:
	.cfi_restore_state
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L242	#
	.cfi_endproc
.LFE48:
	.size	grouping, .-grouping
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"Cannot read local variable in own initializer."
	.text
	.p2align 4
	.type	variable, @function
variable:
.LFB59:
	.cfi_startproc
	push	r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 80
# src/compiler.c:376:     int arg = resolveLocal(current, &name);
	mov	rcx, QWORD PTR current[rip]	# current.39_96, current
# src/compiler.c:497: static void variable(bool canAssign) {
	mov	DWORD PTR 4[rsp], edi	# %sfp, canAssign
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	eax, DWORD PTR 536870936[rcx]	# current.39_96->localCount, current.39_96->localCount
# src/compiler.c:376:     int arg = resolveLocal(current, &name);
	mov	QWORD PTR 8[rsp], rcx	# %sfp, current.39_96
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	ebx, eax	# current.39_96->localCount, current.39_96->localCount
	sub	ebx, 1	# current.39_96->localCount,
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	DWORD PTR [rsp], eax	# %sfp, current.39_96->localCount
	mov	r12, QWORD PTR parser[rip+32]	# name$start, MEM <const char *> [(struct  *)&parser + 32B]
	mov	r14d, DWORD PTR parser[rip+40]	# name$length, MEM <int> [(struct  *)&parser + 40B]
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	js	.L253	#,
	movsxd	rax, ebx	# _120, arg
	sal	rax, 5	# _9,
	lea	rbp, 32[rcx+rax]	# ivtmp.302,
	.p2align 4,,10
	.p2align 3
.L258:
# src/compiler.c:594:     if (a->length != b->length) return false;
	cmp	DWORD PTR 8[rbp], r14d	# MEM[(int *)_29 + 8B], name$length
	jne	.L254	#,
# src/compiler.c:595:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR 0[rbp]	# MEM[(const char * *)_29], MEM[(const char * *)_29]
	movsxd	rdx, r14d	#, name$length
	mov	rdi, r12	#, name$start
	call	memcmp@PLT	#
# src/compiler.c:601:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# _112
# src/compiler.c:595:     return memcmp(a->start, b->start, a->length) == 0;
	mov	r15d, eax	# _112, _112
# src/compiler.c:601:         if (identifiersEqual(name, &local->name)) {
	je	.L281	#,
.L254:
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# arg,
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	rbp, 32	# ivtmp.302,
	cmp	ebx, -1	# arg,
	jne	.L258	#,
.L253:
# src/compiler.c:590:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, r14d	#, name$length
	mov	rdi, r12	#, name$start
	call	copyString@PLT	#
	mov	rcx, rax	# _127,
	mov	eax, 3	# D.6491,
	mov	rsi, rax	# value, D.6491
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, rcx	# D.6491, _127
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_128->function, current.0_128->function
	add	rdi, 24	# _130,
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	call	addConstant@PLT	#
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	cmp	eax, 255	# arg,
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	mov	ebx, eax	# arg, arg
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	jle	.L282	#,
	mov	r12d, 15	# prephitmp_116,
	mov	ebp, 11	# prephitmp_238,
	mov	r15d, 1	# _112,
.L259:
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR parser[rip]	# _7, parser.current.type
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 17	# _7,
	je	.L260	#,
.L284:
	cmp	eax, 18	# _7,
	je	.L283	#,
# src/compiler.c:465:     if (canAssign) {
	cmp	BYTE PTR 4[rsp], 0	# %sfp,
	je	.L263	#,
	sub	eax, 13	#,
	cmp	eax, 8	# tmp249,
	ja	.L263	#,
	lea	rdx, .L266[rip]	# tmp251,
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp253,
	add	rax, rdx	# tmp254, tmp251
	jmp	rax	# tmp254
	.section	.rodata
	.align 4
	.align 4
.L266:
	.long	.L270-.L266
	.long	.L269-.L266
	.long	.L268-.L266
	.long	.L267-.L266
	.long	.L263-.L266
	.long	.L263-.L266
	.long	.L263-.L266
	.long	.L263-.L266
	.long	.L265-.L266
	.text
	.p2align 4,,10
	.p2align 3
.L282:
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR parser[rip]	# _7, parser.current.type
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	xor	r15d, r15d	# _112
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 17	# _7,
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	mov	r12d, 14	# prephitmp_116,
	mov	ebp, 10	# prephitmp_238,
# src/compiler.c:133:     if (!check(type)) return false;
	jne	.L284	#,
.L260:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:442:         emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, ebp	#, prephitmp_238
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:444:         emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, ebp	#, prephitmp_238
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, QWORD PTR .LC15[rip]	# D.6464,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_13->function, current.0_13->function
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	ecx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _15,
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	esi, 2	#,
	call	writeConstant@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_17->function, current.0_17->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 23	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _19,
.L280:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:458:         emitSet(arg, setOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, r12d	#, prephitmp_116
	mov	edi, ebx	#, arg
	call	emitSet	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_41->function,
# src/compiler.c:499: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx	#
	.cfi_def_cfa_offset 48
	pop	rbp	#
	.cfi_def_cfa_offset 40
	pop	r12	#
	.cfi_def_cfa_offset 32
	pop	r13	#
	.cfi_def_cfa_offset 24
	pop	r14	#
	.cfi_def_cfa_offset 16
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _43,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:499: }
	pop	r15	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
.L267:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:481:             emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, ebp	#, prephitmp_238
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_73->function, current.0_73->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 25	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _75,
.L279:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:489:             emitSet(arg, setOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, r12d	#, prephitmp_116
	mov	edi, ebx	#, arg
	call	emitSet	#
.L263:
# src/compiler.c:499: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
# src/compiler.c:493:         emitGet(arg, getOp, longOp);
	mov	edi, ebx	#, arg
# src/compiler.c:499: }
	pop	rbx	#
	.cfi_def_cfa_offset 48
# src/compiler.c:493:         emitGet(arg, getOp, longOp);
	mov	esi, ebp	#, prephitmp_238
# src/compiler.c:499: }
	pop	rbp	#
	.cfi_def_cfa_offset 40
	pop	r12	#
	.cfi_def_cfa_offset 32
	pop	r13	#
	.cfi_def_cfa_offset 24
	pop	r14	#
	.cfi_def_cfa_offset 16
# src/compiler.c:493:         emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
# src/compiler.c:499: }
	pop	r15	#
	.cfi_def_cfa_offset 8
# src/compiler.c:493:         emitGet(arg, getOp, longOp);
	jmp	emitGet	#
	.p2align 4,,10
	.p2align 3
.L281:
	.cfi_restore_state
# src/compiler.c:602:             if (local->depth == -1) {
	mov	rcx, QWORD PTR 8[rsp]	# current.39_96, %sfp
# src/compiler.c:602:             if (local->depth == -1) {
	movsxd	rax, ebx	# arg, arg
	sal	rax, 5	# tmp190,
# src/compiler.c:602:             if (local->depth == -1) {
	cmp	DWORD PTR 48[rcx+rax], -1	# MEM <struct Compiler> [(struct Local *)current.39_96].locals[i_139].depth,
	je	.L285	#,
.L255:
# src/compiler.c:379:         if (arg <= UINT8_MAX) {
	cmp	ebx, 255	# arg,
	jg	.L272	#,
	mov	r12d, 8	# prephitmp_116,
	mov	ebp, 6	# prephitmp_238,
	jmp	.L259	#
	.p2align 4,,10
	.p2align 3
.L272:
	mov	r12d, 9	# prephitmp_116,
	mov	ebp, 7	# prephitmp_238,
	mov	r15d, 1	# _112,
	jmp	.L259	#
	.p2align 4,,10
	.p2align 3
.L283:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:453:         emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, ebp	#, prephitmp_238
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:455:         emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, ebp	#, prephitmp_238
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, QWORD PTR .LC15[rip]	# D.6463,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_31->function, current.0_31->function
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	ecx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _33,
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	esi, 2	#,
	call	writeConstant@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_35->function, current.0_35->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 24	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _37,
	jmp	.L280	#
.L265:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:469:             emitSet(arg, setOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, r12d	#, prephitmp_116
	mov	edi, ebx	#, arg
	call	emitSet	#
	jmp	.L263	#
.L268:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:486:             emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, ebp	#, prephitmp_238
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_83->function, current.0_83->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 26	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _85,
	jmp	.L279	#
.L269:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:471:             emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, ebp	#, prephitmp_238
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_53->function, current.0_53->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 23	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _55,
	jmp	.L279	#
.L270:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:476:             emitGet(arg, getOp, longOp);
	mov	edx, r15d	#, _112
	mov	esi, ebp	#, prephitmp_238
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_63->function, current.0_63->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 24	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _65,
	jmp	.L279	#
.L285:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L255	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM <int> [(struct  *)&parser + 44B]
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _119, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _119,
	je	.L286	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _119,
	je	.L257	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L257:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC14[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L255	#
.L286:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L257	#
	.cfi_endproc
.LFE59:
	.size	variable, .-variable
	.section	.rodata.str1.1
.LC16:
	.string	"Expect identifier after '++'."
	.text
	.p2align 4
	.type	preInc, @function
preInc:
.LFB56:
	.cfi_startproc
	push	r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
# src/compiler.c:405:     consume(TOKEN_IDENTIFIER, "Expect identifier after '++'.");
	lea	rsi, .LC16[rip]	#,
	mov	edi, 27	#,
# src/compiler.c:404: static void preInc(bool canAssign) {
	push	r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 80
# src/compiler.c:405:     consume(TOKEN_IDENTIFIER, "Expect identifier after '++'.");
	call	consume	#
# src/compiler.c:376:     int arg = resolveLocal(current, &name);
	mov	rcx, QWORD PTR current[rip]	# current.39_34, current
# src/compiler.c:406:     Token name = parser.previous;
	mov	r13, QWORD PTR parser[rip+32]	# name$start, MEM <const char *> [(struct  *)&parser + 32B]
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	eax, DWORD PTR 536870936[rcx]	# current.39_34->localCount, current.39_34->localCount
# src/compiler.c:376:     int arg = resolveLocal(current, &name);
	mov	QWORD PTR 8[rsp], rcx	# %sfp, current.39_34
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	ebx, eax	# current.39_34->localCount, current.39_34->localCount
	sub	ebx, 1	# current.39_34->localCount,
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	DWORD PTR 4[rsp], eax	# %sfp, current.39_34->localCount
# src/compiler.c:406:     Token name = parser.previous;
	mov	r15d, DWORD PTR parser[rip+40]	# name$length, MEM <int> [(struct  *)&parser + 40B]
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	js	.L288	#,
	movsxd	rax, ebx	# _58, arg
	sal	rax, 5	# _2,
	lea	rbp, 32[rcx+rax]	# ivtmp.328,
	.p2align 4,,10
	.p2align 3
.L293:
# src/compiler.c:594:     if (a->length != b->length) return false;
	cmp	DWORD PTR 8[rbp], r15d	# MEM[(int *)_71 + 8B], name$length
	jne	.L289	#,
# src/compiler.c:595:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR 0[rbp]	# MEM[(const char * *)_71], MEM[(const char * *)_71]
	movsxd	rdx, r15d	#, name$length
	mov	rdi, r13	#, name$start
	call	memcmp@PLT	#
# src/compiler.c:601:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# _50
# src/compiler.c:595:     return memcmp(a->start, b->start, a->length) == 0;
	mov	r12d, eax	# _50, _50
# src/compiler.c:601:         if (identifiersEqual(name, &local->name)) {
	je	.L302	#,
.L289:
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# arg,
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	rbp, 32	# ivtmp.328,
	cmp	ebx, -1	# arg,
	jne	.L293	#,
.L288:
# src/compiler.c:590:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, r15d	#, name$length
	mov	rdi, r13	#, name$start
	call	copyString@PLT	#
	mov	rcx, rax	# _65,
	mov	eax, 3	# D.6548,
	mov	rsi, rax	# value, D.6548
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, rcx	# D.6548, _65
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_66->function, current.0_66->function
	add	rdi, 24	# _68,
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	call	addConstant@PLT	#
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	cmp	eax, 255	# arg,
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	mov	ebx, eax	# arg, arg
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	jle	.L303	#,
	mov	ebp, 15	# prephitmp_54,
	mov	esi, 11	# prephitmp_113,
	mov	r12d, 1	# _50,
.L294:
# src/compiler.c:413:     emitGet(arg, getOp, longOp);
	mov	edx, r12d	#, _50
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, QWORD PTR .LC15[rip]	# D.5258,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_25->function, current.0_25->function
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	ecx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _27,
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	esi, 2	#,
	call	writeConstant@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_21->function, current.0_21->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 23	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _23,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:417: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
# src/compiler.c:416:     emitSet(arg, setOp, longOp);
	mov	edi, ebx	#, arg
# src/compiler.c:417: }
	pop	rbx	#
	.cfi_def_cfa_offset 48
# src/compiler.c:416:     emitSet(arg, setOp, longOp);
	mov	esi, ebp	#, prephitmp_54
# src/compiler.c:417: }
	pop	rbp	#
	.cfi_def_cfa_offset 40
# src/compiler.c:416:     emitSet(arg, setOp, longOp);
	mov	edx, r12d	#, _50
# src/compiler.c:417: }
	pop	r12	#
	.cfi_def_cfa_offset 32
	pop	r13	#
	.cfi_def_cfa_offset 24
	pop	r14	#
	.cfi_def_cfa_offset 16
	pop	r15	#
	.cfi_def_cfa_offset 8
# src/compiler.c:416:     emitSet(arg, setOp, longOp);
	jmp	emitSet	#
	.p2align 4,,10
	.p2align 3
.L303:
	.cfi_restore_state
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	mov	ebp, 14	# prephitmp_54,
	mov	esi, 10	# prephitmp_113,
	xor	r12d, r12d	# _50
	jmp	.L294	#
	.p2align 4,,10
	.p2align 3
.L302:
# src/compiler.c:602:             if (local->depth == -1) {
	mov	rdx, QWORD PTR 8[rsp]	# current.39_34, %sfp
# src/compiler.c:602:             if (local->depth == -1) {
	movsxd	rax, ebx	# arg, arg
	sal	rax, 5	# tmp156,
# src/compiler.c:602:             if (local->depth == -1) {
	cmp	DWORD PTR 48[rdx+rax], -1	# MEM <struct Compiler> [(struct Local *)current.39_34].locals[i_73].depth,
	je	.L304	#,
.L290:
# src/compiler.c:379:         if (arg <= UINT8_MAX) {
	cmp	ebx, 255	# arg,
	jg	.L296	#,
	mov	ebp, 8	# prephitmp_54,
	mov	esi, 6	# prephitmp_113,
	jmp	.L294	#
	.p2align 4,,10
	.p2align 3
.L296:
	mov	ebp, 9	# prephitmp_54,
	mov	esi, 7	# prephitmp_113,
	mov	r12d, 1	# _50,
	jmp	.L294	#
.L304:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L290	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM <int> [(struct  *)&parser + 44B]
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _57, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _57,
	je	.L305	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _57,
	je	.L292	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L292:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC14[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L290	#
.L305:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L292	#
	.cfi_endproc
.LFE56:
	.size	preInc, .-preInc
	.section	.rodata.str1.1
.LC17:
	.string	"Expect identifier after '--'."
	.text
	.p2align 4
	.type	preDec, @function
preDec:
.LFB57:
	.cfi_startproc
	push	r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
# src/compiler.c:420:     consume(TOKEN_IDENTIFIER, "Expect identifier after '--'.");
	lea	rsi, .LC17[rip]	#,
	mov	edi, 27	#,
# src/compiler.c:419: static void preDec(bool canAssign) {
	push	r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 80
# src/compiler.c:420:     consume(TOKEN_IDENTIFIER, "Expect identifier after '--'.");
	call	consume	#
# src/compiler.c:376:     int arg = resolveLocal(current, &name);
	mov	rcx, QWORD PTR current[rip]	# current.39_34, current
# src/compiler.c:421:     Token name = parser.previous;
	mov	r13, QWORD PTR parser[rip+32]	# name$start, MEM <const char *> [(struct  *)&parser + 32B]
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	eax, DWORD PTR 536870936[rcx]	# current.39_34->localCount, current.39_34->localCount
# src/compiler.c:376:     int arg = resolveLocal(current, &name);
	mov	QWORD PTR 8[rsp], rcx	# %sfp, current.39_34
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	ebx, eax	# current.39_34->localCount, current.39_34->localCount
	sub	ebx, 1	# current.39_34->localCount,
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	DWORD PTR 4[rsp], eax	# %sfp, current.39_34->localCount
# src/compiler.c:421:     Token name = parser.previous;
	mov	r15d, DWORD PTR parser[rip+40]	# name$length, MEM <int> [(struct  *)&parser + 40B]
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	js	.L307	#,
	movsxd	rax, ebx	# _58, arg
	sal	rax, 5	# _2,
	lea	rbp, 32[rcx+rax]	# ivtmp.354,
	.p2align 4,,10
	.p2align 3
.L312:
# src/compiler.c:594:     if (a->length != b->length) return false;
	cmp	DWORD PTR 8[rbp], r15d	# MEM[(int *)_71 + 8B], name$length
	jne	.L308	#,
# src/compiler.c:595:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR 0[rbp]	# MEM[(const char * *)_71], MEM[(const char * *)_71]
	movsxd	rdx, r15d	#, name$length
	mov	rdi, r13	#, name$start
	call	memcmp@PLT	#
# src/compiler.c:601:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# _50
# src/compiler.c:595:     return memcmp(a->start, b->start, a->length) == 0;
	mov	r12d, eax	# _50, _50
# src/compiler.c:601:         if (identifiersEqual(name, &local->name)) {
	je	.L321	#,
.L308:
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# arg,
# src/compiler.c:599:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	rbp, 32	# ivtmp.354,
	cmp	ebx, -1	# arg,
	jne	.L312	#,
.L307:
# src/compiler.c:590:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, r15d	#, name$length
	mov	rdi, r13	#, name$start
	call	copyString@PLT	#
	mov	rcx, rax	# _65,
	mov	eax, 3	# D.6597,
	mov	rsi, rax	# value, D.6597
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, rcx	# D.6597, _65
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_66->function, current.0_66->function
	add	rdi, 24	# _68,
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	call	addConstant@PLT	#
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	cmp	eax, 255	# arg,
# src/compiler.c:176:     return addConstant(currentChunk(), value);
	mov	ebx, eax	# arg, arg
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	jle	.L322	#,
	mov	ebp, 15	# prephitmp_54,
	mov	esi, 11	# prephitmp_113,
	mov	r12d, 1	# _50,
.L313:
# src/compiler.c:428:     emitGet(arg, getOp, longOp);
	mov	edx, r12d	#, _50
	mov	edi, ebx	#, arg
	call	emitGet	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, QWORD PTR .LC15[rip]	# D.5267,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_25->function, current.0_25->function
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	ecx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _27,
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	esi, 2	#,
	call	writeConstant@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_21->function, current.0_21->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 24	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _23,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:432: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
# src/compiler.c:431:     emitSet(arg, setOp, longOp);
	mov	edi, ebx	#, arg
# src/compiler.c:432: }
	pop	rbx	#
	.cfi_def_cfa_offset 48
# src/compiler.c:431:     emitSet(arg, setOp, longOp);
	mov	esi, ebp	#, prephitmp_54
# src/compiler.c:432: }
	pop	rbp	#
	.cfi_def_cfa_offset 40
# src/compiler.c:431:     emitSet(arg, setOp, longOp);
	mov	edx, r12d	#, _50
# src/compiler.c:432: }
	pop	r12	#
	.cfi_def_cfa_offset 32
	pop	r13	#
	.cfi_def_cfa_offset 24
	pop	r14	#
	.cfi_def_cfa_offset 16
	pop	r15	#
	.cfi_def_cfa_offset 8
# src/compiler.c:431:     emitSet(arg, setOp, longOp);
	jmp	emitSet	#
	.p2align 4,,10
	.p2align 3
.L322:
	.cfi_restore_state
# src/compiler.c:390:         if (arg <= UINT8_MAX) {
	mov	ebp, 14	# prephitmp_54,
	mov	esi, 10	# prephitmp_113,
	xor	r12d, r12d	# _50
	jmp	.L313	#
	.p2align 4,,10
	.p2align 3
.L321:
# src/compiler.c:602:             if (local->depth == -1) {
	mov	rdx, QWORD PTR 8[rsp]	# current.39_34, %sfp
# src/compiler.c:602:             if (local->depth == -1) {
	movsxd	rax, ebx	# arg, arg
	sal	rax, 5	# tmp156,
# src/compiler.c:602:             if (local->depth == -1) {
	cmp	DWORD PTR 48[rdx+rax], -1	# MEM <struct Compiler> [(struct Local *)current.39_34].locals[i_73].depth,
	je	.L323	#,
.L309:
# src/compiler.c:379:         if (arg <= UINT8_MAX) {
	cmp	ebx, 255	# arg,
	jg	.L315	#,
	mov	ebp, 8	# prephitmp_54,
	mov	esi, 6	# prephitmp_113,
	jmp	.L313	#
	.p2align 4,,10
	.p2align 3
.L315:
	mov	ebp, 9	# prephitmp_54,
	mov	esi, 7	# prephitmp_113,
	mov	r12d, 1	# _50,
	jmp	.L313	#
.L323:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L309	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM <int> [(struct  *)&parser + 44B]
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _57, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _57,
	je	.L324	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _57,
	je	.L311	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L311:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC14[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L309	#
.L324:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L311	#
	.cfi_endproc
.LFE57:
	.size	preDec, .-preDec
	.section	.rodata.str1.1
.LC18:
	.string	"Expect variable name."
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Expect ';' after variable declaration."
	.text
	.p2align 4
	.type	varDeclaration, @function
varDeclaration:
.LFB78:
	.cfi_startproc
	push	r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
# src/compiler.c:764:     int global = parseVariable("Expect variable name.");
	lea	rdi, .LC18[rip]	#,
# src/compiler.c:763: static void varDeclaration() {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:764:     int global = parseVariable("Expect variable name.");
	call	parseVariable	#
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR parser[rip], 21	# parser.current.type,
# src/compiler.c:764:     int global = parseVariable("Expect variable name.");
	mov	ebx, eax	# global,
# src/compiler.c:133:     if (!check(type)) return false;
	je	.L326	#,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_9->function, current.0_9->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 2	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _11,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], 10	# parser.current.type,
	je	.L341	#,
.L328:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L342	#,
.L329:
# src/compiler.c:659:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR current[rip]	# current.68_15, current
	mov	ecx, DWORD PTR 536870940[rax]	# _16, current.68_15->scopeDepth
# src/compiler.c:659:     if (current->scopeDepth > 0) {
	test	ecx, ecx	# _16
	jg	.L343	#,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_42, current.68_15->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	# pretmp_45, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _35,
# src/compiler.c:664:     if (global <= UINT8_MAX) {
	cmp	ebx, 255	# global,
	jg	.L334	#,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 12	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_38->function, current.0_38->function
# src/compiler.c:774: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bl	#, global
# src/compiler.c:774: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _40,
# src/compiler.c:774: }
	pop	r14	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L342:
	.cfi_restore_state
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _24, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _24,
	je	.L344	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _24,
	jne	.L345	#,
.L331:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC19[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L329	#
	.p2align 4,,10
	.p2align 3
.L334:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 13	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_56->function, current.0_56->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bl	#, global
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _58,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_61->function, current.0_61->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bh	# _32, global
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _63,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:671:             (uint8_t) ((global >> 16) & 0xff)
	sar	ebx, 16	# _41,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_66->function, current.0_66->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:774: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bl	# _5, _41
# src/compiler.c:774: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _68,
# src/compiler.c:774: }
	pop	r14	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L343:
	.cfi_restore_state
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	ebx, DWORD PTR 536870936[rax]	# tmp203, current.68_15->localCount
	lea	edx, -1[rbx]	# _18,
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	movsxd	rdx, edx	# _18, _18
	sal	rdx, 5	# tmp170,
	mov	DWORD PTR 48[rax+rdx], ecx	# current.68_15->locals[_18].depth, _16
# src/compiler.c:774: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	r14	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L326:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], 10	# parser.current.type,
	jne	.L328	#,
.L341:
# src/compiler.c:121:         advance();
	call	advance	#
# src/compiler.c:122:         return;
	jmp	.L329	#
	.p2align 4,,10
	.p2align 3
.L345:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L331	#
	.p2align 4,,10
	.p2align 3
.L344:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L331	#
	.cfi_endproc
.LFE78:
	.size	varDeclaration, .-varDeclaration
	.p2align 4
	.type	and_, @function
and_:
.LFB71:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_13->function, current.0_13->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 32	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _15,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_17->function, current.0_17->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _19,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_21->function, current.0_21->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _23,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _25, current.0_24->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp139, MEM[(struct Chunk *)_25 + 24B].count
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _9,
# src/compiler.c:167:     return currentChunk()->count - 2;
	lea	ebx, -2[rax]	# _27,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:695:     parsePrecedence(PREC_AND);
	mov	edi, 4	#,
	call	parsePrecedence	#
# src/compiler.c:697:     patchJump(endJump);
	mov	edi, ebx	#, _27
# src/compiler.c:698: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/compiler.c:697:     patchJump(endJump);
	jmp	patchJump	#
	.cfi_endproc
.LFE71:
	.size	and_, .-and_
	.p2align 4
	.type	or_, @function
or_:
.LFB50:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 32	#,
# src/compiler.c:314: static void or_(bool canAssign) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_33->function, current.0_33->function
	add	rdi, 24	# _35,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_37->function, current.0_37->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _39,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_41->function, current.0_41->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _43,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _45, current.0_44->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 31	#,
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp173, MEM[(struct Chunk *)_45 + 24B].count
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _18,
# src/compiler.c:167:     return currentChunk()->count - 2;
	lea	ebp, -2[rax]	# _47,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_20->function, current.0_20->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _22,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_24->function, current.0_24->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _26,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:318:     patchJump(elseJump);
	mov	edi, ebp	#, _47
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.0_27->function, current.0_27->function
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	ebx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_28 + 24B].count, MEM[(struct Chunk *)_28 + 24B].count
# src/compiler.c:318:     patchJump(elseJump);
	call	patchJump	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_10->function, current.0_10->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _12,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:321:     parsePrecedence(PREC_OR);
	mov	edi, 3	#,
	call	parsePrecedence	#
# src/compiler.c:323: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
# src/compiler.c:322:     patchJump(endJump);
	lea	edi, -2[rbx]	#,
# src/compiler.c:323: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:322:     patchJump(endJump);
	jmp	patchJump	#
	.cfi_endproc
.LFE50:
	.size	or_, .-or_
	.p2align 4
	.type	binary, @function
binary:
.LFB44:
	.cfi_startproc
# src/compiler.c:253:     TokenType operatorType = parser.previous.type;
	mov	eax, DWORD PTR parser[rip+24]	#, parser.previous.type
# src/compiler.c:252: static void binary(bool canAssign) {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:255:     parsePrecedence((Precedence) (rule->precedence + 1));
	lea	rdx, [rax+rax*2]	# tmp160,
# src/compiler.c:253:     TokenType operatorType = parser.previous.type;
	mov	rbx, rax	#,
# src/compiler.c:255:     parsePrecedence((Precedence) (rule->precedence + 1));
	lea	rax, rules[rip]	# tmp156,
	mov	edi, DWORD PTR 16[rax+rdx*8]	# MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][operatorType_5].precedence, MEM <struct ParseRule[54]> [(struct ParseRule *)&rules][operatorType_5].precedence
# src/compiler.c:257:     switch (operatorType) {
	sub	ebx, 7	#,
# src/compiler.c:255:     parsePrecedence((Precedence) (rule->precedence + 1));
	add	edi, 1	# _2,
# src/compiler.c:255:     parsePrecedence((Precedence) (rule->precedence + 1));
	call	parsePrecedence	#
# src/compiler.c:257:     switch (operatorType) {
	cmp	ebx, 19	# tmp166,
	ja	.L363	#,
	lea	rdx, .L353[rip]	# tmp168,
	movsxd	rax, DWORD PTR [rdx+rbx*4]	# tmp170,
	add	rax, rdx	# tmp171, tmp168
	jmp	rax	# tmp171
	.section	.rodata
	.align 4
	.align 4
.L353:
	.long	.L362-.L353
	.long	.L361-.L353
	.long	.L363-.L353
	.long	.L363-.L353
	.long	.L360-.L353
	.long	.L359-.L353
	.long	.L363-.L353
	.long	.L363-.L353
	.long	.L363-.L353
	.long	.L363-.L353
	.long	.L363-.L353
	.long	.L363-.L353
	.long	.L363-.L353
	.long	.L358-.L353
	.long	.L363-.L353
	.long	.L357-.L353
	.long	.L356-.L353
	.long	.L355-.L353
	.long	.L354-.L353
	.long	.L352-.L353
	.text
	.p2align 4,,10
	.p2align 3
.L363:
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L362:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_27->function, current.0_27->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 24	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _29,
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L361:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_23->function, current.0_23->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 23	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _25,
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L360:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_35->function, current.0_35->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 26	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _37,
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L359:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_31->function, current.0_31->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 25	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _33,
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L358:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_47->function, current.0_47->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 20	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _49,
.L365:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_62->function,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 27	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _64,
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L357:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_11->function, current.0_11->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 20	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _13,
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L356:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_15->function, current.0_15->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 21	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _17,
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L355:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_57->function, current.0_57->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 22	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _59,
	jmp	.L365	#
	.p2align 4,,10
	.p2align 3
.L354:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_19->function, current.0_19->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 22	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _21,
# src/compiler.c:270: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L352:
	.cfi_restore_state
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_67->function, current.0_67->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 21	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _69,
	jmp	.L365	#
	.cfi_endproc
.LFE44:
	.size	binary, .-binary
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"Expect ':' after then branch of ternary operator."
	.text
	.p2align 4
	.type	ternary, @function
ternary:
.LFB51:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 32	#,
# src/compiler.c:325: static void ternary(bool canAssign) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_40->function, current.0_40->function
	add	rdi, 24	# _42,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_44->function, current.0_44->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _46,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_48->function, current.0_48->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _50,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _52, current.0_51->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp183, MEM[(struct Chunk *)_52 + 24B].count
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _18,
# src/compiler.c:167:     return currentChunk()->count - 2;
	lea	ebp, -2[rax]	# _54,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:329:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_23->function, current.0_23->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 31	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _25,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_27->function, current.0_27->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _29,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_31->function, current.0_31->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _33,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:333:     patchJump(elseJump);
	mov	edi, ebp	#, _54
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.0_34->function, current.0_34->function
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	ebx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_35 + 24B].count, MEM[(struct Chunk *)_35 + 24B].count
# src/compiler.c:333:     patchJump(elseJump);
	call	patchJump	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_12->function, current.0_12->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _14,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:336:     consume(TOKEN_COLON, "Expect ':' after then branch of ternary operator.");
	lea	rsi, .LC20[rip]	#,
	mov	edi, 5	#,
	call	consume	#
# src/compiler.c:338:     parsePrecedence(PREC_TERNARY);
	mov	edi, 2	#,
	call	parsePrecedence	#
# src/compiler.c:341: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
# src/compiler.c:340:     patchJump(endJump);
	lea	edi, -2[rbx]	#,
# src/compiler.c:341: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:340:     patchJump(endJump);
	jmp	patchJump	#
	.cfi_endproc
.LFE51:
	.size	ternary, .-ternary
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Expect left parentheses after print keyword"
	.align 8
.LC22:
	.string	"Expect right parentheses after print expression"
	.section	.rodata.str1.1
.LC23:
	.string	"Expect ';' after print value."
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"Cannot use 'break' outside a loop."
	.align 8
.LC25:
	.string	"Too many break statements in current loop."
	.section	.rodata.str1.1
.LC26:
	.string	"Expect ';' after 'break'."
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"Cannot use 'continue' outside of a loop."
	.section	.rodata.str1.1
.LC28:
	.string	"Expect ';' after 'continue'"
.LC29:
	.string	"Expect '(' after 'if'."
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"Expect ')' after if statement condition."
	.align 8
.LC31:
	.string	"Can't return from top-level code."
	.align 8
.LC32:
	.string	"Expect ';' after return value."
	.align 8
.LC33:
	.string	"Expect ';' after expression statement."
	.text
	.p2align 4
	.type	statement, @function
statement:
.LFB91:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	r14	#
	push	rbx	#
	and	rsp, -32	#,
	sub	rsp, 32	#,
	.cfi_offset 14, -24
	.cfi_offset 3, -32
	cmp	DWORD PTR parser[rip], 51	# parser.current.type,
	ja	.L369	#,
	mov	eax, DWORD PTR parser[rip]	# parser.current.type, parser.current.type
	lea	rdx, .L371[rip]	# tmp264,
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp266,
	add	rax, rdx	# tmp267, tmp264
	jmp	rax	# tmp267
	.section	.rodata
	.align 4
	.align 4
.L371:
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L379-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L378-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L377-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L376-.L371
	.long	.L369-.L371
	.long	.L375-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L374-.L371
	.long	.L373-.L371
	.long	.L369-.L371
	.long	.L372-.L371
	.long	.L369-.L371
	.long	.L369-.L371
	.long	.L370-.L371
	.text
	.p2align 4,,10
	.p2align 3
.L369:
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], 10	# parser.current.type,
	je	.L437	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L438	#,
.L408:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_199->function, current.0_199->function
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _201,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:1091: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L379:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:232:     current->scopeDepth++;
	mov	rax, QWORD PTR current[rip]	# current.67_15, current
# src/compiler.c:232:     current->scopeDepth++;
	add	DWORD PTR 536870940[rax], 1	# current.67_15->scopeDepth,
# src/compiler.c:1086:         block();
	call	block	#
# src/compiler.c:236:     current->scopeDepth--;
	mov	rdx, QWORD PTR current[rip]	# current.96_115, current
# src/compiler.c:236:     current->scopeDepth--;
	mov	eax, DWORD PTR 536870940[rdx]	# tmp527, current.94_184->scopeDepth
	lea	ecx, -1[rax]	# pretmp_13,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	mov	eax, DWORD PTR 536870936[rdx]	# _75, current.94_184->localCount
# src/compiler.c:236:     current->scopeDepth--;
	mov	DWORD PTR 536870940[rdx], ecx	# current.94_184->scopeDepth, pretmp_13
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	test	eax, eax	# _75
	jg	.L404	#,
	jmp	.L432	#
	.p2align 4,,10
	.p2align 3
.L406:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# current.96_115->function, current.96_115->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _190,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
	call	writeChunk@PLT	#
# src/compiler.c:240:         current->localCount--;
	mov	rdx, QWORD PTR current[rip]	# current.96_115, current
# src/compiler.c:240:         current->localCount--;
	mov	eax, DWORD PTR 536870936[rdx]	# tmp528, current.95_191->localCount
	sub	eax, 1	# _75,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	test	eax, eax	# _75
# src/compiler.c:240:         current->localCount--;
	mov	DWORD PTR 536870936[rdx], eax	# current.95_191->localCount, _75
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	jle	.L432	#,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	mov	ecx, DWORD PTR 536870940[rdx]	# pretmp_13, current.95_191->scopeDepth
.L404:
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	sub	eax, 1	# _195,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	cdqe
	sal	rax, 5	# tmp489,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	cmp	DWORD PTR 48[rdx+rax], ecx	# current.96_115->locals[_195].depth, pretmp_13
	jg	.L406	#,
.L432:
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L378:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:797:     if (currentLoop == NULL) {
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop.70_37, currentLoop
# src/compiler.c:797:     if (currentLoop == NULL) {
	test	rax, rax	# currentLoop.70_37
	je	.L439	#,
.L382:
# src/compiler.c:801:     if (currentLoop->breakCount == MAX_BREAKS) {
	cmp	DWORD PTR 1032[rax], 256	# prephitmp_317->breakCount,
	je	.L440	#,
.L383:
# src/compiler.c:805:     consume(TOKEN_SEMICOLON, "Expect ';' after 'break'.");
	lea	rdi, .LC26[rip]	#,
	call	consume.constprop.2	#
# src/compiler.c:807:     for (int i = current->localCount - 1;
	mov	rdx, QWORD PTR current[rip]	# prephitmp_319, current
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	ebx, DWORD PTR 536870936[rdx]	# i, current.72_42->localCount
	sub	ebx, 1	# i,
	jns	.L388	#,
	jmp	.L389	#
	.p2align 4,,10
	.p2align 3
.L390:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# prephitmp_319->function, prephitmp_319->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _48,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	sub	ebx, 1	# i,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	cmp	ebx, -1	# i,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdx, QWORD PTR current[rip]	# prephitmp_319, current
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	je	.L389	#,
.L388:
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	rcx, QWORD PTR currentLoop[rip]	# currentLoop, currentLoop
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	movsxd	rax, ebx	# i, i
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	esi, DWORD PTR 4[rcx]	# tmp522, currentLoop.74_52->scopeDepth
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	sal	rax, 5	# tmp347,
# src/compiler.c:808:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	cmp	DWORD PTR 48[rdx+rax], esi	# prephitmp_319->locals[i_127].depth, tmp522
	jg	.L390	#,
.L389:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# prephitmp_321->function, prephitmp_321->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _78,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 31	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_80->function, current.0_80->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _82,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_84->function, current.0_84->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _86,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:813:     currentLoop->breakJumps[currentLoop->breakCount++] = jump;
	mov	rdx, QWORD PTR currentLoop[rip]	# currentLoop.75_55, currentLoop
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.0_87->function, current.0_87->function
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	ecx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_88 + 24B].count, MEM[(struct Chunk *)_88 + 24B].count
# src/compiler.c:813:     currentLoop->breakJumps[currentLoop->breakCount++] = jump;
	movsxd	rax, DWORD PTR 1032[rdx]	#, currentLoop.75_55->breakCount
# src/compiler.c:167:     return currentChunk()->count - 2;
	sub	ecx, 2	# _90,
# src/compiler.c:813:     currentLoop->breakJumps[currentLoop->breakCount++] = jump;
	lea	esi, 1[rax]	# tmp369,
	mov	DWORD PTR 1032[rdx], esi	# currentLoop.75_55->breakCount, tmp369
# src/compiler.c:813:     currentLoop->breakJumps[currentLoop->breakCount++] = jump;
	mov	DWORD PTR 8[rdx+rax*4], ecx	# currentLoop.75_55->breakJumps[_56], _90
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L377:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:817:     if (currentLoop == NULL) {
	cmp	QWORD PTR currentLoop[rip], 0	# currentLoop,
	je	.L441	#,
.L392:
# src/compiler.c:821:     consume(TOKEN_SEMICOLON, "Expect ';' after 'continue'");
	lea	rdi, .LC28[rip]	#,
	call	consume.constprop.2	#
# src/compiler.c:823:     for (int i = current->localCount - 1; 
	mov	rdx, QWORD PTR current[rip]	# pretmp_311, current
# src/compiler.c:824:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	ebx, DWORD PTR 536870936[rdx]	# i, current.78_93->localCount
	sub	ebx, 1	# i,
	jns	.L395	#,
	jmp	.L434	#
	.p2align 4,,10
	.p2align 3
.L398:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# prephitmp_312->function, prephitmp_312->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _99,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
	call	writeChunk@PLT	#
# src/compiler.c:824:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	sub	ebx, 1	# i,
	jb	.L434	#,
# src/compiler.c:824:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	rdx, QWORD PTR current[rip]	# pretmp_311, current
.L395:
# src/compiler.c:824:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	rcx, QWORD PTR currentLoop[rip]	# currentLoop.80_103, currentLoop
# src/compiler.c:824:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	movsxd	rax, ebx	# i, i
# src/compiler.c:824:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	esi, DWORD PTR 4[rcx]	# tmp524, currentLoop.80_103->scopeDepth
# src/compiler.c:824:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	sal	rax, 5	# tmp395,
# src/compiler.c:824:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	cmp	DWORD PTR 48[rdx+rax], esi	# prephitmp_312->locals[i_120].depth, tmp524
	jg	.L398	#,
.L396:
# src/compiler.c:828:     emitLoop(currentLoop->start);
	mov	edi, DWORD PTR [rcx]	# prephitmp_315->start, prephitmp_315->start
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
# src/compiler.c:828:     emitLoop(currentLoop->start);
	jmp	emitLoop	#
	.p2align 4,,10
	.p2align 3
.L376:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
# src/compiler.c:1075:         forStatement();
	jmp	forStatement	#
	.p2align 4,,10
	.p2align 3
.L375:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:889:     consume(TOKEN_LEFT_PAREN, "Expect '(' after 'if'.");
	lea	rdi, .LC29[rip]	#,
	call	consume.constprop.1	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:891:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after if statement condition.");
	lea	rdi, .LC30[rip]	#,
	call	consume.constprop.0	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_145->function, current.0_145->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 32	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _147,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_149->function, current.0_149->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _151,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_153->function, current.0_153->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _155,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _157, current.0_156->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp526, MEM[(struct Chunk *)_157 + 24B].count
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _119,
# src/compiler.c:167:     return currentChunk()->count - 2;
	lea	r14d, -2[rax]	# _159,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:895:     statement();
	call	statement	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_128->function, current.0_128->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 31	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _130,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_132->function, current.0_132->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _134,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_136->function, current.0_136->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _138,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:899:     patchJump(thenJump);
	mov	edi, r14d	#, _159
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.0_139->function, current.0_139->function
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	ebx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_140 + 24B].count, MEM[(struct Chunk *)_140 + 24B].count
# src/compiler.c:899:     patchJump(thenJump);
	call	patchJump	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_122->function, current.0_122->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _124,
# src/compiler.c:167:     return currentChunk()->count - 2;
	sub	ebx, 2	# _142,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR parser[rip], 38	# parser.current.type,
	je	.L442	#,
.L399:
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
# src/compiler.c:903:     patchJump(elseJump);
	mov	edi, ebx	#, _142
# src/compiler.c:1091: }
	pop	rbx	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
# src/compiler.c:903:     patchJump(elseJump);
	jmp	patchJump	#
	.p2align 4,,10
	.p2align 3
.L374:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:907:     consume(TOKEN_LEFT_PAREN, "Expect left parentheses after print keyword");
	lea	rdi, .LC21[rip]	#,
	call	consume.constprop.1	#
# src/compiler.c:909:     if (!check(TOKEN_RIGHT_PAREN)) {
	cmp	DWORD PTR parser[rip], 1	# parser.current.type,
	je	.L380	#,
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
.L381:
# src/compiler.c:915:     consume(TOKEN_RIGHT_PAREN, "Expect right parentheses after print expression");
	lea	rdi, .LC22[rip]	#,
	call	consume.constprop.0	#
# src/compiler.c:916:     consume(TOKEN_SEMICOLON, "Expect ';' after print value.");
	lea	rdi, .LC23[rip]	#,
	call	consume.constprop.2	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_34->function, current.0_34->function
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _36,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 29	#,
# src/compiler.c:1091: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L373:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:921:     if (current->type == TYPE_SCRIPT) {
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:921:     if (current->type == TYPE_SCRIPT) {
	cmp	DWORD PTR 16[rax], 1	# current.88_160->type,
	je	.L443	#,
.L400:
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR parser[rip], 10	# parser.current.type,
	je	.L403	#,
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:929:         consume(TOKEN_SEMICOLON, "Expect ';' after return value.");
	lea	rdi, .LC32[rip]	#,
	call	consume.constprop.2	#
.L436:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_181->function,
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _183,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 35	#,
# src/compiler.c:1091: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L372:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
# src/compiler.c:1081:         switchStatement();
	jmp	switchStatement	#
	.p2align 4,,10
	.p2align 3
.L370:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:1091: }
	lea	rsp, -16[rbp]	#,
	pop	rbx	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
# src/compiler.c:1083:         whileStatement();
	jmp	whileStatement	#
	.p2align 4,,10
	.p2align 3
.L434:
	.cfi_restore_state
# src/compiler.c:828:     emitLoop(currentLoop->start);
	mov	rcx, QWORD PTR currentLoop[rip]	# currentLoop.80_103, currentLoop
	jmp	.L396	#
	.p2align 4,,10
	.p2align 3
.L438:
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _206, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _206,
	je	.L444	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _206,
	je	.L410	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L410:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC33[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L408	#
	.p2align 4,,10
	.p2align 3
.L443:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L400	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _170, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _170,
	je	.L445	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _170,
	je	.L402	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L402:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC31[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L400	#
	.p2align 4,,10
	.p2align 3
.L380:
# src/compiler.c:912:         emitConstant(EMPTY_VAL);
	mov	QWORD PTR [rsp], 0	#,
	mov	DWORD PTR 8[rsp], 0	#,
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	esi, 4	#,
	xor	edx, edx	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	ecx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_30->function, current.0_30->function
	add	rdi, 24	# _32,
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	call	writeConstant@PLT	#
	jmp	.L381	#
	.p2align 4,,10
	.p2align 3
.L403:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_177->function, current.0_177->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 2	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _179,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
	jmp	.L436	#
	.p2align 4,,10
	.p2align 3
.L442:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:902:     if (match(TOKEN_ELSE)) statement();
	call	statement	#
	jmp	.L399	#
	.p2align 4,,10
	.p2align 3
.L441:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L392	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _109, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _109,
	je	.L446	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _109,
	je	.L394	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L394:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC27[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L392	#
	.p2align 4,,10
	.p2align 3
.L439:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L383	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _60, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _60,
	je	.L447	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _60,
	je	.L385	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L385:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC24[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:801:     if (currentLoop->breakCount == MAX_BREAKS) {
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop.70_37, currentLoop
	jmp	.L382	#
	.p2align 4,,10
	.p2align 3
.L440:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L383	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _68, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _68,
	je	.L448	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _68,
	je	.L387	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L387:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC25[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L383	#
	.p2align 4,,10
	.p2align 3
.L437:
# src/compiler.c:121:         advance();
	call	advance	#
# src/compiler.c:122:         return;
	jmp	.L408	#
.L444:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L410	#
.L445:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L402	#
.L448:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L387	#
.L446:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L394	#
.L447:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L385	#
	.cfi_endproc
.LFE91:
	.size	statement, .-statement
	.section	.rodata.str1.1
.LC34:
	.string	"Expect function name."
.LC35:
	.string	""
	.section	.rodata.str1.8
	.align 8
.LC36:
	.string	"Expect '(' after function name."
	.align 8
.LC37:
	.string	"Cannot have more than 255 parameters."
	.section	.rodata.str1.1
.LC38:
	.string	"Expect parameter name."
	.section	.rodata.str1.8
	.align 8
.LC39:
	.string	"Expect ')' after function parameters."
	.align 8
.LC40:
	.string	"Expect '{' before function body."
	.section	.rodata.str1.1
.LC41:
	.string	"Constants must be top-level."
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"Constants must be defined at declaration."
	.align 8
.LC43:
	.string	"Expect ';' after constant declaration."
	.text
	.p2align 4
	.type	declaration, @function
declaration:
.LFB90:
	.cfi_startproc
	push	r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 64
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR parser[rip]	# _10, parser.current.type
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 41	# _10,
	je	.L450	#,
	cmp	eax, 36	# _10,
	je	.L493	#,
	cmp	eax, 34	# _10,
	je	.L494	#,
# src/compiler.c:1061:         statement();
	call	statement	#
.L463:
# src/compiler.c:1064:     if (parser.panicMode) synchronize();
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L495	#,
.L489:
# src/compiler.c:1065: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r14	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L493:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:1057:         varDeclaration();
	call	varDeclaration	#
# src/compiler.c:1064:     if (parser.panicMode) synchronize();
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L489	#,
.L495:
# src/compiler.c:1032:     while (parser.current.type != TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _203, parser.current.type
# src/compiler.c:1030:     parser.panicMode = false;
	mov	BYTE PTR parser[rip+49], 0	# parser.panicMode,
# src/compiler.c:1032:     while (parser.current.type != TOKEN_EOF) {
	cmp	eax, 53	# _203,
	je	.L489	#,
	lea	rbx, parser[rip]	# tmp435,
# src/compiler.c:1034:         switch(parser.current.type) {
	mov	ebp, 275337	# tmp436,
	jmp	.L474	#
	.p2align 4,,10
	.p2align 3
.L496:
	sub	eax, 33	# _209,
	cmp	eax, 18	# _209,
	ja	.L473	#,
	bt	rbp, rax	# tmp436, _209
	jc	.L489	#,
.L473:
# src/compiler.c:1049:         advance();
	call	advance	#
# src/compiler.c:1032:     while (parser.current.type != TOKEN_EOF) {
	mov	eax, DWORD PTR [rbx]	# _203, parser.current.type
# src/compiler.c:1032:     while (parser.current.type != TOKEN_EOF) {
	cmp	eax, 53	# _203,
	je	.L489	#,
.L474:
# src/compiler.c:1033:         if (parser.previous.type == TOKEN_SEMICOLON) return;
	cmp	DWORD PTR 24[rbx], 10	# parser.previous.type,
	jne	.L496	#,
# src/compiler.c:1065: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r14	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L450:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:755:     int global = parseVariable("Expect function name.");
	lea	rdi, .LC34[rip]	#,
	call	parseVariable	#
# src/compiler.c:653:     if (current->scopeDepth == 0) return;
	mov	rbx, QWORD PTR current[rip]	# current.61_15, current
# src/compiler.c:755:     int global = parseVariable("Expect function name.");
	mov	r14d, eax	# global,
# src/compiler.c:653:     if (current->scopeDepth == 0) return;
	mov	edx, DWORD PTR 536870940[rbx]	# _16, current.61_15->scopeDepth
# src/compiler.c:653:     if (current->scopeDepth == 0) return;
	test	edx, edx	# _16
	je	.L453	#,
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	eax, DWORD PTR 536870936[rbx]	# tmp447, current.61_15->localCount
	sub	eax, 1	# _18,
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	cdqe
	sal	rax, 5	# tmp254,
	mov	DWORD PTR 48[rbx+rax], edx	# current.61_15->locals[_18].depth, _16
.L453:
# src/compiler.c:730:     Compiler* compiler = malloc(sizeof(Compiler));
	mov	edi, 536870944	#,
	call	malloc@PLT	#
# src/compiler.c:195:     compiler->enclosing = current;
	mov	QWORD PTR [rax], rbx	# compiler_24->enclosing, current.61_15
# src/compiler.c:196:     compiler->function = NULL;
	mov	QWORD PTR 8[rax], 0	# compiler_24->function,
# src/compiler.c:197:     compiler->type = type;
	mov	DWORD PTR 16[rax], 0	# compiler_24->type,
# src/compiler.c:198:     compiler->localCount = 0;
	mov	QWORD PTR 536870936[rax], 0	# MEM <vector(2) int> [(int *)compiler_24 + 536870936B],
# src/compiler.c:730:     Compiler* compiler = malloc(sizeof(Compiler));
	mov	rbp, rax	# compiler,
# src/compiler.c:200:     compiler->function = newFunction();
	call	newFunction@PLT	#
# src/compiler.c:200:     compiler->function = newFunction();
	mov	QWORD PTR 8[rbp], rax	# compiler_24->function, _44
# src/compiler.c:201:     compiler->function->arity = 0;
	mov	DWORD PTR 16[rax], 0	# _44->arity,
# src/compiler.c:205:         current->function->name = copyString(parser.previous.start, parser.previous.length);
	mov	esi, DWORD PTR parser[rip+40]	#, parser.previous.length
	mov	rdi, QWORD PTR parser[rip+32]	#, parser.previous.start
# src/compiler.c:200:     compiler->function = newFunction();
	mov	rbx, rax	# _44,
# src/compiler.c:202:     current = compiler;
	mov	QWORD PTR current[rip], rbp	# current, compiler
# src/compiler.c:205:         current->function->name = copyString(parser.previous.start, parser.previous.length);
	call	copyString@PLT	#
# src/compiler.c:208:     Local* local = &current->locals[current->localCount++];
	mov	rdx, QWORD PTR current[rip]	# current.51_48, current
# src/compiler.c:205:         current->function->name = copyString(parser.previous.start, parser.previous.length);
	mov	QWORD PTR 72[rbx], rax	# _44->name, _47
# src/compiler.c:208:     Local* local = &current->locals[current->localCount++];
	movsxd	rax, DWORD PTR 536870936[rdx]	#, current.51_48->localCount
# src/compiler.c:734:     consume(TOKEN_LEFT_PAREN, "Expect '(' after function name.");
	lea	rdi, .LC36[rip]	#,
# src/compiler.c:208:     Local* local = &current->locals[current->localCount++];
	lea	ecx, 1[rax]	# tmp263,
	mov	DWORD PTR 536870936[rdx], ecx	# current.51_48->localCount, tmp263
	sal	rax, 5	# _193,
# src/compiler.c:210:     local->name.start = "";
	lea	rcx, .LC35[rip]	# tmp448,
# src/compiler.c:209:     local->depth = 0;
	mov	DWORD PTR 48[rdx+rax], 0	# MEM <int> [(struct Local *)_132 + 48B],
# src/compiler.c:210:     local->name.start = "";
	mov	QWORD PTR 32[rdx+rax], rcx	# MEM <const char *> [(struct Local *)_132 + 32B], tmp448
# src/compiler.c:211:     local->name.length = 0;
	mov	DWORD PTR 40[rdx+rax], 0	# MEM <int> [(struct Local *)_132 + 40B],
# src/compiler.c:232:     current->scopeDepth++;
	add	DWORD PTR 536870940[rdx], 1	# current.51_48->scopeDepth,
# src/compiler.c:734:     consume(TOKEN_LEFT_PAREN, "Expect '(' after function name.");
	call	consume.constprop.1	#
# src/compiler.c:735:     if (!check(TOKEN_RIGHT_PAREN)) {
	cmp	DWORD PTR parser[rip], 1	# parser.current.type,
	je	.L454	#,
	lea	rbx, parser[rip]	# tmp435,
.L461:
# src/compiler.c:737:             current->function->arity++;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rdx, QWORD PTR 8[rax]	# _30, current.65_29->function
# src/compiler.c:737:             current->function->arity++;
	mov	eax, DWORD PTR 16[rdx]	# tmp449, _30->arity
	add	eax, 1	# _32,
# src/compiler.c:738:             if (current->function->arity > 255) {
	cmp	eax, 255	# _32,
# src/compiler.c:737:             current->function->arity++;
	mov	DWORD PTR 16[rdx], eax	# _30->arity, _32
# src/compiler.c:738:             if (current->function->arity > 255) {
	jle	.L455	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbx], 0	# parser.panicMode,
	jne	.L455	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR 20[rbx]	# parser.line, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR [rbx]	# _53, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _53,
	je	.L497	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _53,
	jne	.L498	#,
.L457:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC37[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
.L455:
# src/compiler.c:741:             int constant = parseVariable("Expect parameter name.");
	lea	rdi, .LC38[rip]	#,
	call	parseVariable	#
# src/compiler.c:659:     if (current->scopeDepth > 0) {
	mov	rdx, QWORD PTR current[rip]	# current.68_59, current
	mov	ecx, DWORD PTR 536870940[rdx]	# _60, current.68_59->scopeDepth
# src/compiler.c:659:     if (current->scopeDepth > 0) {
	test	ecx, ecx	# _60
	jg	.L499	#,
# src/compiler.c:664:     if (global <= UINT8_MAX) {
	cmp	eax, 255	# constant,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# pretmp_146, current.68_59->function
	movzx	r12d, al	# _141, constant
# src/compiler.c:664:     if (global <= UINT8_MAX) {
	jg	.L460	#,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _69,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 12	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_72->function, current.0_72->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, r12d	#, _141
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _74,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
.L459:
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR [rbx], 4	# parser.current.type,
	je	.L500	#,
.L454:
# src/compiler.c:745:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after function parameters.");
	lea	rdi, .LC39[rip]	#,
	call	consume.constprop.0	#
# src/compiler.c:746:     consume(TOKEN_LEFT_BRACE, "Expect '{' before function body.");
	lea	rsi, .LC40[rip]	#,
	mov	edi, 2	#,
	call	consume	#
# src/compiler.c:747:     block();
	call	block	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_104->function, current.0_104->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 2	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _106,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_108->function, current.0_108->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 35	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _110,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:216:     ObjFunction* function = current->function;
	mov	rax, QWORD PTR current[rip]	# current.100_37, current
# src/compiler.c:750:     free(compiler);
	mov	rdi, rbp	#, compiler
# src/compiler.c:227:     current = current->enclosing;
	mov	rbx, QWORD PTR [rax]	# _39, current.100_37->enclosing
# src/compiler.c:216:     ObjFunction* function = current->function;
	mov	r12, QWORD PTR 8[rax]	# function, current.100_37->function
# src/compiler.c:227:     current = current->enclosing;
	mov	QWORD PTR current[rip], rbx	# current, _39
# src/compiler.c:750:     free(compiler);
	call	free@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rbx]	# MEM[(struct Compiler *)_39].function, MEM[(struct Compiler *)_39].function
# src/compiler.c:751:     emitConstant(OBJ_VAL(function));
	mov	eax, 3	# D.6773,
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	ecx, DWORD PTR parser[rip+44]	#, parser.previous.line
	mov	rdx, r12	# D.6773, function
	mov	rsi, rax	# value, D.6773
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _42,
# src/compiler.c:180:     writeConstant(currentChunk(), value, parser.previous.line);
	call	writeConstant@PLT	#
# src/compiler.c:659:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR current[rip]	# current.68_19, current
	mov	edx, DWORD PTR 536870940[rax]	# _20, current.68_19->scopeDepth
# src/compiler.c:659:     if (current->scopeDepth > 0) {
	test	edx, edx	# _20
	jg	.L501	#,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_164, current.68_19->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	# pretmp_166, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _116,
# src/compiler.c:664:     if (global <= UINT8_MAX) {
	cmp	r14d, 255	# global,
	jle	.L502	#,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 13	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_137->function, current.0_137->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r14b	#, global
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _139,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_142->function, current.0_142->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	ebx, r14d	# global, global
	movzx	esi, bh	# _66, global
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _144,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:671:             (uint8_t) ((global >> 16) & 0xff)
	mov	esi, r14d	# global, global
	sar	esi, 16	# global,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, sil	# _9, _122
.L491:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_199->function,
	add	rdi, 24	# _201,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:152: }
	jmp	.L463	#
	.p2align 4,,10
	.p2align 3
.L499:
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	eax, DWORD PTR 536870936[rdx]	# tmp450, current.68_59->localCount
	sub	eax, 1	# _62,
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	cdqe
	sal	rax, 5	# tmp292,
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR [rbx], 4	# parser.current.type,
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	DWORD PTR 48[rdx+rax], ecx	# current.68_59->locals[_62].depth, _60
# src/compiler.c:133:     if (!check(type)) return false;
	jne	.L454	#,
.L500:
# src/compiler.c:134:     advance();
	call	advance	#
	jmp	.L461	#
	.p2align 4,,10
	.p2align 3
.L460:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _87,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 13	#,
	mov	DWORD PTR 12[rsp], eax	# %sfp, constant
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rcx, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rcx]	# current.0_90->function, current.0_90->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, r12d	#, _141
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _92,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rcx, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	eax, DWORD PTR 12[rsp]	# constant, %sfp
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rcx]	# current.0_95->function, current.0_95->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
	movzx	esi, ah	# _170, constant
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _97,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:671:             (uint8_t) ((global >> 16) & 0xff)
	mov	eax, DWORD PTR 12[rsp]	# constant, %sfp
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
# src/compiler.c:671:             (uint8_t) ((global >> 16) & 0xff)
	sar	eax, 16	# _75,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, al	# _131, _75
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_100->function, current.0_100->function
	add	rdi, 24	# _102,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:152: }
	jmp	.L459	#
	.p2align 4,,10
	.p2align 3
.L498:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 8[rbx]	# parser.start, parser.start
	mov	edx, DWORD PTR 16[rbx]	# parser.length, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L457	#
	.p2align 4,,10
	.p2align 3
.L502:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 12	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_119->function, current.0_119->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r14b	#, global
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _121,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:145: }
	jmp	.L463	#
	.p2align 4,,10
	.p2align 3
.L494:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:777:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:777:     if (current->scopeDepth > 0) {
	mov	eax, DWORD PTR 536870940[rax]	#, current.69_150->scopeDepth
	test	eax, eax	#
	jle	.L466	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L503	#,
.L466:
# src/compiler.c:781:     int global = parseVariable("Expect variable name.");
	lea	rdi, .LC18[rip]	#,
	call	parseVariable	#
# src/compiler.c:783:     consume(TOKEN_EQUAL, "Constants must be defined at declaration.");
	lea	rsi, .LC42[rip]	#,
	mov	edi, 21	#,
# src/compiler.c:781:     int global = parseVariable("Expect variable name.");
	mov	ebx, eax	# global,
# src/compiler.c:783:     consume(TOKEN_EQUAL, "Constants must be defined at declaration.");
	call	consume	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:785:     consume(TOKEN_SEMICOLON, "Expect ';' after constant declaration.");
	lea	rdi, .LC43[rip]	#,
	call	consume.constprop.2	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	# pretmp_181, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_179, pretmp_180->function
	movzx	ebp, bl	# _188, global
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _173,
# src/compiler.c:701:     if (global <= UINT8_MAX) {
	cmp	ebx, 255	# global,
	jg	.L469	#,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 16	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_176->function, current.0_176->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, ebp	#, _188
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _178,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:145: }
	jmp	.L463	#
	.p2align 4,,10
	.p2align 3
.L501:
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	ecx, DWORD PTR 536870936[rax]	# tmp451, current.68_19->localCount
	sub	ecx, 1	# _22,
# src/compiler.c:655:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	movsxd	rcx, ecx	# _22, _22
	sal	rcx, 5	# tmp344,
	mov	DWORD PTR 48[rax+rcx], edx	# current.68_19->locals[_22].depth, _20
# src/compiler.c:661:         return;
	jmp	.L463	#
	.p2align 4,,10
	.p2align 3
.L497:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L457	#
	.p2align 4,,10
	.p2align 3
.L469:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 17	#,
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_189->function, current.0_189->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, ebp	#, _188
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _191,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_194->function, current.0_194->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bh	# _291, global
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _196,
# src/compiler.c:708:             (uint8_t) ((global >> 16) & 0xff)
	sar	ebx, 16	# _163,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
	movzx	esi, bl	# _292, _163
	jmp	.L491	#
	.p2align 4,,10
	.p2align 3
.L503:
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _156, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _156,
	je	.L504	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _156,
	je	.L468	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L468:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC41[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L466	#
.L504:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L468	#
	.cfi_endproc
.LFE90:
	.size	declaration, .-declaration
	.section	.rodata.str1.1
.LC44:
	.string	"Expect '}' after block."
	.text
	.p2align 4
	.type	block, @function
block:
.LFB75:
	.cfi_startproc
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR parser[rip]	# _3, parser.current.type
# src/compiler.c:722:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 3	# _3,
	je	.L527	#,
# src/compiler.c:721: static void block() {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
	jmp	.L506	#
	.p2align 4,,10
	.p2align 3
.L508:
# src/compiler.c:723:         declaration();
	call	declaration	#
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR parser[rip]	# _3, parser.current.type
# src/compiler.c:722:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 3	# _3,
	je	.L507	#,
.L506:
# src/compiler.c:722:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 53	# _3,
	jne	.L508	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L522	#,
# src/compiler.c:727: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L522:
	.cfi_restore_state
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _10, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _10,
	je	.L528	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _10,
	jne	.L529	#,
.L511:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC44[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:727: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L529:
	.cfi_restore_state
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L511	#
	.p2align 4,,10
	.p2align 3
.L507:
# src/compiler.c:727: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:121:         advance();
	jmp	advance	#
.L528:
	.cfi_restore_state
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L511	#
.L527:
	.cfi_def_cfa_offset 8
# src/compiler.c:121:         advance();
	jmp	advance	#
	.cfi_endproc
.LFE75:
	.size	block, .-block
	.section	.rodata.str1.1
.LC45:
	.string	"Expect '(' after 'for'."
	.section	.rodata.str1.8
	.align 8
.LC46:
	.string	"Expect ';' after loop condition."
	.section	.rodata.str1.1
.LC47:
	.string	"Expect ')' after for clauses."
	.text
	.p2align 4
	.type	forStatement, @function
forStatement:
.LFB83:
	.cfi_startproc
	push	r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	sub	rsp, 1056	#,
	.cfi_def_cfa_offset 1088
# src/compiler.c:232:     current->scopeDepth++;
	mov	rax, QWORD PTR fs:40	# current.67_45, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 1048[rsp], rax	# D.6861, current.67_45
	mov	rax, QWORD PTR current[rip]	# current.67_45, current
# src/compiler.c:232:     current->scopeDepth++;
	add	DWORD PTR 536870940[rax], 1	# current.67_45->scopeDepth,
# src/compiler.c:120:     if (parser.current.type == type) {
	mov	eax, DWORD PTR parser[rip]	# _77, parser.current.type
# src/compiler.c:120:     if (parser.current.type == type) {
	test	eax, eax	# _77
	je	.L563	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L564	#,
.L532:
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 10	# _77,
	je	.L535	#,
.L571:
	cmp	eax, 36	# _77,
	je	.L565	#,
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:792:     consume(TOKEN_SEMICOLON, "Expect ';' after expression statement.");
	lea	rdi, .LC33[rip]	#,
	call	consume.constprop.2	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_88->function, current.0_88->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _90,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
.L538:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current.0_50, current
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR parser[rip], 10	# parser.current.type,
# src/compiler.c:843:     loop.start = currentChunk()->count;
	mov	rdx, QWORD PTR 8[rax]	# current.0_50->function, current.0_50->function
# src/compiler.c:847:     Loop* enclosingLoop = currentLoop;
	mov	rbp, QWORD PTR currentLoop[rip]	# enclosingLoop, currentLoop
# src/compiler.c:843:     loop.start = currentChunk()->count;
	vmovd	xmm0, DWORD PTR 24[rdx]	# MEM[(struct Chunk *)_51 + 24B].count, MEM[(struct Chunk *)_51 + 24B].count
# src/compiler.c:848:     currentLoop = &loop;
	mov	QWORD PTR currentLoop[rip], rsp	# currentLoop,
# src/compiler.c:843:     loop.start = currentChunk()->count;
	vpinsrd	xmm0, xmm0, DWORD PTR 536870940[rax], 1	# _172, MEM[(struct Chunk *)_51 + 24B].count, current.0_50->scopeDepth
# src/compiler.c:845:     loop.breakCount = 0;
	mov	DWORD PTR 1032[rsp], 0	# loop.breakCount,
# src/compiler.c:843:     loop.start = currentChunk()->count;
	vmovq	QWORD PTR [rsp], xmm0	# MEM <vector(2) int> [(int *)&loop], _172
# src/compiler.c:133:     if (!check(type)) return false;
	je	.L566	#,
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:853:         consume(TOKEN_SEMICOLON, "Expect ';' after loop condition.");
	lea	rdi, .LC46[rip]	#,
	call	consume.constprop.2	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_93->function, current.0_93->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 32	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _95,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_97->function, current.0_97->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _99,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_101->function, current.0_101->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _103,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _105, current.0_104->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp291, MEM[(struct Chunk *)_105 + 24B].count
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _55,
# src/compiler.c:167:     return currentChunk()->count - 2;
	lea	ebx, -2[rax]	# exitJump,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
.L540:
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR parser[rip], 1	# parser.current.type,
	je	.L567	#,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_110->function, current.0_110->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 31	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _112,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_114->function, current.0_114->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _116,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_118->function, current.0_118->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _120,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.0_121->function, current.0_121->function
	mov	r12d, DWORD PTR 24[rax]	# _123, MEM[(struct Chunk *)_122 + 24B].count
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_58->function, current.0_58->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _60,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:864:         consume(TOKEN_RIGHT_PAREN, "Expect ')' after for clauses.");
	lea	rdi, .LC47[rip]	#,
	call	consume.constprop.0	#
# src/compiler.c:866:         emitLoop(currentLoop->start);
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop, currentLoop
	mov	edi, DWORD PTR [rax]	# currentLoop.83_3->start, currentLoop.83_3->start
	call	emitLoop	#
# src/compiler.c:867:         currentLoop->start = incrementStart;
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop, currentLoop
# src/compiler.c:167:     return currentChunk()->count - 2;
	lea	edi, -2[r12]	# _124,
# src/compiler.c:867:         currentLoop->start = incrementStart;
	mov	DWORD PTR [rax], r12d	# currentLoop.84_5->start, _123
# src/compiler.c:868:         patchJump(bodyJump);
	call	patchJump	#
.L542:
# src/compiler.c:871:     statement();
	call	statement	#
# src/compiler.c:872:     emitLoop(currentLoop->start);
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop, currentLoop
	mov	edi, DWORD PTR [rax]	# currentLoop.85_6->start, currentLoop.85_6->start
	call	emitLoop	#
# src/compiler.c:874:     if (exitJump != -1) {
	cmp	ebx, -1	# exitJump,
	je	.L543	#,
# src/compiler.c:875:         patchJump(exitJump);
	mov	edi, ebx	#, exitJump
	call	patchJump	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_64->function, current.0_64->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _66,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
.L543:
# src/compiler.c:879:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop.87_9, currentLoop
# src/compiler.c:879:     for (int i = 0; i < currentLoop->breakCount; i++) {
	xor	ebx, ebx	# i
	mov	edx, DWORD PTR 1032[rax]	#, currentLoop.87_155->breakCount
	test	edx, edx	#
	jle	.L547	#,
	.p2align 4,,10
	.p2align 3
.L544:
# src/compiler.c:880:         patchJump(currentLoop->breakJumps[i]);
	movsxd	rdx, ebx	# i, i
	mov	edi, DWORD PTR 8[rax+rdx*4]	# currentLoop.87_92->breakJumps[i_30], currentLoop.87_92->breakJumps[i_30]
# src/compiler.c:879:     for (int i = 0; i < currentLoop->breakCount; i++) {
	add	ebx, 1	# i,
# src/compiler.c:880:         patchJump(currentLoop->breakJumps[i]);
	call	patchJump	#
# src/compiler.c:879:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop.87_9, currentLoop
# src/compiler.c:879:     for (int i = 0; i < currentLoop->breakCount; i++) {
	cmp	DWORD PTR 1032[rax], ebx	# currentLoop.87_9->breakCount, i
	jg	.L544	#,
.L547:
# src/compiler.c:236:     current->scopeDepth--;
	mov	rdx, QWORD PTR current[rip]	# current.96_29, current
# src/compiler.c:883:     currentLoop = enclosingLoop;
	mov	QWORD PTR currentLoop[rip], rbp	# currentLoop, enclosingLoop
# src/compiler.c:236:     current->scopeDepth--;
	mov	eax, DWORD PTR 536870940[rdx]	# tmp292, current.94_125->scopeDepth
	lea	ecx, -1[rax]	# pretmp_177,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	mov	eax, DWORD PTR 536870936[rdx]	# _27, current.94_125->localCount
# src/compiler.c:236:     current->scopeDepth--;
	mov	DWORD PTR 536870940[rdx], ecx	# current.94_125->scopeDepth, pretmp_177
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	test	eax, eax	# _27
	jg	.L545	#,
	jmp	.L530	#
	.p2align 4,,10
	.p2align 3
.L548:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# current.96_29->function, current.96_29->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _131,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
	call	writeChunk@PLT	#
# src/compiler.c:240:         current->localCount--;
	mov	rdx, QWORD PTR current[rip]	# current.96_29, current
# src/compiler.c:240:         current->localCount--;
	mov	eax, DWORD PTR 536870936[rdx]	# tmp293, current.95_132->localCount
	sub	eax, 1	# _27,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	test	eax, eax	# _27
# src/compiler.c:240:         current->localCount--;
	mov	DWORD PTR 536870936[rdx], eax	# current.95_132->localCount, _27
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	jle	.L530	#,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	mov	ecx, DWORD PTR 536870940[rdx]	# pretmp_177, current.95_132->scopeDepth
.L545:
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	sub	eax, 1	# _136,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	cdqe
	sal	rax, 5	# tmp284,
# src/compiler.c:238:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	cmp	DWORD PTR 48[rdx+rax], ecx	# current.96_29->locals[_136].depth, pretmp_177
	jg	.L548	#,
.L530:
# src/compiler.c:886: }
	mov	rax, QWORD PTR 1048[rsp]	# tmp289, D.6861
	sub	rax, QWORD PTR fs:40	# tmp289, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L568	#,
	add	rsp, 1056	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx	#
	.cfi_def_cfa_offset 24
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L564:
	.cfi_restore_state
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _81, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _81,
	je	.L569	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _81,
	jne	.L570	#,
.L534:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	xor	eax, eax	#
	lea	rdx, .LC45[rip]	#,
	lea	rsi, .LC3[rip]	#,
	call	fprintf@PLT	#
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR parser[rip]	# _77, parser.current.type
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 10	# _77,
	jne	.L571	#,
.L535:
# src/compiler.c:134:     advance();
	call	advance	#
	jmp	.L538	#
	.p2align 4,,10
	.p2align 3
.L565:
	call	advance	#
# src/compiler.c:837:         varDeclaration();
	call	varDeclaration	#
	jmp	.L538	#
	.p2align 4,,10
	.p2align 3
.L567:
# src/compiler.c:134:     advance();
	call	advance	#
	jmp	.L542	#
	.p2align 4,,10
	.p2align 3
.L566:
	call	advance	#
# src/compiler.c:850:     int exitJump = -1;
	mov	ebx, -1	# exitJump,
	jmp	.L540	#
	.p2align 4,,10
	.p2align 3
.L570:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L534	#
	.p2align 4,,10
	.p2align 3
.L563:
# src/compiler.c:121:         advance();
	call	advance	#
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR parser[rip]	# _77, parser.current.type
# src/compiler.c:122:         return;
	jmp	.L532	#
.L569:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L534	#
.L568:
# src/compiler.c:886: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE83:
	.size	forStatement, .-forStatement
	.section	.rodata.str1.1
.LC48:
	.string	"Expect '(' after 'switch'."
.LC49:
	.string	"Expect ')' after value."
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"Expect '{' before switch cases."
	.align 8
.LC51:
	.string	"Can't have another case or default after the default case."
	.section	.rodata.str1.1
.LC52:
	.string	"Expect ':' after case value."
.LC53:
	.string	"Expect ':' after default."
	.section	.rodata.str1.8
	.align 8
.LC54:
	.string	"Can't have statements before any case."
	.text
	.p2align 4
	.type	switchStatement, @function
switchStatement:
.LFB87:
	.cfi_startproc
	push	r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	sub	rsp, 1040	#,
	.cfi_def_cfa_offset 1088
# src/compiler.c:934: static void switchStatement() {
	mov	rax, QWORD PTR fs:40	# tmp214, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 1032[rsp], rax	# D.6895, tmp214
	xor	eax, eax	# tmp214
# src/compiler.c:120:     if (parser.current.type == type) {
	mov	eax, DWORD PTR parser[rip]	#, parser.current.type
	test	eax, eax	#
	je	.L629	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L630	#,
.L574:
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:937:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after value.");
	lea	rdi, .LC49[rip]	#,
	call	consume.constprop.0	#
# src/compiler.c:938:     consume(TOKEN_LEFT_BRACE, "Expect '{' before switch cases.");
	lea	rsi, .LC50[rip]	#,
	mov	edi, 2	#,
	call	consume	#
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR parser[rip]	# _53, parser.current.type
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 3	# _53,
	je	.L631	#,
# src/compiler.c:943:     int previousCaseSkip = -1;
	mov	r13d, -1	# previousCaseSkip,
# src/compiler.c:942:     int caseCount = 0;
	xor	ebx, ebx	# caseCount
# src/compiler.c:940:     int state = 0; // 0: before all cases, 1: before default, 2: after default.
	xor	ebp, ebp	# state
.L577:
# src/compiler.c:945:     while (!match(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 53	# _53,
	je	.L596	#,
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 32	# _53,
	je	.L579	#,
	cmp	eax, 37	# _53,
	je	.L579	#,
# src/compiler.c:982:             if (state == 0) {
	test	ebp, ebp	# state
# src/compiler.c:85:     if (parser.panicMode) return;
	lea	r12, parser[rip]	# tmp371,
# src/compiler.c:982:             if (state == 0) {
	je	.L583	#,
.L584:
# src/compiler.c:985:             statement();
	call	statement	#
.L591:
# src/compiler.c:129:     return parser.current.type == type;
	mov	eax, DWORD PTR [r12]	# _53, parser.current.type
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	eax, 3	# _53,
	jne	.L577	#,
# src/compiler.c:134:     advance();
	call	advance	#
.L596:
# src/compiler.c:989:     if (state == 1) {
	cmp	ebp, 1	# state,
	je	.L632	#,
.L598:
# src/compiler.c:994:     for (int i = 0; i < caseCount; i++) {
	test	ebx, ebx	# caseCount
	je	.L595	#,
	mov	r12, rsp	# ivtmp.437,
	movsxd	rbx, ebx	# _233, caseCount
	lea	r13, [r12+rbx*4]	# _231,
# src/compiler.c:85:     if (parser.panicMode) return;
	lea	r14, parser[rip]	# tmp373,
	.p2align 4,,10
	.p2align 3
.L603:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:995:         patchJump(caseEnds[i]);
	movsxd	rbp, DWORD PTR [r12]	#, MEM[(int *)_235]
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _142, current.0_141->function
# src/compiler.c:184:     int jump = currentChunk()->count - offset - 2;
	mov	ebx, DWORD PTR 24[rax]	# _144, MEM[(struct Chunk *)_142 + 24B].count
	sub	ebx, ebp	# _144, _3
# src/compiler.c:184:     int jump = currentChunk()->count - offset - 2;
	sub	ebx, 2	# jump,
# src/compiler.c:186:     if (jump > UINT16_MAX) {
	cmp	ebx, 65535	# jump,
	jle	.L600	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[r14], 0	# parser.panicMode,
	jne	.L600	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR 44[r14]	# MEM[(struct Token *)&parser + 24B].line, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[r14]	# _162, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _162,
	je	.L633	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _162,
	je	.L602	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[r14]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[r14]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L602:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC4[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _142, pretmp_249->function
.L600:
# src/compiler.c:190:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)prephitmp_252 + 24B].code, MEM[(struct Chunk *)prephitmp_252 + 24B].code
# src/compiler.c:994:     for (int i = 0; i < caseCount; i++) {
	add	r12, 4	# ivtmp.437,
# src/compiler.c:190:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	BYTE PTR [rax+rbp], bh	# *_152, jump
# src/compiler.c:994:     for (int i = 0; i < caseCount; i++) {
	cmp	r13, r12	# _231, ivtmp.437
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:191:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 8[rax]	# current.0_154->function, current.0_154->function
# src/compiler.c:191:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)_155 + 24B].code, MEM[(struct Chunk *)_155 + 24B].code
	mov	BYTE PTR 1[rax+rbp], bl	# *_158, jump
# src/compiler.c:994:     for (int i = 0; i < caseCount; i++) {
	jne	.L603	#,
.L595:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	rax, QWORD PTR 1032[rsp]	# tmp377, D.6895
	sub	rax, QWORD PTR fs:40	# tmp377, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L634	#,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_61->function, current.0_61->function
# src/compiler.c:999: }
	add	rsp, 1040	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	pop	rbx	#
	.cfi_def_cfa_offset 40
	pop	rbp	#
	.cfi_def_cfa_offset 32
	pop	r12	#
	.cfi_def_cfa_offset 24
	pop	r13	#
	.cfi_def_cfa_offset 16
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _63,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:999: }
	pop	r14	#
	.cfi_def_cfa_offset 8
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	writeChunk@PLT	#
	.p2align 4,,10
	.p2align 3
.L579:
	.cfi_restore_state
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:949:             if (state == 2) {
	cmp	ebp, 2	# state,
# src/compiler.c:947:             TokenType caseType = parser.previous.type;
	mov	r14d, DWORD PTR parser[rip+24]	# caseType, parser.previous.type
	lea	r12, parser[rip]	# tmp371,
# src/compiler.c:949:             if (state == 2) {
	je	.L635	#,
# src/compiler.c:953:             if (state == 1) {
	cmp	ebp, 1	# state,
	je	.L636	#,
.L589:
# src/compiler.c:962:             if (caseType == TOKEN_CASE) {
	cmp	r14d, 32	# caseType,
	je	.L637	#,
# src/compiler.c:978:                 consume(TOKEN_COLON, "Expect ':' after default.");
	lea	rsi, .LC53[rip]	#,
	mov	edi, 5	#,
	call	consume	#
# src/compiler.c:979:                 previousCaseSkip = -1;
	mov	r13d, -1	# previousCaseSkip,
# src/compiler.c:977:                 state = 2;
	mov	ebp, 2	# state,
	jmp	.L591	#
	.p2align 4,,10
	.p2align 3
.L630:
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _85, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _85,
	je	.L638	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _85,
	jne	.L639	#,
.L576:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC48[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L574	#
	.p2align 4,,10
	.p2align 3
.L583:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L584	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _135, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _135,
	je	.L640	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _135,
	je	.L593	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L593:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC54[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L584	#
	.p2align 4,,10
	.p2align 3
.L632:
# src/compiler.c:990:         patchJump(previousCaseSkip);
	mov	edi, r13d	#, previousCaseSkip
	call	patchJump	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_57->function, current.0_57->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _59,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:140: }
	jmp	.L598	#
	.p2align 4,,10
	.p2align 3
.L633:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L602	#
	.p2align 4,,10
	.p2align 3
.L631:
# src/compiler.c:134:     advance();
	call	advance	#
	jmp	.L595	#
	.p2align 4,,10
	.p2align 3
.L637:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_49->function, current.0_49->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 30	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _51,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:969:                 consume(TOKEN_COLON, "Expect ':' after case value.");
	lea	rsi, .LC52[rip]	#,
	mov	edi, 5	#,
	call	consume	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_45->function, current.0_45->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 20	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _47,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_118->function, current.0_118->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 32	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _120,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_122->function, current.0_122->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _124,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_126->function, current.0_126->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _128,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _130, current.0_129->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp379, MEM[(struct Chunk *)_130 + 24B].count
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _43,
# src/compiler.c:167:     return currentChunk()->count - 2;
	lea	r13d, -2[rax]	# previousCaseSkip,
# src/compiler.c:963:                 state = 1;
	mov	ebp, 1	# state,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:140: }
	jmp	.L591	#
	.p2align 4,,10
	.p2align 3
.L635:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	jne	.L589	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip+24]	# _93, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _93,
	je	.L641	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _93,
	je	.L587	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR parser[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L587:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC51[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L589	#
	.p2align 4,,10
	.p2align 3
.L636:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_101->function, current.0_101->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 31	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _103,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_105->function, current.0_105->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _107,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_109->function, current.0_109->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _111,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:955:                 caseEnds[caseCount++] = emitJump(OP_JUMP);
	movsxd	rdx, ebx	# caseCount, caseCount
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.0_112->function, current.0_112->function
# src/compiler.c:958:                 patchJump(previousCaseSkip);
	mov	edi, r13d	#, previousCaseSkip
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_113 + 24B].count, MEM[(struct Chunk *)_113 + 24B].count
# src/compiler.c:955:                 caseEnds[caseCount++] = emitJump(OP_JUMP);
	add	ebx, 1	# caseCount,
# src/compiler.c:167:     return currentChunk()->count - 2;
	sub	eax, 2	# _115,
# src/compiler.c:955:                 caseEnds[caseCount++] = emitJump(OP_JUMP);
	mov	DWORD PTR [rsp+rdx*4], eax	# caseEnds[caseCount_33], _115
# src/compiler.c:958:                 patchJump(previousCaseSkip);
	call	patchJump	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_37->function, current.0_37->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _39,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:140: }
	jmp	.L589	#
	.p2align 4,,10
	.p2align 3
.L639:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L576	#
	.p2align 4,,10
	.p2align 3
.L629:
# src/compiler.c:121:         advance();
	call	advance	#
# src/compiler.c:122:         return;
	jmp	.L574	#
.L638:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L576	#
.L640:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L593	#
.L641:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L587	#
.L634:
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE87:
	.size	switchStatement, .-switchStatement
	.section	.rodata.str1.1
.LC55:
	.string	"Expect '(' after 'while'."
	.section	.rodata.str1.8
	.align 8
.LC56:
	.string	"Expect ')' after loop condition."
	.text
	.p2align 4
	.type	whileStatement, @function
whileStatement:
.LFB88:
	.cfi_startproc
	push	r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	sub	rsp, 1056	#,
	.cfi_def_cfa_offset 1104
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR fs:40	# current.0_35, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 1048[rsp], rax	# D.6930, current.0_35
	mov	rax, QWORD PTR current[rip]	# current.0_35, current
# src/compiler.c:120:     if (parser.current.type == type) {
	mov	ecx, DWORD PTR parser[rip]	#, parser.current.type
# src/compiler.c:1007:     Loop* enclosingLoop = currentLoop;
	mov	r13, QWORD PTR currentLoop[rip]	# enclosingLoop, currentLoop
# src/compiler.c:120:     if (parser.current.type == type) {
	test	ecx, ecx	#
# src/compiler.c:1008:     currentLoop = &loop;
	mov	QWORD PTR currentLoop[rip], rsp	# currentLoop,
# src/compiler.c:1003:     loop.start = currentChunk()->count;
	mov	rdx, QWORD PTR 8[rax]	# current.0_35->function, current.0_35->function
# src/compiler.c:1003:     loop.start = currentChunk()->count;
	vmovd	xmm0, DWORD PTR 24[rdx]	# MEM[(struct Chunk *)_36 + 24B].count, MEM[(struct Chunk *)_36 + 24B].count
# src/compiler.c:1005:     loop.breakCount = 0;
	mov	DWORD PTR 1032[rsp], 0	# loop.breakCount,
# src/compiler.c:1003:     loop.start = currentChunk()->count;
	vpinsrd	xmm0, xmm0, DWORD PTR 536870940[rax], 1	# _151, MEM[(struct Chunk *)_36 + 24B].count, current.0_35->scopeDepth
	vmovq	QWORD PTR [rsp], xmm0	# MEM <vector(2) int> [(int *)&loop], _151
# src/compiler.c:120:     if (parser.current.type == type) {
	je	.L672	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L673	#,
.L644:
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], 1	# parser.current.type,
	je	.L674	#,
.L647:
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR parser[rip+49], 0	# parser.panicMode,
	je	.L675	#,
.L648:
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_42->function, current.0_42->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 32	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _44,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_46->function, current.0_46->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _48,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_50->function, current.0_50->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 255	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _52,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _54, current.0_53->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:167:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp281, MEM[(struct Chunk *)_54 + 24B].count
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _34,
# src/compiler.c:167:     return currentChunk()->count - 2;
	lea	ebx, -2[rax]	# _56,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:1016:     statement();
	call	statement	#
# src/compiler.c:1017:     emitLoop(currentLoop->start);
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop, currentLoop
# src/compiler.c:1022:     for (int i = 0; i < currentLoop->breakCount; i++) {
	xor	r12d, r12d	# i
# src/compiler.c:1017:     emitLoop(currentLoop->start);
	mov	edi, DWORD PTR [rax]	# currentLoop.91_3->start, currentLoop.91_3->start
	call	emitLoop	#
# src/compiler.c:1019:     patchJump(exitJump);
	mov	edi, ebx	#, _56
	call	patchJump	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_28->function, current.0_28->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _30,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:1022:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop.93_6, currentLoop
# src/compiler.c:1022:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	edx, DWORD PTR 1032[rax]	#, currentLoop.93_127->breakCount
	test	edx, edx	#
	jle	.L655	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	lea	r14, parser[rip]	# tmp275,
	.p2align 4,,10
	.p2align 3
.L651:
# src/compiler.c:1023:         patchJump(currentLoop->breakJumps[i]);
	movsxd	rdx, r12d	# i, i
	movsxd	rbp, DWORD PTR 8[rax+rdx*4]	#, currentLoop.93_20->breakJumps[i_26]
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
	mov	rax, QWORD PTR 8[rax]	# _78, current.0_77->function
# src/compiler.c:184:     int jump = currentChunk()->count - offset - 2;
	mov	ebx, DWORD PTR 24[rax]	# _80, MEM[(struct Chunk *)_78 + 24B].count
	sub	ebx, ebp	# _80, _5
# src/compiler.c:184:     int jump = currentChunk()->count - offset - 2;
	sub	ebx, 2	# jump,
# src/compiler.c:186:     if (jump > UINT16_MAX) {
	cmp	ebx, 65535	# jump,
	jle	.L652	#,
# src/compiler.c:85:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[r14], 0	# parser.panicMode,
	jne	.L652	#,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR 44[r14]	# MEM[(struct Token *)&parser + 24B].line, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[r14]	# _98, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _98,
	je	.L676	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _98,
	je	.L654	#,
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[r14]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[r14]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
.L654:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC4[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _78, pretmp_157->function
.L652:
# src/compiler.c:190:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)prephitmp_160 + 24B].code, MEM[(struct Chunk *)prephitmp_160 + 24B].code
# src/compiler.c:1022:     for (int i = 0; i < currentLoop->breakCount; i++) {
	add	r12d, 1	# i,
# src/compiler.c:190:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	BYTE PTR [rax+rbp], bh	# *_88, jump
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:191:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 8[rax]	# current.0_90->function, current.0_90->function
# src/compiler.c:191:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)_91 + 24B].code, MEM[(struct Chunk *)_91 + 24B].code
	mov	BYTE PTR 1[rax+rbp], bl	# *_94, jump
# src/compiler.c:1022:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	rax, QWORD PTR currentLoop[rip]	# currentLoop.93_6, currentLoop
# src/compiler.c:1022:     for (int i = 0; i < currentLoop->breakCount; i++) {
	cmp	DWORD PTR 1032[rax], r12d	# currentLoop.93_6->breakCount, i
	jg	.L651	#,
.L655:
# src/compiler.c:1026:     currentLoop = enclosingLoop;
	mov	QWORD PTR currentLoop[rip], r13	# currentLoop, enclosingLoop
# src/compiler.c:1027: }
	mov	rax, QWORD PTR 1048[rsp]	# tmp279, D.6930
	sub	rax, QWORD PTR fs:40	# tmp279, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L677	#,
	add	rsp, 1056	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	pop	rbx	#
	.cfi_def_cfa_offset 40
	pop	rbp	#
	.cfi_def_cfa_offset 32
	pop	r12	#
	.cfi_def_cfa_offset 24
	pop	r13	#
	.cfi_def_cfa_offset 16
	pop	r14	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L675:
	.cfi_restore_state
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _71, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _71,
	je	.L678	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _71,
	jne	.L679	#,
.L650:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC56[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
	jmp	.L648	#
	.p2align 4,,10
	.p2align 3
.L673:
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, DWORD PTR parser[rip+20]	#, parser.line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:86:     parser.panicMode = true;
	mov	BYTE PTR parser[rip+49], 1	# parser.panicMode,
# src/compiler.c:87:     fprintf(stderr, "[line %04d] Error", token->line);
	call	fprintf@PLT	#
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR parser[rip]	# _63, parser.type
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
# src/compiler.c:89:     if (token->type == TOKEN_EOF) {
	cmp	eax, 53	# _63,
	je	.L680	#,
# src/compiler.c:91:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 52	# _63,
	jne	.L681	#,
.L646:
# src/compiler.c:96:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC55[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/compiler.c:97:     parser.hadError = true;
	mov	BYTE PTR parser[rip+48], 1	# parser.hadError,
# src/compiler.c:718:     parsePrecedence(PREC_ASSIGNMENT);
	call	parsePrecedence.constprop.0	#
# src/compiler.c:120:     if (parser.current.type == type) {
	cmp	DWORD PTR parser[rip], 1	# parser.current.type,
	jne	.L647	#,
.L674:
# src/compiler.c:121:         advance();
	call	advance	#
# src/compiler.c:122:         return;
	jmp	.L648	#
	.p2align 4,,10
	.p2align 3
.L676:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L654	#
	.p2align 4,,10
	.p2align 3
.L681:
# src/compiler.c:93:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L646	#
	.p2align 4,,10
	.p2align 3
.L679:
	mov	rcx, QWORD PTR parser[rip+8]	#, parser.start
	mov	edx, DWORD PTR parser[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L650	#
	.p2align 4,,10
	.p2align 3
.L672:
# src/compiler.c:121:         advance();
	call	advance	#
# src/compiler.c:122:         return;
	jmp	.L644	#
.L680:
# src/compiler.c:90:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L646	#
.L678:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	lea	rdi, .LC1[rip]	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
	mov	rdi, QWORD PTR stderr[rip]	# stderr, stderr
	jmp	.L650	#
.L677:
# src/compiler.c:1027: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE88:
	.size	whileStatement, .-whileStatement
	.p2align 4
	.globl	compile
	.type	compile, @function
compile:
.LFB92:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:1094:     initScanner(source);
	call	initScanner@PLT	#
# src/compiler.c:1095:     Compiler* compiler = malloc(sizeof(Compiler));
	mov	edi, 536870944	#,
	call	malloc@PLT	#
	mov	rbx, rax	# tmp148,
# src/compiler.c:195:     compiler->enclosing = current;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:196:     compiler->function = NULL;
	mov	QWORD PTR 8[rbx], 0	# compiler_8->function,
# src/compiler.c:195:     compiler->enclosing = current;
	mov	QWORD PTR [rbx], rax	# compiler_8->enclosing, current
# src/compiler.c:197:     compiler->type = type;
	mov	DWORD PTR 16[rbx], 1	# compiler_8->type,
# src/compiler.c:198:     compiler->localCount = 0;
	mov	QWORD PTR 536870936[rbx], 0	# MEM <vector(2) int> [(int *)compiler_8 + 536870936B],
# src/compiler.c:200:     compiler->function = newFunction();
	call	newFunction@PLT	#
# src/compiler.c:200:     compiler->function = newFunction();
	mov	QWORD PTR 8[rbx], rax	# compiler_8->function, _22
# src/compiler.c:201:     compiler->function->arity = 0;
	mov	DWORD PTR 16[rax], 0	# _22->arity,
# src/compiler.c:208:     Local* local = &current->locals[current->localCount++];
	movsxd	rax, DWORD PTR 536870936[rbx]	#, compiler_8->localCount
# src/compiler.c:202:     current = compiler;
	mov	QWORD PTR current[rip], rbx	# current, tmp148
# src/compiler.c:208:     Local* local = &current->locals[current->localCount++];
	lea	edx, 1[rax]	# tmp124,
	sal	rax, 5	# _10,
	mov	DWORD PTR 536870936[rbx], edx	# compiler_8->localCount, tmp124
	add	rbx, rax	# _41, _10
# src/compiler.c:210:     local->name.start = "";
	lea	rax, .LC35[rip]	# tmp151,
# src/compiler.c:209:     local->depth = 0;
	mov	DWORD PTR 48[rbx], 0	# MEM <int> [(struct Local *)_41 + 48B],
# src/compiler.c:210:     local->name.start = "";
	mov	QWORD PTR 32[rbx], rax	# MEM <const char *> [(struct Local *)_41 + 32B], tmp151
# src/compiler.c:211:     local->name.length = 0;
	mov	DWORD PTR 40[rbx], 0	# MEM <int> [(struct Local *)_41 + 40B],
# src/compiler.c:1098:     parser.hadError = false;
	mov	WORD PTR parser[rip+48], 0	# MEM <vector(2) unsigned char> [(_Bool *)&parser + 48B],
# src/compiler.c:1101:     advance();
	call	advance	#
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR parser[rip], 53	# parser.current.type,
	je	.L683	#,
	lea	rbx, parser[rip]	# tmp145,
.L684:
# src/compiler.c:1104:         declaration();
	call	declaration	#
# src/compiler.c:133:     if (!check(type)) return false;
	cmp	DWORD PTR [rbx], 53	# parser.current.type,
	jne	.L684	#,
.L683:
# src/compiler.c:134:     advance();
	call	advance	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_30->function, current.0_30->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 2	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _32,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:81:     return &current->function->chunk;
	mov	rax, QWORD PTR current[rip]	# current, current
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR parser[rip+44]	#, parser.previous.line
# src/compiler.c:81:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.0_34->function, current.0_34->function
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 35	#,
# src/compiler.c:81:     return &current->function->chunk;
	add	rdi, 24	# _36,
# src/compiler.c:139:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	writeChunk@PLT	#
# src/compiler.c:216:     ObjFunction* function = current->function;
	mov	rdx, QWORD PTR current[rip]	# current.100_15, current
# src/compiler.c:1109: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/compiler.c:216:     ObjFunction* function = current->function;
	mov	rax, QWORD PTR 8[rdx]	# <retval>, current.100_15->function
# src/compiler.c:227:     current = current->enclosing;
	mov	rdx, QWORD PTR [rdx]	# current.100_15->enclosing, current.100_15->enclosing
	mov	QWORD PTR current[rip], rdx	# current, current.100_15->enclosing
# src/compiler.c:1108:     return parser.hadError ? NULL : function;
	xor	edx, edx	# tmp146
	cmp	BYTE PTR parser[rip+48], 0	# parser.hadError,
	cmovne	rax, rdx	# <retval>,, <retval>, tmp146
# src/compiler.c:1109: }
	ret	
	.cfi_endproc
.LFE92:
	.size	compile, .-compile
	.globl	rules
	.section	.data.rel.local,"aw"
	.align 32
	.type	rules, @object
	.size	rules, 1296
rules:
# prefix:
	.quad	grouping
# infix:
	.quad	call
# precedence:
	.long	10
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	dot
# precedence:
	.long	10
	.zero	4
# prefix:
	.quad	unary
# infix:
	.quad	binary
# precedence:
	.long	7
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	7
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	ternary
# precedence:
	.long	2
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	8
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	8
	.zero	4
	.zero	96
# prefix:
	.quad	preInc
# infix:
	.quad	0
# precedence:
	.long	10
	.zero	4
# prefix:
	.quad	preDec
# infix:
	.quad	0
# precedence:
	.long	10
	.zero	4
# prefix:
	.quad	unary
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	5
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	5
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	6
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	6
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	6
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	binary
# precedence:
	.long	6
	.zero	4
# prefix:
	.quad	variable
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	string
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	number
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	and_
# precedence:
	.long	4
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	literal
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	literal
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	or_
# precedence:
	.long	3
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	literal
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
	.globl	currentLoop
	.bss
	.align 8
	.type	currentLoop, @object
	.size	currentLoop, 8
currentLoop:
	.zero	8
	.globl	compilingChunk
	.align 8
	.type	compilingChunk, @object
	.size	compilingChunk, 8
compilingChunk:
	.zero	8
	.globl	current
	.align 8
	.type	current, @object
	.size	current, 8
current:
	.zero	8
	.globl	parser
	.align 32
	.type	parser, @object
	.size	parser, 56
parser:
	.zero	56
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC15:
	.long	0
	.long	1072693248
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
