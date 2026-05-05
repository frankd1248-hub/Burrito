	.file	"scanner.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.globl	"initScanner"
	.type	"initScanner", @function
"initScanner":
.LFB22:
	.cfi_startproc
# src/scanner.c:17:     scanner.start = source;
	mov	QWORD PTR "scanner"[rip], rdi	# scanner.start, source
# src/scanner.c:18:     scanner.current = source;
	mov	QWORD PTR "scanner"[rip+8], rdi	# scanner.current, source
# src/scanner.c:19:     scanner.line = 1;
	mov	DWORD PTR "scanner"[rip+16], 1	# scanner.line,
# src/scanner.c:20: }
	ret	
	.cfi_endproc
.LFE22:
	.size	"initScanner", .-"initScanner"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"tch"
.LC1:
	.string	"ass"
.LC2:
	.string	"ecl"
.LC3:
	.string	"lse"
.LC4:
	.string	"ull"
.LC5:
	.string	"eturn"
.LC6:
	.string	"per"
.LC7:
	.string	"Invalid escape character"
.LC8:
	.string	"Unexpected character."
.LC9:
	.string	"Unterminated string."
	.text
	.p2align 4
	.globl	"scanToken"
	.type	"scanToken", @function
"scanToken":
.LFB38:
	.cfi_startproc
# src/scanner.c:42:     return *scanner.current;
	mov	rdx, QWORD PTR "scanner"[rip+8]	# _233, scanner.current
# src/scanner.c:85:                 scanner.line++;
	mov	r9d, DWORD PTR "scanner"[rip+16]	# prephitmp_448, scanner.line
# src/scanner.c:227: Token scanToken() {
	mov	r8, rdi	# .result_ptr, .result_ptr
# src/scanner.c:78:         switch(c) {
	lea	rcx, .L7[rip]	# tmp358,
# src/scanner.c:42:     return *scanner.current;
	movzx	eax, BYTE PTR [rdx]	# prephitmp_444, *pretmp_500
.L4:
# src/scanner.c:78:         switch(c) {
	sub	eax, 9	# tmp225,
	cmp	al, 38	# tmp225,
	ja	.L5	#,
	movzx	eax, al	# tmp226, tmp225
	movsxd	rax, DWORD PTR [rcx+rax*4]	# tmp229,
	add	rax, rcx	# tmp230, tmp358
	jmp	rax	# tmp230
	.section	.rodata
	.align 4
	.align 4
.L7:
	.long	.L200-.L7
	.long	.L9-.L7
	.long	.L5-.L7
	.long	.L5-.L7
	.long	.L200-.L7
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
	.long	.L200-.L7
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
# src/scanner.c:229:     scanner.start = scanner.current;
	mov	QWORD PTR "scanner"[rip], rdx	# scanner.start, _233
# src/scanner.c:231:     if (isAtEnd()) return makeToken(TOKEN_EOF);
	cmp	BYTE PTR [rdx], 0	# *prephitmp_501,
	je	.L201	#,
# src/scanner.c:37:     scanner.current++;
	lea	r10, 1[rdx]	# _251,
	mov	QWORD PTR "scanner"[rip+8], r10	# scanner.current, _251
# src/scanner.c:38:     return scanner.current[-1];
	movzx	ecx, BYTE PTR [rdx]	# _31, *prephitmp_501
	lea	esi, -65[rcx]	# _209,
	cmp	sil, 57	# _209,
	ja	.L15	#,
	movabs	rdi, 288230372997595135	# tmp241,
	mov	rax, r10	# _236, _251
	bt	rdi, rsi	# tmp241, _209
	jc	.L16	#,
	jmp	.L17	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L202:
	bt	rdi, rsi	# tmp241, _154
	jnc	.L22	#,
.L21:
# src/scanner.c:37:     scanner.current++;
	add	rax, 1	# _236,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, _236
.L16:
# src/scanner.c:23:     return (c >= 'a' && c <= 'z') ||
	movzx	ecx, BYTE PTR [rax]	# c.10_238, MEM[(const char *)prephitmp_496]
	lea	esi, -65[rcx]	# _154,
	cmp	sil, 57	# _154,
	jbe	.L202	#,
# src/scanner.c:29:     return c >= '0' && c <= '9';
	sub	ecx, 48	# _239,
# src/scanner.c:172:     while (isAlpha(peek()) || isDigit(peek())) advance();
	cmp	cl, 9	# _239,
	jbe	.L21	#,
	.p2align 4
	.p2align 3
.L22:
# src/scanner.c:110:     switch (scanner.start[0]) {
	movzx	edi, BYTE PTR [rdx]	# tmp363, *prephitmp_501
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	sub	rax, rdx	# _507, _233
# src/scanner.c:110:     switch (scanner.start[0]) {
	lea	ecx, -97[rdi]	# tmp252,
	cmp	cl, 22	# tmp252,
	ja	.L64	#,
	lea	rsi, .L25[rip]	# tmp255,
	movzx	ecx, cl	# tmp254, tmp252
	movsxd	rcx, DWORD PTR [rsi+rcx*4]	# tmp257,
	add	rcx, rsi	# tmp258, tmp255
	jmp	rcx	# tmp258
	.section	.rodata
	.align 4
	.align 4
.L25:
	.long	.L38-.L25
	.long	.L37-.L25
	.long	.L36-.L25
	.long	.L35-.L25
	.long	.L34-.L25
	.long	.L33-.L25
	.long	.L64-.L25
	.long	.L64-.L25
	.long	.L32-.L25
	.long	.L64-.L25
	.long	.L64-.L25
	.long	.L64-.L25
	.long	.L64-.L25
	.long	.L31-.L25
	.long	.L30-.L25
	.long	.L29-.L25
	.long	.L64-.L25
	.long	.L28-.L25
	.long	.L27-.L25
	.long	.L26-.L25
	.long	.L64-.L25
	.long	.L64-.L25
	.long	.L24-.L25
	.text
	.p2align 4,,10
	.p2align 3
.L9:
# src/scanner.c:85:                 scanner.line++;
	add	r9d, 1	# prephitmp_448,
	mov	DWORD PTR "scanner"[rip+16], r9d	# scanner.line, prephitmp_448
.L200:
# src/scanner.c:37:     scanner.current++;
	lea	rsi, 1[rdx]	# _230,
	mov	QWORD PTR "scanner"[rip+8], rsi	# scanner.current, _230
# src/scanner.c:42:     return *scanner.current;
	movzx	eax, BYTE PTR 1[rdx]	# prephitmp_444, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:87:                 break;
	mov	rdx, rsi	# _233, _230
	jmp	.L4	#
	.p2align 4,,10
	.p2align 3
.L6:
# src/scanner.c:89:                 if (peekNext() == '/') {
	cmp	BYTE PTR 1[rdx], 47	# MEM[(const char *)prephitmp_501 + 1B],
	jne	.L5	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L12:
# src/scanner.c:37:     scanner.current++;
	add	rdx, 1	# _233,
	mov	QWORD PTR "scanner"[rip+8], rdx	# scanner.current, _233
# src/scanner.c:42:     return *scanner.current;
	movzx	eax, BYTE PTR [rdx]	# prephitmp_444, MEM[(const char *)_233]
# src/scanner.c:90:                     while (peek() != '\n' && !isAtEnd()) advance();
	cmp	al, 10	# prephitmp_444,
	je	.L4	#,
# src/scanner.c:90:                     while (peek() != '\n' && !isAtEnd()) advance();
	test	al, al	# prephitmp_444
	jne	.L12	#,
	jmp	.L4	#
.L28:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 6	# _507,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	DWORD PTR [r10], 1920300133	# MEM <char[1:5]> [(void *)_30],
	jne	.L64	#,
# src/scanner.c:103:         return type;
	mov	esi, 57	# _319,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 4[r10], 110	# MEM <char[1:5]> [(void *)_30],
	je	.L39	#,
	.p2align 4
	.p2align 3
.L64:
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	mov	esi, 37	# _319,
.L39:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], esi	# MEM <unsigned int> [(struct  *)&<retval>], _319
# src/scanner.c:61:     token.length = (int) (scanner.current - scanner.start);
	mov	ecx, eax	# count, _507
# src/scanner.c:63:     return token;
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
.L198:
	mov	DWORD PTR 16[r8], ecx	# <retval>.length, count
# src/scanner.c:266: }
	mov	rax, r8	#, .result_ptr
# src/scanner.c:63:     return token;
	mov	DWORD PTR 20[r8], r9d	# <retval>.line, prephitmp_448
# src/scanner.c:266: }
	ret	
	.p2align 4,,10
	.p2align 3
.L201:
# src/scanner.c:231:     if (isAtEnd()) return makeToken(TOKEN_EOF);
	xor	ecx, ecx	# count
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 65	# MEM <unsigned int> [(struct  *)&<retval>],
# src/scanner.c:266: }
	mov	rax, r8	#, .result_ptr
# src/scanner.c:63:     return token;
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
	mov	DWORD PTR 16[r8], ecx	# <retval>.length, count
	mov	DWORD PTR 20[r8], r9d	# <retval>.line, prephitmp_448
# src/scanner.c:266: }
	ret	
	.p2align 4,,10
	.p2align 3
.L17:
# src/scanner.c:237:     switch (c) {
	sub	ecx, 33	# tmp283,
	cmp	cl, 93	# tmp283,
	ja	.L73	#,
	lea	rsi, .L75[rip]	# tmp285,
	movzx	ecx, cl	# tmp284, tmp283
	movsxd	rax, DWORD PTR [rsi+rcx*4]	# tmp287,
	add	rax, rsi	# tmp288, tmp285
	jmp	rax	# tmp288
	.section	.rodata
	.align 4
	.align 4
.L75:
	.long	.L99-.L75
	.long	.L98-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L97-.L75
	.long	.L96-.L75
	.long	.L73-.L75
	.long	.L95-.L75
	.long	.L94-.L75
	.long	.L93-.L75
	.long	.L92-.L75
	.long	.L91-.L75
	.long	.L90-.L75
	.long	.L89-.L75
	.long	.L88-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L87-.L75
	.long	.L86-.L75
	.long	.L85-.L75
	.long	.L84-.L75
	.long	.L83-.L75
	.long	.L82-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L81-.L75
	.long	.L73-.L75
	.long	.L80-.L75
	.long	.L79-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L73-.L75
	.long	.L78-.L75
	.long	.L77-.L75
	.long	.L76-.L75
	.long	.L74-.L75
	.text
	.p2align 4,,10
	.p2align 3
.L15:
# src/scanner.c:29:     return c >= '0' && c <= '9';
	lea	eax, -48[rcx]	# _32,
# src/scanner.c:235:     if (isDigit(c)) return number();
	cmp	al, 9	# _32,
	ja	.L17	#,
# src/scanner.c:42:     return *scanner.current;
	movzx	eax, BYTE PTR 1[rdx]	# _241, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:29:     return c >= '0' && c <= '9';
	lea	ecx, -48[rax]	# _245,
# src/scanner.c:177:     while (isDigit(peek())) advance();
	cmp	cl, 9	# _245,
	ja	.L19	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L18:
# src/scanner.c:37:     scanner.current++;
	add	r10, 1	# _251,
	mov	QWORD PTR "scanner"[rip+8], r10	# scanner.current, _251
# src/scanner.c:42:     return *scanner.current;
	movzx	eax, BYTE PTR [r10]	# _241, MEM[(const char *)_321]
# src/scanner.c:29:     return c >= '0' && c <= '9';
	lea	ecx, -48[rax]	# _324,
# src/scanner.c:177:     while (isDigit(peek())) advance();
	cmp	cl, 9	# _324,
	jbe	.L18	#,
.L19:
# src/scanner.c:179:     if (peek() == '.' && isDigit(peekNext())) {
	cmp	al, 46	# _241,
	je	.L203	#,
.L70:
# src/scanner.c:61:     token.length = (int) (scanner.current - scanner.start);
	mov	ecx, r10d	# count, _251
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 39	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:61:     token.length = (int) (scanner.current - scanner.start);
	sub	ecx, edx	# count, _233
# src/scanner.c:235:     if (isDigit(c)) return number();
	jmp	.L198	#
	.p2align 4,,10
	.p2align 3
.L73:
# src/scanner.c:72:     return token;
	lea	rax, .LC8[rip]	# tmp371,
	mov	DWORD PTR [r8], 64	# MEM <unsigned int> [(struct  *)&<retval>],
# src/scanner.c:265:     return errorToken("Unexpected character.");
	mov	ecx, 21	# count,
# src/scanner.c:72:     return token;
	mov	QWORD PTR 8[r8], rax	# <retval>.start, tmp371
# src/scanner.c:265:     return errorToken("Unexpected character.");
	jmp	.L198	#
.L203:
# src/scanner.c:29:     return c >= '0' && c <= '9';
	movzx	eax, BYTE PTR 1[r10]	# tmp364, MEM[(const char *)prephitmp_493 + 1B]
	sub	eax, 48	# _327,
# src/scanner.c:179:     if (peek() == '.' && isDigit(peekNext())) {
	cmp	al, 9	# _327,
	ja	.L70	#,
# src/scanner.c:37:     scanner.current++;
	lea	rax, 1[r10]	# _328,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, _328
# src/scanner.c:29:     return c >= '0' && c <= '9';
	movzx	ecx, BYTE PTR 1[r10]	# MEM[(const char *)prephitmp_493 + 1B], MEM[(const char *)prephitmp_493 + 1B]
# src/scanner.c:42:     return *scanner.current;
	mov	r10, rax	# _251, _328
# src/scanner.c:29:     return c >= '0' && c <= '9';
	sub	ecx, 48	# _298,
# src/scanner.c:182:         while (isDigit(peek())) advance();
	cmp	cl, 9	# _298,
	ja	.L70	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L72:
# src/scanner.c:37:     scanner.current++;
	add	r10, 1	# _251,
	mov	QWORD PTR "scanner"[rip+8], r10	# scanner.current, _251
# src/scanner.c:29:     return c >= '0' && c <= '9';
	movzx	eax, BYTE PTR [r10]	# tmp365, MEM[(const char *)_330]
	sub	eax, 48	# _333,
# src/scanner.c:182:         while (isDigit(peek())) advance();
	cmp	al, 9	# _333,
	jbe	.L72	#,
	jmp	.L70	#
.L36:
# src/scanner.c:114:             if (scanner.current - scanner.start > 1) {
	cmp	rax, 1	# _507,
	jle	.L64	#,
# src/scanner.c:115:                 switch (scanner.start[1]) {
	movzx	ecx, BYTE PTR 1[rdx]	# _257, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:115:                 switch (scanner.start[1]) {
	cmp	cl, 108	# _257,
	je	.L40	#,
	cmp	cl, 111	# _257,
	je	.L41	#,
	cmp	cl, 97	# _257,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _507,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR 2[rdx], 25460	# MEM <char[1:3]> [(void *)_258],
	jne	.L64	#,
# src/scanner.c:103:         return type;
	mov	esi, 43	# _319,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 4[rdx], 104	# MEM <char[1:3]> [(void *)_258],
	jne	.L64	#,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L32:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 2	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 1[rdx], 102	# MEM[(const unsigned char * {ref-all})prephitmp_501 + 1B],
	mov	esi, 53	# tmp341,
	mov	ecx, 37	# tmp342,
	cmovne	esi, ecx	# tmp341,, _319, tmp342
	jmp	.L39	#
.L37:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	xor	esi, esi	# _319
	cmp	DWORD PTR 1[rdx], 1801545074	# MEM <unsigned int> [(char * {ref-all})prephitmp_501 + 1B],
	sete	sil	#, _319
	lea	esi, 37[0+rsi*4]	# _319,
	jmp	.L39	#
.L38:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 3	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	xor	esi, esi	# _319
	cmp	WORD PTR 1[rdx], 25710	# MEM <unsigned short> [(char * {ref-all})prephitmp_501 + 1B],
	sete	sil	#, _319
	lea	esi, 37[rsi+rsi*2]	# _319,
	jmp	.L39	#
.L35:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _507,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR [r10], 25445	# MEM <char[1:3]> [(void *)_30],
	jne	.L64	#,
# src/scanner.c:103:         return type;
	mov	esi, 47	# _319,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 2[r10], 108	# MEM <char[1:3]> [(void *)_30],
	jne	.L64	#,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L34:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _507,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR [r10], 29548	# MEM <char[1:3]> [(void *)_30],
	jne	.L64	#,
# src/scanner.c:103:         return type;
	mov	esi, 49	# _319,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 2[r10], 101	# MEM <char[1:3]> [(void *)_30],
	jne	.L64	#,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L33:
# src/scanner.c:132:             if (scanner.current - scanner.start == 2) {
	cmp	rax, 2	# _507,
	je	.L204	#,
# src/scanner.c:134:             } if (scanner.current - scanner.start > 1) {
	cmp	rax, 1	# _507,
	jle	.L64	#,
# src/scanner.c:135:                 switch (scanner.start[1]) {
	movzx	ecx, BYTE PTR 1[rdx]	# _278, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:135:                 switch (scanner.start[1]) {
	cmp	cl, 97	# _278,
	je	.L54	#,
	cmp	cl, 111	# _278,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 3	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 2[rdx], 114	# MEM[(const unsigned char * {ref-all})prephitmp_501 + 2B],
	mov	esi, 51	# tmp339,
	mov	ecx, 37	# tmp340,
	cmovne	esi, ecx	# tmp339,, _319, tmp340
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L31:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _507,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR [r10], 27765	# MEM <char[1:3]> [(void *)_30],
	jne	.L64	#,
# src/scanner.c:103:         return type;
	mov	esi, 54	# _319,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 2[r10], 108	# MEM <char[1:3]> [(void *)_30],
	jne	.L64	#,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L27:
# src/scanner.c:147:             if (scanner.current - scanner.start > 1) {
	cmp	rax, 1	# _507,
	jle	.L64	#,
# src/scanner.c:148:                 switch(scanner.start[1]) {
	movzx	ecx, BYTE PTR 1[rdx]	# _302, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:148:                 switch(scanner.start[1]) {
	cmp	cl, 117	# _302,
	je	.L62	#,
	cmp	cl, 119	# _302,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 6	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	DWORD PTR 2[rdx], 1751348329	# MEM <unsigned int> [(char * {ref-all})prephitmp_501 + 2B],
	mov	esi, 59	# tmp347,
	mov	ecx, 37	# tmp348,
	cmovne	esi, ecx	# tmp347,, _319, tmp348
	jmp	.L39	#
.L26:
# src/scanner.c:155:             if (scanner.current - scanner.start > 1) {
	cmp	rax, 1	# _507,
	jle	.L64	#,
# src/scanner.c:156:                 switch (scanner.start[1]) {
	movzx	ecx, BYTE PTR 1[rdx]	# _309, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:156:                 switch (scanner.start[1]) {
	cmp	cl, 104	# _309,
	je	.L66	#,
	cmp	cl, 114	# _309,
	jne	.L64	#,
# src/scanner.c:159:                         if (scanner.current - scanner.start == 3)
	cmp	rax, 3	# _507,
	je	.L205	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	WORD PTR 2[rdx], 25973	# MEM <unsigned short> [(char * {ref-all})prephitmp_501 + 2B],
	mov	esi, 61	# tmp353,
	mov	ecx, 37	# tmp354,
	cmovne	esi, ecx	# tmp353,, _319, tmp354
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L30:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 2	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 1[rdx], 114	# MEM[(const unsigned char * {ref-all})prephitmp_501 + 1B],
	mov	esi, 55	# tmp343,
	mov	ecx, 37	# tmp344,
	cmovne	esi, ecx	# tmp343,, _319, tmp344
	jmp	.L39	#
.L29:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	DWORD PTR 1[rdx], 1953393010	# MEM <unsigned int> [(char * {ref-all})prephitmp_501 + 1B],
	mov	esi, 56	# tmp345,
	mov	ecx, 37	# tmp346,
	cmovne	esi, ecx	# tmp345,, _319, tmp346
	jmp	.L39	#
.L24:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	DWORD PTR 1[rdx], 1701603688	# MEM <unsigned int> [(char * {ref-all})prephitmp_501 + 1B],
	mov	esi, 63	# tmp355,
	mov	ecx, 37	# tmp356,
	cmovne	esi, ecx	# tmp355,, _319, tmp356
	jmp	.L39	#
.L99:
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	mov	ecx, 1	# count,
# src/scanner.c:260:         case '!': return makeToken(match('=') ? TOKEN_BANG_EQUAL : TOKEN_BANG);
	mov	eax, 28	# iftmp.7_9,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rdx], 61	# MEM[(const char *)prephitmp_501 + 1B],
	je	.L206	#,
	.p2align 4
	.p2align 3
.L121:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], eax	# MEM <unsigned int> [(struct  *)&<retval>], iftmp.8_10
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:261:         case '=': return makeToken(match('=') ? TOKEN_EQUAL_EQUAL : TOKEN_EQUAL);
	jmp	.L198	#
.L74:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 19	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
.L100:
# src/scanner.c:219:     if (isAtEnd()) return errorToken("Unterminated string.");
	mov	ecx, 1	# count,
# src/scanner.c:63:     return token;
	mov	DWORD PTR 20[r8], r9d	# <retval>.line, prephitmp_448
# src/scanner.c:266: }
	mov	rax, r8	#, .result_ptr
# src/scanner.c:63:     return token;
	mov	DWORD PTR 16[r8], ecx	# <retval>.length, count
# src/scanner.c:266: }
	ret	
.L79:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 18	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:251:         case '^': return makeToken(TOKEN_CARET);
	jmp	.L100	#
.L80:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 3	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:241:         case ']': return makeToken(TOKEN_RIGHT_BRACKET);
	jmp	.L100	#
.L81:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 2	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:240:         case '[': return makeToken(TOKEN_LEFT_BRACKET);
	jmp	.L100	#
.L82:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 11	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:248:         case '?': return makeToken(TOKEN_QUESTION);
	jmp	.L100	#
.L77:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 17	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:250:         case '|': return makeToken(TOKEN_PIPE);
	jmp	.L100	#
.L78:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 4	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:242:         case '{': return makeToken(TOKEN_LEFT_BRACE);
	jmp	.L100	#
.L76:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 5	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:243:         case '}': return makeToken(TOKEN_RIGHT_BRACE);
	jmp	.L100	#
.L83:
# src/scanner.c:33:     return *scanner.current == '\0';
	movzx	eax, BYTE PTR 1[rdx]	# _69, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:51:     if (isAtEnd()) return false;
	test	al, al	# _69
	je	.L113	#,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	al, 61	# _69,
	jne	.L114	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp303,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp303
# src/scanner.c:256:         case '>': return makeToken(match('=') ? TOKEN_GREATER_EQUAL : match('>') ? TOKEN_RIGHT_SHIFT : TOKEN_GREATER);
	mov	eax, 33	# iftmp.3_5,
	jmp	.L121	#
.L84:
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	mov	ecx, 1	# count,
# src/scanner.c:261:         case '=': return makeToken(match('=') ? TOKEN_EQUAL_EQUAL : TOKEN_EQUAL);
	mov	eax, 30	# iftmp.8_10,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rdx], 61	# MEM[(const char *)prephitmp_501 + 1B],
	jne	.L121	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp315,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp315
# src/scanner.c:261:         case '=': return makeToken(match('=') ? TOKEN_EQUAL_EQUAL : TOKEN_EQUAL);
	mov	eax, 31	# iftmp.8_10,
	jmp	.L121	#
.L85:
# src/scanner.c:33:     return *scanner.current == '\0';
	movzx	eax, BYTE PTR 1[rdx]	# _62, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:51:     if (isAtEnd()) return false;
	test	al, al	# _62
	je	.L109	#,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	al, 61	# _62,
	jne	.L110	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp299,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp299
# src/scanner.c:255:         case '<': return makeToken(match('=') ? TOKEN_LESS_EQUAL : match('<') ? TOKEN_LEFT_SHIFT : TOKEN_LESS);
	mov	eax, 35	# iftmp.2_4,
	jmp	.L121	#
.L86:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 12	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:244:         case ';': return makeToken(TOKEN_SEMICOLON);
	jmp	.L100	#
.L87:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 7	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:245:         case ':': return makeToken(TOKEN_COLON);
	jmp	.L100	#
.L88:
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	mov	ecx, 1	# count,
# src/scanner.c:257:         case '/': return makeToken(match('=') ? TOKEN_SLASH_EQUAL : TOKEN_SLASH);
	mov	eax, 13	# iftmp.4_6,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rdx], 61	# MEM[(const char *)prephitmp_501 + 1B],
	jne	.L121	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp307,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp307
# src/scanner.c:257:         case '/': return makeToken(match('=') ? TOKEN_SLASH_EQUAL : TOKEN_SLASH);
	mov	eax, 24	# iftmp.4_6,
	jmp	.L121	#
.L89:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 8	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:247:         case '.': return makeToken(TOKEN_DOT);
	jmp	.L100	#
.L90:
# src/scanner.c:33:     return *scanner.current == '\0';
	movzx	eax, BYTE PTR 1[rdx]	# _48, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:51:     if (isAtEnd()) return false;
	test	al, al	# _48
	je	.L101	#,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	al, 61	# _48,
	jne	.L102	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp291,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp291
# src/scanner.c:253:         case '-': return makeToken(match('=') ? TOKEN_MINUS_EQUAL : match('-') ? TOKEN_MINUS_MINUS : TOKEN_MINUS);
	mov	eax, 22	# iftmp.0_2,
	jmp	.L121	#
.L91:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 6	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:246:         case ',': return makeToken(TOKEN_COMMA);
	jmp	.L100	#
.L92:
# src/scanner.c:33:     return *scanner.current == '\0';
	movzx	eax, BYTE PTR 1[rdx]	# _55, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:51:     if (isAtEnd()) return false;
	test	al, al	# _55
	je	.L105	#,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	al, 61	# _55,
	jne	.L106	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp295,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp295
# src/scanner.c:254:         case '+': return makeToken(match('=') ? TOKEN_PLUS_EQUAL : match('+') ? TOKEN_PLUS_PLUS : TOKEN_PLUS);
	mov	eax, 23	# iftmp.1_3,
	jmp	.L121	#
.L95:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 0	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:238:         case '(': return makeToken(TOKEN_LEFT_PAREN);
	jmp	.L100	#
.L96:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 16	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:249:         case '&': return makeToken(TOKEN_AMPERSAND);
	jmp	.L100	#
.L93:
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	mov	ecx, 1	# count,
# src/scanner.c:259:         case '*': return makeToken(match('=') ? TOKEN_STAR_EQUAL : TOKEN_STAR);
	mov	eax, 14	# iftmp.6_8,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rdx], 61	# MEM[(const char *)prephitmp_501 + 1B],
	jne	.L121	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp311,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp311
# src/scanner.c:259:         case '*': return makeToken(match('=') ? TOKEN_STAR_EQUAL : TOKEN_STAR);
	mov	eax, 25	# iftmp.6_8,
	jmp	.L121	#
.L94:
# src/scanner.c:63:     return token;
	mov	DWORD PTR [r8], 1	# MEM <unsigned int> [(struct  *)&<retval>],
# src/scanner.c:239:         case ')': return makeToken(TOKEN_RIGHT_PAREN);
	mov	ecx, 1	# count,
# src/scanner.c:63:     return token;
	mov	QWORD PTR 8[r8], rdx	# <retval>.start, _233
# src/scanner.c:239:         case ')': return makeToken(TOKEN_RIGHT_PAREN);
	jmp	.L198	#
.L97:
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	mov	ecx, 1	# count,
# src/scanner.c:258:         case '%': return makeToken(match('=') ? TOKEN_PERCENT_EQUAL : TOKEN_PERCENT);
	mov	eax, 15	# iftmp.5_7,
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	BYTE PTR 1[rdx], 61	# MEM[(const char *)prephitmp_501 + 1B],
	jne	.L121	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp309,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp309
# src/scanner.c:258:         case '%': return makeToken(match('=') ? TOKEN_PERCENT_EQUAL : TOKEN_PERCENT);
	mov	eax, 36	# iftmp.5_7,
	jmp	.L121	#
.L98:
# src/scanner.c:227: Token scanToken() {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/scanner.c:189:     char* buf = malloc(sizeof(char) * 8);
	mov	edi, 8	#,
# src/scanner.c:190:     int capacity = 8, count = 0;
	mov	ebx, 8	# capacity,
# src/scanner.c:227: Token scanToken() {
	sub	rsp, 48	#,
	.cfi_def_cfa_offset 64
	mov	QWORD PTR 24[rsp], r8	# %sfp, .result_ptr
	mov	DWORD PTR 16[rsp], r9d	# %sfp, prephitmp_448
	mov	QWORD PTR 8[rsp], r10	# %sfp, _251
	mov	QWORD PTR [rsp], rdx	# %sfp, _233
# src/scanner.c:189:     char* buf = malloc(sizeof(char) * 8);
	call	"malloc"@PLT	#
# src/scanner.c:42:     return *scanner.current;
	mov	rdx, QWORD PTR [rsp]	# _233, %sfp
# src/scanner.c:193:     while ((c = peek()) != '"' && !isAtEnd()) {
	xor	r11d, r11d	# ivtmp.75
# src/scanner.c:190:     int capacity = 8, count = 0;
	xor	ecx, ecx	# count
# src/scanner.c:193:     while ((c = peek()) != '"' && !isAtEnd()) {
	mov	r10, QWORD PTR 8[rsp]	# _251, %sfp
	mov	r9d, DWORD PTR 16[rsp]	# prephitmp_448, %sfp
# src/scanner.c:189:     char* buf = malloc(sizeof(char) * 8);
	mov	rdi, rax	# buf, buf
# src/scanner.c:42:     return *scanner.current;
	movzx	edx, BYTE PTR 1[rdx]	# _313, MEM[(const char *)prephitmp_501 + 1B]
# src/scanner.c:193:     while ((c = peek()) != '"' && !isAtEnd()) {
	mov	r8, QWORD PTR 24[rsp]	# .result_ptr, %sfp
	cmp	dl, 34	# _313,
	jne	.L122	#,
	jmp	.L123	#
	.p2align 4,,10
	.p2align 3
.L125:
# src/scanner.c:201:         if (c == '\\') { // Escape character
	cmp	dl, 92	# _313,
	je	.L194	#,
	lea	rdx, "scanner"[rip]	# tmp328,
.L126:
# src/scanner.c:37:     scanner.current++;
	lea	rax, 1[r10]	# _368,
	mov	QWORD PTR 8[rdx], rax	# scanner.current, _368
# src/scanner.c:216:         buf[count++] = advance();
	movzx	edx, BYTE PTR [r10]	# *_317, *_317
	mov	r10, rax	# _251, _368
	mov	BYTE PTR [rdi+r11], dl	# *_367, *_317
.L135:
# src/scanner.c:42:     return *scanner.current;
	movzx	edx, BYTE PTR [r10]	# _313, *prephitmp_478
# src/scanner.c:193:     while ((c = peek()) != '"' && !isAtEnd()) {
	add	r11, 1	# ivtmp.75,
	cmp	dl, 34	# _313,
	je	.L123	#,
.L122:
# src/scanner.c:193:     while ((c = peek()) != '"' && !isAtEnd()) {
	test	dl, dl	# _313
	je	.L207	#,
# src/scanner.c:194:         if (count + 1 >= capacity) {
	lea	ecx, 1[r11]	# count,
# src/scanner.c:194:         if (count + 1 >= capacity) {
	cmp	ebx, ecx	# capacity, count
	jle	.L208	#,
.L124:
# src/scanner.c:199:         if (c == '\n') scanner.line++;
	cmp	dl, 10	# _313,
	jne	.L125	#,
# src/scanner.c:199:         if (c == '\n') scanner.line++;
	add	r9d, 1	# prephitmp_448,
	lea	rdx, "scanner"[rip]	# tmp328,
	mov	DWORD PTR "scanner"[rip+16], r9d	# scanner.line, prephitmp_448
	jmp	.L126	#
.L194:
# src/scanner.c:37:     scanner.current++;
	lea	rdx, 2[r10]	# _352,
	mov	QWORD PTR "scanner"[rip+8], rdx	# scanner.current, _352
# src/scanner.c:38:     return scanner.current[-1];
	movzx	eax, BYTE PTR 1[r10]	# _353, MEM[(const char *)_317 + 1B]
# src/scanner.c:205:             switch (c) {
	cmp	al, 98	# _353,
	je	.L127	#,
	jg	.L128	#,
	cmp	al, 34	# _353,
	je	.L129	#,
	cmp	al, 92	# _353,
	jne	.L131	#,
# src/scanner.c:210:                 case '\\': buf[count++] = '\\'; break;
	mov	BYTE PTR [rdi+r11], 92	# *_364,
.L134:
# src/scanner.c:216:         buf[count++] = advance();
	mov	r10, rdx	# _251, _352
	jmp	.L135	#
.L208:
# src/scanner.c:195:             capacity *= 2;
	lea	esi, [rbx+rbx]	#,
	mov	QWORD PTR 40[rsp], r8	# %sfp, .result_ptr
	mov	DWORD PTR 36[rsp], r9d	# %sfp, prephitmp_448
	mov	ebx, esi	# capacity, capacity
	mov	BYTE PTR 24[rsp], dl	# %sfp, _313
	mov	QWORD PTR 16[rsp], r10	# %sfp, _251
	mov	DWORD PTR 8[rsp], ecx	# %sfp, count
	mov	QWORD PTR [rsp], r11	# %sfp, ivtmp.75
# src/scanner.c:196:             buf = realloc(buf, sizeof(char) * capacity);
	call	"realloc"@PLT	#
	mov	r8, QWORD PTR 40[rsp]	# .result_ptr, %sfp
	mov	r9d, DWORD PTR 36[rsp]	# prephitmp_448, %sfp
	movzx	edx, BYTE PTR 24[rsp]	# _313, %sfp
	mov	r10, QWORD PTR 16[rsp]	# _251, %sfp
	mov	rdi, rax	# buf, buf
	mov	ecx, DWORD PTR 8[rsp]	# count, %sfp
	mov	r11, QWORD PTR [rsp]	# ivtmp.75, %sfp
	jmp	.L124	#
.L128:
# src/scanner.c:205:             switch (c) {
	cmp	al, 110	# _353,
	je	.L132	#,
	cmp	al, 116	# _353,
	jne	.L131	#,
# src/scanner.c:207:                 case 't': buf[count++] = '\t';  break;
	mov	BYTE PTR [rdi+r11], 9	# *_358,
# src/scanner.c:207:                 case 't': buf[count++] = '\t';  break;
	jmp	.L134	#
.L101:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/scanner.c:182:         while (isDigit(peek())) advance();
	mov	ecx, 1	# count,
# src/scanner.c:253:         case '-': return makeToken(match('=') ? TOKEN_MINUS_EQUAL : match('-') ? TOKEN_MINUS_MINUS : TOKEN_MINUS);
	mov	eax, 9	# iftmp.0_2,
	jmp	.L121	#
.L109:
# src/scanner.c:254:         case '+': return makeToken(match('=') ? TOKEN_PLUS_EQUAL : match('+') ? TOKEN_PLUS_PLUS : TOKEN_PLUS);
	mov	ecx, 1	# count,
# src/scanner.c:255:         case '<': return makeToken(match('=') ? TOKEN_LESS_EQUAL : match('<') ? TOKEN_LEFT_SHIFT : TOKEN_LESS);
	mov	eax, 34	# iftmp.2_4,
	jmp	.L121	#
.L113:
# src/scanner.c:255:         case '<': return makeToken(match('=') ? TOKEN_LESS_EQUAL : match('<') ? TOKEN_LEFT_SHIFT : TOKEN_LESS);
	mov	ecx, 1	# count,
# src/scanner.c:256:         case '>': return makeToken(match('=') ? TOKEN_GREATER_EQUAL : match('>') ? TOKEN_RIGHT_SHIFT : TOKEN_GREATER);
	mov	eax, 32	# iftmp.3_5,
	jmp	.L121	#
.L105:
# src/scanner.c:253:         case '-': return makeToken(match('=') ? TOKEN_MINUS_EQUAL : match('-') ? TOKEN_MINUS_MINUS : TOKEN_MINUS);
	mov	ecx, 1	# count,
# src/scanner.c:254:         case '+': return makeToken(match('=') ? TOKEN_PLUS_EQUAL : match('+') ? TOKEN_PLUS_PLUS : TOKEN_PLUS);
	mov	eax, 10	# iftmp.1_3,
	jmp	.L121	#
.L62:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _507,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR 2[rdx], 25968	# MEM <char[1:3]> [(void *)_303],
	jne	.L64	#,
# src/scanner.c:103:         return type;
	mov	esi, 58	# _319,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 4[rdx], 114	# MEM <char[1:3]> [(void *)_303],
	jne	.L64	#,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L204:
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 1[rdx], 110	# MEM[(const unsigned char * {ref-all})prephitmp_501 + 1B],
	mov	esi, 52	# tmp337,
	mov	ecx, 37	# tmp338,
	cmovne	esi, ecx	# tmp337,, _319, tmp338
	jmp	.L39	#
.L66:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 4	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	WORD PTR 2[rdx], 29545	# MEM <unsigned short> [(char * {ref-all})prephitmp_501 + 2B],
	mov	esi, 60	# tmp349,
	mov	ecx, 37	# tmp350,
	cmovne	esi, ecx	# tmp349,, _319, tmp350
	jmp	.L39	#
.L54:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _507,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR 2[rdx], 29548	# MEM <char[1:3]> [(void *)_279],
	jne	.L64	#,
# src/scanner.c:103:         return type;
	mov	esi, 50	# _319,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 4[rdx], 101	# MEM <char[1:3]> [(void *)_279],
	jne	.L64	#,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L127:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -16
# src/scanner.c:208:                 case 'b': buf[count++] = '\b';  break;
	mov	BYTE PTR [rdi+r11], 8	# *_360,
# src/scanner.c:208:                 case 'b': buf[count++] = '\b';  break;
	jmp	.L134	#
.L110:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	al, 60	# _62,
	jne	.L109	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp301,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp301
# src/scanner.c:255:         case '<': return makeToken(match('=') ? TOKEN_LESS_EQUAL : match('<') ? TOKEN_LEFT_SHIFT : TOKEN_LESS);
	mov	eax, 20	# iftmp.2_4,
	jmp	.L121	#
.L41:
# src/scanner.c:119:                         if (scanner.current - scanner.start > 3 && scanner.start[2] == 'n') {
	cmp	rax, 3	# _507,
	jle	.L64	#,
# src/scanner.c:119:                         if (scanner.current - scanner.start > 3 && scanner.start[2] == 'n') {
	cmp	BYTE PTR 2[rdx], 110	# MEM[(const char *)prephitmp_501 + 2B],
	jne	.L64	#,
# src/scanner.c:120:                             switch (scanner.start[3]) {
	movzx	ecx, BYTE PTR 3[rdx]	# _263, MEM[(const char *)prephitmp_501 + 3B]
# src/scanner.c:120:                             switch (scanner.start[3]) {
	cmp	cl, 115	# _263,
	je	.L47	#,
	cmp	cl, 116	# _263,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 8	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	DWORD PTR 4[rdx], 1702194793	# MEM <unsigned int> [(char * {ref-all})prephitmp_501 + 4B],
	mov	esi, 37	# tmp335,
	mov	ecx, 46	# tmp336,
	cmove	esi, ecx	# tmp335,, _319, tmp336
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L40:
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _507,
	jne	.L64	#,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	WORD PTR 2[rdx], 29537	# MEM <char[1:3]> [(void *)_260],
	jne	.L64	#,
# src/scanner.c:103:         return type;
	mov	esi, 44	# _319,
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	BYTE PTR 4[rdx], 115	# MEM <char[1:3]> [(void *)_260],
	jne	.L64	#,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L114:
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	al, 62	# _69,
	jne	.L113	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp305,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp305
# src/scanner.c:256:         case '>': return makeToken(match('=') ? TOKEN_GREATER_EQUAL : match('>') ? TOKEN_RIGHT_SHIFT : TOKEN_GREATER);
	mov	eax, 21	# iftmp.3_5,
	jmp	.L121	#
.L106:
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	al, 43	# _55,
	jne	.L105	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp297,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp297
# src/scanner.c:254:         case '+': return makeToken(match('=') ? TOKEN_PLUS_EQUAL : match('+') ? TOKEN_PLUS_PLUS : TOKEN_PLUS);
	mov	eax, 26	# iftmp.1_3,
	jmp	.L121	#
.L102:
# src/scanner.c:52:     if (*scanner.current != expected) return false;
	cmp	al, 45	# _48,
	jne	.L101	#,
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp293,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp293
# src/scanner.c:253:         case '-': return makeToken(match('=') ? TOKEN_MINUS_EQUAL : match('-') ? TOKEN_MINUS_MINUS : TOKEN_MINUS);
	mov	eax, 27	# iftmp.0_2,
	jmp	.L121	#
.L132:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -16
# src/scanner.c:206:                 case 'n': buf[count++] = '\n';  break;
	mov	BYTE PTR [rdi+r11], 10	# *_356,
# src/scanner.c:206:                 case 'n': buf[count++] = '\n';  break;
	jmp	.L134	#
.L123:
# src/scanner.c:37:     scanner.current++;
	add	r10, 1	# tmp325,
# src/scanner.c:224:     return tk;
	mov	DWORD PTR [r8], 38	# MEM <unsigned int> [(struct  *)&<retval>],
# src/scanner.c:37:     scanner.current++;
	mov	QWORD PTR "scanner"[rip+8], r10	# scanner.current, tmp325
# src/scanner.c:224:     return tk;
	mov	QWORD PTR 8[r8], rdi	# MEM <const char *> [(struct  *)&<retval> + 8B], buf
.L14:
# src/scanner.c:63:     return token;
	mov	DWORD PTR 16[r8], ecx	# <retval>.length, count
# src/scanner.c:266: }
	mov	rax, r8	#, .result_ptr
# src/scanner.c:63:     return token;
	mov	DWORD PTR 20[r8], r9d	# <retval>.line, prephitmp_448
# src/scanner.c:266: }
	add	rsp, 48	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
.L131:
	.cfi_restore_state
	mov	QWORD PTR 8[rsp], r8	# %sfp, .result_ptr
	mov	DWORD PTR [rsp], r9d	# %sfp, prephitmp_448
# src/scanner.c:211:                 default: free(buf); return errorToken("Invalid escape character");
	call	"free"@PLT	#
# src/scanner.c:72:     return token;
	mov	r8, QWORD PTR 8[rsp]	# .result_ptr, %sfp
# src/scanner.c:211:                 default: free(buf); return errorToken("Invalid escape character");
	mov	r9d, DWORD PTR [rsp]	# prephitmp_448, %sfp
# src/scanner.c:72:     return token;
	lea	rax, .LC7[rip]	# tmp370,
# src/scanner.c:211:                 default: free(buf); return errorToken("Invalid escape character");
	mov	ecx, 24	# count,
# src/scanner.c:72:     return token;
	mov	DWORD PTR [r8], 64	# MEM <unsigned int> [(struct  *)&<retval>],
	mov	QWORD PTR 8[r8], rax	# <retval>.start, tmp370
# src/scanner.c:211:                 default: free(buf); return errorToken("Invalid escape character");
	jmp	.L14	#
.L129:
# src/scanner.c:209:                 case '"': buf[count++] = '"';   break;
	mov	BYTE PTR [rdi+r11], 34	# *_362,
# src/scanner.c:209:                 case '"': buf[count++] = '"';   break;
	jmp	.L134	#
.L206:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/scanner.c:53:     scanner.current++;
	lea	rax, 2[rdx]	# tmp313,
	mov	ecx, 2	# count,
	mov	QWORD PTR "scanner"[rip+8], rax	# scanner.current, tmp313
# src/scanner.c:260:         case '!': return makeToken(match('=') ? TOKEN_BANG_EQUAL : TOKEN_BANG);
	mov	eax, 29	# iftmp.7_9,
	jmp	.L121	#
.L205:
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 2[rdx], 121	# MEM[(const unsigned char * {ref-all})prephitmp_501 + 2B],
	mov	esi, 62	# tmp351,
	mov	ecx, 37	# tmp352,
	cmovne	esi, ecx	# tmp351,, _319, tmp352
	jmp	.L39	#
.L207:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -16
# src/scanner.c:72:     return token;
	lea	rax, .LC9[rip]	# tmp372,
	mov	DWORD PTR [r8], 64	# MEM <unsigned int> [(struct  *)&<retval>],
# src/scanner.c:219:     if (isAtEnd()) return errorToken("Unterminated string.");
	mov	ecx, 20	# count,
# src/scanner.c:72:     return token;
	mov	QWORD PTR 8[r8], rax	# <retval>.start, tmp372
# src/scanner.c:219:     if (isAtEnd()) return errorToken("Unterminated string.");
	jmp	.L14	#
.L47:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
# src/scanner.c:102:     if (scanner.current - scanner.start == start + length && memcmp(scanner.start + start, rest, length) == 0) {
	cmp	rax, 5	# _507,
	jne	.L64	#,
# src/scanner.c:106:     return TOKEN_IDENTIFIER;
	cmp	BYTE PTR 4[rdx], 116	# MEM[(const unsigned char * {ref-all})prephitmp_501 + 4B],
	mov	esi, 37	# tmp332,
	mov	ecx, 45	# tmp333,
	cmove	esi, ecx	# tmp332,, _319, tmp333
	jmp	.L39	#
	.cfi_endproc
.LFE38:
	.size	"scanToken", .-"scanToken"
	.globl	"scanner"
	.bss
	.align 16
	.type	"scanner", @object
	.size	"scanner", 24
"scanner":
	.zero	24
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
