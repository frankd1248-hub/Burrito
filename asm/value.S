	.file	"value.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=48 --param=l1-cache-line-size=64 --param=l2-cache-size=12288 -mtune=arrowlake-s -masm=intel -O3
	.text
	.p2align 4
	.globl	initValueArray
	.type	initValueArray, @function
initValueArray:
.LFB12:
	.cfi_startproc
# src/value.c:9:     array->values = NULL;
	mov	QWORD PTR 8[rdi], 0	# array_2(D)->values,
# src/value.c:10:     array->capacity = 0;
	mov	QWORD PTR [rdi], 0	# MEM <vector(2) int> [(int *)array_2(D)],
# src/value.c:12: }
	ret	
	.cfi_endproc
.LFE12:
	.size	initValueArray, .-initValueArray
	.p2align 4
	.globl	writeValueArray
	.type	writeValueArray, @function
writeValueArray:
.LFB13:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
# src/value.c:14: void writeValueArray(ValueArray* array, Value value) {
	mov	r8, rsi	# value, value
	mov	r9, rdx	# value, value
# src/value.c:15:     if (array->capacity < array->count + 1) {
	movsxd	rsi, DWORD PTR [rdi]	#, array_18(D)->capacity
# src/value.c:15:     if (array->capacity < array->count + 1) {
	mov	edx, DWORD PTR 4[rdi]	# _1, array_18(D)->count
# src/value.c:14: void writeValueArray(ValueArray* array, Value value) {
	mov	rcx, rdi	# array, array
# src/value.c:15:     if (array->capacity < array->count + 1) {
	cmp	edx, esi	# _1, _2
# src/value.c:18:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	mov	rdi, QWORD PTR 8[rdi]	# prephitmp_38, array_18(D)->values
# src/value.c:15:     if (array->capacity < array->count + 1) {
	jl	.L4	#,
# src/value.c:17:         array->capacity = GROW_CAPACITY(oldCapacity);
	cmp	esi, 7	# _2,
	jg	.L8	#,
	mov	edx, 128	# _35,
# src/value.c:17:         array->capacity = GROW_CAPACITY(oldCapacity);
	mov	eax, 8	# iftmp.0_15,
.L5:
# src/value.c:17:         array->capacity = GROW_CAPACITY(oldCapacity);
	mov	DWORD PTR [rcx], eax	# array_18(D)->capacity, iftmp.0_15
# src/value.c:18:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	sal	rsi, 4	# _6,
	mov	QWORD PTR 16[rsp], r8	# %sfp, value
	mov	QWORD PTR 24[rsp], r9	# %sfp, value
# src/value.c:17:         array->capacity = GROW_CAPACITY(oldCapacity);
	mov	QWORD PTR 8[rsp], rcx	# %sfp, array
# src/value.c:18:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	call	reallocate@PLT	#
# src/value.c:18:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	mov	rcx, QWORD PTR 8[rsp]	# array, %sfp
# src/value.c:21:     array->values[array->count] = value;
	mov	r8, QWORD PTR 16[rsp]	# value, %sfp
# src/value.c:18:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	mov	QWORD PTR 8[rcx], rax	# array_18(D)->values, prephitmp_38
# src/value.c:21:     array->values[array->count] = value;
	mov	edx, DWORD PTR 4[rcx]	# _1, array_18(D)->count
	mov	r9, QWORD PTR 24[rsp]	# value, %sfp
# src/value.c:18:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	mov	rdi, rax	# prephitmp_38, prephitmp_38
.L4:
# src/value.c:21:     array->values[array->count] = value;
	movsxd	rax, edx	# _11, _1
# src/value.c:21:     array->values[array->count] = value;
	sal	rax, 4	# tmp119,
# src/value.c:22:     array->count++;
	add	edx, 1	# tmp121,
# src/value.c:21:     array->values[array->count] = value;
	mov	QWORD PTR [rdi+rax], r8	# *_13, value
	mov	QWORD PTR 8[rdi+rax], r9	# *_13, value
# src/value.c:22:     array->count++;
	mov	DWORD PTR 4[rcx], edx	# array_18(D)->count, tmp121
# src/value.c:23: }
	add	rsp, 40	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
# src/value.c:17:         array->capacity = GROW_CAPACITY(oldCapacity);
	lea	eax, [rsi+rsi]	# iftmp.0_15,
# src/value.c:18:         array->values = GROW_ARRAY(Value, array->values, oldCapacity, array->capacity);
	movsxd	rdx, eax	# _33, iftmp.0_15
	sal	rdx, 4	# _35,
	jmp	.L5	#
	.cfi_endproc
.LFE13:
	.size	writeValueArray, .-writeValueArray
	.p2align 4
	.globl	freeValueArray
	.type	freeValueArray, @function
freeValueArray:
.LFB14:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/value.c:25: void freeValueArray(ValueArray* array) {
	mov	rbx, rdi	# array, array
# src/value.c:26:     FREE_ARRAY(Value, array->values, array->capacity);
	xor	edx, edx	#
	movsxd	rsi, DWORD PTR [rdi]	# _2, array_6(D)->capacity
	mov	rdi, QWORD PTR 8[rdi]	# array_6(D)->values, array_6(D)->values
	sal	rsi, 4	# _3,
	call	reallocate@PLT	#
# src/value.c:9:     array->values = NULL;
	mov	QWORD PTR 8[rbx], 0	# array_6(D)->values,
# src/value.c:10:     array->capacity = 0;
	mov	QWORD PTR [rbx], 0	# MEM <vector(2) int> [(int *)array_6(D)],
# src/value.c:28: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE14:
	.size	freeValueArray, .-freeValueArray
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"true"
.LC1:
	.string	"false"
.LC2:
	.string	"null"
.LC3:
	.string	"%lf"
	.text
	.p2align 4
	.globl	printValue
	.type	printValue, @function
printValue:
.LFB15:
	.cfi_startproc
# src/value.c:31:     switch(value.type) {
	cmp	edi, 2	# value,
# src/value.c:30: void printValue(Value value) {
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/value.c:31:     switch(value.type) {
	je	.L12	#,
	ja	.L13	#,
	test	edi, edi	# value
	je	.L24	#,
# src/value.c:33:         case VAL_NULL:   printf("null"); break;
	lea	rdi, .LC2[rip]	#,
	xor	eax, eax	#
# src/value.c:38: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/value.c:33:         case VAL_NULL:   printf("null"); break;
	jmp	printf@PLT	#
	.p2align 4,,10
	.p2align 3
.L13:
	.cfi_restore_state
# src/value.c:31:     switch(value.type) {
	cmp	edi, 3	# value,
	jne	.L25	#,
# src/value.c:35:         case VAL_OBJ:    printObject(value); break;
	mov	edi, 3	#,
# src/value.c:38: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/value.c:35:         case VAL_OBJ:    printObject(value); break;
	jmp	printObject@PLT	#
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore_state
# src/value.c:38: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
# src/value.c:34:         case VAL_NUMBER: printf("%lf", AS_NUMBER(value)); break;
	vmovq	xmm0, rsi	# value, value
	lea	rdi, .LC3[rip]	#,
	mov	eax, 1	#,
# src/value.c:38: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/value.c:34:         case VAL_NUMBER: printf("%lf", AS_NUMBER(value)); break;
	jmp	printf@PLT	#
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
# src/value.c:32:         case VAL_BOOL:   printf(AS_BOOL(value) ? "true" : "false"); break;
	test	sil, sil	# value
	lea	rax, .LC0[rip]	# tmp115,
	lea	rdi, .LC1[rip]	# tmp114,
	cmovne	rdi, rax	# tmp114,, iftmp.1_4, tmp115
# src/value.c:38: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/value.c:32:         case VAL_BOOL:   printf(AS_BOOL(value) ? "true" : "false"); break;
	xor	eax, eax	#
	jmp	printf@PLT	#
	.cfi_endproc
.LFE15:
	.size	printValue, .-printValue
	.p2align 4
	.globl	valuesEqual
	.type	valuesEqual, @function
valuesEqual:
.LFB16:
	.cfi_startproc
# src/value.c:41:     if (a.type != b.type) return false;
	cmp	edi, edx	# a, b
# src/value.c:40: bool valuesEqual(Value a, Value b) {
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	eax, 0	# <retval>,
# src/value.c:40: bool valuesEqual(Value a, Value b) {
	mov	rbp, rsi	# a, a
	mov	rsi, rdi	# a, a
# src/value.c:41:     if (a.type != b.type) return false;
	jne	.L26	#,
# src/value.c:42:     switch (a.type) {
	cmp	esi, 2	# a,
	je	.L28	#,
	ja	.L29	#,
	test	esi, esi	# a
# src/value.c:44:         case VAL_NULL:   return true;
	mov	eax, 1	# <retval>,
# src/value.c:42:     switch (a.type) {
	je	.L34	#,
.L26:
# src/value.c:49: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
# src/value.c:43:         case VAL_BOOL:   return AS_BOOL(a) == AS_BOOL(b);
	cmp	bpl, cl	# a, b
	sete	al	#, <retval>
# src/value.c:49: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L28:
	.cfi_restore_state
# src/value.c:45:         case VAL_NUMBER: return AS_NUMBER(a) == AS_NUMBER(b);
	vmovq	xmm0, rbp	# tmp135, a
	vmovq	xmm1, rcx	# tmp136, b
	vucomisd	xmm0, xmm1	# tmp135, tmp136
# src/value.c:49: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/value.c:45:         case VAL_NUMBER: return AS_NUMBER(a) == AS_NUMBER(b);
	setnp	dl	#, tmp119
	cmove	eax, edx	# tmp119,, <retval>
# src/value.c:49: }
	ret	
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
# src/value.c:46:         case VAL_OBJ:    return AS_OBJ(a) == AS_OBJ(b);
	cmp	rbp, rcx	# a, b
	sete	al	#, <retval>
# src/value.c:42:     switch (a.type) {
	xor	edx, edx	#
	cmp	esi, 3	# a,
	cmovne	eax, edx	# <retval>,, <retval>, tmp129
# src/value.c:49: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE16:
	.size	valuesEqual, .-valuesEqual
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
