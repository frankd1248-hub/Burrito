	.file	"main.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"> "
	.text
	.p2align 4
	.type	"repl", @function
"repl":
.LFB26:
	.cfi_startproc
	sub	rsp, 1048	#,
	.cfi_def_cfa_offset 1056
# src/main.c:10: static void repl() {
	mov	rax, QWORD PTR fs:40	# tmp101, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 1032[rsp], rax	# D.4912, tmp101
	xor	eax, eax	# tmp101
	jmp	.L3	#
	.p2align 4,,10
	.p2align 3
.L2:
# src/main.c:20:         interpret(line);
	mov	rdi, rsp	#,
	call	"interpret"@PLT	#
.L3:
# src/main.c:13:         printf("> ");
	lea	rdi, .LC0[rip]	#,
	xor	eax, eax	#
	call	"printf"@PLT	#
# src/main.c:15:         if (!fgets(line, sizeof(line), stdin)) {
	mov	rdx, QWORD PTR "stdin"[rip]	#, stdin
	mov	esi, 1024	#,
	mov	rdi, rsp	#,
	call	"fgets"@PLT	#
# src/main.c:15:         if (!fgets(line, sizeof(line), stdin)) {
	test	rax, rax	# _2
	jne	.L2	#,
# src/main.c:16:             printf("\n");
	mov	edi, 10	#,
	call	"putchar"@PLT	#
# src/main.c:22: }
	mov	rax, QWORD PTR 1032[rsp]	# tmp110, D.4912
	sub	rax, QWORD PTR fs:40	# tmp110, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L8	#,
	add	rsp, 1048	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L8:
	.cfi_restore_state
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE26:
	.size	"repl", .-"repl"
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
	.globl	"main"
	.type	"main", @function
"main":
.LFB29:
	.cfi_startproc
	sub	rsp, 56	#,
	.cfi_def_cfa_offset 64
	mov	QWORD PTR 24[rsp], rbx	#,
	.cfi_offset 3, -40
	mov	ebx, edi	# argc, argc
	mov	QWORD PTR 32[rsp], rbp	#,
	.cfi_offset 6, -32
	mov	rbp, rsi	# argv, argv
# src/main.c:62:     initVM();
	call	"initVM"@PLT	#
# src/main.c:64:     if (argc == 1) {
	cmp	ebx, 1	# argc,
	je	.L20	#,
	mov	QWORD PTR 40[rsp], r12	#,
	mov	QWORD PTR 48[rsp], r13	#,
	.cfi_offset 12, -24
	.cfi_offset 13, -16
# src/main.c:66:     } else if (argc == 2) {
	cmp	ebx, 2	# argc,
	jne	.L12	#,
# src/main.c:67:         runFile(argv[1]);
	mov	r13, QWORD PTR 8[rbp]	# _1, MEM[(char * *)argv_9(D) + 8B]
# src/main.c:25:     FILE* file = fopen(path, "rb");
	lea	rsi, .LC1[rip]	#,
	mov	rdi, r13	#, _1
	call	"fopen"@PLT	#
	mov	rbx, rax	# file,
# src/main.c:26:     if (file == NULL) {
	test	rax, rax	# file
	je	.L21	#,
# src/main.c:31:     fseek(file, 0L, SEEK_END);
	mov	edx, 2	#,
	xor	esi, esi	#
	mov	rdi, rax	#, file
	call	"fseek"@PLT	#
# src/main.c:32:     size_t fileSize = ftell(file);
	mov	rdi, rbx	#, file
	call	"ftell"@PLT	#
# src/main.c:33:     rewind(file);
	mov	rdi, rbx	#, file
# src/main.c:32:     size_t fileSize = ftell(file);
	mov	r12, rax	# _17,
# src/main.c:33:     rewind(file);
	call	"rewind"@PLT	#
# src/main.c:35:     char* buffer = (char*) malloc(fileSize + 1);
	lea	rdi, 1[r12]	# _19,
	call	"malloc"@PLT	#
	mov	rbp, rax	# buffer,
# src/main.c:36:     if (buffer == NULL) {
	test	rax, rax	# buffer
	je	.L22	#,
# src/main.c:41:     size_t bytesRead = fread(buffer, sizeof(char), fileSize, file);
	mov	rcx, rbx	#, file
	mov	rdx, r12	#, _17
	mov	esi, 1	#,
	mov	rdi, rax	#, buffer
	call	"fread"@PLT	#
	mov	rcx, rax	# bytesRead,
# src/main.c:42:     if (bytesRead < fileSize) {
	cmp	rax, r12	# bytesRead, _17
	jb	.L23	#,
.L15:
# src/main.c:46:     buffer[bytesRead] = '\0';
	mov	BYTE PTR 0[rbp+rcx], 0	# *_24,
# src/main.c:48:     fclose(file);
	mov	rdi, rbx	#, file
	call	"fclose"@PLT	#
# src/main.c:54:     InterpretResult result = interpret(source);
	mov	rdi, rbp	#, buffer
	call	"interpret"@PLT	#
# src/main.c:55:     free(source);
	mov	rdi, rbp	#, buffer
# src/main.c:54:     InterpretResult result = interpret(source);
	mov	ebx, eax	# result,
# src/main.c:55:     free(source);
	call	"free"@PLT	#
# src/main.c:57:     if (result == INTERPRET_COMPILE_ERROR) exit(65);
	cmp	ebx, 1	# result,
	je	.L24	#,
# src/main.c:58:     if (result == INTERPRET_RUNTIME_ERROR) exit(70);
	cmp	ebx, 2	# result,
	je	.L25	#,
	mov	r12, QWORD PTR 40[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 48[rsp]	#,
	.cfi_restore 13
.L11:
# src/main.c:73:     freeVM();
	call	"freeVM"@PLT	#
# src/main.c:75: }
	mov	rbx, QWORD PTR 24[rsp]	#,
	mov	rbp, QWORD PTR 32[rsp]	#,
	xor	eax, eax	#
	add	rsp, 56	#,
	.cfi_def_cfa_offset 8
	ret	
.L23:
	.cfi_def_cfa_offset 64
	.cfi_offset 12, -24
	.cfi_offset 13, -16
# src/main.c:43:         fprintf(stderr, "Could not read file \"%s\".\n", path);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	QWORD PTR 8[rsp], rax	# %sfp, bytesRead
	xor	eax, eax	#
	mov	rdx, r13	#, _1
	lea	rsi, .LC4[rip]	#,
	call	"fprintf"@PLT	#
	mov	rcx, QWORD PTR 8[rsp]	# bytesRead, %sfp
	jmp	.L15	#
.L20:
	.cfi_restore 12
	.cfi_restore 13
# src/main.c:65:         repl();
	call	"repl"	#
	jmp	.L11	#
.L12:
	.cfi_offset 12, -24
	.cfi_offset 13, -16
# src/main.c:69:         fprintf(stderr, "Usage: burrito [path]\n");
	mov	rcx, QWORD PTR "stderr"[rip]	#, stderr
	mov	edx, 22	#,
	mov	esi, 1	#,
	lea	rdi, .LC5[rip]	#,
	call	"fwrite"@PLT	#
# src/main.c:70:         exit(64);
	mov	edi, 64	#,
	call	"exit"@PLT	#
.L22:
# src/main.c:37:         fprintf(stderr, "Not enough memory to read \"%s\".\n", path);
	mov	rdx, r13	#, _1
	lea	rsi, .LC3[rip]	#,
.L19:
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/main.c:38:         exit(74);
	mov	edi, 74	#,
	call	"exit"@PLT	#
.L21:
# src/main.c:27:         fprintf(stderr, "Could not open file \"%s\".\n", path);
	mov	rdx, r13	#, _1
	lea	rsi, .LC2[rip]	#,
	jmp	.L19	#
.L25:
# src/main.c:58:     if (result == INTERPRET_RUNTIME_ERROR) exit(70);
	mov	edi, 70	#,
	call	"exit"@PLT	#
.L24:
# src/main.c:57:     if (result == INTERPRET_COMPILE_ERROR) exit(65);
	mov	edi, 65	#,
	call	"exit"@PLT	#
	.cfi_endproc
.LFE29:
	.size	"main", .-"main"
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
