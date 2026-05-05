	.file	"bmath.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"rand() does not expect arguments."
	.text
	.p2align 4
	.type	"randNative", @function
"randNative":
.LFB35:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bmath.c:145: static bool randNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bmath.c:147:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L6	#,
# src/natives/bmath.c:153:     *result = NUMBER_VAL(((double) rand()) / RAND_MAX);
	call	"rand"@PLT	#
# src/natives/bmath.c:153:     *result = NUMBER_VAL(((double) rand()) / RAND_MAX);
	pxor	xmm0, xmm0	# _5
	cvtsi2sd	xmm0, eax	# _5, _4
# src/natives/bmath.c:154:     return true;
	mov	eax, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	divsd	xmm0, QWORD PTR .LC1[rip]	# _12,
	movq	QWORD PTR [rbx], xmm0	# *result_13(D), _12
# src/natives/bmath.c:155: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
# src/natives/bmath.c:148:         *result = OBJ_VAL(copyString("rand() does not expect arguments.", 33));
	mov	esi, 33	#,
	lea	rdi, .LC0[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:148:         *result = OBJ_VAL(copyString("rand() does not expect arguments.", 33));
	movabs	rdx, -1125899906842624	# tmp109,
	or	rax, rdx	# _1, tmp109
	movq	xmm0, rax	# _12, _1
# src/natives/bmath.c:149:         return false;
	xor	eax, eax	# <retval>
	movq	QWORD PTR [rbx], xmm0	# *result_13(D), _12
# src/natives/bmath.c:155: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE35:
	.size	"randNative", .-"randNative"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"randRange() expects two number arguments."
	.text
	.p2align 4
	.type	"randRangeNative", @function
"randRangeNative":
.LFB36:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:159:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L8	#,
# src/natives/bmath.c:159:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	movabs	rcx, 9222246136947933184	# tmp118,
	mov	rax, QWORD PTR [rsi]	# _1, *args_16(D)
# src/natives/bmath.c:159:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	mov	rdx, rax	# tmp138, _1
	not	rdx	# tmp138
	test	rdx, rcx	# tmp138, tmp118
	je	.L8	#,
# src/natives/bmath.c:159:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	mov	rdx, QWORD PTR 8[rsi]	# _3, MEM[(Value *)args_16(D) + 8B]
# src/natives/bmath.c:159:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	mov	rsi, rdx	# tmp137, _3
	not	rsi	# tmp137
	test	rsi, rcx	# tmp137, tmp118
	je	.L8	#,
	mov	QWORD PTR 8[rsp], rdx	# %sfp, _3
	mov	QWORD PTR [rsp], rax	# %sfp, _1
# src/natives/bmath.c:167:     double r = ((double) rand()) / RAND_MAX;
	call	"rand"@PLT	#
# src/natives/bmath.c:169:     *result = NUMBER_VAL(r * (hi - lo) + lo);
	movsd	xmm1, QWORD PTR [rsp]	# _17, %sfp
	movsd	xmm2, QWORD PTR 8[rsp]	# _10, %sfp
# src/natives/bmath.c:167:     double r = ((double) rand()) / RAND_MAX;
	pxor	xmm0, xmm0	# _9
	cvtsi2sd	xmm0, eax	# _9, _8
# src/natives/bmath.c:167:     double r = ((double) rand()) / RAND_MAX;
	divsd	xmm0, QWORD PTR .LC1[rip]	# r_20,
# src/natives/bmath.c:170:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bmath.c:169:     *result = NUMBER_VAL(r * (hi - lo) + lo);
	subsd	xmm2, xmm1	# _10, _17
	mulsd	xmm0, xmm2	# _11, _10
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	addsd	xmm0, xmm1	# _11, _17
	movq	rax, xmm0	# _26, _11
	mov	QWORD PTR [rbx], rax	# *result_22(D), _26
# src/natives/bmath.c:171: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
# src/natives/bmath.c:160:         *result = OBJ_VAL(copyString("randRange() expects two number arguments.", 41));
	mov	esi, 41	#,
	lea	rdi, .LC2[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:160:         *result = OBJ_VAL(copyString("randRange() expects two number arguments.", 41));
	movabs	rdx, -1125899906842624	# tmp124,
	or	rax, rdx	# _26, tmp124
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_22(D), _26
# src/natives/bmath.c:171: }
	add	rsp, 16	#,
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE36:
	.size	"randRangeNative", .-"randRangeNative"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"round() expects one number argument."
	.text
	.p2align 4
	.type	"roundNative", @function
"roundNative":
.LFB39:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bmath.c:197: static bool roundNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bmath.c:199:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L13	#,
# src/natives/bmath.c:199:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rdx, 9222246136947933184	# tmp110,
# src/natives/bmath.c:199:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_8(D)
# src/natives/bmath.c:199:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rcx, rax	# tmp121, _1
	not	rcx	# tmp121
	test	rcx, rdx	# tmp121, tmp110
	je	.L13	#,
# src/natives/bmath.c:205:     *result = NUMBER_VAL(round(AS_NUMBER(args[0])));
	movq	xmm0, rax	# _1, _1
	call	"round"@PLT	#
# src/natives/bmath.c:206:     return true;
	mov	edx, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rax, xmm0	# _10, _4
	mov	QWORD PTR [rbx], rax	# *result_11(D), _10
# src/natives/bmath.c:207: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L13:
	.cfi_restore_state
# src/natives/bmath.c:200:         *result = OBJ_VAL(copyString("round() expects one number argument.", 36));
	mov	esi, 36	#,
	lea	rdi, .LC3[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:200:         *result = OBJ_VAL(copyString("round() expects one number argument.", 36));
	movabs	rdx, -1125899906842624	# tmp113,
	or	rax, rdx	# _10, tmp113
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_11(D), _10
# src/natives/bmath.c:207: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE39:
	.size	"roundNative", .-"roundNative"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"ceil() expects one number argument."
	.text
	.p2align 4
	.type	"ceilNative", @function
"ceilNative":
.LFB38:
	.cfi_startproc
# src/natives/bmath.c:187:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L18	#,
# src/natives/bmath.c:187:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rcx, 9222246136947933184	# tmp110,
# src/natives/bmath.c:187:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_8(D)
# src/natives/bmath.c:187:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rsi, rax	# tmp119, _1
	not	rsi	# tmp119
	test	rsi, rcx	# tmp119, tmp110
	je	.L18	#,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	xmm1, rax	# tmp123, _1
# src/natives/bmath.c:194:     return true;
	mov	eax, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	roundsd	xmm1, xmm1, 10	# tmp123, tmp123,
	movq	QWORD PTR [rdx], xmm1	# *result_11(D), _10
# src/natives/bmath.c:195: }
	ret	
	.p2align 4,,10
	.p2align 3
.L18:
# src/natives/bmath.c:185: static bool ceilNative(int argCount, Value* args, Value* result) {
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:188:         *result = OBJ_VAL(copyString("ceil() expects one number argument.", 36));
	mov	esi, 36	#,
	lea	rdi, .LC4[rip]	#,
	mov	QWORD PTR 8[rsp], rdx	# %sfp, result
	call	"copyString"@PLT	#
	mov	rdx, QWORD PTR 8[rsp]	# result, %sfp
# src/natives/bmath.c:188:         *result = OBJ_VAL(copyString("ceil() expects one number argument.", 36));
	movabs	rcx, -1125899906842624	# tmp113,
	or	rax, rcx	# _15, tmp113
	movq	xmm0, rax	# _10, _15
	xor	eax, eax	# <retval>
	movq	QWORD PTR [rdx], xmm0	# *result_11(D), _10
# src/natives/bmath.c:195: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE38:
	.size	"ceilNative", .-"ceilNative"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"floor() expects one number argument."
	.text
	.p2align 4
	.type	"floorNative", @function
"floorNative":
.LFB37:
	.cfi_startproc
# src/natives/bmath.c:175:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L25	#,
# src/natives/bmath.c:175:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rcx, 9222246136947933184	# tmp110,
# src/natives/bmath.c:175:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_8(D)
# src/natives/bmath.c:175:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rsi, rax	# tmp119, _1
	not	rsi	# tmp119
	test	rsi, rcx	# tmp119, tmp110
	je	.L25	#,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	xmm1, rax	# tmp123, _1
# src/natives/bmath.c:182:     return true;
	mov	eax, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	roundsd	xmm1, xmm1, 9	# tmp123, tmp123,
	movq	QWORD PTR [rdx], xmm1	# *result_11(D), _10
# src/natives/bmath.c:183: }
	ret	
	.p2align 4,,10
	.p2align 3
.L25:
# src/natives/bmath.c:173: static bool floorNative(int argCount, Value* args, Value* result) {
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:176:         *result = OBJ_VAL(copyString("floor() expects one number argument.", 36));
	mov	esi, 36	#,
	lea	rdi, .LC5[rip]	#,
	mov	QWORD PTR 8[rsp], rdx	# %sfp, result
	call	"copyString"@PLT	#
	mov	rdx, QWORD PTR 8[rsp]	# result, %sfp
# src/natives/bmath.c:176:         *result = OBJ_VAL(copyString("floor() expects one number argument.", 36));
	movabs	rcx, -1125899906842624	# tmp113,
	or	rax, rcx	# _15, tmp113
	movq	xmm0, rax	# _10, _15
	xor	eax, eax	# <retval>
	movq	QWORD PTR [rdx], xmm0	# *result_11(D), _10
# src/natives/bmath.c:183: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE37:
	.size	"floorNative", .-"floorNative"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"atan2() takes two number arguments."
	.text
	.p2align 4
	.type	"atan2Native", @function
"atan2Native":
.LFB34:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bmath.c:133: static bool atan2Native(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bmath.c:135:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L32	#,
# src/natives/bmath.c:135:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	movabs	rdx, 9222246136947933184	# tmp113,
	mov	rax, QWORD PTR [rsi]	# _1, *args_12(D)
# src/natives/bmath.c:135:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	mov	rcx, rax	# tmp128, _1
	not	rcx	# tmp128
	test	rcx, rdx	# tmp128, tmp113
	je	.L32	#,
# src/natives/bmath.c:135:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	mov	rcx, QWORD PTR 8[rsi]	# _3, MEM[(Value *)args_12(D) + 8B]
# src/natives/bmath.c:135:     if (argCount != 2 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1])) {
	mov	rsi, rcx	# tmp127, _3
	not	rsi	# tmp127
	test	rsi, rdx	# tmp127, tmp113
	je	.L32	#,
# src/natives/bmath.c:141:     *result = NUMBER_VAL(atan2(AS_NUMBER(args[0]), AS_NUMBER(args[1])));
	movq	xmm0, rax	# _1, _1
	movq	xmm1, rcx	#, _3
	call	"atan2"@PLT	#
# src/natives/bmath.c:142:     return true;
	mov	edx, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rax, xmm0	# _21, _8
	mov	QWORD PTR [rbx], rax	# *result_17(D), _21
# src/natives/bmath.c:143: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
# src/natives/bmath.c:136:         *result = OBJ_VAL(copyString("atan2() takes two number arguments.", 35));
	mov	esi, 35	#,
	lea	rdi, .LC6[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:136:         *result = OBJ_VAL(copyString("atan2() takes two number arguments.", 35));
	movabs	rdx, -1125899906842624	# tmp119,
	or	rax, rdx	# _21, tmp119
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_17(D), _21
# src/natives/bmath.c:143: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE34:
	.size	"atan2Native", .-"atan2Native"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"sin() expects one argument."
	.text
	.p2align 4
	.type	"sineNative", @function
"sineNative":
.LFB28:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:45:     if (argCount != 1) {
	cmp	edi, 1	# argCount,
	jne	.L42	#,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	movabs	rdx, 9222246136947933184	# tmp119,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rax, QWORD PTR [rsi]	# _12, *args_6(D)
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rcx, rax	# tmp136, _12
	not	rcx	# tmp136
	test	rcx, rdx	# tmp136, tmp119
	je	.L43	#,
# src/natives/bmath.c:54:     *result = NUMBER_VAL(sin(AS_NUMBER(args[0])));
	movq	xmm0, rax	# _12, _12
	call	"sin"@PLT	#
# src/natives/bmath.c:55:     return true;
	mov	eax, 1	# <retval>,
# src/natives/bmath.c:54:     *result = NUMBER_VAL(sin(AS_NUMBER(args[0])));
	movsd	QWORD PTR [rbx], xmm0	# *result_7(D), _2
# src/natives/bmath.c:56: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L42:
	.cfi_restore_state
# src/natives/bmath.c:46:         *result = OBJ_VAL(copyString("sin() expects one argument.", 27));
	mov	esi, 27	#,
	lea	rdi, .LC7[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:46:         *result = OBJ_VAL(copyString("sin() expects one argument.", 27));
	movabs	rdx, -1125899906842624	# tmp116,
	or	rax, rdx	# tmp117, tmp116
	mov	QWORD PTR [rbx], rax	# *result_7(D), tmp117
# src/natives/bmath.c:47:         return false;
	xor	eax, eax	# <retval>
.L44:
# src/natives/bmath.c:56: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_restore_state
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	esi, 1	#,
	mov	edi, 33	#,
	call	"calloc"@PLT	#
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movdqa	xmm0, XMMWORD PTR .LC8[rip]	# tmp127,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	esi, 32	#,
# src/natives/bmath.c:16:             strcat(errorMessage, name);
	mov	DWORD PTR [rax], 7235955	# MEM <char[1:4]> [(void *)errorMessage_26],
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	rdi, rax	# tmp133,
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 3[rax], xmm0	# MEM <char[1:30]> [(void *)_28], tmp127
	movdqa	xmm0, XMMWORD PTR .LC9[rip]	# tmp128,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp133
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 17[rax], xmm0	# MEM <char[1:30]> [(void *)_28], tmp128
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:19:             free(errorMessage);
	mov	rdi, QWORD PTR 8[rsp]	# tmp133, %sfp
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	movabs	rdx, -1125899906842624	# tmp123,
	or	rax, rdx	# tmp124, tmp123
	mov	QWORD PTR [rbx], rax	# *result_7(D), tmp124
# src/natives/bmath.c:19:             free(errorMessage);
	call	"free"@PLT	#
# src/natives/bmath.c:47:         return false;
	xor	eax, eax	# <retval>
	jmp	.L44	#
	.cfi_endproc
.LFE28:
	.size	"sineNative", .-"sineNative"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"cbrt() expects one number argument."
	.text
	.p2align 4
	.type	"cbrtNative", @function
"cbrtNative":
.LFB41:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bmath.c:221: static bool cbrtNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bmath.c:223:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L46	#,
# src/natives/bmath.c:223:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rdx, 9222246136947933184	# tmp110,
# src/natives/bmath.c:223:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_8(D)
# src/natives/bmath.c:223:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rcx, rax	# tmp121, _1
	not	rcx	# tmp121
	test	rcx, rdx	# tmp121, tmp110
	je	.L46	#,
# src/natives/bmath.c:229:     *result = NUMBER_VAL(cbrt(AS_NUMBER(args[0])));
	movq	xmm0, rax	# _1, _1
	call	"cbrt"@PLT	#
# src/natives/bmath.c:230:     return true;
	mov	edx, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rax, xmm0	# _10, _4
	mov	QWORD PTR [rbx], rax	# *result_11(D), _10
# src/natives/bmath.c:231: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L46:
	.cfi_restore_state
# src/natives/bmath.c:224:         *result = OBJ_VAL(copyString("cbrt() expects one number argument.", 36));
	mov	esi, 36	#,
	lea	rdi, .LC10[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:224:         *result = OBJ_VAL(copyString("cbrt() expects one number argument.", 36));
	movabs	rdx, -1125899906842624	# tmp113,
	or	rax, rdx	# _10, tmp113
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_11(D), _10
# src/natives/bmath.c:231: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE41:
	.size	"cbrtNative", .-"cbrtNative"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"sqrt() expects one number argument."
	.text
	.p2align 4
	.type	"sqrtNative", @function
"sqrtNative":
.LFB40:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:211:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L51	#,
# src/natives/bmath.c:211:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rcx, 9222246136947933184	# tmp110,
# src/natives/bmath.c:211:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_8(D)
# src/natives/bmath.c:211:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rsi, rax	# tmp121, _1
	not	rsi	# tmp121
	test	rsi, rcx	# tmp121, tmp110
	je	.L51	#,
	movq	xmm0, rax	# _9, _1
	pxor	xmm1, xmm1	# tmp114
	ucomisd	xmm1, xmm0	# tmp114, _9
	ja	.L58	#,
# src/natives/bmath.c:217:     *result = NUMBER_VAL(sqrt(AS_NUMBER(args[0])));
	sqrtsd	xmm0, xmm0	# _4, _9
.L56:
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rax, xmm0	# _3, _4
# src/natives/bmath.c:218:     return true;
	mov	ecx, 1	# <retval>,
# src/natives/bmath.c:212:         *result = OBJ_VAL(copyString("sqrt() expects one number argument.", 36));
	mov	QWORD PTR [rdx], rax	# *result_12(D), _3
# src/natives/bmath.c:219: }
	mov	eax, ecx	#, <retval>
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
# src/natives/bmath.c:212:         *result = OBJ_VAL(copyString("sqrt() expects one number argument.", 36));
	mov	esi, 36	#,
	lea	rdi, .LC11[rip]	#,
	mov	QWORD PTR 8[rsp], rdx	# %sfp, result
	call	"copyString"@PLT	#
	mov	rdx, QWORD PTR 8[rsp]	# result, %sfp
# src/natives/bmath.c:212:         *result = OBJ_VAL(copyString("sqrt() expects one number argument.", 36));
	movabs	rcx, -1125899906842624	# tmp113,
	or	rax, rcx	# _3, tmp113
	xor	ecx, ecx	# <retval>
# src/natives/bmath.c:212:         *result = OBJ_VAL(copyString("sqrt() expects one number argument.", 36));
	mov	QWORD PTR [rdx], rax	# *result_12(D), _3
# src/natives/bmath.c:219: }
	mov	eax, ecx	#, <retval>
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L58:
	.cfi_restore_state
	mov	QWORD PTR 8[rsp], rdx	# %sfp, result
# src/natives/bmath.c:217:     *result = NUMBER_VAL(sqrt(AS_NUMBER(args[0])));
	call	"sqrt"@PLT	#
	mov	rdx, QWORD PTR 8[rsp]	# result, %sfp
	jmp	.L56	#
	.cfi_endproc
.LFE40:
	.size	"sqrtNative", .-"sqrtNative"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"power() expects two number arguments."
	.text
	.p2align 4
	.type	"powerNative", @function
"powerNative":
.LFB27:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:30:     if (argCount != 2) {
	cmp	edi, 2	# argCount,
	jne	.L61	#,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	movabs	rdx, 9222246136947933184	# tmp119,
	mov	rax, QWORD PTR [rsi]	# _19, *args_9(D)
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rcx, rax	# tmp143, _19
	not	rcx	# tmp143
	test	rcx, rdx	# tmp143, tmp119
	je	.L62	#,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rcx, QWORD PTR 8[rsi]	# _56, MEM[(Value *)args_9(D) + 8B]
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rsi, rcx	# tmp142, _56
	not	rsi	# tmp142
	test	rsi, rdx	# tmp142, tmp119
	je	.L62	#,
# src/natives/bmath.c:39:     *result = NUMBER_VAL(pow(AS_NUMBER(args[0]), AS_NUMBER(args[1])));
	movq	xmm0, rax	# _19, _19
	movq	xmm1, rcx	#, _56
	call	"pow"@PLT	#
# src/natives/bmath.c:39:     *result = NUMBER_VAL(pow(AS_NUMBER(args[0]), AS_NUMBER(args[1])));
	mov	eax, 1	# <retval>,
	movsd	QWORD PTR [rbx], xmm0	# *result_10(D), _40
# src/natives/bmath.c:41: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L61:
	.cfi_restore_state
# src/natives/bmath.c:31:         *result = OBJ_VAL(copyString("power() expects two number arguments.", 30));
	mov	esi, 30	#,
	lea	rdi, .LC13[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:31:         *result = OBJ_VAL(copyString("power() expects two number arguments.", 30));
	movabs	rdx, -1125899906842624	# tmp125,
	or	rax, rdx	# tmp126, tmp125
	mov	QWORD PTR [rbx], rax	# *result_10(D), tmp126
# src/natives/bmath.c:32:         return false;
	xor	eax, eax	# <retval>
.L68:
# src/natives/bmath.c:41: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L62:
	.cfi_restore_state
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	esi, 1	#,
	mov	edi, 35	#,
	call	"calloc"@PLT	#
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movdqa	xmm0, XMMWORD PTR .LC8[rip]	# tmp133,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	esi, 34	#,
# src/natives/bmath.c:16:             strcat(errorMessage, name);
	mov	DWORD PTR [rax], 1702326128	# MEM <char[1:5]> [(void *)errorMessage_27],
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	rdi, rax	# tmp139,
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 5[rax], xmm0	# MEM <char[1:30]> [(void *)_29], tmp133
	movdqa	xmm0, XMMWORD PTR .LC9[rip]	# tmp134,
# src/natives/bmath.c:16:             strcat(errorMessage, name);
	mov	BYTE PTR 4[rax], 114	# MEM <char[1:5]> [(void *)errorMessage_27],
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 19[rax], xmm0	# MEM <char[1:30]> [(void *)_29], tmp134
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp139
	call	"copyString"@PLT	#
# src/natives/bmath.c:19:             free(errorMessage);
	mov	rdi, QWORD PTR 8[rsp]	# tmp139, %sfp
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	movabs	rdx, -1125899906842624	# tmp129,
	or	rax, rdx	# tmp130, tmp129
	mov	QWORD PTR [rbx], rax	# *result_10(D), tmp130
# src/natives/bmath.c:19:             free(errorMessage);
	call	"free"@PLT	#
# src/natives/bmath.c:32:         return false;
	xor	eax, eax	# <retval>
	jmp	.L68	#
	.cfi_endproc
.LFE27:
	.size	"powerNative", .-"powerNative"
	.section	.rodata.str1.1
.LC14:
	.string	"acos() expects one argument."
	.text
	.p2align 4
	.type	"arccosineNative", @function
"arccosineNative":
.LFB32:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:105:     if (argCount != 1) {
	cmp	edi, 1	# argCount,
	jne	.L75	#,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	movabs	rdx, 9222246136947933184	# tmp119,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rax, QWORD PTR [rsi]	# _14, *args_7(D)
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rcx, rax	# tmp136, _14
	not	rcx	# tmp136
	test	rcx, rdx	# tmp136, tmp119
	je	.L76	#,
# src/natives/bmath.c:114:     *result = NUMBER_VAL(acos(AS_NUMBER(args[0])));
	movq	xmm0, rax	# _14, _14
	call	"acos"@PLT	#
# src/natives/bmath.c:114:     *result = NUMBER_VAL(acos(AS_NUMBER(args[0])));
	mov	eax, 1	# <retval>,
	movsd	QWORD PTR [rbx], xmm0	# *result_8(D), _34
# src/natives/bmath.c:116: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L75:
	.cfi_restore_state
# src/natives/bmath.c:106:         *result = OBJ_VAL(copyString("acos() expects one argument.", 27));
	mov	esi, 27	#,
	lea	rdi, .LC14[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:106:         *result = OBJ_VAL(copyString("acos() expects one argument.", 27));
	movabs	rdx, -1125899906842624	# tmp116,
	or	rax, rdx	# tmp117, tmp116
	mov	QWORD PTR [rbx], rax	# *result_8(D), tmp117
# src/natives/bmath.c:107:         return false;
	xor	eax, eax	# <retval>
.L77:
# src/natives/bmath.c:116: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	esi, 1	#,
	mov	edi, 34	#,
	call	"calloc"@PLT	#
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movdqa	xmm0, XMMWORD PTR .LC8[rip]	# tmp127,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	esi, 33	#,
# src/natives/bmath.c:16:             strcat(errorMessage, name);
	mov	DWORD PTR [rax], 1936679777	# MEM <char[1:4]> [(void *)errorMessage_23],
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	rdi, rax	# tmp133,
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 4[rax], xmm0	# MEM <char[1:30]> [(void *)_25], tmp127
	movdqa	xmm0, XMMWORD PTR .LC9[rip]	# tmp128,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp133
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 18[rax], xmm0	# MEM <char[1:30]> [(void *)_25], tmp128
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:19:             free(errorMessage);
	mov	rdi, QWORD PTR 8[rsp]	# tmp133, %sfp
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	movabs	rdx, -1125899906842624	# tmp123,
	or	rax, rdx	# tmp124, tmp123
	mov	QWORD PTR [rbx], rax	# *result_8(D), tmp124
# src/natives/bmath.c:19:             free(errorMessage);
	call	"free"@PLT	#
# src/natives/bmath.c:107:         return false;
	xor	eax, eax	# <retval>
	jmp	.L77	#
	.cfi_endproc
.LFE32:
	.size	"arccosineNative", .-"arccosineNative"
	.section	.rodata.str1.1
.LC15:
	.string	"asin() expects one argument."
	.text
	.p2align 4
	.type	"arcsineNative", @function
"arcsineNative":
.LFB31:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:90:     if (argCount != 1) {
	cmp	edi, 1	# argCount,
	jne	.L84	#,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	movabs	rdx, 9222246136947933184	# tmp119,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rax, QWORD PTR [rsi]	# _14, *args_7(D)
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rcx, rax	# tmp136, _14
	not	rcx	# tmp136
	test	rcx, rdx	# tmp136, tmp119
	je	.L85	#,
# src/natives/bmath.c:99:     *result = NUMBER_VAL(asin(AS_NUMBER(args[0])));
	movq	xmm0, rax	# _14, _14
	call	"asin"@PLT	#
# src/natives/bmath.c:99:     *result = NUMBER_VAL(asin(AS_NUMBER(args[0])));
	mov	eax, 1	# <retval>,
	movsd	QWORD PTR [rbx], xmm0	# *result_8(D), _34
# src/natives/bmath.c:101: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L84:
	.cfi_restore_state
# src/natives/bmath.c:91:         *result = OBJ_VAL(copyString("asin() expects one argument.", 27));
	mov	esi, 27	#,
	lea	rdi, .LC15[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:91:         *result = OBJ_VAL(copyString("asin() expects one argument.", 27));
	movabs	rdx, -1125899906842624	# tmp116,
	or	rax, rdx	# tmp117, tmp116
	mov	QWORD PTR [rbx], rax	# *result_8(D), tmp117
# src/natives/bmath.c:92:         return false;
	xor	eax, eax	# <retval>
.L86:
# src/natives/bmath.c:101: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	esi, 1	#,
	mov	edi, 34	#,
	call	"calloc"@PLT	#
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movdqa	xmm0, XMMWORD PTR .LC8[rip]	# tmp127,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	esi, 33	#,
# src/natives/bmath.c:16:             strcat(errorMessage, name);
	mov	DWORD PTR [rax], 1852404577	# MEM <char[1:4]> [(void *)errorMessage_23],
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	rdi, rax	# tmp133,
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 4[rax], xmm0	# MEM <char[1:30]> [(void *)_25], tmp127
	movdqa	xmm0, XMMWORD PTR .LC9[rip]	# tmp128,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp133
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 18[rax], xmm0	# MEM <char[1:30]> [(void *)_25], tmp128
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:19:             free(errorMessage);
	mov	rdi, QWORD PTR 8[rsp]	# tmp133, %sfp
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	movabs	rdx, -1125899906842624	# tmp123,
	or	rax, rdx	# tmp124, tmp123
	mov	QWORD PTR [rbx], rax	# *result_8(D), tmp124
# src/natives/bmath.c:19:             free(errorMessage);
	call	"free"@PLT	#
# src/natives/bmath.c:92:         return false;
	xor	eax, eax	# <retval>
	jmp	.L86	#
	.cfi_endproc
.LFE31:
	.size	"arcsineNative", .-"arcsineNative"
	.section	.rodata.str1.1
.LC16:
	.string	"atan() expects one argument."
	.text
	.p2align 4
	.type	"arctangentNative", @function
"arctangentNative":
.LFB33:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:120:     if (argCount != 1) {
	cmp	edi, 1	# argCount,
	jne	.L93	#,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	movabs	rdx, 9222246136947933184	# tmp119,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rax, QWORD PTR [rsi]	# _12, *args_6(D)
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rcx, rax	# tmp136, _12
	not	rcx	# tmp136
	test	rcx, rdx	# tmp136, tmp119
	je	.L94	#,
# src/natives/bmath.c:129:     *result = NUMBER_VAL(atan(AS_NUMBER(args[0])));
	movq	xmm0, rax	# _12, _12
	call	"atan"@PLT	#
# src/natives/bmath.c:130:     return true;
	mov	eax, 1	# <retval>,
# src/natives/bmath.c:129:     *result = NUMBER_VAL(atan(AS_NUMBER(args[0])));
	movsd	QWORD PTR [rbx], xmm0	# *result_7(D), _2
# src/natives/bmath.c:131: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L93:
	.cfi_restore_state
# src/natives/bmath.c:121:         *result = OBJ_VAL(copyString("atan() expects one argument.", 27));
	mov	esi, 27	#,
	lea	rdi, .LC16[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:121:         *result = OBJ_VAL(copyString("atan() expects one argument.", 27));
	movabs	rdx, -1125899906842624	# tmp116,
	or	rax, rdx	# tmp117, tmp116
	mov	QWORD PTR [rbx], rax	# *result_7(D), tmp117
# src/natives/bmath.c:122:         return false;
	xor	eax, eax	# <retval>
.L95:
# src/natives/bmath.c:131: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L94:
	.cfi_restore_state
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	esi, 1	#,
	mov	edi, 34	#,
	call	"calloc"@PLT	#
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movdqa	xmm0, XMMWORD PTR .LC8[rip]	# tmp127,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	esi, 33	#,
# src/natives/bmath.c:16:             strcat(errorMessage, name);
	mov	DWORD PTR [rax], 1851880545	# MEM <char[1:4]> [(void *)errorMessage_26],
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	rdi, rax	# tmp133,
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 4[rax], xmm0	# MEM <char[1:30]> [(void *)_28], tmp127
	movdqa	xmm0, XMMWORD PTR .LC9[rip]	# tmp128,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp133
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 18[rax], xmm0	# MEM <char[1:30]> [(void *)_28], tmp128
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:19:             free(errorMessage);
	mov	rdi, QWORD PTR 8[rsp]	# tmp133, %sfp
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	movabs	rdx, -1125899906842624	# tmp123,
	or	rax, rdx	# tmp124, tmp123
	mov	QWORD PTR [rbx], rax	# *result_7(D), tmp124
# src/natives/bmath.c:19:             free(errorMessage);
	call	"free"@PLT	#
# src/natives/bmath.c:122:         return false;
	xor	eax, eax	# <retval>
	jmp	.L95	#
	.cfi_endproc
.LFE33:
	.size	"arctangentNative", .-"arctangentNative"
	.section	.rodata.str1.1
.LC17:
	.string	"tan() expects one argument."
	.text
	.p2align 4
	.type	"tangentNative", @function
"tangentNative":
.LFB30:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:75:     if (argCount != 1) {
	cmp	edi, 1	# argCount,
	jne	.L102	#,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	movabs	rdx, 9222246136947933184	# tmp119,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rax, QWORD PTR [rsi]	# _12, *args_6(D)
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rcx, rax	# tmp136, _12
	not	rcx	# tmp136
	test	rcx, rdx	# tmp136, tmp119
	je	.L103	#,
# src/natives/bmath.c:84:     *result = NUMBER_VAL(tan(AS_NUMBER(args[0])));
	movq	xmm0, rax	# _12, _12
	call	"tan"@PLT	#
# src/natives/bmath.c:85:     return true;
	mov	eax, 1	# <retval>,
# src/natives/bmath.c:84:     *result = NUMBER_VAL(tan(AS_NUMBER(args[0])));
	movsd	QWORD PTR [rbx], xmm0	# *result_7(D), _2
# src/natives/bmath.c:86: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L102:
	.cfi_restore_state
# src/natives/bmath.c:76:         *result = OBJ_VAL(copyString("tan() expects one argument.", 27));
	mov	esi, 27	#,
	lea	rdi, .LC17[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:76:         *result = OBJ_VAL(copyString("tan() expects one argument.", 27));
	movabs	rdx, -1125899906842624	# tmp116,
	or	rax, rdx	# tmp117, tmp116
	mov	QWORD PTR [rbx], rax	# *result_7(D), tmp117
# src/natives/bmath.c:77:         return false;
	xor	eax, eax	# <retval>
.L104:
# src/natives/bmath.c:86: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L103:
	.cfi_restore_state
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	esi, 1	#,
	mov	edi, 33	#,
	call	"calloc"@PLT	#
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movdqa	xmm0, XMMWORD PTR .LC8[rip]	# tmp127,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	esi, 32	#,
# src/natives/bmath.c:16:             strcat(errorMessage, name);
	mov	DWORD PTR [rax], 7233908	# MEM <char[1:4]> [(void *)errorMessage_26],
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	rdi, rax	# tmp133,
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 3[rax], xmm0	# MEM <char[1:30]> [(void *)_28], tmp127
	movdqa	xmm0, XMMWORD PTR .LC9[rip]	# tmp128,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp133
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 17[rax], xmm0	# MEM <char[1:30]> [(void *)_28], tmp128
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:19:             free(errorMessage);
	mov	rdi, QWORD PTR 8[rsp]	# tmp133, %sfp
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	movabs	rdx, -1125899906842624	# tmp123,
	or	rax, rdx	# tmp124, tmp123
	mov	QWORD PTR [rbx], rax	# *result_7(D), tmp124
# src/natives/bmath.c:19:             free(errorMessage);
	call	"free"@PLT	#
# src/natives/bmath.c:77:         return false;
	xor	eax, eax	# <retval>
	jmp	.L104	#
	.cfi_endproc
.LFE30:
	.size	"tangentNative", .-"tangentNative"
	.section	.rodata.str1.1
.LC18:
	.string	"cos() expects one argument."
	.text
	.p2align 4
	.type	"cosineNative", @function
"cosineNative":
.LFB29:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bmath.c:60:     if (argCount != 1) {
	cmp	edi, 1	# argCount,
	jne	.L111	#,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	movabs	rdx, 9222246136947933184	# tmp119,
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rax, QWORD PTR [rsi]	# _12, *args_6(D)
# src/natives/bmath.c:14:         if (!IS_NUMBER(args[i])) {
	mov	rcx, rax	# tmp136, _12
	not	rcx	# tmp136
	test	rcx, rdx	# tmp136, tmp119
	je	.L112	#,
# src/natives/bmath.c:69:     *result = NUMBER_VAL(cos(AS_NUMBER(args[0])));
	movq	xmm0, rax	# _12, _12
	call	"cos"@PLT	#
# src/natives/bmath.c:70:     return true;
	mov	eax, 1	# <retval>,
# src/natives/bmath.c:69:     *result = NUMBER_VAL(cos(AS_NUMBER(args[0])));
	movsd	QWORD PTR [rbx], xmm0	# *result_7(D), _2
# src/natives/bmath.c:71: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L111:
	.cfi_restore_state
# src/natives/bmath.c:61:         *result = OBJ_VAL(copyString("cos() expects one argument.", 27));
	mov	esi, 27	#,
	lea	rdi, .LC18[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:61:         *result = OBJ_VAL(copyString("cos() expects one argument.", 27));
	movabs	rdx, -1125899906842624	# tmp116,
	or	rax, rdx	# tmp117, tmp116
	mov	QWORD PTR [rbx], rax	# *result_7(D), tmp117
# src/natives/bmath.c:62:         return false;
	xor	eax, eax	# <retval>
.L113:
# src/natives/bmath.c:71: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L112:
	.cfi_restore_state
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	esi, 1	#,
	mov	edi, 33	#,
	call	"calloc"@PLT	#
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movdqa	xmm0, XMMWORD PTR .LC8[rip]	# tmp127,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	esi, 32	#,
# src/natives/bmath.c:16:             strcat(errorMessage, name);
	mov	DWORD PTR [rax], 7565155	# MEM <char[1:4]> [(void *)errorMessage_26],
# src/natives/bmath.c:15:             char* errorMessage = calloc(30 + strlen(name), sizeof(char));;
	mov	rdi, rax	# tmp133,
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 3[rax], xmm0	# MEM <char[1:30]> [(void *)_28], tmp127
	movdqa	xmm0, XMMWORD PTR .LC9[rip]	# tmp128,
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp133
# src/natives/bmath.c:17:             strcat(errorMessage, "() expects number parameters.");
	movups	XMMWORD PTR 17[rax], xmm0	# MEM <char[1:30]> [(void *)_28], tmp128
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:19:             free(errorMessage);
	mov	rdi, QWORD PTR 8[rsp]	# tmp133, %sfp
# src/natives/bmath.c:18:             *result = OBJ_VAL(copyString(errorMessage, strlen(errorMessage)));
	movabs	rdx, -1125899906842624	# tmp123,
	or	rax, rdx	# tmp124, tmp123
	mov	QWORD PTR [rbx], rax	# *result_7(D), tmp124
# src/natives/bmath.c:19:             free(errorMessage);
	call	"free"@PLT	#
# src/natives/bmath.c:62:         return false;
	xor	eax, eax	# <retval>
	jmp	.L113	#
	.cfi_endproc
.LFE29:
	.size	"cosineNative", .-"cosineNative"
	.section	.rodata.str1.1
.LC19:
	.string	"pi"
.LC20:
	.string	"e"
.LC21:
	.string	"power"
.LC22:
	.string	"sqrt"
.LC23:
	.string	"cbrt"
.LC24:
	.string	"sin"
.LC25:
	.string	"cos"
.LC26:
	.string	"tan"
.LC27:
	.string	"asin"
.LC28:
	.string	"acos"
.LC29:
	.string	"atan"
.LC30:
	.string	"atan2"
.LC31:
	.string	"floor"
.LC32:
	.string	"ceil"
.LC33:
	.string	"round"
.LC34:
	.string	"rand"
.LC35:
	.string	"randRange"
	.text
	.p2align 4
	.globl	"buildMathModule"
	.type	"buildMathModule", @function
"buildMathModule":
.LFB47:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -32
# src/natives/bmath.c:279:     push(OBJ_VAL(module));
	movabs	rbp, -1125899906842624	# tmp165,
# src/natives/bmath.c:277: ObjModule* buildMathModule() {
	mov	QWORD PTR 24[rsp], r12	#,
	mov	QWORD PTR 32[rsp], r13	#,
	.cfi_offset 12, -24
	.cfi_offset 13, -16
# src/natives/bmath.c:278:     ObjModule* module = newModule();
	call	"newModule"@PLT	#
# src/natives/bmath.c:279:     push(OBJ_VAL(module));
	mov	rdi, rax	# _2, <retval>
# src/natives/bmath.c:278:     ObjModule* module = newModule();
	mov	r12, rax	# <retval>,
# src/natives/bmath.c:279:     push(OBJ_VAL(module));
	or	rdi, rbp	# _2, tmp165
# src/natives/bmath.c:279:     push(OBJ_VAL(module));
	call	"push"@PLT	#
# src/natives/bmath.c:274:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 2	#,
	lea	rdi, .LC19[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:274:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r12]	#,
	movabs	rdx, 4614256656552045848	#,
	mov	rsi, rax	#, _24
	call	"tableSet"@PLT	#
# src/natives/bmath.c:274:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 1	#,
	lea	rdi, .LC20[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bmath.c:274:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r12]	#,
	movabs	rdx, 4613303445314885481	#,
	mov	rsi, rax	#, _23
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "powerNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 5	#,
	lea	rdi, .LC21[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _100,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _100, _100
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _100, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _103
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sqrtNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC22[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _95,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _95, _95
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _95, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _98
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "cbrtNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC23[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _90,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _90, _90
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _90, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _93
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sineNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 3	#,
	lea	rdi, .LC24[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _85,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _85, _85
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _85, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _88
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "cosineNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 3	#,
	lea	rdi, .LC25[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _80,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _80, _80
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _80, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _83
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "tangentNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 3	#,
	lea	rdi, .LC26[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _75,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _75, _75
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _75, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _78
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "arcsineNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC27[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _70,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _70, _70
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _70, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _73
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "arccosineNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC28[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _65,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _65, _65
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _65, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _68
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "arctangentNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC29[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _60,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _60, _60
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _60, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _63
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "atan2Native"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 5	#,
	lea	rdi, .LC30[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _55,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _55, _55
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _55, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _58
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "floorNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 5	#,
	lea	rdi, .LC31[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _50,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _50, _50
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _50, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _53
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "ceilNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC32[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _45,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _45, _45
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _45, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _48
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "roundNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 5	#,
	lea	rdi, .LC33[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _40,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _40, _40
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _40, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _43
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "randNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC34[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _35,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _35, _35
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _35, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _38
	call	"tableSet"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "randRangeNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 9	#,
	lea	rdi, .LC35[rip]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _30,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _30, _30
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r12]	#,
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _30, tmp165
# src/natives/bmath.c:270:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _33
	call	"tableSet"@PLT	#
# src/natives/bmath.c:304:     pop();
	call	"pop"@PLT	#
# src/natives/bmath.c:306: }
	mov	rax, r12	#, <retval>
	mov	rbp, QWORD PTR 16[rsp]	#,
	mov	r12, QWORD PTR 24[rsp]	#,
	mov	r13, QWORD PTR 32[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE47:
	.size	"buildMathModule", .-"buildMathModule"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-4194304
	.long	1105199103
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC8:
	.quad	7162254444797634856
	.quad	7305521896674587508
	.align 16
.LC9:
	.quad	7021781903232623970
	.quad	13074784094283117
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
