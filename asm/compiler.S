	.file	"compiler.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.type	"endScope", @function
"endScope":
.LFB46:
	.cfi_startproc
# src/compiler.c:292:     current->scopeDepth--;
	mov	rdx, QWORD PTR "current"[rip]	# current.84_5, current
# src/compiler.c:292:     current->scopeDepth--;
	mov	eax, DWORD PTR 524828[rdx]	# tmp121, current.81_1->scopeDepth
	lea	ecx, -1[rax]	# pretmp_34,
# src/compiler.c:294:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	mov	eax, DWORD PTR 524312[rdx]	#, current.81_1->localCount
# src/compiler.c:292:     current->scopeDepth--;
	mov	DWORD PTR 524828[rdx], ecx	# current.81_1->scopeDepth, pretmp_34
# src/compiler.c:294:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	test	eax, eax	# _7
	jle	.L14	#,
	sal	rax, 5	# _36,
	add	rax, rdx	# _33, current.84_5
# src/compiler.c:294:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	cmp	DWORD PTR 16[rax], ecx	# MEM <int> [(struct Compiler *)_33 + 16B], pretmp_34
	jle	.L15	#,
# src/compiler.c:291: static void endScope() {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
	jmp	.L6	#
	.p2align 4,,10
	.p2align 3
.L16:
	sal	rax, 5	# _36,
# src/compiler.c:294:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	mov	ecx, DWORD PTR 524828[rdx]	# pretmp_34, current.84_23->scopeDepth
	add	rax, rdx	# _33, current.84_5
# src/compiler.c:294:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	cmp	DWORD PTR 16[rax], ecx	# MEM <int> [(struct Compiler *)_33 + 16B], pretmp_34
	jle	.L1	#,
.L6:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# current.85_29->function, current.85_29->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 59	#,
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _39,
# src/compiler.c:295:         if (current->locals[current->localCount - 1].isCaptured) {
	cmp	BYTE PTR 20[rax], 0	# MEM <_Bool> [(struct Compiler *)_33 + 20B],
	jne	.L12	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 5	#,
.L12:
	call	"writeChunk"@PLT	#
# src/compiler.c:300:         current->localCount--;
	mov	rdx, QWORD PTR "current"[rip]	# current.84_5, current
# src/compiler.c:300:         current->localCount--;
	mov	eax, DWORD PTR 524312[rdx]	# tmp123,
	sub	eax, 1	#,
	mov	DWORD PTR 524312[rdx], eax	#, _7
# src/compiler.c:294:     while (current->localCount > 0 && current->locals[current->localCount - 1].depth > current->scopeDepth) {
	test	eax, eax	# _7
	jg	.L16	#,
.L1:
# src/compiler.c:302: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 8
	ret	
.L14:
	ret	
.L15:
	ret	
	.cfi_endproc
.LFE46:
	.size	"endScope", .-"endScope"
	.p2align 4
	.type	"number", @function
"number":
.LFB54:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/compiler.c:513:     double value = strtod(parser.previous.start, NULL);
	mov	rdi, QWORD PTR "parser"[rip+32]	#, parser.previous.start
	xor	esi, esi	#
	call	"strtod"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:518:     lastExpr.isConst = true;
	mov	BYTE PTR "lastExpr"[rip], 1	# lastExpr.isConst,
# src/value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rsi, xmm0	# _13,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _15, current.7_14->function
# src/compiler.c:519:     lastExpr.value   = NUMBER_VAL(value);
	mov	QWORD PTR "lastExpr"[rip+8], rsi	# lastExpr.value, _13
# src/compiler.c:516:     lastExpr.chunkSizeBefore = currentChunk()->count;
	movq	xmm2, QWORD PTR 24[rdi]	# MEM <vector(2) int> [(int *)_15 + 24B], MEM <vector(2) int> [(int *)_15 + 24B]
	movq	xmm0, QWORD PTR 56[rdi]	# MEM <vector(2) int> [(int *)_15 + 56B], MEM <vector(2) int> [(int *)_15 + 56B]
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	add	rdi, 24	# vectp.228_17,
# src/compiler.c:516:     lastExpr.chunkSizeBefore = currentChunk()->count;
	pblendw	xmm0, xmm2, 3	# tmp116, MEM <vector(2) int> [(int *)_15 + 24B],
# src/compiler.c:516:     lastExpr.chunkSizeBefore = currentChunk()->count;
	movq	QWORD PTR "lastExpr"[rip+16], xmm0	# MEM <vector(2) int> [(int *)&lastExpr + 16B], tmp116
# src/compiler.c:523: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	jmp	"writeConstant"@PLT	#
	.cfi_endproc
.LFE54:
	.size	"number", .-"number"
	.p2align 4
	.type	"string", @function
"string":
.LFB57:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/compiler.c:557:     emitConstant(OBJ_VAL(copyString(parser.previous.start, parser.previous.length)));
	mov	esi, DWORD PTR "parser"[rip+40]	#, parser.previous.length
	mov	rdi, QWORD PTR "parser"[rip+32]	#, parser.previous.start
	call	"copyString"@PLT	#
# src/compiler.c:557:     emitConstant(OBJ_VAL(copyString(parser.previous.start, parser.previous.length)));
	movabs	rdx, -1125899906842624	# tmp116,
	or	rax, rdx	# _3, tmp116
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:557:     emitConstant(OBJ_VAL(copyString(parser.previous.start, parser.previous.length)));
	mov	rsi, rax	# _5, _3
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_11->function, current.7_11->function
	add	rdi, 24	# _13,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:558:     free(parser.previous.start);
	mov	rdi, QWORD PTR "parser"[rip+32]	#, parser.previous.start
# src/compiler.c:559: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:558:     free(parser.previous.start);
	jmp	"free"@PLT	#
	.cfi_endproc
.LFE57:
	.size	"string", .-"string"
	.p2align 4
	.type	"literal", @function
"literal":
.LFB52:
	.cfi_startproc
# src/compiler.c:478:     switch (parser.previous.type) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _1, parser.previous.type
# src/compiler.c:478:     switch (parser.previous.type) {
	cmp	eax, 54	# _1,
	je	.L22	#,
	cmp	eax, 61	# _1,
	je	.L23	#,
	cmp	eax, 50	# _1,
	jne	.L21	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 4	#,
# src/compiler.c:483:             lastExpr.isConst = true;
	mov	BYTE PTR "lastExpr"[rip], 1	# lastExpr.isConst,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _24, current.7_23->function
# src/compiler.c:484:             lastExpr.value   = BOOL_VAL(false);
	movabs	rax, 9222246136947933186	# tmp150,
	mov	QWORD PTR "lastExpr"[rip+8], rax	# lastExpr.value, tmp150
# src/compiler.c:481:             lastExpr.chunkSizeBefore = currentChunk()->count;
	movq	xmm1, QWORD PTR 24[rdi]	# MEM <vector(2) int> [(int *)_24 + 24B], MEM <vector(2) int> [(int *)_24 + 24B]
	movq	xmm0, QWORD PTR 56[rdi]	# MEM <vector(2) int> [(int *)_24 + 56B], MEM <vector(2) int> [(int *)_24 + 56B]
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	add	rdi, 24	# vectp.254_45,
# src/compiler.c:481:             lastExpr.chunkSizeBefore = currentChunk()->count;
	pblendw	xmm0, xmm1, 3	# tmp124, MEM <vector(2) int> [(int *)_24 + 24B],
# src/compiler.c:481:             lastExpr.chunkSizeBefore = currentChunk()->count;
	movq	QWORD PTR "lastExpr"[rip+16], xmm0	# MEM <vector(2) int> [(int *)&lastExpr + 16B], tmp124
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L23:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 3	#,
# src/compiler.c:492:             lastExpr.isConst = true;
	mov	BYTE PTR "lastExpr"[rip], 1	# lastExpr.isConst,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _16, current.7_15->function
# src/compiler.c:493:             lastExpr.value   = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# tmp151,
	mov	QWORD PTR "lastExpr"[rip+8], rax	# lastExpr.value, tmp151
# src/compiler.c:490:             lastExpr.chunkSizeBefore = currentChunk()->count;
	movq	xmm1, QWORD PTR 24[rdi]	# MEM <vector(2) int> [(int *)_16 + 24B], MEM <vector(2) int> [(int *)_16 + 24B]
	movq	xmm0, QWORD PTR 56[rdi]	# MEM <vector(2) int> [(int *)_16 + 56B], MEM <vector(2) int> [(int *)_16 + 56B]
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	add	rdi, 24	# vectp.244_11,
# src/compiler.c:490:             lastExpr.chunkSizeBefore = currentChunk()->count;
	pblendw	xmm0, xmm1, 3	# tmp136, MEM <vector(2) int> [(int *)_16 + 24B],
# src/compiler.c:490:             lastExpr.chunkSizeBefore = currentChunk()->count;
	movq	QWORD PTR "lastExpr"[rip+16], xmm0	# MEM <vector(2) int> [(int *)&lastExpr + 16B], tmp136
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L22:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 2	#,
# src/compiler.c:499:             lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_18->function, current.7_18->function
	add	rdi, 24	# _20,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L21:
# src/compiler.c:505: }
	ret	
	.cfi_endproc
.LFE52:
	.size	"literal", .-"literal"
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
	.type	"advance", @function
"advance":
.LFB30:
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
	sub	rsp, 48	#,
	.cfi_def_cfa_offset 80
# src/compiler.c:150:     parser.previous = parser.current;
	movdqa	xmm0, XMMWORD PTR "parser"[rip]	# parser.current, parser.current
	mov	rbx, QWORD PTR fs:40	# tmp141, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 40[rsp], rbx	# D.8320, tmp141
	lea	rbx, "parser"[rip]	# tmp141,
	movups	XMMWORD PTR "parser"[rip+24], xmm0	# parser.previous, parser.current
	mov	rax, QWORD PTR 16[rbx]	# parser.current, parser.current
	lea	rbp, 16[rbx]	# tmp140,
	mov	QWORD PTR "parser"[rip+40], rax	# parser.previous, parser.current
	.p2align 4
	.p2align 3
.L30:
# src/compiler.c:153:         parser.current = scanToken();
	mov	rdi, rsp	#,
	call	"scanToken"@PLT	#
	movdqu	xmm1, XMMWORD PTR [rsp]	# tmp150,
	movaps	XMMWORD PTR [rbx], xmm1	# parser.current, tmp150
	mov	rax, QWORD PTR 16[rsp]	# tmp119,
	mov	QWORD PTR 0[rbp], rax	# parser.current, tmp119
# src/compiler.c:154:         if (parser.current.type != TOKEN_ERROR) break;
	cmp	DWORD PTR [rsp], 64	#,
	jne	.L25	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbx], 0	# parser.panicMode,
	jne	.L30	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	edx, DWORD PTR 20[rbx]	# parser.line, parser.line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:156:         errorAtCurrent(parser.current.start);
	mov	r12, QWORD PTR 8[rbx]	# _2, parser.current.start
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR [rbx]	# _12, parser.type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _12,
	je	.L36	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _12,
	je	.L29	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 8[rbx]	# parser.start, parser.start
	mov	edx, DWORD PTR 16[rbx]	# parser.length, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L29:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	mov	rdx, r12	#, _2
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:153:         parser.current = scanToken();
	jmp	.L30	#
	.p2align 4,,10
	.p2align 3
.L25:
# src/compiler.c:158: }
	mov	rax, QWORD PTR 40[rsp]	# tmp148, D.8320
	sub	rax, QWORD PTR fs:40	# tmp148, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L37	#,
	add	rsp, 48	#,
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
.L36:
	.cfi_restore_state
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L29	#
.L37:
# src/compiler.c:158: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE30:
	.size	"advance", .-"advance"
	.p2align 4
	.type	"consume", @function
"consume":
.LFB31:
	.cfi_startproc
# src/compiler.c:161:     if (parser.current.type == type) {
	cmp	DWORD PTR "parser"[rip], edi	# parser.current.type, type
	je	.L50	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	je	.L51	#,
	ret	
	.p2align 4,,10
	.p2align 3
.L51:
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+20]	#, parser.line
# src/compiler.c:160: static void consume(TokenType type, const char* message) {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	xor	eax, eax	#
	mov	rbx, rsi	# message, message
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip]	# _11, parser.type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _11,
	je	.L52	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _11,
	jne	.L53	#,
.L42:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	mov	rdx, rbx	#, message
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:167: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L53:
	.cfi_restore_state
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+8]	#, parser.start
	mov	edx, DWORD PTR "parser"[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L42	#
	.p2align 4,,10
	.p2align 3
.L50:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/compiler.c:162:         advance();
	jmp	"advance"	#
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L42	#
	.cfi_endproc
.LFE31:
	.size	"consume", .-"consume"
	.section	.rodata.str1.1
.LC4:
	.string	"Too much code to jump over."
	.text
	.p2align 4
	.type	"patchJump", @function
"patchJump":
.LFB42:
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
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rax, QWORD PTR 8[rax]	# _16, current.7_18->function
# src/compiler.c:228:     int jump = currentChunk()->count - offset - 2;
	mov	ebx, DWORD PTR 24[rax]	# _2, MEM[(struct Chunk *)_16 + 24B].count
	sub	ebx, ebp	# _2, offset
# src/compiler.c:228:     int jump = currentChunk()->count - offset - 2;
	sub	ebx, 2	# jump,
# src/compiler.c:230:     if (jump > UINT16_MAX) {
	cmp	ebx, 65535	# jump,
	jle	.L57	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	je	.L64	#,
.L57:
# src/compiler.c:234:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)prephitmp_49 + 24B].code, MEM[(struct Chunk *)prephitmp_49 + 24B].code
	mov	BYTE PTR [rax+rbp], bh	# *_6, jump
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:235:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 8[rax]	# current.7_21->function, current.7_21->function
# src/compiler.c:235:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)_22 + 24B].code, MEM[(struct Chunk *)_22 + 24B].code
	mov	BYTE PTR 1[rax+rbp], bl	# *_10, jump
# src/compiler.c:236: }
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
.L64:
	.cfi_restore_state
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _28, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _28,
	je	.L65	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _28,
	je	.L59	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L59:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC4[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _16, pretmp_46->function
	jmp	.L57	#
	.p2align 4,,10
	.p2align 3
.L65:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L59	#
	.cfi_endproc
.LFE42:
	.size	"patchJump", .-"patchJump"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"Too many local variables currently in scope."
	.text
	.p2align 4
	.type	"addLocal", @function
"addLocal":
.LFB75:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/compiler.c:978:     if (current->localCount >= ARB_COUNT) {
	mov	rax, QWORD PTR "current"[rip]	# current.69_1, current
	movsxd	rdx, DWORD PTR 524312[rax]	#, current.69_1->localCount
# src/compiler.c:978:     if (current->localCount >= ARB_COUNT) {
	cmp	edx, 16383	# _2,
	jg	.L75	#,
# src/compiler.c:983:     Local* local = &current->locals[current->localCount++];
	lea	ecx, 1[rdx]	# tmp129,
# src/compiler.c:984:     local->name = name;
	sal	rdx, 5	# tmp131,
	movdqu	xmm0, XMMWORD PTR 16[rsp]	# name, name
# src/compiler.c:983:     Local* local = &current->locals[current->localCount++];
	mov	DWORD PTR 524312[rax], ecx	# current.69_1->localCount, tmp129
# src/compiler.c:984:     local->name = name;
	add	rax, rdx	# tmp132, tmp131
	mov	rdx, QWORD PTR 32[rsp]	# name, name
# src/compiler.c:985:     local->depth = -1;
	mov	DWORD PTR 48[rax], -1	# MEM <int> [(struct Local *)_15 + 48B],
# src/compiler.c:984:     local->name = name;
	mov	QWORD PTR 40[rax], rdx	# MEM <struct Compiler> [(struct Local *)current.69_1].locals[_2].name, name
# src/compiler.c:986:     local->isCaptured = false;
	mov	BYTE PTR 52[rax], 0	# MEM <_Bool> [(struct Local *)_15 + 52B],
# src/compiler.c:984:     local->name = name;
	movups	XMMWORD PTR 24[rax], xmm0	# MEM <struct Compiler> [(struct Local *)current.69_1].locals[_2].name, name
.L66:
# src/compiler.c:987: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L75:
	.cfi_restore_state
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L66	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _14, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _14,
	je	.L76	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _14,
	je	.L70	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L70:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC5[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:987: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L70	#
	.cfi_endproc
.LFE75:
	.size	"addLocal", .-"addLocal"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Already a variable with this name in this scope."
	.text
	.p2align 4
	.type	"declareVariable", @function
"declareVariable":
.LFB76:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 8[rsp], rbp	#,
	.cfi_offset 6, -40
# src/compiler.c:990:     if (current->scopeDepth == 0) return;
	mov	rbp, QWORD PTR "current"[rip]	# prephitmp_95, current
# src/compiler.c:990:     if (current->scopeDepth == 0) return;
	mov	eax, DWORD PTR 524828[rbp]	#, current.64_1->scopeDepth
	test	eax, eax	#
	je	.L77	#,
# src/compiler.c:994:     for (int i = current->localCount - 1; i >= 0; i--) {
	movsxd	rax, DWORD PTR 524312[rbp]	#, current.64_1->localCount
	mov	QWORD PTR [rsp], rbx	#,
	mov	QWORD PTR 24[rsp], r13	#,
	.cfi_offset 3, -48
	.cfi_offset 13, -24
	mov	r13d, DWORD PTR "parser"[rip+40]	# name$length, MEM <int> [(struct Token *)&parser + 40B]
# src/compiler.c:994:     for (int i = current->localCount - 1; i >= 0; i--) {
	mov	ebx, eax	# i, _32
	mov	QWORD PTR 32[rsp], r14	#,
	sub	ebx, 1	# i,
	.cfi_offset 14, -16
	js	.L79	#,
	mov	QWORD PTR 16[rsp], r12	#,
	.cfi_offset 12, -32
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	lea	r12, "parser"[rip]	# tmp203,
	.p2align 4
	.p2align 3
.L88:
	mov	ecx, ebx	# i, i
	mov	rax, rcx	# _111, i
	sal	rax, 5	# _111,
	add	rax, rbp	# _112, prephitmp_95
# src/compiler.c:996:         if (local->depth != -1 && local->depth < current->scopeDepth) {
	mov	edx, DWORD PTR 48[rax]	# _6, MEM <int> [(struct Local *)_112 + 48B]
# src/compiler.c:996:         if (local->depth != -1 && local->depth < current->scopeDepth) {
	cmp	edx, -1	# _6,
	je	.L80	#,
# src/compiler.c:996:         if (local->depth != -1 && local->depth < current->scopeDepth) {
	cmp	edx, DWORD PTR 524828[rbp]	# _6, prephitmp_95->scopeDepth
	jl	.L81	#,
.L80:
# src/compiler.c:916:     if (a->length != b->length) return false;
	cmp	DWORD PTR 40[rax], r13d	# MEM <int> [(struct Token *)_112 + 40B], name$length
	mov	r14, QWORD PTR 32[r12]	# name$start,
	jne	.L83	#,
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	sal	rcx, 5	# tmp152,
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	movsxd	rdx, r13d	# _16, name$length
	mov	rdi, r14	#, name$start
	mov	rsi, QWORD PTR 32[rbp+rcx]	# MEM <struct Compiler> [(struct Token *)prephitmp_95].locals[i_22].name.start, MEM <struct Compiler> [(struct Token *)prephitmp_95].locals[i_22].name.start
	call	"memcmp"@PLT	#
# src/compiler.c:1000:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# tmp207
	jne	.L83	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[r12], 0	# parser.panicMode,
	jne	.L83	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR 44[r12]	# pretmp_121, MEM <int> [(struct Token *)&parser + 44B]
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[r12]	# _25, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _25,
	je	.L106	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _25,
	jne	.L107	#,
.L87:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC6[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	r14, QWORD PTR 32[r12]	# name$start, MEM <const char *> [(struct Token *)&parser + 32B]
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	mov	r13d, DWORD PTR 40[r12]	# name$length, MEM <int> [(struct Token *)&parser + 40B]
# src/compiler.c:978:     if (current->localCount >= ARB_COUNT) {
	mov	rbp, QWORD PTR "current"[rip]	# prephitmp_95, current
	.p2align 4
	.p2align 3
.L83:
# src/compiler.c:994:     for (int i = current->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# i,
	jnb	.L88	#,
.L89:
# src/compiler.c:978:     if (current->localCount >= ARB_COUNT) {
	movsxd	rax, DWORD PTR 524312[rbp]	#, prephitmp_104->localCount
	mov	ecx, DWORD PTR "parser"[rip+44]	# name$line, MEM <int> [(struct Token *)&parser + 44B]
# src/compiler.c:978:     if (current->localCount >= ARB_COUNT) {
	cmp	eax, 16383	# _32,
	jg	.L108	#,
	mov	esi, DWORD PTR "parser"[rip+24]	# name, MEM <unsigned int> [(struct Token *)&parser + 24B]
	mov	r12, QWORD PTR 16[rsp]	#,
	.cfi_restore 12
.L93:
# src/compiler.c:983:     Local* local = &current->locals[current->localCount++];
	lea	edx, 1[rax]	# tmp194,
	sal	rax, 5	# _45,
	mov	rbx, QWORD PTR [rsp]	#,
	.cfi_restore 3
	mov	DWORD PTR 524312[rbp], edx	# current.69_83->localCount, tmp194
# src/compiler.c:984:     local->name = name;
	mov	DWORD PTR 24[rbp+rax], esi	# MEM <unsigned int> [(struct  *)_10], name
	mov	DWORD PTR 44[rbp+rax], ecx	# MEM <int> [(struct  *)_10 + 20B], name$line
# src/compiler.c:985:     local->depth = -1;
	mov	DWORD PTR 48[rbp+rax], -1	# MEM <int> [(struct Local *)_91 + 48B],
# src/compiler.c:986:     local->isCaptured = false;
	mov	BYTE PTR 52[rbp+rax], 0	# MEM <_Bool> [(struct Local *)_91 + 52B],
# src/compiler.c:984:     local->name = name;
	mov	QWORD PTR 32[rbp+rax], r14	# MEM <const char *> [(struct  *)_10 + 8B], name$start
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_restore 14
	mov	DWORD PTR 40[rbp+rax], r13d	# MEM <int> [(struct  *)_10 + 16B], name$length
	mov	r13, QWORD PTR 24[rsp]	#,
	.cfi_restore 13
.L77:
# src/compiler.c:1006: }
	mov	rbp, QWORD PTR 8[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L107:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[r12]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[r12]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L87	#
	.p2align 4,,10
	.p2align 3
.L108:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	je	.L109	#,
	mov	rbx, QWORD PTR [rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
	mov	r12, QWORD PTR 16[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 24[rsp]	#,
	.cfi_restore 13
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_restore 14
# src/compiler.c:1006: }
	mov	rbp, QWORD PTR 8[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	mov	r14, QWORD PTR "parser"[rip+32]	# name$start, MEM <const char *> [(struct Token *)&parser + 32B]
	jmp	.L89	#
	.p2align 4,,10
	.p2align 3
.L109:
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, ecx	#, name$line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _37, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _37,
	je	.L110	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _37,
	jne	.L111	#,
.L92:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC5[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	mov	rbx, QWORD PTR [rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
	mov	r12, QWORD PTR 16[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 24[rsp]	#,
	.cfi_restore 13
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_restore 14
# src/compiler.c:1006: }
	mov	rbp, QWORD PTR 8[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L106:
	.cfi_restore_state
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L87	#
.L111:
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L92	#
.L79:
	.cfi_restore 12
	mov	ecx, DWORD PTR "parser"[rip+44]	# name$line, MEM <int> [(struct Token *)&parser + 44B]
	mov	esi, DWORD PTR "parser"[rip+24]	# name, MEM <unsigned int> [(struct Token *)&parser + 24B]
	mov	r14, QWORD PTR "parser"[rip+32]	# name$start, MEM <const char *> [(struct Token *)&parser + 32B]
	jmp	.L93	#
.L110:
	.cfi_offset 12, -32
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L92	#
	.cfi_endproc
.LFE76:
	.size	"declareVariable", .-"declareVariable"
	.section	.rodata.str1.1
.LC7:
	.string	"Expect expression."
.LC8:
	.string	"Invalid assignment target."
	.text
	.p2align 4
	.type	"parsePrecedence.constprop.0", @function
"parsePrecedence.constprop.0":
.LFB124:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
	mov	QWORD PTR 8[rsp], rbx	#,
	.cfi_offset 3, -24
# src/compiler.c:890:     ParseFn prefixRule = getRule(parser.previous.type)->prefix;
	lea	rbx, "rules"[rip]	# tmp194,
# src/compiler.c:889:     advance();
	call	"advance"	#
# src/compiler.c:890:     ParseFn prefixRule = getRule(parser.previous.type)->prefix;
	mov	eax, DWORD PTR "parser"[rip+24]	# parser.previous.type, parser.previous.type
	lea	rax, [rax+rax*2]	# tmp127,
	mov	rax, QWORD PTR [rbx+rax*8]	# prefixRule, MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][_1].prefix
# src/compiler.c:891:     if (prefixRule == NULL) {
	test	rax, rax	# prefixRule
	je	.L129	#,
# src/compiler.c:897:     prefixRule(canAssign);
	mov	edi, 1	#,
	call	rax	# prefixRule
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR "parser"[rip]	#, parser.current.type
	mov	rdx, rax	#,
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	lea	rax, [rax+rax*2]	# tmp152,
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	ecx, DWORD PTR 16[rbx+rax*8]	#, MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][_19].precedence
	test	ecx, ecx	#
	je	.L117	#,
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -16
	lea	rbp, "parser"[rip]	# tmp192,
	.p2align 4
	.p2align 3
.L118:
# src/compiler.c:900:         advance();
	call	"advance"	#
# src/compiler.c:901:         ParseFn infixRule = getRule(parser.previous.type)->infix;
	mov	eax, DWORD PTR 24[rbp]	# parser.previous.type, parser.previous.type
# src/compiler.c:903:         infixRule(canAssign);
	mov	edi, 1	#,
# src/compiler.c:901:         ParseFn infixRule = getRule(parser.previous.type)->infix;
	lea	rax, [rax+rax*2]	# tmp161,
# src/compiler.c:903:         infixRule(canAssign);
	call	[QWORD PTR 8[rbx+rax*8]]	# MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][_5].infix
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR 0[rbp]	#, parser.current.type
	mov	rdx, rax	#,
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	lea	rax, [rax+rax*2]	# tmp171,
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR 16[rbx+rax*8]	#, MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][_7].precedence
	test	eax, eax	#
	jne	.L118	#,
	mov	rbp, QWORD PTR 16[rsp]	#,
	.cfi_restore 6
.L117:
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	edx, 30	# _7,
	je	.L130	#,
.L112:
# src/compiler.c:909: }
	mov	rbx, QWORD PTR 8[rsp]	#,
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L130:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L112	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _30, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _30,
	je	.L131	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _30,
	je	.L120	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L120:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC8[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:909: }
	mov	rbx, QWORD PTR 8[rsp]	#,
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L129:
	.cfi_restore_state
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L112	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _22, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _22,
	je	.L132	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _22,
	jne	.L133	#,
.L116:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC7[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L112	#
.L133:
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L116	#
.L131:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L120	#
.L132:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L116	#
	.cfi_endproc
.LFE124:
	.size	"parsePrecedence.constprop.0", .-"parsePrecedence.constprop.0"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Cannot have more than 255 arguments."
	.section	.rodata.str1.1
.LC10:
	.string	"Expect ')' after arguments."
	.text
	.p2align 4
	.type	"argumentList", @function
"argumentList":
.LFB80:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
	mov	QWORD PTR 8[rsp], rbx	#,
	.cfi_offset 3, -24
# src/compiler.c:1042:     uint8_t argCount = 0;
	xor	ebx, ebx	# <retval>
# src/compiler.c:1043:     if (!check(TOKEN_RIGHT_PAREN)) {
	cmp	DWORD PTR "parser"[rip], 1	# parser.current.type,
	je	.L135	#,
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -16
	lea	rbp, "parser"[rip]	# tmp131,
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1046:             if (argCount == 255) {
	cmp	bl, -1	# <retval>,
	je	.L146	#,
.L136:
# src/compiler.c:1049:             argCount++;
	add	ebx, 1	# <retval>,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR 0[rbp], 6	# parser.current.type,
	je	.L147	#,
	mov	rbp, QWORD PTR 16[rsp]	#,
	.cfi_restore 6
.L135:
# src/compiler.c:1052:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after arguments.");
	lea	rsi, .LC10[rip]	#,
	mov	edi, 1	#,
	call	"consume"	#
# src/compiler.c:1054: }
	mov	eax, ebx	#, <retval>
	mov	rbx, QWORD PTR 8[rsp]	#,
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L147:
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1046:             if (argCount == 255) {
	cmp	bl, -1	# <retval>,
	jne	.L136	#,
.L146:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbp], 0	# parser.panicMode,
	jne	.L136	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR 44[rbp]	# MEM[(struct Token *)&parser + 24B].line, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[rbp]	# _19, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _19,
	je	.L148	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _19,
	jne	.L149	#,
.L138:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC9[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L136	#
	.p2align 4,,10
	.p2align 3
.L149:
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[rbp]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[rbp]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L138	#
	.p2align 4,,10
	.p2align 3
.L148:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L138	#
	.cfi_endproc
.LFE80:
	.size	"argumentList", .-"argumentList"
	.p2align 4
	.type	"call", @function
"call":
.LFB49:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:438:     uint8_t argCount = argumentList();
	call	"argumentList"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 52	#,
# src/compiler.c:438:     uint8_t argCount = argumentList();
	mov	ebx, eax	# argCount,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_6->function, current.7_6->function
	add	rdi, 24	# _8,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# argCount, argCount
# src/compiler.c:440: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_10->function, current.7_10->function
	add	rdi, 24	# _12,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.cfi_endproc
.LFE49:
	.size	"call", .-"call"
	.p2align 4
	.type	"parsePrecedence", @function
"parsePrecedence":
.LFB69:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 8[rsp], rbx	#,
	.cfi_offset 3, -40
# src/compiler.c:890:     ParseFn prefixRule = getRule(parser.previous.type)->prefix;
	lea	rbx, "rules"[rip]	# tmp206,
# src/compiler.c:888: static void parsePrecedence(Precedence precedence) {
	mov	QWORD PTR 24[rsp], r12	#,
	.cfi_offset 12, -24
	mov	r12d, edi	# precedence, precedence
# src/compiler.c:889:     advance();
	call	"advance"	#
# src/compiler.c:890:     ParseFn prefixRule = getRule(parser.previous.type)->prefix;
	mov	eax, DWORD PTR "parser"[rip+24]	# parser.previous.type, parser.previous.type
	lea	rax, [rax+rax*2]	# tmp132,
	mov	rax, QWORD PTR [rbx+rax*8]	# prefixRule, MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][_1].prefix
# src/compiler.c:891:     if (prefixRule == NULL) {
	test	rax, rax	# prefixRule
	je	.L172	#,
	mov	QWORD PTR 32[rsp], r13	#,
	.cfi_offset 13, -16
# src/compiler.c:897:     prefixRule(canAssign);
	xor	r13d, r13d	# canAssign
	cmp	r12d, 1	# precedence,
	setbe	r13b	#, canAssign
	mov	edi, r13d	#, canAssign
	call	rax	# prefixRule
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR "parser"[rip]	#, parser.current.type
	mov	rdx, rax	#,
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	lea	rax, [rax+rax*2]	# tmp159,
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	cmp	DWORD PTR 16[rbx+rax*8], r12d	# MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][_53].precedence, precedence
	jb	.L157	#,
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -32
	lea	rbp, "parser"[rip]	# tmp204,
	.p2align 4
	.p2align 3
.L158:
# src/compiler.c:900:         advance();
	call	"advance"	#
# src/compiler.c:901:         ParseFn infixRule = getRule(parser.previous.type)->infix;
	mov	eax, DWORD PTR 24[rbp]	# parser.previous.type, parser.previous.type
# src/compiler.c:903:         infixRule(canAssign);
	mov	edi, r13d	#, canAssign
# src/compiler.c:901:         ParseFn infixRule = getRule(parser.previous.type)->infix;
	lea	rax, [rax+rax*2]	# tmp169,
# src/compiler.c:903:         infixRule(canAssign);
	call	[QWORD PTR 8[rbx+rax*8]]	# MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][_2].infix
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	mov	eax, DWORD PTR 0[rbp]	#, parser.current.type
	mov	rdx, rax	#,
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	lea	rax, [rax+rax*2]	# tmp179,
# src/compiler.c:899:     while (precedence <= getRule(parser.current.type)->precedence) {
	cmp	DWORD PTR 16[rbx+rax*8], r12d	# MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][_3].precedence, precedence
	jnb	.L158	#,
	mov	rbp, QWORD PTR 16[rsp]	#,
	.cfi_restore 6
.L157:
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	r12d, 1	# precedence,
	jne	.L171	#,
	cmp	edx, 30	# _3,
	je	.L173	#,
.L171:
	mov	r13, QWORD PTR 32[rsp]	#,
	.cfi_restore 13
.L152:
# src/compiler.c:909: }
	mov	rbx, QWORD PTR 8[rsp]	#,
	mov	r12, QWORD PTR 24[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L173:
	.cfi_def_cfa_offset 48
	.cfi_offset 13, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L171	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _31, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _31,
	je	.L174	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _31,
	je	.L160	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L160:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC8[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	mov	r13, QWORD PTR 32[rsp]	#,
	.cfi_restore 13
	jmp	.L152	#
	.p2align 4,,10
	.p2align 3
.L172:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L152	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _23, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _23,
	je	.L175	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _23,
	jne	.L176	#,
.L156:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC7[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L152	#
.L176:
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L156	#
.L175:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L156	#
.L174:
	.cfi_offset 13, -16
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L160	#
	.cfi_endproc
.LFE69:
	.size	"parsePrecedence", .-"parsePrecedence"
	.p2align 4
	.type	"unary", @function
"unary":
.LFB68:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:787:     parsePrecedence(PREC_UNARY);
	mov	edi, 13	#,
# src/compiler.c:781:     TokenType operatorType = parser.previous.type;
	mov	ebx, DWORD PTR "parser"[rip+24]	# operatorType, parser.previous.type
# src/compiler.c:784:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:787:     parsePrecedence(PREC_UNARY);
	call	"parsePrecedence"	#
# src/compiler.c:790:     if (lastExpr.isConst && IS_NUMBER(lastExpr.value)) {
	cmp	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
	je	.L178	#,
# src/compiler.c:790:     if (lastExpr.isConst && IS_NUMBER(lastExpr.value)) {
	mov	rax, QWORD PTR "lastExpr"[rip+8]	# _2, lastExpr.value
# src/compiler.c:790:     if (lastExpr.isConst && IS_NUMBER(lastExpr.value)) {
	movabs	rdx, 9222246136947933184	# tmp140,
	mov	rcx, rax	# tmp184, _2
	not	rcx	# tmp184
	test	rcx, rdx	# tmp184, tmp140
	je	.L178	#,
# src/compiler.c:791:         if (operatorType == TOKEN_MINUS) {
	cmp	ebx, 9	# operatorType,
	je	.L193	#,
# src/compiler.c:801:         } else if (operatorType == TOKEN_TILDE) {
	cmp	ebx, 19	# operatorType,
	je	.L194	#,
# src/compiler.c:813:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:816:     switch (operatorType) {
	cmp	ebx, 28	# operatorType,
	je	.L182	#,
.L177:
# src/compiler.c:822: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L178:
	.cfi_restore_state
# src/compiler.c:813:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:816:     switch (operatorType) {
	cmp	ebx, 19	# operatorType,
	je	.L183	#,
	cmp	ebx, 28	# operatorType,
	je	.L182	#,
	cmp	ebx, 9	# operatorType,
	jne	.L177	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 40	#,
# src/compiler.c:822: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_43->function, current.7_43->function
	add	rdi, 24	# _45,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L183:
	.cfi_restore_state
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 44	#,
# src/compiler.c:822: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_47->function, current.7_47->function
	add	rdi, 24	# _49,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L182:
	.cfi_restore_state
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 39	#,
# src/compiler.c:822: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_39->function, current.7_39->function
	add	rdi, 24	# _41,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L193:
	.cfi_restore_state
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:794:             Value folded = NUMBER_VAL(-AS_NUMBER(lastExpr.value));
	movq	xmm0, rax	# _6, _2
	xorpd	xmm0, XMMWORD PTR .LC11[rip]	# _6,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# _31, current.7_30->function
# src/compiler.c:792:             currentChunk()->count           = lastExpr.chunkSizeBefore;
	mov	edx, DWORD PTR "lastExpr"[rip+16]	# lastExpr.chunkSizeBefore, lastExpr.chunkSizeBefore
# src/value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rbx, xmm0	# _25, _6
# src/compiler.c:792:             currentChunk()->count           = lastExpr.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], edx	# MEM[(struct Chunk *)_31 + 24B].count, lastExpr.chunkSizeBefore
# src/compiler.c:793:             currentChunk()->constants.count = lastExpr.constPoolBefore;
	mov	edx, DWORD PTR "lastExpr"[rip+20]	# lastExpr.constPoolBefore, lastExpr.constPoolBefore
	mov	DWORD PTR 60[rdi], edx	# MEM[(struct Chunk *)_31 + 24B].constants.count, lastExpr.constPoolBefore
.L192:
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	rsi, rbx	#, _34
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _33,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:809:             lastExpr.value   = folded;
	mov	QWORD PTR "lastExpr"[rip+8], rbx	# lastExpr.value, _34
# src/compiler.c:822: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:808:             lastExpr.isConst = true;
	mov	BYTE PTR "lastExpr"[rip], 1	# lastExpr.isConst,
# src/compiler.c:822: }
	ret	
	.p2align 4,,10
	.p2align 3
.L194:
	.cfi_restore_state
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:804:             Value folded = NUMBER_VAL((double)(~(int32_t)AS_NUMBER(lastExpr.value)));
	movq	xmm1, rax	# tmp188, _2
# src/value.h:58:     memcpy(&value, &num, sizeof(double));
	pxor	xmm2, xmm2	# tmp189
# src/compiler.c:804:             Value folded = NUMBER_VAL((double)(~(int32_t)AS_NUMBER(lastExpr.value)));
	cvttsd2si	eax, xmm1	# _9, tmp188
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# _37, current.7_36->function
# src/compiler.c:802:             currentChunk()->count           = lastExpr.chunkSizeBefore;
	mov	edx, DWORD PTR "lastExpr"[rip+16]	# lastExpr.chunkSizeBefore, lastExpr.chunkSizeBefore
	mov	DWORD PTR 24[rdi], edx	# MEM[(struct Chunk *)_37 + 24B].count, lastExpr.chunkSizeBefore
# src/compiler.c:803:             currentChunk()->constants.count = lastExpr.constPoolBefore;
	mov	edx, DWORD PTR "lastExpr"[rip+20]	# lastExpr.constPoolBefore, lastExpr.constPoolBefore
# src/compiler.c:804:             Value folded = NUMBER_VAL((double)(~(int32_t)AS_NUMBER(lastExpr.value)));
	not	eax	# _10
# src/value.h:58:     memcpy(&value, &num, sizeof(double));
	cvtsi2sd	xmm2, eax	# tmp189, _10
# src/compiler.c:803:             currentChunk()->constants.count = lastExpr.constPoolBefore;
	mov	DWORD PTR 60[rdi], edx	# MEM[(struct Chunk *)_37 + 24B].constants.count, lastExpr.constPoolBefore
# src/value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rbx, xmm2	# _34, tmp189
	jmp	.L192	#
	.cfi_endproc
.LFE68:
	.size	"unary", .-"unary"
	.section	.rodata.str1.1
.LC12:
	.string	"Loop body too large."
	.text
	.p2align 4
	.type	"emitLoop", @function
"emitLoop":
.LFB37:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ebp, edi	# loopStart, loopStart
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 51	#,
# src/compiler.c:195: static void emitLoop(int loopStart) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_14->function, current.7_14->function
	add	rdi, 24	# _16,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _12, current.7_8->function
# src/compiler.c:198:     int offset = currentChunk()->count - loopStart + 2;
	mov	ebx, DWORD PTR 24[rdi]	# _2, MEM[(struct Chunk *)_12 + 24B].count
	sub	ebx, ebp	# _2, loopStart
# src/compiler.c:198:     int offset = currentChunk()->count - loopStart + 2;
	add	ebx, 2	# offset,
# src/compiler.c:199:     if (offset > UINT16_MAX) error("Loop body too large.");
	cmp	ebx, 65535	# offset,
	jle	.L198	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	je	.L205	#,
.L198:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _4, offset
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _31,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# offset, offset
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_33->function, current.7_33->function
# src/compiler.c:202: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _35,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L205:
	.cfi_restore_state
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _22, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _22,
	je	.L206	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _22,
	je	.L200	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L200:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC12[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _12, pretmp_46->function
	jmp	.L198	#
	.p2align 4,,10
	.p2align 3
.L206:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L200	#
	.cfi_endproc
.LFE37:
	.size	"emitLoop", .-"emitLoop"
	.p2align 4
	.type	"and_", @function
"and_":
.LFB81:
	.cfi_startproc
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1056: static void and_(bool canAssign) {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 50	#,
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_12->function, current.7_12->function
	add	rdi, 24	# _14,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_16->function, current.7_16->function
	add	rdi, 24	# _18,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_20->function, current.7_20->function
	add	rdi, 24	# _22,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _24, current.7_23->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp138, MEM[(struct Chunk *)_24 + 24B].count
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _9,
# src/compiler.c:208:     return currentChunk()->count - 2;
	lea	ebx, -2[rax]	# _26,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1060:     parsePrecedence(PREC_AND);
	mov	edi, 4	#,
	call	"parsePrecedence"	#
# src/compiler.c:1062:     patchJump(endJump);
	mov	edi, ebx	#, _26
# src/compiler.c:1063: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/compiler.c:1062:     patchJump(endJump);
	jmp	"patchJump"	#
	.cfi_endproc
.LFE81:
	.size	"and_", .-"and_"
	.section	.rodata.str1.1
.LC13:
	.string	"Expect ')' after expression."
	.text
	.p2align 4
	.type	"grouping", @function
"grouping":
.LFB53:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:161:     if (parser.current.type == type) {
	cmp	DWORD PTR "parser"[rip], 1	# parser.current.type,
	je	.L218	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	je	.L219	#,
# src/compiler.c:510: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L219:
	.cfi_restore_state
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+20]	#, parser.line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip]	# _8, parser.type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _8,
	je	.L220	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _8,
	jne	.L221	#,
.L213:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC13[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:510: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L221:
	.cfi_restore_state
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+8]	#, parser.start
	mov	edx, DWORD PTR "parser"[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L213	#
	.p2align 4,,10
	.p2align 3
.L218:
# src/compiler.c:510: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:162:         advance();
	jmp	"advance"	#
	.p2align 4,,10
	.p2align 3
.L220:
	.cfi_restore_state
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L213	#
	.cfi_endproc
.LFE53:
	.size	"grouping", .-"grouping"
	.p2align 4
	.type	"or_", @function
"or_":
.LFB55:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 50	#,
# src/compiler.c:525: static void or_(bool canAssign) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_31->function, current.7_31->function
	add	rdi, 24	# _33,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_35->function, current.7_35->function
	add	rdi, 24	# _37,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_39->function, current.7_39->function
	add	rdi, 24	# _41,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 49	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _43, current.7_42->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp172, MEM[(struct Chunk *)_43 + 24B].count
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _17,
# src/compiler.c:208:     return currentChunk()->count - 2;
	lea	ebp, -2[rax]	# _45,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_19->function, current.7_19->function
	add	rdi, 24	# _21,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_23->function, current.7_23->function
	add	rdi, 24	# _25,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:529:     patchJump(elseJump);
	mov	edi, ebp	#, _45
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.7_26->function, current.7_26->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	ebx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_27 + 24B].count, MEM[(struct Chunk *)_27 + 24B].count
# src/compiler.c:529:     patchJump(elseJump);
	call	"patchJump"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_10->function, current.7_10->function
	add	rdi, 24	# _12,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:532:     parsePrecedence(PREC_OR);
	mov	edi, 3	#,
	call	"parsePrecedence"	#
# src/compiler.c:534: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
# src/compiler.c:533:     patchJump(endJump);
	lea	edi, -2[rbx]	#,
# src/compiler.c:534: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:533:     patchJump(endJump);
	jmp	"patchJump"	#
	.cfi_endproc
.LFE55:
	.size	"or_", .-"or_"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"Cannot read local variable in own initializer."
	.align 8
.LC15:
	.string	"Cannot capture local variable beyond slot 255."
	.align 8
.LC16:
	.string	"Too many closure variables in function."
	.text
	.p2align 4
	.type	"resolveUpvalue", @function
"resolveUpvalue":
.LFB74:
	.cfi_startproc
	sub	rsp, 72	#,
	.cfi_def_cfa_offset 80
	mov	QWORD PTR 64[rsp], r15	#,
	.cfi_offset 15, -16
# src/compiler.c:956:     if (compiler->enclosing == NULL) return -1;
	mov	r15, QWORD PTR [rdi]	# pretmp_95, compiler_9(D)->enclosing
# src/compiler.c:956:     if (compiler->enclosing == NULL) return -1;
	test	r15, r15	# pretmp_95
	je	.L250	#,
	mov	QWORD PTR 24[rsp], rbx	#,
	.cfi_offset 3, -56
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	ebx, DWORD PTR 524312[r15]	# i, MEM[(struct Compiler *)_1].localCount
	mov	QWORD PTR 32[rsp], rbp	#,
	.cfi_offset 6, -48
	mov	rbp, rdi	# compiler, compiler
	mov	QWORD PTR 8[rsp], rsi	# %sfp, name
	sub	ebx, 1	# i,
	js	.L226	#,
	mov	QWORD PTR 56[rsp], r14	#,
	mov	eax, ebx	# _48, i
	.cfi_offset 14, -24
	mov	r14d, DWORD PTR 16[rsi]	# _23, MEM[(int *)name_10(D) + 16B]
	sal	rax, 5	# _2,
	mov	QWORD PTR 40[rsp], r12	#,
	.cfi_offset 12, -40
	lea	r12, 32[r15+rax]	# ivtmp.359,
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	movsxd	rax, r14d	# _29, _23
	mov	QWORD PTR 48[rsp], r13	#,
	.cfi_offset 13, -32
	mov	r13, QWORD PTR 8[rsi]	# _22, MEM[(const char * *)name_10(D) + 8B]
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	mov	QWORD PTR [rsp], rax	# %sfp, _29
	.p2align 4
	.p2align 3
.L232:
# src/compiler.c:916:     if (a->length != b->length) return false;
	cmp	r14d, DWORD PTR 8[r12]	# _23, MEM[(int *)_119 + 8B]
	jne	.L227	#,
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR [r12]	# MEM[(const char * *)_119], MEM[(const char * *)_119]
	mov	rdx, QWORD PTR [rsp]	#, %sfp
	mov	rdi, r13	#, _22
	call	"memcmp"@PLT	#
	mov	r8d, eax	# <retval>, <retval>
# src/compiler.c:923:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# <retval>
	je	.L271	#,
.L227:
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# i,
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	r12, 32	# ivtmp.359,
	cmp	ebx, -1	# i,
	jne	.L232	#,
	mov	r12, QWORD PTR 40[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 48[rsp]	#,
	.cfi_restore 13
	mov	r14, QWORD PTR 56[rsp]	#,
	.cfi_restore 14
.L226:
# src/compiler.c:969:     int upvalue = resolveUpvalue(compiler->enclosing, name);
	mov	rsi, QWORD PTR 8[rsp]	#, %sfp
	mov	rdi, r15	#, pretmp_95
	call	"resolveUpvalue"	#
	mov	r8d, eax	# <retval>, <retval>
# src/compiler.c:970:     if (upvalue != -1) {
	cmp	eax, -1	# <retval>,
	je	.L269	#,
# src/compiler.c:936:     int upvalueCount = compiler->function->upvalueCount;
	mov	rsi, QWORD PTR 8[rbp]	# _72, compiler_9(D)->function
# src/compiler.c:971:         return addUpvalue(compiler, (uint8_t) upvalue, false);
	mov	edx, eax	# _5, <retval>
# src/compiler.c:936:     int upvalueCount = compiler->function->upvalueCount;
	mov	r8d, DWORD PTR 20[rsi]	# <retval>, _72->upvalueCount
# src/compiler.c:938:     for (int i = 0; i < upvalueCount; i++) {
	test	r8d, r8d	# <retval>
	jle	.L243	#,
	mov	ecx, r8d	# _134, <retval>
	xor	eax, eax	# ivtmp.338
	jmp	.L245	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L244:
	add	rax, 1	# ivtmp.338,
	cmp	rax, rcx	# ivtmp.338, _134
	je	.L272	#,
.L245:
# src/compiler.c:940:         if (upvalue->index == index && upvalue->isLocal == isLocal) {
	cmp	dl, BYTE PTR 524316[rbp+rax*2]	# _5, MEM[(unsigned char *)compiler_9(D) + 524316B + ivtmp.338_98 * 2]
	jne	.L244	#,
# src/compiler.c:940:         if (upvalue->index == index && upvalue->isLocal == isLocal) {
	cmp	BYTE PTR 524317[rbp+rax*2], 0	# MEM[(_Bool *)compiler_9(D) + 524317B + ivtmp.338_98 * 2],
	jne	.L244	#,
	mov	rbx, QWORD PTR 24[rsp]	#,
	.cfi_restore 3
	mov	rbp, QWORD PTR 32[rsp]	#,
	.cfi_restore 6
	mov	r8d, eax	# <retval>, ivtmp.338
	jmp	.L224	#
	.p2align 4,,10
	.p2align 3
.L271:
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
# src/compiler.c:924:             if (local->depth == -1) {
	mov	r12d, ebx	# i, i
	mov	rax, r12	# tmp177, i
	sal	rax, 5	# tmp177,
# src/compiler.c:924:             if (local->depth == -1) {
	cmp	DWORD PTR 48[rax+r15], -1	# MEM <struct Compiler> [(struct Local *)_1].locals[i_36].depth,
	je	.L273	#,
.L228:
# src/compiler.c:960:         if (local >= 256) {
	cmp	ebx, 255	# i,
	jle	.L234	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L268	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _47, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
	cmp	eax, 65	# _47,
	je	.L274	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _47,
	jne	.L275	#,
.L237:
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC15[rip]	#,
.L270:
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
.L268:
	mov	rbx, QWORD PTR 24[rsp]	#,
	.cfi_restore 3
	mov	rbp, QWORD PTR 32[rsp]	#,
	.cfi_restore 6
	mov	r12, QWORD PTR 40[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 48[rsp]	#,
	.cfi_restore 13
	mov	r14, QWORD PTR 56[rsp]	#,
	.cfi_restore 14
.L224:
# src/compiler.c:975: }
	mov	r15, QWORD PTR 64[rsp]	#,
	mov	eax, r8d	#, <retval>
	add	rsp, 72	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L234:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
# src/compiler.c:965:         compiler->enclosing->locals[local].isCaptured = true;
	mov	r15, QWORD PTR 0[rbp]	# pretmp_95, compiler_9(D)->enclosing
.L249:
# src/compiler.c:936:     int upvalueCount = compiler->function->upvalueCount;
	mov	rsi, QWORD PTR 8[rbp]	# _53, compiler_9(D)->function
# src/compiler.c:965:         compiler->enclosing->locals[local].isCaptured = true;
	sal	r12, 5	# tmp217,
	mov	BYTE PTR 52[r12+r15], 1	# prephitmp_97->locals[i_36].isCaptured,
# src/compiler.c:936:     int upvalueCount = compiler->function->upvalueCount;
	mov	ecx, DWORD PTR 20[rsi]	# upvalueCount, _53->upvalueCount
# src/compiler.c:938:     for (int i = 0; i < upvalueCount; i++) {
	test	ecx, ecx	# upvalueCount
	jle	.L238	#,
	mov	edx, ecx	# _74, upvalueCount
	xor	eax, eax	# ivtmp.346
	jmp	.L240	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L239:
	add	rax, 1	# ivtmp.346,
	cmp	rdx, rax	# _74, ivtmp.346
	je	.L276	#,
.L240:
# src/compiler.c:940:         if (upvalue->index == index && upvalue->isLocal == isLocal) {
	cmp	bl, BYTE PTR 524316[rbp+rax*2]	# _3, MEM[(unsigned char *)compiler_9(D) + 524316B + ivtmp.346_94 * 2]
	jne	.L239	#,
# src/compiler.c:940:         if (upvalue->index == index && upvalue->isLocal == isLocal) {
	cmp	BYTE PTR 524317[rbp+rax*2], 0	# MEM[(_Bool *)compiler_9(D) + 524317B + ivtmp.346_94 * 2],
	je	.L239	#,
	mov	r8d, eax	# <retval>, ivtmp.346
	jmp	.L268	#
.L275:
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	xor	eax, eax	#
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
	lea	rsi, .LC2[rip]	#,
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
	jmp	.L237	#
	.p2align 4,,10
	.p2align 3
.L272:
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
# src/compiler.c:945:     if (upvalueCount == UINT8_COUNT) {
	cmp	r8d, 256	# <retval>,
	je	.L277	#,
.L243:
# src/compiler.c:950:     compiler->upvalues[upvalueCount].isLocal = isLocal;
	movsxd	rax, r8d	# <retval>, <retval>
	add	rax, 262152	# tmp260,
	mov	BYTE PTR 13[rbp+rax*2], 0	# compiler_9(D)->upvalues[upvalueCount_73].isLocal,
# src/compiler.c:951:     compiler->upvalues[upvalueCount].index = index;
	mov	BYTE PTR 12[rbp+rax*2], dl	# compiler_9(D)->upvalues[upvalueCount_73].index, _5
# src/compiler.c:952:     return compiler->function->upvalueCount++;
	lea	eax, 1[r8]	# tmp263,
	mov	DWORD PTR 20[rsi], eax	# _72->upvalueCount, tmp263
.L269:
	mov	rbx, QWORD PTR 24[rsp]	#,
	.cfi_restore 3
	mov	rbp, QWORD PTR 32[rsp]	#,
	.cfi_restore 6
# src/compiler.c:975: }
	mov	eax, r8d	#, <retval>
	mov	r15, QWORD PTR 64[rsp]	#,
	add	rsp, 72	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L276:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
# src/compiler.c:945:     if (upvalueCount == UINT8_COUNT) {
	cmp	ecx, 256	# upvalueCount,
	je	.L278	#,
.L238:
# src/compiler.c:950:     compiler->upvalues[upvalueCount].isLocal = isLocal;
	movsxd	rax, ecx	# upvalueCount, upvalueCount
# src/compiler.c:952:     return compiler->function->upvalueCount++;
	mov	r8d, ecx	# <retval>, upvalueCount
# src/compiler.c:950:     compiler->upvalues[upvalueCount].isLocal = isLocal;
	add	rax, 262152	# tmp238,
	mov	BYTE PTR 13[rbp+rax*2], 1	# compiler_9(D)->upvalues[upvalueCount_54].isLocal,
# src/compiler.c:951:     compiler->upvalues[upvalueCount].index = index;
	mov	BYTE PTR 12[rbp+rax*2], bl	# compiler_9(D)->upvalues[upvalueCount_54].index, _3
# src/compiler.c:952:     return compiler->function->upvalueCount++;
	lea	eax, 1[rcx]	# tmp241,
	mov	DWORD PTR 20[rsi], eax	# _53->upvalueCount, tmp241
	jmp	.L268	#
.L273:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L229	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _39, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
	cmp	eax, 65	# _39,
	je	.L279	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _39,
	je	.L231	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	xor	eax, eax	#
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
	lea	rsi, .LC2[rip]	#,
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
.L231:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC14[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
	jmp	.L228	#
.L229:
# src/compiler.c:960:         if (local >= 256) {
	cmp	ebx, 255	# i,
	jg	.L268	#,
	jmp	.L249	#
.L274:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
	jmp	.L237	#
.L277:
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L246	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _85, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _85,
	je	.L280	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _85,
	je	.L248	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L248:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC16[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
.L246:
	mov	rbx, QWORD PTR 24[rsp]	#,
	.cfi_restore 3
	mov	rbp, QWORD PTR 32[rsp]	#,
	.cfi_restore 6
# src/compiler.c:962:             return 0;
	xor	r8d, r8d	# <retval>
	jmp	.L224	#
.L279:
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
	jmp	.L231	#
.L278:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L268	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	xor	eax, eax	#
	lea	rsi, .LC0[rip]	#,
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _66, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
	cmp	eax, 65	# _66,
	je	.L281	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _66,
	je	.L242	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	xor	eax, eax	#
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
	lea	rsi, .LC2[rip]	#,
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
.L242:
	mov	DWORD PTR [rsp], r8d	# %sfp, <retval>
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC16[rip]	#,
	jmp	.L270	#
.L250:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
# src/compiler.c:956:     if (compiler->enclosing == NULL) return -1;
	mov	r8d, -1	# <retval>,
	jmp	.L224	#
.L281:
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	mov	r8d, DWORD PTR [rsp]	# <retval>, %sfp
	jmp	.L242	#
.L280:
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L248	#
	.cfi_endproc
.LFE74:
	.size	"resolveUpvalue", .-"resolveUpvalue"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Expect ':' after then branch of ternary operator."
	.text
	.p2align 4
	.type	"ternary", @function
"ternary":
.LFB56:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 50	#,
# src/compiler.c:536: static void ternary(bool canAssign) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_38->function, current.7_38->function
	add	rdi, 24	# _40,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_42->function, current.7_42->function
	add	rdi, 24	# _44,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_46->function, current.7_46->function
	add	rdi, 24	# _48,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _50, current.7_49->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp182, MEM[(struct Chunk *)_50 + 24B].count
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _18,
# src/compiler.c:208:     return currentChunk()->count - 2;
	lea	ebp, -2[rax]	# _52,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:540:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 49	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_22->function, current.7_22->function
	add	rdi, 24	# _24,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_26->function, current.7_26->function
	add	rdi, 24	# _28,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_30->function, current.7_30->function
	add	rdi, 24	# _32,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:544:     patchJump(elseJump);
	mov	edi, ebp	#, _52
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.7_33->function, current.7_33->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	ebx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_34 + 24B].count, MEM[(struct Chunk *)_34 + 24B].count
# src/compiler.c:544:     patchJump(elseJump);
	call	"patchJump"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_12->function, current.7_12->function
	add	rdi, 24	# _14,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:547:     consume(TOKEN_COLON, "Expect ':' after then branch of ternary operator.");
	lea	rsi, .LC17[rip]	#,
	mov	edi, 7	#,
	call	"consume"	#
# src/compiler.c:549:     parsePrecedence(PREC_TERNARY);
	mov	edi, 2	#,
	call	"parsePrecedence"	#
# src/compiler.c:552: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
# src/compiler.c:551:     patchJump(endJump);
	lea	edi, -2[rbx]	#,
# src/compiler.c:552: }
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:551:     patchJump(endJump);
	jmp	"patchJump"	#
	.cfi_endproc
.LFE56:
	.size	"ternary", .-"ternary"
	.section	.rodata.str1.1
.LC18:
	.string	"Expect ']' after index"
	.text
	.p2align 4
	.type	"index_", @function
"index_":
.LFB51:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:465: static void index_(bool canAssign) {
	mov	ebx, edi	# canAssign, canAssign
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:161:     if (parser.current.type == type) {
	cmp	DWORD PTR "parser"[rip], 3	# parser.current.type,
	je	.L297	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	je	.L298	#,
.L286:
# src/compiler.c:469:     if (canAssign && match(TOKEN_EQUAL)) {
	test	bl, bl	# canAssign
	je	.L289	#,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR "parser"[rip], 30	# parser.current.type,
	je	.L299	#,
.L289:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 24	#,
# src/compiler.c:475: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_8->function, current.7_8->function
	add	rdi, 24	# _10,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L298:
	.cfi_restore_state
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+20]	#, parser.line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip]	# _17, parser.type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _17,
	je	.L300	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _17,
	jne	.L301	#,
.L288:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC18[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L286	#
	.p2align 4,,10
	.p2align 3
.L299:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 25	#,
# src/compiler.c:475: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_24->function, current.7_24->function
	add	rdi, 24	# _26,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L301:
	.cfi_restore_state
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+8]	#, parser.start
	mov	edx, DWORD PTR "parser"[rip+16]	#, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L288	#
	.p2align 4,,10
	.p2align 3
.L297:
# src/compiler.c:162:         advance();
	call	"advance"	#
# src/compiler.c:163:         return;
	jmp	.L286	#
	.p2align 4,,10
	.p2align 3
.L300:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L288	#
	.cfi_endproc
.LFE51:
	.size	"index_", .-"index_"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Cannot have more than 16777215 elements in initializer list."
	.align 8
.LC20:
	.string	"Expect '}' after array initializer."
	.text
	.p2align 4
	.type	"arrLit", @function
"arrLit":
.LFB47:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:318:     if (!check(TOKEN_RIGHT_BRACE)) {
	cmp	DWORD PTR "parser"[rip], 5	# parser.current.type,
# src/compiler.c:315: static void arrLit(bool canAssign) {
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -16
# src/compiler.c:318:     if (!check(TOKEN_RIGHT_BRACE)) {
	je	.L303	#,
	mov	QWORD PTR 8[rsp], rbx	#,
	.cfi_offset 3, -24
# src/compiler.c:316:     int count = 0;
	xor	ebx, ebx	# count
	lea	rbp, "parser"[rip]	# tmp196,
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:321:             if (count == 0xffffff) {
	cmp	ebx, 16777215	# count,
	je	.L315	#,
.L304:
# src/compiler.c:324:             count++;
	add	ebx, 1	# count,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR 0[rbp], 6	# parser.current.type,
	je	.L316	#,
# src/compiler.c:328:     consume(TOKEN_RIGHT_BRACE, "Expect '}' after array initializer.");
	lea	rsi, .LC20[rip]	#,
	mov	edi, 5	#,
# src/compiler.c:333:         emitDoubleWord(
	mov	ebp, ebx	# prephitmp_75, count
# src/compiler.c:328:     consume(TOKEN_RIGHT_BRACE, "Expect '}' after array initializer.");
	call	"consume"	#
# src/compiler.c:330:     if (count <= 255) {
	cmp	ebx, 255	# count,
	jle	.L317	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 29	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_78->function, pretmp_78->function
	add	rdi, 24	# _80,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# prephitmp_75, count
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_47->function, current.7_47->function
	add	rdi, 24	# _49,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _4, count
# src/compiler.c:337:             (uint8_t)((count >> 16) & 0xff)
	sar	ebx, 16	# _2,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_51->function, current.7_51->function
	add	rdi, 24	# _53,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:340: }
	mov	rbp, QWORD PTR 16[rsp]	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bl	# _2, _2
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_55->function, current.7_55->function
# src/compiler.c:340: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _57,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L316:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:321:             if (count == 0xffffff) {
	cmp	ebx, 16777215	# count,
	jne	.L304	#,
.L315:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbp], 0	# parser.panicMode,
	jne	.L304	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR 20[rbp]	# parser.line, parser.line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 0[rbp]	# _28, parser.type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _28,
	je	.L318	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _28,
	jne	.L319	#,
.L306:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC19[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L304	#
	.p2align 4,,10
	.p2align 3
.L319:
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 8[rbp]	# parser.start, parser.start
	mov	edx, DWORD PTR 16[rbp]	# parser.length, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L306	#
	.p2align 4,,10
	.p2align 3
.L303:
	.cfi_restore 3
# src/compiler.c:328:     consume(TOKEN_RIGHT_BRACE, "Expect '}' after array initializer.");
	lea	rsi, .LC20[rip]	#,
	mov	edi, 5	#,
	xor	ebp, ebp	# prephitmp_75
	call	"consume"	#
.L309:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 28	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_35->function, current.7_35->function
	add	rdi, 24	# _37,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# prephitmp_75, prephitmp_75
# src/compiler.c:340: }
	mov	rbp, QWORD PTR 16[rsp]	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_39->function, current.7_39->function
# src/compiler.c:340: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _41,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L317:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
	jmp	.L309	#
	.p2align 4,,10
	.p2align 3
.L318:
	.cfi_restore_state
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L306	#
	.cfi_endproc
.LFE47:
	.size	"arrLit", .-"arrLit"
	.section	.rodata.str1.1
.LC21:
	.string	"Expect identifier after '--'."
	.text
	.p2align 4
	.type	"preDec", @function
"preDec":
.LFB62:
	.cfi_startproc
	sub	rsp, 88	#,
	.cfi_def_cfa_offset 96
# src/compiler.c:636:     consume(TOKEN_IDENTIFIER, "Expect identifier after '--'.");
	mov	edi, 37	#,
# src/compiler.c:635: static void preDec(bool canAssign) {
	mov	QWORD PTR 40[rsp], rbx	#,
	mov	QWORD PTR 80[rsp], r15	#,
	mov	QWORD PTR 48[rsp], rbp	#,
	mov	QWORD PTR 56[rsp], r12	#,
	mov	QWORD PTR 64[rsp], r13	#,
# src/compiler.c:636:     consume(TOKEN_IDENTIFIER, "Expect identifier after '--'.");
	mov	rsi, QWORD PTR fs:40	#, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 24[rsp], rsi	# D.8663,
	lea	rsi, .LC21[rip]	#,
	.cfi_offset 3, -56
	.cfi_offset 15, -16
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	call	"consume"	#
# src/compiler.c:588:     int arg = resolveLocal(current, &name);
	mov	r15, QWORD PTR "current"[rip]	# current, current
	movdqu	xmm0, XMMWORD PTR "parser"[rip+24]	# parser.previous, parser.previous
	mov	rax, QWORD PTR "parser"[rip+40]	# parser.previous, parser.previous
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	ebx, DWORD PTR 524312[r15]	# arg, current.46_29->localCount
	movaps	XMMWORD PTR [rsp], xmm0	# name, parser.previous
	mov	QWORD PTR 16[rsp], rax	# name, parser.previous
	sub	ebx, 1	# arg,
	js	.L321	#,
	movsxd	r13, DWORD PTR 16[rsp]	#, MEM[(int *)&name + 16B]
	mov	eax, ebx	# _182, arg
	mov	QWORD PTR 72[rsp], r14	#,
	sal	rax, 5	# _179,
	.cfi_offset 14, -24
	mov	r14, QWORD PTR 8[rsp]	# _35, MEM[(const char * *)&name + 8B]
	mov	r12, r13	#,
	lea	rbp, 32[r15+rax]	# ivtmp.392,
	.p2align 4
	.p2align 3
.L326:
# src/compiler.c:916:     if (a->length != b->length) return false;
	cmp	r12d, DWORD PTR 8[rbp]	# _36, MEM[(int *)_31 + 8B]
	jne	.L322	#,
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR 0[rbp]	# MEM[(const char * *)_31], MEM[(const char * *)_31]
	mov	rdx, r13	#, _44
	mov	rdi, r14	#, _35
	call	"memcmp"@PLT	#
# src/compiler.c:923:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# tmp355
	je	.L344	#,
.L322:
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# arg,
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	rbp, 32	# ivtmp.392,
	cmp	ebx, -1	# arg,
	jne	.L326	#,
	mov	r14, QWORD PTR 72[rsp]	#,
	.cfi_restore 14
.L321:
# src/compiler.c:600:     } else if ((arg = resolveUpvalue(current, &name)) != -1) {
	mov	rsi, rsp	# tmp245,
	mov	rdi, r15	#, current
	call	"resolveUpvalue"	#
	mov	ebx, eax	# arg, arg
# src/compiler.c:600:     } else if ((arg = resolveUpvalue(current, &name)) != -1) {
	cmp	eax, -1	# arg,
	je	.L345	#,
	mov	r15, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:602:         *setOp = OP_SET_UPVALUE;
	mov	ebp, 27	# setOp,
# src/compiler.c:601:         *getOp = OP_GET_UPVALUE;
	mov	esi, 26	#,
.L327:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[r15]	# current.7_91->function, current.7_91->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _93,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_95->function, current.7_95->function
	add	rdi, 24	# _97,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movabs	rsi, 4607182418800017408	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_177->function, current.7_177->function
	add	rdi, 24	# _150,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 35	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_41->function, current.7_41->function
	add	rdi, 24	# _24,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_120->function, current.7_120->function
	add	rdi, 24	# _122,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 24[rsp]	# tmp360, D.8663
	sub	rax, QWORD PTR fs:40	# tmp360, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L343	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_124->function, current.7_124->function
	add	rdi, 24	# _126,
.L342:
# src/compiler.c:648: }
	mov	rbx, QWORD PTR 40[rsp]	#,
	mov	rbp, QWORD PTR 48[rsp]	#,
	mov	r12, QWORD PTR 56[rsp]	#,
	mov	r13, QWORD PTR 64[rsp]	#,
	mov	r15, QWORD PTR 80[rsp]	#,
	add	rsp, 88	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L344:
	.cfi_def_cfa_offset 96
	.cfi_offset 14, -24
# src/compiler.c:924:             if (local->depth == -1) {
	mov	eax, ebx	# arg, arg
	sal	rax, 5	# tmp225,
# src/compiler.c:924:             if (local->depth == -1) {
	cmp	DWORD PTR 48[rax+r15], -1	# MEM <struct Compiler> [(struct Local *)current.46_29].locals[i_185].depth,
	je	.L346	#,
.L323:
# src/compiler.c:591:         if (arg <= UINT8_MAX) {
	cmp	ebx, 255	# arg,
	jle	.L334	#,
	mov	r14, QWORD PTR 72[rsp]	#,
	.cfi_restore 14
# src/compiler.c:597:             *setOp = OP_SET_LOCAL_LONG;
	mov	r13d, 9	# setOp,
# src/compiler.c:596:             *getOp = OP_GET_LOCAL_LONG;
	mov	esi, 7	#,
.L329:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[r15]	# current.7_75->function, current.7_75->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	mov	r12d, ebx	# _71, arg
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	ebp, ebx	# _69, arg
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	sar	r12d, 8	# _71,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebp, 16	# _69,
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _77,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	ebp, bpl	# _70, _69
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_79->function, current.7_79->function
	add	rdi, 24	# _81,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _71
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_83->function, current.7_83->function
	add	rdi, 24	# _85,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _70
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_87->function, current.7_87->function
	add	rdi, 24	# _89,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movabs	rsi, 4607182418800017408	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_61->function, current.7_61->function
	add	rdi, 24	# _128,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 35	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_190->function, current.7_190->function
	add	rdi, 24	# _60,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r13b	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_104->function, current.7_104->function
	add	rdi, 24	# _106,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_108->function, current.7_108->function
	add	rdi, 24	# _110,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _71
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_112->function, current.7_112->function
	add	rdi, 24	# _114,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 24[rsp]	# tmp359, D.8663
	sub	rax, QWORD PTR fs:40	# tmp359, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L343	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _70
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_116->function, current.7_116->function
	add	rdi, 24	# _118,
	jmp	.L342	#
	.p2align 4,,10
	.p2align 3
.L334:
	.cfi_offset 14, -24
	mov	r14, QWORD PTR 72[rsp]	#,
	.cfi_remember_state
	.cfi_restore 14
# src/compiler.c:593:             *setOp = OP_SET_LOCAL;
	mov	ebp, 8	# setOp,
# src/compiler.c:592:             *getOp = OP_GET_LOCAL;
	mov	esi, 6	#,
	jmp	.L327	#
.L346:
	.cfi_restore_state
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L323	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _54, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _54,
	je	.L347	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _54,
	je	.L325	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L325:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC14[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	mov	r15, QWORD PTR "current"[rip]	# current, current
	jmp	.L323	#
.L347:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L325	#
	.p2align 4,,10
	.p2align 3
.L345:
	.cfi_restore 14
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR 16[rsp]	#, MEM[(int *)&name + 16B]
	mov	rdi, QWORD PTR 8[rsp]	#, MEM[(const char * *)&name + 8B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp249,
	or	rax, rdx	# _62, tmp249
	mov	rsi, rax	# _64, _62
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_65->function, current.7_65->function
	add	rdi, 24	# _67,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
	mov	ebx, eax	# arg, arg
# src/compiler.c:606:         if (arg <= UINT8_MAX) {
	cmp	eax, 255	# arg,
	jle	.L335	#,
	mov	r15, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:612:             *setOp = OP_SET_GLOBAL_LONG;
	mov	r13d, 15	# setOp,
# src/compiler.c:611:             *getOp = OP_GET_GLOBAL_LONG;
	mov	esi, 11	#,
	jmp	.L329	#
.L335:
	mov	r15, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:608:             *setOp = OP_SET_GLOBAL;
	mov	ebp, 14	# setOp,
# src/compiler.c:607:             *getOp = OP_GET_GLOBAL;
	mov	esi, 10	#,
	jmp	.L327	#
.L343:
	mov	QWORD PTR 72[rsp], r14	#,
	.cfi_offset 14, -24
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE62:
	.size	"preDec", .-"preDec"
	.section	.rodata.str1.1
.LC22:
	.string	"Expect identifier after '++'."
	.text
	.p2align 4
	.type	"preInc", @function
"preInc":
.LFB61:
	.cfi_startproc
	sub	rsp, 88	#,
	.cfi_def_cfa_offset 96
# src/compiler.c:621:     consume(TOKEN_IDENTIFIER, "Expect identifier after '++'.");
	mov	edi, 37	#,
# src/compiler.c:620: static void preInc(bool canAssign) {
	mov	QWORD PTR 40[rsp], rbx	#,
	mov	QWORD PTR 80[rsp], r15	#,
	mov	QWORD PTR 48[rsp], rbp	#,
	mov	QWORD PTR 56[rsp], r12	#,
	mov	QWORD PTR 64[rsp], r13	#,
# src/compiler.c:621:     consume(TOKEN_IDENTIFIER, "Expect identifier after '++'.");
	mov	rsi, QWORD PTR fs:40	#, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 24[rsp], rsi	# D.8718,
	lea	rsi, .LC22[rip]	#,
	.cfi_offset 3, -56
	.cfi_offset 15, -16
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	call	"consume"	#
# src/compiler.c:588:     int arg = resolveLocal(current, &name);
	mov	r15, QWORD PTR "current"[rip]	# current, current
	movdqu	xmm0, XMMWORD PTR "parser"[rip+24]	# parser.previous, parser.previous
	mov	rax, QWORD PTR "parser"[rip+40]	# parser.previous, parser.previous
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	ebx, DWORD PTR 524312[r15]	# arg, current.46_29->localCount
	movaps	XMMWORD PTR [rsp], xmm0	# name, parser.previous
	mov	QWORD PTR 16[rsp], rax	# name, parser.previous
	sub	ebx, 1	# arg,
	js	.L349	#,
	movsxd	r13, DWORD PTR 16[rsp]	#, MEM[(int *)&name + 16B]
	mov	eax, ebx	# _182, arg
	mov	QWORD PTR 72[rsp], r14	#,
	sal	rax, 5	# _179,
	.cfi_offset 14, -24
	mov	r14, QWORD PTR 8[rsp]	# _35, MEM[(const char * *)&name + 8B]
	mov	r12, r13	#,
	lea	rbp, 32[r15+rax]	# ivtmp.408,
	.p2align 4
	.p2align 3
.L354:
# src/compiler.c:916:     if (a->length != b->length) return false;
	cmp	r12d, DWORD PTR 8[rbp]	# _36, MEM[(int *)_31 + 8B]
	jne	.L350	#,
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR 0[rbp]	# MEM[(const char * *)_31], MEM[(const char * *)_31]
	mov	rdx, r13	#, _44
	mov	rdi, r14	#, _35
	call	"memcmp"@PLT	#
# src/compiler.c:923:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# tmp355
	je	.L372	#,
.L350:
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# arg,
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	rbp, 32	# ivtmp.408,
	cmp	ebx, -1	# arg,
	jne	.L354	#,
	mov	r14, QWORD PTR 72[rsp]	#,
	.cfi_restore 14
.L349:
# src/compiler.c:600:     } else if ((arg = resolveUpvalue(current, &name)) != -1) {
	mov	rsi, rsp	# tmp245,
	mov	rdi, r15	#, current
	call	"resolveUpvalue"	#
	mov	ebx, eax	# arg, arg
# src/compiler.c:600:     } else if ((arg = resolveUpvalue(current, &name)) != -1) {
	cmp	eax, -1	# arg,
	je	.L373	#,
	mov	r15, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:602:         *setOp = OP_SET_UPVALUE;
	mov	ebp, 27	# setOp,
# src/compiler.c:601:         *getOp = OP_GET_UPVALUE;
	mov	esi, 26	#,
.L355:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[r15]	# current.7_91->function, current.7_91->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _93,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_95->function, current.7_95->function
	add	rdi, 24	# _97,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movabs	rsi, 4607182418800017408	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_177->function, current.7_177->function
	add	rdi, 24	# _150,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 34	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_41->function, current.7_41->function
	add	rdi, 24	# _24,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_120->function, current.7_120->function
	add	rdi, 24	# _122,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 24[rsp]	# tmp360, D.8718
	sub	rax, QWORD PTR fs:40	# tmp360, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L371	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_124->function, current.7_124->function
	add	rdi, 24	# _126,
.L370:
# src/compiler.c:633: }
	mov	rbx, QWORD PTR 40[rsp]	#,
	mov	rbp, QWORD PTR 48[rsp]	#,
	mov	r12, QWORD PTR 56[rsp]	#,
	mov	r13, QWORD PTR 64[rsp]	#,
	mov	r15, QWORD PTR 80[rsp]	#,
	add	rsp, 88	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L372:
	.cfi_def_cfa_offset 96
	.cfi_offset 14, -24
# src/compiler.c:924:             if (local->depth == -1) {
	mov	eax, ebx	# arg, arg
	sal	rax, 5	# tmp225,
# src/compiler.c:924:             if (local->depth == -1) {
	cmp	DWORD PTR 48[rax+r15], -1	# MEM <struct Compiler> [(struct Local *)current.46_29].locals[i_185].depth,
	je	.L374	#,
.L351:
# src/compiler.c:591:         if (arg <= UINT8_MAX) {
	cmp	ebx, 255	# arg,
	jle	.L362	#,
	mov	r14, QWORD PTR 72[rsp]	#,
	.cfi_restore 14
# src/compiler.c:597:             *setOp = OP_SET_LOCAL_LONG;
	mov	r13d, 9	# setOp,
# src/compiler.c:596:             *getOp = OP_GET_LOCAL_LONG;
	mov	esi, 7	#,
.L357:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[r15]	# current.7_75->function, current.7_75->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	mov	r12d, ebx	# _71, arg
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	ebp, ebx	# _69, arg
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	sar	r12d, 8	# _71,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebp, 16	# _69,
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _77,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	ebp, bpl	# _70, _69
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_79->function, current.7_79->function
	add	rdi, 24	# _81,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _71
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_83->function, current.7_83->function
	add	rdi, 24	# _85,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _70
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_87->function, current.7_87->function
	add	rdi, 24	# _89,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movabs	rsi, 4607182418800017408	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_61->function, current.7_61->function
	add	rdi, 24	# _128,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 34	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_190->function, current.7_190->function
	add	rdi, 24	# _60,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r13b	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_104->function, current.7_104->function
	add	rdi, 24	# _106,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_108->function, current.7_108->function
	add	rdi, 24	# _110,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _71
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_112->function, current.7_112->function
	add	rdi, 24	# _114,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 24[rsp]	# tmp359, D.8718
	sub	rax, QWORD PTR fs:40	# tmp359, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L371	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _70
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_116->function, current.7_116->function
	add	rdi, 24	# _118,
	jmp	.L370	#
	.p2align 4,,10
	.p2align 3
.L362:
	.cfi_offset 14, -24
	mov	r14, QWORD PTR 72[rsp]	#,
	.cfi_remember_state
	.cfi_restore 14
# src/compiler.c:593:             *setOp = OP_SET_LOCAL;
	mov	ebp, 8	# setOp,
# src/compiler.c:592:             *getOp = OP_GET_LOCAL;
	mov	esi, 6	#,
	jmp	.L355	#
.L374:
	.cfi_restore_state
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L351	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _54, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _54,
	je	.L375	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _54,
	je	.L353	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L353:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC14[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	mov	r15, QWORD PTR "current"[rip]	# current, current
	jmp	.L351	#
.L375:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L353	#
	.p2align 4,,10
	.p2align 3
.L373:
	.cfi_restore 14
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR 16[rsp]	#, MEM[(int *)&name + 16B]
	mov	rdi, QWORD PTR 8[rsp]	#, MEM[(const char * *)&name + 8B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp249,
	or	rax, rdx	# _62, tmp249
	mov	rsi, rax	# _64, _62
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_65->function, current.7_65->function
	add	rdi, 24	# _67,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
	mov	ebx, eax	# arg, arg
# src/compiler.c:606:         if (arg <= UINT8_MAX) {
	cmp	eax, 255	# arg,
	jle	.L363	#,
	mov	r15, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:612:             *setOp = OP_SET_GLOBAL_LONG;
	mov	r13d, 15	# setOp,
# src/compiler.c:611:             *getOp = OP_GET_GLOBAL_LONG;
	mov	esi, 11	#,
	jmp	.L357	#
.L363:
	mov	r15, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:608:             *setOp = OP_SET_GLOBAL;
	mov	ebp, 14	# setOp,
# src/compiler.c:607:             *getOp = OP_GET_GLOBAL;
	mov	esi, 10	#,
	jmp	.L355	#
.L371:
	mov	QWORD PTR 72[rsp], r14	#,
	.cfi_offset 14, -24
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE61:
	.size	"preInc", .-"preInc"
	.section	.rodata.str1.1
.LC23:
	.string	"Expect variable name."
.LC24:
	.string	"Expect ']' after size."
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"Expect ';' after variable declaration."
	.text
	.p2align 4
	.type	"varDeclaration", @function
"varDeclaration":
.LFB90:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:1009:     consume(TOKEN_IDENTIFIER, errorMessage);
	lea	rsi, .LC23[rip]	#,
	mov	edi, 37	#,
	xor	ebx, ebx	# _35
	call	"consume"	#
# src/compiler.c:1011:     declareVariable();
	call	"declareVariable"	#
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	eax, DWORD PTR 524828[rax]	#, current.80_32->scopeDepth
	test	eax, eax	#
	jg	.L377	#,
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR "parser"[rip+40]	#, MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR "parser"[rip+32]	#, MEM[(const char * *)&parser + 32B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp158,
	or	rax, rdx	# _42, tmp158
	mov	rsi, rax	# _44, _42
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_45->function, current.7_45->function
	add	rdi, 24	# _47,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
	mov	ebx, eax	# _35, _35
.L377:
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# _11, parser.current.type
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 2	# _11,
	je	.L378	#,
	cmp	eax, 30	# _11,
	je	.L391	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 2	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_22->function, current.7_22->function
	add	rdi, 24	# _24,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L382:
# src/compiler.c:1243:     consume(TOKEN_SEMICOLON, "Expect ';' after variable declaration.");
	lea	rsi, .LC25[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR "current"[rip]	# current.72_49, current
	mov	ecx, DWORD PTR 524828[rax]	# _50, current.72_49->scopeDepth
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	test	ecx, ecx	# _50
	jg	.L392	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.72_49->function, current.72_49->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_1, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _7,
# src/compiler.c:1029:     if (global <= UINT8_MAX) {
	cmp	ebx, 255	# _35,
	jg	.L385	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 12	#,
	call	"writeChunk"@PLT	#
.L390:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _62, _62
# src/compiler.c:1246: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_80->function,
	add	rdi, 24	# _82,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L391:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
.L380:
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
	jmp	.L382	#
	.p2align 4,,10
	.p2align 3
.L392:
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	ebx, DWORD PTR 524312[rax]	# tmp220, current.72_49->localCount
	lea	edx, -1[rbx]	# _52,
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	movsxd	rdx, edx	# _52, _52
	sal	rdx, 5	# tmp185,
	mov	DWORD PTR 48[rdx+rax], ecx	# current.72_49->locals[_52].depth, _50
# src/compiler.c:1246: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L378:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1230:         consume(TOKEN_RIGHT_BRACKET, "Expect ']' after size.");
	lea	rsi, .LC24[rip]	#,
	mov	edi, 3	#,
	call	"consume"	#
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR "parser"[rip], 30	# parser.current.type,
	je	.L393	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 30	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_18->function, current.7_18->function
	add	rdi, 24	# _20,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L382	#
	.p2align 4,,10
	.p2align 3
.L385:
	mov	esi, 13	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _2, _35
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_72->function, current.7_72->function
	add	rdi, 24	# _74,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _64, _35
# src/compiler.c:1036:             (uint8_t) ((global >> 16) & 0xff)
	sar	ebx, 16	# _62,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_76->function, current.7_76->function
	add	rdi, 24	# _78,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L390	#
	.p2align 4,,10
	.p2align 3
.L393:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_14->function, current.7_14->function
	add	rdi, 24	# _16,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L380	#
	.cfi_endproc
.LFE90:
	.size	"varDeclaration", .-"varDeclaration"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"Expect property name after '.'."
	.text
	.p2align 4
	.type	"dot", @function
"dot":
.LFB50:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/compiler.c:446:     consume(TOKEN_IDENTIFIER, "Expect property name after '.'.");
	lea	rsi, .LC26[rip]	#,
# src/compiler.c:445: static void dot(bool canAssign) {
	mov	ebp, edi	# canAssign, canAssign
# src/compiler.c:446:     consume(TOKEN_IDENTIFIER, "Expect property name after '.'.");
	mov	edi, 37	#,
# src/compiler.c:445: static void dot(bool canAssign) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:446:     consume(TOKEN_IDENTIFIER, "Expect property name after '.'.");
	call	"consume"	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR "parser"[rip+40]	#, MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR "parser"[rip+32]	#, MEM[(const char * *)&parser + 32B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp193,
	or	rax, rdx	# _33, tmp193
	mov	rsi, rax	# _35, _33
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_36->function, current.7_36->function
	add	rdi, 24	# _38,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
	mov	ebx, eax	# _39,
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# pretmp_163, parser.current.type
# src/compiler.c:450:     if (canAssign && match(TOKEN_EQUAL)) {
	test	bpl, bpl	# canAssign
	je	.L395	#,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 30	# pretmp_163,
	je	.L413	#,
.L395:
	test	eax, eax	# pretmp_163
	je	.L414	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_5, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_148->function, pretmp_148->function
	add	rdi, 24	# _150,
# src/compiler.c:460:         if (name < 256) emitGet(name, OP_GET_PROPERTY, false);
	cmp	ebx, 255	# _39,
	jle	.L400	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 19	#,
.L412:
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _164, _39
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_116->function,
	add	rdi, 24	# _118,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _108, _39
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebx, 16	# _106,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_120->function,
	add	rdi, 24	# _122,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L410:
	movzx	esi, bl	# _106, _106
.L411:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_124->function,
# src/compiler.c:463: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _126,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L400:
	.cfi_restore_state
	mov	esi, 18	#,
	call	"writeChunk"@PLT	#
	jmp	.L410	#
	.p2align 4,,10
	.p2align 3
.L414:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:455:         uint8_t argCount = argumentList();
	call	"argumentList"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_152, parser.previous.line
# src/compiler.c:455:         uint8_t argCount = argumentList();
	mov	ebp, eax	# argCount,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_153->function, pretmp_153->function
	add	rdi, 24	# _155,
# src/compiler.c:456:         if (name < 256) emitGet(name, OP_INVOKE, false);
	cmp	ebx, 255	# _39,
	jle	.L398	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 54	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _164, _39
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_87->function, current.7_87->function
	add	rdi, 24	# _89,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _79, _39
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebx, 16	# _77,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_91->function, current.7_91->function
	add	rdi, 24	# _93,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L409:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _77, _77
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_95->function,
	add	rdi, 24	# _97,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	movzx	esi, bpl	# argCount, argCount
	jmp	.L411	#
	.p2align 4,,10
	.p2align 3
.L413:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_158, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_159->function, pretmp_159->function
	add	rdi, 24	# _161,
# src/compiler.c:452:         if (name < 256) emitSet(name, OP_SET_PROPERTY, false);
	cmp	ebx, 255	# _39,
	jg	.L396	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 20	#,
	call	"writeChunk"@PLT	#
	jmp	.L410	#
	.p2align 4,,10
	.p2align 3
.L398:
	mov	esi, 53	#,
	call	"writeChunk"@PLT	#
	jmp	.L409	#
	.p2align 4,,10
	.p2align 3
.L396:
	mov	esi, 21	#,
	jmp	.L412	#
	.cfi_endproc
.LFE50:
	.size	"dot", .-"dot"
	.p2align 4
	.type	"binary", @function
"binary":
.LFB48:
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
# src/compiler.c:343:     TokenType operatorType = parser.previous.type;
	mov	eax, DWORD PTR "parser"[rip+24]	#, parser.previous.type
# src/compiler.c:347:     ExprResult left = lastExpr;
	movzx	r12d, BYTE PTR "lastExpr"[rip]	# left, MEM <unsigned char> [(struct  *)&lastExpr]
# src/compiler.c:348:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:347:     ExprResult left = lastExpr;
	mov	rbp, QWORD PTR "lastExpr"[rip+8]	# left$value, lastExpr.value
	mov	r14, QWORD PTR "lastExpr"[rip+16]	# vect_left$chunkSizeBefore_149.425, MEM <vector(2) int> [(int *)&lastExpr + 16B]
# src/compiler.c:351:     parsePrecedence((Precedence)(rule->precedence + 1));
	lea	rdx, [rax+rax*2]	# tmp245,
# src/compiler.c:343:     TokenType operatorType = parser.previous.type;
	mov	rbx, rax	#,
# src/compiler.c:351:     parsePrecedence((Precedence)(rule->precedence + 1));
	lea	rax, "rules"[rip]	# tmp241,
	mov	edi, DWORD PTR 16[rax+rdx*8]	# MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][operatorType_30].precedence, MEM <struct ParseRule[66]> [(struct ParseRule *)&rules][operatorType_30].precedence
	add	edi, 1	# _2,
# src/compiler.c:351:     parsePrecedence((Precedence)(rule->precedence + 1));
	call	"parsePrecedence"	#
# src/compiler.c:356:     if (left.isConst && right.isConst &&
	test	r12b, r12b	# left
	je	.L481	#,
# src/compiler.c:356:     if (left.isConst && right.isConst &&
	cmp	BYTE PTR "lastExpr"[rip], 0	# MEM <unsigned char> [(struct  *)&lastExpr],
	jne	.L471	#,
.L481:
	sub	ebx, 9	#,
.L416:
# src/compiler.c:413:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:416:     switch (operatorType) {
	cmp	ebx, 26	# tmp441,
	ja	.L415	#,
	lea	rdx, .L448[rip]	# tmp341,
	movsxd	rax, DWORD PTR [rdx+rbx*4]	# tmp343,
	add	rax, rdx	# tmp344, tmp341
	jmp	rax	# tmp344
	.section	.rodata
	.align 4
	.align 4
.L448:
	.long	.L461-.L448
	.long	.L460-.L448
	.long	.L415-.L448
	.long	.L415-.L448
	.long	.L446-.L448
	.long	.L459-.L448
	.long	.L445-.L448
	.long	.L458-.L448
	.long	.L457-.L448
	.long	.L456-.L448
	.long	.L415-.L448
	.long	.L455-.L448
	.long	.L454-.L448
	.long	.L415-.L448
	.long	.L415-.L448
	.long	.L415-.L448
	.long	.L415-.L448
	.long	.L415-.L448
	.long	.L415-.L448
	.long	.L415-.L448
	.long	.L453-.L448
	.long	.L415-.L448
	.long	.L452-.L448
	.long	.L451-.L448
	.long	.L450-.L448
	.long	.L449-.L448
	.long	.L447-.L448
	.text
	.p2align 4,,10
	.p2align 3
.L471:
# src/compiler.c:357:         IS_NUMBER(left.value) && IS_NUMBER(right.value)) {
	movabs	rax, 9222246136947933184	# tmp253,
# src/compiler.c:356:     if (left.isConst && right.isConst &&
	mov	rdx, rbp	# tmp445, left$value
	not	rdx	# tmp445
	test	rdx, rax	# tmp445, tmp253
	je	.L481	#,
# src/compiler.c:357:         IS_NUMBER(left.value) && IS_NUMBER(right.value)) {
	mov	rcx, QWORD PTR "lastExpr"[rip+8]	# tmp444, lastExpr.value
	not	rcx	# tmp444
	test	rcx, rax	# tmp444, tmp253
	je	.L481	#,
	movq	xmm7, r14	# vect_left$chunkSizeBefore_149.425, vect_left$chunkSizeBefore_149.425
# src/compiler.c:366:         switch (operatorType) {
	sub	ebx, 9	#,
	movq	xmm0, rbp	# _55, left$value
	movsd	xmm1, QWORD PTR "lastExpr"[rip+8]	# _56, lastExpr.value
	pextrd	r12d, xmm7, 1	# _195, vect_left$chunkSizeBefore_149.425
	cmp	ebx, 26	# tmp441,
	ja	.L416	#,
	lea	rdx, .L418[rip]	# tmp261,
	mov	eax, ebx	# tmp260, tmp441
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp263,
	add	rax, rdx	# tmp264, tmp261
	jmp	rax	# tmp264
	.section	.rodata
	.align 4
	.align 4
.L418:
	.long	.L433-.L418
	.long	.L432-.L418
	.long	.L416-.L418
	.long	.L416-.L418
	.long	.L431-.L418
	.long	.L430-.L418
	.long	.L429-.L418
	.long	.L428-.L418
	.long	.L427-.L418
	.long	.L426-.L418
	.long	.L416-.L418
	.long	.L425-.L418
	.long	.L424-.L418
	.long	.L416-.L418
	.long	.L416-.L418
	.long	.L416-.L418
	.long	.L416-.L418
	.long	.L416-.L418
	.long	.L416-.L418
	.long	.L416-.L418
	.long	.L423-.L418
	.long	.L416-.L418
	.long	.L422-.L418
	.long	.L421-.L418
	.long	.L420-.L418
	.long	.L419-.L418
	.long	.L417-.L418
	.text
.L417:
# src/compiler.c:386:             case TOKEN_LESS_EQUAL:    isBool = true; boolResult = a <= b; break;
	comisd	xmm1, xmm0	# _56, _55
	setnb	al	#, boolResult
.L475:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rdx]	# _312,
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	#, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
.L441:
# src/compiler.c:396:                 lastExpr.chunkSizeBefore  = currentChunk()->count;
	mov	QWORD PTR "lastExpr"[rip+16], r14	# MEM <vector(2) int> [(int *)&lastExpr + 16B], vect_left$chunkSizeBefore_149.425
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_309, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _308,
# src/compiler.c:398:                 emitByte(boolResult ? OP_TRUE : OP_FALSE);
	test	al, al	# boolResult
	jne	.L442	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 4	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:400:                 lastExpr.value   = BOOL_VAL(boolResult);
	movabs	rax, 9222246136947933186	# iftmp.57_27,
.L443:
	mov	BYTE PTR "lastExpr"[rip], 1	# lastExpr.isConst,
# src/compiler.c:400:                 lastExpr.value   = BOOL_VAL(boolResult);
	mov	QWORD PTR "lastExpr"[rip+8], rax	# lastExpr.value, iftmp.57_27
.L415:
# src/compiler.c:435: }
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
.L456:
	.cfi_restore_state
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 43	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_115->function, current.7_115->function
	add	rdi, 24	# _117,
.L482:
# src/compiler.c:435: }
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
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L455:
	.cfi_restore_state
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 46	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_119->function, current.7_119->function
	add	rdi, 24	# _121,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L454:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 45	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_123->function, current.7_123->function
	add	rdi, 24	# _125,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L453:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 31	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_157->function, current.7_157->function
	add	rdi, 24	# _159,
.L483:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 39	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_177->function,
# src/compiler.c:435: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _179,
# src/compiler.c:435: }
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r14	#
	.cfi_def_cfa_offset 8
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L452:
	.cfi_restore_state
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 31	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_75->function, current.7_75->function
	add	rdi, 24	# _77,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L451:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 32	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_79->function, current.7_79->function
	add	rdi, 24	# _81,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L450:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 33	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_165->function, current.7_165->function
	add	rdi, 24	# _167,
	jmp	.L483	#
	.p2align 4,,10
	.p2align 3
.L449:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 33	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_83->function, current.7_83->function
	add	rdi, 24	# _85,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L459:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 36	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_95->function, current.7_95->function
	add	rdi, 24	# _97,
	jmp	.L482	#
.L429:
# src/compiler.c:374:                 if (b == 0.0) { fold = false; break; }
	pxor	xmm2, xmm2	# tmp272
	ucomisd	xmm1, xmm2	# _56, tmp272
	jp	.L463	#,
	jne	.L463	#,
# src/compiler.c:413:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
	.p2align 4
	.p2align 3
.L445:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 38	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_103->function, current.7_103->function
	add	rdi, 24	# _105,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L458:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 41	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_107->function, current.7_107->function
	add	rdi, 24	# _109,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L457:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 42	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_111->function, current.7_111->function
	add	rdi, 24	# _113,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L460:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 34	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_87->function, current.7_87->function
	add	rdi, 24	# _89,
	jmp	.L482	#
.L431:
# src/compiler.c:371:                 if (b == 0.0) { fold = false; break; }
	pxor	xmm2, xmm2	# tmp269
	ucomisd	xmm1, xmm2	# _56, tmp269
	jp	.L462	#,
	jne	.L462	#,
# src/compiler.c:413:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
	.p2align 4
	.p2align 3
.L446:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 37	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_99->function, current.7_99->function
	add	rdi, 24	# _101,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L461:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 35	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_91->function, current.7_91->function
	add	rdi, 24	# _93,
	jmp	.L482	#
	.p2align 4,,10
	.p2align 3
.L447:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 32	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_173->function, current.7_173->function
	add	rdi, 24	# _175,
	jmp	.L483	#
.L419:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:382:             case TOKEN_LESS:          isBool = true; boolResult = a < b;  break;
	comisd	xmm1, xmm0	# _56, _55
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# _312, current.7_279->function
# src/compiler.c:382:             case TOKEN_LESS:          isBool = true; boolResult = a < b;  break;
	seta	al	#, boolResult
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	# MEM[(struct Chunk *)_280 + 24B].count, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L441	#
.L420:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:385:             case TOKEN_GREATER_EQUAL: isBool = true; boolResult = a >= b; break;
	comisd	xmm0, xmm1	# _55, _56
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# _312, current.7_303->function
# src/compiler.c:385:             case TOKEN_GREATER_EQUAL: isBool = true; boolResult = a >= b; break;
	setnb	al	#, boolResult
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	# MEM[(struct Chunk *)_304 + 24B].count, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L441	#
.L421:
# src/compiler.c:381:             case TOKEN_GREATER:       isBool = true; boolResult = a > b;  break;
	comisd	xmm0, xmm1	# _55, _56
	seta	al	#, boolResult
	jmp	.L475	#
.L422:
# src/compiler.c:383:             case TOKEN_EQUAL_EQUAL:   isBool = true; boolResult = a == b; break;
	ucomisd	xmm0, xmm1	# _55, _56
	mov	edx, 0	# tmp313,
	setnp	al	#, tmp312
	cmovne	eax, edx	# tmp312,, boolResult, tmp313
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rdx]	# _312, current.7_287->function
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	# MEM[(struct Chunk *)_288 + 24B].count, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L441	#
.L423:
# src/compiler.c:384:             case TOKEN_BANG_EQUAL:    isBool = true; boolResult = a != b; break;
	ucomisd	xmm0, xmm1	# _55, _56
	mov	edx, 1	# tmp319,
	setp	al	#, tmp318
	cmovne	eax, edx	# tmp318,, boolResult, tmp319
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rdx]	# _312, current.7_295->function
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	# MEM[(struct Chunk *)_296 + 24B].count, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L441	#
.L424:
# src/compiler.c:380:             case TOKEN_RIGHT_SHIFT:   numResult = (double) (int32_t) (((uint32_t) a) >> ((uint32_t) b & 31)); break;
	cvttsd2si	rax, xmm0	# tmp298, _55
# src/compiler.c:380:             case TOKEN_RIGHT_SHIFT:   numResult = (double) (int32_t) (((uint32_t) a) >> ((uint32_t) b & 31)); break;
	pxor	xmm2, xmm2	# numResult
# src/compiler.c:380:             case TOKEN_RIGHT_SHIFT:   numResult = (double) (int32_t) (((uint32_t) a) >> ((uint32_t) b & 31)); break;
	cvttsd2si	rcx, xmm1	# tmp300, _56
# src/compiler.c:380:             case TOKEN_RIGHT_SHIFT:   numResult = (double) (int32_t) (((uint32_t) a) >> ((uint32_t) b & 31)); break;
	shr	eax, cl	# _24, tmp442
# src/compiler.c:380:             case TOKEN_RIGHT_SHIFT:   numResult = (double) (int32_t) (((uint32_t) a) >> ((uint32_t) b & 31)); break;
	cvtsi2sd	xmm2, eax	# numResult, _24
.L478:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _320,
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	#, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
.L434:
# src/value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rbx, xmm2	# _73, numResult
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _72,
# src/compiler.c:403:                 lastExpr.chunkSizeBefore  = currentChunk()->count;
	mov	QWORD PTR "lastExpr"[rip+16], r14	# MEM <vector(2) int> [(int *)&lastExpr + 16B], vect_left$chunkSizeBefore_149.425
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	rsi, rbx	#, _73
	call	"writeConstant"@PLT	#
# src/compiler.c:406:                 lastExpr.isConst = true;
	mov	BYTE PTR "lastExpr"[rip], 1	# lastExpr.isConst,
# src/compiler.c:407:                 lastExpr.value   = folded;
	mov	QWORD PTR "lastExpr"[rip+8], rbx	# lastExpr.value, _73
	jmp	.L415	#
.L425:
# src/compiler.c:379:             case TOKEN_LEFT_SHIFT:    numResult = (double) (int32_t) (((uint32_t) a) << ((uint32_t) b & 31)); break;
	cvttsd2si	rax, xmm0	# tmp291, _55
# src/compiler.c:379:             case TOKEN_LEFT_SHIFT:    numResult = (double) (int32_t) (((uint32_t) a) << ((uint32_t) b & 31)); break;
	pxor	xmm2, xmm2	# numResult
# src/compiler.c:379:             case TOKEN_LEFT_SHIFT:    numResult = (double) (int32_t) (((uint32_t) a) << ((uint32_t) b & 31)); break;
	cvttsd2si	rcx, xmm1	# tmp293, _56
# src/compiler.c:379:             case TOKEN_LEFT_SHIFT:    numResult = (double) (int32_t) (((uint32_t) a) << ((uint32_t) b & 31)); break;
	sal	eax, cl	# _19, tmp443
# src/compiler.c:379:             case TOKEN_LEFT_SHIFT:    numResult = (double) (int32_t) (((uint32_t) a) << ((uint32_t) b & 31)); break;
	cvtsi2sd	xmm2, eax	# numResult, _19
.L477:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _320,
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	#, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L434	#
.L426:
# src/compiler.c:378:             case TOKEN_CARET:         numResult = (double) (((int32_t) a) ^ ((int32_t) b)); break;
	cvttsd2si	eax, xmm0	# _13, _55
# src/compiler.c:378:             case TOKEN_CARET:         numResult = (double) (((int32_t) a) ^ ((int32_t) b)); break;
	pxor	xmm2, xmm2	# numResult
# src/compiler.c:378:             case TOKEN_CARET:         numResult = (double) (((int32_t) a) ^ ((int32_t) b)); break;
	cvttsd2si	edx, xmm1	# _14, _56
# src/compiler.c:378:             case TOKEN_CARET:         numResult = (double) (((int32_t) a) ^ ((int32_t) b)); break;
	xor	eax, edx	# _15, _14
# src/compiler.c:378:             case TOKEN_CARET:         numResult = (double) (((int32_t) a) ^ ((int32_t) b)); break;
	cvtsi2sd	xmm2, eax	# numResult, _15
.L476:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _320,
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	#, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L434	#
.L427:
# src/compiler.c:377:             case TOKEN_PIPE:          numResult = (double) (((int32_t) a) | ((int32_t) b)); break;
	cvttsd2si	eax, xmm0	# _10, _55
# src/compiler.c:377:             case TOKEN_PIPE:          numResult = (double) (((int32_t) a) | ((int32_t) b)); break;
	pxor	xmm2, xmm2	# numResult
# src/compiler.c:377:             case TOKEN_PIPE:          numResult = (double) (((int32_t) a) | ((int32_t) b)); break;
	cvttsd2si	edx, xmm1	# _11, _56
# src/compiler.c:377:             case TOKEN_PIPE:          numResult = (double) (((int32_t) a) | ((int32_t) b)); break;
	or	eax, edx	# _12, _11
# src/compiler.c:377:             case TOKEN_PIPE:          numResult = (double) (((int32_t) a) | ((int32_t) b)); break;
	cvtsi2sd	xmm2, eax	# numResult, _12
.L479:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _320,
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	#, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L434	#
.L428:
# src/compiler.c:376:             case TOKEN_AMPERSAND:     numResult = (double) (((int32_t) a) & ((int32_t) b)); break;
	cvttsd2si	eax, xmm0	# _7, _55
# src/compiler.c:376:             case TOKEN_AMPERSAND:     numResult = (double) (((int32_t) a) & ((int32_t) b)); break;
	pxor	xmm2, xmm2	# numResult
# src/compiler.c:376:             case TOKEN_AMPERSAND:     numResult = (double) (((int32_t) a) & ((int32_t) b)); break;
	cvttsd2si	edx, xmm1	# _8, _56
# src/compiler.c:376:             case TOKEN_AMPERSAND:     numResult = (double) (((int32_t) a) & ((int32_t) b)); break;
	and	eax, edx	# _9, _8
# src/compiler.c:376:             case TOKEN_AMPERSAND:     numResult = (double) (((int32_t) a) & ((int32_t) b)); break;
	cvtsi2sd	xmm2, eax	# numResult, _9
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _320, current.7_231->function
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	# MEM[(struct Chunk *)_232 + 24B].count, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L434	#
.L430:
# src/compiler.c:369:             case TOKEN_STAR:          numResult = a * b; break;
	movapd	xmm2, xmm0	# _55, _55
	mulsd	xmm2, xmm1	# _55, _56
	jmp	.L478	#
.L432:
# src/compiler.c:367:             case TOKEN_PLUS:          numResult = a + b; break;
	movapd	xmm2, xmm0	# _55, _55
	addsd	xmm2, xmm1	# _55, _56
	jmp	.L476	#
.L433:
# src/compiler.c:368:             case TOKEN_MINUS:         numResult = a - b; break;
	movapd	xmm2, xmm0	# _55, _55
	subsd	xmm2, xmm1	# _55, _56
	jmp	.L477	#
	.p2align 4,,10
	.p2align 3
.L442:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 3	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:400:                 lastExpr.value   = BOOL_VAL(boolResult);
	movabs	rax, 9222246136947933187	# iftmp.57_27,
	jmp	.L443	#
.L462:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:372:                 numResult = a / b; break;
	movapd	xmm2, xmm0	# _55, _55
	divsd	xmm2, xmm1	# _55, _56
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# _320, pretmp_202->function
# src/compiler.c:392:             currentChunk()->count          = left.chunkSizeBefore;
	mov	DWORD PTR 24[rdi], r14d	#, vect_left$chunkSizeBefore_149.425
# src/compiler.c:393:             currentChunk()->constants.count = left.constPoolBefore;
	mov	DWORD PTR 60[rdi], r12d	#, _195
	jmp	.L434	#
.L463:
# src/compiler.c:375:                 numResult = fmod(a, b); break;
	movsd	QWORD PTR 8[rsp], xmm1	# %sfp, _56
	fld	QWORD PTR 8[rsp]	# %sfp
	movsd	QWORD PTR 8[rsp], xmm0	# %sfp, _55
	fld	QWORD PTR 8[rsp]	# %sfp
.L439:
	fprem	
	fnstsw	ax	# tmp276
	sahf	
	jp	.L439	#,
	fstp	st(1)		#
	fstp	QWORD PTR 8[rsp]	# %sfp
	movsd	xmm2, QWORD PTR 8[rsp]	# numResult, %sfp
	ucomisd	xmm2, xmm2	# numResult, numResult
	jnp	.L479	#,
	call	"fmod"@PLT	#
	movsd	xmm2, QWORD PTR 8[rsp]	# numResult, %sfp
	jmp	.L479	#
	.cfi_endproc
.LFE48:
	.size	"binary", .-"binary"
	.p2align 4
	.type	"namedVariable", @function
"namedVariable":
.LFB63:
	.cfi_startproc
	sub	rsp, 104	#,
	.cfi_def_cfa_offset 112
	mov	QWORD PTR 56[rsp], rbx	#,
	movdqu	xmm0, XMMWORD PTR 112[rsp]	# name, name
	mov	QWORD PTR 88[rsp], r14	#,
	.cfi_offset 3, -56
	.cfi_offset 14, -24
# src/compiler.c:588:     int arg = resolveLocal(current, &name);
	mov	r14, QWORD PTR "current"[rip]	# current.46_175, current
# src/compiler.c:650: static void namedVariable(Token name, bool canAssign) {
	mov	QWORD PTR 64[rsp], rbp	#,
	mov	QWORD PTR 72[rsp], r12	#,
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	mov	ebx, DWORD PTR 524312[r14]	# arg, current.46_175->localCount
# src/compiler.c:650: static void namedVariable(Token name, bool canAssign) {
	mov	QWORD PTR 80[rsp], r13	#,
	mov	BYTE PTR 15[rsp], dil	# %sfp, canAssign
	mov	rax, QWORD PTR fs:40	# tmp684, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 40[rsp], rax	# D.9029, tmp684
	xor	eax, eax	# tmp684
	mov	rax, QWORD PTR 128[rsp]	# name, name
	movaps	XMMWORD PTR 16[rsp], xmm0	# MEM[(struct  *)_991], name
	mov	QWORD PTR 32[rsp], rax	# MEM[(struct  *)_991], name
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# arg,
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	js	.L485	#,
	mov	eax, ebx	# _852, arg
	mov	QWORD PTR 96[rsp], r15	#,
	mov	r13, QWORD PTR 24[rsp]	# _181, MEM[(const char * *)_991 + 8B]
	sal	rax, 5	# _853,
	.cfi_offset 15, -16
	mov	r15d, DWORD PTR 32[rsp]	# _182, MEM[(int *)_991 + 16B]
	lea	rbp, 32[r14+rax]	# ivtmp.450,
	.p2align 4
	.p2align 3
.L490:
# src/compiler.c:916:     if (a->length != b->length) return false;
	cmp	r15d, DWORD PTR 8[rbp]	# _182, MEM[(int *)_864 + 8B]
	jne	.L486	#,
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR 0[rbp]	# MEM[(const char * *)_864], MEM[(const char * *)_864]
	movsxd	rdx, r15d	#, _182
	mov	rdi, r13	#, _181
	call	"memcmp"@PLT	#
# src/compiler.c:923:         if (identifiersEqual(name, &local->name)) {
	test	eax, eax	# tmp1524
	je	.L601	#,
.L486:
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	ebx, 1	# arg,
# src/compiler.c:921:     for (int i = compiler->localCount - 1; i >= 0; i--) {
	sub	rbp, 32	# ivtmp.450,
	cmp	ebx, -1	# arg,
	jne	.L490	#,
	mov	r15, QWORD PTR 96[rsp]	#,
	.cfi_restore 15
.L485:
# src/compiler.c:600:     } else if ((arg = resolveUpvalue(current, &name)) != -1) {
	lea	rsi, 16[rsp]	#,
	mov	rdi, r14	#, current.46_175
	call	"resolveUpvalue"	#
	mov	ebx, eax	# arg, arg
# src/compiler.c:600:     } else if ((arg = resolveUpvalue(current, &name)) != -1) {
	cmp	eax, -1	# arg,
	je	.L602	#,
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# pretmp_919, parser.current.type
# src/compiler.c:671:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 26	# pretmp_919,
	je	.L603	#,
	cmp	eax, 27	# pretmp_919,
	je	.L604	#,
# src/compiler.c:601:         *getOp = OP_GET_UPVALUE;
	mov	ebp, 26	# getOp,
# src/compiler.c:602:         *setOp = OP_SET_UPVALUE;
	mov	r13d, 27	# setOp,
	jmp	.L513	#
	.p2align 4,,10
	.p2align 3
.L601:
	.cfi_offset 15, -16
# src/compiler.c:924:             if (local->depth == -1) {
	mov	eax, ebx	# arg, arg
	sal	rax, 5	# tmp701,
# src/compiler.c:924:             if (local->depth == -1) {
	cmp	DWORD PTR 48[rax+r14], -1	# MEM <struct Compiler> [(struct Local *)current.46_175].locals[i_849].depth,
	je	.L605	#,
.L487:
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# pretmp_919, parser.current.type
# src/compiler.c:591:         if (arg <= UINT8_MAX) {
	cmp	ebx, 255	# arg,
	jg	.L606	#,
# src/compiler.c:671:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 26	# pretmp_919,
	je	.L607	#,
# src/compiler.c:592:             *getOp = OP_GET_LOCAL;
	mov	ebp, 6	# getOp,
# src/compiler.c:593:             *setOp = OP_SET_LOCAL;
	mov	r13d, 8	# setOp,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 27	# pretmp_919,
	je	.L608	#,
	mov	r15, QWORD PTR 96[rsp]	#,
	.cfi_restore 15
.L513:
# src/compiler.c:690:     if (canAssign) {
	cmp	BYTE PTR 15[rsp], 0	# %sfp,
	jne	.L548	#,
.L545:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_701->function, current.7_701->function
	add	rdi, 24	# _703,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1548, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1548, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
	movzx	esi, bl	# arg, arg
.L594:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_676->function,
	add	rdi, 24	# _678,
.L592:
# src/compiler.c:725: }
	mov	rbx, QWORD PTR 56[rsp]	#,
	mov	rbp, QWORD PTR 64[rsp]	#,
	mov	r12, QWORD PTR 72[rsp]	#,
	mov	r13, QWORD PTR 80[rsp]	#,
	mov	r14, QWORD PTR 88[rsp]	#,
	add	rsp, 104	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L606:
	.cfi_def_cfa_offset 112
	.cfi_offset 15, -16
# src/compiler.c:671:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 26	# pretmp_919,
	je	.L609	#,
	cmp	eax, 27	# pretmp_919,
	je	.L610	#,
# src/compiler.c:690:     if (canAssign) {
	cmp	BYTE PTR 15[rsp], 0	# %sfp,
	jne	.L564	#,
	mov	r15, QWORD PTR 96[rsp]	#,
	.cfi_restore 15
# src/compiler.c:596:             *getOp = OP_GET_LOCAL_LONG;
	mov	ebp, 7	# getOp,
.L550:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_685->function, current.7_685->function
	add	rdi, 24	# _687,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# arg, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_689->function, current.7_689->function
	add	rdi, 24	# _691,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _681, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_693->function, current.7_693->function
	add	rdi, 24	# _695,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1547, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1547, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebx, 16	# _679,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bl	# _679, _679
	jmp	.L594	#
.L608:
	.cfi_offset 15, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
	mov	r15, QWORD PTR 96[rsp]	#,
	.cfi_restore 15
# src/compiler.c:593:             *setOp = OP_SET_LOCAL;
	mov	r12d, 8	# setOp,
.L514:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_295->function, current.7_295->function
	add	rdi, 24	# _297,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_299->function, current.7_299->function
	add	rdi, 24	# _301,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movabs	rsi, 4607182418800017408	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_993->function, current.7_993->function
	add	rdi, 24	# _995,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 35	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_998->function, current.7_998->function
	add	rdi, 24	# _1000,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	movzx	esi, r12b	# setOp, setOp
.L597:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_469->function,
	add	rdi, 24	# _471,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1540, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1540, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
.L532:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_473->function,
	add	rdi, 24	# _475,
	jmp	.L592	#
	.p2align 4,,10
	.p2align 3
.L607:
	.cfi_offset 15, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
	mov	r15, QWORD PTR 96[rsp]	#,
	.cfi_restore 15
# src/compiler.c:592:             *getOp = OP_GET_LOCAL;
	mov	ebp, 6	# getOp,
# src/compiler.c:593:             *setOp = OP_SET_LOCAL;
	mov	r12d, 8	# setOp,
.L507:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_237->function, current.7_237->function
	add	rdi, 24	# _239,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_241->function, current.7_241->function
	add	rdi, 24	# _243,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movabs	rsi, 4607182418800017408	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_265->function, current.7_265->function
	add	rdi, 24	# _267,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 34	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_249->function, current.7_249->function
	add	rdi, 24	# _251,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	movzx	esi, r12b	# setOp, setOp
	jmp	.L597	#
.L605:
	.cfi_offset 15, -16
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L487	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _200, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _200,
	je	.L611	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _200,
	je	.L489	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L489:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC14[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L487	#
.L548:
	.cfi_restore 15
	sub	eax, 22	#,
# src/compiler.c:576:         emitDoubleWord(
	mov	r12d, ebx	# _1006, arg
	cmp	eax, 14	# tmp1512,
	ja	.L556	#,
	lea	rdx, .L558[rip]	# tmp1514,
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp1516,
	add	rax, rdx	# tmp1517, tmp1514
	jmp	rax	# tmp1517
	.section	.rodata
	.align 4
	.align 4
.L558:
	.long	.L531-.L558
	.long	.L527-.L558
	.long	.L539-.L558
	.long	.L535-.L558
	.long	.L556-.L558
	.long	.L556-.L558
	.long	.L556-.L558
	.long	.L556-.L558
	.long	.L521-.L558
	.long	.L556-.L558
	.long	.L556-.L558
	.long	.L556-.L558
	.long	.L556-.L558
	.long	.L556-.L558
	.long	.L543-.L558
	.text
	.p2align 4,,10
	.p2align 3
.L609:
	.cfi_offset 15, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
	mov	r15, QWORD PTR 96[rsp]	#,
	.cfi_restore 15
# src/compiler.c:596:             *getOp = OP_GET_LOCAL_LONG;
	mov	ebp, 7	# getOp,
# src/compiler.c:597:             *setOp = OP_SET_LOCAL_LONG;
	mov	r12d, 9	# setOp,
.L505:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
	movzx	r13d, bl	# _219, arg
	movzx	ebp, bh	# _217, arg
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebx, 16	# _215,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_221->function, current.7_221->function
	add	rdi, 24	# _223,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, r13d	#, _219
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_225->function, current.7_225->function
	add	rdi, 24	# _227,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _217
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_229->function, current.7_229->function
	add	rdi, 24	# _231,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, _215
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_233->function, current.7_233->function
	add	rdi, 24	# _235,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movabs	rsi, 4607182418800017408	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_1014->function, current.7_1014->function
	add	rdi, 24	# _1016,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 34	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_1020->function, current.7_1020->function
	add	rdi, 24	# _1022,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_11->function, pretmp_11->function
	add	rdi, 24	# _721,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, r13d	#, _219
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_254->function, current.7_254->function
	add	rdi, 24	# _256,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _217
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_258->function, current.7_258->function
	add	rdi, 24	# _260,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1531, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1531, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L532	#,
	jmp	.L593	#
.L603:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:601:         *getOp = OP_GET_UPVALUE;
	mov	ebp, 26	# getOp,
# src/compiler.c:602:         *setOp = OP_SET_UPVALUE;
	mov	r12d, 27	# setOp,
	jmp	.L507	#
	.p2align 4,,10
	.p2align 3
.L610:
	.cfi_offset 15, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
	mov	r15, QWORD PTR 96[rsp]	#,
	.cfi_restore 15
# src/compiler.c:596:             *getOp = OP_GET_LOCAL_LONG;
	mov	ebp, 7	# getOp,
# src/compiler.c:597:             *setOp = OP_SET_LOCAL_LONG;
	mov	r12d, 9	# setOp,
.L516:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	mov	r13d, ebx	# _275, arg
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	r14d, ebx	# _273, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	sar	r13d, 8	# _275,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	r14d, 16	# _273,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_279->function, current.7_279->function
	add	rdi, 24	# _281,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_283->function, current.7_283->function
	add	rdi, 24	# _285,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r13b	#, _275
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_287->function, current.7_287->function
	add	rdi, 24	# _289,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	#, _273
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_291->function, current.7_291->function
	add	rdi, 24	# _293,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movabs	rsi, 4607182418800017408	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_979->function, current.7_979->function
	add	rdi, 24	# _981,
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 35	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_984->function, current.7_984->function
	add	rdi, 24	# _986,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_308->function, current.7_308->function
	add	rdi, 24	# _310,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_312->function, current.7_312->function
	add	rdi, 24	# _314,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r13b	#, _275
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_316->function, current.7_316->function
	add	rdi, 24	# _318,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1533, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1533, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
.L542:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	#, _592
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_639->function,
	add	rdi, 24	# _641,
	jmp	.L592	#
.L611:
	.cfi_offset 15, -16
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L489	#
.L543:
	.cfi_restore 15
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_65->function, pretmp_65->function
	add	rdi, 24	# _63,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _1006
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_618->function, current.7_618->function
	add	rdi, 24	# _620,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 38	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_950->function, current.7_950->function
	add	rdi, 24	# _952,
.L599:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r13b	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_643->function,
	add	rdi, 24	# _645,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1546, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1546, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _1006
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_647->function,
	add	rdi, 24	# _649,
	jmp	.L592	#
.L521:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r13b	# setOp, setOp
.L596:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_969->function,
	add	rdi, 24	# _971,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1550, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1550, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
	movzx	esi, r12b	# _1006, _1006
	jmp	.L594	#
.L535:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_425->function, pretmp_425->function
	add	rdi, 24	# _447,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _1006
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_502->function, current.7_502->function
	add	rdi, 24	# _504,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 36	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_922->function, current.7_922->function
	add	rdi, 24	# _924,
	jmp	.L599	#
.L539:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_500->function, pretmp_500->function
	add	rdi, 24	# _480,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _1006
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_560->function, current.7_560->function
	add	rdi, 24	# _562,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 37	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_936->function, current.7_936->function
	add	rdi, 24	# _938,
	jmp	.L599	#
.L527:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_975->function, pretmp_975->function
	add	rdi, 24	# _912,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _1006
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_386->function, current.7_386->function
	add	rdi, 24	# _388,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 34	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_176->function, current.7_176->function
	add	rdi, 24	# _197,
	jmp	.L599	#
.L531:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# getOp, getOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_392->function, pretmp_392->function
	add	rdi, 24	# _708,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_444->function, current.7_444->function
	add	rdi, 24	# _446,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 35	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_56->function, current.7_56->function
	add	rdi, 24	# _28,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	movzx	esi, r13b	# setOp, setOp
	jmp	.L597	#
.L556:
	movzx	esi, bpl	# getOp, getOp
	jmp	.L596	#
	.p2align 4,,10
	.p2align 3
.L602:
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR 32[rsp]	#, MEM[(int *)_991 + 16B]
	mov	rdi, QWORD PTR 24[rsp]	#, MEM[(const char * *)_991 + 8B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp726,
	or	rax, rdx	# _208, tmp726
	mov	rsi, rax	# _210, _208
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_211->function, current.7_211->function
	add	rdi, 24	# _213,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
	mov	ebx, eax	# arg, arg
# src/compiler.c:606:         if (arg <= UINT8_MAX) {
	cmp	eax, 255	# arg,
	jg	.L612	#,
# src/compiler.c:657:     if ((getOp == OP_GET_GLOBAL || getOp == OP_GET_GLOBAL_LONG) && !canAssign) {
	cmp	BYTE PTR 15[rsp], 0	# %sfp,
	je	.L561	#,
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# pretmp_919, parser.current.type
# src/compiler.c:671:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 26	# pretmp_919,
	je	.L613	#,
# src/compiler.c:608:             *setOp = OP_SET_GLOBAL;
	mov	r13d, 14	# setOp,
# src/compiler.c:607:             *getOp = OP_GET_GLOBAL;
	mov	ebp, 10	# getOp,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 27	# pretmp_919,
	jne	.L548	#,
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:608:             *setOp = OP_SET_GLOBAL;
	mov	r12d, 14	# setOp,
	jmp	.L514	#
.L564:
	.cfi_offset 15, -16
	mov	r15, QWORD PTR 96[rsp]	#,
	.cfi_restore 15
# src/compiler.c:597:             *setOp = OP_SET_LOCAL_LONG;
	mov	r13d, 9	# setOp,
# src/compiler.c:596:             *getOp = OP_GET_LOCAL_LONG;
	mov	r12d, 7	# getOp,
.L549:
	sub	eax, 22	#,
# src/compiler.c:576:         emitDoubleWord(
	movzx	ebp, bl	#, arg
	cmp	eax, 14	# tmp1492,
	ja	.L553	#,
	lea	rdx, .L555[rip]	# tmp1494,
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp1496,
	add	rax, rdx	# tmp1497, tmp1494
	jmp	rax	# tmp1497
	.section	.rodata
	.align 4
	.align 4
.L555:
	.long	.L529-.L555
	.long	.L525-.L555
	.long	.L537-.L555
	.long	.L533-.L555
	.long	.L553-.L555
	.long	.L553-.L555
	.long	.L553-.L555
	.long	.L553-.L555
	.long	.L523-.L555
	.long	.L553-.L555
	.long	.L553-.L555
	.long	.L553-.L555
	.long	.L553-.L555
	.long	.L553-.L555
	.long	.L541-.L555
	.text
.L553:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r12b	# getOp, getOp
.L600:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_863->function,
	add	rdi, 24	# _858,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# _960, _960
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_660->function,
	add	rdi, 24	# _662,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bh	# _652, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# current.7_664->function,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _666,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1549, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1549, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	esi, ebx	# arg, arg
	sar	esi, 16	# arg,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, sil	# _650, _650
	jmp	.L594	#
.L541:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r12b	# getOp, getOp
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	r14d, ebx	# _592, arg
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	sar	ebx, 8	# _594,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	r14d, 16	# _592,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_911->function, pretmp_911->function
	add	rdi, 24	# _885,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _960
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_602->function, current.7_602->function
	add	rdi, 24	# _604,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, _594
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_606->function, current.7_606->function
	add	rdi, 24	# _608,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	#, _592
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_610->function, current.7_610->function
	add	rdi, 24	# _612,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 38	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_943->function, current.7_943->function
	add	rdi, 24	# _945,
.L598:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r13b	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_627->function,
	add	rdi, 24	# _629,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _960
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_631->function,
	add	rdi, 24	# _633,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, _594
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_635->function,
	add	rdi, 24	# _637,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1545, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1545, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L542	#,
.L593:
	mov	QWORD PTR 96[rsp], r15	#,
	.cfi_offset 15, -16
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"__stack_chk_fail"@PLT	#
	.p2align 4,,10
	.p2align 3
.L523:
	.cfi_restore 15
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r13b	# setOp, setOp
	jmp	.L600	#
.L533:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r12b	# getOp, getOp
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	r14d, ebx	# _476, arg
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	sar	ebx, 8	# _478,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	r14d, 16	# _476,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_509->function, pretmp_509->function
	add	rdi, 24	# _89,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _960
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_486->function, current.7_486->function
	add	rdi, 24	# _488,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, _478
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_490->function, current.7_490->function
	add	rdi, 24	# _492,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	#, _476
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_494->function, current.7_494->function
	add	rdi, 24	# _496,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 36	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_915->function, current.7_915->function
	add	rdi, 24	# _917,
	jmp	.L598	#
.L537:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r12b	# getOp, getOp
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	r14d, ebx	# _534, arg
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	sar	ebx, 8	# _536,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	r14d, 16	# _534,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_542->function, pretmp_542->function
	add	rdi, 24	# _564,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _960
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_544->function, current.7_544->function
	add	rdi, 24	# _546,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, _536
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_548->function, current.7_548->function
	add	rdi, 24	# _550,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	#, _534
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_552->function, current.7_552->function
	add	rdi, 24	# _554,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 37	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_929->function, current.7_929->function
	add	rdi, 24	# _931,
	jmp	.L598	#
.L525:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r12b	# getOp, getOp
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	r14d, ebx	# _360, arg
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	sar	ebx, 8	# _362,
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	r14d, 16	# _360,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_338->function, pretmp_338->function
	add	rdi, 24	# _718,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _960
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_370->function, current.7_370->function
	add	rdi, 24	# _372,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, _362
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_374->function, current.7_374->function
	add	rdi, 24	# _376,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	#, _360
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_378->function, current.7_378->function
	add	rdi, 24	# _380,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 34	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_856->function, current.7_856->function
	add	rdi, 24	# _860,
	jmp	.L598	#
.L529:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	mov	r14d, ebx	# _420, arg
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	mov	ebp, ebx	# _418, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:579:             (uint8_t) ((arg >> 8)  & 0xff),
	sar	r14d, 8	# _420,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, r12b	# getOp, getOp
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebp, 16	# _418,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	ebp, bpl	# _419, _418
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_383->function, pretmp_383->function
	add	rdi, 24	# _78,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_428->function, current.7_428->function
	add	rdi, 24	# _430,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	#, _420
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_432->function, current.7_432->function
	add	rdi, 24	# _434,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _419
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_436->function, current.7_436->function
	add	rdi, 24	# _438,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 35	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_724->function, current.7_724->function
	add	rdi, 24	# _709,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r13b	# setOp, setOp
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_453->function, current.7_453->function
	add	rdi, 24	# _455,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	#, arg
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_457->function, current.7_457->function
	add	rdi, 24	# _459,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	#, _420
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_461->function, current.7_461->function
	add	rdi, 24	# _463,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rax, QWORD PTR 40[rsp]	# tmp1539, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1539, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, ebp	#, _419
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_465->function, current.7_465->function
	add	rdi, 24	# _467,
	jmp	.L592	#
.L612:
# src/compiler.c:657:     if ((getOp == OP_GET_GLOBAL || getOp == OP_GET_GLOBAL_LONG) && !canAssign) {
	cmp	BYTE PTR 15[rsp], 0	# %sfp,
	je	.L560	#,
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# pretmp_919, parser.current.type
# src/compiler.c:671:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 26	# pretmp_919,
	je	.L614	#,
	cmp	eax, 27	# pretmp_919,
	jne	.L615	#,
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:611:             *getOp = OP_GET_GLOBAL_LONG;
	mov	ebp, 11	# getOp,
# src/compiler.c:612:             *setOp = OP_SET_GLOBAL_LONG;
	mov	r12d, 15	# setOp,
	jmp	.L516	#
.L561:
# src/compiler.c:607:             *getOp = OP_GET_GLOBAL;
	mov	ebp, 10	# getOp,
# src/compiler.c:608:             *setOp = OP_SET_GLOBAL;
	mov	r12d, 14	# setOp,
.L503:
# src/compiler.c:658:         ObjString* nameStr = copyString(name.start, name.length);
	mov	esi, DWORD PTR 128[rsp]	#, name.length
	mov	rdi, QWORD PTR 120[rsp]	#, name.start
	call	"copyString"@PLT	#
# src/compiler.c:660:         if (tableGet(&compileTimeConsts, nameStr, &constVal)) {
	lea	rdx, 16[rsp]	#,
	lea	rdi, "compileTimeConsts"[rip]	#,
	mov	rsi, rax	#, nameStr
	call	"tableGet"@PLT	#
# src/compiler.c:660:         if (tableGet(&compileTimeConsts, nameStr, &constVal)) {
	test	al, al	# _5
	jne	.L616	#,
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# _17, parser.current.type
# src/compiler.c:671:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 26	# _17,
	je	.L510	#,
	cmp	eax, 27	# _17,
	je	.L617	#,
# src/compiler.c:562:     if (longOp) {
	cmp	BYTE PTR 15[rsp], 0	# %sfp,
	jne	.L550	#,
	jmp	.L545	#
	.p2align 4,,10
	.p2align 3
.L510:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:562:     if (longOp) {
	cmp	BYTE PTR 15[rsp], 0	# %sfp,
	jne	.L505	#,
	jmp	.L507	#
.L617:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:562:     if (longOp) {
	cmp	BYTE PTR 15[rsp], 0	# %sfp,
	jne	.L516	#,
	jmp	.L514	#
.L616:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	rsi, QWORD PTR 16[rsp]	#, MEM[(long unsigned int *)_991]
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _55, current.7_54->function
# src/compiler.c:661:             lastExpr.chunkSizeBefore  = currentChunk()->count;
	movq	xmm1, QWORD PTR 24[rax]	# MEM <vector(2) int> [(int *)_55 + 24B], MEM <vector(2) int> [(int *)_55 + 24B]
	movq	xmm0, QWORD PTR 56[rax]	# MEM <vector(2) int> [(int *)_55 + 56B], MEM <vector(2) int> [(int *)_55 + 56B]
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	lea	rdi, 24[rax]	# vectp.435_735,
# src/compiler.c:661:             lastExpr.chunkSizeBefore  = currentChunk()->count;
	pblendw	xmm0, xmm1, 3	# tmp747, MEM <vector(2) int> [(int *)_55 + 24B],
# src/compiler.c:661:             lastExpr.chunkSizeBefore  = currentChunk()->count;
	movq	QWORD PTR "lastExpr"[rip+16], xmm0	# MEM <vector(2) int> [(int *)&lastExpr + 16B], tmp747
# src/compiler.c:224:     writeConstant(currentChunk(), value, parser.previous.line);
	call	"writeConstant"@PLT	#
# src/compiler.c:665:             lastExpr.value   = constVal;
	mov	rax, QWORD PTR 16[rsp]	# MEM[(long unsigned int *)_991], MEM[(long unsigned int *)_991]
# src/compiler.c:664:             lastExpr.isConst = true;
	mov	BYTE PTR "lastExpr"[rip], 1	# lastExpr.isConst,
# src/compiler.c:665:             lastExpr.value   = constVal;
	mov	QWORD PTR "lastExpr"[rip+8], rax	# lastExpr.value, MEM[(long unsigned int *)_991]
# src/compiler.c:725: }
	mov	rax, QWORD PTR 40[rsp]	# tmp1530, D.9029
	sub	rax, QWORD PTR fs:40	# tmp1530, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L593	#,
	mov	rbx, QWORD PTR 56[rsp]	#,
	mov	rbp, QWORD PTR 64[rsp]	#,
	mov	r12, QWORD PTR 72[rsp]	#,
	mov	r13, QWORD PTR 80[rsp]	#,
	mov	r14, QWORD PTR 88[rsp]	#,
	add	rsp, 104	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L560:
	.cfi_restore_state
# src/compiler.c:613:             *longOp = true;
	mov	BYTE PTR 15[rsp], 1	# %sfp,
# src/compiler.c:611:             *getOp = OP_GET_GLOBAL_LONG;
	mov	ebp, 11	# getOp,
# src/compiler.c:612:             *setOp = OP_SET_GLOBAL_LONG;
	mov	r12d, 15	# setOp,
	jmp	.L503	#
.L614:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:611:             *getOp = OP_GET_GLOBAL_LONG;
	mov	ebp, 11	# getOp,
# src/compiler.c:612:             *setOp = OP_SET_GLOBAL_LONG;
	mov	r12d, 15	# setOp,
	jmp	.L505	#
.L613:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:607:             *getOp = OP_GET_GLOBAL;
	mov	ebp, 10	# getOp,
# src/compiler.c:608:             *setOp = OP_SET_GLOBAL;
	mov	r12d, 14	# setOp,
	jmp	.L507	#
.L615:
# src/compiler.c:612:             *setOp = OP_SET_GLOBAL_LONG;
	mov	r13d, 15	# setOp,
# src/compiler.c:611:             *getOp = OP_GET_GLOBAL_LONG;
	mov	r12d, 11	# getOp,
	jmp	.L549	#
.L604:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:601:         *getOp = OP_GET_UPVALUE;
	mov	ebp, 26	# getOp,
# src/compiler.c:602:         *setOp = OP_SET_UPVALUE;
	mov	r12d, 27	# setOp,
	jmp	.L514	#
	.cfi_endproc
.LFE63:
	.size	"namedVariable", .-"namedVariable"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Cannot use 'super' outside a class."
	.align 8
.LC30:
	.string	"Cannot use 'super' in a class with no superclass."
	.section	.rodata.str1.1
.LC31:
	.string	"Expect '.' after 'super'."
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"Expect superclass method name."
	.section	.rodata.str1.1
.LC33:
	.string	"this"
.LC34:
	.string	"super"
	.text
	.p2align 4
	.type	"super_", @function
"super_":
.LFB66:
	.cfi_startproc
	sub	rsp, 120	#,
	.cfi_def_cfa_offset 128
# src/compiler.c:739:     if (currentClass == NULL) {
	mov	rax, QWORD PTR "currentClass"[rip]	# currentClass.5_1, currentClass
# src/compiler.c:738: static void super_(bool canAssign) {
	mov	QWORD PTR 104[rsp], rbx	#,
# src/compiler.c:739:     if (currentClass == NULL) {
	test	rax, rax	# currentClass.5_1
	.cfi_offset 3, -24
	je	.L640	#,
# src/compiler.c:741:     } else if (!currentClass->hasSuperclass) {
	cmp	BYTE PTR 8[rax], 0	# currentClass.5_1->hasSuperclass,
	je	.L641	#,
.L620:
# src/compiler.c:745:     consume(TOKEN_DOT, "Expect '.' after 'super'.");
	lea	rsi, .LC31[rip]	#,
	mov	edi, 8	#,
	call	"consume"	#
# src/compiler.c:746:     consume(TOKEN_IDENTIFIER, "Expect superclass method name.");
	lea	rsi, .LC32[rip]	#,
	mov	edi, 37	#,
	call	"consume"	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR "parser"[rip+40]	#, MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR "parser"[rip+32]	#, MEM[(const char * *)&parser + 32B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp228,
	or	rax, rdx	# _71, tmp228
	mov	rsi, rax	# _73, _71
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_74->function, current.7_74->function
	add	rdi, 24	# _76,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
# src/compiler.c:735:     return token;
	mov	DWORD PTR [rsp], 0	# MEM <unsigned int> [(struct  *)&D.7154],
# src/compiler.c:750:     namedVariable(syntheticToken("this"), false);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 160
	xor	edi, edi	#
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	mov	ebx, eax	# _77,
# src/compiler.c:735:     return token;
	lea	rax, .LC33[rip]	# tmp315,
	mov	DWORD PTR 48[rsp], 4	# D.7154.length,
	mov	QWORD PTR 40[rsp], rax	# D.7154.start, tmp315
	mov	DWORD PTR 52[rsp], 0	# MEM <int> [(struct  *)&D.7154 + 20B],
# src/compiler.c:750:     namedVariable(syntheticToken("this"), false);
	mov	rax, QWORD PTR 48[rsp]	# D.7154, D.7154
	movdqa	xmm0, XMMWORD PTR 32[rsp]	# D.7154, D.7154
	mov	QWORD PTR 16[rsp], rax	#, D.7154
	movups	XMMWORD PTR [rsp], xmm0	#, D.7154
	call	"namedVariable"	#
# src/compiler.c:174:     if (!check(type)) return false;
	mov	eax, DWORD PTR "parser"[rip]	#, parser.current.type
	add	rsp, 32	#,
	.cfi_def_cfa_offset 128
	test	eax, eax	#
	je	.L625	#,
# src/compiler.c:735:     return token;
	lea	rax, .LC34[rip]	# tmp316,
# src/compiler.c:761:         namedVariable(syntheticToken("super"), false);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 160
	xor	edi, edi	#
# src/compiler.c:735:     return token;
	mov	DWORD PTR 96[rsp], 0	# MEM <unsigned int> [(struct  *)&D.7162],
	mov	QWORD PTR 104[rsp], rax	# D.7162.start, tmp316
	mov	DWORD PTR 112[rsp], 5	# D.7162.length,
	mov	DWORD PTR 116[rsp], 0	# MEM <int> [(struct  *)&D.7162 + 20B],
# src/compiler.c:761:         namedVariable(syntheticToken("super"), false);
	mov	rax, QWORD PTR 112[rsp]	# D.7162, D.7162
	movdqa	xmm0, XMMWORD PTR 96[rsp]	# D.7162, D.7162
	mov	QWORD PTR 16[rsp], rax	#, D.7162
	movups	XMMWORD PTR [rsp], xmm0	#, D.7162
	call	"namedVariable"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_49, parser.previous.line
# src/compiler.c:763:         if (name < 256) {
	add	rsp, 32	#,
	.cfi_def_cfa_offset 128
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_43->function, pretmp_43->function
	add	rdi, 24	# _9,
# src/compiler.c:763:         if (name < 256) {
	cmp	ebx, 255	# _77,
	jle	.L626	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 23	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _168, _77
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_125->function, current.7_125->function
	add	rdi, 24	# _127,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _117, _77
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebx, 16	# _115,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_129->function, current.7_129->function
	add	rdi, 24	# _131,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L639:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _115, _115
# src/compiler.c:769: }
	mov	rbx, QWORD PTR 104[rsp]	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_133->function,
# src/compiler.c:769: }
	add	rsp, 120	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _135,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L641:
	.cfi_restore_state
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L620	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _63, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _63,
	je	.L642	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _63,
	je	.L624	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L624:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC30[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L620	#
	.p2align 4,,10
	.p2align 3
.L626:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 22	#,
	call	"writeChunk"@PLT	#
	jmp	.L639	#
	.p2align 4,,10
	.p2align 3
.L625:
	mov	QWORD PTR 112[rsp], r14	#,
	.cfi_offset 14, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:752:         uint8_t argCount = argumentList();
	call	"argumentList"	#
# src/compiler.c:735:     return token;
	mov	DWORD PTR 32[rsp], 0	# MEM <unsigned int> [(struct  *)&D.7157],
# src/compiler.c:753:         namedVariable(syntheticToken("super"), false);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 160
	xor	edi, edi	#
# src/compiler.c:752:         uint8_t argCount = argumentList();
	mov	r14d, eax	# argCount,
# src/compiler.c:735:     return token;
	lea	rax, .LC34[rip]	# tmp317,
	mov	DWORD PTR 80[rsp], 5	# D.7157.length,
	mov	QWORD PTR 72[rsp], rax	# D.7157.start, tmp317
	mov	DWORD PTR 84[rsp], 0	# MEM <int> [(struct  *)&D.7157 + 20B],
# src/compiler.c:753:         namedVariable(syntheticToken("super"), false);
	mov	rax, QWORD PTR 80[rsp]	# D.7157, D.7157
	movdqa	xmm0, XMMWORD PTR 64[rsp]	# D.7157, D.7157
	mov	QWORD PTR 16[rsp], rax	#, D.7157
	movups	XMMWORD PTR [rsp], xmm0	#, D.7157
	call	"namedVariable"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_31, parser.previous.line
# src/compiler.c:754:         if (name < 256) {
	add	rsp, 32	#,
	.cfi_def_cfa_offset 128
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_165->function, pretmp_165->function
	add	rdi, 24	# _167,
# src/compiler.c:754:         if (name < 256) {
	cmp	ebx, 255	# _77,
	jle	.L643	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 56	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _168, _77
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_96->function, current.7_96->function
	add	rdi, 24	# _98,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _88, _77
# src/compiler.c:580:             (uint8_t) ((arg >> 16) & 0xff)
	sar	ebx, 16	# _86,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_100->function, current.7_100->function
	add	rdi, 24	# _102,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L638:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _86, _86
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_104->function,
	add	rdi, 24	# _106,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	# argCount, argCount
# src/compiler.c:769: }
	mov	rbx, QWORD PTR 104[rsp]	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	r14, QWORD PTR 112[rsp]	#,
	.cfi_restore 14
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_25->function, current.7_25->function
# src/compiler.c:769: }
	add	rsp, 120	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _27,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L640:
	.cfi_def_cfa_offset 128
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L620	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _55, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _55,
	je	.L644	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _55,
	je	.L622	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L622:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC29[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L620	#
	.p2align 4,,10
	.p2align 3
.L643:
	.cfi_offset 14, -16
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 55	#,
	call	"writeChunk"@PLT	#
	jmp	.L638	#
	.p2align 4,,10
	.p2align 3
.L642:
	.cfi_restore 14
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L624	#
	.p2align 4,,10
	.p2align 3
.L644:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L622	#
	.cfi_endproc
.LFE66:
	.size	"super_", .-"super_"
	.p2align 4
	.type	"variable", @function
"variable":
.LFB64:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
# src/compiler.c:728:     namedVariable(parser.previous, canAssign);
	mov	rax, QWORD PTR "parser"[rip+40]	# parser.previous, parser.previous
	movdqu	xmm0, XMMWORD PTR "parser"[rip+24]	# parser.previous, parser.previous
	movzx	edi, dil	# canAssign, canAssign
	mov	QWORD PTR 16[rsp], rax	#, parser.previous
	movups	XMMWORD PTR [rsp], xmm0	#, parser.previous
	call	"namedVariable"	#
# src/compiler.c:729: }
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE64:
	.size	"variable", .-"variable"
	.section	.rodata.str1.8
	.align 8
.LC35:
	.string	"Cannot use 'this' outside a class."
	.text
	.p2align 4
	.type	"this_", @function
"this_":
.LFB67:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/compiler.c:772:     if (currentClass == NULL) {
	cmp	QWORD PTR "currentClass"[rip], 0	# currentClass,
	je	.L656	#,
# src/compiler.c:728:     namedVariable(parser.previous, canAssign);
	mov	rax, QWORD PTR "parser"[rip+40]	# parser.previous, parser.previous
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 48
	movdqu	xmm0, XMMWORD PTR "parser"[rip+24]	# parser.previous, parser.previous
	xor	edi, edi	#
	mov	QWORD PTR 16[rsp], rax	#, parser.previous
	movups	XMMWORD PTR [rsp], xmm0	#, parser.previous
	call	"namedVariable"	#
	add	rsp, 32	#,
	.cfi_def_cfa_offset 16
.L647:
# src/compiler.c:778: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L656:
	.cfi_restore_state
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L647	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _10, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _10,
	je	.L657	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _10,
	je	.L651	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L651:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC35[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:778: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L657:
	.cfi_restore_state
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L651	#
	.cfi_endproc
.LFE67:
	.size	"this_", .-"this_"
	.section	.rodata.str1.1
.LC36:
	.string	"Expect class name."
.LC37:
	.string	"Expect superclass name."
	.section	.rodata.str1.8
	.align 8
.LC38:
	.string	"A class cannot inherit from itself."
	.section	.rodata.str1.1
.LC39:
	.string	"Expect '{' before class body."
.LC40:
	.string	"Expect method name."
.LC41:
	.string	"Expect '}' after class body."
.LC42:
	.string	"Expect function name."
.LC43:
	.string	"Constants must be top-level."
	.section	.rodata.str1.8
	.align 8
.LC44:
	.string	"Constants must be defined at declaration."
	.align 8
.LC45:
	.string	"Expect ';' after constant declaration."
	.text
	.p2align 4
	.type	"declaration", @function
"declaration":
.LFB103:
	.cfi_startproc
	sub	rsp, 152	#,
	.cfi_def_cfa_offset 160
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# _11, parser.current.type
# src/compiler.c:1591: static void declaration() {
	mov	QWORD PTR 104[rsp], rbx	#,
	.cfi_offset 3, -56
# src/compiler.c:170:     return parser.current.type == type;
	mov	rbx, QWORD PTR fs:40	# tmp711, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 88[rsp], rbx	# D.9176, tmp711
	lea	rbx, "parser"[rip]	# tmp711,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 44	# _11,
	je	.L659	#,
	cmp	eax, 52	# _11,
	je	.L742	#,
	cmp	eax, 47	# _11,
	je	.L743	#,
	cmp	eax, 45	# _11,
	je	.L744	#,
# src/compiler.c:1601:         statement();
	call	"statement"	#
.L680:
# src/compiler.c:1604:     if (parser.panicMode) synchronize();
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L745	#,
.L658:
# src/compiler.c:1605: }
	mov	rax, QWORD PTR 88[rsp]	# tmp726, D.9176
	sub	rax, QWORD PTR fs:40	# tmp726, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L746	#,
	mov	rbx, QWORD PTR 104[rsp]	#,
	add	rsp, 152	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L742:
	.cfi_restore_state
	mov	QWORD PTR 112[rsp], rbp	#,
	.cfi_offset 6, -48
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	xor	ebp, ebp	# _52
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1009:     consume(TOKEN_IDENTIFIER, errorMessage);
	lea	rsi, .LC42[rip]	#,
	mov	edi, 37	#,
	call	"consume"	#
# src/compiler.c:1011:     declareVariable();
	call	"declareVariable"	#
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	mov	rdx, QWORD PTR "current"[rip]	# current.73_157, current
	mov	ecx, DWORD PTR 524828[rdx]	# _144, current.80_195->scopeDepth
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	test	ecx, ecx	# _144
	jle	.L747	#,
.L681:
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	eax, DWORD PTR 524312[rdx]	# tmp744, current.73_157->localCount
	sub	eax, 1	# _194,
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	cdqe
	sal	rax, 5	# tmp581,
	mov	DWORD PTR 48[rax+rdx], ecx	# current.73_157->locals[_194].depth, _144
.L682:
# src/compiler.c:1216:     function(TYPE_FUNCTION);
	xor	edi, edi	#
	call	"function"	#
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR "current"[rip]	# current.72_212, current
	mov	ecx, DWORD PTR 524828[rax]	# _213, current.72_212->scopeDepth
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	test	ecx, ecx	# _213
	jg	.L748	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.72_212->function, current.72_212->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_462, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _464,
# src/compiler.c:1029:     if (global <= UINT8_MAX) {
	cmp	ebp, 255	# _52,
	jg	.L684	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 12	#,
	call	"writeChunk"@PLT	#
.L741:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# _225, _225
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_243->function,
	add	rdi, 24	# _245,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1604:     if (parser.panicMode) synchronize();
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	mov	rbp, QWORD PTR 112[rsp]	#,
	.cfi_restore 6
	je	.L658	#,
	.p2align 4
	.p2align 3
.L745:
# src/compiler.c:1568:     while (parser.current.type != TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip]	# _312, parser.current.type
# src/compiler.c:1566:     parser.panicMode = false;
	mov	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
# src/compiler.c:1568:     while (parser.current.type != TOKEN_EOF) {
	cmp	eax, 65	# _312,
	je	.L658	#,
	mov	QWORD PTR 112[rsp], rbp	#,
	.cfi_offset 6, -48
# src/compiler.c:1570:         switch(parser.current.type) {
	mov	ebp, 799627	# tmp715,
	jmp	.L695	#
	.p2align 4,,10
	.p2align 3
.L749:
	sub	eax, 44	# _154,
	cmp	eax, 19	# _154,
	ja	.L694	#,
	bt	rbp, rax	# tmp715, _154
	jc	.L735	#,
.L694:
# src/compiler.c:1587:         advance();
	call	"advance"	#
# src/compiler.c:1568:     while (parser.current.type != TOKEN_EOF) {
	mov	eax, DWORD PTR [rbx]	# _312, parser.current.type
# src/compiler.c:1568:     while (parser.current.type != TOKEN_EOF) {
	cmp	eax, 65	# _312,
	je	.L735	#,
.L695:
# src/compiler.c:1569:         if (parser.previous.type == TOKEN_SEMICOLON) return;
	cmp	DWORD PTR 24[rbx], 12	# parser.previous.type,
	jne	.L749	#,
.L735:
	mov	rbp, QWORD PTR 112[rsp]	#,
	.cfi_restore 6
	jmp	.L658	#
	.p2align 4,,10
	.p2align 3
.L659:
	mov	QWORD PTR 112[rsp], rbp	#,
	.cfi_offset 6, -48
# src/compiler.c:1158:     Token className = parser.previous;
	lea	rbp, 24[rbx]	# tmp713,
	mov	QWORD PTR 120[rsp], r12	#,
	mov	QWORD PTR 128[rsp], r13	#,
	.cfi_offset 12, -40
	.cfi_offset 13, -32
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1157:     consume(TOKEN_IDENTIFIER, "Expect class name.");
	lea	rsi, .LC36[rip]	#,
	mov	edi, 37	#,
	call	"consume"	#
# src/compiler.c:1158:     Token className = parser.previous;
	mov	rax, QWORD PTR 16[rbp]	# parser.previous, parser.previous
	movdqu	xmm0, XMMWORD PTR "parser"[rip+24]	# parser.previous, parser.previous
	mov	rdi, QWORD PTR "parser"[rip+32]	# className$start, parser.previous.start
	mov	QWORD PTR 48[rsp], rax	# className, parser.previous
	mov	eax, DWORD PTR "parser"[rip+40]	# className$length, parser.previous.length
	movaps	XMMWORD PTR 32[rsp], xmm0	# className, parser.previous
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, eax	#, className$length
# src/compiler.c:1158:     Token className = parser.previous;
	mov	QWORD PTR 8[rsp], rdi	# %sfp, className$start
	mov	r13d, eax	# className$length, className$length
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp364,
	or	rax, rdx	# _53, tmp364
	mov	rsi, rax	# _55, _53
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_56->function, current.7_56->function
	add	rdi, 24	# _58,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
	mov	r12d, eax	# _59,
# src/compiler.c:1160:     declareVariable();
	call	"declareVariable"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_473, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_474->function, pretmp_474->function
	add	rdi, 24	# _476,
# src/compiler.c:1162:     if (nameConstant < 256) {
	cmp	r12d, 255	# _59,
	jle	.L750	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 64	#,
	mov	QWORD PTR 136[rsp], r14	#,
	.cfi_offset 14, -24
# src/compiler.c:1168:             (uint8_t) ((nameConstant >> 16) & 0xff)
	mov	r14d, r12d	# _20, _59
	mov	QWORD PTR 144[rsp], r15	#,
	.cfi_offset 15, -16
# src/compiler.c:1167:             (uint8_t) ((nameConstant >> 8) & 0xff),
	mov	r15d, r12d	# _22, _59
# src/compiler.c:1168:             (uint8_t) ((nameConstant >> 16) & 0xff)
	sar	r14d, 16	# _20,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	# _472, _59
	mov	r12d, esi	# _472, _472
# src/compiler.c:1167:             (uint8_t) ((nameConstant >> 8) & 0xff),
	sar	r15d, 8	# _22,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_73->function, current.7_73->function
	add	rdi, 24	# _75,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r15b	# _23, _22
	mov	r15d, esi	# _23, _23
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_77->function, current.7_77->function
	add	rdi, 24	# _79,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r14b	# _21, _20
	mov	r14d, esi	# _21, _21
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_81->function, current.7_81->function
	add	rdi, 24	# _83,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR "current"[rip]	# current.72_132, current
	mov	ecx, DWORD PTR 524828[rax]	# _231, current.72_132->scopeDepth
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	test	ecx, ecx	# _231
	jg	.L751	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.72_132->function, current.72_132->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 13	#,
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _105,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, r12d	#, _472
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_107->function, current.7_107->function
	add	rdi, 24	# _109,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, r15d	#, _23
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_111->function, current.7_111->function
	add	rdi, 24	# _113,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, r14d	#, _21
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_115->function, current.7_115->function
	add	rdi, 24	# _117,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	r14, QWORD PTR 136[rsp]	#,
	.cfi_restore 14
	mov	r15, QWORD PTR 144[rsp]	#,
	.cfi_restore 15
.L666:
# src/compiler.c:1175:     classCompiler.enclosing = currentClass;
	mov	rax, QWORD PTR "currentClass"[rip]	# currentClass, currentClass
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR "parser"[rip], 7	# parser.current.type,
# src/compiler.c:1174:     classCompiler.hasSuperclass = false;
	mov	BYTE PTR 24[rsp], 0	# classCompiler.hasSuperclass,
# src/compiler.c:1175:     classCompiler.enclosing = currentClass;
	mov	QWORD PTR 16[rsp], rax	# classCompiler.enclosing, currentClass
# src/compiler.c:1176:     currentClass = &classCompiler;
	lea	rax, 16[rsp]	# tmp437,
	mov	QWORD PTR "currentClass"[rip], rax	# currentClass, tmp437
# src/compiler.c:174:     if (!check(type)) return false;
	je	.L752	#,
.L667:
# src/compiler.c:1195:     namedVariable(className, false);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 192
	xor	edi, edi	#
	mov	rax, QWORD PTR 80[rsp]	# className, className
	movdqa	xmm0, XMMWORD PTR 64[rsp]	# className, className
	mov	QWORD PTR 16[rsp], rax	#, className
	movups	XMMWORD PTR [rsp], xmm0	#, className
	call	"namedVariable"	#
# src/compiler.c:1196:     consume(TOKEN_LEFT_BRACE, "Expect '{' before class body.");
	add	rsp, 32	#,
	.cfi_def_cfa_offset 160
	mov	edi, 4	#,
	lea	rsi, .LC39[rip]	#,
	call	"consume"	#
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# _378, parser.current.type
# src/compiler.c:1198:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 5	# _378,
	je	.L673	#,
	cmp	eax, 65	# _378,
	je	.L673	#,
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	r12, -1125899906842624	# tmp513,
	jmp	.L678	#
	.p2align 4,,10
	.p2align 3
.L753:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 66	#,
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
.L739:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bpl	# _150, _150
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_187->function,
	add	rdi, 24	# _189,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR [rbx]	# _61, parser.current.type
# src/compiler.c:1198:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 5	# _61,
	je	.L673	#,
	cmp	eax, 65	# _61,
	je	.L673	#,
.L678:
# src/compiler.c:1135:     consume(TOKEN_IDENTIFIER, "Expect method name.");
	lea	rsi, .LC40[rip]	#,
	mov	edi, 37	#,
	call	"consume"	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR 40[rbx]	# MEM[(int *)&parser + 40B], MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR 32[rbx]	# MEM[(const char * *)&parser + 32B], MEM[(const char * *)&parser + 32B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	or	rax, r12	# _159, tmp513
	mov	rsi, rax	# _161, _159
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_162->function, current.7_162->function
	add	rdi, 24	# _164,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
# src/compiler.c:1138:     FunctionType type = TYPE_METHOD;
	mov	edi, 2	# type,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	mov	ebp, eax	# _165,
# src/compiler.c:1139:     if (parser.previous.length == 4 && memcmp(parser.previous.start, "init", 4) == 0) {
	cmp	DWORD PTR 40[rbx], 4	# parser.previous.length,
	jne	.L674	#,
# src/compiler.c:1139:     if (parser.previous.length == 4 && memcmp(parser.previous.start, "init", 4) == 0) {
	mov	rax, QWORD PTR 32[rbx]	# parser.previous.start, parser.previous.start
# src/compiler.c:1138:     FunctionType type = TYPE_METHOD;
	xor	edi, edi	# type
	cmp	DWORD PTR [rax], 1953066601	# MEM <unsigned int> [(char * {ref-all})_146],
	setne	dil	#, type
	add	edi, 1	# type,
.L674:
# src/compiler.c:1143:     function(type);
	call	"function"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# pretmp_466, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_467->function, pretmp_467->function
	add	rdi, 24	# _469,
# src/compiler.c:1145:     if (constant <= 255) {
	cmp	ebp, 255	# _165,
	jle	.L753	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 67	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
	movzx	esi, bpl	# _465, _165
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_179->function, current.7_179->function
	add	rdi, 24	# _181,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	eax, ebp	# _165, _165
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
# src/compiler.c:1151:             (uint8_t) ((constant >> 16) & 0xff)
	sar	ebp, 16	# _150,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, ah	# _152, _165
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_183->function, current.7_183->function
	add	rdi, 24	# _185,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
	jmp	.L739	#
	.p2align 4,,10
	.p2align 3
.L750:
	mov	esi, 63	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _59
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_65->function, current.7_65->function
	add	rdi, 24	# _67,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR "current"[rip]	# current.72_132, current
	mov	ecx, DWORD PTR 524828[rax]	# _231, current.72_50->scopeDepth
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	test	ecx, ecx	# _231
	jg	.L663	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.72_50->function, current.72_50->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 12	#,
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _92,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	#, _59
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_94->function, current.7_94->function
	add	rdi, 24	# _96,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L666	#
	.p2align 4,,10
	.p2align 3
.L747:
	.cfi_restore 12
	.cfi_restore 13
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR "parser"[rip+40]	#, MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR "parser"[rip+32]	#, MEM[(const char * *)&parser + 32B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp573,
	or	rax, rdx	# _205, tmp573
	mov	rsi, rax	# _207, _205
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_208->function, current.7_208->function
	add	rdi, 24	# _210,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
# src/compiler.c:1018:     if (current->scopeDepth == 0) return;
	mov	rdx, QWORD PTR "current"[rip]	# current.73_157, current
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	mov	ebp, eax	# _52, _52
# src/compiler.c:1018:     if (current->scopeDepth == 0) return;
	mov	ecx, DWORD PTR 524828[rdx]	# _144, current.73_191->scopeDepth
# src/compiler.c:1018:     if (current->scopeDepth == 0) return;
	test	ecx, ecx	# _144
	je	.L682	#,
	jmp	.L681	#
	.p2align 4,,10
	.p2align 3
.L673:
	.cfi_offset 12, -40
	.cfi_offset 13, -32
# src/compiler.c:1202:     consume(TOKEN_RIGHT_BRACE, "Expect '}' after class body.");
	lea	rsi, .LC41[rip]	#,
	mov	edi, 5	#,
	call	"consume"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_43->function, current.7_43->function
	add	rdi, 24	# _45,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1205:     if (classCompiler.hasSuperclass) {
	cmp	BYTE PTR 24[rsp], 0	# classCompiler.hasSuperclass,
	jne	.L754	#,
.L679:
# src/compiler.c:1209:     currentClass = currentClass->enclosing;
	mov	rax, QWORD PTR "currentClass"[rip]	# currentClass, currentClass
	mov	rbp, QWORD PTR 112[rsp]	#,
	.cfi_restore 6
	mov	r12, QWORD PTR 120[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 128[rsp]	#,
	.cfi_restore 13
# src/compiler.c:1209:     currentClass = currentClass->enclosing;
	mov	rax, QWORD PTR [rax]	# currentClass.63_47->enclosing, currentClass.63_47->enclosing
	mov	QWORD PTR "currentClass"[rip], rax	# currentClass, currentClass.63_47->enclosing
	jmp	.L680	#
	.p2align 4,,10
	.p2align 3
.L743:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1597:         varDeclaration();
	call	"varDeclaration"	#
	jmp	.L680	#
	.p2align 4,,10
	.p2align 3
.L751:
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	mov	r14, QWORD PTR 136[rsp]	#,
	.cfi_restore 14
	mov	r15, QWORD PTR 144[rsp]	#,
	.cfi_restore 15
.L663:
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	edx, DWORD PTR 524312[rax]	# tmp736, current.72_418->localCount
	sub	edx, 1	# _87,
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	movsxd	rdx, edx	# _87, _87
	sal	rdx, 5	# tmp401,
	mov	DWORD PTR 48[rdx+rax], ecx	# current.72_418->locals[_87].depth, _231
# src/compiler.c:1026:         return;
	jmp	.L666	#
	.p2align 4,,10
	.p2align 3
.L754:
# src/compiler.c:1206:         endScope();
	call	"endScope"	#
	jmp	.L679	#
	.p2align 4,,10
	.p2align 3
.L752:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1179:         consume(TOKEN_IDENTIFIER, "Expect superclass name.");
	lea	rsi, .LC37[rip]	#,
	mov	edi, 37	#,
	call	"consume"	#
# src/compiler.c:728:     namedVariable(parser.previous, canAssign);
	movdqu	xmm0, XMMWORD PTR "parser"[rip+24]	# parser.previous, parser.previous
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 192
	xor	edi, edi	#
	movups	XMMWORD PTR [rsp], xmm0	#, parser.previous
	mov	rax, QWORD PTR 16[rbp]	# parser.previous, parser.previous
	mov	QWORD PTR 16[rsp], rax	#, parser.previous
	call	"namedVariable"	#
# src/compiler.c:916:     if (a->length != b->length) return false;
	add	rsp, 32	#,
	.cfi_def_cfa_offset 160
	cmp	r13d, DWORD PTR "parser"[rip+40]	# className$length, MEM[(struct Token *)&parser + 24B].length
	jne	.L668	#,
# src/compiler.c:917:     return memcmp(a->start, b->start, a->length) == 0;
	mov	rsi, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	rdi, QWORD PTR 8[rsp]	#, %sfp
	movsxd	rdx, r13d	# _28, className$length
	call	"memcmp"@PLT	#
# src/compiler.c:1182:         if (identifiersEqual(&className, &parser.previous)) {
	test	eax, eax	# tmp718
	jne	.L668	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L668	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _120, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _120,
	je	.L755	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _120,
	je	.L670	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L670:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC38[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	.p2align 4
	.p2align 3
.L668:
# src/compiler.c:288:     current->scopeDepth++;
	mov	rax, QWORD PTR "current"[rip]	# current.68_32, current
# src/compiler.c:735:     return token;
	mov	DWORD PTR 64[rsp], 0	# MEM <unsigned int> [(struct  *)&D.9086],
# src/compiler.c:1187:         addLocal(syntheticToken("super"));
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 192
# src/compiler.c:735:     return token;
	mov	DWORD PTR 112[rsp], 5	# D.9086.length,
# src/compiler.c:288:     current->scopeDepth++;
	add	DWORD PTR 524828[rax], 1	# current.68_32->scopeDepth,
# src/compiler.c:735:     return token;
	lea	rax, .LC34[rip]	# tmp739,
	mov	QWORD PTR 104[rsp], rax	# D.9086.start, tmp739
	mov	DWORD PTR 116[rsp], 0	# MEM <int> [(struct  *)&D.9086 + 20B],
# src/compiler.c:1187:         addLocal(syntheticToken("super"));
	mov	rax, QWORD PTR 112[rsp]	# D.9086, D.9086
	movdqa	xmm0, XMMWORD PTR 96[rsp]	# D.9086, D.9086
	mov	QWORD PTR 16[rsp], rax	#, D.9086
	movups	XMMWORD PTR [rsp], xmm0	#, D.9086
	call	"addLocal"	#
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR "current"[rip]	# current.72_126, current
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	add	rsp, 32	#,
	.cfi_def_cfa_offset 160
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	mov	ecx, DWORD PTR 524828[rax]	# _127, current.72_126->scopeDepth
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	test	ecx, ecx	# _127
	jg	.L756	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.72_126->function, current.72_126->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 12	#,
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _134,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	xor	esi, esi	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_136->function, current.7_136->function
	add	rdi, 24	# _138,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L672:
# src/compiler.c:1190:         namedVariable(className, false);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 192
	xor	edi, edi	#
	mov	rax, QWORD PTR 80[rsp]	# className, className
	movdqa	xmm0, XMMWORD PTR 64[rsp]	# className, className
	mov	QWORD PTR 16[rsp], rax	#, className
	movups	XMMWORD PTR [rsp], xmm0	#, className
	call	"namedVariable"	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	add	rsp, 32	#,
	.cfi_def_cfa_offset 160
	mov	esi, 65	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_38->function, current.7_38->function
	add	rdi, 24	# _40,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1192:         classCompiler.hasSuperclass = true;
	mov	BYTE PTR 24[rsp], 1	# classCompiler.hasSuperclass,
	jmp	.L667	#
	.p2align 4,,10
	.p2align 3
.L744:
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	mov	QWORD PTR 112[rsp], rbp	#,
	mov	QWORD PTR 120[rsp], r12	#,
	mov	QWORD PTR 136[rsp], r14	#,
	mov	QWORD PTR 144[rsp], r15	#,
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1249:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1249:     if (current->scopeDepth > 0) {
	mov	edx, DWORD PTR 524828[rax]	#, current.89_246->scopeDepth
	test	edx, edx	#
	jle	.L687	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	je	.L757	#,
.L687:
# src/compiler.c:1009:     consume(TOKEN_IDENTIFIER, errorMessage);
	lea	rsi, .LC23[rip]	#,
	mov	edi, 37	#,
	call	"consume"	#
# src/compiler.c:1011:     declareVariable();
	call	"declareVariable"	#
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	mov	eax, DWORD PTR 524828[rax]	#, current.80_264->scopeDepth
	test	eax, eax	#
	jle	.L758	#,
# src/compiler.c:1259:     consume(TOKEN_EQUAL, "Constants must be defined at declaration.");
	lea	rsi, .LC44[rip]	#,
	mov	edi, 30	#,
# src/compiler.c:1267:     if (lastExpr.isConst) {
	xor	r12d, r12d	# prephitmp_450
# src/compiler.c:1256:     Token nameTok = parser.previous; // capture here — consume() below will overwrite previous
	mov	r15, QWORD PTR "parser"[rip+32]	# nameTok$start, parser.previous.start
	mov	r14d, DWORD PTR "parser"[rip+40]	# nameTok$length, parser.previous.length
# src/compiler.c:1259:     consume(TOKEN_EQUAL, "Constants must be defined at declaration.");
	call	"consume"	#
# src/compiler.c:1261:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1264:     consume(TOKEN_SEMICOLON, "Expect ';' after constant declaration.");
	lea	rsi, .LC45[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:1267:     if (lastExpr.isConst) {
	cmp	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
	jne	.L702	#,
.L697:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 16	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_288->function, current.7_288->function
	add	rdi, 24	# _290,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	movzx	esi, r12b	# prephitmp_450, prephitmp_450
.L740:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_308->function,
	add	rdi, 24	# _310,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	rbp, QWORD PTR 112[rsp]	#,
	.cfi_restore 6
	mov	r12, QWORD PTR 120[rsp]	#,
	.cfi_restore 12
	mov	r14, QWORD PTR 136[rsp]	#,
	.cfi_restore 14
	mov	r15, QWORD PTR 144[rsp]	#,
	.cfi_restore 15
	jmp	.L680	#
	.p2align 4,,10
	.p2align 3
.L748:
	.cfi_offset 6, -48
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	edx, DWORD PTR 524312[rax]	# tmp745, current.72_212->localCount
# src/compiler.c:1026:         return;
	mov	rbp, QWORD PTR 112[rsp]	#,
	.cfi_remember_state
	.cfi_restore 6
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	sub	edx, 1	# _215,
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	movsxd	rdx, edx	# _215, _215
	sal	rdx, 5	# tmp588,
	mov	DWORD PTR 48[rdx+rax], ecx	# current.72_212->locals[_215].depth, _213
# src/compiler.c:1026:         return;
	jmp	.L680	#
	.p2align 4,,10
	.p2align 3
.L684:
	.cfi_restore_state
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 13	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# _461, _52
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_235->function, current.7_235->function
	add	rdi, 24	# _237,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	eax, ebp	# _52, _52
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:1036:             (uint8_t) ((global >> 16) & 0xff)
	sar	ebp, 16	# _225,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, ah	# _227, _52
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_239->function, current.7_239->function
	add	rdi, 24	# _241,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L741	#
.L757:
	.cfi_offset 12, -40
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _258, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _258,
	je	.L759	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _258,
	je	.L689	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L689:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC43[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L687	#
.L702:
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	xor	ebp, ebp	# _269
.L696:
# src/compiler.c:1269:         push(lastExpr.value);
	mov	rdi, QWORD PTR "lastExpr"[rip+8]	#, lastExpr.value
	call	"push"@PLT	#
# src/compiler.c:1270:         ObjString* nameStr = copyString(nameTok.start, nameTok.length);
	mov	esi, r14d	#, nameTok$length
	mov	rdi, r15	#, nameTok$start
	call	"copyString"@PLT	#
# src/compiler.c:1271:         tableSet(&compileTimeConsts, nameStr, lastExpr.value);
	mov	rdx, QWORD PTR "lastExpr"[rip+8]	#, lastExpr.value
	lea	rdi, "compileTimeConsts"[rip]	#,
	mov	rsi, rax	#, nameStr
	call	"tableSet"@PLT	#
# src/compiler.c:1272:         pop();
	call	"pop"@PLT	#
.L691:
# src/compiler.c:1066:     if (global <= UINT8_MAX) {
	cmp	ebp, 255	# _269,
	jle	.L697	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 17	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_455->function, pretmp_455->function
	add	rdi, 24	# _457,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, r12b	# prephitmp_450, prephitmp_450
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_300->function, current.7_300->function
	add	rdi, 24	# _302,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	eax, ebp	# _269, _269
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
# src/compiler.c:1073:             (uint8_t) ((global >> 16) & 0xff)
	sar	ebp, 16	# _282,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, ah	# _284, _269
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_304->function, current.7_304->function
	add	rdi, 24	# _306,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	movzx	esi, bpl	# _282, _282
	jmp	.L740	#
	.p2align 4,,10
	.p2align 3
.L756:
	.cfi_offset 13, -32
	.cfi_restore 14
	.cfi_restore 15
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	edx, DWORD PTR 524312[rax]	# tmp740, current.72_126->localCount
	sub	edx, 1	# _129,
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	movsxd	rdx, edx	# _129, _129
	sal	rdx, 5	# tmp478,
	mov	DWORD PTR 48[rdx+rax], ecx	# current.72_126->locals[_129].depth, _127
# src/compiler.c:1026:         return;
	jmp	.L672	#
	.p2align 4,,10
	.p2align 3
.L758:
	.cfi_restore 13
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR "parser"[rip+40]	#, MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR "parser"[rip+32]	#, MEM[(const char * *)&parser + 32B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	rdx, -1125899906842624	# tmp644,
	or	rax, rdx	# _274, tmp644
	mov	rsi, rax	# _276, _274
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_277->function, current.7_277->function
	add	rdi, 24	# _279,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
# src/compiler.c:1259:     consume(TOKEN_EQUAL, "Constants must be defined at declaration.");
	lea	rsi, .LC44[rip]	#,
	mov	edi, 30	#,
# src/compiler.c:1256:     Token nameTok = parser.previous; // capture here — consume() below will overwrite previous
	mov	r15, QWORD PTR "parser"[rip+32]	# nameTok$start, parser.previous.start
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	mov	ebp, eax	# _269, _269
# src/compiler.c:1256:     Token nameTok = parser.previous; // capture here — consume() below will overwrite previous
	mov	r14d, DWORD PTR "parser"[rip+40]	# nameTok$length, parser.previous.length
# src/compiler.c:1259:     consume(TOKEN_EQUAL, "Constants must be defined at declaration.");
	call	"consume"	#
# src/compiler.c:1261:     lastExpr.isConst = false;
	mov	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
# src/compiler.c:1069:         emitDoubleWord(
	mov	r12d, ebp	# prephitmp_450, _269
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1264:     consume(TOKEN_SEMICOLON, "Expect ';' after constant declaration.");
	lea	rsi, .LC45[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:1267:     if (lastExpr.isConst) {
	cmp	BYTE PTR "lastExpr"[rip], 0	# lastExpr.isConst,
	je	.L691	#,
	jmp	.L696	#
.L759:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L689	#
.L755:
	.cfi_offset 13, -32
	.cfi_restore 14
	.cfi_restore 15
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L670	#
.L746:
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	mov	QWORD PTR 112[rsp], rbp	#,
	mov	QWORD PTR 120[rsp], r12	#,
	mov	QWORD PTR 128[rsp], r13	#,
	mov	QWORD PTR 136[rsp], r14	#,
	mov	QWORD PTR 144[rsp], r15	#,
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# src/compiler.c:1605: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE103:
	.size	"declaration", .-"declaration"
	.section	.rodata.str1.8
	.align 8
.LC46:
	.string	"Expect left parentheses after 'print'."
	.section	.rodata.str1.1
.LC47:
	.string	"Can only have 255 arguments."
	.section	.rodata.str1.8
	.align 8
.LC48:
	.string	"Expect right parentheses after arguments."
	.section	.rodata.str1.1
.LC49:
	.string	"Expect ';' after print."
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"Cannot use 'break' outside a loop."
	.align 8
.LC51:
	.string	"Cannot use 'break' inside a try block."
	.align 8
.LC52:
	.string	"Too many break statements in current loop."
	.section	.rodata.str1.1
.LC53:
	.string	"Expect ';' after 'break'."
	.section	.rodata.str1.8
	.align 8
.LC54:
	.string	"Cannot use 'continue' outside of a loop."
	.align 8
.LC55:
	.string	"Cannot use 'continue' inside a try block."
	.section	.rodata.str1.1
.LC56:
	.string	"Expect ';' after 'continue'"
.LC57:
	.string	"Expect '(' after 'if'."
	.section	.rodata.str1.8
	.align 8
.LC58:
	.string	"Expect ')' after if statement condition."
	.align 8
.LC59:
	.string	"Cannot return from top-level code."
	.align 8
.LC60:
	.string	"Cannot return value from an initializer."
	.align 8
.LC61:
	.string	"Expect ';' after return value."
	.section	.rodata.str1.1
.LC62:
	.string	"Expect 'catch' after try."
.LC63:
	.string	"Expect '(' after 'catch'."
	.section	.rodata.str1.8
	.align 8
.LC64:
	.string	"Expect ')' after variable name."
	.section	.rodata.str1.1
.LC65:
	.string	"Expect '}' after block."
	.section	.rodata.str1.8
	.align 8
.LC66:
	.string	"Expect ';' after expression statement."
	.text
	.p2align 4
	.type	"statement", @function
"statement":
.LFB104:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
	mov	eax, DWORD PTR "parser"[rip]	# tmp703, parser.current.type
	sub	eax, 4	#,
	cmp	eax, 59	# tmp348,
	ja	.L761	#,
	lea	rdx, .L763[rip]	# tmp351,
	mov	QWORD PTR 8[rsp], rbx	#,
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp353,
	add	rax, rdx	# tmp354, tmp351
	.cfi_offset 3, -24
	jmp	rax	# tmp354
	.section	.rodata
	.align 4
	.align 4
.L763:
	.long	.L772-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L771-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L770-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L769-.L763
	.long	.L864-.L763
	.long	.L768-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L767-.L763
	.long	.L766-.L763
	.long	.L864-.L763
	.long	.L765-.L763
	.long	.L864-.L763
	.long	.L864-.L763
	.long	.L764-.L763
	.long	.L762-.L763
	.text
	.p2align 4,,10
	.p2align 3
.L864:
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_restore 3
.L761:
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1281:     consume(TOKEN_SEMICOLON, "Expect ';' after expression statement.");
	lea	rsi, .LC66[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_293->function, current.7_293->function
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _295,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L762:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1625:         whileStatement();
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:1625:         whileStatement();
	jmp	"whileStatement"	#
	.p2align 4,,10
	.p2align 3
.L772:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:288:     current->scopeDepth++;
	mov	rax, QWORD PTR "current"[rip]	# current.68_16, current
# src/compiler.c:288:     current->scopeDepth++;
	add	DWORD PTR 524828[rax], 1	# current.68_16->scopeDepth,
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# _242, parser.current.type
# src/compiler.c:1087:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 5	# _242,
	je	.L816	#,
	cmp	eax, 65	# _242,
	je	.L816	#,
	lea	rbx, "parser"[rip]	# tmp701,
	jmp	.L817	#
	.p2align 4,,10
	.p2align 3
.L868:
	cmp	eax, 5	# _291,
	je	.L816	#,
.L817:
# src/compiler.c:1088:         declaration();
	call	"declaration"	#
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR [rbx]	# _291, parser.current.type
# src/compiler.c:1087:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 65	# _291,
	jne	.L868	#,
.L816:
# src/compiler.c:1091:     consume(TOKEN_RIGHT_BRACE, "Expect '}' after block.");
	lea	rsi, .LC65[rip]	#,
	mov	edi, 5	#,
	call	"consume"	#
# src/compiler.c:1629:         endScope();
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:1629:         endScope();
	jmp	"endScope"	#
	.p2align 4,,10
	.p2align 3
.L771:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1286:     if (currentLoop == NULL) {
	cmp	QWORD PTR "currentLoop"[rip], 0	# currentLoop,
	je	.L869	#,
.L778:
# src/compiler.c:1290:     if (currentTryDepth > 0) {
	mov	esi, DWORD PTR "currentTryDepth"[rip]	#, currentTryDepth
	test	esi, esi	#
	jle	.L782	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L783	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _84, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _84,
	je	.L870	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _84,
	je	.L785	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L785:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC51[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
.L782:
# src/compiler.c:1294:     if (currentLoop->breakCount == MAX_BREAKS) {
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop, currentLoop
# src/compiler.c:1294:     if (currentLoop->breakCount == MAX_BREAKS) {
	cmp	DWORD PTR 1032[rax], 256	# currentLoop.93_55->breakCount,
	je	.L871	#,
.L783:
# src/compiler.c:1298:     consume(TOKEN_SEMICOLON, "Expect ';' after 'break'.");
	lea	rsi, .LC53[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:1300:     for (int i = current->localCount - 1;
	mov	rdx, QWORD PTR "current"[rip]	# prephitmp_463, current
# src/compiler.c:1301:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	ebx, DWORD PTR 524312[rdx]	# i, current.94_58->localCount
	sub	ebx, 1	# i,
	jns	.L788	#,
	jmp	.L789	#
	.p2align 4,,10
	.p2align 3
.L790:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# prephitmp_463->function, prephitmp_463->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:1301:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	sub	ebx, 1	# i,
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _471,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdx, QWORD PTR "current"[rip]	# prephitmp_463, current
# src/compiler.c:1301:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	cmp	ebx, -1	# i,
	je	.L789	#,
.L788:
# src/compiler.c:1301:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	rcx, QWORD PTR "currentLoop"[rip]	# currentLoop, currentLoop
# src/compiler.c:1301:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	eax, ebx	# i, i
	sal	rax, 5	# tmp449,
# src/compiler.c:1301:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	ecx, DWORD PTR 4[rcx]	# tmp705, currentLoop.96_68->scopeDepth
	cmp	DWORD PTR 48[rdx+rax], ecx	# prephitmp_463->locals[i_316].depth, tmp705
	jg	.L790	#,
.L789:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# prephitmp_465->function, prephitmp_465->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 49	#,
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _101,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_103->function, current.7_103->function
	add	rdi, 24	# _105,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_107->function, current.7_107->function
	add	rdi, 24	# _109,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
# src/compiler.c:1306:     currentLoop->breakJumps[currentLoop->breakCount++] = jump;
	mov	rdx, QWORD PTR "currentLoop"[rip]	# currentLoop.97_71, currentLoop
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.7_110->function, current.7_110->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	ecx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_111 + 24B].count, MEM[(struct Chunk *)_111 + 24B].count
# src/compiler.c:1306:     currentLoop->breakJumps[currentLoop->breakCount++] = jump;
	movsxd	rax, DWORD PTR 1032[rdx]	#, currentLoop.97_71->breakCount
# src/compiler.c:208:     return currentChunk()->count - 2;
	sub	ecx, 2	# _113,
# src/compiler.c:1306:     currentLoop->breakJumps[currentLoop->breakCount++] = jump;
	lea	esi, 1[rax]	# tmp471,
	mov	DWORD PTR 1032[rdx], esi	# currentLoop.97_71->breakCount, tmp471
# src/compiler.c:1306:     currentLoop->breakJumps[currentLoop->breakCount++] = jump;
	mov	DWORD PTR 8[rdx+rax*4], ecx	# currentLoop.97_71->breakJumps[_72], _113
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L770:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1310:     if (currentLoop == NULL) {
	cmp	QWORD PTR "currentLoop"[rip], 0	# currentLoop,
	je	.L872	#,
.L792:
# src/compiler.c:1314:     if (currentTryDepth > 0) {
	mov	ecx, DWORD PTR "currentTryDepth"[rip]	#, currentTryDepth
	test	ecx, ecx	#
	jle	.L793	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L793	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _142, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _142,
	je	.L873	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _142,
	je	.L797	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L797:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC55[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
.L793:
# src/compiler.c:1318:     consume(TOKEN_SEMICOLON, "Expect ';' after 'continue'");
	lea	rsi, .LC56[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:1320:     for (int i = current->localCount - 1; 
	mov	rdx, QWORD PTR "current"[rip]	# pretmp_456, current
# src/compiler.c:1321:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	ebx, DWORD PTR 524312[rdx]	# i, current.101_118->localCount
	sub	ebx, 1	# i,
	jns	.L798	#,
	jmp	.L865	#
	.p2align 4,,10
	.p2align 3
.L801:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rdx]	# prephitmp_457->function, prephitmp_457->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _124,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1321:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	sub	ebx, 1	# i,
	jb	.L865	#,
# src/compiler.c:1321:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	rdx, QWORD PTR "current"[rip]	# pretmp_456, current
.L798:
# src/compiler.c:1321:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	rcx, QWORD PTR "currentLoop"[rip]	# currentLoop.103_128, currentLoop
# src/compiler.c:1321:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	eax, ebx	# i, i
	sal	rax, 5	# tmp516,
# src/compiler.c:1321:          i >= 0 && current->locals[i].depth > currentLoop->scopeDepth; i--) {
	mov	esi, DWORD PTR 4[rcx]	# tmp707, currentLoop.103_128->scopeDepth
	cmp	DWORD PTR 48[rdx+rax], esi	# prephitmp_457->locals[i_3].depth, tmp707
	jg	.L801	#,
.L799:
# src/compiler.c:1325:     emitLoop(currentLoop->start);
	mov	edi, DWORD PTR [rcx]	# prephitmp_461->start, prephitmp_461->start
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:1325:     emitLoop(currentLoop->start);
	jmp	"emitLoop"	#
	.p2align 4,,10
	.p2align 3
.L769:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1615:         forStatement();
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:1615:         forStatement();
	jmp	"forStatement"	#
	.p2align 4,,10
	.p2align 3
.L768:
	.cfi_restore_state
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1386:     consume(TOKEN_LEFT_PAREN, "Expect '(' after 'if'.");
	xor	edi, edi	#
	lea	rsi, .LC57[rip]	#,
	call	"consume"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1388:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after if statement condition.");
	lea	rsi, .LC58[rip]	#,
	mov	edi, 1	#,
	call	"consume"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 50	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_176->function, current.7_176->function
	add	rdi, 24	# _178,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_180->function, current.7_180->function
	add	rdi, 24	# _182,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_184->function, current.7_184->function
	add	rdi, 24	# _186,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _188, current.7_187->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp708, MEM[(struct Chunk *)_188 + 24B].count
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _152,
# src/compiler.c:208:     return currentChunk()->count - 2;
	lea	ebp, -2[rax]	# _190,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1392:     statement();
	call	"statement"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 49	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_160->function, current.7_160->function
	add	rdi, 24	# _162,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_164->function, current.7_164->function
	add	rdi, 24	# _166,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_168->function, current.7_168->function
	add	rdi, 24	# _170,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1396:     patchJump(thenJump);
	mov	edi, ebp	#, _190
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.7_171->function, current.7_171->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	ebx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_172 + 24B].count, MEM[(struct Chunk *)_172 + 24B].count
# src/compiler.c:1396:     patchJump(thenJump);
	call	"patchJump"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:208:     return currentChunk()->count - 2;
	sub	ebx, 2	# _174,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_155->function, current.7_155->function
	add	rdi, 24	# _157,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR "parser"[rip], 49	# parser.current.type,
	je	.L874	#,
.L866:
# src/compiler.c:1534:     patchJump(successJump);
	mov	rbp, QWORD PTR 16[rsp]	#,
	.cfi_restore 6
	mov	edi, ebx	#, _274
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_restore 3
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:1534:     patchJump(successJump);
	jmp	"patchJump"	#
	.p2align 4,,10
	.p2align 3
.L767:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -16
# src/compiler.c:1406:     uint8_t argCount = 0;
	xor	ebp, ebp	# argCount
	lea	rbx, "parser"[rip]	# tmp701,
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1404:     consume(TOKEN_LEFT_PAREN, "Expect left parentheses after 'print'.");
	xor	edi, edi	#
	lea	rsi, .LC46[rip]	#,
	call	"consume"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1410:         if (argCount == 255) {
	cmp	bpl, -1	# argCount,
	je	.L875	#,
.L773:
# src/compiler.c:1413:         argCount++;
	add	ebp, 1	# argCount,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR [rbx], 6	# parser.current.type,
	je	.L876	#,
# src/compiler.c:1416:     consume(TOKEN_RIGHT_PAREN, "Expect right parentheses after arguments.");
	lea	rsi, .LC48[rip]	#,
	mov	edi, 1	#,
	call	"consume"	#
# src/compiler.c:1417:     consume(TOKEN_SEMICOLON, "Expect ';' after print.");
	lea	rsi, .LC49[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 47	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_44->function, current.7_44->function
	add	rdi, 24	# _46,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bpl	# argCount, argCount
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_restore 3
	mov	rbp, QWORD PTR 16[rsp]	#,
	.cfi_restore 6
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_48->function, current.7_48->function
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _50,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L766:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1423:     if (current->type == TYPE_SCRIPT) {
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1423:     if (current->type == TYPE_SCRIPT) {
	cmp	DWORD PTR 16[rax], 3	# current.111_191->type,
	je	.L877	#,
.L803:
# src/compiler.c:1427:     for (int i = 0; i < currentTryDepth; i++) {
	mov	edx, DWORD PTR "currentTryDepth"[rip]	#, currentTryDepth
	test	edx, edx	#
	jle	.L806	#,
	mov	QWORD PTR 16[rsp], rbp	#,
	lea	rbx, "parser"[rip]	# tmp701,
	.cfi_offset 6, -16
# src/compiler.c:1427:     for (int i = 0; i < currentTryDepth; i++) {
	xor	ebp, ebp	# i
	.p2align 4
	.p2align 3
.L807:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
	mov	esi, 61	#,
# src/compiler.c:1427:     for (int i = 0; i < currentTryDepth; i++) {
	add	ebp, 1	# i,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_195->function, current.7_195->function
	add	rdi, 24	# _197,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1427:     for (int i = 0; i < currentTryDepth; i++) {
	cmp	ebp, DWORD PTR "currentTryDepth"[rip]	# i, currentTryDepth
	jl	.L807	#,
	mov	rbp, QWORD PTR 16[rsp]	#,
	.cfi_restore 6
.L806:
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR "parser"[rip], 12	# parser.current.type,
	je	.L808	#,
# src/compiler.c:1434:         if (current->type == TYPE_INITIALIZER) {
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1434:         if (current->type == TYPE_INITIALIZER) {
	cmp	DWORD PTR 16[rax], 1	# current.113_202->type,
	je	.L878	#,
.L810:
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1439:         consume(TOKEN_SEMICOLON, "Expect ';' after return value.");
	lea	rsi, .LC61[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
.L867:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
	mov	esi, 62	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_206->function,
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _208,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L765:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1621:         switchStatement();
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
# src/compiler.c:1633: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:1621:         switchStatement();
	jmp	"switchStatement"	#
	.p2align 4,,10
	.p2align 3
.L764:
	.cfi_restore_state
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 60	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_276->function, current.7_276->function
	add	rdi, 24	# _278,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_280->function, current.7_280->function
	add	rdi, 24	# _282,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_284->function, current.7_284->function
	add	rdi, 24	# _286,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1513:     currentTryDepth++;
	add	DWORD PTR "currentTryDepth"[rip], 1	# currentTryDepth,
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.7_287->function, current.7_287->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	ebp, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_288 + 24B].count, MEM[(struct Chunk *)_288 + 24B].count
# src/compiler.c:1515:     statement();
	call	"statement"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 61	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:208:     return currentChunk()->count - 2;
	sub	ebp, 2	# _290,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_246->function, current.7_246->function
	add	rdi, 24	# _248,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 49	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_260->function, current.7_260->function
	add	rdi, 24	# _262,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_264->function, current.7_264->function
	add	rdi, 24	# _266,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_268->function, current.7_268->function
	add	rdi, 24	# _270,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1519:     consume(TOKEN_CATCH, "Expect 'catch' after try.");
	mov	edi, 43	#,
	lea	rsi, .LC62[rip]	#,
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.7_271->function, current.7_271->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	ebx, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_272 + 24B].count, MEM[(struct Chunk *)_272 + 24B].count
# src/compiler.c:1519:     consume(TOKEN_CATCH, "Expect 'catch' after try.");
	call	"consume"	#
# src/compiler.c:1520:     consume(TOKEN_LEFT_PAREN, "Expect '(' after 'catch'.");
	lea	rsi, .LC63[rip]	#,
	xor	edi, edi	#
	call	"consume"	#
# src/compiler.c:1521:     consume(TOKEN_IDENTIFIER, "Expect variable name.");
	lea	rsi, .LC23[rip]	#,
	mov	edi, 37	#,
# src/compiler.c:208:     return currentChunk()->count - 2;
	sub	ebx, 2	# _274,
# src/compiler.c:1521:     consume(TOKEN_IDENTIFIER, "Expect variable name.");
	call	"consume"	#
# src/compiler.c:288:     current->scopeDepth++;
	mov	rax, QWORD PTR "current"[rip]	# current.68_250, current
# src/compiler.c:1524:     patchJump(errorJump);
	mov	edi, ebp	#, _290
# src/compiler.c:288:     current->scopeDepth++;
	add	DWORD PTR 524828[rax], 1	# current.68_250->scopeDepth,
# src/compiler.c:1524:     patchJump(errorJump);
	call	"patchJump"	#
# src/compiler.c:1525:     addLocal(parser.previous);
	mov	rax, QWORD PTR "parser"[rip+40]	# parser.previous, parser.previous
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 64
	movdqu	xmm0, XMMWORD PTR "parser"[rip+24]	# parser.previous, parser.previous
	mov	QWORD PTR 16[rsp], rax	#, parser.previous
	movups	XMMWORD PTR [rsp], xmm0	#, parser.previous
	call	"addLocal"	#
# src/compiler.c:1018:     if (current->scopeDepth == 0) return;
	mov	rdx, QWORD PTR "current"[rip]	# current.73_253, current
# src/compiler.c:1018:     if (current->scopeDepth == 0) return;
	add	rsp, 32	#,
	.cfi_def_cfa_offset 32
# src/compiler.c:1018:     if (current->scopeDepth == 0) return;
	mov	ecx, DWORD PTR 524828[rdx]	# _254, current.73_253->scopeDepth
# src/compiler.c:1018:     if (current->scopeDepth == 0) return;
	test	ecx, ecx	# _254
	je	.L815	#,
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	eax, DWORD PTR 524312[rdx]	# tmp710, current.73_253->localCount
	sub	eax, 1	# _256,
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	cdqe
	sal	rax, 5	# tmp679,
	mov	DWORD PTR 48[rax+rdx], ecx	# current.73_253->locals[_256].depth, _254
.L815:
# src/compiler.c:1528:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after variable name.");
	lea	rsi, .LC64[rip]	#,
	mov	edi, 1	#,
	call	"consume"	#
# src/compiler.c:1530:     statement();
	call	"statement"	#
# src/compiler.c:1531:     endScope();
	call	"endScope"	#
# src/compiler.c:1533:     currentTryDepth--;
	sub	DWORD PTR "currentTryDepth"[rip], 1	# currentTryDepth,
	jmp	.L866	#
	.p2align 4,,10
	.p2align 3
.L876:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1410:         if (argCount == 255) {
	cmp	bpl, -1	# argCount,
	jne	.L773	#,
.L875:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbx], 0	# parser.panicMode,
	jne	.L773	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR 20[rbx]	# parser.line, parser.line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR [rbx]	# _37, parser.type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _37,
	je	.L879	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _37,
	jne	.L880	#,
.L775:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC47[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L773	#
	.p2align 4,,10
	.p2align 3
.L880:
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 8[rbx]	# parser.start, parser.start
	mov	edx, DWORD PTR 16[rbx]	# parser.length, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L775	#
	.p2align 4,,10
	.p2align 3
.L871:
	.cfi_restore 6
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L783	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _92, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _92,
	je	.L881	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _92,
	je	.L787	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L787:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC52[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L783	#
	.p2align 4,,10
	.p2align 3
.L878:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L810	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _236, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _236,
	je	.L882	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _236,
	je	.L814	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L814:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC60[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L810	#
	.p2align 4,,10
	.p2align 3
.L865:
# src/compiler.c:1325:     emitLoop(currentLoop->start);
	mov	rcx, QWORD PTR "currentLoop"[rip]	# currentLoop.103_128, currentLoop
	jmp	.L799	#
	.p2align 4,,10
	.p2align 3
.L877:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L803	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _211, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _211,
	je	.L883	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _211,
	je	.L805	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L805:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC59[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L803	#
	.p2align 4,,10
	.p2align 3
.L808:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:212:     if (current->type == TYPE_INITIALIZER) {
	mov	rax, QWORD PTR "current"[rip]	# current.114_217, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_485, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rcx, QWORD PTR 8[rax]	# tmp709, current.114_217->function
	lea	rdi, 24[rcx]	# _487,
# src/compiler.c:212:     if (current->type == TYPE_INITIALIZER) {
	cmp	DWORD PTR 16[rax], 1	# current.114_217->type,
	je	.L884	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 2	#,
	call	"writeChunk"@PLT	#
	jmp	.L867	#
	.p2align 4,,10
	.p2align 3
.L874:
	.cfi_offset 6, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1399:     if (match(TOKEN_ELSE)) statement();
	call	"statement"	#
	jmp	.L866	#
	.p2align 4,,10
	.p2align 3
.L869:
	.cfi_restore 6
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L779	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _76, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _76,
	je	.L885	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _76,
	je	.L781	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L781:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC50[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L778	#
	.p2align 4,,10
	.p2align 3
.L872:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L793	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _134, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _134,
	je	.L886	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _134,
	je	.L795	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L795:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC54[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L792	#
	.p2align 4,,10
	.p2align 3
.L879:
	.cfi_offset 6, -16
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L775	#
	.p2align 4,,10
	.p2align 3
.L779:
	.cfi_restore 6
# src/compiler.c:1290:     if (currentTryDepth > 0) {
	mov	eax, DWORD PTR "currentTryDepth"[rip]	#, currentTryDepth
	test	eax, eax	#
	jg	.L783	#,
	jmp	.L782	#
	.p2align 4,,10
	.p2align 3
.L884:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 6	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	xor	esi, esi	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_231->function, current.7_231->function
	add	rdi, 24	# _233,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L867	#
.L873:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L797	#
.L870:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L785	#
.L883:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L805	#
.L881:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L787	#
.L885:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L781	#
.L886:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L795	#
.L882:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L814	#
	.cfi_endproc
.LFE104:
	.size	"statement", .-"statement"
	.section	.rodata.str1.1
.LC67:
	.string	"Expect '(' after 'for'."
	.section	.rodata.str1.8
	.align 8
.LC68:
	.string	"Expect ';' after loop condition."
	.section	.rodata.str1.1
.LC69:
	.string	"Expect ')' after for clauses."
	.text
	.p2align 4
	.type	"forStatement", @function
"forStatement":
.LFB95:
	.cfi_startproc
	sub	rsp, 1096	#,
	.cfi_def_cfa_offset 1104
# src/compiler.c:1330:     consume(TOKEN_LEFT_PAREN, "Expect '(' after 'for'.");
	lea	rsi, .LC67[rip]	#,
	xor	edi, edi	#
# src/compiler.c:1328: static void forStatement() {
	mov	QWORD PTR 1056[rsp], rbx	#,
	mov	QWORD PTR 1064[rsp], rbp	#,
	mov	QWORD PTR 1080[rsp], r13	#,
# src/compiler.c:288:     current->scopeDepth++;
	mov	rax, QWORD PTR fs:40	# current.68_46, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 1048[rsp], rax	# D.9317, current.68_46
	mov	rax, QWORD PTR "current"[rip]	# current.68_46, current
# src/compiler.c:288:     current->scopeDepth++;
	add	DWORD PTR 524828[rax], 1	# current.68_46->scopeDepth,
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 13, -24
# src/compiler.c:1330:     consume(TOKEN_LEFT_PAREN, "Expect '(' after 'for'.");
	call	"consume"	#
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# _32, parser.current.type
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 12	# _32,
	je	.L888	#,
	cmp	eax, 47	# _32,
	je	.L914	#,
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1281:     consume(TOKEN_SEMICOLON, "Expect ';' after expression statement.");
	lea	rsi, .LC66[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_78->function, current.7_78->function
	add	rdi, 24	# _80,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L891:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current.7_50, current
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR "parser"[rip], 12	# parser.current.type,
# src/compiler.c:1344:     Loop* enclosingLoop = currentLoop;
	mov	r13, QWORD PTR "currentLoop"[rip]	# enclosingLoop, currentLoop
# src/compiler.c:1345:     currentLoop = &loop;
	mov	QWORD PTR "currentLoop"[rip], rsp	# currentLoop,
# src/compiler.c:1340:     loop.start = currentChunk()->count;
	mov	rdx, QWORD PTR 8[rax]	# current.7_50->function, current.7_50->function
# src/compiler.c:1340:     loop.start = currentChunk()->count;
	movd	xmm0, DWORD PTR 24[rdx]	# MEM[(struct Chunk *)_51 + 24B].count, MEM[(struct Chunk *)_51 + 24B].count
	pinsrd	xmm0, DWORD PTR 524828[rax], 1	# _194, current.7_50->scopeDepth
# src/compiler.c:1342:     loop.breakCount = 0;
	mov	DWORD PTR 1032[rsp], 0	# loop.breakCount,
# src/compiler.c:1340:     loop.start = currentChunk()->count;
	movq	QWORD PTR [rsp], xmm0	# MEM <vector(2) int> [(int *)&loop], _194
# src/compiler.c:174:     if (!check(type)) return false;
	je	.L915	#,
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1350:         consume(TOKEN_SEMICOLON, "Expect ';' after loop condition.");
	lea	rsi, .LC68[rip]	#,
	mov	edi, 12	#,
	call	"consume"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 50	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_82->function, current.7_82->function
	add	rdi, 24	# _84,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_86->function, current.7_86->function
	add	rdi, 24	# _88,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_90->function, current.7_90->function
	add	rdi, 24	# _92,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _94, current.7_93->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp299, MEM[(struct Chunk *)_94 + 24B].count
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _55,
# src/compiler.c:208:     return currentChunk()->count - 2;
	lea	ebx, -2[rax]	# exitJump,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L893:
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR "parser"[rip], 1	# parser.current.type,
	je	.L916	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 49	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_98->function, current.7_98->function
	add	rdi, 24	# _100,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_102->function, current.7_102->function
	add	rdi, 24	# _104,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_106->function, current.7_106->function
	add	rdi, 24	# _108,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.7_109->function, current.7_109->function
	mov	ebp, DWORD PTR 24[rax]	# _111, MEM[(struct Chunk *)_110 + 24B].count
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_58->function, current.7_58->function
	add	rdi, 24	# _60,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1361:         consume(TOKEN_RIGHT_PAREN, "Expect ')' after for clauses.");
	lea	rsi, .LC69[rip]	#,
	mov	edi, 1	#,
	call	"consume"	#
# src/compiler.c:1363:         emitLoop(currentLoop->start);
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop, currentLoop
	mov	edi, DWORD PTR [rax]	# currentLoop.106_3->start, currentLoop.106_3->start
	call	"emitLoop"	#
# src/compiler.c:1364:         currentLoop->start = incrementStart;
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop, currentLoop
# src/compiler.c:208:     return currentChunk()->count - 2;
	lea	edi, -2[rbp]	# _112,
# src/compiler.c:1364:         currentLoop->start = incrementStart;
	mov	DWORD PTR [rax], ebp	# currentLoop.107_5->start, _111
# src/compiler.c:1365:         patchJump(bodyJump);
	call	"patchJump"	#
.L895:
# src/compiler.c:1368:     statement();
	call	"statement"	#
# src/compiler.c:1369:     emitLoop(currentLoop->start);
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop, currentLoop
	mov	edi, DWORD PTR [rax]	# currentLoop.108_6->start, currentLoop.108_6->start
	call	"emitLoop"	#
# src/compiler.c:1371:     if (exitJump != -1) {
	cmp	ebx, -1	# exitJump,
	je	.L896	#,
# src/compiler.c:1372:         patchJump(exitJump);
	mov	edi, ebx	#, exitJump
	call	"patchJump"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_64->function, current.7_64->function
	add	rdi, 24	# _66,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
.L896:
# src/compiler.c:1376:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop.110_9, currentLoop
# src/compiler.c:1376:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	edx, DWORD PTR 1032[rax]	#, currentLoop.110_61->breakCount
	test	edx, edx	#
	jle	.L897	#,
	mov	QWORD PTR 1072[rsp], r12	#,
	.cfi_offset 12, -32
# src/compiler.c:1376:     for (int i = 0; i < currentLoop->breakCount; i++) {
	xor	r12d, r12d	# i
	mov	QWORD PTR 1088[rsp], r14	#,
	.cfi_offset 14, -16
# src/compiler.c:126:     if (parser.panicMode) return;
	lea	r14, "parser"[rip]	# tmp293,
	.p2align 4
	.p2align 3
.L903:
# src/compiler.c:1377:         patchJump(currentLoop->breakJumps[i]);
	mov	edx, r12d	# i, i
	movsxd	rbp, DWORD PTR 8[rax+rdx*4]	#, currentLoop.110_33->breakJumps[i_152]
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rax, QWORD PTR 8[rax]	# _114, current.7_113->function
# src/compiler.c:228:     int jump = currentChunk()->count - offset - 2;
	mov	ebx, DWORD PTR 24[rax]	# _116, MEM[(struct Chunk *)_114 + 24B].count
	sub	ebx, ebp	# _116, _8
# src/compiler.c:228:     int jump = currentChunk()->count - offset - 2;
	sub	ebx, 2	# jump,
# src/compiler.c:230:     if (jump > UINT16_MAX) {
	cmp	ebx, 65535	# jump,
	jle	.L899	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[r14], 0	# parser.panicMode,
	jne	.L899	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR 44[r14]	# MEM[(struct Token *)&parser + 24B].line, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[r14]	# _134, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _134,
	je	.L917	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _134,
	je	.L902	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[r14]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[r14]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L902:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC4[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _114, pretmp_198->function
.L899:
# src/compiler.c:234:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)prephitmp_201 + 24B].code, MEM[(struct Chunk *)prephitmp_201 + 24B].code
# src/compiler.c:1376:     for (int i = 0; i < currentLoop->breakCount; i++) {
	add	r12d, 1	# i,
# src/compiler.c:234:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	BYTE PTR [rax+rbp], bh	# *_124, jump
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:235:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 8[rax]	# current.7_126->function, current.7_126->function
# src/compiler.c:235:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)_127 + 24B].code, MEM[(struct Chunk *)_127 + 24B].code
	mov	BYTE PTR 1[rax+rbp], bl	# *_130, jump
# src/compiler.c:1376:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop.110_9, currentLoop
# src/compiler.c:1376:     for (int i = 0; i < currentLoop->breakCount; i++) {
	cmp	DWORD PTR 1032[rax], r12d	# currentLoop.110_9->breakCount, i
	jg	.L903	#,
	mov	r12, QWORD PTR 1072[rsp]	#,
	.cfi_restore 12
	mov	r14, QWORD PTR 1088[rsp]	#,
	.cfi_restore 14
.L897:
# src/compiler.c:1380:     currentLoop = enclosingLoop;
	mov	QWORD PTR "currentLoop"[rip], r13	# currentLoop, enclosingLoop
# src/compiler.c:1382:     endScope();
	call	"endScope"	#
# src/compiler.c:1383: }
	mov	rax, QWORD PTR 1048[rsp]	# tmp297, D.9317
	sub	rax, QWORD PTR fs:40	# tmp297, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L918	#,
	mov	rbx, QWORD PTR 1056[rsp]	#,
	mov	rbp, QWORD PTR 1064[rsp]	#,
	mov	r13, QWORD PTR 1080[rsp]	#,
	add	rsp, 1096	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L914:
	.cfi_restore_state
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1334:         varDeclaration();
	call	"varDeclaration"	#
	jmp	.L891	#
	.p2align 4,,10
	.p2align 3
.L917:
	.cfi_offset 12, -32
	.cfi_offset 14, -16
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L902	#
	.p2align 4,,10
	.p2align 3
.L888:
	.cfi_restore 12
	.cfi_restore 14
# src/compiler.c:175:     advance();
	call	"advance"	#
	jmp	.L891	#
	.p2align 4,,10
	.p2align 3
.L916:
	call	"advance"	#
	jmp	.L895	#
	.p2align 4,,10
	.p2align 3
.L915:
	call	"advance"	#
# src/compiler.c:1347:     int exitJump = -1;
	mov	ebx, -1	# exitJump,
	jmp	.L893	#
.L918:
	mov	QWORD PTR 1072[rsp], r12	#,
	mov	QWORD PTR 1088[rsp], r14	#,
	.cfi_offset 12, -32
	.cfi_offset 14, -16
# src/compiler.c:1383: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE95:
	.size	"forStatement", .-"forStatement"
	.section	.rodata.str1.1
.LC70:
	.string	"Expect '(' after 'switch'."
.LC71:
	.string	"Expect ')' after value."
	.section	.rodata.str1.8
	.align 8
.LC72:
	.string	"Expect '{' before switch cases."
	.align 8
.LC73:
	.string	"Can't have another case or default after the default case."
	.section	.rodata.str1.1
.LC74:
	.string	"Expect ':' after case value."
.LC75:
	.string	"Expect ':' after default."
	.section	.rodata.str1.8
	.align 8
.LC76:
	.string	"Can't have statements before any case."
	.text
	.p2align 4
	.type	"switchStatement", @function
"switchStatement":
.LFB99:
	.cfi_startproc
	sub	rsp, 1080	#,
	.cfi_def_cfa_offset 1088
# src/compiler.c:1445:     consume(TOKEN_LEFT_PAREN, "Expect '(' after 'switch'.");
	xor	edi, edi	#
	mov	rsi, QWORD PTR fs:40	#, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 1032[rsp], rsi	# D.9346,
	lea	rsi, .LC70[rip]	#,
	call	"consume"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1447:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after value.");
	lea	rsi, .LC71[rip]	#,
	mov	edi, 1	#,
	call	"consume"	#
# src/compiler.c:1448:     consume(TOKEN_LEFT_BRACE, "Expect '{' before switch cases.");
	lea	rsi, .LC72[rip]	#,
	mov	edi, 4	#,
	call	"consume"	#
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# _55, parser.current.type
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 5	# _55,
	je	.L973	#,
	mov	QWORD PTR 1056[rsp], r12	#,
	mov	QWORD PTR 1072[rsp], r14	#,
	mov	QWORD PTR 1040[rsp], rbx	#,
	.cfi_offset 12, -32
	.cfi_offset 14, -16
	.cfi_offset 3, -48
# src/compiler.c:1452:     int caseCount = 0;
	xor	ebx, ebx	#
	mov	QWORD PTR 1048[rsp], rbp	#,
	.cfi_offset 6, -40
# src/compiler.c:1450:     int state = 0; // 0: before all cases, 1: before default, 2: after default.
	xor	ebp, ebp	# state
	mov	QWORD PTR 1064[rsp], r13	#,
	.cfi_offset 13, -24
# src/compiler.c:1453:     int previousCaseSkip = -1;
	mov	r13d, -1	# previousCaseSkip,
.L920:
# src/compiler.c:1455:     while (!match(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 65	# _55,
	je	.L939	#,
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 42	# _55,
	je	.L922	#,
	cmp	eax, 48	# _55,
	je	.L922	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	lea	r12, "parser"[rip]	# tmp348,
# src/compiler.c:1492:             if (state == 0) {
	test	ebp, ebp	# state
	je	.L926	#,
.L927:
# src/compiler.c:1495:             statement();
	call	"statement"	#
.L934:
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR [r12]	# _55, parser.current.type
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	eax, 5	# _55,
	jne	.L920	#,
# src/compiler.c:175:     advance();
	call	"advance"	#
.L939:
# src/compiler.c:1499:     if (state == 1) {
	cmp	ebp, 1	# state,
	je	.L974	#,
.L941:
# src/compiler.c:1504:     for (int i = 0; i < caseCount; i++) {
	test	ebx, ebx	# caseCount
	je	.L972	#,
	mov	r12, rsp	# ivtmp.530,
# src/compiler.c:126:     if (parser.panicMode) return;
	lea	r14, "parser"[rip]	# tmp349,
	lea	r13, [r12+rbx*4]	# _255,
	.p2align 4
	.p2align 3
.L947:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1505:         patchJump(caseEnds[i]);
	movsxd	rbp, DWORD PTR [r12]	#, MEM[(int *)_259]
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _130, current.7_129->function
# src/compiler.c:228:     int jump = currentChunk()->count - offset - 2;
	mov	ebx, DWORD PTR 24[rax]	# _132, MEM[(struct Chunk *)_130 + 24B].count
	sub	ebx, ebp	# _132, _3
# src/compiler.c:228:     int jump = currentChunk()->count - offset - 2;
	sub	ebx, 2	# jump,
# src/compiler.c:230:     if (jump > UINT16_MAX) {
	cmp	ebx, 65535	# jump,
	jle	.L943	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[r14], 0	# parser.panicMode,
	jne	.L943	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR 44[r14]	# MEM[(struct Token *)&parser + 24B].line, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[r14]	# _150, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _150,
	je	.L975	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _150,
	je	.L946	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[r14]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[r14]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L946:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC4[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _130, pretmp_263->function
.L943:
# src/compiler.c:234:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)prephitmp_266 + 24B].code, MEM[(struct Chunk *)prephitmp_266 + 24B].code
# src/compiler.c:1504:     for (int i = 0; i < caseCount; i++) {
	add	r12, 4	# ivtmp.530,
# src/compiler.c:234:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	BYTE PTR [rax+rbp], bh	# *_140, jump
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:235:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 8[rax]	# current.7_142->function, current.7_142->function
# src/compiler.c:235:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)_143 + 24B].code, MEM[(struct Chunk *)_143 + 24B].code
	mov	BYTE PTR 1[rax+rbp], bl	# *_146, jump
# src/compiler.c:1504:     for (int i = 0; i < caseCount; i++) {
	cmp	r13, r12	# _255, ivtmp.530
	jne	.L947	#,
.L972:
	mov	rbx, QWORD PTR 1040[rsp]	#,
	.cfi_restore 3
	mov	rbp, QWORD PTR 1048[rsp]	#,
	.cfi_restore 6
	mov	r12, QWORD PTR 1056[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 1064[rsp]	#,
	.cfi_restore 13
	mov	r14, QWORD PTR 1072[rsp]	#,
	.cfi_restore 14
.L938:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	rax, QWORD PTR 1032[rsp]	# tmp353, D.9346
	sub	rax, QWORD PTR fs:40	# tmp353, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L976	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_63->function, current.7_63->function
# src/compiler.c:1509: }
	add	rsp, 1080	#,
	.cfi_def_cfa_offset 8
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _65,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	jmp	"writeChunk"@PLT	#
	.p2align 4,,10
	.p2align 3
.L922:
	.cfi_def_cfa_offset 1088
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:1457:             TokenType caseType = parser.previous.type;
	lea	r12, "parser"[rip]	# tmp348,
	mov	r14d, DWORD PTR "parser"[rip+24]	# caseType, parser.previous.type
# src/compiler.c:1459:             if (state == 2) {
	cmp	ebp, 2	# state,
	je	.L977	#,
# src/compiler.c:1463:             if (state == 1) {
	cmp	ebp, 1	# state,
	je	.L978	#,
.L932:
# src/compiler.c:1472:             if (caseType == TOKEN_CASE) {
	cmp	r14d, 42	# caseType,
	je	.L979	#,
# src/compiler.c:1488:                 consume(TOKEN_COLON, "Expect ':' after default.");
	mov	edi, 7	#,
# src/compiler.c:1489:                 previousCaseSkip = -1;
	mov	r13d, -1	# previousCaseSkip,
# src/compiler.c:1487:                 state = 2;
	mov	ebp, 2	# state,
# src/compiler.c:1488:                 consume(TOKEN_COLON, "Expect ':' after default.");
	lea	rsi, .LC75[rip]	#,
	call	"consume"	#
	jmp	.L934	#
	.p2align 4,,10
	.p2align 3
.L926:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L927	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _123, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _123,
	je	.L980	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _123,
	je	.L936	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L936:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC76[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L927	#
	.p2align 4,,10
	.p2align 3
.L974:
# src/compiler.c:1500:         patchJump(previousCaseSkip);
	mov	edi, r13d	#, previousCaseSkip
	call	"patchJump"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_59->function, current.7_59->function
	add	rdi, 24	# _61,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L941	#
	.p2align 4,,10
	.p2align 3
.L975:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L946	#
	.p2align 4,,10
	.p2align 3
.L973:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
# src/compiler.c:175:     advance();
	call	"advance"	#
	jmp	.L938	#
	.p2align 4,,10
	.p2align 3
.L979:
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 48	#,
# src/compiler.c:1473:                 state = 1;
	mov	ebp, 1	# state,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_51->function, current.7_51->function
	add	rdi, 24	# _53,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1479:                 consume(TOKEN_COLON, "Expect ':' after case value.");
	lea	rsi, .LC74[rip]	#,
	mov	edi, 7	#,
	call	"consume"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 31	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_47->function, current.7_47->function
	add	rdi, 24	# _49,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 50	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_106->function, current.7_106->function
	add	rdi, 24	# _108,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_110->function, current.7_110->function
	add	rdi, 24	# _112,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_114->function, current.7_114->function
	add	rdi, 24	# _116,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _118, current.7_117->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp355, MEM[(struct Chunk *)_118 + 24B].count
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _45,
# src/compiler.c:208:     return currentChunk()->count - 2;
	lea	r13d, -2[rax]	# previousCaseSkip,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L934	#
	.p2align 4,,10
	.p2align 3
.L977:
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR "parser"[rip+49], 0	# parser.panicMode,
	jne	.L932	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR "parser"[rip+44]	#, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR "parser"[rip+24]	# _83, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _83,
	je	.L981	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _83,
	je	.L930	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR "parser"[rip+32]	#, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR "parser"[rip+40]	#, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L930:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC73[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
	jmp	.L932	#
	.p2align 4,,10
	.p2align 3
.L978:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 49	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_90->function, current.7_90->function
	add	rdi, 24	# _92,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_94->function, current.7_94->function
	add	rdi, 24	# _96,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_98->function, current.7_98->function
	add	rdi, 24	# _100,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:1465:                 caseEnds[caseCount++] = emitJump(OP_JUMP);
	mov	edx, ebx	# caseCount, caseCount
# src/compiler.c:1468:                 patchJump(previousCaseSkip);
	mov	edi, r13d	#, previousCaseSkip
# src/compiler.c:1465:                 caseEnds[caseCount++] = emitJump(OP_JUMP);
	add	ebx, 1	#,
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	rax, QWORD PTR 8[rax]	# current.7_101->function, current.7_101->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rax]	# MEM[(struct Chunk *)_102 + 24B].count, MEM[(struct Chunk *)_102 + 24B].count
	sub	eax, 2	# _104,
# src/compiler.c:1465:                 caseEnds[caseCount++] = emitJump(OP_JUMP);
	mov	DWORD PTR [rsp+rdx*4], eax	# caseEnds[caseCount_72], _104
# src/compiler.c:1468:                 patchJump(previousCaseSkip);
	call	"patchJump"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_39->function, current.7_39->function
	add	rdi, 24	# _41,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L932	#
.L980:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L936	#
.L981:
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L930	#
.L976:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	mov	QWORD PTR 1040[rsp], rbx	#,
	mov	QWORD PTR 1048[rsp], rbp	#,
	mov	QWORD PTR 1056[rsp], r12	#,
	mov	QWORD PTR 1064[rsp], r13	#,
	mov	QWORD PTR 1072[rsp], r14	#,
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE99:
	.size	"switchStatement", .-"switchStatement"
	.section	.rodata.str1.1
.LC77:
	.string	"Expect '(' after 'while'."
	.section	.rodata.str1.8
	.align 8
.LC78:
	.string	"Expect ')' after loop condition."
	.text
	.p2align 4
	.type	"whileStatement", @function
"whileStatement":
.LFB101:
	.cfi_startproc
	sub	rsp, 1096	#,
	.cfi_def_cfa_offset 1104
# src/compiler.c:1546:     consume(TOKEN_LEFT_PAREN, "Expect '(' after 'while'.");
	lea	rsi, .LC77[rip]	#,
	xor	edi, edi	#
# src/compiler.c:1537: static void whileStatement() {
	mov	QWORD PTR 1056[rsp], rbx	#,
	mov	QWORD PTR 1080[rsp], r13	#,
	.cfi_offset 3, -48
	.cfi_offset 13, -24
# src/compiler.c:1543:     Loop* enclosingLoop = currentLoop;
	mov	r13, QWORD PTR "currentLoop"[rip]	# enclosingLoop, currentLoop
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR fs:40	# current.7_35, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 1048[rsp], rax	# D.9371, current.7_35
	mov	rax, QWORD PTR "current"[rip]	# current.7_35, current
# src/compiler.c:1544:     currentLoop = &loop;
	mov	QWORD PTR "currentLoop"[rip], rsp	# currentLoop,
# src/compiler.c:1539:     loop.start = currentChunk()->count;
	mov	rdx, QWORD PTR 8[rax]	# current.7_35->function, current.7_35->function
# src/compiler.c:1539:     loop.start = currentChunk()->count;
	movd	xmm0, DWORD PTR 24[rdx]	# MEM[(struct Chunk *)_36 + 24B].count, MEM[(struct Chunk *)_36 + 24B].count
	pinsrd	xmm0, DWORD PTR 524828[rax], 1	# _114, current.7_35->scopeDepth
# src/compiler.c:1541:     loop.breakCount = 0;
	mov	DWORD PTR 1032[rsp], 0	# loop.breakCount,
# src/compiler.c:1539:     loop.start = currentChunk()->count;
	movq	QWORD PTR [rsp], xmm0	# MEM <vector(2) int> [(int *)&loop], _114
# src/compiler.c:1546:     consume(TOKEN_LEFT_PAREN, "Expect '(' after 'while'.");
	call	"consume"	#
# src/compiler.c:1083:     parsePrecedence(PREC_ASSIGNMENT);
	call	"parsePrecedence.constprop.0"	#
# src/compiler.c:1548:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after loop condition.");
	lea	rsi, .LC78[rip]	#,
	mov	edi, 1	#,
	call	"consume"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 50	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_41->function, current.7_41->function
	add	rdi, 24	# _43,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_45->function, current.7_45->function
	add	rdi, 24	# _47,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 255	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_49->function, current.7_49->function
	add	rdi, 24	# _51,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdi, QWORD PTR 8[rax]	# _53, current.7_52->function
# src/compiler.c:208:     return currentChunk()->count - 2;
	mov	eax, DWORD PTR 24[rdi]	# tmp230, MEM[(struct Chunk *)_53 + 24B].count
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _34,
# src/compiler.c:208:     return currentChunk()->count - 2;
	lea	ebx, -2[rax]	# _55,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1552:     statement();
	call	"statement"	#
# src/compiler.c:1553:     emitLoop(currentLoop->start);
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop, currentLoop
	mov	edi, DWORD PTR [rax]	# currentLoop.119_3->start, currentLoop.119_3->start
	call	"emitLoop"	#
# src/compiler.c:1555:     patchJump(exitJump);
	mov	edi, ebx	#, _55
	call	"patchJump"	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 5	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_28->function, current.7_28->function
	add	rdi, 24	# _30,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1558:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop.121_6, currentLoop
# src/compiler.c:1558:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	edx, DWORD PTR 1032[rax]	#, currentLoop.121_88->breakCount
	test	edx, edx	#
	jle	.L983	#,
	mov	QWORD PTR 1064[rsp], rbp	#,
	mov	QWORD PTR 1072[rsp], r12	#,
	.cfi_offset 6, -40
	.cfi_offset 12, -32
# src/compiler.c:1558:     for (int i = 0; i < currentLoop->breakCount; i++) {
	xor	r12d, r12d	# i
	mov	QWORD PTR 1088[rsp], r14	#,
	.cfi_offset 14, -16
# src/compiler.c:126:     if (parser.panicMode) return;
	lea	r14, "parser"[rip]	# tmp224,
	.p2align 4
	.p2align 3
.L989:
# src/compiler.c:1559:         patchJump(currentLoop->breakJumps[i]);
	mov	edx, r12d	# i, i
	movsxd	rbp, DWORD PTR 8[rax+rdx*4]	#, currentLoop.121_26->breakJumps[i_19]
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rax, QWORD PTR 8[rax]	# _57, current.7_56->function
# src/compiler.c:228:     int jump = currentChunk()->count - offset - 2;
	mov	ebx, DWORD PTR 24[rax]	# _59, MEM[(struct Chunk *)_57 + 24B].count
	sub	ebx, ebp	# _59, _5
# src/compiler.c:228:     int jump = currentChunk()->count - offset - 2;
	sub	ebx, 2	# jump,
# src/compiler.c:230:     if (jump > UINT16_MAX) {
	cmp	ebx, 65535	# jump,
	jle	.L985	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[r14], 0	# parser.panicMode,
	jne	.L985	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR 44[r14]	# MEM[(struct Token *)&parser + 24B].line, MEM[(struct Token *)&parser + 24B].line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR 24[r14]	# _77, MEM[(struct Token *)&parser + 24B].type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _77,
	je	.L996	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _77,
	je	.L988	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 32[r14]	# MEM[(struct Token *)&parser + 24B].start, MEM[(struct Token *)&parser + 24B].start
	mov	edx, DWORD PTR 40[r14]	# MEM[(struct Token *)&parser + 24B].length, MEM[(struct Token *)&parser + 24B].length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L988:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC4[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR 8[rax]	# _57, pretmp_118->function
.L985:
# src/compiler.c:234:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)prephitmp_121 + 24B].code, MEM[(struct Chunk *)prephitmp_121 + 24B].code
# src/compiler.c:1558:     for (int i = 0; i < currentLoop->breakCount; i++) {
	add	r12d, 1	# i,
# src/compiler.c:234:     currentChunk()->code[offset] = (jump >> 8) & 0xff;
	mov	BYTE PTR [rax+rbp], bh	# *_67, jump
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:235:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 8[rax]	# current.7_69->function, current.7_69->function
# src/compiler.c:235:     currentChunk()->code[offset + 1] = jump & 0xff;
	mov	rax, QWORD PTR 32[rax]	# MEM[(struct Chunk *)_70 + 24B].code, MEM[(struct Chunk *)_70 + 24B].code
	mov	BYTE PTR 1[rax+rbp], bl	# *_73, jump
# src/compiler.c:1558:     for (int i = 0; i < currentLoop->breakCount; i++) {
	mov	rax, QWORD PTR "currentLoop"[rip]	# currentLoop.121_6, currentLoop
# src/compiler.c:1558:     for (int i = 0; i < currentLoop->breakCount; i++) {
	cmp	DWORD PTR 1032[rax], r12d	# currentLoop.121_6->breakCount, i
	jg	.L989	#,
	mov	rbp, QWORD PTR 1064[rsp]	#,
	.cfi_restore 6
	mov	r12, QWORD PTR 1072[rsp]	#,
	.cfi_restore 12
	mov	r14, QWORD PTR 1088[rsp]	#,
	.cfi_restore 14
.L983:
# src/compiler.c:1562:     currentLoop = enclosingLoop;
	mov	QWORD PTR "currentLoop"[rip], r13	# currentLoop, enclosingLoop
# src/compiler.c:1563: }
	mov	rax, QWORD PTR 1048[rsp]	# tmp228, D.9371
	sub	rax, QWORD PTR fs:40	# tmp228, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L997	#,
	mov	rbx, QWORD PTR 1056[rsp]	#,
	mov	r13, QWORD PTR 1080[rsp]	#,
	add	rsp, 1096	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L996:
	.cfi_def_cfa_offset 1104
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 14, -16
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L988	#
.L997:
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 14
	mov	QWORD PTR 1064[rsp], rbp	#,
	mov	QWORD PTR 1072[rsp], r12	#,
	mov	QWORD PTR 1088[rsp], r14	#,
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 14, -16
# src/compiler.c:1563: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE101:
	.size	"whileStatement", .-"whileStatement"
	.section	.rodata.str1.1
.LC79:
	.string	""
	.section	.rodata.str1.8
	.align 8
.LC80:
	.string	"Expect '(' after function name."
	.align 8
.LC81:
	.string	"Cannot have more than 255 parameters."
	.section	.rodata.str1.1
.LC82:
	.string	"Expect parameter name."
	.section	.rodata.str1.8
	.align 8
.LC83:
	.string	"Expect ')' after function parameters."
	.align 8
.LC84:
	.string	"Expect '{' before function body."
	.text
	.p2align 4
	.type	"function", @function
"function":
.LFB86:
	.cfi_startproc
	push	r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	ebx, edi	# type, type
# src/compiler.c:1095:     Compiler* compiler = malloc(sizeof(Compiler));
	mov	edi, 524832	#,
# src/compiler.c:1094: static void function(FunctionType type){
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 48
# src/compiler.c:1095:     Compiler* compiler = malloc(sizeof(Compiler));
	call	"malloc"@PLT	#
	mov	r12, rax	# compiler,
# src/compiler.c:239:     compiler->enclosing = current;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:240:     compiler->function = NULL;
	mov	QWORD PTR 8[r12], 0	# compiler_25->function,
# src/compiler.c:239:     compiler->enclosing = current;
	mov	QWORD PTR [r12], rax	# compiler_25->enclosing, current
# src/compiler.c:241:     compiler->type = type;
	mov	DWORD PTR 16[r12], ebx	# compiler_25->type, type
# src/compiler.c:242:     compiler->localCount = 0;
	mov	DWORD PTR 524312[r12], 0	# compiler_25->localCount,
# src/compiler.c:243:     compiler->scopeDepth = 0;
	mov	DWORD PTR 524828[r12], 0	# compiler_25->scopeDepth,
# src/compiler.c:244:     compiler->function = newFunction();
	call	"newFunction"@PLT	#
# src/compiler.c:249:         current->function->name = copyString(parser.previous.start, parser.previous.length);
	mov	esi, DWORD PTR "parser"[rip+40]	#, parser.previous.length
	mov	rdi, QWORD PTR "parser"[rip+32]	#, parser.previous.start
# src/compiler.c:246:     current = compiler;
	mov	QWORD PTR "current"[rip], r12	# current, compiler
# src/compiler.c:244:     compiler->function = newFunction();
	mov	QWORD PTR 8[r12], rax	# compiler_25->function, _71
# src/compiler.c:244:     compiler->function = newFunction();
	mov	rbp, rax	# _71,
# src/compiler.c:245:     compiler->function->arity = 0;
	mov	DWORD PTR 16[rax], 0	# _71->arity,
# src/compiler.c:249:         current->function->name = copyString(parser.previous.start, parser.previous.length);
	call	"copyString"@PLT	#
# src/compiler.c:252:     Local* local = &current->locals[current->localCount++];
	mov	rdx, QWORD PTR "current"[rip]	# current.60_75, current
# src/compiler.c:249:         current->function->name = copyString(parser.previous.start, parser.previous.length);
	mov	QWORD PTR 72[rbp], rax	# _71->name, _74
# src/compiler.c:252:     Local* local = &current->locals[current->localCount++];
	movsxd	rax, DWORD PTR 524312[rdx]	#, current.60_75->localCount
# src/compiler.c:252:     Local* local = &current->locals[current->localCount++];
	lea	ecx, 1[rax]	# tmp241,
	mov	DWORD PTR 524312[rdx], ecx	# current.60_75->localCount, tmp241
	mov	rcx, rax	# _261, _76
	sal	rcx, 5	# _261,
	add	rcx, rdx	# _262, current.60_75
# src/compiler.c:253:     local->depth = 0;
	mov	DWORD PTR 48[rcx], 0	# MEM <int> [(struct Local *)_262 + 48B],
# src/compiler.c:254:     local->isCaptured = false;
	mov	BYTE PTR 52[rcx], 0	# MEM <_Bool> [(struct Local *)_262 + 52B],
# src/compiler.c:256:     if (type != TYPE_FUNCTION) {
	test	ebx, ebx	# type
	je	.L1018	#,
# src/compiler.c:257:         local->name.start = "this";
	lea	rdi, .LC33[rip]	# cstore_78,
# src/compiler.c:258:         local->name.length = 4;
	mov	esi, 4	# cstore_79,
.L999:
	sal	rax, 5	# tmp245,
	mov	QWORD PTR 32[rdx+rax], rdi	# MEM <struct Compiler> [(struct Local *)current.60_75].locals[_76].name.start, cstore_78
# src/compiler.c:1099:     consume(TOKEN_LEFT_PAREN, "Expect '(' after function name.");
	xor	edi, edi	#
	mov	DWORD PTR 40[rcx], esi	# MEM <int> [(struct Local *)_262 + 40B], cstore_79
	lea	rsi, .LC80[rip]	#,
# src/compiler.c:288:     current->scopeDepth++;
	add	DWORD PTR 524828[rdx], 1	# current.60_75->scopeDepth,
# src/compiler.c:1099:     consume(TOKEN_LEFT_PAREN, "Expect '(' after function name.");
	call	"consume"	#
# src/compiler.c:1100:     if (!check(TOKEN_RIGHT_PAREN)) {
	cmp	DWORD PTR "parser"[rip], 1	# parser.current.type,
	je	.L1000	#,
	lea	rbx, "parser"[rip]	# tmp386,
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	movabs	r13, -1125899906842624	# tmp394,
.L1008:
# src/compiler.c:1102:             current->function->arity++;
	mov	rax, QWORD PTR "current"[rip]	# current, current
	mov	rdx, QWORD PTR 8[rax]	# _2, current.77_1->function
# src/compiler.c:1102:             current->function->arity++;
	mov	eax, DWORD PTR 16[rdx]	# tmp406, _2->arity
	add	eax, 1	# _4,
	mov	DWORD PTR 16[rdx], eax	# _2->arity, _4
# src/compiler.c:1103:             if (current->function->arity > 255) {
	cmp	eax, 255	# _4,
	jle	.L1001	#,
# src/compiler.c:126:     if (parser.panicMode) return;
	cmp	BYTE PTR 49[rbx], 0	# parser.panicMode,
	jne	.L1001	#,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, DWORD PTR 20[rbx]	# parser.line, parser.line
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
# src/compiler.c:127:     parser.panicMode = true;
	mov	BYTE PTR "parser"[rip+49], 1	# parser.panicMode,
# src/compiler.c:128:     fprintf(stderr, "[line %04d] Error", token->line);
	call	"fprintf"@PLT	#
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	mov	eax, DWORD PTR [rbx]	# _82, parser.type
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
# src/compiler.c:130:     if (token->type == TOKEN_EOF) {
	cmp	eax, 65	# _82,
	je	.L1036	#,
# src/compiler.c:132:     } else if (token->type == TOKEN_ERROR) {
	cmp	eax, 64	# _82,
	je	.L1003	#,
# src/compiler.c:134:         fprintf(stderr, " at '%.*s'", token->length, token->start);
	mov	rcx, QWORD PTR 8[rbx]	# parser.start, parser.start
	mov	edx, DWORD PTR 16[rbx]	# parser.length, parser.length
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
.L1003:
# src/compiler.c:137:     fprintf(stderr, ": %s\n", message);
	lea	rdx, .LC81[rip]	#,
	lea	rsi, .LC3[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/compiler.c:138:     parser.hadError = true;
	mov	BYTE PTR "parser"[rip+48], 1	# parser.hadError,
.L1001:
# src/compiler.c:1009:     consume(TOKEN_IDENTIFIER, errorMessage);
	lea	rsi, .LC82[rip]	#,
	mov	edi, 37	#,
	call	"consume"	#
# src/compiler.c:1011:     declareVariable();
	call	"declareVariable"	#
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	mov	rax, QWORD PTR "current"[rip]	# current.80_93, current
	mov	ecx, DWORD PTR 524828[rax]	# _94, current.80_93->scopeDepth
# src/compiler.c:1012:     if (current->scopeDepth > 0) return 0;
	test	ecx, ecx	# _94
	jle	.L1037	#,
.L1004:
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	mov	esi, DWORD PTR 524312[rax]	# tmp408, current.72_97->localCount
	lea	edx, -1[rsi]	# _91,
# src/compiler.c:1020:     current->locals[current->localCount - 1].depth = current->scopeDepth;
	movsxd	rdx, edx	# _91, _91
	sal	rdx, 5	# tmp283,
	mov	DWORD PTR 48[rdx+rax], ecx	# current.72_97->locals[_91].depth, _94
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR [rbx], 6	# parser.current.type,
	je	.L1038	#,
.L1000:
# src/compiler.c:1110:     consume(TOKEN_RIGHT_PAREN, "Expect ')' after function parameters.");
	lea	rsi, .LC83[rip]	#,
	mov	edi, 1	#,
	call	"consume"	#
# src/compiler.c:1111:     consume(TOKEN_LEFT_BRACE, "Expect '{' before function body.");
	lea	rsi, .LC84[rip]	#,
	mov	edi, 4	#,
	call	"consume"	#
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR "parser"[rip]	# _184, parser.current.type
# src/compiler.c:1087:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 65	# _184,
	je	.L1009	#,
	cmp	eax, 5	# _184,
	je	.L1009	#,
	lea	rbx, "parser"[rip]	# tmp386,
	jmp	.L1010	#
	.p2align 4,,10
	.p2align 3
.L1039:
	cmp	eax, 5	# _148,
	je	.L1009	#,
.L1010:
# src/compiler.c:1088:         declaration();
	call	"declaration"	#
# src/compiler.c:170:     return parser.current.type == type;
	mov	eax, DWORD PTR [rbx]	# _148, parser.current.type
# src/compiler.c:1087:     while (!check(TOKEN_RIGHT_BRACE) && !check(TOKEN_EOF)) {
	cmp	eax, 65	# _148,
	jne	.L1039	#,
.L1009:
# src/compiler.c:1091:     consume(TOKEN_RIGHT_BRACE, "Expect '}' after block.");
	mov	edi, 5	#,
	lea	rsi, .LC65[rip]	#,
	call	"consume"	#
# src/compiler.c:212:     if (current->type == TYPE_INITIALIZER) {
	mov	rax, QWORD PTR "current"[rip]	# current.114_139, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_252, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rcx, QWORD PTR 8[rax]	# tmp410, current.114_139->function
	lea	rdi, 24[rcx]	# _254,
# src/compiler.c:212:     if (current->type == TYPE_INITIALIZER) {
	cmp	DWORD PTR 16[rax], 1	# current.114_139->type,
	je	.L1040	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 2	#,
	call	"writeChunk"@PLT	#
.L1013:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 62	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_145->function, current.7_145->function
	add	rdi, 24	# _147,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:267:     ObjFunction* function = current->function;
	mov	rax, QWORD PTR "current"[rip]	# current.122_50, current
# src/compiler.c:1115:     int index = makeConstant(OBJ_VAL(function));
	movabs	rsi, -1125899906842624	# tmp341,
# src/compiler.c:267:     ObjFunction* function = current->function;
	mov	r13, QWORD PTR 8[rax]	# function, current.122_50->function
# src/compiler.c:283:     current = current->enclosing;
	mov	rax, QWORD PTR [rax]	# _52, current.122_50->enclosing
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# MEM[(struct Compiler *)_52].function, MEM[(struct Compiler *)_52].function
# src/compiler.c:1115:     int index = makeConstant(OBJ_VAL(function));
	or	rsi, r13	# _6, function
# src/compiler.c:283:     current = current->enclosing;
	mov	QWORD PTR "current"[rip], rax	# current, _52
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _48,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_248, parser.previous.line
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	mov	ebx, eax	# _49,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# pretmp_249->function, pretmp_249->function
	add	rdi, 24	# _251,
# src/compiler.c:1116:     if (index <= 255) {
	cmp	ebx, 255	# _49,
	jg	.L1014	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 57	#,
	call	"writeChunk"@PLT	#
.L1035:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _8, _8
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_178->function,
	add	rdi, 24	# _180,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1126:     for (int i = 0; i < function->upvalueCount; i++) {
	mov	eax, DWORD PTR 20[r13]	#, function_51->upvalueCount
	test	eax, eax	#
	jle	.L1016	#,
	xor	ebp, ebp	# ivtmp.548
	lea	rbx, "parser"[rip]	# tmp386,
	.p2align 4
	.p2align 3
.L1017:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
	movzx	esi, BYTE PTR 524317[r12+rbp*2]	# MEM[(_Bool *)compiler_25 + 524317B + ivtmp.548_21 * 2], MEM[(_Bool *)compiler_25 + 524317B + ivtmp.548_21 * 2]
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_58->function, current.7_58->function
	add	rdi, 24	# _60,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
	movzx	esi, BYTE PTR 524316[r12+rbp*2]	# MEM[(unsigned char *)compiler_25 + 524316B + ivtmp.548_21 * 2], MEM[(unsigned char *)compiler_25 + 524316B + ivtmp.548_21 * 2]
# src/compiler.c:1126:     for (int i = 0; i < function->upvalueCount; i++) {
	add	rbp, 1	# ivtmp.548,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_54->function, current.7_54->function
	add	rdi, 24	# _56,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:1126:     for (int i = 0; i < function->upvalueCount; i++) {
	cmp	DWORD PTR 20[r13], ebp	# function_51->upvalueCount, ivtmp.548
	jg	.L1017	#,
.L1016:
# src/compiler.c:1132: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
# src/compiler.c:1131:     free(compiler);
	mov	rdi, r12	#, compiler
# src/compiler.c:1132: }
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
# src/compiler.c:1131:     free(compiler);
	jmp	"free"@PLT	#
	.p2align 4,,10
	.p2align 3
.L1037:
	.cfi_restore_state
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	mov	esi, DWORD PTR 40[rbx]	# MEM[(int *)&parser + 40B], MEM[(int *)&parser + 40B]
	mov	rdi, QWORD PTR 32[rbx]	# MEM[(const char * *)&parser + 32B], MEM[(const char * *)&parser + 32B]
	call	"copyString"@PLT	#
# src/compiler.c:912:     return makeConstant(OBJ_VAL(copyString(name->start, name->length)));
	or	rax, r13	# _103, tmp394
	mov	rsi, rax	# _105, _103
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_106->function, current.7_106->function
	add	rdi, 24	# _108,
# src/compiler.c:220:     return addConstant(currentChunk(), value);
	call	"addConstant"@PLT	#
	mov	ebp, eax	# _109,
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	mov	rax, QWORD PTR "current"[rip]	# current.80_93, current
	mov	ecx, DWORD PTR 524828[rax]	# _94, current.72_88->scopeDepth
# src/compiler.c:1024:     if (current->scopeDepth > 0) {
	test	ecx, ecx	# _94
	jg	.L1004	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.72_88->function, current.72_88->function
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# pretmp_256, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	add	rdi, 24	# _258,
# src/compiler.c:1029:     if (global <= UINT8_MAX) {
	cmp	ebp, 255	# _109,
	jle	.L1041	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 13	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
	movzx	esi, bpl	# _255, _109
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_128->function, current.7_128->function
	add	rdi, 24	# _130,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	eax, ebp	# _109, _109
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
# src/compiler.c:1036:             (uint8_t) ((global >> 16) & 0xff)
	sar	ebp, 16	# _118,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, ah	# _120, _109
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_132->function, current.7_132->function
	add	rdi, 24	# _134,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
.L1034:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	movzx	esi, bpl	# _118, _118
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_136->function,
	add	rdi, 24	# _138,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR [rbx], 6	# parser.current.type,
	jne	.L1000	#,
.L1038:
# src/compiler.c:175:     advance();
	call	"advance"	#
	jmp	.L1008	#
	.p2align 4,,10
	.p2align 3
.L1041:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 12	#,
	call	"writeChunk"@PLT	#
	mov	edx, DWORD PTR 44[rbx]	# parser.previous.line, parser.previous.line
	jmp	.L1034	#
	.p2align 4,,10
	.p2align 3
.L1014:
	mov	esi, 58	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bl	# _247, _49
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_170->function, current.7_170->function
	add	rdi, 24	# _172,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	movzx	esi, bh	# _10, _49
# src/compiler.c:1122:             (uint8_t) ((index >> 16) & 0xff)
	sar	ebx, 16	# _8,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_174->function, current.7_174->function
	add	rdi, 24	# _176,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L1035	#
	.p2align 4,,10
	.p2align 3
.L1018:
# src/compiler.c:260:         local->name.start = "";
	lea	rdi, .LC79[rip]	# cstore_78,
# src/compiler.c:261:         local->name.length = 0;
	xor	esi, esi	# cstore_79
	jmp	.L999	#
	.p2align 4,,10
	.p2align 3
.L1040:
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 6	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	xor	esi, esi	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_154->function, current.7_154->function
	add	rdi, 24	# _156,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L1013	#
	.p2align 4,,10
	.p2align 3
.L1036:
# src/compiler.c:131:         fprintf(stderr, " at end");
	mov	rcx, rdi	#, stderr
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
	call	"fwrite"@PLT	#
	mov	rdi, QWORD PTR "stderr"[rip]	# stderr, stderr
	jmp	.L1003	#
	.cfi_endproc
.LFE86:
	.size	"function", .-"function"
	.p2align 4
	.globl	"compile"
	.type	"compile", @function
"compile":
.LFB105:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:1636:     initScanner(source);
	call	"initScanner"@PLT	#
# src/compiler.c:1638:     Compiler* compiler = malloc(sizeof(Compiler));
	mov	edi, 524832	#,
# src/compiler.c:1637:     currentTryDepth = 0;
	mov	DWORD PTR "currentTryDepth"[rip], 0	# currentTryDepth,
# src/compiler.c:1638:     Compiler* compiler = malloc(sizeof(Compiler));
	call	"malloc"@PLT	#
	mov	rbx, rax	# tmp161,
# src/compiler.c:239:     compiler->enclosing = current;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:240:     compiler->function = NULL;
	mov	QWORD PTR 8[rbx], 0	# compiler_9->function,
# src/compiler.c:239:     compiler->enclosing = current;
	mov	QWORD PTR [rbx], rax	# compiler_9->enclosing, current
# src/compiler.c:241:     compiler->type = type;
	mov	DWORD PTR 16[rbx], 3	# compiler_9->type,
# src/compiler.c:242:     compiler->localCount = 0;
	mov	DWORD PTR 524312[rbx], 0	# compiler_9->localCount,
# src/compiler.c:243:     compiler->scopeDepth = 0;
	mov	DWORD PTR 524828[rbx], 0	# compiler_9->scopeDepth,
# src/compiler.c:244:     compiler->function = newFunction();
	call	"newFunction"@PLT	#
# src/compiler.c:246:     current = compiler;
	mov	QWORD PTR "current"[rip], rbx	# current, tmp161
# src/compiler.c:1640:     initTable(&compileTimeConsts);
	lea	rdi, "compileTimeConsts"[rip]	#,
# src/compiler.c:244:     compiler->function = newFunction();
	mov	QWORD PTR 8[rbx], rax	# compiler_9->function, _25
# src/compiler.c:245:     compiler->function->arity = 0;
	mov	DWORD PTR 16[rax], 0	# _25->arity,
# src/compiler.c:252:     Local* local = &current->locals[current->localCount++];
	movsxd	rax, DWORD PTR 524312[rbx]	#, compiler_9->localCount
# src/compiler.c:252:     Local* local = &current->locals[current->localCount++];
	lea	edx, 1[rax]	# tmp128,
	sal	rax, 5	# _13,
	mov	DWORD PTR 524312[rbx], edx	# compiler_9->localCount, tmp128
	add	rbx, rax	# _12, _13
	lea	rax, .LC33[rip]	# tmp164,
	mov	QWORD PTR 32[rbx], rax	# MEM <struct Compiler> [(struct Local *)compiler_9].locals[_30].name.start, tmp164
# src/compiler.c:253:     local->depth = 0;
	mov	DWORD PTR 48[rbx], 0	# MEM <int> [(struct Local *)_12 + 48B],
# src/compiler.c:254:     local->isCaptured = false;
	mov	BYTE PTR 52[rbx], 0	# MEM <_Bool> [(struct Local *)_12 + 52B],
	mov	DWORD PTR 40[rbx], 4	# MEM <int> [(struct Local *)_12 + 40B],
# src/compiler.c:1640:     initTable(&compileTimeConsts);
	call	"initTable"@PLT	#
# src/compiler.c:1642:     parser.hadError = false;
	xor	eax, eax	#
	mov	WORD PTR "parser"[rip+48], ax	# MEM <vector(2) unsigned char> [(_Bool *)&parser + 48B],
# src/compiler.c:1645:     advance();
	call	"advance"	#
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR "parser"[rip], 65	# parser.current.type,
	je	.L1043	#,
	lea	rbx, "parser"[rip]	# tmp158,
.L1044:
# src/compiler.c:1648:         declaration();
	call	"declaration"	#
# src/compiler.c:174:     if (!check(type)) return false;
	cmp	DWORD PTR [rbx], 65	# parser.current.type,
	jne	.L1044	#,
.L1043:
# src/compiler.c:175:     advance();
	call	"advance"	#
# src/compiler.c:212:     if (current->type == TYPE_INITIALIZER) {
	mov	rax, QWORD PTR "current"[rip]	# current.114_34, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	# pretmp_27, parser.previous.line
# src/compiler.c:122:     return &current->function->chunk;
	mov	rcx, QWORD PTR 8[rax]	# tmp165, current.114_34->function
	lea	rdi, 24[rcx]	# _10,
# src/compiler.c:212:     if (current->type == TYPE_INITIALIZER) {
	cmp	DWORD PTR 16[rax], 1	# current.114_34->type,
	je	.L1050	#,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 2	#,
	call	"writeChunk"@PLT	#
.L1046:
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	mov	esi, 62	#,
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_40->function, current.7_40->function
	add	rdi, 24	# _42,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
# src/compiler.c:267:     ObjFunction* function = current->function;
	mov	rax, QWORD PTR "current"[rip]	# current.122_18, current
# src/compiler.c:1652:     freeTable(&compileTimeConsts);
	lea	rdi, "compileTimeConsts"[rip]	#,
# src/compiler.c:267:     ObjFunction* function = current->function;
	mov	rbx, QWORD PTR 8[rax]	# <retval>, current.122_18->function
# src/compiler.c:283:     current = current->enclosing;
	mov	rax, QWORD PTR [rax]	# current.122_18->enclosing, current.122_18->enclosing
	mov	QWORD PTR "current"[rip], rax	# current, current.122_18->enclosing
# src/compiler.c:1652:     freeTable(&compileTimeConsts);
	call	"freeTable"@PLT	#
# src/compiler.c:1653:     return parser.hadError ? NULL : function;
	xor	eax, eax	# tmp159
	cmp	BYTE PTR "parser"[rip+48], 0	# parser.hadError,
# src/compiler.c:1654: }
	cmove	rax, rbx	# <retval>,,
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L1050:
	.cfi_restore_state
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	esi, 6	#,
	call	"writeChunk"@PLT	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rax, QWORD PTR "current"[rip]	# current, current
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	mov	edx, DWORD PTR "parser"[rip+44]	#, parser.previous.line
	xor	esi, esi	#
# src/compiler.c:122:     return &current->function->chunk;
	mov	rdi, QWORD PTR 8[rax]	# current.7_48->function, current.7_48->function
	add	rdi, 24	# _50,
# src/compiler.c:180:     writeChunk(currentChunk(), byte, parser.previous.line);
	call	"writeChunk"@PLT	#
	jmp	.L1046	#
	.cfi_endproc
.LFE105:
	.size	"compile", .-"compile"
	.p2align 4
	.globl	"markCompilerRoots"
	.type	"markCompilerRoots", @function
"markCompilerRoots":
.LFB106:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/compiler.c:1657:     Compiler* compiler = current;
	mov	rbx, QWORD PTR "current"[rip]	# compiler, current
# src/compiler.c:1658:     while (compiler != NULL) {
	test	rbx, rbx	# compiler
	je	.L1052	#,
	.p2align 4
	.p2align 3
.L1053:
# src/compiler.c:1659:         markObject((Obj*) compiler->function);
	mov	rdi, QWORD PTR 8[rbx]	# compiler_11->function, compiler_11->function
	call	"markObject"@PLT	#
# src/compiler.c:1660:         compiler = compiler->enclosing;
	mov	rbx, QWORD PTR [rbx]	# compiler, compiler_11->enclosing
# src/compiler.c:1658:     while (compiler != NULL) {
	test	rbx, rbx	# compiler
	jne	.L1053	#,
.L1052:
# src/compiler.c:1663:     markTable(&compileTimeConsts);
	lea	rdi, "compileTimeConsts"[rip]	#,
# src/compiler.c:1665: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/compiler.c:1663:     markTable(&compileTimeConsts);
	jmp	"markTable"@PLT	#
	.cfi_endproc
.LFE106:
	.size	"markCompilerRoots", .-"markCompilerRoots"
	.globl	"rules"
	.section	.data.rel.local,"aw"
	.align 32
	.type	"rules", @object
	.size	"rules", 1584
"rules":
# prefix:
	.quad	"grouping"
# infix:
	.quad	"call"
# precedence:
	.long	14
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
	.quad	"index_"
# precedence:
	.long	14
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	"arrLit"
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
	.quad	"dot"
# precedence:
	.long	14
	.zero	4
# prefix:
	.quad	"unary"
# infix:
	.quad	"binary"
# precedence:
	.long	11
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	11
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"ternary"
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
	.quad	"binary"
# precedence:
	.long	12
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	12
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	12
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	7
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	5
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	6
	.zero	4
# prefix:
	.quad	"unary"
# infix:
	.quad	0
# precedence:
	.long	13
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	10
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	10
	.zero	4
	.zero	96
# prefix:
	.quad	"preInc"
# infix:
	.quad	0
# precedence:
	.long	14
	.zero	4
# prefix:
	.quad	"preDec"
# infix:
	.quad	0
# precedence:
	.long	14
	.zero	4
# prefix:
	.quad	"unary"
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	8
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
	.quad	"binary"
# precedence:
	.long	8
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	9
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	9
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	9
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"binary"
# precedence:
	.long	9
	.zero	4
	.zero	24
# prefix:
	.quad	"variable"
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	"string"
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	"number"
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"and_"
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
	.quad	0
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	"literal"
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
	.quad	"literal"
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	0
# infix:
	.quad	"or_"
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
	.quad	"super_"
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
	.quad	"this_"
# infix:
	.quad	0
# precedence:
	.long	0
	.zero	4
# prefix:
	.quad	"literal"
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
	.globl	"currentTryDepth"
	.bss
	.align 4
	.type	"currentTryDepth", @object
	.size	"currentTryDepth", 4
"currentTryDepth":
	.zero	4
	.globl	"currentLoop"
	.align 8
	.type	"currentLoop", @object
	.size	"currentLoop", 8
"currentLoop":
	.zero	8
	.globl	"compilingChunk"
	.align 8
	.type	"compilingChunk", @object
	.size	"compilingChunk", 8
"compilingChunk":
	.zero	8
	.globl	"currentClass"
	.align 8
	.type	"currentClass", @object
	.size	"currentClass", 8
"currentClass":
	.zero	8
	.globl	"current"
	.align 8
	.type	"current", @object
	.size	"current", 8
"current":
	.zero	8
	.globl	"parser"
	.align 32
	.type	"parser", @object
	.size	"parser", 56
"parser":
	.zero	56
	.local	"compileTimeConsts"
	.comm	"compileTimeConsts",24,16
	.local	"lastExpr"
	.comm	"lastExpr",24,16
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC11:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
