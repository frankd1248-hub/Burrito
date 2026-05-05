	.file	"value.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.globl	"initValueArray"
	.type	"initValueArray", @function
"initValueArray":
.LFB15:
	.cfi_startproc
# src/value.c:10:     array->values = NULL;
	mov	QWORD PTR 8[rdi], 0	# array_2(D)->values,
# src/value.c:11:     array->capacity = 0;
	mov	QWORD PTR [rdi], 0	# MEM <vector(2) int> [(int *)array_2(D)],
# src/value.c:13: }
	ret	
	.cfi_endproc
.LFE15:
	.size	"initValueArray", .-"initValueArray"
	.p2align 4
	.globl	"writeValueArray"
	.type	"writeValueArray", @function
"writeValueArray":
.LFB16:
	.cfi_startproc
# src/value.c:16:     if (array->capacity < array->count + 1) {
	mov	edx, DWORD PTR 4[rdi]	# _1, array_18(D)->count
# src/value.c:15: void writeValueArray(ValueArray* array, Value value) {
	mov	r8, rsi	# value, value
# src/value.c:16:     if (array->capacity < array->count + 1) {
	movsxd	rsi, DWORD PTR [rdi]	#, array_18(D)->capacity
# src/value.c:15: void writeValueArray(ValueArray* array, Value value) {
	mov	rcx, rdi	# array, array
# src/value.c:19:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	mov	rdi, QWORD PTR 8[rdi]	# prephitmp_39, array_18(D)->values
# src/value.c:16:     if (array->capacity < array->count + 1) {
	cmp	edx, esi	# _1, _2
	jl	.L8	#,
# src/value.c:15: void writeValueArray(ValueArray* array, Value value) {
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/value.c:18:         array->capacity = GROW_CAPACITY(oldCapacity);
	cmp	esi, 7	# _2,
	jg	.L11	#,
	mov	edx, 64	# _36,
# src/value.c:18:         array->capacity = GROW_CAPACITY(oldCapacity);
	mov	eax, 8	# iftmp.0_15,
.L5:
# src/value.c:18:         array->capacity = GROW_CAPACITY(oldCapacity);
	mov	DWORD PTR [rcx], eax	# array_18(D)->capacity, iftmp.0_15
# src/value.c:19:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	sal	rsi, 3	# _6,
	mov	QWORD PTR 8[rsp], r8	# %sfp, value
# src/value.c:18:         array->capacity = GROW_CAPACITY(oldCapacity);
	mov	QWORD PTR [rsp], rcx	# %sfp, array
# src/value.c:19:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	call	"reallocate"@PLT	#
# src/value.c:19:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	mov	rcx, QWORD PTR [rsp]	# array, %sfp
# src/value.c:22:     array->values[array->count] = value;
	mov	r8, QWORD PTR 8[rsp]	# value, %sfp
# src/value.c:19:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	mov	rdi, rax	# prephitmp_39, prephitmp_39
# src/value.c:22:     array->values[array->count] = value;
	mov	edx, DWORD PTR 4[rcx]	# _1, array_18(D)->count
# src/value.c:19:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	mov	QWORD PTR 8[rcx], rax	# array_18(D)->values, prephitmp_39
# src/value.c:22:     array->values[array->count] = value;
	movsxd	rax, edx	# _11, _1
# src/value.c:23:     array->count++;
	add	edx, 1	# tmp117,
# src/value.c:22:     array->values[array->count] = value;
	mov	QWORD PTR [rdi+rax*8], r8	# *_13, value
# src/value.c:23:     array->count++;
	mov	DWORD PTR 4[rcx], edx	# array_18(D)->count, tmp117
# src/value.c:24: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L8:
# src/value.c:22:     array->values[array->count] = value;
	movsxd	rax, edx	# _11, _1
# src/value.c:23:     array->count++;
	add	edx, 1	# tmp117,
# src/value.c:22:     array->values[array->count] = value;
	mov	QWORD PTR [rdi+rax*8], r8	# *_13, value
# src/value.c:23:     array->count++;
	mov	DWORD PTR 4[rcx], edx	# array_18(D)->count, tmp117
	ret	
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_def_cfa_offset 32
# src/value.c:18:         array->capacity = GROW_CAPACITY(oldCapacity);
	lea	edx, [rsi+rsi]	#,
	mov	rax, rdx	#,
# src/value.c:19:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	sal	rdx, 3	# _36,
	jmp	.L5	#
	.cfi_endproc
.LFE16:
	.size	"writeValueArray", .-"writeValueArray"
	.p2align 4
	.globl	"freeValueArray"
	.type	"freeValueArray", @function
"freeValueArray":
.LFB17:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/value.c:27:     FREE_ARRAY(Value, array->values, array->capacity);
	movsxd	rsi, DWORD PTR [rdi]	# _2, array_6(D)->capacity
# src/value.c:26: void freeValueArray(ValueArray* array) {
	mov	rbx, rdi	# array, array
# src/value.c:27:     FREE_ARRAY(Value, array->values, array->capacity);
	xor	edx, edx	#
	mov	rdi, QWORD PTR 8[rdi]	# array_6(D)->values, array_6(D)->values
	sal	rsi, 3	# _3,
	call	"reallocate"@PLT	#
# src/value.c:10:     array->values = NULL;
	mov	QWORD PTR 8[rbx], 0	# array_6(D)->values,
# src/value.c:11:     array->capacity = 0;
	mov	QWORD PTR [rbx], 0	# MEM <vector(2) int> [(int *)array_6(D)],
# src/value.c:29: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE17:
	.size	"freeValueArray", .-"freeValueArray"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"true"
.LC1:
	.string	"false"
.LC2:
	.string	"null"
.LC5:
	.string	"%ld"
.LC6:
	.string	"%lf"
	.text
	.p2align 4
	.globl	"printValue"
	.type	"printValue", @function
"printValue":
.LFB19:
	.cfi_startproc
# src/value.c:43:     if (f == NULL) f = stdout;
	mov	rdx, QWORD PTR "stdout"[rip]	# stdout, stdout
	test	rsi, rsi	# f
	mov	rcx, rsi	# f, f
# src/value.c:45:     if (IS_BOOL(value)) {
	mov	rax, rdi	# _1, value
# src/value.c:45:     if (IS_BOOL(value)) {
	movabs	rsi, 9222246136947933187	# tmp110,
# src/value.c:43:     if (f == NULL) f = stdout;
	cmove	rcx, rdx	# stdout,, f
# src/value.c:45:     if (IS_BOOL(value)) {
	or	rax, 1	# _1,
# src/value.c:45:     if (IS_BOOL(value)) {
	cmp	rax, rsi	# _1, tmp110
	je	.L30	#,
# src/value.c:47:     } else if (IS_EMPTY(value)) {
	movabs	rax, 9222246136947933188	# tmp112,
	cmp	rdi, rax	# value, tmp112
	je	.L14	#,
# src/value.c:48:     } else if (IS_NULL(value)) {
	sub	rax, 3	# tmp113,
	cmp	rdi, rax	# value, tmp113
	je	.L31	#,
# src/value.c:50:     } else if (IS_NUMBER(value)) {
	movabs	rsi, 9222246136947933184	# tmp116,
	mov	rax, rdi	# tmp147, value
	not	rax	# tmp147
	test	rax, rsi	# tmp147, tmp116
	jne	.L32	#,
# src/value.c:52:     } else if (IS_OBJ(value)) {
	movabs	rdx, -1125899906842624	# tmp126,
	mov	rax, rdi	# tmp146, value
	not	rax	# tmp146
	test	rax, rdx	# tmp146, tmp126
	je	.L33	#,
.L14:
	ret	
	.p2align 4,,10
	.p2align 3
.L30:
# src/value.c:46:         fprintf(f, AS_BOOL(value) ? "true" : "false");
	cmp	rdi, rax	# value, _1
# src/value.c:46:         fprintf(f, AS_BOOL(value) ? "true" : "false");
	lea	rsi, .LC1[rip]	# iftmp.1_5,
# src/value.c:46:         fprintf(f, AS_BOOL(value) ? "true" : "false");
	lea	rax, .LC0[rip]	# tmp142,
# src/value.c:46:         fprintf(f, AS_BOOL(value) ? "true" : "false");
	mov	rdi, rcx	#, f
# src/value.c:46:         fprintf(f, AS_BOOL(value) ? "true" : "false");
	cmove	rsi, rax	# iftmp.1_5,, iftmp.1_5, tmp142
# src/value.c:46:         fprintf(f, AS_BOOL(value) ? "true" : "false");
	xor	eax, eax	#
	jmp	"fprintf"@PLT	#
	.p2align 4,,10
	.p2align 3
.L32:
# src/value.c:42: void printValue(Value value, FILE* f) {
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/value.c:33:     if (f == NULL) f = stdout;
	test	rcx, rcx	# f
# src/value.c:34:     if (fabs(val - round(val)) < 0.00001) {
	movq	xmm0, rdi	#, value
# src/value.c:33:     if (f == NULL) f = stdout;
	cmove	rcx, rdx	# stdout,, f
# src/value.c:34:     if (fabs(val - round(val)) < 0.00001) {
	mov	QWORD PTR [rsp], rdi	# %sfp, value
# src/value.c:33:     if (f == NULL) f = stdout;
	mov	QWORD PTR 8[rsp], rcx	# %sfp, f
# src/value.c:34:     if (fabs(val - round(val)) < 0.00001) {
	call	"round"@PLT	#
# src/value.c:34:     if (fabs(val - round(val)) < 0.00001) {
	movsd	xmm3, QWORD PTR .LC4[rip]	# tmp121,
# src/value.c:34:     if (fabs(val - round(val)) < 0.00001) {
	movapd	xmm2, xmm0	# _17,
# src/value.c:34:     if (fabs(val - round(val)) < 0.00001) {
	movsd	xmm0, QWORD PTR [rsp]	# _18, %sfp
	subsd	xmm0, xmm2	# _18, _17
# src/value.c:34:     if (fabs(val - round(val)) < 0.00001) {
	andpd	xmm0, XMMWORD PTR .LC3[rip]	# _19,
# src/value.c:34:     if (fabs(val - round(val)) < 0.00001) {
	comisd	xmm3, xmm0	# tmp121, _19
	jbe	.L26	#,
# src/value.c:35:         fprintf(f, "%ld", (long) round(val));
	cvttsd2si	rdx, xmm2	# _20, _17
	mov	rdi, QWORD PTR 8[rsp]	#, %sfp
	lea	rsi, .LC5[rip]	#,
	xor	eax, eax	#
# src/value.c:64: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/value.c:35:         fprintf(f, "%ld", (long) round(val));
	jmp	"fprintf"@PLT	#
	.p2align 4,,10
	.p2align 3
.L31:
# src/value.c:49:         fprintf(f, "null");
	mov	edx, 4	#,
	mov	esi, 1	#,
	lea	rdi, .LC2[rip]	#,
	jmp	"fwrite"@PLT	#
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_def_cfa_offset 32
# src/value.c:37:         fprintf(f, "%lf", val);
	movsd	xmm0, QWORD PTR [rsp]	#, %sfp
	mov	rdi, QWORD PTR 8[rsp]	#, %sfp
	mov	eax, 1	#,
	lea	rsi, .LC6[rip]	#,
# src/value.c:64: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/value.c:37:         fprintf(f, "%lf", val);
	jmp	"fprintf"@PLT	#
	.p2align 4,,10
	.p2align 3
.L33:
# src/value.c:53:         printObject(value, f);
	mov	rsi, rcx	#, f
	jmp	"printObject"@PLT	#
	.cfi_endproc
.LFE19:
	.size	"printValue", .-"printValue"
	.p2align 4
	.globl	"valuesEqual"
	.type	"valuesEqual", @function
"valuesEqual":
.LFB20:
	.cfi_startproc
# src/value.c:68:     return a == b;
	cmp	rdi, rsi	# a, b
	sete	al	#, _3
# src/value.c:79: }
	ret	
	.cfi_endproc
.LFE20:
	.size	"valuesEqual", .-"valuesEqual"
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	-1998362383
	.long	1055193269
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
