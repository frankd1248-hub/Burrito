	.file	"object.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.globl	"newArray"
	.type	"newArray", @function
"newArray":
.LFB16:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 32	#,
# src/object.c:27: ObjArray* newArray(int size) {
	mov	ebp, edi	# size, size
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
# src/object.c:27: ObjArray* newArray(int size) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	edi, edi	#
# src/object.c:27: ObjArray* newArray(int size) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	call	"reallocate"@PLT	#
# src/object.c:31:     array->values = ALLOCATE(Value, size);
	movsxd	rdx, ebp	# _1, size
	xor	esi, esi	#
	xor	edi, edi	#
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	rbx, rax	# <retval>,
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 0	# object_18->type,
# src/object.c:31:     array->values = ALLOCATE(Value, size);
	sal	rdx, 3	# _2,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_18->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	rax, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
	mov	QWORD PTR 8[rbx], rax	# object_18->next, vm.objects
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rbx	# vm.objects, <retval>
# src/object.c:29:     array->values = NULL;   // sentinel
	mov	QWORD PTR 24[rbx], 0	# MEM[(struct ObjArray *)object_18].values,
# src/object.c:30:     array->size = 0;
	mov	DWORD PTR 16[rbx], 0	# MEM[(struct ObjArray *)object_18].size,
# src/object.c:31:     array->values = ALLOCATE(Value, size);
	call	"reallocate"@PLT	#
# src/object.c:32:     array->size = size;
	mov	DWORD PTR 16[rbx], ebp	# MEM[(struct ObjArray *)object_18].size, size
# src/object.c:31:     array->values = ALLOCATE(Value, size);
	mov	QWORD PTR 24[rbx], rax	# MEM[(struct ObjArray *)object_18].values, _3
# src/object.c:33:     for (int i = 0; i < size; i++) {
	test	ebp, ebp	# size
	jle	.L1	#,
	mov	rcx, rax	# _3,
	cmp	ebp, 1	# size,
	je	.L5	#,
	mov	edx, ebp	# bnd.23, size
# src/object.c:34:         array->values[i] = NULL_VAL;
	movdqa	xmm0, XMMWORD PTR .LC0[rip]	# tmp125,
	shr	edx	# bnd.23
	mov	edi, edx	# _4, bnd.23
	sal	rdi, 4	# _5,
	lea	rsi, [rax+rdi]	# _17,
	and	edi, 16	# _5,
	je	.L4	#,
	movups	XMMWORD PTR [rax], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_27], tmp125
	lea	rax, 16[rax]	# ivtmp.32,
	cmp	rsi, rax	# _17, ivtmp.32
	je	.L12	#,
	.p2align 4
	.p2align 4
	.p2align 3
.L4:
	movups	XMMWORD PTR [rax], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_27], tmp125
	add	rax, 32	# ivtmp.32,
	movups	XMMWORD PTR -16[rax], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_27], tmp125
	cmp	rsi, rax	# _17, ivtmp.32
	jne	.L4	#,
.L12:
	add	edx, edx	#
	cmp	ebp, edx	# size, niters_vector_mult_vf.24
	je	.L1	#,
.L3:
# src/object.c:34:         array->values[i] = NULL_VAL;
	movabs	rax, 9222246136947933185	# tmp142,
	mov	QWORD PTR [rcx+rdx*8], rax	# *_34, tmp142
.L1:
# src/object.c:37: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	rax, rbx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L5:
	.cfi_restore_state
# src/object.c:33:     for (int i = 0; i < size; i++) {
	xor	edx, edx	#
	jmp	.L3	#
	.cfi_endproc
.LFE16:
	.size	"newArray", .-"newArray"
	.p2align 4
	.globl	"newBoundMethod"
	.type	"newBoundMethod", @function
"newBoundMethod":
.LFB17:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 32	#,
# src/object.c:39: ObjBoundMethod* newBoundMethod(Value receiver, ObjClosure* method) {
	mov	rbp, rdi	# receiver, receiver
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	edi, edi	#
# src/object.c:39: ObjBoundMethod* newBoundMethod(Value receiver, ObjClosure* method) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rsi	# method, method
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
# src/object.c:39: ObjBoundMethod* newBoundMethod(Value receiver, ObjClosure* method) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 1	# object_6->type,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_6->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_6->next, vm.objects
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:41:     bound->receiver = receiver;
	mov	QWORD PTR 16[rax], rbp	# MEM[(struct ObjBoundMethod *)object_6].receiver, receiver
# src/object.c:42:     bound->method = method;
	mov	QWORD PTR 24[rax], rbx	# MEM[(struct ObjBoundMethod *)object_6].method, method
# src/object.c:44: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE17:
	.size	"newBoundMethod", .-"newBoundMethod"
	.p2align 4
	.globl	"newClass"
	.type	"newClass", @function
"newClass":
.LFB18:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 48	#,
# src/object.c:46: ObjClass* newClass(ObjString* name) {
	mov	rbx, rdi	# name, name
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
	xor	edi, edi	#
# src/object.c:46: ObjClass* newClass(ObjString* name) {
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 2	# object_6->type,
# src/object.c:49:     initTable(&class_->methods);
	lea	rdi, 24[rax]	# _1,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_6->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_6->next, vm.objects
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:48:     class_->name = name;
	mov	QWORD PTR 16[rax], rbx	# MEM[(struct ObjClass *)object_6].name, name
# src/object.c:49:     initTable(&class_->methods);
	mov	QWORD PTR 8[rsp], rax	# %sfp, <retval>
	call	"initTable"@PLT	#
# src/object.c:51: }
	mov	rax, QWORD PTR 8[rsp]	# <retval>, %sfp
	add	rsp, 16	#,
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE18:
	.size	"newClass", .-"newClass"
	.p2align 4
	.globl	"newClosure"
	.type	"newClosure", @function
"newClosure":
.LFB19:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 40	#,
# src/object.c:53: ObjClosure* newClosure(ObjFunction* function) {
	mov	rbp, rdi	# function, function
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
# src/object.c:53: ObjClosure* newClosure(ObjFunction* function) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	edi, edi	#
# src/object.c:53: ObjClosure* newClosure(ObjFunction* function) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	call	"reallocate"@PLT	#
# src/object.c:57:     closure->upvalueCount = function->upvalueCount;
	movsxd	rdx, DWORD PTR 20[rbp]	#, function_11(D)->upvalueCount
# src/object.c:60:     ObjUpvalue** upvalues = ALLOCATE(ObjUpvalue*, function->upvalueCount);
	xor	esi, esi	#
	xor	edi, edi	#
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 3	# object_20->type,
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	rbx, rax	# <retval>,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_20->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	rax, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
	mov	QWORD PTR 8[rbx], rax	# object_20->next, vm.objects
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rbx	# vm.objects, <retval>
# src/object.c:57:     closure->upvalueCount = function->upvalueCount;
	mov	DWORD PTR 32[rbx], edx	# MEM[(struct ObjClosure *)object_20].upvalueCount, _1
# src/object.c:60:     ObjUpvalue** upvalues = ALLOCATE(ObjUpvalue*, function->upvalueCount);
	sal	rdx, 3	# _3,
# src/object.c:56:     closure->function = function;
	mov	QWORD PTR 16[rbx], rbp	# MEM[(struct ObjClosure *)object_20].function, function
# src/object.c:58:     closure->upvalues = NULL;   // safe sentinel in case next alloc triggers GC
	mov	QWORD PTR 24[rbx], 0	# MEM[(struct ObjClosure *)object_20].upvalues,
# src/object.c:60:     ObjUpvalue** upvalues = ALLOCATE(ObjUpvalue*, function->upvalueCount);
	call	"reallocate"@PLT	#
# src/object.c:61:     for (int i = 0; i < function->upvalueCount; i++) 
	mov	edx, DWORD PTR 20[rbp]	#, function_11(D)->upvalueCount
# src/object.c:60:     ObjUpvalue** upvalues = ALLOCATE(ObjUpvalue*, function->upvalueCount);
	mov	rcx, rax	# upvalues,
# src/object.c:61:     for (int i = 0; i < function->upvalueCount; i++) 
	test	edx, edx	# _29
	jle	.L20	#,
# src/object.c:62:         upvalues[i] = NULL;
	sal	rdx, 3	# _7,
	xor	esi, esi	#
	mov	rdi, rax	#, upvalues
	call	"memset"@PLT	#
	mov	rcx, rax	# upvalues,
.L20:
# src/object.c:63:     closure->upvalues = upvalues;
	mov	QWORD PTR 24[rbx], rcx	# MEM[(struct ObjClosure *)object_20].upvalues, upvalues
# src/object.c:66: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 24
	mov	rax, rbx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE19:
	.size	"newClosure", .-"newClosure"
	.p2align 4
	.globl	"newFunction"
	.type	"newFunction", @function
"newFunction":
.LFB20:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 80	#,
	xor	esi, esi	#
	xor	edi, edi	#
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 4	# object_7->type,
# src/object.c:73:     initChunk(&function->chunk);
	lea	rdi, 24[rax]	# _1,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_7->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_7->next, vm.objects
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:70:     function->arity = 0;
	mov	QWORD PTR 16[rax], 0	# MEM <vector(2) int> [(int *)object_7 + 16B],
# src/object.c:72:     function->name = NULL;
	mov	QWORD PTR 72[rax], 0	# MEM[(struct ObjFunction *)object_7].name,
# src/object.c:73:     initChunk(&function->chunk);
	mov	QWORD PTR 8[rsp], rax	# %sfp, <retval>
	call	"initChunk"@PLT	#
# src/object.c:75: }
	mov	rax, QWORD PTR 8[rsp]	# <retval>, %sfp
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE20:
	.size	"newFunction", .-"newFunction"
	.p2align 4
	.globl	"newInstance"
	.type	"newInstance", @function
"newInstance":
.LFB21:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 48	#,
# src/object.c:77: ObjInstance* newInstance(ObjClass* class_) {
	mov	rbx, rdi	# class_, class_
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
	xor	edi, edi	#
# src/object.c:77: ObjInstance* newInstance(ObjClass* class_) {
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 5	# object_6->type,
# src/object.c:80:     initTable(&instance->fields);
	lea	rdi, 24[rax]	# _1,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_6->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_6->next, vm.objects
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:79:     instance->class_ = class_;
	mov	QWORD PTR 16[rax], rbx	# MEM[(struct ObjInstance *)object_6].class_, class_
# src/object.c:80:     initTable(&instance->fields);
	mov	QWORD PTR 8[rsp], rax	# %sfp, <retval>
	call	"initTable"@PLT	#
# src/object.c:82: }
	mov	rax, QWORD PTR 8[rsp]	# <retval>, %sfp
	add	rsp, 16	#,
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE21:
	.size	"newInstance", .-"newInstance"
	.p2align 4
	.globl	"newModule"
	.type	"newModule", @function
"newModule":
.LFB22:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 40	#,
	xor	esi, esi	#
	xor	edi, edi	#
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 6	# object_4->type,
# src/object.c:86:     initTable(&module->table);
	lea	rdi, 16[rax]	# _1,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_4->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_4->next, vm.objects
# src/object.c:86:     initTable(&module->table);
	mov	QWORD PTR 8[rsp], rax	# %sfp, <retval>
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:86:     initTable(&module->table);
	call	"initTable"@PLT	#
# src/object.c:88: }
	mov	rax, QWORD PTR 8[rsp]	# <retval>, %sfp
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE22:
	.size	"newModule", .-"newModule"
	.p2align 4
	.globl	"newNative"
	.type	"newNative", @function
"newNative":
.LFB23:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 24	#,
# src/object.c:90: ObjNative* newNative(NativeFn function) {
	mov	rbx, rdi	# function, function
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
	xor	edi, edi	#
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 7	# object_4->type,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_4->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_4->next, vm.objects
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:92:     native->function = function;
	mov	QWORD PTR 16[rax], rbx	# MEM[(struct ObjNative *)object_4].function, function
# src/object.c:94: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE23:
	.size	"newNative", .-"newNative"
	.p2align 4
	.globl	"takeString"
	.type	"takeString", @function
"takeString":
.LFB26:
	.cfi_startproc
	push	r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	r13, rdi	# chars, chars
	push	r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12d, esi	# length, length
	push	rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 48
# src/object.c:109:     for (int i = 0; i < length; i++) {
	test	esi, esi	# length
	jle	.L35	#,
	mov	ecx, esi	# _50, length
	mov	rax, rdi	# ivtmp.68, chars
# src/object.c:108:     uint32_t hash = 2166136261u;
	mov	ebx, -2128831035	# hash,
	add	rcx, rdi	# _48, chars
	.p2align 5
	.p2align 4
	.p2align 3
.L32:
# src/object.c:110:         hash ^= (uint8_t) key[i];
	movzx	edx, BYTE PTR [rax]	# _18, MEM[(const char *)_51]
# src/object.c:109:     for (int i = 0; i < length; i++) {
	add	rax, 1	# ivtmp.68,
# src/object.c:110:         hash ^= (uint8_t) key[i];
	xor	ebx, edx	# hash, _18
# src/object.c:111:         hash *= 16777619;
	imul	ebx, ebx, 16777619	# hash, hash,
# src/object.c:109:     for (int i = 0; i < length; i++) {
	cmp	rcx, rax	# _48, ivtmp.68
	jne	.L32	#,
.L31:
# src/object.c:118:     ObjString* interned = tableFindString(&vm.strings, chars, length, hash);
	mov	ecx, ebx	#, hash
	mov	edx, r12d	#, length
	lea	rdi, "vm"[rip+8390200]	#,
	mov	rsi, r13	#, chars
	call	"tableFindString"@PLT	#
	mov	rbp, rax	# <retval>, <retval>
# src/object.c:120:     if (interned != NULL) {
	test	rax, rax	# <retval>
	je	.L33	#,
# src/object.c:121:         FREE_ARRAY(char, chars, length + 1);
	lea	esi, 1[r12]	# _1,
	mov	rdi, r13	#, chars
	xor	edx, edx	#
	movsxd	rsi, esi	# _2, _1
	call	"reallocate"@PLT	#
# src/object.c:126: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	mov	rax, rbp	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore_state
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
	mov	edx, 40	#,
	xor	edi, edi	#
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:101:     push(OBJ_VAL(string));
	movabs	rdi, -1125899906842624	# tmp125,
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 9	# object_23->type,
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	rbp, rax	# <retval>, <retval>
# src/object.c:101:     push(OBJ_VAL(string));
	or	rdi, rax	# _26, <retval>
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_23->next, vm.objects
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_23->isMarked,
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:98:     string->length = length;
	mov	DWORD PTR 16[rax], r12d	# MEM[(struct ObjString *)object_23].length, length
# src/object.c:99:     string->chars = chars;
	mov	QWORD PTR 24[rax], r13	# MEM[(struct ObjString *)object_23].chars, chars
# src/object.c:100:     string->hash = hash;
	mov	DWORD PTR 32[rax], ebx	# MEM[(struct ObjString *)object_23].hash, hash
# src/object.c:101:     push(OBJ_VAL(string));
	call	"push"@PLT	#
# src/object.c:102:     tableSet(&vm.strings, string, NULL_VAL);
	mov	rsi, rbp	#, <retval>
	lea	rdi, "vm"[rip+8390200]	#,
	movabs	rdx, 9222246136947933185	#,
	call	"tableSet"@PLT	#
# src/object.c:103:     pop();
	call	"pop"@PLT	#
# src/object.c:126: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	mov	rax, rbp	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
# src/object.c:108:     uint32_t hash = 2166136261u;
	mov	ebx, -2128831035	# hash,
	jmp	.L31	#
	.cfi_endproc
.LFE26:
	.size	"takeString", .-"takeString"
	.p2align 4
	.globl	"copyString"
	.type	"copyString", @function
"copyString":
.LFB27:
	.cfi_startproc
	push	r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi	# chars, chars
	push	rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	ebp, esi	# length, length
	push	rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 48
# src/object.c:109:     for (int i = 0; i < length; i++) {
	test	esi, esi	# length
	jle	.L42	#,
	mov	ecx, esi	# _55, length
	mov	rax, rdi	# ivtmp.77, chars
# src/object.c:108:     uint32_t hash = 2166136261u;
	mov	ebx, -2128831035	# hash,
	add	rcx, rdi	# _53, chars
	.p2align 5
	.p2align 4
	.p2align 3
.L40:
# src/object.c:110:         hash ^= (uint8_t) key[i];
	movzx	edx, BYTE PTR [rax]	# _23, MEM[(const char *)_56]
# src/object.c:109:     for (int i = 0; i < length; i++) {
	add	rax, 1	# ivtmp.77,
# src/object.c:110:         hash ^= (uint8_t) key[i];
	xor	edx, ebx	# hash, hash
# src/object.c:111:         hash *= 16777619;
	imul	ebx, edx, 16777619	# hash, hash,
# src/object.c:109:     for (int i = 0; i < length; i++) {
	cmp	rcx, rax	# _53, ivtmp.77
	jne	.L40	#,
.L39:
# src/object.c:130:     ObjString* interned = tableFindString(&vm.strings, chars, length, hash);
	mov	ecx, ebx	#, hash
	mov	edx, ebp	#, length
	lea	rdi, "vm"[rip+8390200]	#,
	mov	rsi, r12	#, chars
	call	"tableFindString"@PLT	#
	mov	rcx, rax	# <retval>, <retval>
# src/object.c:131:     if (interned != NULL) return interned;
	test	rax, rax	# <retval>
	je	.L45	#,
# src/object.c:137: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	mov	rax, rcx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 24
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore_state
# src/object.c:133:     char* heapChars = ALLOCATE(char, length + 1);
	lea	edx, 1[rbp]	# _1,
	xor	esi, esi	#
	xor	edi, edi	#
	movsxd	rdx, edx	# _2, _1
	call	"reallocate"@PLT	#
# src/object.c:134:     memcpy(heapChars, chars, length);
	movsxd	rdx, ebp	# _3, length
	mov	rsi, r12	#, chars
	mov	rdi, rax	#, heapChars
	mov	r12, rax	# heapChars, heapChars
	mov	QWORD PTR 8[rsp], rdx	# %sfp, _3
	call	"memcpy"@PLT	#
# src/object.c:135:     heapChars[length] = '\0';
	mov	rdx, QWORD PTR 8[rsp]	# _3, %sfp
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
	xor	edi, edi	#
# src/object.c:135:     heapChars[length] = '\0';
	mov	BYTE PTR [r12+rdx], 0	# *_4,
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 40	#,
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:101:     push(OBJ_VAL(string));
	movabs	rdi, -1125899906842624	# tmp133,
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 9	# object_28->type,
# src/object.c:101:     push(OBJ_VAL(string));
	or	rdi, rax	# _31, <retval>
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_28->next, vm.objects
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_28->isMarked,
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:98:     string->length = length;
	mov	DWORD PTR 16[rax], ebp	# MEM[(struct ObjString *)object_28].length, length
# src/object.c:99:     string->chars = chars;
	mov	QWORD PTR 24[rax], r12	# MEM[(struct ObjString *)object_28].chars, heapChars
# src/object.c:100:     string->hash = hash;
	mov	DWORD PTR 32[rax], ebx	# MEM[(struct ObjString *)object_28].hash, hash
# src/object.c:101:     push(OBJ_VAL(string));
	mov	QWORD PTR 8[rsp], rax	# %sfp, <retval>
# src/object.c:101:     push(OBJ_VAL(string));
	call	"push"@PLT	#
# src/object.c:102:     tableSet(&vm.strings, string, NULL_VAL);
	mov	rsi, QWORD PTR 8[rsp]	#, %sfp
	movabs	rdx, 9222246136947933185	#,
	lea	rdi, "vm"[rip+8390200]	#,
	call	"tableSet"@PLT	#
# src/object.c:103:     pop();
	call	"pop"@PLT	#
	mov	rcx, QWORD PTR 8[rsp]	# <retval>, %sfp
# src/object.c:137: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx	#
	.cfi_def_cfa_offset 24
	pop	rbp	#
	.cfi_def_cfa_offset 16
	mov	rax, rcx	#, <retval>
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L42:
	.cfi_restore_state
# src/object.c:108:     uint32_t hash = 2166136261u;
	mov	ebx, -2128831035	# hash,
	jmp	.L39	#
	.cfi_endproc
.LFE27:
	.size	"copyString", .-"copyString"
	.p2align 4
	.globl	"newUpvalue"
	.type	"newUpvalue", @function
"newUpvalue":
.LFB28:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 40	#,
# src/object.c:139: ObjUpvalue* newUpvalue(Value* slot) {
	mov	rbx, rdi	# slot, slot
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
	xor	edi, edi	#
	call	"reallocate"@PLT	#
# src/object.c:17:     object->next = vm.objects;
	mov	rdx, QWORD PTR "vm"[rip+8392320]	# vm.objects, vm.objects
# src/object.c:141:     upvalue->closed = NULL_VAL;
	movabs	rcx, 9222246136947933185	# tmp109,
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 10	# object_6->type,
# src/object.c:16:     object->isMarked = false;
	mov	BYTE PTR 4[rax], 0	# object_6->isMarked,
# src/object.c:17:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rdx	# object_6->next, vm.objects
# src/object.c:18:     vm.objects = object;
	mov	QWORD PTR "vm"[rip+8392320], rax	# vm.objects, <retval>
# src/object.c:141:     upvalue->closed = NULL_VAL;
	mov	QWORD PTR 24[rax], rcx	# MEM[(struct ObjUpvalue *)object_6].closed, tmp109
# src/object.c:142:     upvalue->location = slot;
	mov	QWORD PTR 16[rax], rbx	# MEM[(struct ObjUpvalue *)object_6].location, slot
# src/object.c:143:     upvalue->next = NULL;
	mov	QWORD PTR 32[rax], 0	# MEM[(struct ObjUpvalue *)object_6].next,
# src/object.c:145: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE28:
	.size	"newUpvalue", .-"newUpvalue"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Font"
.LC2:
	.string	"Image"
.LC3:
	.string	"Sound"
	.text
	.p2align 4
	.globl	"initLookup"
	.type	"initLookup", @function
"initLookup":
.LFB31:
	.cfi_startproc
# src/object.c:174:     ResourceTypeLookup[0] = "Font";
	movq	xmm0, QWORD PTR .LC4[rip]	# _7,
	lea	rax, .LC2[rip]	# tmp103,
	pinsrq	xmm0, rax, 1	# _7, tmp103
# src/object.c:176:     ResourceTypeLookup[2] = "Sound";
	lea	rax, .LC3[rip]	# tmp109,
	mov	QWORD PTR "ResourceTypeLookup"[rip+16], rax	# ResourceTypeLookup[2], tmp109
# src/object.c:174:     ResourceTypeLookup[0] = "Font";
	movaps	XMMWORD PTR "ResourceTypeLookup"[rip], xmm0	# MEM <vector(2) long unsigned int> [(char * *)&ResourceTypeLookup], _7
# src/object.c:177: }
	ret	
	.cfi_endproc
.LFE31:
	.size	"initLookup", .-"initLookup"
	.section	.rodata.str1.1
.LC5:
	.string	"{ }"
.LC6:
	.string	"{ "
.LC7:
	.string	", "
.LC8:
	.string	" }"
.LC9:
	.string	"<script>"
.LC10:
	.string	"<fn %s>"
.LC11:
	.string	"%s instance"
.LC12:
	.string	"<native module>"
.LC13:
	.string	"<native fn>"
.LC14:
	.string	"<resource %s>"
.LC15:
	.string	"upvalue"
	.text
	.p2align 4
	.globl	"printObject"
	.type	"printObject", @function
"printObject":
.LFB32:
	.cfi_startproc
# src/object.c:182:     switch (OBJ_TYPE(value)) {
	movabs	rax, 1125899906842623	# tmp135,
# src/object.c:179: void printObject(Value value, FILE* f) {
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/object.c:180:     if (f == NULL) f = stdout;
	mov	rbx, rsi	# f, f
# src/object.c:179: void printObject(Value value, FILE* f) {
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/object.c:180:     if (f == NULL) f = stdout;
	test	rsi, rsi	# f
	cmove	rbx, QWORD PTR "stdout"[rip]	# stdout,, f
# src/object.c:182:     switch (OBJ_TYPE(value)) {
	and	rdi, rax	# value, tmp135
# src/object.c:182:     switch (OBJ_TYPE(value)) {
	cmp	DWORD PTR [rdi], 10	# _2->type,
	ja	.L49	#,
	mov	eax, DWORD PTR [rdi]	# _2->type, _2->type
	lea	rdx, .L53[rip]	# tmp137,
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp139,
	add	rax, rdx	# tmp140, tmp137
	jmp	rax	# tmp140
	.section	.rodata
	.align 4
	.align 4
.L53:
	.long	.L63-.L53
	.long	.L62-.L53
	.long	.L61-.L53
	.long	.L60-.L53
	.long	.L59-.L53
	.long	.L58-.L53
	.long	.L57-.L53
	.long	.L56-.L53
	.long	.L55-.L53
	.long	.L54-.L53
	.long	.L52-.L53
	.text
	.p2align 4,,10
	.p2align 3
.L54:
# src/object.c:211:             fprintf(f, "%s", AS_CSTRING(value));
	mov	rdi, QWORD PTR 24[rdi]	# MEM[(struct ObjString *)_2].chars, MEM[(struct ObjString *)_2].chars
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
# src/object.c:211:             fprintf(f, "%s", AS_CSTRING(value));
	mov	rsi, rbx	#, f
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:211:             fprintf(f, "%s", AS_CSTRING(value));
	jmp	"fputs"@PLT	#
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
# src/object.c:214:             fprintf(f, "upvalue");
	mov	rcx, rbx	#, f
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC15[rip]	#,
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:214:             fprintf(f, "upvalue");
	jmp	"fwrite"@PLT	#
	.p2align 4,,10
	.p2align 3
.L63:
	.cfi_restore_state
# src/object.c:148:     if (array->size == 0) {
	mov	eax, DWORD PTR 16[rdi]	#, MEM[(struct ObjArray *)_2].size
	test	eax, eax	#
	je	.L84	#,
	mov	QWORD PTR [rsp], rdi	# %sfp, _2
# src/object.c:153:     fprintf(f, "{ ");
	mov	rcx, rbx	#, f
	mov	edx, 2	#,
	mov	esi, 1	#,
	lea	rdi, .LC6[rip]	#,
	call	"fwrite"@PLT	#
# src/object.c:154:     for (int i = 0; i < array->size - 1; i++) {
	mov	r8, QWORD PTR [rsp]	# _2, %sfp
	movsxd	rax, DWORD PTR 16[r8]	#, MEM[(struct ObjArray *)_2].size
# src/object.c:154:     for (int i = 0; i < array->size - 1; i++) {
	cmp	eax, 1	# _43,
	jle	.L65	#,
	xor	r9d, r9d	# ivtmp.93
	.p2align 4
	.p2align 3
.L66:
# src/object.c:155:         printValue(array->values[i], f);
	mov	rax, QWORD PTR 24[r8]	# MEM[(struct ObjArray *)_2].values, MEM[(struct ObjArray *)_2].values
	mov	rsi, rbx	#, f
	mov	QWORD PTR 8[rsp], r8	# %sfp, _2
	mov	QWORD PTR [rsp], r9	# %sfp, ivtmp.93
	mov	rdi, QWORD PTR [rax+r9*8]	# *_40, *_40
	call	"printValue"@PLT	#
# src/object.c:156:         fprintf(f, ", ");
	mov	edx, 2	#,
	mov	rcx, rbx	#, f
	mov	esi, 1	#,
	lea	rdi, .LC7[rip]	#,
	call	"fwrite"@PLT	#
# src/object.c:154:     for (int i = 0; i < array->size - 1; i++) {
	mov	r8, QWORD PTR 8[rsp]	# _2, %sfp
# src/object.c:154:     for (int i = 0; i < array->size - 1; i++) {
	mov	r9, QWORD PTR [rsp]	# ivtmp.93, %sfp
# src/object.c:154:     for (int i = 0; i < array->size - 1; i++) {
	movsxd	rax, DWORD PTR 16[r8]	#, MEM[(struct ObjArray *)_2].size
# src/object.c:154:     for (int i = 0; i < array->size - 1; i++) {
	add	r9, 1	# ivtmp.93,
# src/object.c:154:     for (int i = 0; i < array->size - 1; i++) {
	lea	edx, -1[rax]	# _44,
# src/object.c:154:     for (int i = 0; i < array->size - 1; i++) {
	cmp	edx, r9d	# _44, ivtmp.93
	jg	.L66	#,
.L65:
# src/object.c:158:     printValue(array->values[array->size - 1], f);
	mov	rdx, QWORD PTR 24[r8]	# MEM[(struct ObjArray *)_2].values, MEM[(struct ObjArray *)_2].values
	mov	rsi, rbx	#, f
	mov	rdi, QWORD PTR -8[rdx+rax*8]	# *_49, *_49
	call	"printValue"@PLT	#
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
# src/object.c:159:     fprintf(f, " }");
	mov	rcx, rbx	#, f
	mov	edx, 2	#,
	mov	esi, 1	#,
	lea	rdi, .LC8[rip]	#,
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:159:     fprintf(f, " }");
	jmp	"fwrite"@PLT	#
	.p2align 4,,10
	.p2align 3
.L62:
	.cfi_restore_state
# src/object.c:187:             printFunction(AS_BOUND_METHOD(value)->method->function, f);
	mov	rax, QWORD PTR 24[rdi]	# MEM[(struct ObjBoundMethod *)_2].method, MEM[(struct ObjBoundMethod *)_2].method
	mov	rax, QWORD PTR 16[rax]	# _4->function, _4->function
	mov	rax, QWORD PTR 72[rax]	# _34,
# src/object.c:163:     if (function->name == NULL) {
	test	rax, rax	# _34
	je	.L83	#,
.L71:
# src/object.c:168:     fprintf(f, "<fn %s>", function->name->chars);
	mov	rdx, QWORD PTR 24[rax]	# _32->chars,
	lea	rsi, .LC10[rip]	#,
.L82:
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
# src/object.c:208:             fprintf(f, "<resource %s>", ResourceTypeLookup[AS_RESOURCE(value)->type]);
	mov	rdi, rbx	#, f
	xor	eax, eax	#
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:208:             fprintf(f, "<resource %s>", ResourceTypeLookup[AS_RESOURCE(value)->type]);
	jmp	"fprintf"@PLT	#
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_restore_state
# src/object.c:199:             fprintf(f, "%s instance", AS_INSTANCE(value)->class_->name->chars);
	mov	rax, QWORD PTR 16[rdi]	# MEM[(struct ObjInstance *)_2].class_, MEM[(struct ObjInstance *)_2].class_
# src/object.c:199:             fprintf(f, "%s instance", AS_INSTANCE(value)->class_->name->chars);
	lea	rsi, .LC11[rip]	#,
	mov	rax, QWORD PTR 16[rax]	# _9->name, _9->name
	mov	rdx, QWORD PTR 24[rax]	# _10->chars, _10->chars
	jmp	.L82	#
	.p2align 4,,10
	.p2align 3
.L60:
	mov	rax, QWORD PTR 16[rdi]	# MEM[(struct ObjClosure *)_2].function, MEM[(struct ObjClosure *)_2].function
	mov	rax, QWORD PTR 72[rax]	# _33,
# src/object.c:163:     if (function->name == NULL) {
	test	rax, rax	# _33
	jne	.L71	#,
.L83:
# src/object.c:164:         if (f == NULL) printf("<script>");
	test	rbx, rbx	# f
	je	.L85	#,
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
# src/object.c:165:         else fprintf(f, "<script>");
	mov	rcx, rbx	#, f
	mov	edx, 8	#,
	mov	esi, 1	#,
	lea	rdi, .LC9[rip]	#,
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:165:         else fprintf(f, "<script>");
	jmp	"fwrite"@PLT	#
	.p2align 4,,10
	.p2align 3
.L59:
	.cfi_restore_state
	mov	rax, QWORD PTR 72[rdi]	# _32, MEM[(struct ObjString * *)_2 + 72B]
# src/object.c:163:     if (function->name == NULL) {
	test	rax, rax	# _32
	jne	.L71	#,
	jmp	.L83	#
	.p2align 4,,10
	.p2align 3
.L61:
# src/object.c:190:             fprintf(f, "%s", AS_CLASS(value)->name->chars);
	mov	rax, QWORD PTR 16[rdi]	# MEM[(struct ObjClass *)_2].name, MEM[(struct ObjClass *)_2].name
	mov	rsi, rbx	#, f
	mov	rdi, QWORD PTR 24[rax]	# _6->chars, _6->chars
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:190:             fprintf(f, "%s", AS_CLASS(value)->name->chars);
	jmp	"fputs"@PLT	#
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_restore_state
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
# src/object.c:205:             fprintf(f, "<native fn>");
	mov	rcx, rbx	#, f
	mov	edx, 11	#,
	mov	esi, 1	#,
	lea	rdi, .LC13[rip]	#,
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:205:             fprintf(f, "<native fn>");
	jmp	"fwrite"@PLT	#
	.p2align 4,,10
	.p2align 3
.L55:
	.cfi_restore_state
# src/object.c:208:             fprintf(f, "<resource %s>", ResourceTypeLookup[AS_RESOURCE(value)->type]);
	mov	edx, DWORD PTR 16[rdi]	# MEM[(struct ObjResource *)_2].type, MEM[(struct ObjResource *)_2].type
	lea	rax, "ResourceTypeLookup"[rip]	# tmp174,
	lea	rsi, .LC14[rip]	#,
	mov	rdx, QWORD PTR [rax+rdx*8]	# ResourceTypeLookup[_12], ResourceTypeLookup[_12]
	jmp	.L82	#
	.p2align 4,,10
	.p2align 3
.L57:
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
# src/object.c:202:             fprintf(f, "<native module>");
	mov	rcx, rbx	#, f
	mov	edx, 15	#,
	mov	esi, 1	#,
	lea	rdi, .LC12[rip]	#,
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:202:             fprintf(f, "<native module>");
	jmp	"fwrite"@PLT	#
.L49:
	.cfi_restore_state
# src/object.c:217: }
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
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
# src/object.c:149:         fprintf(f, "{ }");
	mov	rcx, rbx	#, f
	mov	edx, 3	#,
	mov	esi, 1	#,
	lea	rdi, .LC5[rip]	#,
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:149:         fprintf(f, "{ }");
	jmp	"fwrite"@PLT	#
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
# src/object.c:217: }
	add	rsp, 16	#,
	.cfi_def_cfa_offset 16
# src/object.c:164:         if (f == NULL) printf("<script>");
	lea	rdi, .LC9[rip]	#,
	xor	eax, eax	#
# src/object.c:217: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/object.c:164:         if (f == NULL) printf("<script>");
	jmp	"printf"@PLT	#
	.cfi_endproc
.LFE32:
	.size	"printObject", .-"printObject"
	.local	"ResourceTypeLookup"
	.comm	"ResourceTypeLookup",24,16
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	9222246136947933185
	.quad	9222246136947933185
	.section	.data.rel.ro.local,"aw"
	.align 8
.LC4:
	.quad	.LC1
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
