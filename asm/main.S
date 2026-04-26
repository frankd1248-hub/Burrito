	.file	"main.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=4096 -mtune=arrowlake-s -masm=intel -O3
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"> "
	.text
	.p2align 4
	.type	repl, @function
repl:
.LFB23:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 1040	#,
	.cfi_def_cfa_offset 1056
# src/main.c:10: static void repl() {
	mov	rax, QWORD PTR fs:40	# tmp101, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 1032[rsp], rax	# D.5029, tmp101
	xor	eax, eax	# tmp101
	jmp	.L3	#
	.p2align 4,,10
	.p2align 3
.L2:
# src/main.c:20:         interpret(line);
	mov	rdi, rsp	#,
	call	interpret@PLT	#
.L3:
# src/main.c:13:         printf("> ");
	lea	rdi, .LC0[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/main.c:15:         if (!fgets(line, sizeof(line), stdin)) {
	mov	rdx, QWORD PTR stdin[rip]	#, stdin
	mov	esi, 1024	#,
	mov	rdi, rsp	#,
	call	fgets@PLT	#
# src/main.c:15:         if (!fgets(line, sizeof(line), stdin)) {
	test	rax, rax	# _2
	jne	.L2	#,
# src/main.c:16:             printf("\n");
	mov	edi, 10	#,
	call	putchar@PLT	#
# src/main.c:22: }
	mov	rax, QWORD PTR 1032[rsp]	# tmp110, D.5029
	sub	rax, QWORD PTR fs:40	# tmp110, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L9	#,
	add	rsp, 1040	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
.L9:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE23:
	.size	repl, .-repl
	.section	.rodata.str1.1
.LC1:
	.string	"rb"
.LC2:
	.string	"Could not open file \"%s\".\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Not enough memory to read \"%s\".\n"
	.section	.rodata.str1.1
.LC4:
	.string	"Could not read file \"%s\".\n"
.LC5:
	.string	"Usage: burrito [path]\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB26:
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
	mov	rbp, rsi	# argv, argv
	push	rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	ebx, edi	# argc, argc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 64
# src/main.c:62:     initVM();
	call	initVM@PLT	#
# src/main.c:64:     if (argc == 1) {
	cmp	ebx, 1	# argc,
	je	.L20	#,
# src/main.c:66:     } else if (argc == 2) {
	cmp	ebx, 2	# argc,
	jne	.L13	#,
# src/main.c:67:         runFile(argv[1]);
	mov	r13, QWORD PTR 8[rbp]	# _1, MEM[(char * *)argv_9(D) + 8B]
# src/main.c:25:     FILE* file = fopen(path, "rb");
	lea	rsi, .LC1[rip]	#,
	mov	rdi, r13	#, _1
	call	fopen@PLT	#
# src/main.c:26:     if (file == NULL) {
	test	rax, rax	# file
# src/main.c:25:     FILE* file = fopen(path, "rb");
	mov	rbx, rax	# file,
# src/main.c:26:     if (file == NULL) {
	je	.L21	#,
# src/main.c:31:     fseek(file, 0L, SEEK_END);
	xor	esi, esi	#
	mov	edx, 2	#,
	mov	rdi, rax	#, file
	call	fseek@PLT	#
# src/main.c:32:     size_t fileSize = ftell(file);
	mov	rdi, rbx	#, file
	call	ftell@PLT	#
	mov	r12, rax	# _17,
# src/main.c:33:     rewind(file);
	mov	rdi, rbx	#, file
	call	rewind@PLT	#
# src/main.c:35:     char* buffer = (char*) malloc(fileSize + 1);
	lea	rdi, 1[r12]	# _19,
	call	malloc@PLT	#
# src/main.c:36:     if (buffer == NULL) {
	test	rax, rax	# buffer
# src/main.c:35:     char* buffer = (char*) malloc(fileSize + 1);
	mov	rbp, rax	# buffer,
# src/main.c:36:     if (buffer == NULL) {
	je	.L22	#,
# src/main.c:41:     size_t bytesRead = fread(buffer, sizeof(char), fileSize, file);
	mov	rcx, rbx	#, file
	mov	rdx, r12	#, _17
	mov	esi, 1	#,
	mov	rdi, rax	#, buffer
	call	fread@PLT	#
# src/main.c:42:     if (bytesRead < fileSize) {
	cmp	rax, r12	# bytesRead, _17
# src/main.c:41:     size_t bytesRead = fread(buffer, sizeof(char), fileSize, file);
	mov	rcx, rax	# bytesRead,
# src/main.c:42:     if (bytesRead < fileSize) {
	jb	.L23	#,
.L16:
# src/main.c:46:     buffer[bytesRead] = '\0';
	mov	BYTE PTR 0[rbp+rcx], 0	# *_24,
# src/main.c:48:     fclose(file);
	mov	rdi, rbx	#, file
	call	fclose@PLT	#
# src/main.c:54:     InterpretResult result = interpret(source);
	mov	rdi, rbp	#, buffer
	call	interpret@PLT	#
	mov	ebx, eax	# result,
# src/main.c:55:     free(source);
	mov	rdi, rbp	#, buffer
	call	free@PLT	#
# src/main.c:57:     if (result == INTERPRET_COMPILE_ERROR) exit(65);
	cmp	ebx, 1	# result,
	je	.L24	#,
# src/main.c:58:     if (result == INTERPRET_RUNTIME_ERROR) exit(70);
	cmp	ebx, 2	# result,
	je	.L25	#,
.L12:
# src/main.c:73:     freeVM();
	call	freeVM@PLT	#
# src/main.c:75: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	xor	eax, eax	#
	pop	r13	#
	.cfi_def_cfa_offset 8
	ret	
.L23:
	.cfi_restore_state
# src/main.c:43:         fprintf(stderr, "Could not read file \"%s\".\n", path);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	QWORD PTR 8[rsp], rax	# %sfp, bytesRead
	mov	rdx, r13	#, _1
	lea	rsi, .LC4[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
	mov	rcx, QWORD PTR 8[rsp]	# bytesRead, %sfp
	jmp	.L16	#
.L20:
# src/main.c:65:         repl();
	call	repl	#
	jmp	.L12	#
.L13:
# src/main.c:69:         fprintf(stderr, "Usage: burrito [path]\n");
	mov	rcx, QWORD PTR stderr[rip]	#, stderr
	lea	rdi, .LC5[rip]	#,
	mov	edx, 22	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
# src/main.c:70:         exit(64);
	mov	edi, 64	#,
	call	exit@PLT	#
.L22:
# src/main.c:37:         fprintf(stderr, "Not enough memory to read \"%s\".\n", path);
	mov	rdx, r13	#, _1
	lea	rsi, .LC3[rip]	#,
.L19:
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/main.c:38:         exit(74);
	mov	edi, 74	#,
	call	exit@PLT	#
.L21:
# src/main.c:27:         fprintf(stderr, "Could not open file \"%s\".\n", path);
	mov	rdx, r13	#, _1
	lea	rsi, .LC2[rip]	#,
	jmp	.L19	#
.L25:
# src/main.c:58:     if (result == INTERPRET_RUNTIME_ERROR) exit(70);
	mov	edi, 70	#,
	call	exit@PLT	#
.L24:
# src/main.c:57:     if (result == INTERPRET_COMPILE_ERROR) exit(65);
	mov	edi, 65	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
