	.file	"scanner.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=48 --param=l1-cache-line-size=64 --param=l2-cache-size=12288 -mtune=arrowlake-s -masm=intel -O3
	.text
	.p2align 4
	.globl	initScanner
	.type	initScanner, @function
initScanner:
.LFB11:
	.cfi_startproc
# src/scanner.c:16:     scanner.start = source;
	vmovq	xmm1, rdi	# source, source
	vpunpcklqdq	xmm0, xmm1, xmm1	# _7, source
# src/scanner.c:18:     scanner.line = 1;
	mov	DWORD PTR scanner[rip+16], 1	# scanner.line,
# src/scanner.c:16:     scanner.start = source;
	vmovdqa	XMMWORD PTR scanner[rip], xmm0	# MEM <vector(2) long unsigned int> [(const char * *)&scanner], _7
# src/scanner.c:19: }
	ret	
	.cfi_endproc
.LFE11:
	.size	initScanner, .-initScanner
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Unexpected character."
.LC1:
	.string	"Unterminated string."
.LC2:
	.string	"ass"
.LC3:
	.string	"ecl"
.LC4:
	.string	"lse"
.LC5:
	.string	"ull"
.LC6:
	.string	"eturn"
.LC7:
	.string	"per"
	.text
	.p2align 4
	.globl	scanToken
	.type	scanToken, @function
scanToken:
.LFB27:
	.cfi_startproc
# src/scanner.c:41:     return *scanner.current;
	mov	rcx, QWORD PTR scanner[rip+8]	# prephitmp_357, scanner.current
# src/scanner.c:84:                 scanner.line++;
	mov	r9d, DWORD PTR scanner[rip+16]	# prephitmp_363, scanner.line
# src/scanner.c:41:     return *scanner.current;
	movzx	eax, BYTE PTR [rcx]	# prephitmp_360, *pretmp_403
# src/scanner.c:196: Token scanToken() {
	mov	r8, rdi	# .result_ptr, .result_ptr
# src/scanner.c:77:         switch(c) {
	lea	rsi, .L7[rip]	# tmp338,
.L4:
	sub	eax, 9	# tmp200,
	cmp	al, 38	# tmp200,
	ja	.L5	#,
	movzx	eax, al	# tmp201, tmp200
	movsxd	rax, DWORD PTR [rsi+rax*4]	# tmp204,
	add	rax, rsi	# tmp205, tmp338
	jmp	rax	# tmp205
	.section	.rodata
	.align 4
	.align 4
.L7:
	.long	.L173-.L7
	.long	.L9-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L173-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L173-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L6-.L7
	.text
	.p2align 4,,10
	.p2align 3
.L5:
# src/scanner.c:198:     scanner.start = scanner.current;
	mov	QWORD PTR scanner[rip], rcx	# scanner.start, prephitmp_357
# src/scanner.c:200:     if (isAtEnd()) return makeToken(TOKEN_EOF);
	cmp	BYTE PTR [rcx], 0	# *prephitmp_404,
	je	.L100	#,
# src/scanner.c:36:     scanner.current++;
	lea	r10, 1[rcx]	# _243,
	mov	QWORD PTR scanner[rip+8], r10	# scanner.current, _243
# src/scanner.c:37:     return scanner.current[-1];
	movzx	eax, BYTE PTR [rcx]	# _29, *prephitmp_404
	lea	edx, -65[rax]	# _170,
	cmp	dl, 57	# _170,
	ja	.L14	#,
	movabs	rdi, 288230372997595135	# tmp219,
	bt	rdi, rdx	# tmp219, _170
	mov	rax, r10	# _189, _243
	jc	.L15	#,
	jmp	.L65	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L175:
	bt	rdi, rsi	# tmp219, _104
	jnc	.L21	#,
.L20:
# src/scanner.c:36:     scanner.current++;
	add	rax, 1	# _189,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, _189
.L15:
# src/scanner.c:22:     return (c >= 'a' && c <= 'z') ||
	movzx	edx, BYTE PTR [rax]	# c.9_191, MEM[(const char *)prephitmp_399]
	lea	esi, -65[rdx]	# _104,
	cmp	sil, 57	# _104,
	jbe	.L175	#,
# src/scanner.c:28:     return c >= '0' && c <= '9';
	sub	edx, 48	# _192,
# src/scanner.c:167:     while (isAlpha(peek()) || isDigit(peek())) advance();
	cmp	dl, 9	# _192,
	jbe	.L20	#,
	.p2align 4,,10
	.p2align 3
.L21:
# src/scanner.c:109:     switch (scanner.start[0]) {
	movzx	edi, BYTE PTR [rcx]	# tmp372, *prephitmp_404
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	sub	rax, rcx	# _410, prephitmp_357
# src/scanner.c:109:     switch (scanner.start[0]) {
	lea	edx, -97[rdi]	# tmp229,
	cmp	dl, 22	# tmp229,
	ja	.L102	#,
	lea	rsi, .L24[rip]	# tmp232,
	movzx	edx, dl	# tmp231, tmp229
	movsxd	rdx, DWORD PTR [rsi+rdx*4]	# tmp234,
	add	rdx, rsi	# tmp235, tmp232
	jmp	rdx	# tmp235
	.section	.rodata
	.align 4
	.align 4
.L24:
	.long	.L37-.L24
	.long	.L36-.L24
	.long	.L35-.L24
	.long	.L34-.L24
	.long	.L33-.L24
	.long	.L32-.L24
	.long	.L102-.L24
	.long	.L102-.L24
	.long	.L31-.L24
	.long	.L102-.L24
	.long	.L102-.L24
	.long	.L102-.L24
	.long	.L102-.L24
	.long	.L30-.L24
	.long	.L29-.L24
	.long	.L28-.L24
	.long	.L102-.L24
	.long	.L27-.L24
	.long	.L26-.L24
	.long	.L25-.L24
	.long	.L102-.L24
	.long	.L102-.L24
	.long	.L23-.L24
	.text
	.p2align 4,,10
	.p2align 3
.L9:
# src/scanner.c:84:                 scanner.line++;
	add	r9d, 1	# prephitmp_363,
	mov	DWORD PTR scanner[rip+16], r9d	# scanner.line, prephitmp_363
.L173:
# src/scanner.c:36:     scanner.current++;
	lea	rdx, 1[rcx]	# _183,
	mov	QWORD PTR scanner[rip+8], rdx	# scanner.current, _183
# src/scanner.c:41:     return *scanner.current;
	movzx	eax, BYTE PTR 1[rcx]	# prephitmp_360, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:37:     return scanner.current[-1];
	mov	rcx, rdx	# prephitmp_357, _183
	jmp	.L4	#
	.p2align 4,,10
	.p2align 3
.L6:
# src/scanner.c:88:                 if (peekNext() == '/') {
	cmp	BYTE PTR 1[rcx], 47	# MEM[(const char *)prephitmp_404 + 1B],
	jne	.L5	#,
	lea	rdx, 1[rcx]	# ivtmp.74,
	jmp	.L11	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L176:
# src/scanner.c:89:                     while (peek() != '\n' && !isAtEnd()) advance();
	test	al, al	# prephitmp_360
	je	.L4	#,
.L11:
# src/scanner.c:36:     scanner.current++;
	mov	QWORD PTR scanner[rip+8], rdx	# scanner.current, ivtmp.74
	mov	rcx, rdx	# prephitmp_357, ivtmp.74
# src/scanner.c:89:                     while (peek() != '\n' && !isAtEnd()) advance();
	add	rdx, 1	# ivtmp.74,
# src/scanner.c:41:     return *scanner.current;
	movzx	eax, BYTE PTR -1[rdx]	# prephitmp_360, MEM[(const char *)_186]
# src/scanner.c:89:                     while (peek() != '\n' && !isAtEnd()) advance();
	cmp	al, 10	# prephitmp_360,
	jne	.L176	#,
	jmp	.L4	#
	.p2align 4,,10
	.p2align 3
.L100:
	mov	edx, 53	# _269,
	vpxor	xmm0, xmm0, xmm0	# _196
.L13:
# src/scanner.c:62:     return token;
	vpinsrd	xmm0, xmm0, r9d, 1	# _245, _196, prephitmp_363
	mov	DWORD PTR [r8], edx	# MEM <unsigned int> [(struct  *)&<retval>], _269
	mov	QWORD PTR 8[r8], rcx	# <retval>.start, prephitmp_357
	vmovq	QWORD PTR 16[r8], xmm0	# MEM <vector(2) int> [(int *)&<retval> + 16B], _245
# src/scanner.c:228: }
	mov	rax, r8	#, .result_ptr
	ret	
	.p2align 4,,10
	.p2align 3
.L65:
# src/scanner.c:206:     switch (c) {
	mov	eax, 21	# _196,
	mov	edx, 52	# _269,
	lea	rcx, .LC0[rip]	# prephitmp_357,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
	.p2align 4,,10
	.p2align 3
.L14:
# src/scanner.c:28:     return c >= '0' && c <= '9';
	lea	edx, -48[rax]	# _30,
# src/scanner.c:204: ;    if (isDigit(c)) return number();
	cmp	dl, 9	# _30,
	jbe	.L177	#,
# src/scanner.c:206:     switch (c) {
	sub	eax, 33	# tmp258,
	cmp	al, 92	# tmp258,
	ja	.L65	#,
	lea	rdx, .L67[rip]	# tmp260,
	movzx	eax, al	# tmp259, tmp258
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp262,
	add	rax, rdx	# tmp263, tmp260
	jmp	rax	# tmp263
	.section	.rodata
	.align 4
	.align 4
.L67:
	.long	.L83-.L67
	.long	.L82-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L149-.L67
	.long	.L81-.L67
	.long	.L80-.L67
	.long	.L79-.L67
	.long	.L78-.L67
	.long	.L77-.L67
	.long	.L76-.L67
	.long	.L75-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L74-.L67
	.long	.L73-.L67
	.long	.L72-.L67
	.long	.L71-.L67
	.long	.L70-.L67
	.long	.L69-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L65-.L67
	.long	.L68-.L67
	.long	.L65-.L67
	.long	.L66-.L67
	.text
.L30:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR [r10], 27765	# MEM <char[1:3]> [(void *)_28],
	jne	.L102	#,
	cmp	BYTE PTR 2[r10], 108	# MEM <char[1:3]> [(void *)_28],
# src/scanner.c:102:         return type;
	mov	edx, 43	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	je	.L174	#,
	.p2align 4,,10
	.p2align 3
.L102:
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
.L174:
# src/scanner.c:206:     switch (c) {
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L177:
# src/scanner.c:41:     return *scanner.current;
	movzx	eax, BYTE PTR 1[rcx]	# _240, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:28:     return c >= '0' && c <= '9';
	lea	edx, -48[rax]	# _193,
# src/scanner.c:172:     while (isDigit(peek())) advance();
	cmp	dl, 9	# _193,
	ja	.L18	#,
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L17:
# src/scanner.c:36:     scanner.current++;
	add	r10, 1	# _243,
	mov	QWORD PTR scanner[rip+8], r10	# scanner.current, _243
# src/scanner.c:41:     return *scanner.current;
	movzx	eax, BYTE PTR [r10]	# _240, MEM[(const char *)_281]
# src/scanner.c:28:     return c >= '0' && c <= '9';
	lea	edx, -48[rax]	# _284,
# src/scanner.c:172:     while (isDigit(peek())) advance();
	cmp	dl, 9	# _284,
	jbe	.L17	#,
.L18:
# src/scanner.c:174:     if (peek() == '.' && isDigit(peekNext())) {
	cmp	al, 46	# _240,
	je	.L178	#,
.L63:
# src/scanner.c:60:     token.length = (int) (scanner.current - scanner.start);
	mov	eax, r10d	# _196, _243
	sub	eax, ecx	# _196, prephitmp_357
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:180:     return makeToken(TOKEN_NUMBER);
	mov	edx, 29	# _269,
	jmp	.L13	#
.L178:
# src/scanner.c:28:     return c >= '0' && c <= '9';
	movzx	eax, BYTE PTR 1[r10]	# tmp373, MEM[(const char *)prephitmp_396 + 1B]
	sub	eax, 48	# _287,
# src/scanner.c:174:     if (peek() == '.' && isDigit(peekNext())) {
	cmp	al, 9	# _287,
	ja	.L63	#,
# src/scanner.c:36:     scanner.current++;
	lea	rax, 1[r10]	# _288,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, _288
# src/scanner.c:28:     return c >= '0' && c <= '9';
	movzx	edx, BYTE PTR 1[r10]	# MEM[(const char *)prephitmp_396 + 1B], MEM[(const char *)prephitmp_396 + 1B]
# src/scanner.c:41:     return *scanner.current;
	mov	r10, rax	# _243, _288
# src/scanner.c:28:     return c >= '0' && c <= '9';
	sub	edx, 48	# _276,
# src/scanner.c:177:         while (isDigit(peek())) advance();
	cmp	dl, 9	# _276,
	ja	.L63	#,
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L64:
# src/scanner.c:36:     scanner.current++;
	add	r10, 1	# _243,
	mov	QWORD PTR scanner[rip+8], r10	# scanner.current, _243
# src/scanner.c:28:     return c >= '0' && c <= '9';
	movzx	eax, BYTE PTR [r10]	# tmp374, MEM[(const char *)_290]
	sub	eax, 48	# _293,
# src/scanner.c:177:         while (isDigit(peek())) advance();
	cmp	al, 9	# _293,
	jbe	.L64	#,
	jmp	.L63	#
.L37:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 3	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	xor	edx, edx	# _269
	cmp	WORD PTR 1[rcx], 25710	# MEM <unsigned short> [(char * {ref-all})prephitmp_404 + 1B],
	sete	dl	#, _269
	lea	edx, 27[rdx+rdx*2]	# _269,
	jmp	.L174	#
.L36:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	xor	edx, edx	# _269
	cmp	DWORD PTR 1[rcx], 1801545074	# MEM <unsigned int> [(char * {ref-all})prephitmp_404 + 1B],
	sete	dl	#, _269
	lea	edx, 27[0+rdx*4]	# _269,
	jmp	.L174	#
.L35:
# src/scanner.c:113:             if (scanner.current - scanner.start > 1) {
	cmp	rax, 1	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:113:             if (scanner.current - scanner.start > 1) {
	jle	.L174	#,
# src/scanner.c:114:                 switch (scanner.start[1]) {
	movzx	esi, BYTE PTR 1[rcx]	# _210, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:114:                 switch (scanner.start[1]) {
	cmp	sil, 108	# _210,
	je	.L38	#,
	cmp	sil, 111	# _210,
	jne	.L174	#,
# src/scanner.c:117:                         if (scanner.current - scanner.start > 3 && scanner.start[2] == 'n') {
	cmp	rax, 3	# _410,
	jle	.L174	#,
# src/scanner.c:117:                         if (scanner.current - scanner.start > 3 && scanner.start[2] == 'n') {
	cmp	BYTE PTR 2[rcx], 110	# MEM[(const char *)prephitmp_404 + 2B],
	jne	.L174	#,
# src/scanner.c:118:                             switch (scanner.start[3]) {
	movzx	esi, BYTE PTR 3[rcx]	# _214, MEM[(const char *)prephitmp_404 + 3B]
# src/scanner.c:118:                             switch (scanner.start[3]) {
	cmp	sil, 115	# _214,
	je	.L42	#,
	cmp	sil, 116	# _214,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 8	# _410,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	DWORD PTR 4[rcx], 1702194793	# MEM <unsigned int> [(char * {ref-all})prephitmp_404 + 4B],
# src/scanner.c:102:         return type;
	mov	edx, 35	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L102	#,
	jmp	.L174	#
	.p2align 4,,10
	.p2align 3
.L34:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR [r10], 25445	# MEM <char[1:3]> [(void *)_28],
	jne	.L102	#,
	cmp	BYTE PTR 2[r10], 108	# MEM <char[1:3]> [(void *)_28],
# src/scanner.c:102:         return type;
	mov	edx, 36	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L102	#,
	jmp	.L174	#
	.p2align 4,,10
	.p2align 3
.L33:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR [r10], 29548	# MEM <char[1:3]> [(void *)_28],
	jne	.L102	#,
	cmp	BYTE PTR 2[r10], 101	# MEM <char[1:3]> [(void *)_28],
# src/scanner.c:102:         return type;
	mov	edx, 38	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L102	#,
	jmp	.L174	#
	.p2align 4,,10
	.p2align 3
.L32:
# src/scanner.c:130:             if (scanner.current - scanner.start == 2) {
	cmp	rax, 2	# _410,
	je	.L179	#,
# src/scanner.c:132:             } if (scanner.current - scanner.start > 1) {
	cmp	rax, 1	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:132:             } if (scanner.current - scanner.start > 1) {
	jle	.L174	#,
# src/scanner.c:133:                 switch (scanner.start[1]) {
	movzx	esi, BYTE PTR 1[rcx]	# _229, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:133:                 switch (scanner.start[1]) {
	cmp	sil, 97	# _229,
	je	.L49	#,
	cmp	sil, 111	# _229,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 3	# _410,
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 2[rcx], 114	# MEM[(const unsigned char * {ref-all})prephitmp_404 + 2B],
	mov	esi, 40	# tmp306,
	cmove	edx, esi	# tmp306,, _269
	jmp	.L174	#
	.p2align 4,,10
	.p2align 3
.L31:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 2	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 1[rcx], 102	# MEM[(const unsigned char * {ref-all})prephitmp_404 + 1B],
	mov	esi, 42	# tmp308,
	cmove	edx, esi	# tmp308,, _269
	jmp	.L174	#
.L29:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 2	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 1[rcx], 114	# MEM[(const unsigned char * {ref-all})prephitmp_404 + 1B],
	mov	esi, 44	# tmp310,
	cmove	edx, esi	# tmp310,, _269
	jmp	.L174	#
.L28:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	DWORD PTR 1[rcx], 1953393010	# MEM <unsigned int> [(char * {ref-all})prephitmp_404 + 1B],
	mov	esi, 45	# tmp312,
	cmove	edx, esi	# tmp312,, _269
	jmp	.L174	#
.L27:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 6	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	DWORD PTR [r10], 1920300133	# MEM <char[1:5]> [(void *)_28],
	jne	.L102	#,
	cmp	BYTE PTR 4[r10], 110	# MEM <char[1:5]> [(void *)_28],
# src/scanner.c:102:         return type;
	mov	edx, 46	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L102	#,
	jmp	.L174	#
	.p2align 4,,10
	.p2align 3
.L26:
# src/scanner.c:145:             if (scanner.current - scanner.start > 1) {
	cmp	rax, 1	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:145:             if (scanner.current - scanner.start > 1) {
	jle	.L174	#,
# src/scanner.c:146:                 switch(scanner.start[1]) {
	movzx	esi, BYTE PTR 1[rcx]	# _253, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:146:                 switch(scanner.start[1]) {
	cmp	sil, 117	# _253,
	je	.L57	#,
	cmp	sil, 119	# _253,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 6	# _410,
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	DWORD PTR 2[rcx], 1751348329	# MEM <unsigned int> [(char * {ref-all})prephitmp_404 + 2B],
	mov	esi, 48	# tmp314,
	cmove	edx, esi	# tmp314,, _269
	jmp	.L174	#
.L25:
# src/scanner.c:153:             if (scanner.current - scanner.start > 1) {
	cmp	rax, 1	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:153:             if (scanner.current - scanner.start > 1) {
	jle	.L174	#,
# src/scanner.c:154:                 switch (scanner.start[1]) {
	movzx	esi, BYTE PTR 1[rcx]	# _260, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:154:                 switch (scanner.start[1]) {
	cmp	sil, 104	# _260,
	je	.L61	#,
	cmp	sil, 114	# _260,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _410,
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	WORD PTR 2[rcx], 25973	# MEM <unsigned short> [(char * {ref-all})prephitmp_404 + 2B],
	mov	esi, 50	# tmp318,
	cmove	edx, esi	# tmp318,, _269
	jmp	.L174	#
.L23:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _410,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	mov	edx, 27	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	DWORD PTR 1[rcx], 1701603688	# MEM <unsigned int> [(char * {ref-all})prephitmp_404 + 1B],
	mov	esi, 51	# tmp320,
	cmove	edx, esi	# tmp320,, _269
	jmp	.L174	#
.L66:
# src/scanner.c:62:     return token;
	mov	eax, 1	# _196,
	mov	edx, 3	# _269,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L68:
	mov	eax, 1	# _196,
	mov	edx, 2	# _269,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L69:
	mov	eax, 1	# _196,
	mov	edx, 9	# _269,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L70:
	mov	eax, 1	# _196,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rcx], 61	# MEM[(const char *)prephitmp_404 + 1B],
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:223:         case '>': return makeToken(match('=') ? TOKEN_GREATER_EQUAL : TOKEN_GREATER);
	mov	edx, 23	# _269,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	jne	.L13	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp284,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp284
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:223:         case '>': return makeToken(match('=') ? TOKEN_GREATER_EQUAL : TOKEN_GREATER);
	mov	edx, 24	# _269,
	jmp	.L13	#
.L71:
	mov	eax, 1	# _196,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rcx], 61	# MEM[(const char *)prephitmp_404 + 1B],
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:221:         case '=': return makeToken(match('=') ? TOKEN_EQUAL_EQUAL : TOKEN_EQUAL);
	mov	edx, 21	# _269,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	jne	.L13	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp280,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp280
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:221:         case '=': return makeToken(match('=') ? TOKEN_EQUAL_EQUAL : TOKEN_EQUAL);
	mov	edx, 22	# _269,
	jmp	.L13	#
.L72:
	mov	eax, 1	# _196,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rcx], 61	# MEM[(const char *)prephitmp_404 + 1B],
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:222:         case '<': return makeToken(match('=') ? TOKEN_LESS_EQUAL : TOKEN_LESS);
	mov	edx, 25	# _269,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	jne	.L13	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp282,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp282
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:222:         case '<': return makeToken(match('=') ? TOKEN_LESS_EQUAL : TOKEN_LESS);
	mov	edx, 26	# _269,
	jmp	.L13	#
.L73:
# src/scanner.c:62:     return token;
	mov	eax, 1	# _196,
	mov	edx, 10	# _269,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L74:
	mov	eax, 1	# _196,
	mov	edx, 5	# _269,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L75:
	mov	eax, 1	# _196,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rcx], 61	# MEM[(const char *)prephitmp_404 + 1B],
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:218:         case '/': return makeToken(match('=') ? TOKEN_SLASH_EQUAL : TOKEN_SLASH);
	mov	edx, 11	# _269,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	jne	.L13	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp274,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp274
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:218:         case '/': return makeToken(match('=') ? TOKEN_SLASH_EQUAL : TOKEN_SLASH);
	mov	edx, 15	# _269,
	jmp	.L13	#
.L76:
# src/scanner.c:62:     return token;
	mov	eax, 1	# _196,
	mov	edx, 6	# _269,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L77:
# src/scanner.c:32:     return *scanner.current == '\0';
	movzx	eax, BYTE PTR 1[rcx]	# _40, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:50:     if (isAtEnd()) return false;
	test	al, al	# _40
	je	.L151	#,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	al, 61	# _40,
	jne	.L87	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp266,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp266
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:216:         case '-': return makeToken(match('=') ? TOKEN_MINUS_EQUAL : match('-') ? TOKEN_MINUS_MINUS : TOKEN_MINUS);
	mov	edx, 13	# _269,
	jmp	.L13	#
.L78:
# src/scanner.c:62:     return token;
	mov	eax, 1	# _196,
	mov	edx, 4	# _269,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L79:
# src/scanner.c:32:     return *scanner.current == '\0';
	movzx	eax, BYTE PTR 1[rcx]	# _47, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:50:     if (isAtEnd()) return false;
	test	al, al	# _47
	je	.L153	#,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	al, 61	# _47,
	jne	.L89	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp270,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp270
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:217:         case '+': return makeToken(match('=') ? TOKEN_PLUS_EQUAL : match('+') ? TOKEN_PLUS_PLUS : TOKEN_PLUS);
	mov	edx, 14	# _269,
	jmp	.L13	#
.L80:
	mov	eax, 1	# _196,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rcx], 61	# MEM[(const char *)prephitmp_404 + 1B],
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:219:         case '*': return makeToken(match('=') ? TOKEN_STAR_EQUAL : TOKEN_STAR);
	mov	edx, 12	# _269,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	jne	.L13	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp276,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp276
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:219:         case '*': return makeToken(match('=') ? TOKEN_STAR_EQUAL : TOKEN_STAR);
	mov	edx, 16	# _269,
	jmp	.L13	#
.L82:
# src/scanner.c:41:     return *scanner.current;
	movzx	eax, BYTE PTR 1[rcx]	# _151, MEM[(const char *)prephitmp_404 + 1B]
# src/scanner.c:184:     while (peek() != '"' && !isAtEnd()) {
	cmp	al, 34	# _151,
	jne	.L84	#,
	jmp	.L85	#
	.p2align 4,,10
	.p2align 3
.L99:
# src/scanner.c:185:         if (peek() == '\n') scanner.line++;
	cmp	al, 10	# _151,
	jne	.L96	#,
# src/scanner.c:185:         if (peek() == '\n') scanner.line++;
	add	r9d, 1	# prephitmp_363,
	mov	DWORD PTR scanner[rip+16], r9d	# scanner.line, prephitmp_363
.L96:
# src/scanner.c:36:     scanner.current++;
	add	r10, 1	# _243,
	mov	QWORD PTR scanner[rip+8], r10	# scanner.current, _243
# src/scanner.c:41:     return *scanner.current;
	movzx	eax, BYTE PTR [r10]	# _151,* _243
# src/scanner.c:184:     while (peek() != '"' && !isAtEnd()) {
	cmp	al, 34	# _151,
	je	.L85	#,
.L84:
# src/scanner.c:184:     while (peek() != '"' && !isAtEnd()) {
	test	al, al	# _151
	jne	.L99	#,
	mov	eax, 20	# _196,
	mov	edx, 52	# _269,
	lea	rcx, .LC1[rip]	# prephitmp_357,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L83:
	mov	eax, 1	# _196,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rcx], 61	# MEM[(const char *)prephitmp_404 + 1B],
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:220:         case '!': return makeToken(match('=') ? TOKEN_BANG_EQUAL : TOKEN_BANG);
	mov	edx, 19	# _269,
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	jne	.L13	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp278,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp278
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:220:         case '!': return makeToken(match('=') ? TOKEN_BANG_EQUAL : TOKEN_BANG);
	mov	edx, 20	# _269,
	jmp	.L13	#
.L149:
# src/scanner.c:206:     switch (c) {
	xor	edx, edx	# _269
	mov	eax, 1	# _196,
	jmp	.L174	#
.L81:
	mov	eax, 1	# _196,
	mov	edx, 1	# _269,
	vmovd	xmm0, eax	# _196, _196
	jmp	.L13	#
.L85:
# src/scanner.c:36:     scanner.current++;
	add	r10, 1	# _306,
# src/scanner.c:60:     token.length = (int) (scanner.current - scanner.start);
	mov	eax, r10d	# _196, _306
	sub	eax, ecx	# _196, prephitmp_357
# src/scanner.c:36:     scanner.current++;
	mov	QWORD PTR scanner[rip+8], r10	# scanner.current, _306
# src/scanner.c:60:     token.length = (int) (scanner.current - scanner.start);
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:62:     return token;
	mov	edx, 28	# _269,
	jmp	.L13	#
.L153:
	mov	eax, 1	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:217:         case '+': return makeToken(match('=') ? TOKEN_PLUS_EQUAL : match('+') ? TOKEN_PLUS_PLUS : TOKEN_PLUS);
	mov	edx, 8	# _269,
# src/scanner.c:62:     return token;
	jmp	.L13	#
.L151:
	mov	eax, 1	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:216:         case '-': return makeToken(match('=') ? TOKEN_MINUS_EQUAL : match('-') ? TOKEN_MINUS_MINUS : TOKEN_MINUS);
	mov	edx, 7	# _269,
# src/scanner.c:62:     return token;
	jmp	.L13	#
.L89:
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	al, 43	# _47,
	jne	.L153	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp272,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp272
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:217:         case '+': return makeToken(match('=') ? TOKEN_PLUS_EQUAL : match('+') ? TOKEN_PLUS_PLUS : TOKEN_PLUS);
	mov	edx, 17	# _269,
	jmp	.L13	#
.L87:
# src/scanner.c:51:     if (*scanner.current != expected) return false;
	cmp	al, 45	# _40,
	jne	.L151	#,
# src/scanner.c:52:     scanner.current++;
	lea	rax, 2[rcx]	# tmp268,
	mov	QWORD PTR scanner[rip+8], rax	# scanner.current, tmp268
	mov	eax, 2	# _196,
	vmovd	xmm0, eax	# _196, _196
# src/scanner.c:216:         case '-': return makeToken(match('=') ? TOKEN_MINUS_EQUAL : match('-') ? TOKEN_MINUS_MINUS : TOKEN_MINUS);
	mov	edx, 18	# _269,
	jmp	.L13	#
.L57:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _410,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR 2[rcx], 25968	# MEM <char[1:3]> [(void *)_254],
	jne	.L102	#,
	cmp	BYTE PTR 4[rcx], 114	# MEM <char[1:3]> [(void *)_254],
# src/scanner.c:102:         return type;
	mov	edx, 47	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L102	#,
	jmp	.L174	#
	.p2align 4,,10
	.p2align 3
.L61:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _410,
	jne	.L174	#,
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	WORD PTR 2[rcx], 29545	# MEM <unsigned short> [(char * {ref-all})prephitmp_404 + 2B],
	mov	esi, 49	# tmp316,
	cmove	edx, esi	# tmp316,, _269
	jmp	.L174	#
.L38:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _410,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR 2[rcx], 29537	# MEM <char[1:3]> [(void *)_211],
	jne	.L102	#,
	cmp	BYTE PTR 4[rcx], 115	# MEM <char[1:3]> [(void *)_211],
# src/scanner.c:102:         return type;
	mov	edx, 33	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L102	#,
	jmp	.L174	#
	.p2align 4,,10
	.p2align 3
.L179:
# src/scanner.c:105:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 1[rcx], 110	# MEM[(const unsigned char * {ref-all})prephitmp_404 + 1B],
	mov	edx, 41	# tmp292,
	mov	esi, 27	# tmp293,
	cmovne	edx, esi	# tmp292,, _269, tmp293
	jmp	.L174	#
.L49:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _410,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR 2[rcx], 29548	# MEM <char[1:3]> [(void *)_230],
	jne	.L102	#,
	cmp	BYTE PTR 4[rcx], 101	# MEM <char[1:3]> [(void *)_230],
# src/scanner.c:102:         return type;
	mov	edx, 39	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L102	#,
	jmp	.L174	#
.L42:
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _410,
	jne	.L174	#,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 4[rcx], 116	# MEM[(const unsigned char * {ref-all})prephitmp_404 + 4B],
# src/scanner.c:102:         return type;
	mov	edx, 34	# _269,
# src/scanner.c:101:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	jne	.L102	#,
	jmp	.L174	#
	.cfi_endproc
.LFE27:
	.size	scanToken, .-scanToken
	.globl	scanner
	.bss
	.align 16
	.type	scanner, @object
	.size	scanner, 24
scanner:
	.zero	24
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
