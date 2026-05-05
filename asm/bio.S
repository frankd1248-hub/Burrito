	.file	"bio.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"readFile() expects one string argument."
	.section	.rodata.str1.1
.LC2:
	.string	"Failed to read file"
	.text
	.p2align 4
	.type	"readFileNative", @function
"readFileNative":
.LFB31:
	.cfi_startproc
	sub	rsp, 56	#,
	.cfi_def_cfa_offset 64
	mov	QWORD PTR 24[rsp], rbx	#,
	.cfi_offset 3, -40
	mov	rbx, rdx	# result, result
# src/natives/bio.c:111:     if (argCount != 1 || !IS_STRING(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L2	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, -1125899906842624	# tmp127,
# src/natives/bio.c:111:     if (argCount != 1 || !IS_STRING(args[0])) {
	mov	rdx, QWORD PTR [rsi]	# _1, *args_12(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r8, rdx	# _13, _1
	and	r8, rcx	# _13, tmp127
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	r8, rcx	# _13, tmp127
	je	.L12	#,
.L2:
# src/natives/bio.c:112:         *result = OBJ_VAL(copyString("readFile() expects one string argument.", 39));
	mov	esi, 39	#,
	lea	rdi, .LC1[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bio.c:112:         *result = OBJ_VAL(copyString("readFile() expects one string argument.", 39));
	movabs	rdx, -1125899906842624	# tmp139,
	or	rax, rdx	# tmp140, tmp139
	mov	QWORD PTR [rbx], rax	# *result_14(D), tmp140
.L6:
# src/natives/bio.c:109: static bool readFileNative(int argCount, Value* args, Value* result) {
	xor	eax, eax	# <retval>
.L1:
# src/natives/bio.c:123: }
	mov	rbx, QWORD PTR 24[rsp]	#,
	add	rsp, 56	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, 1125899906842623	# tmp129,
	and	rdx, rax	# _20, tmp129
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rdx], 9	# _20->type,
	jne	.L2	#,
# src/natives/bio.c:76:     FILE* file = fopen(fn, "r");
	mov	rdi, QWORD PTR 24[rdx]	# MEM[(struct ObjString *)_20].chars, MEM[(struct ObjString *)_20].chars
	lea	rsi, .LC0[rip]	#,
	mov	QWORD PTR 40[rsp], r14	#,
	mov	QWORD PTR [rsp], r8	# %sfp, _13
	.cfi_offset 14, -24
	call	"fopen"@PLT	#
	mov	r14, rax	# tmp148,
# src/natives/bio.c:77:     if (file == NULL) return false;
	test	rax, rax	# tmp148
	je	.L3	#,
# src/natives/bio.c:79:     fseek(file, 0, SEEK_END);
	xor	esi, esi	#
	mov	edx, 2	#,
	mov	rdi, rax	#, tmp148
	mov	QWORD PTR 48[rsp], r15	#,
	mov	QWORD PTR 32[rsp], rbp	#,
	.cfi_offset 15, -16
	.cfi_offset 6, -32
# src/natives/bio.c:79:     fseek(file, 0, SEEK_END);
	call	"fseek"@PLT	#
# src/natives/bio.c:80:     long fsize = ftell(file);
	mov	rdi, r14	#, tmp148
	call	"ftell"@PLT	#
# src/natives/bio.c:81:     rewind(file);
	mov	rdi, r14	#, tmp148
# src/natives/bio.c:80:     long fsize = ftell(file);
	mov	r15, rax	# fsize,
# src/natives/bio.c:81:     rewind(file);
	call	"rewind"@PLT	#
# src/natives/bio.c:83:     char* buf = malloc(sizeof(char) * (fsize + 1));
	lea	rdi, 1[r15]	# _24,
# src/natives/bio.c:83:     char* buf = malloc(sizeof(char) * (fsize + 1));
	call	"malloc"@PLT	#
# src/natives/bio.c:84:     if (buf == NULL) {
	mov	r8, QWORD PTR [rsp]	# _13, %sfp
	test	rax, rax	#
	je	.L13	#,
# src/natives/bio.c:89:     long red = fread(buf, sizeof(char), fsize, file);
	mov	rcx, r14	#, tmp148
	mov	rdx, r15	#, fsize
	mov	esi, 1	#,
	mov	rdi, rax	#,
	mov	QWORD PTR 8[rsp], r8	# %sfp, _13
	mov	QWORD PTR [rsp], rax	# %sfp,
	call	"fread"@PLT	#
# src/natives/bio.c:90:     buf[red] = '\0';
	mov	r9, QWORD PTR [rsp]	# tmp150, %sfp
# src/natives/bio.c:92:     *result = OBJ_VAL(copyString(buf, red));
	mov	esi, eax	# _28, _28
# src/natives/bio.c:90:     buf[red] = '\0';
	mov	BYTE PTR [r9+rax], 0	# *_29,
# src/natives/bio.c:92:     *result = OBJ_VAL(copyString(buf, red));
	mov	rdi, r9	#, tmp150
	call	"copyString"@PLT	#
# src/natives/bio.c:92:     *result = OBJ_VAL(copyString(buf, red));
	or	rax, QWORD PTR 8[rsp]	# tmp137, %sfp
# src/natives/bio.c:93:     fclose(file);
	mov	rdi, r14	#, tmp148
# src/natives/bio.c:92:     *result = OBJ_VAL(copyString(buf, red));
	mov	QWORD PTR [rbx], rax	# *result_14(D), tmp137
# src/natives/bio.c:93:     fclose(file);
	call	"fclose"@PLT	#
# src/natives/bio.c:94:     free(buf);
	mov	rdi, QWORD PTR [rsp]	#, %sfp
	call	"free"@PLT	#
	mov	rbp, QWORD PTR 32[rsp]	#,
	.cfi_remember_state
	.cfi_restore 6
	mov	r14, QWORD PTR 40[rsp]	#,
	.cfi_restore 14
# src/natives/bio.c:122:     return true;
	mov	eax, 1	# <retval>,
	mov	r15, QWORD PTR 48[rsp]	#,
	.cfi_restore 15
	jmp	.L1	#
.L13:
	.cfi_restore_state
# src/natives/bio.c:85:         fclose(file);
	mov	rdi, r14	#, tmp148
	call	"fclose"@PLT	#
	mov	rbp, QWORD PTR 32[rsp]	#,
	.cfi_restore 6
	mov	r15, QWORD PTR 48[rsp]	#,
	.cfi_restore 15
.L3:
# src/natives/bio.c:119:         *result = OBJ_VAL(copyString("Failed to read file", 19));
	mov	esi, 19	#,
	lea	rdi, .LC2[rip]	#,
	call	"copyString"@PLT	#
	mov	r14, QWORD PTR 40[rsp]	#,
	.cfi_restore 14
# src/natives/bio.c:119:         *result = OBJ_VAL(copyString("Failed to read file", 19));
	movabs	rdx, -1125899906842624	# tmp142,
	or	rax, rdx	# tmp143, tmp142
	mov	QWORD PTR [rbx], rax	# *result_14(D), tmp143
	jmp	.L6	#
	.cfi_endproc
.LFE31:
	.size	"readFileNative", .-"readFileNative"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"readLine() does not expect arguments."
	.text
	.p2align 4
	.type	"readLineNative", @function
"readLineNative":
.LFB28:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 32[rsp], r13	#,
	.cfi_offset 13, -16
	mov	r13, rdx	# result, result
# src/natives/bio.c:53:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L25	#,
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -32
	mov	ebp, edi	# argCount, argCount
# src/natives/bio.c:59:     char* buf = malloc(sizeof(char) * 512);
	mov	edi, 512	#,
	mov	QWORD PTR 8[rsp], rbx	#,
	mov	QWORD PTR 24[rsp], r12	#,
	.cfi_offset 3, -40
	.cfi_offset 12, -24
# src/natives/bio.c:59:     char* buf = malloc(sizeof(char) * 512);
	call	"malloc"@PLT	#
	mov	r12, rax	# buf,
	mov	rbx, rax	# ivtmp.27, buf
	.p2align 4
	.p2align 3
.L17:
# /usr/include/bits/stdio.h:49:   return getc (stdin);
	mov	rdi, QWORD PTR "stdin"[rip]	#, stdin
	call	"getc"@PLT	#
	mov	esi, ebp	# count, argCount
# src/natives/bio.c:65:         buf[count++] = c;
	mov	rdx, rbx	# _2, ivtmp.27
# src/natives/bio.c:65:         buf[count++] = c;
	add	ebp, 1	# argCount,
# src/natives/bio.c:65:         buf[count++] = c;
	mov	BYTE PTR [rbx], al	# MEM[(char *)_2], _28
# src/natives/bio.c:66:     } while (c != '\n' && c != EOF);
	add	rbx, 1	# ivtmp.27,
	cmp	eax, 10	# _28,
	je	.L19	#,
	cmp	eax, -1	# _28,
	jne	.L17	#,
.L19:
# src/natives/bio.c:68:     buf[count] = '\0';
	mov	BYTE PTR [rdx], 0	# *_2,
# src/natives/bio.c:70:     *result = OBJ_VAL(copyString(buf, count));
	mov	rdi, r12	#, buf
	call	"copyString"@PLT	#
# src/natives/bio.c:71:     free(buf);
	mov	rdi, r12	#, buf
# src/natives/bio.c:70:     *result = OBJ_VAL(copyString(buf, count));
	movabs	rdx, -1125899906842624	# tmp127,
	or	rax, rdx	# tmp128, tmp127
	mov	QWORD PTR 0[r13], rax	# *result_23(D), tmp128
# src/natives/bio.c:71:     free(buf);
	call	"free"@PLT	#
# src/natives/bio.c:72:     return true;
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_restore 3
	mov	rbp, QWORD PTR 16[rsp]	#,
	.cfi_restore 6
	mov	eax, 1	# <retval>,
	mov	r12, QWORD PTR 24[rsp]	#,
	.cfi_restore 12
# src/natives/bio.c:73: }
	mov	r13, QWORD PTR 32[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_def_cfa_offset 48
# src/natives/bio.c:54:         *result = OBJ_VAL(copyString("readLine() does not expect arguments.", 37));
	mov	esi, 37	#,
	lea	rdi, .LC3[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bio.c:54:         *result = OBJ_VAL(copyString("readLine() does not expect arguments.", 37));
	movabs	rdx, -1125899906842624	# tmp119,
	or	rax, rdx	# tmp120, tmp119
	mov	QWORD PTR 0[r13], rax	# *result_23(D), tmp120
# src/natives/bio.c:73: }
	mov	r13, QWORD PTR 32[rsp]	#,
# src/natives/bio.c:54:         *result = OBJ_VAL(copyString("readLine() does not expect arguments.", 37));
	xor	eax, eax	# <retval>
# src/natives/bio.c:73: }
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE28:
	.size	"readLineNative", .-"readLineNative"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"getNumber() does not expect arguments."
	.section	.rodata.str1.1
.LC5:
	.string	"%lf"
.LC6:
	.string	"Failed to read number."
	.text
	.p2align 4
	.type	"getNumberNative", @function
"getNumberNative":
.LFB26:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bio.c:8: static bool getNumberNative(int argCount, Value* args, Value* result) {
	mov	rbx, QWORD PTR fs:40	# result, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 8[rsp], rbx	# D.5119, result
	mov	rbx, rdx	# result, result
# src/natives/bio.c:10:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L40	#,
# src/natives/bio.c:17:     if (scanf("%lf", &d) != 1) {
	xor	eax, eax	#
	mov	rsi, rsp	# tmp115,
	lea	rdi, .LC5[rip]	#,
	call	__isoc23_scanf@PLT	#
# src/natives/bio.c:17:     if (scanf("%lf", &d) != 1) {
	cmp	eax, 1	# _4,
	je	.L29	#,
# src/natives/bio.c:18:         *result = OBJ_VAL(copyString("Failed to read number.", 23));
	mov	esi, 23	#,
	lea	rdi, .LC6[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bio.c:18:         *result = OBJ_VAL(copyString("Failed to read number.", 23));
	movabs	rdx, -1125899906842624	# tmp118,
	or	rax, rdx	# _20, tmp118
	xor	edx, edx	# <retval>
	jmp	.L28	#
	.p2align 4,,10
	.p2align 3
.L41:
# src/natives/bio.c:23:     while ((c = getchar()) != '\n' && c != EOF);
	cmp	eax, -1	# _19,
	je	.L30	#,
.L29:
# /usr/include/bits/stdio.h:49:   return getc (stdin);
	mov	rdi, QWORD PTR "stdin"[rip]	#, stdin
	call	"getc"@PLT	#
# src/natives/bio.c:23:     while ((c = getchar()) != '\n' && c != EOF);
	cmp	eax, 10	# _19,
	jne	.L41	#,
.L30:
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	mov	rax, QWORD PTR [rsp]	# _20, d
# src/natives/bio.c:26:     return true;
	mov	edx, 1	# <retval>,
.L28:
# src/natives/bio.c:18:         *result = OBJ_VAL(copyString("Failed to read number.", 23));
	mov	QWORD PTR [rbx], rax	# *result_12(D), _20
# src/natives/bio.c:27: }
	mov	rax, QWORD PTR 8[rsp]	# tmp128, D.5119
	sub	rax, QWORD PTR fs:40	# tmp128, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L42	#,
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
# src/natives/bio.c:11:         *result = OBJ_VAL(copyString("getNumber() does not expect arguments.", 38));
	mov	esi, 38	#,
	lea	rdi, .LC4[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bio.c:11:         *result = OBJ_VAL(copyString("getNumber() does not expect arguments.", 38));
	movabs	rdx, -1125899906842624	# tmp114,
	or	rax, rdx	# _20, tmp114
# src/natives/bio.c:12:         return false;
	xor	edx, edx	# <retval>
	jmp	.L28	#
.L42:
# src/natives/bio.c:27: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE26:
	.size	"getNumberNative", .-"getNumberNative"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"getString() does not expect arguments."
	.section	.rodata.str1.1
.LC8:
	.string	"%511s"
.LC9:
	.string	"Failed to read string."
	.text
	.p2align 4
	.type	"getStringNative", @function
"getStringNative":
.LFB27:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -16
	mov	rbp, rdx	# result, result
# src/natives/bio.c:31:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L57	#,
# src/natives/bio.c:37:     char* buf = malloc(sizeof(char) * 512);
	mov	edi, 512	#,
	mov	QWORD PTR 8[rsp], rbx	#,
	.cfi_offset 3, -24
# src/natives/bio.c:37:     char* buf = malloc(sizeof(char) * 512);
	call	"malloc"@PLT	#
# src/natives/bio.c:38:     if (scanf("%511s", buf) != 1) {
	lea	rdi, .LC8[rip]	#,
# src/natives/bio.c:37:     char* buf = malloc(sizeof(char) * 512);
	mov	rbx, rax	# tmp136,
# src/natives/bio.c:38:     if (scanf("%511s", buf) != 1) {
	mov	rsi, rax	#, tmp136
	xor	eax, eax	#
	call	__isoc23_scanf@PLT	#
# src/natives/bio.c:38:     if (scanf("%511s", buf) != 1) {
	cmp	eax, 1	# _15,
	je	.L46	#,
# src/natives/bio.c:39:         *result = OBJ_VAL(copyString("Failed to read string.", 23));
	mov	esi, 23	#,
	lea	rdi, .LC9[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bio.c:40:         return false;
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_restore 3
# src/natives/bio.c:39:         *result = OBJ_VAL(copyString("Failed to read string.", 23));
	movabs	rdx, -1125899906842624	# tmp123,
	or	rax, rdx	# tmp124, tmp123
	mov	QWORD PTR 0[rbp], rax	# *result_7(D), tmp124
# src/natives/bio.c:33:         return false;
	xor	eax, eax	# <retval>
.L59:
# src/natives/bio.c:49: }
	mov	rbp, QWORD PTR 16[rsp]	#,
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
# src/natives/bio.c:44:     while ((c = getchar()) != '\n' && c != EOF);
	cmp	eax, -1	# _20,
	je	.L48	#,
.L46:
# /usr/include/bits/stdio.h:49:   return getc (stdin);
	mov	rdi, QWORD PTR "stdin"[rip]	#, stdin
	call	"getc"@PLT	#
# src/natives/bio.c:44:     while ((c = getchar()) != '\n' && c != EOF);
	cmp	eax, 10	# _20,
	jne	.L58	#,
.L48:
# src/natives/bio.c:46:     *result = OBJ_VAL(copyString(buf, strlen(buf)));
	mov	rdi, rbx	#, tmp136
	call	"strlen"@PLT	#
# src/natives/bio.c:46:     *result = OBJ_VAL(copyString(buf, strlen(buf)));
	mov	rdi, rbx	#, tmp136
	mov	esi, eax	# _21, tmp140
	call	"copyString"@PLT	#
# src/natives/bio.c:47:     free(buf);
	mov	rdi, rbx	#, tmp136
# src/natives/bio.c:46:     *result = OBJ_VAL(copyString(buf, strlen(buf)));
	movabs	rdx, -1125899906842624	# tmp130,
	or	rax, rdx	# tmp131, tmp130
	mov	QWORD PTR 0[rbp], rax	# *result_7(D), tmp131
# src/natives/bio.c:47:     free(buf);
	call	"free"@PLT	#
# src/natives/bio.c:48:     return true;
	mov	rbx, QWORD PTR 8[rsp]	#,
	.cfi_restore 3
# src/natives/bio.c:49: }
	mov	rbp, QWORD PTR 16[rsp]	#,
# src/natives/bio.c:48:     return true;
	mov	eax, 1	# <retval>,
# src/natives/bio.c:49: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L57:
	.cfi_def_cfa_offset 32
# src/natives/bio.c:32:         *result = OBJ_VAL(copyString("getString() does not expect arguments.", 38));
	mov	esi, 38	#,
	lea	rdi, .LC7[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bio.c:32:         *result = OBJ_VAL(copyString("getString() does not expect arguments.", 38));
	movabs	rdx, -1125899906842624	# tmp118,
	or	rax, rdx	# tmp119, tmp118
	mov	QWORD PTR 0[rbp], rax	# *result_7(D), tmp119
# src/natives/bio.c:33:         return false;
	xor	eax, eax	# <retval>
	jmp	.L59	#
	.cfi_endproc
.LFE27:
	.size	"getStringNative", .-"getStringNative"
	.section	.rodata.str1.1
.LC10:
	.string	"a"
.LC11:
	.string	"Failed to write file"
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"appendFile() expects two string arguments."
	.text
	.p2align 4
	.type	"appendFileNative", @function
"appendFileNative":
.LFB33:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 24[rsp], rbx	#,
	.cfi_offset 3, -24
	mov	rbx, rdx	# result, result
# src/natives/bio.c:144:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L61	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp121,
# src/natives/bio.c:144:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_14(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# _16, _1
	and	rcx, rdx	# _16, tmp121
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rdx	# _16, tmp121
	je	.L65	#,
.L61:
# src/natives/bio.c:145:         *result = OBJ_VAL(copyString("appendFile() expects two string arguments.", 42));
	mov	esi, 42	#,
	lea	rdi, .LC12[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bio.c:145:         *result = OBJ_VAL(copyString("appendFile() expects two string arguments.", 42));
	movabs	rdx, -1125899906842624	# tmp134,
	or	rax, rdx	# _6, tmp134
# src/natives/bio.c:146:         return false;
	xor	edx, edx	# <retval>
.L63:
# src/natives/bio.c:152:         *result = OBJ_VAL(copyString("Failed to write file", 20));
	mov	QWORD PTR [rbx], rax	# *result_19(D), _6
# src/natives/bio.c:157: }
	mov	rbx, QWORD PTR 24[rsp]	#,
	mov	eax, edx	#, <retval>
	add	rsp, 40	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L65:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp123,
	and	rax, rdx	# _23, tmp123
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _23->type,
	jne	.L61	#,
# src/natives/bio.c:144:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	mov	rsi, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_14(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r8, rsi	# _25, _2
	and	r8, rcx	# _25, _16
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	r8, rcx	# _25, _16
	jne	.L61	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rsi, rdx	# _27, tmp123
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rsi], 9	# _27->type,
	jne	.L61	#,
# src/natives/bio.c:100:     FILE* file = fopen(fn, mode);
	mov	rdi, QWORD PTR 24[rax]	# MEM[(struct ObjString *)_23].chars, MEM[(struct ObjString *)_23].chars
	mov	QWORD PTR 32[rsp], r14	#,
	.cfi_offset 14, -16
# src/natives/bio.c:150:     bool res = write(AS_CSTRING(args[0]), AS_CSTRING(args[1]), "a");
	mov	r14, QWORD PTR 24[rsi]	# _7, MEM[(struct ObjString *)_27].chars
# src/natives/bio.c:100:     FILE* file = fopen(fn, mode);
	lea	rsi, .LC10[rip]	#,
	mov	QWORD PTR 8[rsp], r8	# %sfp, _25
	call	"fopen"@PLT	#
# src/natives/bio.c:101:     if (file == NULL) return false;
	test	rax, rax	#
	je	.L66	#,
# src/natives/bio.c:103:     fputs(toWrite, file);
	mov	rdi, r14	#, _7
	mov	rsi, rax	#,
	mov	QWORD PTR 8[rsp], rax	# %sfp,
	call	"fputs"@PLT	#
# src/natives/bio.c:104:     fclose(file);
	mov	rdi, QWORD PTR 8[rsp]	#, %sfp
	call	"fclose"@PLT	#
# src/natives/bio.c:156:     return true;
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_remember_state
	.cfi_restore 14
	mov	edx, 1	# <retval>,
	movabs	rax, 9222246136947933187	# _6,
	jmp	.L63	#
.L66:
	.cfi_restore_state
# src/natives/bio.c:152:         *result = OBJ_VAL(copyString("Failed to write file", 20));
	mov	esi, 20	#,
	lea	rdi, .LC11[rip]	#,
	call	"copyString"@PLT	#
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_restore 14
# src/natives/bio.c:152:         *result = OBJ_VAL(copyString("Failed to write file", 20));
	or	rax, QWORD PTR 8[rsp]	# _6, %sfp
	xor	edx, edx	# <retval>
	jmp	.L63	#
	.cfi_endproc
.LFE33:
	.size	"appendFileNative", .-"appendFileNative"
	.section	.rodata.str1.1
.LC13:
	.string	"w"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"writeFile() expects two string arguments."
	.text
	.p2align 4
	.type	"writeFileNative", @function
"writeFileNative":
.LFB32:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 24[rsp], rbx	#,
	.cfi_offset 3, -24
	mov	rbx, rdx	# result, result
# src/natives/bio.c:127:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L68	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp121,
# src/natives/bio.c:127:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_14(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# _16, _1
	and	rcx, rdx	# _16, tmp121
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rdx	# _16, tmp121
	je	.L72	#,
.L68:
# src/natives/bio.c:128:         *result = OBJ_VAL(copyString("writeFile() expects two string arguments.", 41));
	mov	esi, 41	#,
	lea	rdi, .LC14[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bio.c:128:         *result = OBJ_VAL(copyString("writeFile() expects two string arguments.", 41));
	movabs	rdx, -1125899906842624	# tmp134,
	or	rax, rdx	# _6, tmp134
# src/natives/bio.c:129:         return false;
	xor	edx, edx	# <retval>
.L70:
# src/natives/bio.c:152:         *result = OBJ_VAL(copyString("Failed to write file", 20));
	mov	QWORD PTR [rbx], rax	# *result_19(D), _6
# src/natives/bio.c:140: }
	mov	rbx, QWORD PTR 24[rsp]	#,
	mov	eax, edx	#, <retval>
	add	rsp, 40	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L72:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp123,
	and	rax, rdx	# _23, tmp123
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _23->type,
	jne	.L68	#,
# src/natives/bio.c:127:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	mov	rsi, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_14(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r8, rsi	# _25, _2
	and	r8, rcx	# _25, _16
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	r8, rcx	# _25, _16
	jne	.L68	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rsi, rdx	# _27, tmp123
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rsi], 9	# _27->type,
	jne	.L68	#,
# src/natives/bio.c:100:     FILE* file = fopen(fn, mode);
	mov	rdi, QWORD PTR 24[rax]	# MEM[(struct ObjString *)_23].chars, MEM[(struct ObjString *)_23].chars
	mov	QWORD PTR 32[rsp], r14	#,
	.cfi_offset 14, -16
# src/natives/bio.c:133:     bool res = write(AS_CSTRING(args[0]), AS_CSTRING(args[1]), "w");
	mov	r14, QWORD PTR 24[rsi]	# _7, MEM[(struct ObjString *)_27].chars
# src/natives/bio.c:100:     FILE* file = fopen(fn, mode);
	lea	rsi, .LC13[rip]	#,
	mov	QWORD PTR 8[rsp], r8	# %sfp, _25
	call	"fopen"@PLT	#
# src/natives/bio.c:101:     if (file == NULL) return false;
	test	rax, rax	#
	je	.L73	#,
# src/natives/bio.c:103:     fputs(toWrite, file);
	mov	rdi, r14	#, _7
	mov	rsi, rax	#,
	mov	QWORD PTR 8[rsp], rax	# %sfp,
	call	"fputs"@PLT	#
# src/natives/bio.c:104:     fclose(file);
	mov	rdi, QWORD PTR 8[rsp]	#, %sfp
	call	"fclose"@PLT	#
# src/natives/bio.c:139:     return true;
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_remember_state
	.cfi_restore 14
	mov	edx, 1	# <retval>,
	movabs	rax, 9222246136947933187	# _6,
	jmp	.L70	#
.L73:
	.cfi_restore_state
# src/natives/bio.c:152:         *result = OBJ_VAL(copyString("Failed to write file", 20));
	mov	esi, 20	#,
	lea	rdi, .LC11[rip]	#,
	call	"copyString"@PLT	#
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_restore 14
# src/natives/bio.c:152:         *result = OBJ_VAL(copyString("Failed to write file", 20));
	or	rax, QWORD PTR 8[rsp]	# _6, %sfp
	xor	edx, edx	# <retval>
	jmp	.L70	#
	.cfi_endproc
.LFE32:
	.size	"writeFileNative", .-"writeFileNative"
	.section	.rodata.str1.1
.LC15:
	.string	"getNumber"
.LC16:
	.string	"getString"
.LC17:
	.string	"readLine"
.LC18:
	.string	"readFile"
.LC19:
	.string	"writeFile"
.LC20:
	.string	"appendFile"
	.text
	.p2align 4
	.globl	"buildIOModule"
	.type	"buildIOModule", @function
"buildIOModule":
.LFB34:
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
# src/natives/bio.c:161:     push(OBJ_VAL(module));
	movabs	rbx, -1125899906842624	# tmp127,
# src/natives/bio.c:159: ObjModule* buildIOModule() {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 48
# src/natives/bio.c:160:     ObjModule* module = newModule();
	call	"newModule"@PLT	#
# src/natives/bio.c:161:     push(OBJ_VAL(module));
	mov	rdi, rax	# _2, <retval>
# src/natives/bio.c:160:     ObjModule* module = newModule();
	mov	r12, rax	# <retval>,
# src/natives/bio.c:161:     push(OBJ_VAL(module));
	or	rdi, rbx	# _2, tmp127
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	lea	rbp, 16[r12]	# _7,
# src/natives/bio.c:161:     push(OBJ_VAL(module));
	call	"push"@PLT	#
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	lea	rdi, "getNumberNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	mov	esi, 9	#,
	lea	rdi, .LC15[rip]	#,
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	mov	r13, rax	# _3,
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	call	"copyString"@PLT	#
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	mov	rdx, r13	# _3, _3
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	mov	rdi, rbp	#, _7
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	or	rdx, rbx	# _3, tmp127
# src/natives/bio.c:163:     tableSet(&module->table, copyString("getNumber", 9), OBJ_VAL(newNative(getNumberNative)));
	mov	rsi, rax	#, _6
	call	"tableSet"@PLT	#
# src/natives/bio.c:164:     tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
	lea	rdi, "getStringNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bio.c:164:     tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
	mov	esi, 9	#,
	lea	rdi, .LC16[rip]	#,
# src/natives/bio.c:164:     tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
	mov	r13, rax	# _8,
# src/natives/bio.c:164:     tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
	call	"copyString"@PLT	#
# src/natives/bio.c:164:     tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
	mov	rdx, r13	# _8, _8
# src/natives/bio.c:164:     tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
	mov	rdi, rbp	#, _7
# src/natives/bio.c:164:     tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
	or	rdx, rbx	# _8, tmp127
# src/natives/bio.c:164:     tableSet(&module->table, copyString("getString", 9), OBJ_VAL(newNative(getStringNative)));
	mov	rsi, rax	#, _11
	call	"tableSet"@PLT	#
# src/natives/bio.c:165:     tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
	lea	rdi, "readLineNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bio.c:165:     tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
	mov	esi, 8	#,
	lea	rdi, .LC17[rip]	#,
# src/natives/bio.c:165:     tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
	mov	r13, rax	# _12,
# src/natives/bio.c:165:     tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
	call	"copyString"@PLT	#
# src/natives/bio.c:165:     tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
	mov	rdx, r13	# _12, _12
# src/natives/bio.c:165:     tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
	mov	rdi, rbp	#, _7
# src/natives/bio.c:165:     tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
	or	rdx, rbx	# _12, tmp127
# src/natives/bio.c:165:     tableSet(&module->table, copyString("readLine", 8), OBJ_VAL(newNative(readLineNative)));
	mov	rsi, rax	#, _15
	call	"tableSet"@PLT	#
# src/natives/bio.c:166:     tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
	lea	rdi, "readFileNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bio.c:166:     tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
	mov	esi, 8	#,
	lea	rdi, .LC18[rip]	#,
# src/natives/bio.c:166:     tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
	mov	r13, rax	# _16,
# src/natives/bio.c:166:     tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
	call	"copyString"@PLT	#
# src/natives/bio.c:166:     tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
	mov	rdx, r13	# _16, _16
# src/natives/bio.c:166:     tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
	mov	rdi, rbp	#, _7
# src/natives/bio.c:166:     tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
	or	rdx, rbx	# _16, tmp127
# src/natives/bio.c:166:     tableSet(&module->table, copyString("readFile", 8), OBJ_VAL(newNative(readFileNative)));
	mov	rsi, rax	#, _19
	call	"tableSet"@PLT	#
# src/natives/bio.c:167:     tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
	lea	rdi, "writeFileNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bio.c:167:     tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
	mov	esi, 9	#,
	lea	rdi, .LC19[rip]	#,
# src/natives/bio.c:167:     tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
	mov	r13, rax	# _20,
# src/natives/bio.c:167:     tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
	call	"copyString"@PLT	#
# src/natives/bio.c:167:     tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
	mov	rdx, r13	# _20, _20
# src/natives/bio.c:167:     tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
	mov	rdi, rbp	#, _7
# src/natives/bio.c:167:     tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
	or	rdx, rbx	# _20, tmp127
# src/natives/bio.c:167:     tableSet(&module->table, copyString("writeFile", 9), OBJ_VAL(newNative(writeFileNative)));
	mov	rsi, rax	#, _23
	call	"tableSet"@PLT	#
# src/natives/bio.c:168:     tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
	lea	rdi, "appendFileNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bio.c:168:     tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
	mov	esi, 10	#,
	lea	rdi, .LC20[rip]	#,
# src/natives/bio.c:168:     tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
	mov	r13, rax	# _24,
# src/natives/bio.c:168:     tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
	call	"copyString"@PLT	#
# src/natives/bio.c:168:     tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
	mov	rdx, r13	# _24, _24
# src/natives/bio.c:168:     tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
	mov	rdi, rbp	#, _7
# src/natives/bio.c:168:     tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
	or	rdx, rbx	# _24, tmp127
# src/natives/bio.c:168:     tableSet(&module->table, copyString("appendFile", 10), OBJ_VAL(newNative(appendFileNative)));
	mov	rsi, rax	#, _27
	call	"tableSet"@PLT	#
# src/natives/bio.c:170:     pop();
	call	"pop"@PLT	#
# src/natives/bio.c:172: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 40
	mov	rax, r12	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE34:
	.size	"buildIOModule", .-"buildIOModule"
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
