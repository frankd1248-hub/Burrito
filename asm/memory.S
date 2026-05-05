	.file	"memory.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.globl	"markObject"
	.type	"markObject", @function
"markObject":
.LFB27:
	.cfi_startproc
# src/memory.c:40:     if (object == NULL) return;
	test	rdi, rdi	# object
	je	.L11	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rdi], 0	# object_18(D)->isMarked,
	jne	.L11	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	movsxd	rcx, DWORD PTR "vm"[rip+8392328]	#, vm.grayCount
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR "vm"[rip+8392332]	# _3, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rdi], 1	# object_18(D)->isMarked,
	mov	rdx, rdi	# object, object
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR "vm"[rip+8392336]	# prephitmp_39, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	ecx, eax	# _2, _3
	jl	.L12	#,
# src/memory.c:39: void markObject(Obj* object) {
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _3,
	jg	.L17	#,
	mov	esi, 64	# _36,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_16,
.L4:
	mov	QWORD PTR 8[rsp], rdx	# %sfp, object
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR "vm"[rip+8392332], eax	# vm.grayCapacity, iftmp.0_16
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR "vm"[rip+8392336], rax	# vm.grayStack, prephitmp_39
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_39, prephitmp_39
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_39
	je	.L18	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rcx, DWORD PTR "vm"[rip+8392328]	#, vm.grayCount
	mov	rdx, QWORD PTR 8[rsp]	# object, %sfp
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rcx]	# tmp119,
	mov	DWORD PTR "vm"[rip+8392328], eax	# vm.grayCount, tmp119
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rcx*8], rdx	# *_15, object
# src/memory.c:59: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L12:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rcx]	# tmp119,
	mov	DWORD PTR "vm"[rip+8392328], eax	# vm.grayCount, tmp119
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rcx*8], rdx	# *_15, object
	ret	
	.p2align 4,,10
	.p2align 3
.L11:
	ret	
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_def_cfa_offset 32
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _36,
	jmp	.L4	#
.L18:
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	mov	edi, 1	#,
	call	"exit"@PLT	#
	.cfi_endproc
.LFE27:
	.size	"markObject", .-"markObject"
	.p2align 4
	.globl	"markValue"
	.type	"markValue", @function
"markValue":
.LFB28:
	.cfi_startproc
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	rax, -1125899906842624	# tmp114,
	mov	rdx, rdi	# tmp130, value
	not	rdx	# tmp130
	test	rdx, rax	# tmp130, tmp114
	je	.L34	#,
.L29:
	ret	
	.p2align 4,,10
	.p2align 3
.L34:
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	rax, 1125899906842623	# tmp116,
# src/memory.c:40:     if (object == NULL) return;
	and	rdi, rax	# value, tmp116
	mov	rdx, rdi	# _6, value
	je	.L29	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rdi], 0	# _7->isMarked,
	jne	.L29	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	movsxd	rcx, DWORD PTR "vm"[rip+8392328]	#, vm.grayCount
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR "vm"[rip+8392332]	# _10, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rdi], 1	# _7->isMarked,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR "vm"[rip+8392336]	# prephitmp_42, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	ecx, eax	# _9, _10
	jl	.L30	#,
# src/memory.c:61: void markValue(Value value) {
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _10,
	jg	.L35	#,
	mov	esi, 64	# _39,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_11,
.L22:
	mov	QWORD PTR 8[rsp], rdx	# %sfp, _6
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR "vm"[rip+8392332], eax	# vm.grayCapacity, iftmp.0_11
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR "vm"[rip+8392336], rax	# vm.grayStack, prephitmp_42
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_42, prephitmp_42
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_42
	je	.L36	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rcx, DWORD PTR "vm"[rip+8392328]	#, vm.grayCount
	mov	rdx, QWORD PTR 8[rsp]	# _6, %sfp
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rcx]	# tmp126,
	mov	DWORD PTR "vm"[rip+8392328], eax	# vm.grayCount, tmp126
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rcx*8], rdx	# *_22, _6
# src/memory.c:63: }
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L30:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rcx]	# tmp126,
	mov	DWORD PTR "vm"[rip+8392328], eax	# vm.grayCount, tmp126
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rcx*8], rdx	# *_22, _6
	ret	
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_def_cfa_offset 32
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _39,
	jmp	.L22	#
.L36:
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	mov	edi, 1	#,
	call	"exit"@PLT	#
	.cfi_endproc
.LFE28:
	.size	"markValue", .-"markValue"
	.p2align 4
	.globl	"collectGarbage"
	.type	"collectGarbage", @function
"collectGarbage":
.LFB35:
	.cfi_startproc
	sub	rsp, 72	#,
	.cfi_def_cfa_offset 80
# src/memory.c:198:     for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
	mov	rcx, QWORD PTR "vm"[rip+8392312]	# prephitmp_752, vm.stackTop
# src/memory.c:246: void collectGarbage() {
	mov	QWORD PTR 32[rsp], rbp	#,
	.cfi_offset 6, -48
# src/memory.c:198:     for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
	lea	rbp, "vm"[rip+1544]	# slot,
# src/memory.c:246: void collectGarbage() {
	mov	QWORD PTR 24[rsp], rbx	#,
	.cfi_offset 3, -56
	lea	rbx, -1544[rbp]	# tmp637,
	mov	QWORD PTR 48[rsp], r13	#,
	.cfi_offset 13, -32
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r13, -1125899906842624	# tmp353,
# src/memory.c:246: void collectGarbage() {
	mov	QWORD PTR 56[rsp], r14	#,
	.cfi_offset 14, -24
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r14, 1125899906842623	# tmp646,
# src/memory.c:246: void collectGarbage() {
	mov	QWORD PTR 40[rsp], r12	#,
# src/memory.c:198:     for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
	cmp	rbp, rcx	# slot, prephitmp_752
	.cfi_offset 12, -40
	jb	.L45	#,
	jmp	.L38	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L41:
# src/memory.c:198:     for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
	add	rbp, 8	# slot,
# src/memory.c:198:     for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
	cmp	rbp, rcx	# slot, prephitmp_752
	jnb	.L38	#,
.L45:
# src/memory.c:199:         markValue(*slot);
	mov	rax, QWORD PTR 0[rbp]	# _25, MEM[(Value *)slot_317]
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	mov	rdx, rax	# tmp665, _25
	not	rdx	# tmp665
	test	rdx, r13	# tmp665, tmp353
	jne	.L41	#,
# src/memory.c:40:     if (object == NULL) return;
	and	rax, r14	# _25, tmp646
	mov	r12, rax	# _37, _25
	je	.L41	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rax], 0	# _38->isMarked,
	jne	.L41	#,
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rax], 1	# _38->isMarked,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	movsxd	rdx, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR 8392332[rbx]	# _41, vm.grayCapacity
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR 8392336[rbx]	# prephitmp_759, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	edx, eax	# _40, _41
	jl	.L42	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _41,
	jle	.L144	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _756,
.L43:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], eax	# vm.grayCapacity, iftmp.0_42
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, prephitmp_759
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_759, prephitmp_759
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_759
	je	.L250	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rdx, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:198:     for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
	mov	rcx, QWORD PTR 8392312[rbx]	# prephitmp_752, vm.stackTop
.L42:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rdx]	# tmp366,
# src/memory.c:198:     for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
	add	rbp, 8	# slot,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	DWORD PTR 8392328[rbx], eax	# vm.grayCount, tmp366
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rdx*8], r12	# *_53, _37
# src/memory.c:198:     for (Value* slot = vm.stack; slot < vm.stackTop; slot++) {
	cmp	rbp, rcx	# slot, prephitmp_752
	jb	.L45	#,
	.p2align 4
	.p2align 3
.L38:
# src/memory.c:202:     for (int i = 0; i < vm.frameCount; i++) {
	mov	ecx, DWORD PTR "vm"[rip+1536]	# prephitmp_770, vm.frameCount
# src/memory.c:202:     for (int i = 0; i < vm.frameCount; i++) {
	test	ecx, ecx	# prephitmp_770
	jle	.L46	#,
	lea	r13, "vm"[rip]	# ivtmp.48,
# src/memory.c:202:     for (int i = 0; i < vm.frameCount; i++) {
	xor	r12d, r12d	# i
	jmp	.L52	#
	.p2align 4,,10
	.p2align 3
.L261:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _774,
.L51:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], eax	# vm.grayCapacity, iftmp.0_57
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, prephitmp_777
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_777, prephitmp_777
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_777
	je	.L250	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rdx, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:202:     for (int i = 0; i < vm.frameCount; i++) {
	mov	ecx, DWORD PTR 1536[rbx]	# prephitmp_770, vm.frameCount
.L50:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rdx]	# tmp379,
	mov	DWORD PTR 8392328[rbx], eax	# vm.grayCount, tmp379
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rdx*8], rbp	# *_68, _30
.L48:
# src/memory.c:202:     for (int i = 0; i < vm.frameCount; i++) {
	add	r12d, 1	# i,
# src/memory.c:202:     for (int i = 0; i < vm.frameCount; i++) {
	add	r13, 24	# ivtmp.48,
	cmp	r12d, ecx	# i, prephitmp_770
	jge	.L46	#,
.L52:
# src/memory.c:203:         markObject((Obj*) vm.frames[i].closure);
	mov	rbp, QWORD PTR 0[r13]	# _30, MEM[(struct ObjClosure * *)_1031]
# src/memory.c:40:     if (object == NULL) return;
	test	rbp, rbp	# _30
	je	.L48	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rbp], 0	# MEM[(struct Obj *)_30].isMarked,
	jne	.L48	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	movsxd	rdx, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR 8392332[rbx]	# _56, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rbp], 1	# MEM[(struct Obj *)_30].isMarked,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR 8392336[rbx]	# prephitmp_777, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	edx, eax	# _55, _56
	jl	.L50	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _56,
	jg	.L261	#,
	mov	esi, 64	# _774,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_57,
	jmp	.L51	#
	.p2align 4,,10
	.p2align 3
.L46:
# src/memory.c:206:     for (ObjUpvalue* upvalue = vm.openUpvalues; upvalue != NULL; upvalue = upvalue->next) {
	mov	rbp, QWORD PTR "vm"[rip+8390232]	# upvalue, vm.openUpvalues
# src/memory.c:206:     for (ObjUpvalue* upvalue = vm.openUpvalues; upvalue != NULL; upvalue = upvalue->next) {
	test	rbp, rbp	# upvalue
	jne	.L57	#,
	jmp	.L53	#
	.p2align 4,,10
	.p2align 3
.L262:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _796,
.L56:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], eax	# vm.grayCapacity, iftmp.0_72
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, prephitmp_799
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_799, prephitmp_799
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_799
	je	.L250	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rdx, DWORD PTR 8392328[rbx]	#, vm.grayCount
.L55:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rdx]	# tmp391,
	mov	DWORD PTR 8392328[rbx], eax	# vm.grayCount, tmp391
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rdx*8], rbp	# *_83, upvalue
.L54:
# src/memory.c:206:     for (ObjUpvalue* upvalue = vm.openUpvalues; upvalue != NULL; upvalue = upvalue->next) {
	mov	rbp, QWORD PTR 32[rbp]	# upvalue, upvalue_386->next
# src/memory.c:206:     for (ObjUpvalue* upvalue = vm.openUpvalues; upvalue != NULL; upvalue = upvalue->next) {
	test	rbp, rbp	# upvalue
	je	.L53	#,
.L57:
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rbp], 0	# MEM[(struct Obj *)upvalue_386].isMarked,
	jne	.L54	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	movsxd	rdx, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR 8392332[rbx]	# _71, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rbp], 1	# MEM[(struct Obj *)upvalue_386].isMarked,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR 8392336[rbx]	# prephitmp_799, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	edx, eax	# _70, _71
	jl	.L55	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _71,
	jg	.L262	#,
	mov	esi, 64	# _796,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_72,
	jmp	.L56	#
	.p2align 4,,10
	.p2align 3
.L53:
# src/memory.c:210:     markTable(&vm.globals);
	lea	rdi, "vm"[rip+8390152]	#,
	call	"markTable"@PLT	#
# src/memory.c:211:     markTable(&vm.consts);
	lea	rdi, "vm"[rip+8390176]	# tmp394,
	call	"markTable"@PLT	#
# src/memory.c:212:     markCompilerRoots();
	call	"markCompilerRoots"@PLT	#
# src/memory.c:213:     markObject((Obj*) vm.initString);
	mov	rbp, QWORD PTR 8390224[rbx]	# _36, vm.initString
# src/memory.c:217:     while (vm.grayCount > 0) {
	movsxd	rcx, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:40:     if (object == NULL) return;
	test	rbp, rbp	# _36
	je	.L60	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rbp], 0	# MEM[(struct Obj *)_36].isMarked,
	jne	.L60	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR 8392332[rbx]	# _86, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rbp], 1	# MEM[(struct Obj *)_36].isMarked,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR 8392336[rbx]	# prephitmp_808, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, ecx	# _86, prephitmp_810
	jle	.L263	#,
.L61:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	edx, 1[rcx]	# prephitmp_1015,
	mov	DWORD PTR "vm"[rip+8392328], edx	# vm.grayCount, prephitmp_1015
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rcx*8], rbp	# *_98, _36
.L59:
# src/memory.c:217:     while (vm.grayCount > 0) {
	test	edx, edx	# prephitmp_1015
	jle	.L63	#,
	mov	QWORD PTR 64[rsp], r15	#,
	lea	eax, -1[rdx]	# _19,
# src/memory.c:78:     switch(object->type) {
	lea	r14, .L66[rip]	# tmp642,
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r13, -1125899906842624	# tmp643,
	.cfi_offset 15, -16
	.p2align 4
	.p2align 3
.L123:
# src/memory.c:218:         Obj* object = vm.grayStack[--vm.grayCount];
	mov	rdi, QWORD PTR 8392336[rbx]	# _17, vm.grayStack
# src/memory.c:218:         Obj* object = vm.grayStack[--vm.grayCount];
	mov	ecx, eax	# _20, _19
# src/memory.c:218:         Obj* object = vm.grayStack[--vm.grayCount];
	mov	DWORD PTR 8392328[rbx], eax	# vm.grayCount, _19
# src/memory.c:218:         Obj* object = vm.grayStack[--vm.grayCount];
	mov	r8d, eax	# _19, _19
# src/memory.c:218:         Obj* object = vm.grayStack[--vm.grayCount];
	lea	rsi, [rdi+rcx*8]	# _22,
# src/memory.c:218:         Obj* object = vm.grayStack[--vm.grayCount];
	mov	rbp, QWORD PTR [rsi]	# object, *_22
# src/memory.c:78:     switch(object->type) {
	cmp	DWORD PTR 0[rbp], 10	# object_23->type,
	ja	.L64	#,
	mov	ecx, DWORD PTR 0[rbp]	# object_23->type, object_23->type
	movsxd	rcx, DWORD PTR [r14+rcx*4]	# tmp414,
	add	rcx, r14	# tmp415, tmp642
	jmp	rcx	# tmp415
	.section	.rodata
	.align 4
	.align 4
.L66:
	.long	.L73-.L66
	.long	.L72-.L66
	.long	.L68-.L66
	.long	.L70-.L66
	.long	.L69-.L66
	.long	.L68-.L66
	.long	.L67-.L66
	.long	.L64-.L66
	.long	.L64-.L66
	.long	.L64-.L66
	.long	.L65-.L66
	.text
	.p2align 4,,10
	.p2align 3
.L68:
# src/memory.c:116:             markObject((Obj*) instance->class_);
	mov	r12, QWORD PTR 16[rbp]	# _126,
# src/memory.c:40:     if (object == NULL) return;
	test	r12, r12	# _126
	je	.L117	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[r12], 0	#,
	jne	.L117	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	ecx, DWORD PTR 8392332[rbx]	# _268, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[r12], 1	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, ecx	# _19, _268
	jl	.L118	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	ecx, 7	# _268,
	jle	.L157	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rcx+rcx]	#,
	mov	rcx, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _844,
.L119:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], ecx	# vm.grayCapacity, iftmp.0_269
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, _274
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rcx, rax	# _274,
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# _274
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rax, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	edx, 1[rax]	# prephitmp_1015,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	rsi, [rcx+rax*8]	# _22,
.L118:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	DWORD PTR 8392328[rbx], edx	# vm.grayCount, prephitmp_1015
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rsi], r12	#* _22, _126
.L117:
# src/memory.c:117:             markTable(&instance->fields);
	lea	rdi, 24[rbp]	# _127,
	call	"markTable"@PLT	#
# src/memory.c:217:     while (vm.grayCount > 0) {
	mov	edx, DWORD PTR 8392328[rbx]	# prephitmp_1015, vm.grayCount
# src/memory.c:217:     while (vm.grayCount > 0) {
	test	edx, edx	# prephitmp_1015
	jg	.L264	#,
.L251:
	mov	r15, QWORD PTR 64[rsp]	#,
	.cfi_restore 15
.L63:
# src/memory.c:254:     tableRemoveWhite(&vm.strings);
	lea	rdi, "vm"[rip+8390200]	#,
	call	"tableRemoveWhite"@PLT	#
# src/memory.c:225:     Obj* object = vm.objects;
	mov	r12, QWORD PTR 8392320[rbx]	# object, vm.objects
# src/memory.c:227:     while (object != NULL) {
	test	r12, r12	# object
	je	.L124	#,
# src/memory.c:224:     Obj* previous = NULL;
	xor	r13d, r13d	# previous
# src/memory.c:140:     switch (object->type) {
	lea	r14, .L132[rip]	# tmp638,
	.p2align 4
	.p2align 3
.L143:
# src/memory.c:231:             object = object->next;
	mov	rbp, QWORD PTR 8[r12]	# pretmp_1017, object_341->next
# src/memory.c:228:         if (object->isMarked) {
	cmp	BYTE PTR 4[r12], 0	# object_341->isMarked,
	jne	.L265	#,
# src/memory.c:235:             if (previous != NULL) {
	test	r13, r13	# previous
	jne	.L266	#,
# src/memory.c:238:                 vm.objects = object;
	mov	rax, rbp	# pretmp_1017, pretmp_1017
	mov	QWORD PTR 8392320[rbx], rbp	# vm.objects, pretmp_1017
	mov	rbp, r12	# pretmp_1017, object
	mov	r12, rax	# object, pretmp_1017
.L129:
# src/memory.c:140:     switch (object->type) {
	cmp	DWORD PTR 0[rbp], 10	# object_998->type,
	ja	.L130	#,
	mov	eax, DWORD PTR 0[rbp]	# object_998->type, object_998->type
	movsxd	rax, DWORD PTR [r14+rax*4]	# tmp535,
	add	rax, r14	# tmp536, tmp638
	jmp	rax	# tmp536
	.section	.rodata
	.align 4
	.align 4
.L132:
	.long	.L141-.L132
	.long	.L140-.L132
	.long	.L136-.L132
	.long	.L138-.L132
	.long	.L137-.L132
	.long	.L136-.L132
	.long	.L130-.L132
	.long	.L135-.L132
	.long	.L134-.L132
	.long	.L133-.L132
	.long	.L131-.L132
	.text
	.p2align 4,,10
	.p2align 3
.L65:
	.cfi_offset 15, -16
# src/memory.c:126:             markValue(((ObjUpvalue*) object)->closed);
	mov	rcx, QWORD PTR 24[rbp]	# _129, MEM[(struct ObjUpvalue *)object_23].closed
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	mov	r8, rcx	# tmp661, _129
	not	r8	# tmp661
	test	r8, r13	# tmp661, tmp643
	je	.L267	#,
.L64:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	edx, eax	# prephitmp_1015, _19
.L74:
# src/memory.c:217:     while (vm.grayCount > 0) {
	test	edx, edx	# prephitmp_1015
	jle	.L251	#,
.L264:
	lea	eax, -1[rdx]	# _19,
	jmp	.L123	#
	.p2align 4,,10
	.p2align 3
.L73:
# src/memory.c:81:             for (int i = 0; i < array->size; i++) {
	mov	esi, DWORD PTR 16[rbp]	# prephitmp_999, MEM[(struct ObjArray *)object_23].size
# src/memory.c:81:             for (int i = 0; i < array->size; i++) {
	test	esi, esi	# prephitmp_999
	jle	.L64	#,
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r15, -1125899906842624	# tmp419,
# src/memory.c:81:             for (int i = 0; i < array->size; i++) {
	movsxd	rdx, eax	#, _19
	xor	r12d, r12d	# ivtmp.29
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r8, 1125899906842623	# tmp639,
	jmp	.L80	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L77:
# src/memory.c:81:             for (int i = 0; i < array->size; i++) {
	add	r12, 1	# ivtmp.29,
	cmp	esi, r12d	# prephitmp_999, ivtmp.29
	jle	.L74	#,
.L80:
# src/memory.c:82:                 markValue(array->values[i]);
	mov	rax, QWORD PTR 24[rbp]	# MEM[(struct ObjArray *)object_23].values, MEM[(struct ObjArray *)object_23].values
	mov	rax, QWORD PTR [rax+r12*8]	# _105, *_104
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	mov	rcx, rax	# tmp664, _105
	not	rcx	# tmp664
	test	rcx, r15	# tmp664, tmp419
	jne	.L77	#,
# src/memory.c:40:     if (object == NULL) return;
	and	rax, r8	# _105, tmp639
	mov	rcx, rax	# _131, _105
	je	.L77	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rax], 0	# _132->isMarked,
	jne	.L77	#,
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rax], 1	# _132->isMarked,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR 8392332[rbx]	# _135, vm.grayCapacity
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR 8392336[rbx]	# prephitmp_1006, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, edx	# _135, prephitmp_1015
	jg	.L78	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _135,
	jg	.L268	#,
	mov	esi, 64	# _1003,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_136,
.L79:
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _131
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], eax	# vm.grayCapacity, iftmp.0_136
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, prephitmp_1006
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_1006, prephitmp_1006
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_1006
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rdx, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:81:             for (int i = 0; i < array->size; i++) {
	mov	esi, DWORD PTR 16[rbp]	# prephitmp_999, MEM[(struct ObjArray *)object_23].size
	movabs	r8, 1125899906842623	# tmp639,
	mov	rcx, QWORD PTR 8[rsp]	# _131, %sfp
.L78:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rdx]	# _144,
	mov	DWORD PTR 8392328[rbx], eax	# vm.grayCount, _144
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rdx*8], rcx	# *_147, _131
	movsxd	rdx, eax	#, _144
	jmp	.L77	#
	.p2align 4,,10
	.p2align 3
.L69:
# src/memory.c:110:             markObject((Obj*) function->name);
	mov	r12, QWORD PTR 72[rbp]	# _124, MEM[(struct ObjFunction *)object_23].name
# src/memory.c:40:     if (object == NULL) return;
	test	r12, r12	# _124
	je	.L106	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[r12], 0	# MEM[(struct Obj *)_124].isMarked,
	jne	.L106	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	ecx, DWORD PTR 8392332[rbx]	# _236, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[r12], 1	# MEM[(struct Obj *)_124].isMarked,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, ecx	# _19, _236
	jl	.L109	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	ecx, 7	# _236,
	jg	.L269	#,
	mov	esi, 64	# _859,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	ecx, 8	# iftmp.0_237,
.L110:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], ecx	# vm.grayCapacity, iftmp.0_237
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, _242
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rcx, rax	# _242,
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# _242
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rax, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	edx, 1[rax]	# prephitmp_1015,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	rsi, [rcx+rax*8]	# _22,
.L109:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	DWORD PTR 8392328[rbx], edx	# vm.grayCount, prephitmp_1015
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rsi], r12	# *prephitmp_871, _124
	jmp	.L108	#
	.p2align 4,,10
	.p2align 3
.L67:
# src/memory.c:122:             markTable(&module->table);
	lea	rdi, 16[rbp]	# _128,
	call	"markTable"@PLT	#
# src/memory.c:217:     while (vm.grayCount > 0) {
	mov	edx, DWORD PTR 8392328[rbx]	# prephitmp_1015, vm.grayCount
# src/memory.c:123:             break;
	jmp	.L74	#
	.p2align 4,,10
	.p2align 3
.L72:
# src/memory.c:88:             markValue(bound->receiver);
	mov	rcx, QWORD PTR 16[rbp]	# _109, MEM[(struct ObjBoundMethod *)object_23].receiver
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	mov	r9, rcx	# tmp663, _109
	not	r9	# tmp663
	test	r9, r13	# tmp663, tmp643
	je	.L270	#,
.L82:
# src/memory.c:89:             markObject((Obj*) bound->method);
	mov	rbp, QWORD PTR 24[rbp]	# _111, MEM[(struct ObjBoundMethod *)object_23].method
# src/memory.c:40:     if (object == NULL) return;
	test	rbp, rbp	# _111
	je	.L87	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rbp], 0	# MEM[(struct Obj *)_111].isMarked,
	jne	.L87	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR 8392332[rbx]	# _167, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rbp], 1	# MEM[(struct Obj *)_111].isMarked,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, r8d	# _167, _19
	jg	.L88	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _167,
	jg	.L271	#,
	mov	esi, 64	# _985,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_168,
.L89:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], eax	# vm.grayCapacity, iftmp.0_168
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, _17
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# _17, _17
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# _17
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	r8d, DWORD PTR 8392328[rbx]	# _19, vm.grayCount
.L88:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	edx, 1[r8]	# prephitmp_1015,
	movsxd	r8, r8d	# _177, _19
	mov	DWORD PTR 8392328[rbx], edx	# vm.grayCount, prephitmp_1015
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+r8*8], rbp	# *_179, _111
	jmp	.L74	#
	.p2align 4,,10
	.p2align 3
.L70:
# src/memory.c:100:             markObject((Obj*) closure->function);
	mov	r12, QWORD PTR 16[rbp]	# _114, MEM[(struct ObjClosure *)object_23].function
# src/memory.c:40:     if (object == NULL) return;
	test	r12, r12	# _114
	je	.L95	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[r12], 0	# MEM[(struct Obj *)_114].isMarked,
	jne	.L95	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	ecx, DWORD PTR 8392332[rbx]	# _197, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[r12], 1	# MEM[(struct Obj *)_114].isMarked,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, ecx	# _19, _197
	jl	.L96	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	ecx, 7	# _197,
	jle	.L153	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rcx+rcx]	#,
	mov	rcx, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _906,
.L97:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], ecx	# vm.grayCapacity, iftmp.0_198
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, _203
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rcx, rax	# _203,
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# _203
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rax, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	edx, 1[rax]	# prephitmp_1015,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	rsi, [rcx+rax*8]	# _22,
.L96:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	DWORD PTR 8392328[rbx], edx	# vm.grayCount, prephitmp_1015
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rsi], r12	# *prephitmp_918, _114
	jmp	.L94	#
	.p2align 4,,10
	.p2align 3
.L265:
	.cfi_restore 15
# src/memory.c:229:             object->isMarked = false;
	mov	BYTE PTR 4[r12], 0	# object_232->isMarked,
# src/memory.c:227:     while (object != NULL) {
	test	rbp, rbp	# pretmp_1017
	je	.L124	#,
.L272:
# src/memory.c:231:             object = object->next;
	mov	rax, QWORD PTR 8[rbp]	# pretmp_118, MEM[(struct Obj *)pretmp_1017].next
# src/memory.c:228:         if (object->isMarked) {
	cmp	BYTE PTR 4[rbp], 0	# MEM[(struct Obj *)pretmp_1017].isMarked,
	je	.L127	#,
	mov	r12, rbp	# object, pretmp_1017
# src/memory.c:231:             object = object->next;
	mov	rbp, rax	# pretmp_1017, pretmp_118
# src/memory.c:229:             object->isMarked = false;
	mov	BYTE PTR 4[r12], 0	# object_232->isMarked,
# src/memory.c:227:     while (object != NULL) {
	test	rbp, rbp	# pretmp_1017
	jne	.L272	#,
.L124:
# src/memory.c:257:     vm.nextGC = vm.bytesAllocated * GC_HEAP_GROW_FACTOR;
	mov	rax, QWORD PTR "vm"[rip+8392296]	# tmp679, vm.bytesAllocated
# src/memory.c:265: }
	mov	rbx, QWORD PTR 24[rsp]	#,
	mov	rbp, QWORD PTR 32[rsp]	#,
	mov	r12, QWORD PTR 40[rsp]	#,
# src/memory.c:257:     vm.nextGC = vm.bytesAllocated * GC_HEAP_GROW_FACTOR;
	add	rax, rax	# _2
# src/memory.c:265: }
	mov	r13, QWORD PTR 48[rsp]	#,
	mov	r14, QWORD PTR 56[rsp]	#,
# src/memory.c:257:     vm.nextGC = vm.bytesAllocated * GC_HEAP_GROW_FACTOR;
	mov	QWORD PTR "vm"[rip+8392304], rax	# vm.nextGC, _2
# src/memory.c:265: }
	add	rsp, 72	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L136:
	.cfi_restore_state
# src/memory.c:170:             freeTable(&instance->fields);
	lea	rdi, 24[rbp]	# _309,
	call	"freeTable"@PLT	#
# src/memory.c:28:         free(pointer);
	mov	rdi, rbp	#, pretmp_1017
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], 48	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
	.p2align 4
	.p2align 3
.L130:
# src/memory.c:227:     while (object != NULL) {
	test	r12, r12	# object
	jne	.L143	#,
	jmp	.L124	#
	.p2align 4,,10
	.p2align 3
.L134:
# src/memory.c:179:             if (resource->destroy) {
	mov	rax, QWORD PTR 32[rbp]	# _310, MEM[(struct ObjResource *)object_998].destroy
# src/memory.c:179:             if (resource->destroy) {
	test	rax, rax	# _310
	je	.L131	#,
# src/memory.c:180:                 resource->destroy(resource->handle);
	mov	rdi, QWORD PTR 24[rbp]	# MEM[(struct ObjResource *)object_998].handle, MEM[(struct ObjResource *)object_998].handle
	call	rax	# _310
.L131:
# src/memory.c:28:         free(pointer);
	mov	rdi, rbp	#, pretmp_1017
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], 40	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:193:             break;
	jmp	.L130	#
	.p2align 4,,10
	.p2align 3
.L266:
# src/memory.c:235:             if (previous != NULL) {
	mov	rax, rbp	# pretmp_118, pretmp_1017
	mov	rbp, r12	# pretmp_1017, object
	mov	r12, r13	# object, previous
.L127:
# src/memory.c:236:                 previous->next = object;
	mov	QWORD PTR 8[r12], rax	# previous_122->next, pretmp_118
	mov	r13, r12	# previous, object
	mov	r12, rax	# object, pretmp_118
	jmp	.L129	#
	.p2align 4,,10
	.p2align 3
.L137:
# src/memory.c:164:             freeChunk(&function->chunk);
	lea	rdi, 24[rbp]	# _308,
	call	"freeChunk"@PLT	#
# src/memory.c:28:         free(pointer);
	mov	rdi, rbp	#, pretmp_1017
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], 80	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:166:             break;
	jmp	.L130	#
	.p2align 4,,10
	.p2align 3
.L138:
# src/memory.c:158:             FREE_ARRAY(ObjUpvalue*, closure->upvalues, closure->upvalueCount);
	movsxd	rax, DWORD PTR 32[rbp]	# _305, MEM[(struct ObjClosure *)object_998].upvalueCount
	mov	rdi, QWORD PTR 24[rbp]	# _307, MEM[(struct ObjClosure *)object_998].upvalues
	sal	rax, 3	# _306,
.L252:
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], rax	# vm.bytesAllocated, _314
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
	mov	rdi, rbp	#, pretmp_1017
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], 40	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:189:             break;
	jmp	.L130	#
	.p2align 4,,10
	.p2align 3
.L140:
# src/memory.c:28:         free(pointer);
	mov	rdi, rbp	#, pretmp_1017
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], 32	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:149:             break;
	jmp	.L130	#
	.p2align 4,,10
	.p2align 3
.L141:
# src/memory.c:143:             FREE_ARRAY(Value, array->values, array->size);
	mov	rdi, QWORD PTR 24[rbp]	# _302, MEM[(struct ObjArray *)object_998].values
	movsxd	rax, DWORD PTR 16[rbp]	# _300, MEM[(struct ObjArray *)object_998].size
	sal	rax, 3	# _301,
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], rax	# vm.bytesAllocated, _301
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
	mov	rdi, rbp	#, pretmp_1017
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], 32	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:145:             break;
	jmp	.L130	#
	.p2align 4,,10
	.p2align 3
.L135:
# src/memory.c:28:         free(pointer);
	mov	rdi, rbp	#, pretmp_1017
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR 8392296[rbx], 24	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:176:             break;
	jmp	.L130	#
	.p2align 4,,10
	.p2align 3
.L133:
# src/memory.c:187:             FREE_ARRAY(char, string->chars, string->length + 1);
	mov	eax, DWORD PTR 16[rbp]	# tmp678, MEM[(struct ObjString *)object_998].length
	mov	rdi, QWORD PTR 24[rbp]	# _315, MEM[(struct ObjString *)object_998].chars
	add	eax, 1	# _313,
	cdqe
	jmp	.L252	#
	.p2align 4,,10
	.p2align 3
.L263:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _86,
	jg	.L273	#,
	mov	esi, 64	# _805,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_87,
.L62:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR "vm"[rip+8392332], eax	# vm.grayCapacity, iftmp.0_87
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR "vm"[rip+8392336], rax	# vm.grayStack, prephitmp_808
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_808, prephitmp_808
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_808
	je	.L250	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rcx, DWORD PTR "vm"[rip+8392328]	#, vm.grayCount
	jmp	.L61	#
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_offset 15, -16
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	edx, r8d	# prephitmp_1015, _19
	jmp	.L74	#
	.p2align 4,,10
	.p2align 3
.L95:
	mov	edx, eax	# prephitmp_1015, _19
.L94:
# src/memory.c:101:             if (closure->upvalues != NULL) {
	mov	rax, QWORD PTR 24[rbp]	# pretmp_921, MEM[(struct ObjClosure *)object_23].upvalues
# src/memory.c:101:             if (closure->upvalues != NULL) {
	test	rax, rax	# pretmp_921
	je	.L74	#,
# src/memory.c:102:                 for (int i = 0; i < closure->upvalueCount; i++) {
	mov	ecx, DWORD PTR 32[rbp]	# prephitmp_931, MEM[(struct ObjClosure *)object_23].upvalueCount
# src/memory.c:102:                 for (int i = 0; i < closure->upvalueCount; i++) {
	test	ecx, ecx	# prephitmp_931
	jle	.L74	#,
	xor	r12d, r12d	# ivtmp.35
	jmp	.L105	#
	.p2align 4,,10
	.p2align 3
.L274:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _935,
.L104:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], eax	# vm.grayCapacity, iftmp.0_213
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, prephitmp_938
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_938, prephitmp_938
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_938
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	edx, DWORD PTR 8392328[rbx]	# prephitmp_1015, vm.grayCount
# src/memory.c:102:                 for (int i = 0; i < closure->upvalueCount; i++) {
	mov	ecx, DWORD PTR 32[rbp]	# prephitmp_931, MEM[(struct ObjClosure *)object_23].upvalueCount
.L103:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rdx]	# _221,
	movsxd	rdx, edx	# _222, prephitmp_1015
	mov	DWORD PTR 8392328[rbx], eax	# vm.grayCount, _221
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rdx*8], r15	# *_224, _121
	mov	edx, eax	# prephitmp_1015, _221
.L101:
# src/memory.c:102:                 for (int i = 0; i < closure->upvalueCount; i++) {
	add	r12, 1	# ivtmp.35,
	cmp	ecx, r12d	# prephitmp_931, ivtmp.35
	jle	.L74	#,
# src/memory.c:103:                     markObject((Obj*) closure->upvalues[i]);
	mov	rax, QWORD PTR 24[rbp]	# pretmp_921, MEM[(struct ObjClosure *)object_23].upvalues
.L105:
# src/memory.c:103:                     markObject((Obj*) closure->upvalues[i]);
	mov	r15, QWORD PTR [rax+r12*8]	# _121, *_120
# src/memory.c:40:     if (object == NULL) return;
	test	r15, r15	# _121
	je	.L101	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[r15], 0	# MEM[(struct Obj *)_121].isMarked,
	jne	.L101	#,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR 8392332[rbx]	# _212, vm.grayCapacity
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[r15], 1	# MEM[(struct Obj *)_121].isMarked,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR 8392336[rbx]	# prephitmp_938, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, edx	# _212, prephitmp_1015
	jg	.L103	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _212,
	jg	.L274	#,
	mov	esi, 64	# _935,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_213,
	jmp	.L104	#
	.p2align 4,,10
	.p2align 3
.L106:
	mov	edx, eax	# prephitmp_1015, _19
.L108:
# src/memory.c:66:     for (int i = 0; i < array->count; i++) {
	mov	esi, DWORD PTR 60[rbp]	# prephitmp_885, MEM[(struct ValueArray *)object_23 + 56B].count
# src/memory.c:66:     for (int i = 0; i < array->count; i++) {
	test	esi, esi	# prephitmp_885
	jle	.L74	#,
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r15, -1125899906842624	# tmp492,
# src/memory.c:66:     for (int i = 0; i < array->count; i++) {
	xor	r12d, r12d	# ivtmp.42
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r8, 1125899906842623	# tmp641,
	jmp	.L116	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L113:
# src/memory.c:66:     for (int i = 0; i < array->count; i++) {
	add	r12, 1	# ivtmp.42,
	cmp	esi, r12d	# prephitmp_885, ivtmp.42
	jle	.L74	#,
.L116:
# src/memory.c:67:         markValue(array->values[i]);
	mov	rax, QWORD PTR 64[rbp]	# MEM[(struct ValueArray *)object_23 + 56B].values, MEM[(struct ValueArray *)object_23 + 56B].values
	mov	rax, QWORD PTR [rax+r12*8]	# _230, *_229
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	mov	rcx, rax	# tmp662, _230
	not	rcx	# tmp662
	test	rcx, r15	# tmp662, tmp492
	jne	.L113	#,
# src/memory.c:40:     if (object == NULL) return;
	and	rax, r8	# _230, tmp641
	mov	rcx, rax	# _249, _230
	je	.L113	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rax], 0	# _250->isMarked,
	jne	.L113	#,
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rax], 1	# _250->isMarked,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	eax, DWORD PTR 8392332[rbx]	# _253, vm.grayCapacity
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, QWORD PTR 8392336[rbx]	# prephitmp_892, vm.grayStack
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, edx	# _253, prephitmp_1015
	jg	.L114	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	eax, 7	# _253,
	jg	.L275	#,
	mov	esi, 64	# _889,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_254,
.L115:
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _249
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], eax	# vm.grayCapacity, iftmp.0_254
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, prephitmp_892
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# prephitmp_892, prephitmp_892
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# prephitmp_892
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	edx, DWORD PTR 8392328[rbx]	# prephitmp_1015, vm.grayCount
# src/memory.c:66:     for (int i = 0; i < array->count; i++) {
	mov	esi, DWORD PTR 60[rbp]	# prephitmp_885, MEM[(struct ValueArray *)object_23 + 56B].count
	movabs	r8, 1125899906842623	# tmp641,
	mov	rcx, QWORD PTR 8[rsp]	# _249, %sfp
.L114:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	eax, 1[rdx]	# _262,
	movsxd	rdx, edx	# _263, prephitmp_1015
	mov	DWORD PTR 8392328[rbx], eax	# vm.grayCount, _262
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rdi+rdx*8], rcx	# *_265, _249
	mov	edx, eax	# prephitmp_1015, _262
	jmp	.L113	#
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore 15
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	edx, ecx	# prephitmp_1015, prephitmp_810
	jmp	.L59	#
	.p2align 4,,10
	.p2align 3
.L157:
	.cfi_offset 15, -16
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	esi, 64	# _844,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	ecx, 8	# iftmp.0_269,
	jmp	.L119	#
	.p2align 4,,10
	.p2align 3
.L144:
	.cfi_restore 15
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	esi, 64	# _756,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	eax, 8	# iftmp.0_42,
	jmp	.L43	#
	.p2align 4,,10
	.p2align 3
.L275:
	.cfi_offset 15, -16
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _889,
	jmp	.L115	#
	.p2align 4,,10
	.p2align 3
.L268:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _1003,
	jmp	.L79	#
	.p2align 4,,10
	.p2align 3
.L267:
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r8, 1125899906842623	# tmp520,
# src/memory.c:40:     if (object == NULL) return;
	and	rcx, r8	# _129, tmp520
	mov	rbp, rcx	# _281, _129
	je	.L64	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rcx], 0	# _282->isMarked,
	jne	.L64	#,
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rcx], 1	# _282->isMarked,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	ecx, DWORD PTR 8392332[rbx]	# _285, vm.grayCapacity
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, ecx	# _19, _285
	jl	.L276	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	ecx, 7	# _285,
	jle	.L158	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rcx+rcx]	#,
	mov	rcx, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _829,
.L122:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], ecx	# vm.grayCapacity, iftmp.0_286
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, _291
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rcx, rax	# _291,
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# _291
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rax, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	edx, 1[rax]	# prephitmp_1015,
	mov	DWORD PTR 8392328[rbx], edx	# vm.grayCount, prephitmp_1015
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rcx+rax*8], rbp	# *_840, _281
	jmp	.L74	#
	.p2align 4,,10
	.p2align 3
.L273:
	.cfi_restore 15
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _805,
	jmp	.L62	#
	.p2align 4,,10
	.p2align 3
.L269:
	.cfi_offset 15, -16
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rcx+rcx]	#,
	mov	rcx, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _859,
	jmp	.L110	#
	.p2align 4,,10
	.p2align 3
.L271:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rax+rax]	#,
	mov	rax, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _985,
	jmp	.L89	#
	.p2align 4,,10
	.p2align 3
.L153:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	esi, 64	# _906,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	ecx, 8	# iftmp.0_198,
	jmp	.L97	#
	.p2align 4,,10
	.p2align 3
.L270:
# src/memory.c:62:     if (IS_OBJ(value)) markObject(AS_OBJ(value));
	movabs	r9, 1125899906842623	# tmp434,
# src/memory.c:40:     if (object == NULL) return;
	and	rcx, r9	# _109, tmp434
	mov	r12, rcx	# _148, _109
	je	.L82	#,
# src/memory.c:41:     if (object->isMarked) return;
	cmp	BYTE PTR 4[rcx], 0	# _149->isMarked,
	jne	.L82	#,
# src/memory.c:49:     object->isMarked = true;
	mov	BYTE PTR 4[rcx], 1	# _149->isMarked,
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	ecx, DWORD PTR 8392332[rbx]	# _152, vm.grayCapacity
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	cmp	eax, ecx	# _19, _152
	jl	.L149	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	cmp	ecx, 7	# _152,
	jle	.L150	#,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	lea	esi, [rcx+rcx]	#,
	mov	rcx, rsi	#,
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	sal	rsi, 3	# _966,
.L85:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	DWORD PTR 8392332[rbx], ecx	# vm.grayCapacity, iftmp.0_153
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	call	"realloc"@PLT	#
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	QWORD PTR 8392336[rbx], rax	# vm.grayStack, _17
# src/memory.c:53:         vm.grayStack = (Obj**) realloc(vm.grayStack, sizeof(Obj*) * vm.grayCapacity);
	mov	rdi, rax	# _17, _17
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	test	rax, rax	# _17
	je	.L44	#,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	movsxd	rax, DWORD PTR 8392328[rbx]	#, vm.grayCount
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	r8d, 1[rax]	# _19,
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	lea	rsi, [rdi+rax*8]	# _22,
	jmp	.L84	#
.L149:
# src/memory.c:51:     if (vm.grayCapacity < vm.grayCount + 1) {
	mov	r8d, edx	# _19, prephitmp_1015
.L84:
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	DWORD PTR 8392328[rbx], r8d	# vm.grayCount, _19
# src/memory.c:58:     vm.grayStack[vm.grayCount++] = object;
	mov	QWORD PTR [rsi], r12	# *prephitmp_978, _148
	jmp	.L82	#
.L276:
	mov	QWORD PTR [rsi], rbp	# *_22, _281
	jmp	.L123	#
.L150:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	esi, 64	# _966,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	ecx, 8	# iftmp.0_153,
	jmp	.L85	#
.L158:
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	esi, 64	# _829,
# src/memory.c:52:         vm.grayCapacity = GROW_CAPACITY(vm.grayCapacity);
	mov	ecx, 8	# iftmp.0_286,
	jmp	.L122	#
.L250:
	.cfi_restore 15
	mov	QWORD PTR 64[rsp], r15	#,
	.cfi_offset 15, -16
.L44:
# src/memory.c:55:         if (vm.grayStack == NULL) exit(1);
	mov	edi, 1	#,
	call	"exit"@PLT	#
	.cfi_endproc
.LFE35:
	.size	"collectGarbage", .-"collectGarbage"
	.p2align 4
	.globl	"reallocate"
	.type	"reallocate", @function
"reallocate":
.LFB26:
	.cfi_startproc
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	mov	rax, rdx	# _2, newSize
# src/memory.c:14: void* reallocate(void* pointer, size_t oldSize, size_t newSize) {
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	rax, rsi	# _2, oldSize
	add	rax, QWORD PTR "vm"[rip+8392296]	# _3, vm.bytesAllocated
	mov	QWORD PTR "vm"[rip+8392296], rax	# vm.bytesAllocated, _3
# src/memory.c:17:     if (newSize > oldSize) {
	cmp	rsi, rdx	# oldSize, newSize
	jnb	.L278	#,
# src/memory.c:22:         if (vm.bytesAllocated > vm.nextGC) {
	cmp	QWORD PTR "vm"[rip+8392304], rax	# vm.nextGC, _3
	jb	.L282	#,
.L279:
# src/memory.c:32:     void* result = realloc(pointer, newSize);
	mov	rsi, rdx	#, newSize
	call	"realloc"@PLT	#
# src/memory.c:33:     if (result == NULL) {
	test	rax, rax	# <retval>
	je	.L283	#,
# src/memory.c:37: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L278:
	.cfi_restore_state
# src/memory.c:27:     if (newSize == 0) {
	test	rdx, rdx	# newSize
	jne	.L279	#,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:29:         return NULL;
	xor	eax, eax	# <retval>
# src/memory.c:37: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L282:
	.cfi_restore_state
	mov	QWORD PTR 8[rsp], rdx	# %sfp, newSize
	mov	QWORD PTR [rsp], rdi	# %sfp, pointer
# src/memory.c:23:             collectGarbage();
	call	"collectGarbage"	#
	mov	rdi, QWORD PTR [rsp]	# pointer, %sfp
	mov	rdx, QWORD PTR 8[rsp]	# newSize, %sfp
	jmp	.L279	#
.L283:
# src/memory.c:34:         exit(1);
	mov	edi, 1	#,
	call	"exit"@PLT	#
	.cfi_endproc
.LFE26:
	.size	"reallocate", .-"reallocate"
	.p2align 4
	.globl	"freeObjects"
	.type	"freeObjects", @function
"freeObjects":
.LFB36:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
	mov	QWORD PTR 8[rsp], rbp	#,
	.cfi_offset 6, -24
# src/memory.c:268:     Obj* object = vm.objects;
	mov	rbp, QWORD PTR "vm"[rip+8392320]	# next, vm.objects
# src/memory.c:269:     while (object != NULL) {
	test	rbp, rbp	# next
	je	.L285	#,
	mov	QWORD PTR [rsp], rbx	#,
	mov	QWORD PTR 16[rsp], r12	#,
	.cfi_offset 3, -32
	.cfi_offset 12, -16
# src/memory.c:140:     switch (object->type) {
	lea	r12, .L288[rip]	# tmp235,
	.p2align 4
	.p2align 3
.L298:
	mov	rbx, rbp	# object, next
# src/memory.c:270:         Obj* next = object->next;
	mov	rbp, QWORD PTR 8[rbp]	# next, object_34->next
# src/memory.c:140:     switch (object->type) {
	cmp	DWORD PTR [rbx], 10	# object_88->type,
	ja	.L286	#,
	mov	eax, DWORD PTR [rbx]	# object_88->type, object_88->type
	movsxd	rax, DWORD PTR [r12+rax*4]	# tmp146,
	add	rax, r12	# tmp147, tmp235
	jmp	rax	# tmp147
	.section	.rodata
	.align 4
	.align 4
.L288:
	.long	.L296-.L288
	.long	.L295-.L288
	.long	.L292-.L288
	.long	.L294-.L288
	.long	.L293-.L288
	.long	.L292-.L288
	.long	.L286-.L288
	.long	.L291-.L288
	.long	.L290-.L288
	.long	.L289-.L288
	.long	.L287-.L288
	.text
	.p2align 4,,10
	.p2align 3
.L292:
# src/memory.c:170:             freeTable(&instance->fields);
	lea	rdi, 24[rbx]	# _20,
	call	"freeTable"@PLT	#
# src/memory.c:28:         free(pointer);
	mov	rdi, rbx	#, object
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], 48	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
	.p2align 4
	.p2align 3
.L286:
# src/memory.c:269:     while (object != NULL) {
	test	rbp, rbp	# next
	jne	.L298	#,
	mov	rbx, QWORD PTR [rsp]	#,
	.cfi_restore 3
	mov	r12, QWORD PTR 16[rsp]	#,
	.cfi_restore 12
.L285:
# src/memory.c:275:     free(vm.grayStack);
	mov	rdi, QWORD PTR "vm"[rip+8392336]	#, vm.grayStack
# src/memory.c:276: }
	mov	rbp, QWORD PTR 8[rsp]	#,
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/memory.c:275:     free(vm.grayStack);
	jmp	"free"@PLT	#
	.p2align 4,,10
	.p2align 3
.L290:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 12, -16
# src/memory.c:179:             if (resource->destroy) {
	mov	rax, QWORD PTR 32[rbx]	# _21, MEM[(struct ObjResource *)object_88].destroy
# src/memory.c:179:             if (resource->destroy) {
	test	rax, rax	# _21
	je	.L287	#,
# src/memory.c:180:                 resource->destroy(resource->handle);
	mov	rdi, QWORD PTR 24[rbx]	# MEM[(struct ObjResource *)object_88].handle, MEM[(struct ObjResource *)object_88].handle
	call	rax	# _21
.L287:
# src/memory.c:28:         free(pointer);
	mov	rdi, rbx	#, object
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], 40	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:193:             break;
	jmp	.L286	#
	.p2align 4,,10
	.p2align 3
.L289:
# src/memory.c:187:             FREE_ARRAY(char, string->chars, string->length + 1);
	mov	eax, DWORD PTR 16[rbx]	# tmp237, MEM[(struct ObjString *)object_88].length
	mov	rdi, QWORD PTR 24[rbx]	# _26, MEM[(struct ObjString *)object_88].chars
	add	eax, 1	# _24,
	cdqe
.L307:
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], rax	# vm.bytesAllocated, _25
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
	mov	rdi, rbx	#, object
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], 40	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:189:             break;
	jmp	.L286	#
	.p2align 4,,10
	.p2align 3
.L295:
# src/memory.c:28:         free(pointer);
	mov	rdi, rbx	#, object
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], 32	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:149:             break;
	jmp	.L286	#
	.p2align 4,,10
	.p2align 3
.L296:
# src/memory.c:143:             FREE_ARRAY(Value, array->values, array->size);
	mov	rdi, QWORD PTR 24[rbx]	# _13, MEM[(struct ObjArray *)object_88].values
	movsxd	rax, DWORD PTR 16[rbx]	# _11, MEM[(struct ObjArray *)object_88].size
	sal	rax, 3	# _12,
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], rax	# vm.bytesAllocated, _12
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
	mov	rdi, rbx	#, object
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], 32	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:145:             break;
	jmp	.L286	#
	.p2align 4,,10
	.p2align 3
.L291:
# src/memory.c:28:         free(pointer);
	mov	rdi, rbx	#, object
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], 24	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:176:             break;
	jmp	.L286	#
	.p2align 4,,10
	.p2align 3
.L293:
# src/memory.c:164:             freeChunk(&function->chunk);
	lea	rdi, 24[rbx]	# _19,
	call	"freeChunk"@PLT	#
# src/memory.c:28:         free(pointer);
	mov	rdi, rbx	#, object
# src/memory.c:15:     vm.bytesAllocated += newSize - oldSize;
	sub	QWORD PTR "vm"[rip+8392296], 80	# vm.bytesAllocated,
# src/memory.c:28:         free(pointer);
	call	"free"@PLT	#
# src/memory.c:166:             break;
	jmp	.L286	#
	.p2align 4,,10
	.p2align 3
.L294:
# src/memory.c:158:             FREE_ARRAY(ObjUpvalue*, closure->upvalues, closure->upvalueCount);
	movsxd	rax, DWORD PTR 32[rbx]	# _16, MEM[(struct ObjClosure *)object_88].upvalueCount
	mov	rdi, QWORD PTR 24[rbx]	# _18, MEM[(struct ObjClosure *)object_88].upvalues
	sal	rax, 3	# _17,
	jmp	.L307	#
	.cfi_endproc
.LFE36:
	.size	"freeObjects", .-"freeObjects"
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
