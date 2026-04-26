	.file	"object.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=48 --param=l1-cache-line-size=64 --param=l2-cache-size=12288 -mtune=arrowlake-s -masm=intel -O3
	.text
	.p2align 4
	.globl	newFunction
	.type	newFunction, @function
newFunction:
.LFB13:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 80	#,
	xor	esi, esi	#
	xor	edi, edi	#
	call	reallocate@PLT	#
# src/object.c:16:     object->next = vm.objects;
	lea	rdx, vm[rip]	# tmp101,
# src/object.c:16:     object->next = vm.objects;
	mov	rcx, QWORD PTR 16778840[rdx]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 0	# object_6->type,
# src/object.c:16:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rcx	# object_6->next, vm.objects
# src/object.c:17:     vm.objects = object;
	mov	QWORD PTR 16778840[rdx], rax	# vm.objects, <retval>
# src/object.c:23:     function->arity = 0;
	mov	DWORD PTR 16[rax], 0	# MEM[(struct ObjFunction *)object_6].arity,
# src/object.c:24:     function->name = NULL;
	mov	QWORD PTR 72[rax], 0	# MEM[(struct ObjFunction *)object_6].name,
# src/object.c:25:     initChunk(&function->chunk);
	lea	rdi, 24[rax]	# _1,
	mov	QWORD PTR 8[rsp], rax	# %sfp, <retval>
	call	initChunk@PLT	#
# src/object.c:27: }
	mov	rax, QWORD PTR 8[rsp]	# <retval>, %sfp
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE13:
	.size	newFunction, .-newFunction
	.p2align 4
	.globl	newModule
	.type	newModule, @function
newModule:
.LFB14:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 40	#,
	xor	esi, esi	#
	xor	edi, edi	#
	call	reallocate@PLT	#
# src/object.c:16:     object->next = vm.objects;
	lea	rdx, vm[rip]	# tmp101,
# src/object.c:16:     object->next = vm.objects;
	mov	rcx, QWORD PTR 16778840[rdx]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 1	# object_4->type,
# src/object.c:16:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rcx	# object_4->next, vm.objects
# src/object.c:31:     initTable(&module->table);
	lea	rdi, 16[rax]	# _1,
	mov	QWORD PTR 8[rsp], rax	# %sfp, <retval>
# src/object.c:17:     vm.objects = object;
	mov	QWORD PTR 16778840[rdx], rax	# vm.objects, <retval>
# src/object.c:31:     initTable(&module->table);
	call	initTable@PLT	#
# src/object.c:33: }
	mov	rax, QWORD PTR 8[rsp]	# <retval>, %sfp
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE14:
	.size	newModule, .-newModule
	.p2align 4
	.globl	newNative
	.type	newNative, @function
newNative:
.LFB15:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	edx, 24	#,
# src/object.c:35: ObjNative* newNative(NativeFn function) {
	mov	rbx, rdi	# function, function
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
	xor	edi, edi	#
	call	reallocate@PLT	#
# src/object.c:16:     object->next = vm.objects;
	lea	rdx, vm[rip]	# tmp101,
# src/object.c:16:     object->next = vm.objects;
	mov	rcx, QWORD PTR 16778840[rdx]	# vm.objects, vm.objects
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 2	# object_4->type,
# src/object.c:16:     object->next = vm.objects;
	mov	QWORD PTR 8[rax], rcx	# object_4->next, vm.objects
# src/object.c:17:     vm.objects = object;
	mov	QWORD PTR 16778840[rdx], rax	# vm.objects, <retval>
# src/object.c:37:     native->function = function;
	mov	QWORD PTR 16[rax], rbx	# MEM[(struct ObjNative *)object_4].function, function
# src/object.c:39: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE15:
	.size	newNative, .-newNative
	.p2align 4
	.globl	takeString
	.type	takeString, @function
takeString:
.LFB18:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	r15	#
	push	r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	mov	r14, rdi	# chars, chars
	push	r13	#
	.cfi_offset 13, -40
	mov	r13d, esi	# length, length
	push	r12	#
	push	rbx	#
	and	rsp, -32	#,
	sub	rsp, 64	#,
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# src/object.c:52:     for (int i = 0; i < length; i++) {
	test	esi, esi	# length
	jle	.L13	#,
	movsxd	rcx, esi	# _48, length
	mov	rax, rdi	# ivtmp.26, chars
	add	rcx, rdi	# _46, chars
# src/object.c:51:     uint32_t hash = 2166136261u;
	mov	ebx, -2128831035	# hash,
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L10:
# src/object.c:53:         hash ^= (uint8_t) key[i];
	movzx	edx, BYTE PTR [rax]	# _18, MEM[(const char *)_49]
# src/object.c:52:     for (int i = 0; i < length; i++) {
	add	rax, 1	# ivtmp.26,
# src/object.c:53:         hash ^= (uint8_t) key[i];
	xor	edx, ebx	# hash, hash
# src/object.c:54:         hash *= 16777619;
	imul	ebx, edx, 16777619	# hash, hash,
# src/object.c:52:     for (int i = 0; i < length; i++) {
	cmp	rcx, rax	# _46, ivtmp.26
	jne	.L10	#,
.L9:
# src/object.c:61:     ObjString* interned = tableFindString(&vm.strings, chars, length, hash);
	lea	r15, vm[rip]	# tmp117,
	lea	rax, 16778808[r15]	# tmp116,
	mov	ecx, ebx	#, hash
	mov	edx, r13d	#, length
	mov	rsi, r14	#, chars
	mov	rdi, rax	#, tmp116
	mov	QWORD PTR 24[rsp], rax	# %sfp, tmp116
	call	tableFindString@PLT	#
# src/object.c:63:     if (interned != NULL) {
	test	rax, rax	# <retval>
# src/object.c:61:     ObjString* interned = tableFindString(&vm.strings, chars, length, hash);
	mov	r12, rax	# <retval>, <retval>
# src/object.c:63:     if (interned != NULL) {
	je	.L11	#,
# src/object.c:64:         FREE_ARRAY(char, chars, length + 1);
	lea	esi, 1[r13]	# _1,
	movsxd	rsi, esi	# _2, _1
	xor	edx, edx	#
	mov	rdi, r14	#, chars
	call	reallocate@PLT	#
.L8:
# src/object.c:69: }
	lea	rsp, -40[rbp]	#,
	pop	rbx	#
	mov	rax, r12	#, <retval>
	pop	r12	#
	pop	r13	#
	pop	r14	#
	pop	r15	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
	xor	edi, edi	#
	mov	edx, 40	#,
	call	reallocate@PLT	#
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 3	# object_23->type,
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	r12, rax	# <retval>, <retval>
# src/object.c:16:     object->next = vm.objects;
	mov	rax, QWORD PTR 16778840[r15]	# vm.objects, vm.objects
# src/object.c:46:     tableSet(&vm.strings, string, NULL_VAL);
	mov	rdi, QWORD PTR 24[rsp]	#, %sfp
# src/object.c:16:     object->next = vm.objects;
	mov	QWORD PTR 8[r12], rax	# object_23->next, vm.objects
# src/object.c:17:     vm.objects = object;
	mov	QWORD PTR 16778840[r15], r12	# vm.objects, <retval>
# src/object.c:43:     string->length = length;
	mov	DWORD PTR 16[r12], r13d	# MEM[(struct ObjString *)object_23].length, length
# src/object.c:44:     string->chars = chars;
	mov	QWORD PTR 24[r12], r14	# MEM[(struct ObjString *)object_23].chars, chars
# src/object.c:45:     string->hash = hash;
	mov	DWORD PTR 32[r12], ebx	# MEM[(struct ObjString *)object_23].hash, hash
# src/object.c:46:     tableSet(&vm.strings, string, NULL_VAL);
	mov	QWORD PTR 32[rsp], 0	#,
	mov	DWORD PTR 40[rsp], 0	#,
# src/object.c:46:     tableSet(&vm.strings, string, NULL_VAL);
	mov	edx, 1	#,
	xor	ecx, ecx	#
	mov	rsi, r12	#, <retval>
	call	tableSet@PLT	#
# src/object.c:68:     return allocateString(chars, length, hash);
	jmp	.L8	#
	.p2align 4,,10
	.p2align 3
.L13:
# src/object.c:51:     uint32_t hash = 2166136261u;
	mov	ebx, -2128831035	# hash,
	jmp	.L9	#
	.cfi_endproc
.LFE18:
	.size	takeString, .-takeString
	.p2align 4
	.globl	copyString
	.type	copyString, @function
copyString:
.LFB19:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	r15	#
	push	r14	#
	push	r13	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	mov	r13, rdi	# chars, chars
	push	r12	#
	.cfi_offset 12, -48
	mov	r12d, esi	# length, length
	push	rbx	#
	and	rsp, -32	#,
	sub	rsp, 64	#,
	.cfi_offset 3, -56
# src/object.c:52:     for (int i = 0; i < length; i++) {
	test	esi, esi	# length
	jle	.L20	#,
	movsxd	rcx, esi	# _53, length
	mov	rax, rdi	# ivtmp.36, chars
	add	rcx, rdi	# _51, chars
# src/object.c:51:     uint32_t hash = 2166136261u;
	mov	ebx, -2128831035	# hash,
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L18:
# src/object.c:53:         hash ^= (uint8_t) key[i];
	movzx	edx, BYTE PTR [rax]	# _23, MEM[(const char *)_54]
# src/object.c:52:     for (int i = 0; i < length; i++) {
	add	rax, 1	# ivtmp.36,
# src/object.c:53:         hash ^= (uint8_t) key[i];
	xor	edx, ebx	# hash, hash
# src/object.c:54:         hash *= 16777619;
	imul	ebx, edx, 16777619	# hash, hash,
# src/object.c:52:     for (int i = 0; i < length; i++) {
	cmp	rcx, rax	# _51, ivtmp.36
	jne	.L18	#,
.L17:
# src/object.c:73:     ObjString* interned = tableFindString(&vm.strings, chars, length, hash);
	lea	r15, vm[rip]	# tmp120,
	mov	rsi, r13	#, chars
	mov	ecx, ebx	#, hash
	mov	edx, r12d	#, length
	lea	rdi, 16778808[r15]	#,
	call	tableFindString@PLT	#
# src/object.c:74:     if (interned != NULL) return interned;
	test	rax, rax	# <retval>
# src/object.c:73:     ObjString* interned = tableFindString(&vm.strings, chars, length, hash);
	mov	rsi, rax	# <retval>, <retval>
# src/object.c:74:     if (interned != NULL) return interned;
	je	.L23	#,
.L16:
# src/object.c:80: }
	lea	rsp, -40[rbp]	#,
	pop	rbx	#
	pop	r12	#
	pop	r13	#
	pop	r14	#
	pop	r15	#
	mov	rax, rsi	#, <retval>
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
# src/object.c:76:     char* heapChars = ALLOCATE(char, length + 1);
	lea	edx, 1[r12]	# _1,
	movsxd	rdx, edx	# _2, _1
	xor	edi, edi	#
	call	reallocate@PLT	#
# src/object.c:77:     memcpy(heapChars, chars, length);
	mov	rdi, rax	#, heapChars
	movsxd	rdx, r12d	# _3, length
	mov	rsi, r13	#, chars
	mov	QWORD PTR 24[rsp], rdx	# %sfp, _3
	mov	r13, rax	# heapChars, heapChars
	call	memcpy@PLT	#
# src/object.c:78:     heapChars[length] = '\0';
	mov	rdx, QWORD PTR 24[rsp]	# _3, %sfp
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	esi, esi	#
# src/object.c:78:     heapChars[length] = '\0';
	mov	BYTE PTR 0[r13+rdx], 0	# *_4,
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	xor	edi, edi	#
	mov	edx, 40	#,
	call	reallocate@PLT	#
# src/object.c:15:     object->type = type;
	mov	DWORD PTR [rax], 3	# object_28->type,
# src/object.c:14:     Obj* object = (Obj*) reallocate(NULL, 0, size);
	mov	rsi, rax	# <retval>, <retval>
# src/object.c:16:     object->next = vm.objects;
	mov	rax, QWORD PTR 16778840[r15]	# vm.objects, vm.objects
# src/object.c:46:     tableSet(&vm.strings, string, NULL_VAL);
	mov	edx, 1	#,
# src/object.c:16:     object->next = vm.objects;
	mov	QWORD PTR 8[rsi], rax	# object_28->next, vm.objects
# src/object.c:17:     vm.objects = object;
	mov	QWORD PTR 16778840[r15], rsi	# vm.objects, <retval>
# src/object.c:43:     string->length = length;
	mov	DWORD PTR 16[rsi], r12d	# MEM[(struct ObjString *)object_28].length, length
# src/object.c:44:     string->chars = chars;
	mov	QWORD PTR 24[rsi], r13	# MEM[(struct ObjString *)object_28].chars, heapChars
# src/object.c:45:     string->hash = hash;
	mov	DWORD PTR 32[rsi], ebx	# MEM[(struct ObjString *)object_28].hash, hash
# src/object.c:46:     tableSet(&vm.strings, string, NULL_VAL);
	mov	QWORD PTR 32[rsp], 0	#,
	mov	DWORD PTR 40[rsp], 0	#,
# src/object.c:46:     tableSet(&vm.strings, string, NULL_VAL);
	xor	ecx, ecx	#
	lea	rdi, 16778808[r15]	#,
	mov	QWORD PTR 24[rsp], rsi	# %sfp, <retval>
	call	tableSet@PLT	#
	mov	rsi, QWORD PTR 24[rsp]	# <retval>, %sfp
# src/object.c:79:     return allocateString(heapChars, length, hash);
	jmp	.L16	#
	.p2align 4,,10
	.p2align 3
.L20:
# src/object.c:51:     uint32_t hash = 2166136261u;
	mov	ebx, -2128831035	# hash,
	jmp	.L17	#
	.cfi_endproc
.LFE19:
	.size	copyString, .-copyString
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"<script>"
.LC1:
	.string	"<fn %s>"
.LC2:
	.string	"<native fn>"
.LC3:
	.string	"%s"
	.text
	.p2align 4
	.globl	printObject
	.type	printObject, @function
printObject:
.LFB21:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/object.c:91:     switch (OBJ_TYPE(value)) {
	mov	eax, DWORD PTR [rsi]	# _1, value$as$obj_8->type
# src/object.c:91:     switch (OBJ_TYPE(value)) {
	cmp	eax, 2	# _1,
	je	.L25	#,
	cmp	eax, 3	# _1,
	je	.L26	#,
	test	eax, eax	# _1
	jne	.L29	#,
	mov	rax, QWORD PTR 72[rsi]	# _9, MEM[(struct ObjString * *)value$as$obj_8 + 72B]
# src/object.c:83:     if (function->name == NULL) {
	test	rax, rax	# _9
	je	.L31	#,
# src/object.c:87:     printf("<fn %s>", function->name->chars);
	mov	rsi, QWORD PTR 24[rax]	# _9->chars, _9->chars
	lea	rdi, .LC1[rip]	#,
	xor	eax, eax	#
# src/object.c:102: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/object.c:87:     printf("<fn %s>", function->name->chars);
	jmp	printf@PLT	#
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_restore_state
# src/object.c:99:             printf("%s", AS_CSTRING(value));
	mov	rsi, QWORD PTR 24[rsi]	# MEM[(struct ObjString *)value$as$obj_8].chars, MEM[(struct ObjString *)value$as$obj_8].chars
	lea	rdi, .LC3[rip]	#,
	xor	eax, eax	#
# src/object.c:102: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/object.c:99:             printf("%s", AS_CSTRING(value));
	jmp	printf@PLT	#
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore_state
# src/object.c:96:             printf("<native fn>");
	lea	rdi, .LC2[rip]	#,
	xor	eax, eax	#
# src/object.c:102: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# src/object.c:96:             printf("<native fn>");
	jmp	printf@PLT	#
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
# src/object.c:102: }
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
# src/object.c:84:         printf("<script>");
	lea	rdi, .LC0[rip]	#,
# src/object.c:102: }
	pop	rbp	#
	.cfi_def_cfa_offset 8
# src/object.c:84:         printf("<script>");
	jmp	printf@PLT	#
	.cfi_endproc
.LFE21:
	.size	printObject, .-printObject
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
