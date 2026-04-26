	.file	"memory.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=4096 -mtune=arrowlake-s -masm=intel -O3
	.text
	.p2align 4
	.globl	reallocate
	.type	reallocate, @function
reallocate:
.LFB12:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/memory.c:7:     if (newSize == 0) {
	test	rdx, rdx	# newSize
	je	.L6	#,
# src/memory.c:12:     void* result = realloc(pointer, newSize);
	mov	rsi, rdx	#, newSize
	call	realloc@PLT	#
# src/memory.c:13:     if (result == NULL) {
	test	rax, rax	# <retval>
	je	.L7	#,
# src/memory.c:17: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
# src/memory.c:8:         free(pointer);
	call	free@PLT	#
# src/memory.c:9:         return NULL;
	xor	eax, eax	# <retval>
# src/memory.c:17: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L7:
	.cfi_restore_state
# src/memory.c:14:         exit(1);
	mov	edi, 1	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE12:
	.size	reallocate, .-reallocate
	.p2align 4
	.globl	freeObjects
	.type	freeObjects, @function
freeObjects:
.LFB14:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/memory.c:40:     Obj* object = vm.objects;
	lea	rax, vm[rip]	# tmp103,
# src/memory.c:39: void freeObjects() {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/memory.c:40:     Obj* object = vm.objects;
	mov	rbx, QWORD PTR 16778840[rax]	# next, vm.objects
	.p2align 4,,10
	.p2align 3
.L20:
# src/memory.c:41:     while (object != NULL) {
	test	rbx, rbx	# next
	je	.L18	#,
.L22:
	mov	rbp, rbx	# object, next
# src/memory.c:20:     switch (object->type) {
	mov	eax, DWORD PTR 0[rbp]	# _7, object_20->type
# src/memory.c:42:         Obj* next = object->next;
	mov	rbx, QWORD PTR 8[rbx]	# next, object_18->next
# src/memory.c:20:     switch (object->type) {
	cmp	eax, 2	# _7,
	je	.L21	#,
	cmp	eax, 3	# _7,
	je	.L11	#,
	test	eax, eax	# _7
	jne	.L20	#,
# src/memory.c:23:             freeChunk(&function->chunk);
	lea	rdi, 24[rbp]	# _8,
	call	freeChunk@PLT	#
# src/memory.c:8:         free(pointer);
	mov	rdi, rbp	#, object
	call	free@PLT	#
# src/memory.c:41:     while (object != NULL) {
	test	rbx, rbx	# next
	jne	.L22	#,
.L18:
# src/memory.c:46: }
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
.L11:
	.cfi_restore_state
# src/memory.c:8:         free(pointer);
	mov	rdi, QWORD PTR 24[rbp]	# MEM[(struct ObjString *)object_20].chars, MEM[(struct ObjString *)object_20].chars
	call	free@PLT	#
.L21:
	mov	rdi, rbp	#, object
	call	free@PLT	#
	jmp	.L20	#
	.cfi_endproc
.LFE14:
	.size	freeObjects, .-freeObjects
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
