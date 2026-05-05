	.file	"vm.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Stack overflow!"
	.text
	.p2align 4
	.type	"push.part.0", @function
"push.part.0":
.LFB48:
	.cfi_startproc
# src/vm.c:152:         runtimeError("Stack overflow!");
	lea	rdi, .LC0[rip]	#,
# src/vm.c:150: void push(Value value) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/vm.c:152:         runtimeError("Stack overflow!");
	xor	eax, eax	#
	call	"runtimeError"	#
# src/vm.c:153:         exit(1);
	mov	edi, 1	#,
	call	"exit"@PLT	#
	.cfi_endproc
.LFE48:
	.size	"push.part.0", .-"push.part.0"
	.section	.rodata.str1.1
.LC2:
	.string	"%s\n"
.LC3:
	.string	"[line %d] in "
.LC4:
	.string	"script\n"
.LC5:
	.string	"%s()\n"
	.text
	.p2align 4
	.type	"runtimeError", @function
"runtimeError":
.LFB27:
	.cfi_startproc
	sub	rsp, 248	#,
	.cfi_def_cfa_offset 256
	mov	QWORD PTR 216[rsp], rbx	#,
	.cfi_offset 3, -40
	mov	rbx, rdi	# format, format
	mov	QWORD PTR 224[rsp], rbp	#,
	mov	QWORD PTR 232[rsp], r12	#,
	mov	QWORD PTR 40[rsp], rsi	#,
	mov	QWORD PTR 48[rsp], rdx	#,
	mov	QWORD PTR 56[rsp], rcx	#,
	mov	QWORD PTR 64[rsp], r8	#,
	mov	QWORD PTR 72[rsp], r9	#,
	test	al, al	#
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	je	.L5	#,
	movaps	XMMWORD PTR 80[rsp], xmm0	#,
	movaps	XMMWORD PTR 96[rsp], xmm1	#,
	movaps	XMMWORD PTR 112[rsp], xmm2	#,
	movaps	XMMWORD PTR 128[rsp], xmm3	#,
	movaps	XMMWORD PTR 144[rsp], xmm4	#,
	movaps	XMMWORD PTR 160[rsp], xmm5	#,
	movaps	XMMWORD PTR 176[rsp], xmm6	#,
	movaps	XMMWORD PTR 192[rsp], xmm7	#,
.L5:
	mov	rax, QWORD PTR fs:40	# tmp151, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 24[rsp], rax	# D.7892, tmp151
	xor	eax, eax	# tmp151
# src/vm.c:34:     char* errorString = malloc(sizeof(char) * 4096);
	mov	edi, 4096	#,
# src/vm.c:33:     errorWasHandled = false;
	mov	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
# src/vm.c:45:     if (vm.handlerCount > 0) {
	lea	r12, "vm"[rip]	# tmp232,
# src/vm.c:34:     char* errorString = malloc(sizeof(char) * 4096);
	call	"malloc"@PLT	#
# src/vm.c:39:     length += vsnprintf(errorString, 4095, format, args);
	mov	rdx, rbx	#, format
	mov	rcx, rsp	# tmp154,
	mov	esi, 4095	#,
# src/vm.c:34:     char* errorString = malloc(sizeof(char) * 4096);
	mov	rbp, rax	# errorString,
# src/vm.c:38:     va_start(args, format);
	lea	rax, 256[rsp]	# tmp248,
	mov	DWORD PTR [rsp], 8	# MEM[(struct [1] *)&args].gp_offset,
	mov	QWORD PTR 8[rsp], rax	# MEM[(struct [1] *)&args].overflow_arg_area, tmp248
# src/vm.c:39:     length += vsnprintf(errorString, 4095, format, args);
	mov	rdi, rbp	#, errorString
# src/vm.c:38:     va_start(args, format);
	lea	rax, 32[rsp]	# tmp249,
	mov	DWORD PTR 4[rsp], 48	# MEM[(struct [1] *)&args].fp_offset,
	mov	QWORD PTR 16[rsp], rax	# MEM[(struct [1] *)&args].reg_save_area, tmp249
# src/vm.c:39:     length += vsnprintf(errorString, 4095, format, args);
	call	"vsnprintf"@PLT	#
# src/vm.c:41:     if (length >= 4095) length = 4094;
	mov	edx, 4094	# tmp245,
# src/vm.c:45:     if (vm.handlerCount > 0) {
	mov	ebx, DWORD PTR "vm"[rip+8392288]	# _5, vm.handlerCount
# src/vm.c:42:     errorString[length++] = '\n';
	mov	ecx, 10	#,
# src/vm.c:41:     if (length >= 4095) length = 4094;
	cmp	eax, edx	# _41, tmp245
	cmovg	eax, edx	# _41,, _27, tmp245
# src/vm.c:42:     errorString[length++] = '\n';
	movsxd	rdx, eax	# _1, _27
# src/vm.c:42:     errorString[length++] = '\n';
	mov	WORD PTR 0[rbp+rdx], cx	# MEM <vector(2) char> [(char *)_2],
# src/vm.c:45:     if (vm.handlerCount > 0) {
	test	ebx, ebx	# _5
	jle	.L6	#,
# src/vm.c:46:         ErrorHandler* handler = &vm.handlerStack[--vm.handlerCount];
	sub	ebx, 1	#,
# src/vm.c:42:     errorString[length++] = '\n';
	lea	edi, 1[rax]	# length,
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	xor	esi, esi	# vm_openUpvalues_lsm_flag.126
# src/vm.c:49:         vm.frameCount = handler->frameCount;
	lea	rax, 262195[rbx]	# tmp163,
# src/vm.c:46:         ErrorHandler* handler = &vm.handlerStack[--vm.handlerCount];
	mov	DWORD PTR "vm"[rip+8392288], ebx	# vm.handlerCount, _6
# src/vm.c:49:         vm.frameCount = handler->frameCount;
	sal	rax, 5	# tmp164,
	add	rax, r12	# tmp165, tmp232
# src/vm.c:49:         vm.frameCount = handler->frameCount;
	mov	edx, DWORD PTR [rax]	# MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].frameCount, MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].frameCount
# src/vm.c:50:         vm.stackTop   = handler->stackTop;
	mov	rcx, QWORD PTR 8[rax]	# _8, MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].stackTop
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	mov	rax, QWORD PTR "vm"[rip+8390232]	# _69, vm.openUpvalues
# src/vm.c:49:         vm.frameCount = handler->frameCount;
	mov	DWORD PTR "vm"[rip+1536], edx	# vm.frameCount, MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].frameCount
# src/vm.c:50:         vm.stackTop   = handler->stackTop;
	mov	QWORD PTR "vm"[rip+8392312], rcx	# vm.stackTop, _8
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	test	rax, rax	# _69
	je	.L8	#,
	mov	QWORD PTR 240[rsp], r13	#,
	.cfi_offset 13, -16
	jmp	.L7	#
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L9:
# src/vm.c:317:         upvalue->closed = *upvalue->location;
	mov	rdx, QWORD PTR [rdx]	# _66, *_65
	mov	esi, 1	# vm_openUpvalues_lsm_flag.126,
# src/vm.c:317:         upvalue->closed = *upvalue->location;
	mov	QWORD PTR 24[rax], rdx	# _87->closed, _66
# src/vm.c:318:         upvalue->location = &upvalue->closed;
	lea	rdx, 24[rax]	# tmp176,
	mov	QWORD PTR 16[rax], rdx	# _87->location, tmp176
# src/vm.c:319:         vm.openUpvalues = upvalue->next;
	mov	rax, QWORD PTR 32[rax]	# _69, _87->next
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	test	rax, rax	# _69
	je	.L27	#,
# src/vm.c:319:         vm.openUpvalues = upvalue->next;
	mov	r13, rax	# D.7875, _69
.L7:
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	mov	rdx, QWORD PTR 16[rax]	# _65, _87->location
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	cmp	rdx, rcx	# _65, _8
	jnb	.L9	#,
	test	sil, sil	# vm_openUpvalues_lsm_flag.126
	je	.L26	#,
	mov	QWORD PTR "vm"[rip+8390232], r13	# vm.openUpvalues, D.7875
	mov	r13, QWORD PTR 240[rsp]	#,
	.cfi_restore 13
.L8:
# src/vm.c:56:         push(OBJ_VAL(copyString(errorString, length)));
	mov	esi, edi	#, length
	mov	rdi, rbp	#, errorString
	call	"copyString"@PLT	#
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rdx, QWORD PTR "vm"[rip+8392312]	# _63, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, "vm"[rip+8390152]	# tmp180,
	cmp	rdx, rcx	# _63, tmp180
	je	.L28	#,
# src/vm.c:59:         handler->frame->ip = handler->handlerIp;
	sal	rbx, 5	# tmp188,
# src/vm.c:157:     vm.stackTop++;
	add	rdx, 8	# tmp184,
# src/vm.c:60:         free(errorString);
	mov	rdi, rbp	#, errorString
# src/vm.c:56:         push(OBJ_VAL(copyString(errorString, length)));
	movabs	rcx, -1125899906842624	# tmp181,
	or	rax, rcx	# tmp182, tmp181
# src/vm.c:59:         handler->frame->ip = handler->handlerIp;
	add	rbx, r12	# tmp189, tmp232
# src/vm.c:56:         push(OBJ_VAL(copyString(errorString, length)));
	mov	QWORD PTR -8[rdx], rax	# *_63, tmp182
# src/vm.c:59:         handler->frame->ip = handler->handlerIp;
	mov	rax, QWORD PTR 8390264[rbx]	# MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].frame, MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].frame
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR "vm"[rip+8392312], rdx	# vm.stackTop, tmp184
# src/vm.c:59:         handler->frame->ip = handler->handlerIp;
	mov	rdx, QWORD PTR 8390256[rbx]	# MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].handlerIp, MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].handlerIp
	mov	QWORD PTR 8[rax], rdx	# _12->ip, MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_6].handlerIp
# src/vm.c:60:         free(errorString);
	call	"free"@PLT	#
# src/vm.c:61:         errorWasHandled = true;
	mov	BYTE PTR "errorWasHandled"[rip], 1	# errorWasHandled,
.L4:
# src/vm.c:81: }
	mov	rax, QWORD PTR 24[rsp]	# tmp246, D.7892
	sub	rax, QWORD PTR fs:40	# tmp246, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L29	#,
	mov	rbx, QWORD PTR 216[rsp]	#,
	mov	rbp, QWORD PTR 224[rsp]	#,
	mov	r12, QWORD PTR 232[rsp]	#,
	add	rsp, 248	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L27:
	.cfi_def_cfa_offset 256
	.cfi_offset 13, -16
	mov	QWORD PTR "vm"[rip+8390232], 0	# vm.openUpvalues,
	mov	r13, QWORD PTR 240[rsp]	#,
	.cfi_restore 13
	jmp	.L8	#
	.p2align 4,,10
	.p2align 3
.L6:
# src/vm.c:65:     fprintf(stderr, "%s\n", errorString);
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	mov	rdx, rbp	#, errorString
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/vm.c:66:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	mov	eax, DWORD PTR "vm"[rip+1536]	# i, vm.frameCount
	sub	eax, 1	# i,
	js	.L12	#,
	mov	eax, eax	# _44, i
	mov	QWORD PTR 240[rsp], r13	#,
	.cfi_offset 13, -16
	lea	r13, -24[r12]	# _92,
	lea	rax, [rax+rax*2]	# _106,
	lea	rbx, [r12+rax*8]	# ivtmp.135,
	jmp	.L15	#
	.p2align 4,,10
	.p2align 3
.L13:
# src/vm.c:74:             fprintf(stderr, "%s()\n", function->name->chars);
	mov	rdx, QWORD PTR 24[rax]	# _25->chars, _25->chars
	lea	rsi, .LC5[rip]	#,
	xor	eax, eax	#
# src/vm.c:66:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	sub	rbx, 24	# ivtmp.135,
# src/vm.c:74:             fprintf(stderr, "%s()\n", function->name->chars);
	call	"fprintf"@PLT	#
# src/vm.c:66:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	cmp	r13, rbx	# _92, ivtmp.135
	je	.L30	#,
.L15:
# src/vm.c:68:         ObjFunction* function = frame->closure->function;
	mov	rax, QWORD PTR [rbx]	# MEM[(struct ObjClosure * *)_104], MEM[(struct ObjClosure * *)_104]
	mov	r12, QWORD PTR 16[rax]	# function, _16->function
# src/vm.c:69:         size_t instruction = frame->ip - function->chunk.code - 1;
	mov	rax, QWORD PTR 8[rbx]	# MEM[(uint8_t * *)_104 + 8B], MEM[(uint8_t * *)_104 + 8B]
	sub	rax, QWORD PTR 32[r12]	# _19, function_49->chunk.code
# src/vm.c:70:         fprintf(stderr, "[line %d] in ", getLine(&function->chunk, instruction));
	lea	rdi, 24[r12]	# _22,
	lea	esi, -1[rax]	# _20,
	call	"getLine"@PLT	#
# src/vm.c:70:         fprintf(stderr, "[line %d] in ", getLine(&function->chunk, instruction));
	mov	rdi, QWORD PTR "stderr"[rip]	#, stderr
	lea	rsi, .LC3[rip]	#,
	mov	edx, eax	#, _23
	xor	eax, eax	#
	call	"fprintf"@PLT	#
# src/vm.c:71:         if (function->name == NULL) {
	mov	rax, QWORD PTR 72[r12]	# _25, function_49->name
# src/vm.c:72:             fprintf(stderr, "script\n");
	mov	rdi, QWORD PTR "stderr"[rip]	# pretmp_116, stderr
# src/vm.c:71:         if (function->name == NULL) {
	test	rax, rax	# _25
	jne	.L13	#,
# src/vm.c:72:             fprintf(stderr, "script\n");
	mov	rcx, rdi	#, pretmp_116
	mov	edx, 7	#,
	mov	esi, 1	#,
# src/vm.c:66:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	sub	rbx, 24	# ivtmp.135,
# src/vm.c:72:             fprintf(stderr, "script\n");
	lea	rdi, .LC4[rip]	#,
	call	"fwrite"@PLT	#
# src/vm.c:66:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	cmp	r13, rbx	# _92, ivtmp.135
	jne	.L15	#,
.L30:
	mov	r13, QWORD PTR 240[rsp]	#,
	.cfi_restore 13
.L12:
# src/vm.c:78:     free(errorString);
	mov	rdi, rbp	#, errorString
	call	"free"@PLT	#
# src/vm.c:22:     vm.stackTop = vm.stack;
	lea	rax, "vm"[rip+1544]	# tmp251,
# src/vm.c:23:     vm.frameCount = 0;
	mov	DWORD PTR "vm"[rip+1536], 0	# vm.frameCount,
# src/vm.c:22:     vm.stackTop = vm.stack;
	mov	QWORD PTR "vm"[rip+8392312], rax	# vm.stackTop, tmp251
# src/vm.c:24:     vm.openUpvalues = NULL;
	mov	QWORD PTR "vm"[rip+8390232], 0	# vm.openUpvalues,
# src/vm.c:25:     vm.handlerCount = 0;
	mov	DWORD PTR "vm"[rip+8392288], 0	# vm.handlerCount,
# src/vm.c:80:     return;
	jmp	.L4	#
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_offset 13, -16
	mov	r13, QWORD PTR 240[rsp]	#,
	.cfi_restore 13
	jmp	.L8	#
.L29:
	mov	QWORD PTR 240[rsp], r13	#,
	.cfi_remember_state
	.cfi_offset 13, -16
# src/vm.c:81: }
	call	"__stack_chk_fail"@PLT	#
.L28:
	.cfi_restore_state
	mov	QWORD PTR 240[rsp], r13	#,
	.cfi_offset 13, -16
	call	"push.part.0"	#
	.cfi_endproc
.LFE27:
	.size	"runtimeError", .-"runtimeError"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"Expected %d arguments but got %d."
	.section	.rodata.str1.1
.LC7:
	.string	"Call stack overflow."
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Expected 0 arguments but got %d"
	.align 8
.LC9:
	.string	"Can only call functions and classes."
	.text
	.p2align 4
	.type	"callValue", @function
"callValue":
.LFB37:
	.cfi_startproc
	sub	rsp, 56	#,
	.cfi_def_cfa_offset 64
# src/vm.c:188: static bool callValue(Value callee, int argCount) {
	mov	r8d, esi	#, argCount
# src/vm.c:189:     if (IS_OBJ(callee)) {
	mov	rsi, rdi	# _1, callee
	mov	rdx, QWORD PTR fs:40	# tmp177, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 40[rsp], rdx	# D.7919, tmp177
	movabs	rdx, -1125899906842624	# tmp177,
	and	rsi, rdx	# _1, tmp177
# src/vm.c:189:     if (IS_OBJ(callee)) {
	cmp	rsi, rdx	# _1, tmp177
	jne	.L32	#,
# src/vm.c:190:         switch (OBJ_TYPE(callee)) {
	movabs	r9, 1125899906842623	# tmp179,
	mov	rcx, rdi	# callee, callee
	and	rcx, r9	# callee, tmp179
	mov	eax, DWORD PTR [rcx]	# _4, _3->type
# src/vm.c:190:         switch (OBJ_TYPE(callee)) {
	cmp	eax, 3	# _4,
	je	.L33	#,
	ja	.L34	#,
	cmp	eax, 1	# _4,
	je	.L35	#,
	cmp	eax, 2	# _4,
	jne	.L32	#,
# src/vm.c:198:                 vm.stackTop[-argCount-1] = OBJ_VAL(newInstance(class_));
	mov	rdi, rcx	#, _3
	mov	DWORD PTR 8[rsp], r8d	# %sfp, argCount
	mov	QWORD PTR 24[rsp], rsi	# %sfp, _1
	mov	QWORD PTR 16[rsp], rcx	# %sfp, _3
	call	"newInstance"@PLT	#
# src/vm.c:198:                 vm.stackTop[-argCount-1] = OBJ_VAL(newInstance(class_));
	mov	edx, DWORD PTR 8[rsp]	# _15, %sfp
# src/vm.c:198:                 vm.stackTop[-argCount-1] = OBJ_VAL(newInstance(class_));
	or	rax, QWORD PTR 24[rsp]	# tmp217, %sfp
	mov	rsi, QWORD PTR "vm"[rip+8392312]	# vm.stackTop, vm.stackTop
# src/vm.c:200:                 if (tableGet(&class_->methods, vm.initString, &initializer)) {
	mov	rcx, QWORD PTR 16[rsp]	# _3, %sfp
# src/vm.c:198:                 vm.stackTop[-argCount-1] = OBJ_VAL(newInstance(class_));
	neg	edx	# _15
	movsxd	rdx, edx	# _16, _15
# src/vm.c:200:                 if (tableGet(&class_->methods, vm.initString, &initializer)) {
	lea	rdi, 24[rcx]	# _21,
# src/vm.c:198:                 vm.stackTop[-argCount-1] = OBJ_VAL(newInstance(class_));
	mov	QWORD PTR -8[rsi+rdx*8], rax	# *_18, tmp217
# src/vm.c:200:                 if (tableGet(&class_->methods, vm.initString, &initializer)) {
	mov	rsi, QWORD PTR "vm"[rip+8390224]	#, vm.initString
	lea	rdx, 32[rsp]	# tmp218,
	call	"tableGet"@PLT	#
# src/vm.c:200:                 if (tableGet(&class_->methods, vm.initString, &initializer)) {
	mov	r8d, DWORD PTR 8[rsp]	# argCount, %sfp
	movabs	r9, 1125899906842623	# tmp179,
	test	al, al	# <retval>
	jne	.L61	#,
# src/vm.c:204:                     if (errorWasHandled) return true;
	mov	eax, 1	# <retval>,
# src/vm.c:202:                 } else if (argCount != 0) {
	test	r8d, r8d	# argCount
	je	.L31	#,
# src/vm.c:203:                     runtimeError("Expected 0 arguments but got %d", argCount);
	xor	eax, eax	#
	mov	esi, r8d	#, argCount
	lea	rdi, .LC8[rip]	#,
	call	"runtimeError"	#
# src/vm.c:204:                     if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# <retval>, errorWasHandled
	jmp	.L31	#
	.p2align 4,,10
	.p2align 3
.L32:
# src/vm.c:228:     runtimeError("Can only call functions and classes.");
	xor	eax, eax	#
	lea	rdi, .LC9[rip]	#,
	call	"runtimeError"	#
# src/vm.c:229:     if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# <retval>, errorWasHandled
.L31:
# src/vm.c:231: }
	mov	rdx, QWORD PTR 40[rsp]	# tmp329, D.7919
	sub	rdx, QWORD PTR fs:40	# tmp329, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L62	#,
	add	rsp, 56	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore_state
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	rdx, QWORD PTR 16[rcx]	# _100, MEM[(struct ObjClosure *)_3].function
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	esi, DWORD PTR 16[rdx]	# _101, _100->arity
# src/vm.c:170:     if (argCount != closure->function->arity) {
	cmp	r8d, esi	# argCount, _101
	jne	.L60	#,
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rax, DWORD PTR "vm"[rip+1536]	#, vm.frameCount
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	cmp	eax, 64	# _103,
	je	.L59	#,
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	esi, 1[rax]	# tmp267,
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	sal	r8, 3	# _108,
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	mov	DWORD PTR "vm"[rip+1536], esi	# vm.frameCount, tmp267
# src/vm.c:182:     frame->closure = closure;
	lea	rsi, [rax+rax*2]	# tmp273,
	lea	rax, "vm"[rip]	# tmp265,
	lea	rsi, [rax+rsi*8]	# tmp275,
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	rax, QWORD PTR 32[rdx]	# _100->chunk.code, _100->chunk.code
# src/vm.c:182:     frame->closure = closure;
	mov	QWORD PTR [rsi], rcx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_103].closure, _3
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	QWORD PTR 8[rsi], rax	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_103].ip, _100->chunk.code
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	rax, -8	# tmp298,
	sub	rax, r8	# _109, _108
	add	rax, QWORD PTR "vm"[rip+8392312]	# _110, vm.stackTop
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[rsi], rax	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_103].slots, _110
# src/vm.c:185:     return true;
	jmp	.L47	#
	.p2align 4,,10
	.p2align 3
.L35:
# src/vm.c:193:                 vm.stackTop[-argCount-1] = bound->receiver;
	mov	eax, r8d	# _6, argCount
# src/vm.c:193:                 vm.stackTop[-argCount-1] = bound->receiver;
	mov	rdx, QWORD PTR 16[rcx]	# _10, MEM[(struct ObjBoundMethod *)_3].receiver
# src/vm.c:193:                 vm.stackTop[-argCount-1] = bound->receiver;
	mov	r9, QWORD PTR "vm"[rip+8392312]	# _5, vm.stackTop
	lea	r10, "vm"[rip]	# tmp180,
# src/vm.c:193:                 vm.stackTop[-argCount-1] = bound->receiver;
	neg	eax	# _6
	cdqe
# src/vm.c:193:                 vm.stackTop[-argCount-1] = bound->receiver;
	mov	QWORD PTR -8[r9+rax*8], rdx	# *_9, _10
# src/vm.c:194:                 return call(bound->method, argCount);
	mov	rdx, QWORD PTR 24[rcx]	# _11, MEM[(struct ObjBoundMethod *)_3].method
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	rdi, QWORD PTR 16[rdx]	# _76, _11->function
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	esi, DWORD PTR 16[rdi]	# _77, _76->arity
# src/vm.c:170:     if (argCount != closure->function->arity) {
	cmp	r8d, esi	# argCount, _77
	jne	.L60	#,
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rcx, DWORD PTR "vm"[rip+1536]	#, vm.frameCount
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	cmp	ecx, 64	# _79,
	je	.L59	#,
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	eax, 1[rcx]	# tmp188,
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	sal	r8, 3	# _84,
# src/vm.c:182:     frame->closure = closure;
	movq	xmm0, rdx	# _121, _11
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	mov	DWORD PTR "vm"[rip+1536], eax	# vm.frameCount, tmp188
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	rax, r9	# _5, _5
# src/vm.c:182:     frame->closure = closure;
	lea	rdx, [rcx+rcx*2]	# tmp194,
	pinsrq	xmm0, QWORD PTR 32[rdi], 1	# _121, _76->chunk.code
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	sub	rax, r8	# _5, _84
	sub	rax, 8	# tmp210,
# src/vm.c:182:     frame->closure = closure;
	movups	XMMWORD PTR [r10+rdx*8], xmm0	# MEM <vector(2) long unsigned int> [(void *)vectp.145_68], _121
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[r10+rdx*8], rax	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_79].slots, tmp210
.L47:
# src/vm.c:172:         if (errorWasHandled) return true;
	mov	eax, 1	# <retval>,
	jmp	.L31	#
	.p2align 4,,10
	.p2align 3
.L34:
# src/vm.c:190:         switch (OBJ_TYPE(callee)) {
	cmp	eax, 7	# _4,
	jne	.L32	#,
# src/vm.c:214:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	mov	rsi, QWORD PTR "vm"[rip+8392312]	# _31, vm.stackTop
# src/vm.c:214:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	mov	r10d, r8d	# _28, argCount
# src/vm.c:214:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	lea	rdx, 32[rsp]	# tmp305,
	mov	edi, r8d	#, argCount
# src/vm.c:214:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	sal	r10, 3	# _29,
# src/vm.c:214:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	sub	rsi, r10	# _31, _29
	mov	QWORD PTR 8[rsp], r10	# %sfp, _29
	call	[QWORD PTR 16[rcx]]	# MEM[(struct ObjNative *)_3].function
# src/vm.c:216:                     push(result);
	mov	rcx, QWORD PTR 32[rsp]	# pretmp_82, MEM[(long unsigned int *)_99]
# src/vm.c:214:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	movabs	r9, 1125899906842623	# tmp179,
	test	al, al	# <retval>
	je	.L48	#,
# src/vm.c:215:                     vm.stackTop -= argCount + 1;
	mov	rdx, -8	# tmp312,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp315,
# src/vm.c:215:                     vm.stackTop -= argCount + 1;
	sub	rdx, QWORD PTR 8[rsp]	# _34, %sfp
	add	rdx, QWORD PTR "vm"[rip+8392312]	# _35, vm.stackTop
	mov	QWORD PTR "vm"[rip+8392312], rdx	# vm.stackTop, _35
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rsi	# _35, tmp315
	je	.L63	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR [rdx], rcx	# *_35, pretmp_82
# src/vm.c:157:     vm.stackTop++;
	add	rdx, 8	# tmp317,
	mov	QWORD PTR "vm"[rip+8392312], rdx	# vm.stackTop, tmp317
# src/vm.c:217:                     return true;
	jmp	.L31	#
	.p2align 4,,10
	.p2align 3
.L60:
# src/vm.c:171:         runtimeError("Expected %d arguments but got %d.", closure->function->arity, argCount);
	xor	eax, eax	#
	mov	edx, r8d	#, argCount
	lea	rdi, .LC6[rip]	#,
	call	"runtimeError"	#
# src/vm.c:172:         if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# <retval>, errorWasHandled
	jmp	.L31	#
	.p2align 4,,10
	.p2align 3
.L59:
# src/vm.c:177:         runtimeError("Call stack overflow.");
	xor	eax, eax	#
	lea	rdi, .LC7[rip]	#,
	call	"runtimeError"	#
# src/vm.c:173:         return false;
	xor	eax, eax	# <retval>
# src/vm.c:178:         return false;
	jmp	.L31	#
	.p2align 4,,10
	.p2align 3
.L48:
# src/vm.c:219:                     runtimeError(AS_STRING(result)->chars);
	and	rcx, r9	# _38, tmp179
# src/vm.c:219:                     runtimeError(AS_STRING(result)->chars);
	xor	eax, eax	#
	mov	rdi, QWORD PTR 24[rcx]	# _39->chars, _39->chars
	call	"runtimeError"	#
# src/vm.c:220:                     if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# <retval>, errorWasHandled
	jmp	.L31	#
	.p2align 4,,10
	.p2align 3
.L61:
# src/vm.c:201:                     return call(AS_CLOSURE(initializer), argCount);
	and	r9, QWORD PTR 32[rsp]	# _25, MEM[(long unsigned int *)_99]
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	rcx, QWORD PTR 16[r9]	# _88, _25->function
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	esi, DWORD PTR 16[rcx]	# _89, _88->arity
# src/vm.c:170:     if (argCount != closure->function->arity) {
	cmp	r8d, esi	# argCount, _89
	jne	.L60	#,
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rdx, DWORD PTR "vm"[rip+1536]	#, vm.frameCount
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	cmp	edx, 64	# _91,
	je	.L59	#,
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	esi, 1[rdx]	# tmp227,
	mov	DWORD PTR "vm"[rip+1536], esi	# vm.frameCount, tmp227
# src/vm.c:182:     frame->closure = closure;
	lea	rsi, [rdx+rdx*2]	# tmp233,
	lea	rdx, "vm"[rip]	# tmp211,
	lea	rsi, [rdx+rsi*8]	# tmp235,
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	rdx, QWORD PTR 32[rcx]	# _88->chunk.code, _88->chunk.code
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	ecx, r8d	# _95, argCount
	sal	rcx, 3	# _96,
# src/vm.c:182:     frame->closure = closure;
	mov	QWORD PTR [rsi], r9	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_91].closure, _25
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	QWORD PTR 8[rsi], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_91].ip, _88->chunk.code
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	rdx, -8	# tmp258,
	sub	rdx, rcx	# _97, _96
	add	rdx, QWORD PTR "vm"[rip+8392312]	# _98, vm.stackTop
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[rsi], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_91].slots, _98
# src/vm.c:185:     return true;
	jmp	.L31	#
.L62:
# src/vm.c:231: }
	call	"__stack_chk_fail"@PLT	#
.L63:
	call	"push.part.0"	#
	.cfi_endproc
.LFE37:
	.size	"callValue", .-"callValue"
	.section	.rodata.str1.1
.LC10:
	.string	"Only instances have methods."
.LC11:
	.string	"Undefined property '%s'."
	.text
	.p2align 4
	.type	"invoke", @function
"invoke":
.LFB39:
	.cfi_startproc
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	eax, esi	# _47, argCount
# src/vm.c:244: static bool invoke(ObjString* name, int argCount) {
	sub	rsp, 72	#,
	.cfi_def_cfa_offset 80
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR "vm"[rip+8392312]	# vm.stackTop, vm.stackTop
# src/vm.c:244: static bool invoke(ObjString* name, int argCount) {
	mov	r9, QWORD PTR fs:40	# name, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 56[rsp], r9	# D.7950, name
	mov	r9, rdi	# name, name
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	not	eax	# _47
	cdqe
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdi, QWORD PTR [rdx+rax*8]	# _51, *_50
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, -1125899906842624	# tmp153,
	mov	rdx, rdi	# tmp228, _51
	not	rdx	# tmp228
	test	rdx, rax	# tmp228, tmp153
	je	.L81	#,
.L65:
# src/vm.c:260:         runtimeError("Only instances have methods.");
	xor	eax, eax	#
	lea	rdi, .LC10[rip]	#,
	call	"runtimeError"	#
# src/vm.c:261:         if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# <retval>, errorWasHandled
.L64:
# src/vm.c:273: }
	mov	rdx, QWORD PTR 56[rsp]	# tmp229, D.7950
	sub	rdx, QWORD PTR fs:40	# tmp229, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L82	#,
	add	rsp, 72	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	r10, 1125899906842623	# tmp155,
	mov	rcx, rdi	# _51, _51
	and	rcx, r10	# _51, tmp155
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	eax, DWORD PTR [rcx]	# _45, _27->type
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	eax, 5	# _45,
	je	.L83	#,
	cmp	eax, 6	# _45,
	jne	.L65	#,
	mov	DWORD PTR 8[rsp], esi	# %sfp, argCount
# src/vm.c:251:             if (!tableGet(&module->table, name, &value)) {
	lea	rdx, 48[rsp]	# tmp159,
	lea	rdi, 16[rcx]	# _1,
	mov	rsi, r9	#, name
	mov	QWORD PTR 16[rsp], r9	# %sfp, name
	call	"tableGet"@PLT	#
# src/vm.c:251:             if (!tableGet(&module->table, name, &value)) {
	test	al, al	# _2
	jne	.L71	#,
.L80:
# src/vm.c:236:         runtimeError("Undefined property '%s'.", name->chars);
	mov	r9, QWORD PTR 16[rsp]	# name, %sfp
	lea	rdi, .LC11[rip]	#,
	mov	rsi, QWORD PTR 24[r9]	# MEM[(char * *)name_29(D) + 24B],
	call	"runtimeError"	#
# src/vm.c:237:         if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# <retval>, errorWasHandled
	jmp	.L64	#
	.p2align 4,,10
	.p2align 3
.L83:
	mov	DWORD PTR 28[rsp], esi	# %sfp, argCount
# src/vm.c:267:     if (tableGet(&instance->fields, name, &value)) {
	lea	rdi, 24[rcx]	# _12,
	mov	rsi, r9	#, name
	lea	rdx, 40[rsp]	# tmp156,
	mov	QWORD PTR 16[rsp], rcx	# %sfp, _27
	mov	QWORD PTR 8[rsp], r9	# %sfp, name
	call	"tableGet"@PLT	#
# src/vm.c:267:     if (tableGet(&instance->fields, name, &value)) {
	mov	r9, QWORD PTR 8[rsp]	# name, %sfp
	mov	rcx, QWORD PTR 16[rsp]	# _27, %sfp
	test	al, al	# _13
	mov	r8d, DWORD PTR 28[rsp]	# argCount, %sfp
	jne	.L84	#,
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	mov	rdi, QWORD PTR 16[rcx]	# MEM[(struct ObjInstance *)_27].class_, MEM[(struct ObjInstance *)_27].class_
	lea	rdx, 48[rsp]	# tmp173,
	mov	rsi, r9	#, name
	mov	DWORD PTR 8[rsp], r8d	# %sfp, argCount
	mov	QWORD PTR 16[rsp], r9	# %sfp, name
	add	rdi, 24	# _57,
	call	"tableGet"@PLT	#
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	mov	r8d, DWORD PTR 8[rsp]	#, %sfp
	movabs	r10, 1125899906842623	# tmp155,
	test	al, al	# <retval>
	je	.L80	#,
# src/vm.c:241:     return call(AS_CLOSURE(method), argCount);
	and	r10, QWORD PTR 48[rsp]	# _62, MEM[(long unsigned int *)_52]
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	rcx, QWORD PTR 16[r10]	# _69, _62->function
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	esi, DWORD PTR 16[rcx]	# _70, _69->arity
# src/vm.c:170:     if (argCount != closure->function->arity) {
	cmp	r8d, esi	# argCount, _70
	je	.L75	#,
# src/vm.c:171:         runtimeError("Expected %d arguments but got %d.", closure->function->arity, argCount);
	xor	eax, eax	#
	mov	edx, r8d	#, argCount
	lea	rdi, .LC6[rip]	#,
	call	"runtimeError"	#
# src/vm.c:172:         if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# <retval>, errorWasHandled
	jmp	.L64	#
	.p2align 4,,10
	.p2align 3
.L84:
# src/vm.c:268:         vm.stackTop[-argCount - 1] = value;
	mov	eax, r8d	# _15, argCount
# src/vm.c:268:         vm.stackTop[-argCount - 1] = value;
	mov	rdi, QWORD PTR 40[rsp]	# value.89_19, value
	mov	rdx, QWORD PTR "vm"[rip+8392312]	# vm.stackTop, vm.stackTop
# src/vm.c:269:         return callValue(value, argCount);
	mov	esi, r8d	#, argCount
# src/vm.c:268:         vm.stackTop[-argCount - 1] = value;
	neg	eax	# _15
	cdqe
# src/vm.c:268:         vm.stackTop[-argCount - 1] = value;
	mov	QWORD PTR -8[rdx+rax*8], rdi	# *_18, value.89_19
# src/vm.c:269:         return callValue(value, argCount);
	call	"callValue"	#
# src/vm.c:269:         return callValue(value, argCount);
	jmp	.L64	#
	.p2align 4,,10
	.p2align 3
.L71:
# src/vm.c:256:             vm.stackTop[-argCount - 1] = value;
	mov	eax, DWORD PTR 8[rsp]	# _6, %sfp
# src/vm.c:256:             vm.stackTop[-argCount - 1] = value;
	mov	rdi, QWORD PTR 48[rsp]	# value.86_10, MEM[(long unsigned int *)_52]
	mov	rdx, QWORD PTR "vm"[rip+8392312]	# vm.stackTop, vm.stackTop
# src/vm.c:257:             return callValue(value, argCount);
	mov	esi, DWORD PTR 8[rsp]	#, %sfp
# src/vm.c:256:             vm.stackTop[-argCount - 1] = value;
	neg	eax	# _6
	cdqe
# src/vm.c:256:             vm.stackTop[-argCount - 1] = value;
	mov	QWORD PTR -8[rdx+rax*8], rdi	# *_9, value.86_10
# src/vm.c:257:             return callValue(value, argCount);
	call	"callValue"	#
# src/vm.c:257:             return callValue(value, argCount);
	jmp	.L64	#
	.p2align 4,,10
	.p2align 3
.L75:
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rdx, DWORD PTR "vm"[rip+1536]	#, vm.frameCount
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	cmp	edx, 64	# _72,
	je	.L85	#,
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	esi, 1[rdx]	# tmp183,
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	sal	r8, 3	# _77,
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	mov	DWORD PTR "vm"[rip+1536], esi	# vm.frameCount, tmp183
# src/vm.c:182:     frame->closure = closure;
	lea	rsi, [rdx+rdx*2]	# tmp189,
	lea	rdx, "vm"[rip]	# tmp148,
	lea	rsi, [rdx+rsi*8]	# tmp191,
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	rdx, QWORD PTR 32[rcx]	# _69->chunk.code, _69->chunk.code
# src/vm.c:182:     frame->closure = closure;
	mov	QWORD PTR [rsi], r10	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_72].closure, _62
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	QWORD PTR 8[rsi], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_72].ip, _69->chunk.code
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	rdx, -8	# tmp214,
	sub	rdx, r8	# _78, _77
	add	rdx, QWORD PTR "vm"[rip+8392312]	# _79, vm.stackTop
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[rsi], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_72].slots, _79
# src/vm.c:272:     return invokeFromClass(instance->class_, name, argCount);
	jmp	.L64	#
.L85:
# src/vm.c:177:         runtimeError("Call stack overflow.");
	xor	eax, eax	#
	lea	rdi, .LC7[rip]	#,
	call	"runtimeError"	#
# src/vm.c:173:         return false;
	xor	eax, eax	# <retval>
# src/vm.c:178:         return false;
	jmp	.L64	#
.L82:
# src/vm.c:273: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE39:
	.size	"invoke", .-"invoke"
	.section	.rodata.str1.1
.LC12:
	.string	"Undefined variable '%s'."
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"Attempting to assign to constant '%s'."
	.align 8
.LC14:
	.string	"Only modules, instances, and arrays have properties."
	.section	.rodata.str1.1
.LC15:
	.string	"length"
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"Only instances have settable fields."
	.align 8
.LC17:
	.string	"Indexing requires string or array and number."
	.section	.rodata.str1.1
.LC18:
	.string	"String index out of bounds."
.LC19:
	.string	"Array index out of bounds."
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"Setting index requires an array and a number."
	.section	.rodata.str1.1
.LC21:
	.string	"Array index out of range."
.LC22:
	.string	"Array size must be a number."
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"Array size must be non-negative."
	.section	.rodata.str1.1
.LC25:
	.string	"Operands must be numbers."
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"Operands to addition must be two numbers or two strings."
	.align 8
.LC27:
	.string	"Operands to modulus must be two numbers."
	.align 8
.LC29:
	.string	"Operand to bitwise not must be a number."
	.align 8
.LC30:
	.string	"Operand to unary negation must be a number."
	.align 8
.LC32:
	.string	"First argument to print must be a format string."
	.section	.rodata.str1.1
.LC33:
	.string	"Incomplete format specifier."
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"Not enough arguments for format string."
	.section	.rodata.str1.1
.LC35:
	.string	"%%d expects number."
.LC36:
	.string	"%%s expects string."
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"Unknown format specifier '%%%c'."
	.section	.rodata.str1.1
.LC38:
	.string	"Superclass must be a class."
	.text
	.p2align 4
	.type	"run", @function
"run":
.LFB46:
	.cfi_startproc
	push	r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
# src/vm.c:1176:         defineMethod(READ_STRING_LONG());
	movabs	rbp, 1125899906842623	# tmp3974,
# src/vm.c:350: static InterpretResult run() {
	push	rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
# src/vm.c:485:     DISPATCH(); // begin execution — jump to first opcode's handler
	lea	rbx, "dispatchTable.0"[rip]	# tmp3933,
# src/vm.c:350: static InterpretResult run() {
	sub	rsp, 200	#,
	.cfi_def_cfa_offset 256
# src/vm.c:351:     CallFrame* frame = &vm.frames[vm.frameCount - 1];
	mov	eax, DWORD PTR "vm"[rip+1536]	# tmp4177, vm.frameCount
# src/vm.c:351:     CallFrame* frame = &vm.frames[vm.frameCount - 1];
	mov	r15, QWORD PTR fs:40	# tmp3935, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 184[rsp], r15	# D.8136, tmp3935
	lea	r15, "vm"[rip]	# tmp3935,
# src/vm.c:351:     CallFrame* frame = &vm.frames[vm.frameCount - 1];
	sub	eax, 1	# _2,
# src/vm.c:351:     CallFrame* frame = &vm.frames[vm.frameCount - 1];
	cdqe
	lea	rax, [rax+rax*2]	# _1475,
	lea	r14, [r15+rax*8]	# frame,
# src/vm.c:627:         tableSet(&vm.consts, name, BOOL_VAL(true));
	lea	rsi, 8390176[r15]	# tmp3977,
# src/vm.c:485:     DISPATCH(); // begin execution — jump to first opcode's handler
	mov	rax, QWORD PTR 8[r14]	# _3, MEM <struct VM> [(struct CallFrame *)&vm].frames[_2].ip
# src/vm.c:627:         tableSet(&vm.consts, name, BOOL_VAL(true));
	mov	QWORD PTR 32[rsp], rsi	# %sfp, tmp3977
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	r12, 8390152[r15]	# tmp3975,
# src/vm.c:485:     DISPATCH(); // begin execution — jump to first opcode's handler
	lea	rdx, 1[rax]	# tmp1970,
	mov	QWORD PTR 8[r14], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_2].ip, tmp1970
	movzx	eax, BYTE PTR [rax]	# _6, *_3
	mov	rax, QWORD PTR [rbx+rax*8]	# gotovar.72_1411, dispatchTable[_6]
	jmp	rax	# gotovar.72_1411
	.p2align 4,,10
	.p2align 3
.L88:
# src/vm.c:509:         Value constant = READ_CONSTANT();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rdx, QWORD PTR 8[r14]	# _11, frame_1434->ip
	mov	rax, QWORD PTR 16[rax]	# _8->function, _8->function
	mov	rcx, QWORD PTR 64[rax]	# _10, _9->chunk.constants.values
	lea	rax, 1[rdx]	# tmp1977,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp1977
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _1486, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _1486, tmp3975
	je	.L91	#,
# src/vm.c:509:         Value constant = READ_CONSTANT();
	movzx	esi, BYTE PTR [rdx]	# _14, *_11
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp1982,
# src/vm.c:509:         Value constant = READ_CONSTANT();
	mov	rcx, QWORD PTR [rcx+rsi*8]	# constant, *_16
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rcx	# *_1486, constant
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp1982
# src/vm.c:511:         DISPATCH();
	lea	rax, 2[rdx]	# tmp1983,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp1983
	movzx	eax, BYTE PTR 1[rdx]	# _19, MEM[(uint8_t *)_11 + 1B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_19]
	.p2align 4,,10
	.p2align 3
.L333:
# src/vm.c:1176:         defineMethod(READ_STRING_LONG());
	mov	rdx, QWORD PTR 8[r14]	# _1406, frame_1434->ip
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR 8392312[r15]	# _2579, vm.stackTop
# src/vm.c:1176:         defineMethod(READ_STRING_LONG());
	lea	rax, 3[rdx]	# tmp3894,
# src/vm.c:325:     ObjClass* class_ = AS_CLASS(peek(1));
	mov	rdi, QWORD PTR -16[rcx]	# _2582, MEM[(Value *)_2579 + -16B]
# src/vm.c:326:     tableSet(&class_->methods, name, method);
	mov	r8, QWORD PTR -8[rcx]	# MEM[(Value *)_2579 + -8B], MEM[(Value *)_2579 + -8B]
# src/vm.c:1176:         defineMethod(READ_STRING_LONG());
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3894
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:325:     ObjClass* class_ = AS_CLASS(peek(1));
	and	rdi, rbp	# _2582, tmp3974
# src/vm.c:1176:         defineMethod(READ_STRING_LONG());
	mov	rsi, QWORD PTR 16[rax]	# _1408->function, _1408->function
	movzx	eax, BYTE PTR 2[rdx]	# _1420, MEM[(uint8_t *)_1406 + 2B]
# src/vm.c:326:     tableSet(&class_->methods, name, method);
	add	rdi, 24	# _2584,
# src/vm.c:1176:         defineMethod(READ_STRING_LONG());
	movzx	edx, WORD PTR [rdx]	# _1418, MEM <short unsigned int> [(uint8_t *)_1406]
	sal	eax, 16	# _1421,
	or	eax, edx	# _1423, _1418
	mov	rdx, QWORD PTR 64[rsi]	# _1409->chunk.constants.values, _1409->chunk.constants.values
	mov	rsi, QWORD PTR [rdx+rax*8]	# _1427, *_1425
# src/vm.c:326:     tableSet(&class_->methods, name, method);
	mov	rdx, r8	#, MEM[(Value *)_2579 + -8B]
# src/vm.c:1176:         defineMethod(READ_STRING_LONG());
	and	rsi, rbp	# _1427, tmp3974
# src/vm.c:326:     tableSet(&class_->methods, name, method);
	call	"tableSet"@PLT	#
# src/vm.c:1177:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1429, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR 8392312[r15], 8	# vm.stackTop,
# src/vm.c:1177:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3917,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3917
	movzx	eax, BYTE PTR [rax]	# _1432, *_1429
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1432]
	.p2align 4,,10
	.p2align 3
.L332:
# src/vm.c:1173:         defineMethod(READ_STRING());
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rdx, QWORD PTR 8[r14]	# _1392, frame_1434->ip
	mov	rax, QWORD PTR 16[rax]	# _1389->function, _1389->function
	mov	rsi, QWORD PTR 64[rax]	# _1391, _1390->chunk.constants.values
	lea	rax, 1[rdx]	# tmp3874,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3874
	movzx	edx, BYTE PTR [rdx]	# _1395, *_1392
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2571, vm.stackTop
# src/vm.c:1173:         defineMethod(READ_STRING());
	mov	rdi, QWORD PTR [rsi+rdx*8]	# _1399, *_1397
# src/vm.c:326:     tableSet(&class_->methods, name, method);
	mov	rcx, QWORD PTR -8[rax]	# MEM[(Value *)_2571 + -8B], MEM[(Value *)_2571 + -8B]
# src/vm.c:1173:         defineMethod(READ_STRING());
	and	rdi, rbp	# _1399, tmp3974
	mov	rsi, rdi	# _1399, _1399
# src/vm.c:325:     ObjClass* class_ = AS_CLASS(peek(1));
	mov	rdi, QWORD PTR -16[rax]	# _2574, MEM[(Value *)_2571 + -16B]
# src/vm.c:326:     tableSet(&class_->methods, name, method);
	mov	rdx, rcx	#, MEM[(Value *)_2571 + -8B]
# src/vm.c:325:     ObjClass* class_ = AS_CLASS(peek(1));
	and	rdi, rbp	# _2574, tmp3974
# src/vm.c:326:     tableSet(&class_->methods, name, method);
	add	rdi, 24	# _2576,
	call	"tableSet"@PLT	#
# src/vm.c:1174:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1401, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR 8392312[r15], 8	# vm.stackTop,
# src/vm.c:1174:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3889,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3889
	movzx	eax, BYTE PTR [rax]	# _1404, *_1401
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1404]
	.p2align 4,,10
	.p2align 3
.L328:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# _2209, vm.stackTop
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, -1125899906842624	# tmp3848,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR -16[rdx]	# _2210, MEM[(Value *)_2209 + -16B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rsi, rax	# tmp4060, _2210
	not	rsi	# tmp4060
	test	rsi, rcx	# tmp4060, tmp3848
	je	.L543	#,
.L329:
# src/vm.c:1162:             runtimeError("Superclass must be a class.");
	xor	eax, eax	#
	lea	rdi, .LC38[rip]	#,
	call	"runtimeError"	#
# src/vm.c:1163:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:1163:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1376, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3867,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3867
	movzx	eax, BYTE PTR [rax]	# _1379, *_1376
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1379]
	.p2align 4,,10
	.p2align 3
.L327:
# src/vm.c:1155:         push(OBJ_VAL(newClass(READ_STRING_LONG())));
	mov	rdx, QWORD PTR 8[r14]	# _1346, frame_1434->ip
	lea	rax, 3[rdx]	# tmp3823,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3823
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rcx, QWORD PTR 16[rax]	# _1348->function, _1348->function
	movzx	eax, BYTE PTR 2[rdx]	# _1358, MEM[(uint8_t *)_1346 + 2B]
	movzx	edx, WORD PTR [rdx]	# _1356, MEM <short unsigned int> [(uint8_t *)_1346]
	sal	eax, 16	# _1359,
	or	eax, edx	# _1361, _1356
	mov	rdx, QWORD PTR 64[rcx]	# _1349->chunk.constants.values, _1349->chunk.constants.values
	mov	rdi, QWORD PTR [rdx+rax*8]	# _1365, *_1363
	and	rdi, rbp	# _1365, tmp3974
	call	"newClass"@PLT	#
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rdx, QWORD PTR 8392312[r15]	# _2203, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, r12	# _2203, tmp3975
	je	.L91	#,
# src/vm.c:1155:         push(OBJ_VAL(newClass(READ_STRING_LONG())));
	movabs	rcx, -1125899906842624	# tmp3837,
# src/vm.c:157:     vm.stackTop++;
	add	rdx, 8	# tmp3840,
# src/vm.c:1155:         push(OBJ_VAL(newClass(READ_STRING_LONG())));
	or	rax, rcx	# tmp3838, tmp3837
	mov	QWORD PTR -8[rdx], rax	# *_2203, tmp3838
# src/vm.c:1156:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1370, frame_1434->ip
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, tmp3840
# src/vm.c:1156:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3841,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3841
	movzx	eax, BYTE PTR [rax]	# _1373, *_1370
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1373]
	.p2align 4,,10
	.p2align 3
.L326:
# src/vm.c:1152:         push(OBJ_VAL(newClass(READ_STRING())));
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rax, QWORD PTR 16[rax]	# _1326->function, _1326->function
	mov	rdx, QWORD PTR 64[rax]	# _1328, _1327->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _1329, frame_1434->ip
	lea	rcx, 1[rax]	# tmp3808,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, tmp3808
	movzx	eax, BYTE PTR [rax]	# _1332, *_1329
	mov	rdi, QWORD PTR [rdx+rax*8]	# _1336, *_1334
	and	rdi, rbp	# _1336, tmp3974
	call	"newClass"@PLT	#
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rdx, QWORD PTR 8392312[r15]	# _2201, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, r12	# _2201, tmp3975
	je	.L91	#,
# src/vm.c:1152:         push(OBJ_VAL(newClass(READ_STRING())));
	movabs	rcx, -1125899906842624	# tmp3814,
# src/vm.c:157:     vm.stackTop++;
	add	rdx, 8	# tmp3817,
# src/vm.c:1152:         push(OBJ_VAL(newClass(READ_STRING())));
	or	rax, rcx	# tmp3815, tmp3814
	mov	QWORD PTR -8[rdx], rax	# *_2201, tmp3815
# src/vm.c:1153:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1341, frame_1434->ip
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, tmp3817
# src/vm.c:1153:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3818,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3818
	movzx	eax, BYTE PTR [rax]	# _1344, *_1341
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1344]
	.p2align 4,,10
	.p2align 3
.L198:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2028, vm.stackTop
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	movabs	rdx, 9222246136947933184	# tmp2879,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -8[rax]	# _2029, MEM[(Value *)_2028 + -8B]
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	mov	rsi, rcx	# tmp4091, _2029
	not	rsi	# tmp4091
	test	rsi, rdx	# tmp4091, tmp2879
	je	.L199	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -16[rax]	# _2030, MEM[(Value *)_2028 + -16B]
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	mov	rdi, rsi	# tmp4090, _2030
	not	rdi	# tmp4090
	test	rdi, rdx	# tmp4090, tmp2879
	je	.L199	#,
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	movq	xmm5, rsi	# tmp4229, _2030
	movq	xmm6, rcx	# tmp4230, _2029
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _2032,
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	movabs	rdi, 9222246136947933187	# iftmp.49_1448,
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	comisd	xmm5, xmm6	# tmp4229, tmp4230
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2032
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	jbe	.L544	#,
.L201:
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, "vm"[rip+8390152]	# tmp2892,
	cmp	rdx, rcx	# _2032, tmp2892
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -16[rax], rdi	# MEM[(Value *)_2028 + -16B], iftmp.49_1448
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp2894,
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2894
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _806, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2895,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2895
	movzx	eax, BYTE PTR [rax]	# _809, *_806
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_809]
	.p2align 4,,10
	.p2align 3
.L197:
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _2023, vm.stackTop
# src/vm.c:162:     return *vm.stackTop;
	mov	rsi, QWORD PTR -8[rax]	# _2025, MEM[(Value *)_2023 + -8B]
# src/vm.c:878:         push(BOOL_VAL(valuesEqual(a, b)));
	mov	rdi, QWORD PTR -16[rax]	# MEM[(Value *)_2023 + -16B], MEM[(Value *)_2023 + -16B]
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# tmp2863,
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, tmp2863
# src/vm.c:878:         push(BOOL_VAL(valuesEqual(a, b)));
	call	"valuesEqual"@PLT	#
	movzx	edx, al	#,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _2026, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _2026, tmp3975
	je	.L91	#,
# src/vm.c:878:         push(BOOL_VAL(valuesEqual(a, b)));
	movabs	rcx, 9222246136947933186	# tmp2868,
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2871,
# src/vm.c:878:         push(BOOL_VAL(valuesEqual(a, b)));
	add	rdx, rcx	# tmp2869, tmp2868
	mov	QWORD PTR -8[rax], rdx	# *_2026, tmp2869
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2871
# src/vm.c:879:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _793, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2872,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2872
	movzx	eax, BYTE PTR [rax]	# _796, *_793
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_796]
	.p2align 4,,10
	.p2align 3
.L192:
# src/vm.c:866:         int count = READ_LONG();
	mov	rax, QWORD PTR 8[r14]	# _757, frame_1434->ip
	lea	rdx, 3[rax]	# tmp2822,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2822
	movzx	r13d, BYTE PTR [rax]	# _760, *_757
	movzx	edx, BYTE PTR 1[rax]	# _764, MEM[(uint8_t *)_757 + 1B]
	movzx	eax, BYTE PTR 2[rax]	# _768, MEM[(uint8_t *)_757 + 2B]
	sal	r13d, 16	# _761,
	sal	edx, 8	# _765,
# src/vm.c:866:         int count = READ_LONG();
	or	r13d, edx	# _1082, _765
	or	r13d, eax	# count, _768
# src/vm.c:867:         ObjArray* array = newArray(count);
	mov	edi, r13d	#, count
	call	"newArray"@PLT	#
# src/vm.c:870:         vm.stackTop -= count;
	mov	rcx, QWORD PTR 8392312[r15]	# pretmp_2838, vm.stackTop
# src/vm.c:868:         for (int i = count - 1; i >= 0; i--)
	lea	r8d, -1[r13]	# i,
# src/vm.c:867:         ObjArray* array = newArray(count);
	mov	rdi, rax	# array,
	mov	eax, r13d	# _781, count
# src/vm.c:868:         for (int i = count - 1; i >= 0; i--)
	test	r13d, r13d	# count
	je	.L193	#,
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	rsi, QWORD PTR 24[rdi]	# _774, array_1714->values
	cmp	r8d, 2	# i,
	jbe	.L194	#,
	mov	eax, 1	# tmp2832,
	sub	eax, r13d	# _1413, count
	cdqe
	sal	rax, 3	# _1080,
	lea	rdx, [rcx+rax]	# _1298,
	cmp	rsi, rdx	# _774, _1298
	je	.L194	#,
	mov	r9d, r13d	# bnd.179, count
	lea	r10, -8[rcx+rax]	# vectp.183,
	xor	eax, eax	# ivtmp.229
	shr	r9d	# bnd.179
	mov	edx, r9d	# _3027, bnd.179
	sal	rdx, 4	# _3026,
	.p2align 5
	.p2align 4
	.p2align 3
.L195:
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	movdqu	xmm0, XMMWORD PTR [r10+rax]	# MEM <vector(2) long unsigned int> [(Value *)vectp.183_2729 + ivtmp.229_3029 * 1], MEM <vector(2) long unsigned int> [(Value *)vectp.183_2729 + ivtmp.229_3029 * 1]
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	movups	XMMWORD PTR [rsi+rax], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_774 + ivtmp.229_3029 * 1], MEM <vector(2) long unsigned int> [(Value *)vectp.183_2729 + ivtmp.229_3029 * 1]
	add	rax, 16	# ivtmp.229,
	cmp	rdx, rax	# _3026, ivtmp.229
	jne	.L195	#,
	add	r9d, r9d	# niters_vector_mult_vf.180
	mov	eax, r13d	# _781, count
	cmp	r9d, r13d	# niters_vector_mult_vf.180, count
	je	.L193	#,
	sub	r8d, r9d	# tmp.181, niters_vector_mult_vf.180
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	edx, r8d	# _2750, tmp.181
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	sub	r13d, r8d	# _2745, tmp.181
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	not	edx	# _2750
	movsxd	rdx, edx	# _2748, _2750
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	r9, QWORD PTR [rcx+rdx*8]	# _2740, *_2746
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	movsxd	rdx, r13d	# _2744, _2745
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	QWORD PTR -8[rsi+rdx*8], r9	# *_2741, _2740
.L193:
# src/vm.c:870:         vm.stackTop -= count;
	lea	rdx, 0[0+rax*8]	# _782,
	mov	rax, rcx	# pretmp_2838, pretmp_2838
	sub	rax, rdx	# pretmp_2838, _782
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _784
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _784, tmp3975
	je	.L91	#,
# src/vm.c:871:         push(OBJ_VAL(array));
	movabs	rdx, -1125899906842624	# tmp2852,
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2855,
# src/vm.c:871:         push(OBJ_VAL(array));
	or	rdi, rdx	# tmp2853, tmp2852
	mov	QWORD PTR -8[rax], rdi	# *_784, tmp2853
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2855
# src/vm.c:872:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _787, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2856,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2856
	movzx	eax, BYTE PTR [rax]	# _790, *_787
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_790]
	.p2align 4,,10
	.p2align 3
.L187:
# src/vm.c:857:         int count = READ_BYTE();
	mov	rax, QWORD PTR 8[r14]	# _731, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2789,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2789
	movzx	r13d, BYTE PTR [rax]	#, *_731
# src/vm.c:858:         ObjArray* array = newArray(count);
	mov	edi, r13d	#, count
# src/vm.c:857:         int count = READ_BYTE();
	mov	BYTE PTR 8[rsp], r13b	# %sfp, _733
# src/vm.c:858:         ObjArray* array = newArray(count);
	call	"newArray"@PLT	#
# src/vm.c:859:         for (int i = count - 1; i >= 0; i--)
	test	r13d, r13d	# count
# src/vm.c:861:         vm.stackTop -= count;
	mov	rcx, QWORD PTR 8392312[r15]	# pretmp_2837, vm.stackTop
# src/vm.c:859:         for (int i = count - 1; i >= 0; i--)
	movzx	r8d, BYTE PTR 8[rsp]	#, %sfp
# src/vm.c:858:         ObjArray* array = newArray(count);
	mov	r9, rax	# array,
# src/vm.c:859:         for (int i = count - 1; i >= 0; i--)
	lea	r10d, -1[r13]	# i,
# src/vm.c:859:         for (int i = count - 1; i >= 0; i--)
	je	.L188	#,
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	rsi, QWORD PTR 24[rax]	# _739, array_1723->values
	cmp	r10d, 2	# i,
	jbe	.L189	#,
	mov	eax, 1	# tmp2793,
	sub	eax, r13d	# _1297, count
	cdqe
	sal	rax, 3	# _3047,
	lea	rdx, [rcx+rax]	# _3053,
	cmp	rsi, rdx	# _739, _3053
	je	.L189	#,
	mov	r11d, r13d	# bnd.170, count
	lea	rdi, -8[rcx+rax]	# vectp.174,
	xor	eax, eax	# ivtmp.211
	shr	r11d	# bnd.170
	mov	edx, r11d	# _3041, bnd.170
	sal	rdx, 4	# _3040,
	.p2align 5
	.p2align 4
	.p2align 3
.L190:
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	movdqu	xmm0, XMMWORD PTR [rdi+rax]	# MEM <vector(2) long unsigned int> [(Value *)vectp.174_154 + ivtmp.211_3043 * 1], MEM <vector(2) long unsigned int> [(Value *)vectp.174_154 + ivtmp.211_3043 * 1]
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	movups	XMMWORD PTR [rsi+rax], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_739 + ivtmp.211_3043 * 1], MEM <vector(2) long unsigned int> [(Value *)vectp.174_154 + ivtmp.211_3043 * 1]
	add	rax, 16	# ivtmp.211,
	cmp	rdx, rax	# _3040, ivtmp.211
	jne	.L190	#,
	add	r11d, r11d	# niters_vector_mult_vf.171
	cmp	r13d, r11d	# count, niters_vector_mult_vf.171
	je	.L188	#,
	sub	r10d, r11d	# tmp.172, niters_vector_mult_vf.171
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	eax, r10d	# _1129, tmp.172
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	sub	r13d, r10d	# _1180, tmp.172
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	not	eax	# _1129
	cdqe
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	rdx, QWORD PTR [rcx+rax*8]	# _1246, *_1132
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	movsxd	rax, r13d	# _1181, _1180
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	QWORD PTR -8[rsi+rax*8], rdx	# *_1184, _1246
.L188:
# src/vm.c:861:         vm.stackTop -= count;
	lea	rdx, 0[0+r8*8]	# _747,
	mov	rax, rcx	# pretmp_2837, pretmp_2837
	sub	rax, rdx	# pretmp_2837, _747
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _749
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _749, tmp3975
	je	.L91	#,
# src/vm.c:862:         push(OBJ_VAL(array));
	movabs	rdx, -1125899906842624	# tmp2813,
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2816,
# src/vm.c:862:         push(OBJ_VAL(array));
	or	r9, rdx	# tmp2814, tmp2813
	mov	QWORD PTR -8[rax], r9	# *_749, tmp2814
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2816
# src/vm.c:863:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _752, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2817,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2817
	movzx	eax, BYTE PTR [rax]	# _755, *_752
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_755]
	.p2align 4,,10
	.p2align 3
.L181:
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _2013, vm.stackTop
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# tmp2753,
# src/vm.c:162:     return *vm.stackTop;
	mov	rax, QWORD PTR -8[rax]	# _2015, MEM[(Value *)_2013 + -8B]
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, tmp2753
# src/vm.c:838:         if (!IS_NUMBER(sizeVal)) {
	movabs	rdx, 9222246136947933184	# tmp2755,
	mov	rcx, rax	# tmp4092, _2015
	not	rcx	# tmp4092
	test	rcx, rdx	# tmp4092, tmp2755
	je	.L545	#,
# src/vm.c:844:         int size = (int)AS_NUMBER(sizeVal);
	movq	xmm3, rax	# tmp4218, _2015
	cvttsd2si	r13d, xmm3	# size, tmp4218
# src/vm.c:845:         if (size < 0) {
	test	r13d, r13d	# size
	jns	.L183	#,
# src/vm.c:847:             runtimeError("Array size must be non-negative.");
	xor	eax, eax	#
	lea	rdi, .LC23[rip]	#,
	call	"runtimeError"	#
# src/vm.c:848:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:848:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _715, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2764,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2764
	movzx	eax, BYTE PTR [rax]	# _718, *_715
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_718]
	.p2align 4,,10
	.p2align 3
.L180:
# src/vm.c:831:         uint8_t slot = READ_BYTE();
	mov	rax, QWORD PTR 8[r14]	# _694, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2738,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2738
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:832:         *frame->closure->upvalues[slot]->location = peek(0);
	movzx	esi, BYTE PTR [rax]	# _698, *_694
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -8[rdx]	# _2012, MEM[(Value *)_2011 + -8B]
# src/vm.c:832:         *frame->closure->upvalues[slot]->location = peek(0);
	mov	rdx, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:832:         *frame->closure->upvalues[slot]->location = peek(0);
	mov	rdx, QWORD PTR 24[rdx]	# _696->upvalues, _696->upvalues
# src/vm.c:832:         *frame->closure->upvalues[slot]->location = peek(0);
	mov	rdx, QWORD PTR [rdx+rsi*8]	# *_700, *_700
# src/vm.c:832:         *frame->closure->upvalues[slot]->location = peek(0);
	mov	rdx, QWORD PTR 16[rdx]	# _701->location, _701->location
	mov	QWORD PTR [rdx], rcx	# *_702, _2012
# src/vm.c:833:         DISPATCH();
	lea	rdx, 2[rax]	# tmp2746,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2746
	movzx	eax, BYTE PTR 1[rax]	# _705, MEM[(uint8_t *)_694 + 1B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_705]
	.p2align 4,,10
	.p2align 3
.L179:
# src/vm.c:826:         uint8_t slot = READ_BYTE();
	mov	rdx, QWORD PTR 8[r14]	# _680, frame_1434->ip
	lea	rax, 1[rdx]	# tmp2723,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2723
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _2009, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _2009, tmp3975
	je	.L91	#,
# src/vm.c:827:         push(*frame->closure->upvalues[slot]->location);
	mov	rcx, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:827:         push(*frame->closure->upvalues[slot]->location);
	movzx	esi, BYTE PTR [rdx]	# _684, *_680
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2732,
# src/vm.c:827:         push(*frame->closure->upvalues[slot]->location);
	mov	rcx, QWORD PTR 24[rcx]	# _682->upvalues, _682->upvalues
# src/vm.c:827:         push(*frame->closure->upvalues[slot]->location);
	mov	rcx, QWORD PTR [rcx+rsi*8]	# *_686, *_686
# src/vm.c:827:         push(*frame->closure->upvalues[slot]->location);
	mov	rcx, QWORD PTR 16[rcx]	# _687->location, _687->location
	mov	rcx, QWORD PTR [rcx]	# _689, *_688
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rcx	# *_2009, _689
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2732
# src/vm.c:828:         DISPATCH();
	lea	rax, 2[rdx]	# tmp2733,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2733
	movzx	eax, BYTE PTR 1[rdx]	# _692, MEM[(uint8_t *)_680 + 1B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_692]
	.p2align 4,,10
	.p2align 3
.L174:
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _2001, vm.stackTop
# src/vm.c:806:         if (!IS_NUMBER(index) || !IS_ARRAY(array)) {
	movabs	rdx, 9222246136947933184	# tmp2694,
# src/vm.c:162:     return *vm.stackTop;
	mov	r8, QWORD PTR -16[rax]	# _2000, MEM[(Value *)_2001 + -16B]
# src/vm.c:161:     vm.stackTop--;
	lea	rdi, -24[rax]	# _1997,
# src/vm.c:162:     return *vm.stackTop;
	mov	r9, QWORD PTR -8[rax]	# _2003, MEM[(Value *)_2001 + -8B]
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdi	# vm.stackTop, _1997
# src/vm.c:806:         if (!IS_NUMBER(index) || !IS_ARRAY(array)) {
	mov	rcx, r8	# tmp4094, _2000
	not	rcx	# tmp4094
	test	rcx, rdx	# tmp4094, tmp2694
	je	.L175	#,
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, -1125899906842624	# tmp2697,
# src/vm.c:162:     return *vm.stackTop;
	mov	rdx, QWORD PTR -24[rax]	# _1998, MEM[(Value *)_2001 + -24B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rsi, rdx	# tmp4093, _1998
	not	rsi	# tmp4093
	test	rsi, rcx	# tmp4093, tmp2697
	je	.L546	#,
.L175:
# src/vm.c:808:             runtimeError("Setting index requires an array and a number.");
	xor	eax, eax	#
	lea	rdi, .LC20[rip]	#,
	call	"runtimeError"	#
# src/vm.c:809:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:809:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _659, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2701,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2701
	movzx	eax, BYTE PTR [rax]	# _662, *_659
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_662]
	.p2align 4,,10
	.p2align 3
.L166:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR 8392312[r15]	# _1982, vm.stackTop
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, -1125899906842624	# tmp2646,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rcx]	# _1981, MEM[(Value *)_1982 + -16B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r13, rdx	# _1977, _1981
	and	r13, rax	# _1977, tmp2646
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	r13, rax	# _1977, tmp2646
	je	.L547	#,
.L167:
# src/vm.c:772:             runtimeError("Indexing requires string or array and number.");
	xor	eax, eax	#
	lea	rdi, .LC17[rip]	#,
	call	"runtimeError"	#
# src/vm.c:773:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:773:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _620, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2650,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2650
	movzx	eax, BYTE PTR [rax]	# _623, *_620
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_623]
	.p2align 4,,10
	.p2align 3
.L163:
# src/vm.c:761:         ObjString* name = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _591, frame_1434->ip
	lea	rax, 3[rdx]	# tmp2608,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2608
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rcx, QWORD PTR 16[rax]	# _593->function, _593->function
	movzx	eax, BYTE PTR 2[rdx]	# _603, MEM[(uint8_t *)_591 + 2B]
	movzx	edx, WORD PTR [rdx]	# _601, MEM <short unsigned int> [(uint8_t *)_591]
	sal	eax, 16	# _604,
	or	eax, edx	# _606, _601
	mov	rdx, QWORD PTR 64[rcx]	# _594->chunk.constants.values, _594->chunk.constants.values
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_608
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _1974, vm.stackTop
# src/vm.c:762:         ObjClass* superclass = AS_CLASS(pop());
	mov	rdi, QWORD PTR -8[rax]	# _611, MEM[(Value *)_1974 + -8B]
# src/vm.c:761:         ObjString* name = READ_STRING_LONG();
	and	r13, rbp	# name, tmp3974
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# tmp2621,
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, tmp2621
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	mov	rsi, r13	#, name
	lea	rdx, 168[rsp]	# tmp2622,
# src/vm.c:762:         ObjClass* superclass = AS_CLASS(pop());
	and	rdi, rbp	# _611, tmp3974
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	add	rdi, 24	# _2457,
	call	"tableGet"@PLT	#
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	test	al, al	# _2458
	jne	.L164	#,
# src/vm.c:236:         runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# MEM[(char * *)name_1774 + 24B], MEM[(char * *)name_1774 + 24B]
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:763:         if (!bindMethod(superclass, name)) return INTERPRET_RUNTIME_ERROR;
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
.L165:
# src/vm.c:764:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _613, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2639,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2639
	movzx	eax, BYTE PTR [rax]	# _616, *_613
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_616]
	.p2align 4,,10
	.p2align 3
.L150:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# _1953, vm.stackTop
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, -1125899906842624	# tmp2518,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR -16[rdx]	# _1954, MEM[(Value *)_1953 + -16B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rsi, rax	# tmp4096, _1954
	not	rsi	# tmp4096
	test	rsi, rcx	# tmp4096, tmp2518
	je	.L548	#,
.L151:
# src/vm.c:728:             runtimeError("Only instances have settable fields.");
	xor	eax, eax	#
	lea	rdi, .LC16[rip]	#,
	call	"runtimeError"	#
# src/vm.c:729:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:729:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _517, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2532,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2532
	movzx	eax, BYTE PTR [rax]	# _520, *_517
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_520]
	.p2align 4,,10
	.p2align 3
.L160:
# src/vm.c:755:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rax, QWORD PTR 16[rax]	# _573->function, _573->function
	mov	rdx, QWORD PTR 64[rax]	# _575, _574->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _576, frame_1434->ip
	lea	rcx, 1[rax]	# tmp2580,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, tmp2580
	movzx	eax, BYTE PTR [rax]	# _579, *_576
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_581
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _1971, vm.stackTop
# src/vm.c:756:         ObjClass* superclass = AS_CLASS(pop());
	mov	rdi, QWORD PTR -8[rax]	# _584, MEM[(Value *)_1971 + -8B]
# src/vm.c:755:         ObjString* name = READ_STRING();
	and	r13, rbp	# name, tmp3974
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# tmp2585,
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, tmp2585
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	mov	rsi, r13	#, name
	lea	rdx, 160[rsp]	# tmp2586,
# src/vm.c:756:         ObjClass* superclass = AS_CLASS(pop());
	and	rdi, rbp	# _584, tmp3974
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	add	rdi, 24	# _2439,
	call	"tableGet"@PLT	#
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	test	al, al	# _2440
	jne	.L161	#,
# src/vm.c:236:         runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# MEM[(char * *)name_1779 + 24B], MEM[(char * *)name_1779 + 24B]
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:757:         if (!bindMethod(superclass, name)) return INTERPRET_RUNTIME_ERROR;
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
.L162:
# src/vm.c:758:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _586, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2603,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2603
	movzx	eax, BYTE PTR [rax]	# _589, *_586
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_589]
	.p2align 4,,10
	.p2align 3
.L120:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	r13, QWORD PTR 8392312[r15]	# _1783, vm.stackTop
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, -1125899906842624	# tmp2330,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[r13]	# _1789, MEM[(Value *)_1783 + -8B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r8, rdx	# _1761, _1789
	and	r8, rax	# _1761, tmp2330
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	r8, rax	# _1761, tmp2330
	je	.L549	#,
.L121:
# src/vm.c:672:             runtimeError("Only modules, instances, and arrays have properties.");
	xor	eax, eax	#
	lea	rdi, .LC14[rip]	#,
	call	"runtimeError"	#
# src/vm.c:673:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:673:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _403, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2403,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2403
	movzx	eax, BYTE PTR [rax]	# _406, *_403
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_406]
	.p2align 4,,10
	.p2align 3
.L155:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# _1964, vm.stackTop
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, -1125899906842624	# tmp2546,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR -16[rdx]	# _1965, MEM[(Value *)_1964 + -16B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rsi, rax	# tmp4095, _1965
	not	rsi	# tmp4095
	test	rsi, rcx	# tmp4095, tmp2546
	je	.L550	#,
.L156:
# src/vm.c:742:             runtimeError("Only instances have settable fields.");
	xor	eax, eax	#
	lea	rdi, .LC16[rip]	#,
	call	"runtimeError"	#
# src/vm.c:743:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:743:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _541, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2566,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2566
	movzx	eax, BYTE PTR [rax]	# _544, *_541
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_544]
	.p2align 4,,10
	.p2align 3
.L135:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	r13, QWORD PTR 8392312[r15]	# _1935, vm.stackTop
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, -1125899906842624	# tmp2415,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[r13]	# _1936, MEM[(Value *)_1935 + -8B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r8, rdx	# _1931, _1936
	and	r8, rax	# _1931, tmp2415
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	r8, rax	# _1931, tmp2415
	je	.L551	#,
.L136:
# src/vm.c:718:             runtimeError("Only modules, instances, and arrays have properties.");
	xor	eax, eax	#
	lea	rdi, .LC14[rip]	#,
	call	"runtimeError"	#
# src/vm.c:719:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:719:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _506, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2506,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2506
	movzx	eax, BYTE PTR [rax]	# _509, *_506
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_509]
	.p2align 4,,10
	.p2align 3
.L119:
# src/vm.c:625:         ObjString* name = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _312, frame_1434->ip
# src/vm.c:626:         tableSet(&vm.globals, name, peek(0));
	mov	rdi, r12	#, tmp3975
# src/vm.c:625:         ObjString* name = READ_STRING_LONG();
	lea	rax, 3[rdx]	# tmp2300,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2300
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rcx, QWORD PTR 16[rax]	# _314->function, _314->function
	movzx	eax, BYTE PTR 2[rdx]	# _324, MEM[(uint8_t *)_312 + 2B]
	movzx	edx, WORD PTR [rdx]	# _322, MEM <short unsigned int> [(uint8_t *)_312]
	sal	eax, 16	# _325,
	or	eax, edx	# _327, _322
	mov	rdx, QWORD PTR 64[rcx]	# _315->chunk.constants.values, _315->chunk.constants.values
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_329
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:625:         ObjString* name = READ_STRING_LONG();
	and	r13, rbp	# name, tmp3974
# src/vm.c:626:         tableSet(&vm.globals, name, peek(0));
	mov	rdx, QWORD PTR -8[rax]	# MEM[(Value *)_1703 + -8B], MEM[(Value *)_1703 + -8B]
	mov	rsi, r13	#, name
	call	"tableSet"@PLT	#
# src/vm.c:627:         tableSet(&vm.consts, name, BOOL_VAL(true));
	mov	rdi, QWORD PTR 32[rsp]	#, %sfp
	mov	rsi, r13	#, name
	movabs	rdx, 9222246136947933187	#,
	call	"tableSet"@PLT	#
# src/vm.c:629:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _332, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR 8392312[r15], 8	# vm.stackTop,
# src/vm.c:629:         DISPATCH();
	lea	rdx, 1[rax]	# tmp2323,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2323
	movzx	eax, BYTE PTR [rax]	# _335, *_332
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_335]
	.p2align 4,,10
	.p2align 3
.L118:
# src/vm.c:618:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:619:         tableSet(&vm.globals, name, peek(0));
	mov	rdi, r12	#, tmp3975
# src/vm.c:618:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR 16[rax]	# _296->function, _296->function
	mov	rdx, QWORD PTR 64[rax]	# _298, _297->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _299, frame_1434->ip
	lea	rcx, 1[rax]	# tmp2280,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, tmp2280
	movzx	eax, BYTE PTR [rax]	# _302, *_299
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_304
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:618:         ObjString* name = READ_STRING();
	and	r13, rbp	# name, tmp3974
# src/vm.c:619:         tableSet(&vm.globals, name, peek(0));
	mov	rdx, QWORD PTR -8[rax]	# MEM[(Value *)_1691 + -8B], MEM[(Value *)_1691 + -8B]
	mov	rsi, r13	#, name
	call	"tableSet"@PLT	#
# src/vm.c:620:         tableSet(&vm.consts, name, BOOL_VAL(true));
	mov	rdi, QWORD PTR 32[rsp]	#, %sfp
	mov	rsi, r13	#, name
	movabs	rdx, 9222246136947933187	#,
	call	"tableSet"@PLT	#
# src/vm.c:622:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _307, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR 8392312[r15], 8	# vm.stackTop,
# src/vm.c:622:         DISPATCH();
	lea	rdx, 1[rax]	# tmp2295,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2295
	movzx	eax, BYTE PTR [rax]	# _310, *_307
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_310]
	.p2align 4,,10
	.p2align 3
.L114:
# src/vm.c:599:         ObjString* name = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _255, frame_1434->ip
# src/vm.c:601:         if (tableGet(&vm.consts, name, &isConst)) {
	lea	rdi, "vm"[rip+8390176]	#,
# src/vm.c:599:         ObjString* name = READ_STRING_LONG();
	lea	rax, 3[rdx]	# tmp2240,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2240
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rcx, QWORD PTR 16[rax]	# _257->function, _257->function
	movzx	eax, BYTE PTR 2[rdx]	# _267, MEM[(uint8_t *)_255 + 2B]
	movzx	edx, WORD PTR [rdx]	# _265, MEM <short unsigned int> [(uint8_t *)_255]
	sal	eax, 16	# _268,
	or	eax, edx	# _270, _265
	mov	rdx, QWORD PTR 64[rcx]	# _258->chunk.constants.values, _258->chunk.constants.values
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_272
# src/vm.c:601:         if (tableGet(&vm.consts, name, &isConst)) {
	lea	rdx, 96[rsp]	# tmp2251,
# src/vm.c:599:         ObjString* name = READ_STRING_LONG();
	and	r13, rbp	# name, tmp3974
# src/vm.c:601:         if (tableGet(&vm.consts, name, &isConst)) {
	mov	rsi, r13	#, name
	call	"tableGet"@PLT	#
# src/vm.c:601:         if (tableGet(&vm.consts, name, &isConst)) {
	test	al, al	# _275
	je	.L115	#,
# src/vm.c:603:             runtimeError("Attempting to assign to constant '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1855->chars, name_1855->chars
	xor	eax, eax	#
	lea	rdi, .LC13[rip]	#,
	call	"runtimeError"	#
# src/vm.c:604:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:604:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _278, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2255,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2255
	movzx	eax, BYTE PTR [rax]	# _281, *_278
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_281]
	.p2align 4,,10
	.p2align 3
.L110:
# src/vm.c:580:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:582:         if (tableGet(&vm.consts, name, &isConst)) {
	lea	rdi, "vm"[rip+8390176]	#,
# src/vm.c:580:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR 16[rax]	# _223->function, _223->function
	mov	rdx, QWORD PTR 64[rax]	# _225, _224->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _226, frame_1434->ip
	lea	rcx, 1[rax]	# tmp2210,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, tmp2210
	movzx	eax, BYTE PTR [rax]	# _229, *_226
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_231
# src/vm.c:582:         if (tableGet(&vm.consts, name, &isConst)) {
	lea	rdx, 80[rsp]	# tmp2213,
# src/vm.c:580:         ObjString* name = READ_STRING();
	and	r13, rbp	# name, tmp3974
# src/vm.c:582:         if (tableGet(&vm.consts, name, &isConst)) {
	mov	rsi, r13	#, name
	call	"tableGet"@PLT	#
# src/vm.c:582:         if (tableGet(&vm.consts, name, &isConst)) {
	test	al, al	# _234
	je	.L111	#,
# src/vm.c:584:             runtimeError("Attempting to assign to constant '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1867->chars, name_1867->chars
	xor	eax, eax	#
	lea	rdi, .LC13[rip]	#,
	call	"runtimeError"	#
# src/vm.c:585:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:585:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _237, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2217,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2217
	movzx	eax, BYTE PTR [rax]	# _240, *_237
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_240]
	.p2align 4,,10
	.p2align 3
.L109:
# src/vm.c:574:         ObjString* name = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _198, frame_1434->ip
# src/vm.c:575:         tableSet(&vm.globals, name, peek(0));
	mov	rdi, r12	#, tmp3975
# src/vm.c:574:         ObjString* name = READ_STRING_LONG();
	lea	rax, 3[rdx]	# tmp2181,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2181
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:575:         tableSet(&vm.globals, name, peek(0));
	mov	rcx, QWORD PTR -8[rax]	# MEM[(Value *)_1677 + -8B], MEM[(Value *)_1677 + -8B]
# src/vm.c:574:         ObjString* name = READ_STRING_LONG();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rsi, QWORD PTR 16[rax]	# _200->function, _200->function
	movzx	eax, BYTE PTR 2[rdx]	# _210, MEM[(uint8_t *)_198 + 2B]
	movzx	edx, WORD PTR [rdx]	# _208, MEM <short unsigned int> [(uint8_t *)_198]
	sal	eax, 16	# _211,
	or	eax, edx	# _213, _208
	mov	rdx, QWORD PTR 64[rsi]	# _201->chunk.constants.values, _201->chunk.constants.values
	mov	rsi, QWORD PTR [rdx+rax*8]	# _217, *_215
# src/vm.c:575:         tableSet(&vm.globals, name, peek(0));
	mov	rdx, rcx	#, MEM[(Value *)_1677 + -8B]
# src/vm.c:574:         ObjString* name = READ_STRING_LONG();
	and	rsi, rbp	# _217, tmp3974
# src/vm.c:575:         tableSet(&vm.globals, name, peek(0));
	call	"tableSet"@PLT	#
# src/vm.c:577:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _218, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR 8392312[r15], 8	# vm.stackTop,
# src/vm.c:577:         DISPATCH();
	lea	rdx, 1[rax]	# tmp2203,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2203
	movzx	eax, BYTE PTR [rax]	# _221, *_218
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_221]
	.p2align 4,,10
	.p2align 3
.L108:
# src/vm.c:568:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:569:         tableSet(&vm.globals, name, peek(0));
	mov	rdi, r12	#, tmp3975
# src/vm.c:568:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR 16[rax]	# _182->function, _182->function
	mov	rcx, QWORD PTR 64[rax]	# _184, _183->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _185, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2162,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2162
	movzx	eax, BYTE PTR [rax]	# _188, *_185
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:568:         ObjString* name = READ_STRING();
	mov	rsi, QWORD PTR [rcx+rax*8]	# _192, *_190
# src/vm.c:569:         tableSet(&vm.globals, name, peek(0));
	mov	rdx, QWORD PTR -8[rdx]	# MEM[(Value *)_1661 + -8B], MEM[(Value *)_1661 + -8B]
# src/vm.c:568:         ObjString* name = READ_STRING();
	and	rsi, rbp	# _192, tmp3974
# src/vm.c:569:         tableSet(&vm.globals, name, peek(0));
	call	"tableSet"@PLT	#
# src/vm.c:571:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _193, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR 8392312[r15], 8	# vm.stackTop,
# src/vm.c:571:         DISPATCH();
	lea	rdx, 1[rax]	# tmp2176,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2176
	movzx	eax, BYTE PTR [rax]	# _196, *_193
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_196]
	.p2align 4,,10
	.p2align 3
.L105:
# src/vm.c:556:         ObjString* name = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _148, frame_1434->ip
# src/vm.c:558:         if (!tableGet(&vm.globals, name, &value)) {
	mov	rdi, r12	#, tmp3975
# src/vm.c:556:         ObjString* name = READ_STRING_LONG();
	lea	rax, 3[rdx]	# tmp2131,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2131
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rcx, QWORD PTR 16[rax]	# _150->function, _150->function
	movzx	eax, BYTE PTR 2[rdx]	# _160, MEM[(uint8_t *)_148 + 2B]
	movzx	edx, WORD PTR [rdx]	# _158, MEM <short unsigned int> [(uint8_t *)_148]
	sal	eax, 16	# _161,
	or	eax, edx	# _163, _158
	mov	rdx, QWORD PTR 64[rcx]	# _151->chunk.constants.values, _151->chunk.constants.values
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_165
# src/vm.c:558:         if (!tableGet(&vm.globals, name, &value)) {
	lea	rdx, 72[rsp]	# tmp2142,
# src/vm.c:556:         ObjString* name = READ_STRING_LONG();
	and	r13, rbp	# name, tmp3974
# src/vm.c:558:         if (!tableGet(&vm.globals, name, &value)) {
	mov	rsi, r13	#, name
	call	"tableGet"@PLT	#
# src/vm.c:558:         if (!tableGet(&vm.globals, name, &value)) {
	test	al, al	# _168
	je	.L552	#,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _1653, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _1653, tmp3975
	je	.L91	#,
# src/vm.c:564:         push(value);
	mov	rdx, QWORD PTR 72[rsp]	# value.18_176, value
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2154,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rdx	# *_1653, value.18_176
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2154
# src/vm.c:565:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _177, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2155,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2155
	movzx	eax, BYTE PTR [rax]	# _180, *_177
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_180]
	.p2align 4,,10
	.p2align 3
.L101:
# src/vm.c:545:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:547:         if (!tableGet(&vm.globals, name, &value)) {
	mov	rdi, r12	#, tmp3975
# src/vm.c:545:         ObjString* name = READ_STRING();
	mov	rax, QWORD PTR 16[rax]	# _123->function, _123->function
	mov	rdx, QWORD PTR 64[rax]	# _125, _124->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _126, frame_1434->ip
	lea	rcx, 1[rax]	# tmp2110,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, tmp2110
	movzx	eax, BYTE PTR [rax]	# _129, *_126
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_131
# src/vm.c:547:         if (!tableGet(&vm.globals, name, &value)) {
	lea	rdx, 64[rsp]	# tmp2113,
# src/vm.c:545:         ObjString* name = READ_STRING();
	and	r13, rbp	# name, tmp3974
# src/vm.c:547:         if (!tableGet(&vm.globals, name, &value)) {
	mov	rsi, r13	#, name
	call	"tableGet"@PLT	#
# src/vm.c:547:         if (!tableGet(&vm.globals, name, &value)) {
	test	al, al	# _134
	je	.L553	#,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _1657, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _1657, tmp3975
	je	.L91	#,
# src/vm.c:552:         push(value);
	mov	rdx, QWORD PTR 64[rsp]	# value.16_142, value
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2125,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rdx	# *_1657, value.16_142
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2125
# src/vm.c:553:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _143, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2126,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2126
	movzx	eax, BYTE PTR [rax]	# _146, *_143
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_146]
	.p2align 4,,10
	.p2align 3
.L100:
# src/vm.c:539:         int slot = READ_LONG();
	mov	rcx, QWORD PTR 8[r14]	# _104, frame_1434->ip
	lea	rax, 3[rcx]	# tmp2090,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2090
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:539:         int slot = READ_LONG();
	movzx	edx, BYTE PTR 1[rcx]	# _110, MEM[(uint8_t *)_104 + 1B]
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -8[rax]	# _1645, MEM[(Value *)_1638 + -8B]
# src/vm.c:539:         int slot = READ_LONG();
	movzx	eax, BYTE PTR [rcx]	# _107, *_104
	sal	edx, 8	# _111,
	sal	eax, 16	# _108,
# src/vm.c:539:         int slot = READ_LONG();
	or	eax, edx	# _1079, _111
# src/vm.c:539:         int slot = READ_LONG();
	movzx	edx, BYTE PTR 2[rcx]	# _114, MEM[(uint8_t *)_104 + 2B]
# src/vm.c:540:         frame->slots[slot] = peek(0);
	or	eax, edx	# _116, _114
# src/vm.c:540:         frame->slots[slot] = peek(0);
	mov	rdx, QWORD PTR 16[r14]	# frame_1434->slots, frame_1434->slots
	mov	QWORD PTR [rdx+rax*8], rsi	# *_118, _1645
# src/vm.c:541:         DISPATCH();
	lea	rax, 4[rcx]	# tmp2103,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2103
	movzx	eax, BYTE PTR 3[rcx]	# _121, MEM[(uint8_t *)_104 + 3B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_121]
	.p2align 4,,10
	.p2align 3
.L99:
# src/vm.c:534:         uint8_t slot = READ_BYTE();
	mov	rax, QWORD PTR 8[r14]	# _94, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2080,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2080
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:535:         frame->slots[slot] = peek(0);
	movzx	ecx, BYTE PTR [rax]	# _97, *_94
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -8[rdx]	# _1639, MEM[(Value *)_1629 + -8B]
# src/vm.c:535:         frame->slots[slot] = peek(0);
	mov	rdx, QWORD PTR 16[r14]	# frame_1434->slots, frame_1434->slots
	mov	QWORD PTR [rdx+rcx*8], rsi	# *_99, _1639
# src/vm.c:536:         DISPATCH();
	lea	rdx, 2[rax]	# tmp2085,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2085
	movzx	eax, BYTE PTR 1[rax]	# _102, MEM[(uint8_t *)_94 + 1B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_102]
	.p2align 4,,10
	.p2align 3
.L98:
# src/vm.c:529:         int slot = READ_LONG();
	mov	rcx, QWORD PTR 8[r14]	# _74, frame_1434->ip
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rsi, QWORD PTR 8392312[r15]	# _1632, vm.stackTop
# src/vm.c:529:         int slot = READ_LONG();
	lea	rax, 3[rcx]	# tmp2060,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2060
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rsi, r12	# _1632, tmp3975
	je	.L91	#,
# src/vm.c:529:         int slot = READ_LONG();
	movzx	eax, BYTE PTR [rcx]	# _77, *_74
	movzx	edx, BYTE PTR 1[rcx]	# _80, MEM[(uint8_t *)_74 + 1B]
	sal	eax, 16	# _78,
	sal	edx, 8	# _81,
# src/vm.c:529:         int slot = READ_LONG();
	or	eax, edx	# _1078, _81
# src/vm.c:529:         int slot = READ_LONG();
	movzx	edx, BYTE PTR 2[rcx]	# _84, MEM[(uint8_t *)_74 + 2B]
# src/vm.c:530:         push(frame->slots[slot]);
	or	eax, edx	# _86, _84
# src/vm.c:530:         push(frame->slots[slot]);
	mov	rdx, QWORD PTR 16[r14]	# frame_1434->slots, frame_1434->slots
	mov	rax, QWORD PTR [rdx+rax*8]	# _89, *_88
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR [rsi], rax	# *_1632, _89
# src/vm.c:157:     vm.stackTop++;
	lea	rax, 8[rsi]	# tmp2074,
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2074
# src/vm.c:531:         DISPATCH();
	lea	rax, 4[rcx]	# tmp2075,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2075
	movzx	eax, BYTE PTR 3[rcx]	# _92, MEM[(uint8_t *)_74 + 3B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_92]
	.p2align 4,,10
	.p2align 3
.L97:
# src/vm.c:524:         uint8_t slot = READ_BYTE();
	mov	rdx, QWORD PTR 8[r14]	# _63, frame_1434->ip
	lea	rax, 1[rdx]	# tmp2048,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2048
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _1623, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _1623, tmp3975
	je	.L91	#,
# src/vm.c:525:         push(frame->slots[slot]);
	movzx	esi, BYTE PTR [rdx]	# _66, *_63
# src/vm.c:525:         push(frame->slots[slot]);
	mov	rcx, QWORD PTR 16[r14]	# frame_1434->slots, frame_1434->slots
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2054,
# src/vm.c:525:         push(frame->slots[slot]);
	mov	rcx, QWORD PTR [rcx+rsi*8]	# _69, *_68
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rcx	# *_1623, _69
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2054
# src/vm.c:526:         DISPATCH();
	lea	rax, 2[rdx]	# tmp2055,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2055
	movzx	eax, BYTE PTR 1[rdx]	# _72, MEM[(uint8_t *)_63 + 1B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_72]
	.p2align 4,,10
	.p2align 3
.L96:
# src/vm.c:521:     CASE(OP_POP):   pop();                 DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _58, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR 8392312[r15], 8	# vm.stackTop,
# src/vm.c:521:     CASE(OP_POP):   pop();                 DISPATCH();
	lea	rdx, 1[rax]	# tmp2043,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2043
	movzx	eax, BYTE PTR [rax]	# _61, *_58
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_61]
	.p2align 4,,10
	.p2align 3
.L95:
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _1616, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _1616, tmp3975
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	movabs	rsi, 9222246136947933186	# tmp4181,
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2031,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rsi	# *_1616, tmp4181
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2031
# src/vm.c:520:     CASE(OP_FALSE): push(BOOL_VAL(false)); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _53, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2032,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2032
	movzx	eax, BYTE PTR [rax]	# _56, *_53
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_56]
	.p2align 4,,10
	.p2align 3
.L94:
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _1595, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _1595, tmp3975
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	movabs	rsi, 9222246136947933187	# tmp4180,
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2021,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rsi	# *_1595, tmp4180
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2021
# src/vm.c:519:     CASE(OP_TRUE):  push(BOOL_VAL(true));  DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _48, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2022,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2022
	movzx	eax, BYTE PTR [rax]	# _51, *_48
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_51]
	.p2align 4,,10
	.p2align 3
.L93:
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _1590, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _1590, tmp3975
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	movabs	rsi, 9222246136947933185	# tmp4179,
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2011,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rsi	# *_1590, tmp4179
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2011
# src/vm.c:518:     CASE(OP_NULL):  push(NULL_VAL);        DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _43, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2012,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2012
	movzx	eax, BYTE PTR [rax]	# _46, *_43
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_46]
	.p2align 4,,10
	.p2align 3
.L90:
# src/vm.c:514:         Value constant = READ_CONSTANT_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _21, frame_1434->ip
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rcx, QWORD PTR 8392312[r15]	# _1584, vm.stackTop
# src/vm.c:514:         Value constant = READ_CONSTANT_LONG();
	lea	rax, 3[rdx]	# tmp1988,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp1988
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, r12	# _1584, tmp3975
	je	.L91	#,
# src/vm.c:514:         Value constant = READ_CONSTANT_LONG();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	movzx	edi, WORD PTR [rdx]	# _31, MEM <short unsigned int> [(uint8_t *)_21]
	mov	rsi, QWORD PTR 16[rax]	# _23->function, _23->function
	movzx	eax, BYTE PTR 2[rdx]	# _33, MEM[(uint8_t *)_21 + 2B]
# src/vm.c:514:         Value constant = READ_CONSTANT_LONG();
	mov	rsi, QWORD PTR 64[rsi]	# _24->chunk.constants.values, _24->chunk.constants.values
# src/vm.c:514:         Value constant = READ_CONSTANT_LONG();
	sal	eax, 16	# _34,
	or	eax, edi	# _36, _31
# src/vm.c:514:         Value constant = READ_CONSTANT_LONG();
	mov	rax, QWORD PTR [rsi+rax*8]	# constant, *_38
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR [rcx], rax	# *_1584, constant
# src/vm.c:157:     vm.stackTop++;
	lea	rax, 8[rcx]	# tmp2001,
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2001
# src/vm.c:516:         DISPATCH();
	lea	rax, 4[rdx]	# tmp2002,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2002
	movzx	eax, BYTE PTR 3[rdx]	# _41, MEM[(uint8_t *)_21 + 3B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_41]
	.p2align 4,,10
	.p2align 3
.L271:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2166, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _2166, tmp3975
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	rdx, QWORD PTR -8[rax]	# MEM[(Value *)_2166 + -8B], MEM[(Value *)_2166 + -8B]
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp3325,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rdx	# *_2166, MEM[(Value *)_2166 + -8B]
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3325
# src/vm.c:1026:     CASE(OP_DUP): push(peek(0)); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1042, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3326,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3326
	movzx	eax, BYTE PTR [rax]	# _1045, *_1042
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1045]
	.p2align 4,,10
	.p2align 3
.L254:
# src/vm.c:949:         int argCount = READ_BYTE();
	mov	rax, QWORD PTR 8[r14]	# _1009, frame_1434->ip
# src/vm.c:951:         Value* args = vm.stackTop - argCount;
	mov	rdx, QWORD PTR 8392312[r15]	# args, vm.stackTop
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	r8, -1125899906842624	# tmp3285,
# src/vm.c:949:         int argCount = READ_BYTE();
	lea	rcx, 1[rax]	# _1010,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, _1010
	movzx	eax, BYTE PTR [rax]	#, *_1009
	mov	rsi, rax	#,
# src/vm.c:951:         Value* args = vm.stackTop - argCount;
	sal	rax, 3	# _1014,
# src/vm.c:951:         Value* args = vm.stackTop - argCount;
	sub	rdx, rax	# args, _1014
# src/vm.c:951:         Value* args = vm.stackTop - argCount;
	mov	rdi, rax	# _1015, _1014
# src/vm.c:953:         if (!IS_STRING(args[0])) {
	mov	rax, QWORD PTR [rdx]	# _1016, *args_1594
# src/vm.c:951:         Value* args = vm.stackTop - argCount;
	neg	rdi	# _1015
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r9, rax	# tmp4063, _1016
	not	r9	# tmp4063
	test	r9, r8	# tmp4063, tmp3285
	je	.L554	#,
.L255:
# src/vm.c:955:             runtimeError("First argument to print must be a format string.");
	lea	rdi, .LC32[rip]	#,
	xor	eax, eax	#
	call	"runtimeError"	#
.L257:
# src/vm.c:1019:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:1019:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1030, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3316,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3316
	movzx	eax, BYTE PTR [rax]	# _1033, *_1030
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1033]
	.p2align 4,,10
	.p2align 3
.L252:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2152, vm.stackTop
# src/vm.c:938:         if (!IS_NUMBER(peek(0))) {
	movabs	rcx, 9222246136947933184	# tmp3262,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[rax]	# _2153, MEM[(Value *)_2152 + -8B]
# src/vm.c:938:         if (!IS_NUMBER(peek(0))) {
	mov	rsi, rdx	# tmp4064, _2153
	not	rsi	# tmp4064
	test	rsi, rcx	# tmp4064, tmp3262
	je	.L555	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -8[rax]	# _2156,
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2156
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, r12	# _2156, tmp3975
	je	.L91	#,
# src/vm.c:944:         push(NUMBER_VAL(-AS_NUMBER(pop())));
	movq	xmm0, rdx	# _1003, _2153
	xorpd	xmm0, XMMWORD PTR .LC31[rip]	# _1003,
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2152 + -8B], _1003
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _2152
# src/vm.c:945:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1004, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3275,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3275
	movzx	eax, BYTE PTR [rax]	# _1007, *_1004
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1007]
	.p2align 4,,10
	.p2align 3
.L286:
# src/vm.c:1081:         ObjString* method = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _1175, frame_1434->ip
	lea	rax, 3[rdx]	# tmp3562,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3562
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	movzx	esi, WORD PTR [rdx]	# _1185, MEM <short unsigned int> [(uint8_t *)_1175]
	mov	rcx, QWORD PTR 16[rax]	# _1177->function, _1177->function
	movzx	eax, BYTE PTR 2[rdx]	# _1187, MEM[(uint8_t *)_1175 + 2B]
	mov	rcx, QWORD PTR 64[rcx]	# _1178->chunk.constants.values, _1178->chunk.constants.values
	sal	eax, 16	# _1188,
	or	eax, esi	# _1190, _1185
	mov	r13, QWORD PTR [rcx+rax*8]	# method, *_1192
# src/vm.c:1082:         int argCount = READ_BYTE();
	lea	rax, 4[rdx]	# tmp3573,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3573
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _2180, vm.stackTop
# src/vm.c:1082:         int argCount = READ_BYTE();
	movzx	r14d, BYTE PTR 3[rdx]	# _1196, MEM[(uint8_t *)_1175 + 3B]
# src/vm.c:1081:         ObjString* method = READ_STRING_LONG();
	and	r13, rbp	# method, tmp3974
# src/vm.c:1083:         ObjClass* superclass = AS_CLASS(pop());
	mov	rdi, QWORD PTR -8[rax]	# _1197, MEM[(Value *)_2180 + -8B]
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# tmp3576,
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	mov	rsi, r13	#, method
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, tmp3576
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	lea	rdx, 168[rsp]	# tmp3577,
# src/vm.c:1083:         ObjClass* superclass = AS_CLASS(pop());
	and	rdi, rbp	# _1197, tmp3974
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	add	rdi, 24	# _2529,
	call	"tableGet"@PLT	#
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	test	al, al	# _2530
	jne	.L287	#,
# src/vm.c:236:         runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# MEM[(char * *)method_1543 + 24B], MEM[(char * *)method_1543 + 24B]
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:237:         if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# _2536, errorWasHandled
.L288:
# src/vm.c:1085:         if (!invokeFromClass(superclass, method, argCount)) return INTERPRET_RUNTIME_ERROR;
	test	al, al	# _2536
	je	.L104	#,
# src/vm.c:1086:         frame = &vm.frames[vm.frameCount - 1];
	mov	eax, DWORD PTR 1536[r15]	# tmp4316, vm.frameCount
	sub	eax, 1	# _2779,
	cdqe
.L291:
# src/vm.c:1086:         frame = &vm.frames[vm.frameCount - 1];
	lea	rax, [rax+rax*2]	# _2552,
	lea	r14, [r15+rax*8]	# frame,
# src/vm.c:1088:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1201, MEM <struct VM> [(struct CallFrame *)&vm].frames[prephitmp_2780].ip
	lea	rdx, 1[rax]	# tmp3647,
	mov	QWORD PTR 8[r14], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[prephitmp_2780].ip, tmp3647
	movzx	eax, BYTE PTR [rax]	# _1204, *_1201
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1204]
	.p2align 4,,10
	.p2align 3
.L280:
# src/vm.c:1071:         ObjString* method = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rax, QWORD PTR 16[rax]	# _1153->function, _1153->function
	mov	rdx, QWORD PTR 64[rax]	# _1155, _1154->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _1156, frame_1434->ip
	lea	rcx, 1[rax]	# tmp3480,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, tmp3480
	movzx	ecx, BYTE PTR [rax]	# _1159, *_1156
	mov	r13, QWORD PTR [rdx+rcx*8]	# method, *_1161
# src/vm.c:1072:         int argCount = READ_BYTE();
	lea	rdx, 2[rax]	# tmp3483,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3483
	movzx	r14d, BYTE PTR 1[rax]	# _1165, MEM[(uint8_t *)_1156 + 1B]
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _2177, vm.stackTop
# src/vm.c:1071:         ObjString* method = READ_STRING();
	and	r13, rbp	# method, tmp3974
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	mov	rsi, r13	#, method
# src/vm.c:1073:         ObjClass* superclass = AS_CLASS(pop());
	mov	rdi, QWORD PTR -8[rax]	# _1166, MEM[(Value *)_2177 + -8B]
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# tmp3486,
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, tmp3486
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	lea	rdx, 168[rsp]	# tmp3487,
# src/vm.c:1073:         ObjClass* superclass = AS_CLASS(pop());
	and	rdi, rbp	# _1166, tmp3974
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	add	rdi, 24	# _2505,
	call	"tableGet"@PLT	#
# src/vm.c:235:     if (!tableGet(&class_->methods, name, &method)) {
	test	al, al	# _2506
	jne	.L281	#,
# src/vm.c:236:         runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# MEM[(char * *)method_1551 + 24B], MEM[(char * *)method_1551 + 24B]
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:237:         if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# _2512, errorWasHandled
.L282:
# src/vm.c:1075:         if (!invokeFromClass(superclass, method, argCount)) return INTERPRET_RUNTIME_ERROR;
	test	al, al	# _2512
	je	.L104	#,
# src/vm.c:1076:         frame = &vm.frames[vm.frameCount - 1];
	mov	eax, DWORD PTR 1536[r15]	# tmp4311, vm.frameCount
	sub	eax, 1	# _2783,
	cdqe
.L285:
# src/vm.c:1076:         frame = &vm.frames[vm.frameCount - 1];
	lea	rax, [rax+rax*2]	# _618,
	lea	r14, [r15+rax*8]	# frame,
# src/vm.c:1078:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1170, MEM <struct VM> [(struct CallFrame *)&vm].frames[prephitmp_2784].ip
	lea	rdx, 1[rax]	# tmp3557,
	mov	QWORD PTR 8[r14], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[prephitmp_2784].ip, tmp3557
	movzx	eax, BYTE PTR [rax]	# _1173, *_1170
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1173]
	.p2align 4,,10
	.p2align 3
.L279:
# src/vm.c:1062:         ObjString* method = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _1123, frame_1434->ip
	lea	rax, 3[rdx]	# tmp3436,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3436
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	movzx	esi, WORD PTR [rdx]	# _1133, MEM <short unsigned int> [(uint8_t *)_1123]
	mov	rcx, QWORD PTR 16[rax]	# _1125->function, _1125->function
	movzx	eax, BYTE PTR 2[rdx]	# _1135, MEM[(uint8_t *)_1123 + 2B]
	mov	rcx, QWORD PTR 64[rcx]	# _1126->chunk.constants.values, _1126->chunk.constants.values
	sal	eax, 16	# _1136,
	or	eax, esi	# _1138, _1133
	mov	rdi, QWORD PTR [rcx+rax*8]	# method, *_1140
# src/vm.c:1063:         int argCount = READ_BYTE();
	lea	rax, 4[rdx]	# tmp3447,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3447
# src/vm.c:1063:         int argCount = READ_BYTE();
	movzx	esi, BYTE PTR 3[rdx]	# argCount_1561, MEM[(uint8_t *)_1123 + 3B]
# src/vm.c:1062:         ObjString* method = READ_STRING_LONG();
	and	rdi, rbp	# method, tmp3974
# src/vm.c:1065:         if (!invoke(method, argCount)) return INTERPRET_RUNTIME_ERROR;
	call	"invoke"	#
# src/vm.c:1065:         if (!invoke(method, argCount)) return INTERPRET_RUNTIME_ERROR;
	test	al, al	# _1145
	je	.L104	#,
# src/vm.c:1066:         frame = &vm.frames[vm.frameCount - 1];
	mov	eax, DWORD PTR 1536[r15]	# tmp4306, vm.frameCount
	sub	eax, 1	# _1147,
# src/vm.c:1066:         frame = &vm.frames[vm.frameCount - 1];
	cdqe
	lea	rax, [rax+rax*2]	# _1988,
	lea	r14, [r15+rax*8]	# frame,
# src/vm.c:1068:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1148, MEM <struct VM> [(struct CallFrame *)&vm].frames[_1147].ip
	lea	rdx, 1[rax]	# tmp3473,
	mov	QWORD PTR 8[r14], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_1147].ip, tmp3473
	movzx	eax, BYTE PTR [rax]	# _1151, *_1148
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1151]
	.p2align 4,,10
	.p2align 3
.L278:
# src/vm.c:1053:         ObjString* method = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rax, QWORD PTR 16[rax]	# _1102->function, _1102->function
	mov	rdx, QWORD PTR 64[rax]	# _1104, _1103->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _1105, frame_1434->ip
	lea	rcx, 1[rax]	# tmp3402,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, tmp3402
	movzx	ecx, BYTE PTR [rax]	# _1108, *_1105
	mov	rdi, QWORD PTR [rdx+rcx*8]	# method, *_1110
# src/vm.c:1054:         int argCount = READ_BYTE();
	lea	rdx, 2[rax]	# tmp3405,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3405
# src/vm.c:1054:         int argCount = READ_BYTE();
	movzx	esi, BYTE PTR 1[rax]	# argCount_1568, MEM[(uint8_t *)_1105 + 1B]
# src/vm.c:1053:         ObjString* method = READ_STRING();
	and	rdi, rbp	# method, tmp3974
# src/vm.c:1056:         if (!invoke(method, argCount)) return INTERPRET_RUNTIME_ERROR;
	call	"invoke"	#
# src/vm.c:1056:         if (!invoke(method, argCount)) return INTERPRET_RUNTIME_ERROR;
	test	al, al	# _1115
	je	.L104	#,
# src/vm.c:1057:         frame = &vm.frames[vm.frameCount - 1];
	mov	eax, DWORD PTR 1536[r15]	# tmp4304, vm.frameCount
	sub	eax, 1	# _1117,
# src/vm.c:1057:         frame = &vm.frames[vm.frameCount - 1];
	cdqe
	lea	rax, [rax+rax*2]	# _1167,
	lea	r14, [r15+rax*8]	# frame,
# src/vm.c:1059:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1118, MEM <struct VM> [(struct CallFrame *)&vm].frames[_1117].ip
	lea	rdx, 1[rax]	# tmp3431,
	mov	QWORD PTR 8[r14], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_1117].ip, tmp3431
	movzx	eax, BYTE PTR [rax]	# _1121, *_1118
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1121]
	.p2align 4,,10
	.p2align 3
.L277:
# src/vm.c:1045:         int argCount = READ_BYTE();
	mov	rax, QWORD PTR 8[r14]	# _1091, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3365,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3365
# src/vm.c:1045:         int argCount = READ_BYTE();
	movzx	esi, BYTE PTR [rax]	# argCount, *_1091
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	eax, esi	# _2172, argCount
	not	eax	# _2172
	cdqe
# src/vm.c:1047:         if (!callValue(peek(argCount), argCount)) return INTERPRET_RUNTIME_ERROR;
	mov	rdi, QWORD PTR [rdx+rax*8]	# *_2175, *_2175
	call	"callValue"	#
# src/vm.c:1047:         if (!callValue(peek(argCount), argCount)) return INTERPRET_RUNTIME_ERROR;
	test	al, al	# _1094
	je	.L104	#,
# src/vm.c:1048:         frame = &vm.frames[vm.frameCount - 1];
	mov	eax, DWORD PTR 1536[r15]	# tmp4302, vm.frameCount
	sub	eax, 1	# _1096,
# src/vm.c:1048:         frame = &vm.frames[vm.frameCount - 1];
	cdqe
	lea	rax, [rax+rax*2]	# _1464,
	lea	r14, [r15+rax*8]	# frame,
# src/vm.c:1050:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1097, MEM <struct VM> [(struct CallFrame *)&vm].frames[_1096].ip
	lea	rdx, 1[rax]	# tmp3395,
	mov	QWORD PTR 8[r14], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_1096].ip, tmp3395
	movzx	eax, BYTE PTR [rax]	# _1100, *_1097
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1100]
	.p2align 4,,10
	.p2align 3
.L276:
# src/vm.c:1039:         uint16_t offset = READ_SHORT();
	mov	rdx, QWORD PTR 8[r14]	# _1076, frame_1434->ip
	lea	rax, 2[rdx]	# _1077,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, _1077
# src/vm.c:1040:         frame->ip -= offset;
	movzx	edx, WORD PTR [rdx]	# MEM <short unsigned int> [(uint8_t *)_1076], MEM <short unsigned int> [(uint8_t *)_1076]
	rol	dx, 8	# bswapdst_1941,
	movzx	edx, dx	# _1084, bswapdst_1941
	sub	rax, rdx	# _1086, _1084
# src/vm.c:1041:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3360,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3360
	movzx	eax, BYTE PTR [rax]	# _1089, *_1086
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1089]
	.p2align 4,,10
	.p2align 3
.L273:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:1034:         uint16_t offset = READ_SHORT();
	mov	rcx, QWORD PTR 8[r14]	# _1061, frame_1434->ip
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	movabs	rsi, 9222246136947933185	# tmp3341,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[rdx]	# _2170, MEM[(Value *)_2169 + -8B]
# src/vm.c:1034:         uint16_t offset = READ_SHORT();
	lea	rax, 2[rcx]	# _1062,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, _1062
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	cmp	rdx, rsi	# _2170, tmp3341
	je	.L274	#,
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	mov	rdi, rdx	# _2168, _2170
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	add	rsi, 2	# tmp3344,
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	or	rdi, 1	# _2168,
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	cmp	rdi, rsi	# _2168, tmp3344
	jne	.L275	#,
	cmp	rdx, rsi	# _2170, tmp3344
	jne	.L274	#,
.L275:
# src/vm.c:1036:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3352,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3352
	movzx	eax, BYTE PTR [rax]	# _1074, *prephitmp_2787
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1074]
.L274:
# src/vm.c:1035:         if (isFalsey(peek(0))) frame->ip += offset;
	movzx	edx, WORD PTR [rcx]	# MEM <short unsigned int> [(uint8_t *)_1061], MEM <short unsigned int> [(uint8_t *)_1061]
	rol	dx, 8	# bswapdst_1945,
	movzx	edx, dx	# _1069, bswapdst_1945
	add	rax, rdx	# _1062, _1069
	jmp	.L275	#
	.p2align 4,,10
	.p2align 3
.L272:
# src/vm.c:1029:         uint16_t offset = READ_SHORT();
	mov	rdx, QWORD PTR 8[r14]	# _1047, frame_1434->ip
	lea	rax, 2[rdx]	# _1048,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, _1048
# src/vm.c:1030:         frame->ip += offset;
	movzx	edx, WORD PTR [rdx]	# MEM <short unsigned int> [(uint8_t *)_1047], MEM <short unsigned int> [(uint8_t *)_1047]
	rol	dx, 8	# bswapdst_1984,
	movzx	edx, dx	# _1055, bswapdst_1984
	add	rax, rdx	# _1056, _1055
# src/vm.c:1031:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3334,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3334
	movzx	eax, BYTE PTR [rax]	# _1059, *_1056
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1059]
	.p2align 4,,10
	.p2align 3
.L318:
# src/vm.c:1124:         uint16_t offset = READ_SHORT();
	mov	rsi, QWORD PTR 8[r14]	# _1292, frame_1434->ip
# src/vm.c:1125:         ErrorHandler* handler = &vm.handlerStack[vm.handlerCount++];
	movsxd	rax, DWORD PTR 8392288[r15]	#, vm.handlerCount
# src/vm.c:1126:         handler->frameCount = vm.frameCount;
	mov	r8d, DWORD PTR 1536[r15]	# vm.frameCount, vm.frameCount
# src/vm.c:1125:         ErrorHandler* handler = &vm.handlerStack[vm.handlerCount++];
	lea	edx, 1[rax]	# tmp3723,
# src/vm.c:1124:         uint16_t offset = READ_SHORT();
	lea	rdi, 2[rsi]	# _1293,
	mov	QWORD PTR 8[r14], rdi	# frame_1434->ip, _1293
	movzx	ecx, WORD PTR [rsi]	# MEM <short unsigned int> [(uint8_t *)_1292], MEM <short unsigned int> [(uint8_t *)_1292]
# src/vm.c:1125:         ErrorHandler* handler = &vm.handlerStack[vm.handlerCount++];
	mov	DWORD PTR 8392288[r15], edx	# vm.handlerCount, tmp3723
# src/vm.c:1126:         handler->frameCount = vm.frameCount;
	lea	rdx, 262195[rax]	# tmp3726,
# src/vm.c:1128:         handler->handlerIp  = frame->ip + offset;
	sal	rax, 5	# tmp3741,
# src/vm.c:1126:         handler->frameCount = vm.frameCount;
	sal	rdx, 5	# tmp3727,
	rol	cx, 8	# bswapdst_1926,
# src/vm.c:1129:         handler->frame      = frame;
	mov	QWORD PTR 8390264[r15+rax], r14	# MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_1300].frame, frame
# src/vm.c:1126:         handler->frameCount = vm.frameCount;
	mov	DWORD PTR [r15+rdx], r8d	# MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_1300].frameCount, vm.frameCount
# src/vm.c:1127:         handler->stackTop   = vm.stackTop;
	mov	r8, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:1128:         handler->handlerIp  = frame->ip + offset;
	movzx	ecx, cx	# _1304, bswapdst_1926
# src/vm.c:1127:         handler->stackTop   = vm.stackTop;
	mov	QWORD PTR 8[r15+rdx], r8	# MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_1300].stackTop, vm.stackTop
# src/vm.c:1128:         handler->handlerIp  = frame->ip + offset;
	lea	rdx, [rdi+rcx]	# tmp3745,
	mov	QWORD PTR 8390256[r15+rax], rdx	# MEM <struct VM> [(struct ErrorHandler *)&vm].handlerStack[_1300].handlerIp, tmp3745
# src/vm.c:1130:         DISPATCH();
	lea	rax, 3[rsi]	# tmp3751,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3751
	movzx	eax, BYTE PTR 2[rsi]	# _1308, MEM[(uint8_t *)_1292 + 2B]
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1308]
	.p2align 4,,10
	.p2align 3
.L314:
# src/vm.c:1119:         closeUpvalues(vm.stackTop - 1);
	mov	rax, QWORD PTR 8392312[r15]	# tmp4319, vm.stackTop
	lea	rcx, -8[rax]	# _1286,
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	mov	rax, QWORD PTR 8390232[r15]	# _2191, vm.openUpvalues
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	test	rax, rax	# _2191
	jne	.L315	#,
	jmp	.L316	#
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L317:
# src/vm.c:317:         upvalue->closed = *upvalue->location;
	mov	rdx, QWORD PTR [rdx]	# _2188, *_2187
# src/vm.c:317:         upvalue->closed = *upvalue->location;
	mov	QWORD PTR 24[rax], rdx	# _2538->closed, _2188
# src/vm.c:318:         upvalue->location = &upvalue->closed;
	lea	rdx, 24[rax]	# tmp3711,
	mov	QWORD PTR 16[rax], rdx	# _2538->location, tmp3711
# src/vm.c:319:         vm.openUpvalues = upvalue->next;
	mov	rax, QWORD PTR 32[rax]	# _2191, _2538->next
# src/vm.c:319:         vm.openUpvalues = upvalue->next;
	mov	QWORD PTR 8390232[r15], rax	# vm.openUpvalues, _2191
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	test	rax, rax	# _2191
	je	.L316	#,
.L315:
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	mov	rdx, QWORD PTR 16[rax]	# _2187, _2538->location
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	cmp	rdx, rcx	# _2187, _1286
	jnb	.L317	#,
.L316:
# src/vm.c:1121:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1287, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _1286
# src/vm.c:1121:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3714,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3714
	movzx	eax, BYTE PTR [rax]	# _1290, *_1287
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1290]
	.p2align 4,,10
	.p2align 3
.L303:
# src/vm.c:1105:         ObjFunction* function = AS_FUNCTION(READ_CONSTANT_LONG());
	mov	rdx, QWORD PTR 8[r14]	# _1241, frame_1434->ip
	lea	rax, 3[rdx]	# tmp3677,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3677
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rcx, QWORD PTR 16[rax]	# _1243->function, _1243->function
	movzx	eax, BYTE PTR 2[rdx]	# _1253, MEM[(uint8_t *)_1241 + 2B]
	movzx	edx, WORD PTR [rdx]	# _1251, MEM <short unsigned int> [(uint8_t *)_1241]
	sal	eax, 16	# _1254,
	or	eax, edx	# _1256, _1251
	mov	rdx, QWORD PTR 64[rcx]	# _1244->chunk.constants.values, _1244->chunk.constants.values
	mov	rdi, QWORD PTR [rdx+rax*8]	# _1260, *_1258
	and	rdi, rbp	# _1260, tmp3974
# src/vm.c:1106:         ObjClosure* closure = newClosure(function);
	call	"newClosure"@PLT	#
	mov	rsi, rax	# closure,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _2185, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _2185, tmp3975
	je	.L91	#,
# src/vm.c:1107:         push(OBJ_VAL(closure));
	movabs	rdx, -1125899906842624	# tmp3691,
# src/vm.c:1108:         for (int i = 0; i < closure->upvalueCount; i++) {
	mov	r9d, DWORD PTR 32[rsi]	# prephitmp_2749, closure_1517->upvalueCount
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp3694,
# src/vm.c:1107:         push(OBJ_VAL(closure));
	or	rdx, rsi	# tmp3692, closure
	mov	QWORD PTR -8[rax], rdx	# *_2185, tmp3692
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3694
# src/vm.c:1115:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# prephitmp_2757, frame_1434->ip
# src/vm.c:1108:         for (int i = 0; i < closure->upvalueCount; i++) {
	test	r9d, r9d	# prephitmp_2749
	jle	.L304	#,
	mov	rcx, r14	# frame, frame
	xor	r14d, r14d	# ivtmp.238
	jmp	.L313	#
	.p2align 4,,10
	.p2align 3
.L305:
# src/vm.c:1113:                 : frame->closure->upvalues[index];
	mov	rdx, QWORD PTR [rcx]	# frame_1434->closure, frame_1434->closure
# src/vm.c:1113:                 : frame->closure->upvalues[index];
	mov	rdx, QWORD PTR 24[rdx]	# _1270->upvalues, _1270->upvalues
	mov	rdi, QWORD PTR [rdx+rax*8]	# createdUpvalue, *_1274
	mov	rax, r8	# prephitmp_2757, _1265
.L312:
# src/vm.c:1111:             closure->upvalues[i] = isLocal
	mov	rdx, QWORD PTR 24[rsi]	# closure_1517->upvalues, closure_1517->upvalues
	mov	QWORD PTR [rdx+r14*8], rdi	# *_1278, createdUpvalue
# src/vm.c:1108:         for (int i = 0; i < closure->upvalueCount; i++) {
	add	r14, 1	# ivtmp.238,
	cmp	r9d, r14d	# prephitmp_2749, ivtmp.238
	jle	.L556	#,
.L313:
# src/vm.c:1109:             uint8_t isLocal = READ_BYTE();
	lea	rdx, 1[rax]	# tmp3695,
# src/vm.c:1110:             uint8_t index   = READ_BYTE();
	lea	r8, 2[rax]	# _1265,
# src/vm.c:1109:             uint8_t isLocal = READ_BYTE();
	mov	QWORD PTR 8[rcx], rdx	# frame_1434->ip, tmp3695
# src/vm.c:1109:             uint8_t isLocal = READ_BYTE();
	movzx	edx, BYTE PTR [rax]	# isLocal, *prephitmp_2834
# src/vm.c:1110:             uint8_t index   = READ_BYTE();
	mov	QWORD PTR 8[rcx], r8	# frame_1434->ip, _1265
# src/vm.c:1112:                 ? captureUpvalue(frame->slots + index)
	movzx	eax, BYTE PTR 1[rax]	# _2843, MEM[(uint8_t *)prephitmp_2834 + 1B]
# src/vm.c:1113:                 : frame->closure->upvalues[index];
	lea	rdi, 0[0+rax*8]	# _2844,
# src/vm.c:1113:                 : frame->closure->upvalues[index];
	test	dl, dl	# isLocal
	je	.L305	#,
# src/vm.c:292:     ObjUpvalue* upvalue = vm.openUpvalues;
	mov	r13, QWORD PTR 8390232[r15]	# upvalue, vm.openUpvalues
# src/vm.c:1112:                 ? captureUpvalue(frame->slots + index)
	add	rdi, QWORD PTR 16[rcx]	# _1269, frame_1434->slots
# src/vm.c:291:     ObjUpvalue* prevUpvalue = NULL;
	xor	edx, edx	# prevUpvalue
# src/vm.c:293:     while (upvalue != NULL && upvalue->location > local) {
	test	r13, r13	# upvalue
	jne	.L306	#,
	jmp	.L557	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L309:
# src/vm.c:295:         upvalue = upvalue->next;
	mov	rax, QWORD PTR 32[r13]	# upvalue, upvalue_2636->next
	mov	rdx, r13	# prevUpvalue, upvalue
# src/vm.c:293:     while (upvalue != NULL && upvalue->location > local) {
	test	rax, rax	# upvalue
	je	.L350	#,
	mov	r13, rax	# upvalue, upvalue
.L306:
# src/vm.c:293:     while (upvalue != NULL && upvalue->location > local) {
	cmp	rdi, QWORD PTR 16[r13]	# _1269, upvalue_2636->location
	jb	.L309	#,
# src/vm.c:298:     if (upvalue != NULL && upvalue->location == local) {
	je	.L558	#,
.L308:
	mov	QWORD PTR 24[rsp], rsi	# %sfp, closure
	mov	QWORD PTR 16[rsp], rcx	# %sfp, frame
	mov	QWORD PTR 8[rsp], rdx	# %sfp, prevUpvalue
# src/vm.c:302:     ObjUpvalue* createdUpvalue = newUpvalue(local);
	call	"newUpvalue"@PLT	#
# src/vm.c:305:     if (prevUpvalue == NULL) {
	mov	rdx, QWORD PTR 8[rsp]	# prevUpvalue, %sfp
	mov	rcx, QWORD PTR 16[rsp]	# frame, %sfp
# src/vm.c:303:     createdUpvalue->next = upvalue;
	mov	QWORD PTR 32[rax], r13	# createdUpvalue_2568->next, upvalue
# src/vm.c:305:     if (prevUpvalue == NULL) {
	mov	rsi, QWORD PTR 24[rsp]	# closure, %sfp
# src/vm.c:302:     ObjUpvalue* createdUpvalue = newUpvalue(local);
	mov	rdi, rax	# createdUpvalue, createdUpvalue
# src/vm.c:305:     if (prevUpvalue == NULL) {
	test	rdx, rdx	# prevUpvalue
	je	.L341	#,
# src/vm.c:308:         prevUpvalue->next = createdUpvalue;
	mov	QWORD PTR 32[rdx], rax	# prevUpvalue_484->next, createdUpvalue
# src/vm.c:1108:         for (int i = 0; i < closure->upvalueCount; i++) {
	mov	r9d, DWORD PTR 32[rsi]	# prephitmp_2749, closure_1517->upvalueCount
# src/vm.c:1115:         DISPATCH();
	mov	rax, QWORD PTR 8[rcx]	# prephitmp_2757, frame_1434->ip
	jmp	.L312	#
	.p2align 4,,10
	.p2align 3
.L236:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2107, vm.stackTop
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	movabs	rdx, 9222246136947933184	# tmp3111,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -8[rax]	# _2108, MEM[(Value *)_2107 + -8B]
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	mov	rsi, rcx	# tmp4075, _2108
	not	rsi	# tmp4075
	test	rsi, rdx	# tmp4075, tmp3111
	je	.L237	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -16[rax]	# _2109, MEM[(Value *)_2107 + -16B]
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	mov	rdi, rsi	# tmp4074, _2109
	not	rdi	# tmp4074
	test	rdi, rdx	# tmp4074, tmp3111
	je	.L237	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _2112,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp3123,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2112
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rdi	# _2112, tmp3123
	je	.L91	#,
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	movq	xmm5, rcx	# tmp4267, _2108
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	movq	xmm6, rsi	# tmp4268, _2109
	pxor	xmm0, xmm0	# _922
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp3129,
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	cvttsd2si	edx, xmm5	# b_1654, tmp4267
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	cvttsd2si	ecx, xmm6	# a_1656, tmp4268
	or	edx, ecx	# _921, a_1656
	cvtsi2sd	xmm0, edx	# _922, _921
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2107 + -16B], _922
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3129
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _923, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3130,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3130
	movzx	eax, BYTE PTR [rax]	# _926, *_923
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_926]
	.p2align 4,,10
	.p2align 3
.L233:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2098, vm.stackTop
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	movabs	rdx, 9222246136947933184	# tmp3085,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -8[rax]	# _2099, MEM[(Value *)_2098 + -8B]
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	mov	rsi, rcx	# tmp4077, _2099
	not	rsi	# tmp4077
	test	rsi, rdx	# tmp4077, tmp3085
	je	.L234	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -16[rax]	# _2100, MEM[(Value *)_2098 + -16B]
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	mov	rdi, rsi	# tmp4076, _2100
	not	rdi	# tmp4076
	test	rdi, rdx	# tmp4076, tmp3085
	je	.L234	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _2103,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp3097,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2103
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rdi	# _2103, tmp3097
	je	.L91	#,
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	movq	xmm4, rcx	# tmp4263, _2099
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	movq	xmm1, rsi	# tmp4264, _2100
	pxor	xmm0, xmm0	# _907
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp3103,
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	cvttsd2si	edx, xmm4	# b_1662, tmp4263
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	cvttsd2si	ecx, xmm1	# a_1663, tmp4264
	and	edx, ecx	# _906, a_1663
	cvtsi2sd	xmm0, edx	# _907, _906
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2098 + -16B], _907
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3103
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _908, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3104,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3104
	movzx	eax, BYTE PTR [rax]	# _911, *_908
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_911]
	.p2align 4,,10
	.p2align 3
.L320:
# src/vm.c:161:     vm.stackTop--;
	mov	rsi, QWORD PTR 8392312[r15]	# _2197, vm.stackTop
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	mov	rax, QWORD PTR 8390232[r15]	# _2196, vm.openUpvalues
# src/vm.c:1138:         closeUpvalues(frame->slots);
	mov	rcx, QWORD PTR 16[r14]	# _1317, frame_1434->slots
# src/vm.c:162:     return *vm.stackTop;
	mov	rdi, QWORD PTR -8[rsi]	# _2198, MEM[(Value *)_2197 + -8B]
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	test	rax, rax	# _2196
	jne	.L321	#,
	jmp	.L322	#
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L323:
# src/vm.c:317:         upvalue->closed = *upvalue->location;
	mov	rdx, QWORD PTR [rdx]	# _2193, *_2192
# src/vm.c:317:         upvalue->closed = *upvalue->location;
	mov	QWORD PTR 24[rax], rdx	# _2619->closed, _2193
# src/vm.c:318:         upvalue->location = &upvalue->closed;
	lea	rdx, 24[rax]	# tmp3769,
	mov	QWORD PTR 16[rax], rdx	# _2619->location, tmp3769
# src/vm.c:319:         vm.openUpvalues = upvalue->next;
	mov	rax, QWORD PTR 32[rax]	# _2196, _2619->next
# src/vm.c:319:         vm.openUpvalues = upvalue->next;
	mov	QWORD PTR 8390232[r15], rax	# vm.openUpvalues, _2196
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	test	rax, rax	# _2196
	je	.L322	#,
.L321:
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	mov	rdx, QWORD PTR 16[rax]	# _2192, _2619->location
# src/vm.c:315:     while (vm.openUpvalues != NULL && vm.openUpvalues->location >= last) {
	cmp	rdx, rcx	# _2192, _1317
	jnb	.L323	#,
.L322:
# src/vm.c:1139:         vm.frameCount--;
	mov	eax, DWORD PTR 1536[r15]	# _1318, vm.frameCount
# src/vm.c:1140:         if (vm.frameCount == 0) {
	mov	edx, eax	# _1319, _1318
	sub	edx, 1	# _1319,
# src/vm.c:1139:         vm.frameCount--;
	mov	DWORD PTR 1536[r15], edx	# vm.frameCount, _1319
# src/vm.c:1140:         if (vm.frameCount == 0) {
	je	.L559	#,
# src/vm.c:1144:         vm.stackTop = frame->slots;
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _1317
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, r12	# _1317, tmp3975
	je	.L91	#,
# src/vm.c:1146:         frame = &vm.frames[vm.frameCount - 1];
	sub	eax, 2	# _1320,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR [rcx], rdi	# *_1317, _2198
# src/vm.c:157:     vm.stackTop++;
	add	rcx, 8	# tmp3778,
# src/vm.c:1146:         frame = &vm.frames[vm.frameCount - 1];
	cdqe
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, tmp3778
# src/vm.c:1146:         frame = &vm.frames[vm.frameCount - 1];
	lea	rax, [rax+rax*2]	# _2629,
	lea	r14, [r15+rax*8]	# frame,
# src/vm.c:1148:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1321, MEM <struct VM> [(struct CallFrame *)&vm].frames[_1320].ip
	lea	rdx, 1[rax]	# tmp3801,
	mov	QWORD PTR 8[r14], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_1320].ip, tmp3801
	movzx	eax, BYTE PTR [rax]	# _1324, *_1321
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1324]
	.p2align 4,,10
	.p2align 3
.L248:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2143, vm.stackTop
# src/vm.c:924:         if (!IS_NUMBER(peek(0))) {
	movabs	rcx, 9222246136947933184	# tmp3221,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[rax]	# _2144, MEM[(Value *)_2143 + -8B]
# src/vm.c:924:         if (!IS_NUMBER(peek(0))) {
	mov	rsi, rdx	# tmp4065, _2144
	not	rsi	# tmp4065
	test	rsi, rcx	# tmp4065, tmp3221
	je	.L560	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -8[rax]	# _2147,
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2147
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, r12	# _2147, tmp3975
	je	.L91	#,
# src/vm.c:930:         int32_t val = (int32_t)AS_NUMBER(pop());
	movq	xmm4, rdx	# tmp4282, _2144
# src/vm.c:931:         push(NUMBER_VAL((double)(~val)));
	pxor	xmm0, xmm0	# _985
# src/vm.c:930:         int32_t val = (int32_t)AS_NUMBER(pop());
	cvttsd2si	edx, xmm4	# val_1624, tmp4282
# src/vm.c:931:         push(NUMBER_VAL((double)(~val)));
	not	edx	# _984
# src/vm.c:931:         push(NUMBER_VAL((double)(~val)));
	cvtsi2sd	xmm0, edx	# _985, _984
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2143 + -8B], _985
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _2143
# src/vm.c:932:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _986, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3235,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3235
	movzx	eax, BYTE PTR [rax]	# _989, *_986
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_989]
	.p2align 4,,10
	.p2align 3
.L245:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2134, vm.stackTop
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	movabs	rdx, 9222246136947933184	# tmp3192,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -8[rax]	# _2135, MEM[(Value *)_2134 + -8B]
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	mov	rsi, rcx	# tmp4068, _2135
	not	rsi	# tmp4068
	test	rsi, rdx	# tmp4068, tmp3192
	je	.L246	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -16[rax]	# _2136, MEM[(Value *)_2134 + -16B]
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	mov	rdi, rsi	# tmp4067, _2136
	not	rdi	# tmp4067
	test	rdi, rdx	# tmp4067, tmp3192
	je	.L246	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _2139,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp3204,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2139
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rdi	# _2139, tmp3204
	je	.L91	#,
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	movq	xmm1, rsi	# tmp4279, _2136
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	movq	xmm5, rcx	# tmp4280, _2135
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	pxor	xmm0, xmm0	# _971
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp3213,
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	cvttsd2si	rdx, xmm1	# tmp3206, tmp4279
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	cvttsd2si	rcx, xmm5	# tmp3208, tmp4280
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	shr	edx, cl	# _969, tmp4066
	cvtsi2sd	xmm0, edx	# _971, _969
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2134 + -16B], _971
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3213
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _972, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3214,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3214
	movzx	eax, BYTE PTR [rax]	# _975, *_972
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_975]
	.p2align 4,,10
	.p2align 3
.L242:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2125, vm.stackTop
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	movabs	rdx, 9222246136947933184	# tmp3163,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -8[rax]	# _2126, MEM[(Value *)_2125 + -8B]
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	mov	rsi, rcx	# tmp4071, _2126
	not	rsi	# tmp4071
	test	rsi, rdx	# tmp4071, tmp3163
	je	.L243	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -16[rax]	# _2127, MEM[(Value *)_2125 + -16B]
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	mov	rdi, rsi	# tmp4070, _2127
	not	rdi	# tmp4070
	test	rdi, rdx	# tmp4070, tmp3163
	je	.L243	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _2130,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp3175,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2130
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rdi	# _2130, tmp3175
	je	.L91	#,
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	movq	xmm3, rsi	# tmp4275, _2127
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	movq	xmm4, rcx	# tmp4276, _2126
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	pxor	xmm0, xmm0	# _954
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp3184,
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	cvttsd2si	rdx, xmm3	# tmp3177, tmp4275
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	cvttsd2si	rcx, xmm4	# tmp3179, tmp4276
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	sal	edx, cl	# _952, tmp4069
	cvtsi2sd	xmm0, edx	# _954, _952
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2125 + -16B], _954
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3184
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _955, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3185,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3185
	movzx	eax, BYTE PTR [rax]	# _958, *_955
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_958]
	.p2align 4,,10
	.p2align 3
.L292:
# src/vm.c:1092:         ObjFunction* function = AS_FUNCTION(READ_CONSTANT());
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rax, QWORD PTR 16[rax]	# _1206->function, _1206->function
	mov	rdx, QWORD PTR 64[rax]	# _1208, _1207->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _1209, frame_1434->ip
	lea	rcx, 1[rax]	# tmp3654,
	mov	QWORD PTR 8[r14], rcx	# frame_1434->ip, tmp3654
	movzx	eax, BYTE PTR [rax]	# _1212, *_1209
	mov	rdi, QWORD PTR [rdx+rax*8]	# _1216, *_1214
	and	rdi, rbp	# _1216, tmp3974
# src/vm.c:1093:         ObjClosure* closure = newClosure(function);
	call	"newClosure"@PLT	#
	mov	rsi, rax	# closure,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _2183, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r12	# _2183, tmp3975
	je	.L91	#,
# src/vm.c:1094:         push(OBJ_VAL(closure));
	movabs	rdx, -1125899906842624	# tmp3660,
# src/vm.c:1095:         for (int i = 0; i < closure->upvalueCount; i++) {
	mov	r9d, DWORD PTR 32[rsi]	# prephitmp_2764, closure_1531->upvalueCount
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp3663,
# src/vm.c:1094:         push(OBJ_VAL(closure));
	or	rdx, rsi	# tmp3661, closure
	mov	QWORD PTR -8[rax], rdx	# *_2183, tmp3661
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3663
# src/vm.c:1102:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# prephitmp_2772, frame_1434->ip
# src/vm.c:1095:         for (int i = 0; i < closure->upvalueCount; i++) {
	test	r9d, r9d	# prephitmp_2764
	jle	.L293	#,
	mov	rcx, r14	# frame, frame
	xor	r14d, r14d	# ivtmp.234
	jmp	.L302	#
	.p2align 4,,10
	.p2align 3
.L294:
# src/vm.c:1100:                 : frame->closure->upvalues[index];
	mov	rdx, QWORD PTR [rcx]	# frame_1434->closure, frame_1434->closure
# src/vm.c:1100:                 : frame->closure->upvalues[index];
	mov	rdx, QWORD PTR 24[rdx]	# _1226->upvalues, _1226->upvalues
	mov	rdi, QWORD PTR [rdx+rax*8]	# createdUpvalue, *_1230
	mov	rax, r8	# prephitmp_2772, _1221
.L301:
# src/vm.c:1098:             closure->upvalues[i] = isLocal
	mov	rdx, QWORD PTR 24[rsi]	# closure_1531->upvalues, closure_1531->upvalues
	mov	QWORD PTR [rdx+r14*8], rdi	# *_1234, createdUpvalue
# src/vm.c:1095:         for (int i = 0; i < closure->upvalueCount; i++) {
	add	r14, 1	# ivtmp.234,
	cmp	r9d, r14d	# prephitmp_2764, ivtmp.234
	jle	.L561	#,
.L302:
# src/vm.c:1096:             uint8_t isLocal = READ_BYTE();
	lea	rdx, 1[rax]	# tmp3664,
# src/vm.c:1097:             uint8_t index   = READ_BYTE();
	lea	r8, 2[rax]	# _1221,
# src/vm.c:1096:             uint8_t isLocal = READ_BYTE();
	mov	QWORD PTR 8[rcx], rdx	# frame_1434->ip, tmp3664
# src/vm.c:1096:             uint8_t isLocal = READ_BYTE();
	movzx	edx, BYTE PTR [rax]	# isLocal, *prephitmp_2836
# src/vm.c:1097:             uint8_t index   = READ_BYTE();
	mov	QWORD PTR 8[rcx], r8	# frame_1434->ip, _1221
# src/vm.c:1099:                 ? captureUpvalue(frame->slots + index)
	movzx	eax, BYTE PTR 1[rax]	# _2840, MEM[(uint8_t *)prephitmp_2836 + 1B]
# src/vm.c:1100:                 : frame->closure->upvalues[index];
	lea	rdi, 0[0+rax*8]	# _2841,
# src/vm.c:1100:                 : frame->closure->upvalues[index];
	test	dl, dl	# isLocal
	je	.L294	#,
# src/vm.c:292:     ObjUpvalue* upvalue = vm.openUpvalues;
	mov	r13, QWORD PTR 8390232[r15]	# upvalue, vm.openUpvalues
# src/vm.c:1099:                 ? captureUpvalue(frame->slots + index)
	add	rdi, QWORD PTR 16[rcx]	# _1225, frame_1434->slots
# src/vm.c:291:     ObjUpvalue* prevUpvalue = NULL;
	xor	edx, edx	# prevUpvalue
# src/vm.c:293:     while (upvalue != NULL && upvalue->location > local) {
	test	r13, r13	# upvalue
	jne	.L295	#,
	jmp	.L562	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L298:
# src/vm.c:295:         upvalue = upvalue->next;
	mov	rax, QWORD PTR 32[r13]	# upvalue, upvalue_612->next
	mov	rdx, r13	# prevUpvalue, upvalue
# src/vm.c:293:     while (upvalue != NULL && upvalue->location > local) {
	test	rax, rax	# upvalue
	je	.L348	#,
	mov	r13, rax	# upvalue, upvalue
.L295:
# src/vm.c:293:     while (upvalue != NULL && upvalue->location > local) {
	cmp	rdi, QWORD PTR 16[r13]	# _1225, upvalue_612->location
	jb	.L298	#,
# src/vm.c:298:     if (upvalue != NULL && upvalue->location == local) {
	je	.L563	#,
.L297:
	mov	QWORD PTR 24[rsp], rsi	# %sfp, closure
	mov	QWORD PTR 16[rsp], rcx	# %sfp, frame
	mov	QWORD PTR 8[rsp], rdx	# %sfp, prevUpvalue
# src/vm.c:302:     ObjUpvalue* createdUpvalue = newUpvalue(local);
	call	"newUpvalue"@PLT	#
# src/vm.c:305:     if (prevUpvalue == NULL) {
	mov	rdx, QWORD PTR 8[rsp]	# prevUpvalue, %sfp
	mov	rcx, QWORD PTR 16[rsp]	# frame, %sfp
# src/vm.c:303:     createdUpvalue->next = upvalue;
	mov	QWORD PTR 32[rax], r13	# createdUpvalue_2559->next, upvalue
# src/vm.c:305:     if (prevUpvalue == NULL) {
	mov	rsi, QWORD PTR 24[rsp]	# closure, %sfp
# src/vm.c:302:     ObjUpvalue* createdUpvalue = newUpvalue(local);
	mov	rdi, rax	# createdUpvalue, createdUpvalue
# src/vm.c:305:     if (prevUpvalue == NULL) {
	test	rdx, rdx	# prevUpvalue
	je	.L340	#,
# src/vm.c:308:         prevUpvalue->next = createdUpvalue;
	mov	QWORD PTR 32[rdx], rax	# prevUpvalue_481->next, createdUpvalue
# src/vm.c:1095:         for (int i = 0; i < closure->upvalueCount; i++) {
	mov	r9d, DWORD PTR 32[rsi]	# prephitmp_2764, closure_1531->upvalueCount
# src/vm.c:1102:         DISPATCH();
	mov	rax, QWORD PTR 8[rcx]	# prephitmp_2772, frame_1434->ip
	jmp	.L301	#
	.p2align 4,,10
	.p2align 3
.L215:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2071, vm.stackTop
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	movabs	rcx, 9222246136947933184	# tmp3007,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -8[rax]	# _2072, MEM[(Value *)_2071 + -8B]
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	mov	rdx, rsi	# tmp4083, _2072
	not	rdx	# tmp4083
	test	rdx, rcx	# tmp4083, tmp3007
	je	.L216	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# _2073, MEM[(Value *)_2071 + -16B]
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	mov	rdi, rdx	# tmp4082, _2073
	not	rdi	# tmp4082
	test	rdi, rcx	# tmp4082, tmp3007
	je	.L216	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -16[rax]	# _2076,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp3019,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2076
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, rdi	# _2076, tmp3019
	je	.L91	#,
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	movq	xmm0, rdx	# _860, _2073
	movq	xmm2, rsi	# tmp4249, _2072
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp3022,
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	mulsd	xmm0, xmm2	# _860, tmp4249
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2071 + -16B], _860
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3022
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _861, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3023,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3023
	movzx	eax, BYTE PTR [rax]	# _864, *_861
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_864]
	.p2align 4,,10
	.p2align 3
.L212:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2062, vm.stackTop
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	movabs	rcx, 9222246136947933184	# tmp2984,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -8[rax]	# _2063, MEM[(Value *)_2062 + -8B]
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	mov	rdx, rsi	# tmp4085, _2063
	not	rdx	# tmp4085
	test	rdx, rcx	# tmp4085, tmp2984
	je	.L213	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# _2064, MEM[(Value *)_2062 + -16B]
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	mov	rdi, rdx	# tmp4084, _2064
	not	rdi	# tmp4084
	test	rdi, rcx	# tmp4084, tmp2984
	je	.L213	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -16[rax]	# _2067,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp2996,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2067
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, rdi	# _2067, tmp2996
	je	.L91	#,
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	movq	xmm0, rdx	# _846, _2064
	movq	xmm7, rsi	# tmp4245, _2063
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp2999,
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	subsd	xmm0, xmm7	# _846, tmp4245
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2062 + -16B], _846
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2999
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _847, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3000,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3000
	movzx	eax, BYTE PTR [rax]	# _850, *_847
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_850]
	.p2align 4,,10
	.p2align 3
.L319:
# src/vm.c:1134:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1312, frame_1434->ip
# src/vm.c:1133:         vm.handlerCount--;
	sub	DWORD PTR 8392288[r15], 1	# vm.handlerCount,
# src/vm.c:1134:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3762,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3762
	movzx	eax, BYTE PTR [rax]	# _1315, *_1312
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1315]
	.p2align 4,,10
	.p2align 3
.L250:
# src/vm.c:161:     vm.stackTop--;
	mov	rdx, QWORD PTR 8392312[r15]	# _2149, vm.stackTop
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	movabs	rdi, 9222246136947933185	# tmp3242,
# src/vm.c:935:         push(BOOL_VAL(isFalsey(pop())));
	movabs	rax, 9222246136947933187	# iftmp.63_1450,
# src/vm.c:162:     return *vm.stackTop;
	mov	rcx, QWORD PTR -8[rdx]	# _2151, MEM[(Value *)_2149 + -8B]
# src/vm.c:161:     vm.stackTop--;
	lea	rsi, -8[rdx]	# _2150,
	mov	QWORD PTR 8392312[r15], rsi	# vm.stackTop, _2150
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	cmp	rcx, rdi	# _2151, tmp3242
	je	.L251	#,
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	mov	rdi, rcx	# _2148, _2151
	or	rdi, 1	# _2148,
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	cmp	rdi, rax	# _2148, iftmp.63_1450
	sete	dil	#, _2660
# src/vm.c:331:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	cmp	rcx, rax	# _2151, iftmp.63_1450
	movabs	rcx, 9222246136947933186	# tmp3252,
	setne	al	#, _2655
	movzx	eax, al	# _2655, _2655
	and	rax, rdi	# _2059, _2660
	add	rax, rcx	# iftmp.63_1450, tmp3252
.L251:
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rsi, r12	# _2150, tmp3975
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rdx], rax	# MEM[(Value *)_2149 + -8B], iftmp.63_1450
# src/vm.c:936:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _991, frame_1434->ip
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2149
# src/vm.c:936:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3255,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3255
	movzx	eax, BYTE PTR [rax]	# _994, *_991
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_994]
	.p2align 4,,10
	.p2align 3
.L239:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2116, vm.stackTop
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	movabs	rdx, 9222246136947933184	# tmp3137,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -8[rax]	# _2117, MEM[(Value *)_2116 + -8B]
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	mov	rsi, rcx	# tmp4073, _2117
	not	rsi	# tmp4073
	test	rsi, rdx	# tmp4073, tmp3137
	je	.L240	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -16[rax]	# _2118, MEM[(Value *)_2116 + -16B]
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	mov	rdi, rsi	# tmp4072, _2118
	not	rdi	# tmp4072
	test	rdi, rdx	# tmp4072, tmp3137
	je	.L240	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _2121,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp3149,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2121
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rdi	# _2121, tmp3149
	je	.L91	#,
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	movq	xmm7, rcx	# tmp4271, _2117
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	movq	xmm2, rsi	# tmp4272, _2118
	pxor	xmm0, xmm0	# _937
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp3155,
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	cvttsd2si	edx, xmm7	# b_1646, tmp4271
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	cvttsd2si	ecx, xmm2	# a_1647, tmp4272
	xor	edx, ecx	# _936, a_1647
	cvtsi2sd	xmm0, edx	# _937, _936
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2116 + -16B], _937
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3155
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _938, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3156,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3156
	movzx	eax, BYTE PTR [rax]	# _941, *_938
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_941]
	.p2align 4,,10
	.p2align 3
.L221:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	r13, QWORD PTR 8392312[r15]	# _2089, vm.stackTop
# src/vm.c:902:         if (!IS_NUMBER(peek(0)) || !IS_NUMBER(peek(1))) {
	movabs	rax, 9222246136947933184	# tmp3053,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[r13]	# _2090, MEM[(Value *)_2089 + -8B]
# src/vm.c:902:         if (!IS_NUMBER(peek(0)) || !IS_NUMBER(peek(1))) {
	mov	rcx, rdx	# tmp4079, _2090
	not	rcx	# tmp4079
	test	rcx, rax	# tmp4079, tmp3053
	je	.L222	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -16[r13]	# _2091, MEM[(Value *)_2089 + -16B]
# src/vm.c:902:         if (!IS_NUMBER(peek(0)) || !IS_NUMBER(peek(1))) {
	mov	rsi, rcx	# tmp4078, _2091
	not	rsi	# tmp4078
	test	rsi, rax	# tmp4078, tmp3053
	je	.L222	#,
	movq	xmm1, rdx	# _2095, _2090
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	pxor	xmm0, xmm0	# tmp3065
# src/vm.c:161:     vm.stackTop--;
	lea	rsi, -16[r13]	# _2093,
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _2091
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	ucomisd	xmm1, xmm0	# _2095, tmp3065
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rsi	# vm.stackTop, _2093
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	jp	.L355	#,
	je	.L224	#,
.L355:
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	cvttsd2si	rax, QWORD PTR 8[rsp]	# _888, %sfp
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	pxor	xmm0, xmm0	# _889
	cvtsi2sd	xmm0, rax	# _889, _888
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	ucomisd	xmm0, QWORD PTR 8[rsp]	# _889, %sfp
	jp	.L224	#,
	jne	.L224	#,
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	cvttsd2si	rcx, xmm1	# _890, _2095
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	pxor	xmm0, xmm0	# _891
	cvtsi2sd	xmm0, rcx	# _891, _890
# src/vm.c:911:         if (b != 0 && (int64_t)a == a && (int64_t)b == b)
	ucomisd	xmm0, xmm1	# _891, _2095
	jp	.L224	#,
	jne	.L224	#,
# src/vm.c:912:             result = (double)((int64_t)a % (int64_t)b);
	cqo
# src/vm.c:912:             result = (double)((int64_t)a % (int64_t)b);
	pxor	xmm2, xmm2	# result
# src/vm.c:912:             result = (double)((int64_t)a % (int64_t)b);
	idiv	rcx	# _890
# src/vm.c:912:             result = (double)((int64_t)a % (int64_t)b);
	cvtsi2sd	xmm2, rdx	# result, _892
	jmp	.L228	#
.L224:
# src/vm.c:914:             result = fmod(a, b);
	movsd	QWORD PTR 16[rsp], xmm1	# %sfp, _2095
	fld	QWORD PTR 16[rsp]	# %sfp
	fld	QWORD PTR 8[rsp]	# %sfp
.L229:
	fprem	
	fnstsw	ax	# tmp3074
	sahf	
	jp	.L229	#,
	fstp	st(1)		#
	fstp	QWORD PTR 16[rsp]	# %sfp
	movsd	xmm2, QWORD PTR 16[rsp]	# result, %sfp
	ucomisd	xmm2, xmm2	# result, result
	jp	.L564	#,
.L228:
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rax, "vm"[rip+8390152]	# tmp3075,
	cmp	rsi, rax	# _2093, tmp3075
	je	.L91	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rax, -8[r13]	# tmp3077,
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -16[r13], xmm2	# MEM[(Value *)_2089 + -16B], result
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3077
# src/vm.c:916:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _893, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3078,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3078
	movzx	eax, BYTE PTR [rax]	# _896, *_893
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_896]
	.p2align 4,,10
	.p2align 3
.L208:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 8392312[r15]	# _2048, vm.stackTop
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, -1125899906842624	# tmp2925,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR -8[rdx]	# _2049, MEM[(Value *)_2048 + -8B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rsi, rax	# _2044, _2049
	and	rsi, rcx	# _2044, tmp2925
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rsi, rcx	# _2044, tmp2925
	je	.L565	#,
# src/vm.c:886:         } else if (IS_NUMBER(peek(0)) && IS_NUMBER(peek(1))) {
	movabs	rsi, 9222246136947933184	# tmp2962,
# src/vm.c:886:         } else if (IS_NUMBER(peek(0)) && IS_NUMBER(peek(1))) {
	mov	rcx, rax	# tmp4087, _2049
	not	rcx	# tmp4087
	test	rcx, rsi	# tmp4087, tmp2962
	je	.L210	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -16[rdx]	# _2055, MEM[(Value *)_2048 + -16B]
# src/vm.c:886:         } else if (IS_NUMBER(peek(0)) && IS_NUMBER(peek(1))) {
	mov	rdi, rcx	# tmp4086, _2055
	not	rdi	# tmp4086
	test	rdi, rsi	# tmp4086, tmp2962
	je	.L210	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rsi, -16[rdx]	# _2058,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp2968,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rsi	# vm.stackTop, _2058
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rsi, rdi	# _2058, tmp2968
	je	.L91	#,
# src/vm.c:889:             push(NUMBER_VAL(a + b));
	movq	xmm0, rcx	# _826, _2055
	movq	xmm6, rax	# tmp4241, _2049
# src/vm.c:161:     vm.stackTop--;
	lea	rsi, -8[rdx]	# _2061,
# src/vm.c:889:             push(NUMBER_VAL(a + b));
	addsd	xmm0, xmm6	# _826, tmp4241
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -16[rdx], xmm0	# MEM[(Value *)_2048 + -16B], _826
.L211:
# src/vm.c:896:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _833, frame_1434->ip
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rsi	# vm.stackTop, _2061
# src/vm.c:896:         DISPATCH();
	lea	rdx, 1[rax]	# tmp2977,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2977
	movzx	eax, BYTE PTR [rax]	# _836, *_833
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_836]
	.p2align 4,,10
	.p2align 3
.L203:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2036, vm.stackTop
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	movabs	rdx, 9222246136947933184	# tmp2902,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -8[rax]	# _2037, MEM[(Value *)_2036 + -8B]
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	mov	rsi, rcx	# tmp4089, _2037
	not	rsi	# tmp4089
	test	rsi, rdx	# tmp4089, tmp2902
	je	.L204	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -16[rax]	# _2038, MEM[(Value *)_2036 + -16B]
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	mov	rdi, rsi	# tmp4088, _2038
	not	rdi	# tmp4088
	test	rdi, rdx	# tmp4088, tmp2902
	je	.L204	#,
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	movq	xmm7, rcx	# tmp4233, _2037
	movq	xmm5, rsi	# tmp4234, _2038
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _2040,
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	movabs	rdi, 9222246136947933187	# iftmp.51_1449,
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	comisd	xmm7, xmm5	# tmp4233, tmp4234
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2040
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	jbe	.L566	#,
.L206:
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, "vm"[rip+8390152]	# tmp2915,
	cmp	rdx, rcx	# _2040, tmp2915
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -16[rax], rdi	# MEM[(Value *)_2036 + -16B], iftmp.51_1449
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp2917,
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2917
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _819, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2918,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2918
	movzx	eax, BYTE PTR [rax]	# _822, *_819
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_822]
	.p2align 4,,10
	.p2align 3
.L218:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# _2080, vm.stackTop
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	movabs	rcx, 9222246136947933184	# tmp3030,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -8[rax]	# _2081, MEM[(Value *)_2080 + -8B]
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	mov	rdx, rsi	# tmp4081, _2081
	not	rdx	# tmp4081
	test	rdx, rcx	# tmp4081, tmp3030
	je	.L219	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# _2082, MEM[(Value *)_2080 + -16B]
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	mov	rdi, rdx	# tmp4080, _2082
	not	rdi	# tmp4080
	test	rdi, rcx	# tmp4080, tmp3030
	je	.L219	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -16[rax]	# _2085,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp3042,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2085
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, rdi	# _2085, tmp3042
	je	.L91	#,
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	movq	xmm0, rdx	# _874, _2082
	movq	xmm3, rsi	# tmp4253, _2081
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp3045,
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	divsd	xmm0, xmm3	# _874, tmp4253
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[rax], xmm0	# MEM[(Value *)_2080 + -16B], _874
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp3045
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _875, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3046,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3046
	movzx	eax, BYTE PTR [rax]	# _878, *_875
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_878]
	.p2align 4,,10
	.p2align 3
.L350:
# src/vm.c:293:     while (upvalue != NULL && upvalue->location > local) {
	xor	r13d, r13d	# upvalue
	jmp	.L308	#
	.p2align 4,,10
	.p2align 3
.L348:
	xor	r13d, r13d	# upvalue
	jmp	.L297	#
	.p2align 4,,10
	.p2align 3
.L561:
	mov	r14, rcx	# frame, frame
.L293:
# src/vm.c:1102:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3672,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3672
	movzx	eax, BYTE PTR [rax]	# _1239, *prephitmp_2776
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1239]
	.p2align 4,,10
	.p2align 3
.L556:
	mov	r14, rcx	# frame, frame
.L304:
# src/vm.c:1115:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3703,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3703
	movzx	eax, BYTE PTR [rax]	# _1283, *prephitmp_2761
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1283]
.L557:
	mov	QWORD PTR 16[rsp], rsi	# %sfp, closure
	mov	QWORD PTR 8[rsp], rcx	# %sfp, frame
# src/vm.c:302:     ObjUpvalue* createdUpvalue = newUpvalue(local);
	call	"newUpvalue"@PLT	#
	mov	rcx, QWORD PTR 8[rsp]	# frame, %sfp
	mov	rsi, QWORD PTR 16[rsp]	# closure, %sfp
# src/vm.c:303:     createdUpvalue->next = upvalue;
	mov	QWORD PTR 32[rax], 0	# createdUpvalue_2131->next,
# src/vm.c:302:     ObjUpvalue* createdUpvalue = newUpvalue(local);
	mov	rdi, rax	# createdUpvalue, createdUpvalue
.L341:
# src/vm.c:1108:         for (int i = 0; i < closure->upvalueCount; i++) {
	mov	r9d, DWORD PTR 32[rsi]	# prephitmp_2749, closure_1517->upvalueCount
# src/vm.c:1115:         DISPATCH();
	mov	rax, QWORD PTR 8[rcx]	# prephitmp_2757, frame_1434->ip
# src/vm.c:306:         vm.openUpvalues = createdUpvalue;
	mov	QWORD PTR 8390232[r15], rdi	# vm.openUpvalues, createdUpvalue
	jmp	.L312	#
.L562:
	mov	QWORD PTR 16[rsp], rsi	# %sfp, closure
	mov	QWORD PTR 8[rsp], rcx	# %sfp, frame
# src/vm.c:302:     ObjUpvalue* createdUpvalue = newUpvalue(local);
	call	"newUpvalue"@PLT	#
	mov	rcx, QWORD PTR 8[rsp]	# frame, %sfp
	mov	rsi, QWORD PTR 16[rsp]	# closure, %sfp
# src/vm.c:303:     createdUpvalue->next = upvalue;
	mov	QWORD PTR 32[rax], 0	# createdUpvalue_1443->next,
# src/vm.c:302:     ObjUpvalue* createdUpvalue = newUpvalue(local);
	mov	rdi, rax	# createdUpvalue, createdUpvalue
.L340:
# src/vm.c:1095:         for (int i = 0; i < closure->upvalueCount; i++) {
	mov	r9d, DWORD PTR 32[rsi]	# prephitmp_2764, closure_1531->upvalueCount
# src/vm.c:1102:         DISPATCH();
	mov	rax, QWORD PTR 8[rcx]	# prephitmp_2772, frame_1434->ip
# src/vm.c:306:         vm.openUpvalues = createdUpvalue;
	mov	QWORD PTR 8390232[r15], rdi	# vm.openUpvalues, createdUpvalue
	jmp	.L301	#
.L164:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	mov	rsi, QWORD PTR 168[rsp]	# _2461, MEM[(long unsigned int *)_2002]
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	mov	rdi, QWORD PTR -8[rax]	# MEM[(Value *)_2463 + -8B], MEM[(Value *)_2463 + -8B]
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	and	rsi, rbp	# _2461, tmp3974
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	call	"newBoundMethod"@PLT	#
# src/vm.c:161:     vm.stackTop--;
	mov	rdx, QWORD PTR 8392312[r15]	# _2466, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2635,
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -8[rdx]	# _2467,
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2467
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, rsi	# _2467, tmp2635
	je	.L91	#,
# src/vm.c:286:     push(OBJ_VAL(bound));
	movabs	rcx, -1125899906842624	# tmp2636,
	or	rax, rcx	# tmp2637, tmp2636
	mov	QWORD PTR -8[rdx], rax	# MEM[(Value *)_2466 + -8B], tmp2637
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2466
	jmp	.L165	#
.L161:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	mov	rsi, QWORD PTR 160[rsp]	# _2443, method
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	mov	rdi, QWORD PTR -8[rax]	# MEM[(Value *)_2445 + -8B], MEM[(Value *)_2445 + -8B]
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	and	rsi, rbp	# _2443, tmp3974
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	call	"newBoundMethod"@PLT	#
# src/vm.c:161:     vm.stackTop--;
	mov	rdx, QWORD PTR 8392312[r15]	# _2448, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2599,
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -8[rdx]	# _2449,
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2449
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, rsi	# _2449, tmp2599
	je	.L91	#,
# src/vm.c:286:     push(OBJ_VAL(bound));
	movabs	rcx, -1125899906842624	# tmp2600,
	or	rax, rcx	# tmp2601, tmp2600
	mov	QWORD PTR -8[rdx], rax	# MEM[(Value *)_2448 + -8B], tmp2601
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _2448
	jmp	.L162	#
.L287:
# src/vm.c:241:     return call(AS_CLOSURE(method), argCount);
	mov	rcx, QWORD PTR 168[rsp]	# _2534, MEM[(long unsigned int *)_2002]
# src/vm.c:1082:         int argCount = READ_BYTE();
	movzx	eax, r14b	# argCount, _1196
# src/vm.c:241:     return call(AS_CLOSURE(method), argCount);
	and	rcx, rbp	# _2534, tmp3974
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	rdx, QWORD PTR 16[rcx]	# _2541, _2534->function
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	esi, DWORD PTR 16[rdx]	# _2542, _2541->arity
# src/vm.c:170:     if (argCount != closure->function->arity) {
	cmp	eax, esi	# argCount, _2542
	jne	.L567	#,
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rax, DWORD PTR 1536[r15]	#, vm.frameCount
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	cmp	eax, 64	# _2779,
	je	.L434	#,
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	rdx, QWORD PTR 32[rdx]	# _2541->chunk.code, _2541->chunk.code
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	esi, 1[rax]	# tmp3588,
	mov	DWORD PTR 1536[r15], esi	# vm.frameCount, tmp3588
# src/vm.c:182:     frame->closure = closure;
	lea	rsi, [rax+rax*2]	# tmp3594,
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	QWORD PTR 8[r15+rsi*8], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_2544].ip, _2541->chunk.code
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	movzx	edx, r14b	# _2548, _1196
# src/vm.c:182:     frame->closure = closure;
	mov	QWORD PTR [r15+rsi*8], rcx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_2544].closure, _2534
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	sal	rdx, 3	# _2549,
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	rcx, -8	# tmp3618,
	sub	rcx, rdx	# _2550, _2549
	add	rcx, QWORD PTR 8392312[r15]	# _2550, vm.stackTop
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[r15+rsi*8], rcx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_2544].slots, _2550
	jmp	.L291	#
.L281:
# src/vm.c:241:     return call(AS_CLOSURE(method), argCount);
	mov	rcx, QWORD PTR 168[rsp]	# _2510, MEM[(long unsigned int *)_2002]
# src/vm.c:1072:         int argCount = READ_BYTE();
	movzx	eax, r14b	# argCount, _1165
# src/vm.c:241:     return call(AS_CLOSURE(method), argCount);
	and	rcx, rbp	# _2510, tmp3974
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	rdx, QWORD PTR 16[rcx]	# _2517, _2510->function
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	esi, DWORD PTR 16[rdx]	# _2518, _2517->arity
# src/vm.c:170:     if (argCount != closure->function->arity) {
	cmp	eax, esi	# argCount, _2518
	jne	.L568	#,
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rax, DWORD PTR 1536[r15]	#, vm.frameCount
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	cmp	eax, 64	# _2783,
	je	.L434	#,
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	rdx, QWORD PTR 32[rdx]	# _2517->chunk.code, _2517->chunk.code
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	esi, 1[rax]	# tmp3498,
	mov	DWORD PTR 1536[r15], esi	# vm.frameCount, tmp3498
# src/vm.c:182:     frame->closure = closure;
	lea	rsi, [rax+rax*2]	# tmp3504,
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	QWORD PTR 8[r15+rsi*8], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_2520].ip, _2517->chunk.code
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	movzx	edx, r14b	# _2524, _1165
# src/vm.c:182:     frame->closure = closure;
	mov	QWORD PTR [r15+rsi*8], rcx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_2520].closure, _2510
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	sal	rdx, 3	# _2525,
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	rcx, -8	# tmp3528,
	sub	rcx, rdx	# _2526, _2525
	add	rcx, QWORD PTR 8392312[r15]	# _2526, vm.stackTop
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[r15+rsi*8], rcx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_2520].slots, _2526
	jmp	.L285	#
.L115:
# src/vm.c:608:         if (!tableGet(&vm.globals, name, &dummy)) {
	lea	rax, "vm"[rip+8390152]	# tmp2261,
	lea	rdx, 104[rsp]	# tmp2260,
	mov	rsi, r13	#, name
	mov	rdi, rax	#, tmp2261
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp2261
	call	"tableGet"@PLT	#
# src/vm.c:608:         if (!tableGet(&vm.globals, name, &dummy)) {
	test	al, al	# _283
	jne	.L117	#,
# src/vm.c:610:             runtimeError("Undefined variable '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1855->chars, name_1855->chars
	lea	rdi, .LC12[rip]	#,
	call	"runtimeError"	#
# src/vm.c:611:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:611:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _286, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2264,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2264
	movzx	eax, BYTE PTR [rax]	# _289, *_286
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_289]
.L111:
# src/vm.c:589:         if (!tableGet(&vm.globals, name, &dummy)) {
	lea	rax, "vm"[rip+8390152]	# tmp2223,
	lea	rdx, 88[rsp]	# tmp2222,
	mov	rsi, r13	#, name
	mov	rdi, rax	#, tmp2223
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp2223
	call	"tableGet"@PLT	#
# src/vm.c:589:         if (!tableGet(&vm.globals, name, &dummy)) {
	test	al, al	# _242
	jne	.L113	#,
# src/vm.c:591:             runtimeError("Undefined variable '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1867->chars, name_1867->chars
	lea	rdi, .LC12[rip]	#,
	call	"runtimeError"	#
# src/vm.c:592:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:592:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _245, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2226,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2226
	movzx	eax, BYTE PTR [rax]	# _248, *_245
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_248]
.L434:
# src/vm.c:177:         runtimeError("Call stack overflow.");
	lea	rdi, .LC7[rip]	#,
	xor	eax, eax	#
	call	"runtimeError"	#
.L104:
# src/vm.c:550:             return INTERPRET_RUNTIME_ERROR;
	mov	eax, 2	# <retval>,
.L86:
# src/vm.c:1201: }
	mov	rdx, QWORD PTR 184[rsp]	# tmp4097, D.8136
	sub	rdx, QWORD PTR fs:40	# tmp4097, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L569	#,
	add	rsp, 200	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx	#
	.cfi_def_cfa_offset 48
	pop	rbp	#
	.cfi_def_cfa_offset 40
	pop	r12	#
	.cfi_def_cfa_offset 32
	pop	r13	#
	.cfi_def_cfa_offset 24
	pop	r14	#
	.cfi_def_cfa_offset 16
	pop	r15	#
	.cfi_def_cfa_offset 8
	ret	
.L216:
	.cfi_restore_state
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:899:     CASE(OP_MULTIPLY): BINARY_OP(NUMBER_VAL, *); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _855, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3013,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3013
	movzx	eax, BYTE PTR [rax]	# _858, *_855
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_858]
.L219:
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:900:     CASE(OP_DIVIDE):   BINARY_OP(NUMBER_VAL, /); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _869, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3036,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3036
	movzx	eax, BYTE PTR [rax]	# _872, *_869
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_872]
.L237:
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:919:     CASE(OP_BITOR):    BIT_OP(NUMBER_VAL, |);  DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _916, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3117,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3117
	movzx	eax, BYTE PTR [rax]	# _919, *_916
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_919]
.L240:
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:920:     CASE(OP_BITXOR):   BIT_OP(NUMBER_VAL, ^);  DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _931, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3143,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3143
	movzx	eax, BYTE PTR [rax]	# _934, *_931
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_934]
.L246:
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:922:     CASE(OP_BITRIGHT): BIT_SHIFT_OP(>>);       DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _963, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3198,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3198
	movzx	eax, BYTE PTR [rax]	# _966, *_963
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_966]
.L234:
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:918:     CASE(OP_BITAND):   BIT_OP(NUMBER_VAL, &);  DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _901, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3091,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3091
	movzx	eax, BYTE PTR [rax]	# _904, *_901
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_904]
.L213:
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:898:     CASE(OP_SUBTRACT): BINARY_OP(NUMBER_VAL, -); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _841, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2990,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2990
	movzx	eax, BYTE PTR [rax]	# _844, *_841
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_844]
.L199:
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _801, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2885,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2885
	movzx	eax, BYTE PTR [rax]	# _804, *_801
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_804]
.L243:
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:921:     CASE(OP_BITLEFT):  BIT_SHIFT_OP(<<);       DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _946, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3169,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3169
	movzx	eax, BYTE PTR [rax]	# _949, *_946
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_949]
.L204:
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	xor	eax, eax	#
	lea	rdi, .LC25[rip]	#,
	call	"runtimeError"	#
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _814, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2908,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2908
	movzx	eax, BYTE PTR [rax]	# _817, *_814
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_817]
.L222:
# src/vm.c:904:             runtimeError("Operands to modulus must be two numbers.");
	xor	eax, eax	#
	lea	rdi, .LC27[rip]	#,
	call	"runtimeError"	#
# src/vm.c:905:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:905:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _883, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3059,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3059
	movzx	eax, BYTE PTR [rax]	# _886, *_883
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_886]
.L565:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, 1125899906842623	# tmp2927,
	and	rax, rcx	# _2049, tmp2927
	mov	r13, rax	# _2046, _2049
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _2046->type,
	je	.L570	#,
.L210:
# src/vm.c:892:             runtimeError("Operands to addition must be two numbers or two strings.");
	xor	eax, eax	#
	lea	rdi, .LC26[rip]	#,
	call	"runtimeError"	#
# src/vm.c:893:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:893:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _828, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2971,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2971
	movzx	eax, BYTE PTR [rax]	# _831, *_828
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_831]
.L558:
# src/vm.c:298:     if (upvalue != NULL && upvalue->location == local) {
	mov	rax, r8	# prephitmp_2757, _1265
# src/vm.c:299:         return upvalue;
	mov	rdi, r13	# createdUpvalue, upvalue
	jmp	.L312	#
.L563:
# src/vm.c:298:     if (upvalue != NULL && upvalue->location == local) {
	mov	rax, r8	# prephitmp_2772, _1221
# src/vm.c:299:         return upvalue;
	mov	rdi, r13	# createdUpvalue, upvalue
	jmp	.L301	#
.L550:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rsi, 1125899906842623	# tmp2548,
	and	rax, rsi	# _1962, tmp2548
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 5	# _1962->type,
	jne	.L156	#,
# src/vm.c:747:         tableSet(&instance->fields, READ_STRING_LONG(), peek(0));
	mov	rcx, QWORD PTR 8[r14]	# _546, frame_1434->ip
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdi, QWORD PTR -8[rdx]	# _1970, MEM[(Value *)_1964 + -8B]
# src/vm.c:747:         tableSet(&instance->fields, READ_STRING_LONG(), peek(0));
	lea	rdx, 3[rcx]	# tmp2550,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2550
	mov	rdx, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	r8, QWORD PTR 16[rdx]	# _548->function, _548->function
	movzx	edx, BYTE PTR 2[rcx]	# _558, MEM[(uint8_t *)_546 + 2B]
	movzx	ecx, WORD PTR [rcx]	# _556, MEM <short unsigned int> [(uint8_t *)_546]
	sal	edx, 16	# _559,
	or	edx, ecx	# _561, _556
	mov	rcx, QWORD PTR 64[r8]	# _549->chunk.constants.values, _549->chunk.constants.values
	and	rsi, QWORD PTR [rcx+rdx*8]	# _565, *_563
# src/vm.c:747:         tableSet(&instance->fields, READ_STRING_LONG(), peek(0));
	mov	rdx, rdi	#, _1970
	lea	rdi, 24[rax]	#,
	call	"tableSet"@PLT	#
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _1967, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2565,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _1966,
# src/vm.c:162:     return *vm.stackTop;
	mov	rcx, QWORD PTR -8[rax]	# _1969, MEM[(Value *)_1967 + -8B]
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _1966
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rsi	# _1966, tmp2565
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -16[rax], rcx	# MEM[(Value *)_1967 + -16B], _1969
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp2572,
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2572
# src/vm.c:751:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _568, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2573,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2573
	movzx	eax, BYTE PTR [rax]	# _571, *_568
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_571]
.L551:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	r9, 1125899906842623	# tmp2417,
	mov	rcx, rdx	# _1936, _1936
	and	rcx, r9	# _1936, tmp2417
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	eax, DWORD PTR [rcx]	# _1934, _1933->type
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	eax, 6	# _1934,
	je	.L571	#,
	cmp	eax, 5	# _1934,
	je	.L572	#,
	test	eax, eax	# _1934
	jne	.L136	#,
# src/vm.c:706:             ObjString* name = READ_STRING_LONG();
	mov	rsi, QWORD PTR 8[r14]	# _475, frame_1434->ip
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	QWORD PTR 24[rsp], rcx	# %sfp, _1933
	lea	rdx, 3[rsi]	# pretmp_2828,
	mov	rdi, QWORD PTR 16[rax]	# _477->function, _477->function
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, pretmp_2828
	movzx	eax, BYTE PTR 2[rsi]	# _487, MEM[(uint8_t *)_475 + 2B]
	movzx	esi, WORD PTR [rsi]	# _485, MEM <short unsigned int> [(uint8_t *)_475]
	mov	QWORD PTR 16[rsp], rdx	# %sfp, pretmp_2828
	sal	eax, 16	# _488,
	or	eax, esi	# _490, _485
	mov	rsi, QWORD PTR 64[rdi]	# _478->chunk.constants.values, _478->chunk.constants.values
	and	r9, QWORD PTR [rsi+rax*8]	# _494, *_492
# src/vm.c:707:             if (strcmp(name->chars, "length") == 0) {
	lea	rsi, .LC15[rip]	#,
# src/vm.c:707:             if (strcmp(name->chars, "length") == 0) {
	mov	rdi, QWORD PTR 24[r9]	# _495, name_1799->chars
# src/vm.c:707:             if (strcmp(name->chars, "length") == 0) {
	mov	QWORD PTR 8[rsp], rdi	# %sfp, _495
	call	"strcmp"@PLT	#
# src/vm.c:707:             if (strcmp(name->chars, "length") == 0) {
	test	eax, eax	# _496
	jne	.L149	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rax, -8[r13]	# _1948,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2497,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _1948
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, rsi	# _1948, tmp2497
	je	.L91	#,
# src/vm.c:709:                 push(NUMBER_VAL(array->size));
	mov	rcx, QWORD PTR 24[rsp]	# _1933, %sfp
	pxor	xmm0, xmm0	# _498
	mov	rdx, QWORD PTR 16[rsp]	# pretmp_2828, %sfp
	cvtsi2sd	xmm0, DWORD PTR 16[rcx]	# _498, MEM[(struct ObjArray *)_1933].size
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[r13], xmm0	# MEM[(Value *)_1935 + -8B], _498
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], r13	# vm.stackTop, _1935
	jmp	.L140	#
.L543:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, 1125899906842623	# tmp3850,
	and	rax, rcx	# _2207, tmp3850
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 2	# _2207->type,
	jne	.L329	#,
# src/vm.c:1166:         ObjClass* subclass = AS_CLASS(peek(0));
	and	rcx, QWORD PTR -8[rdx]	# _1381, MEM[(Value *)_2209 + -8B]
# src/vm.c:1167:         tableAddAll(&AS_CLASS(superclass)->methods, &subclass->methods);
	lea	rdi, 24[rax]	# _1383,
	lea	rsi, 24[rcx]	# _1382,
	call	"tableAddAll"@PLT	#
# src/vm.c:1169:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _1384, frame_1434->ip
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR 8392312[r15], 8	# vm.stackTop,
# src/vm.c:1169:         DISPATCH();
	lea	rdx, 1[rax]	# tmp3862,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3862
	movzx	eax, BYTE PTR [rax]	# _1387, *_1384
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1387]
.L554:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	r8, 1125899906842623	# tmp3287,
	and	rax, r8	# _2159, tmp3287
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _2159->type,
	jne	.L255	#,
# src/vm.c:965:             for (int i = 0; i < format->length; i++) {
	mov	r9d, DWORD PTR 16[rax]	# _1028, MEM[(struct ObjString *)_2159].length
# src/vm.c:965:             for (int i = 0; i < format->length; i++) {
	test	r9d, r9d	# _1028
	jle	.L258	#,
# src/vm.c:949:         int argCount = READ_BYTE();
	mov	DWORD PTR 40[rsp], esi	# %sfp, argCount
# src/vm.c:962:             const char* chars = format->chars;
	mov	rsi, QWORD PTR 24[rax]	# chars, MEM[(struct ObjString *)_2159].chars
# src/vm.c:963:             int argIndex = 1;
	mov	r13d, 1	# argIndex,
	mov	QWORD PTR 56[rsp], rdi	# %sfp, _1015
# src/vm.c:962:             const char* chars = format->chars;
	mov	QWORD PTR 8[rsp], rsi	# %sfp, chars
# src/vm.c:963:             int argIndex = 1;
	mov	QWORD PTR 48[rsp], rdx	# %sfp, args
	mov	QWORD PTR 24[rsp], rax	# %sfp, _2159
	mov	QWORD PTR 16[rsp], r14	# %sfp, frame
	xor	r14d, r14d	# i
.L270:
# src/vm.c:966:                 char c = chars[i];
	mov	rsi, QWORD PTR 8[rsp]	# chars, %sfp
# src/vm.c:966:                 char c = chars[i];
	movsxd	rax, r14d	# _1017, i
# src/vm.c:966:                 char c = chars[i];
	movzx	eax, BYTE PTR [rsi+rax]	# c, *_1018
# src/vm.c:967:                 if (c == '%') {
	cmp	al, 37	# c,
	jne	.L259	#,
# src/vm.c:968:                     if (i + 1 >= format->length) {
	add	r14d, 1	# i,
# src/vm.c:968:                     if (i + 1 >= format->length) {
	cmp	r9d, r14d	# _1028, i
	jle	.L573	#,
# src/vm.c:975:                     if (argIndex >= argCount) {
	cmp	DWORD PTR 40[rsp], r13d	# %sfp, argIndex
	jle	.L574	#,
# src/vm.c:974:                     char spec = chars[++i];
	movsxd	rax, r14d	# _1020, i
# src/vm.c:981:                     Value v = args[argIndex++];
	movsxd	r8, r13d	# _1022, argIndex
# src/vm.c:974:                     char spec = chars[++i];
	movsx	esi, BYTE PTR [rsi+rax]	#, *_1021
# src/vm.c:981:                     Value v = args[argIndex++];
	lea	eax, 1[r13]	# argIndex,
	mov	DWORD PTR 44[rsp], eax	# %sfp, argIndex
# src/vm.c:981:                     Value v = args[argIndex++];
	mov	rax, QWORD PTR 48[rsp]	# args, %sfp
	mov	rdi, QWORD PTR [rax+r8*8]	# v, *_1024
# src/vm.c:982:                     switch (spec) {
	cmp	sil, 111	# spec,
	je	.L262	#,
	cmp	sil, 115	# spec,
	je	.L263	#,
	cmp	sil, 100	# spec,
	jne	.L264	#,
# src/vm.c:984:                             if (!IS_NUMBER(v)) {
	movabs	rcx, 9222246136947933184	# tmp3295,
	mov	rax, rdi	# tmp4062, v
	not	rax	# tmp4062
	test	rax, rcx	# tmp4062, tmp3295
	je	.L575	#,
.L262:
# src/vm.c:1002:                             printValue(v, NULL);
	xor	esi, esi	#
	call	"printValue"@PLT	#
.L266:
# src/vm.c:981:                     Value v = args[argIndex++];
	mov	r13d, DWORD PTR 44[rsp]	# argIndex, %sfp
.L269:
# src/vm.c:965:             for (int i = 0; i < format->length; i++) {
	mov	rax, QWORD PTR 24[rsp]	# _2159, %sfp
# src/vm.c:965:             for (int i = 0; i < format->length; i++) {
	add	r14d, 1	# i,
# src/vm.c:965:             for (int i = 0; i < format->length; i++) {
	mov	r9d, DWORD PTR 16[rax]	# _1028, MEM[(struct ObjString *)_2159].length
# src/vm.c:965:             for (int i = 0; i < format->length; i++) {
	cmp	r9d, r14d	# _1028, i
	jg	.L270	#,
# src/vm.c:1022:         vm.stackTop -= argCount;
	mov	r14, QWORD PTR 16[rsp]	# frame, %sfp
	mov	rdi, QWORD PTR 56[rsp]	# _1015, %sfp
	add	rdi, QWORD PTR 8392312[r15]	# _1015, vm.stackTop
# src/vm.c:1023:         DISPATCH();
	mov	rcx, QWORD PTR 8[r14]	# _1010, frame_1434->ip
# src/vm.c:1022:         vm.stackTop -= argCount;
	mov	rdx, rdi	# args, _1015
.L258:
# src/vm.c:1023:         DISPATCH();
	lea	rax, 1[rcx]	# tmp3311,
# src/vm.c:1022:         vm.stackTop -= argCount;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, args
# src/vm.c:1023:         DISPATCH();
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp3311
	movzx	eax, BYTE PTR [rcx]	# _1040, *prephitmp_2805
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1040]
.L547:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, 1125899906842623	# tmp2648,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR -8[rcx]	# _1983, MEM[(Value *)_1982 + -8B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rdx, rax	# _1979, tmp2648
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	eax, DWORD PTR [rdx]	# _1980, _1979->type
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	eax, 9	# _1980,
	je	.L168	#,
	test	eax, eax	# _1980
	jne	.L167	#,
# src/vm.c:770:         if ((!IS_STRING(val) && !IS_ARRAY(val)) || !IS_NUMBER(indexVal)) {
	movabs	rdi, 9222246136947933184	# tmp3924,
	mov	rax, rsi	# tmp4059, _1983
	not	rax	# tmp4059
	test	rax, rdi	# tmp4059, tmp3924
	je	.L167	#,
# src/vm.c:790:             int index = (int)AS_NUMBER(indexVal);
	movq	xmm7, rsi	# tmp4328, _1983
	cvttsd2si	eax, xmm7	# index, tmp4328
# src/vm.c:791:             if (index < 0 || index >= arr->size) {
	test	eax, eax	# index
	js	.L334	#,
# src/vm.c:791:             if (index < 0 || index >= arr->size) {
	cmp	DWORD PTR 16[rdx], eax	# MEM[(struct ObjArray *)_1979].size, index
	jle	.L334	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rsi, -16[rcx]	# _1995,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, "vm"[rip+8390152]	# tmp2680,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rsi	# vm.stackTop, _1995
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rsi, rdi	# _1995, tmp2680
	je	.L91	#,
# src/vm.c:798:             push(arr->values[index]);
	mov	rdx, QWORD PTR 24[rdx]	# MEM[(struct ObjArray *)_1979].values, MEM[(struct ObjArray *)_1979].values
# src/vm.c:798:             push(arr->values[index]);
	mov	eax, eax	# _648, index
# src/vm.c:161:     vm.stackTop--;
	sub	rcx, 8	# tmp2685,
# src/vm.c:798:             push(arr->values[index]);
	mov	rax, QWORD PTR [rdx+rax*8]	# _651, *_650
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rcx], rax	# MEM[(Value *)_1982 + -16B], _651
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, tmp2685
.L172:
# src/vm.c:800:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _652, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2686,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2686
	movzx	eax, BYTE PTR [rax]	# _655, *_652
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_655]
.L548:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, 1125899906842623	# tmp2520,
	and	rax, rcx	# _1951, tmp2520
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 5	# _1951->type,
	jne	.L151	#,
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rdi, QWORD PTR -8[rdx]	# _1959, MEM[(Value *)_1953 + -8B]
# src/vm.c:733:         tableSet(&instance->fields, READ_STRING(), peek(0));
	mov	rdx, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rdx, QWORD PTR 16[rdx]	# _522->function, _522->function
	mov	rsi, QWORD PTR 64[rdx]	# _524, _523->chunk.constants.values
	mov	rdx, QWORD PTR 8[r14]	# _525, frame_1434->ip
	lea	r8, 1[rdx]	# tmp2524,
	mov	QWORD PTR 8[r14], r8	# frame_1434->ip, tmp2524
	movzx	edx, BYTE PTR [rdx]	# _528, *_525
	and	rcx, QWORD PTR [rsi+rdx*8]	# tmp2520, *_530
# src/vm.c:733:         tableSet(&instance->fields, READ_STRING(), peek(0));
	mov	rdx, rdi	#, _1959
	lea	rdi, 24[rax]	#,
# src/vm.c:733:         tableSet(&instance->fields, READ_STRING(), peek(0));
	mov	rsi, rcx	# _532, tmp2520
# src/vm.c:733:         tableSet(&instance->fields, READ_STRING(), peek(0));
	call	"tableSet"@PLT	#
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _1956, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2531,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -16[rax]	# _1955,
# src/vm.c:162:     return *vm.stackTop;
	mov	rcx, QWORD PTR -8[rax]	# _1958, MEM[(Value *)_1956 + -8B]
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _1955
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rsi	# _1955, tmp2531
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -16[rax], rcx	# MEM[(Value *)_1956 + -16B], _1958
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 8	# tmp2538,
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2538
# src/vm.c:737:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _535, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2539,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2539
	movzx	eax, BYTE PTR [rax]	# _538, *_535
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_538]
.L549:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	r9, 1125899906842623	# tmp2332,
	mov	rcx, rdx	# _1789, _1789
	and	rcx, r9	# _1789, tmp2332
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	eax, DWORD PTR [rcx]	# _1753, _1754->type
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	eax, 6	# _1753,
	je	.L576	#,
	cmp	eax, 5	# _1753,
	je	.L577	#,
	test	eax, eax	# _1753
	jne	.L121	#,
# src/vm.c:660:             ObjString* name = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	QWORD PTR 24[rsp], rcx	# %sfp, _1754
	mov	rax, QWORD PTR 16[rax]	# _381->function, _381->function
	mov	rsi, QWORD PTR 64[rax]	# _383, _382->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _384, frame_1434->ip
	lea	rdx, 1[rax]	# pretmp_2831,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, pretmp_2831
	movzx	eax, BYTE PTR [rax]	# _387, *_384
	mov	QWORD PTR 16[rsp], rdx	# %sfp, pretmp_2831
	and	r9, QWORD PTR [rsi+rax*8]	# _391, *_389
# src/vm.c:661:             if (strcmp(name->chars, "length") == 0) {
	lea	rsi, .LC15[rip]	#,
# src/vm.c:661:             if (strcmp(name->chars, "length") == 0) {
	mov	rdi, QWORD PTR 24[r9]	# _392, name_1824->chars
# src/vm.c:661:             if (strcmp(name->chars, "length") == 0) {
	mov	QWORD PTR 8[rsp], rdi	# %sfp, _392
	call	"strcmp"@PLT	#
# src/vm.c:661:             if (strcmp(name->chars, "length") == 0) {
	test	eax, eax	# _393
	jne	.L134	#,
# src/vm.c:161:     vm.stackTop--;
	lea	rax, -8[r13]	# _1930,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2394,
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _1930
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, rsi	# _1930, tmp2394
	je	.L91	#,
# src/vm.c:663:                 push(NUMBER_VAL(array->size));
	mov	rcx, QWORD PTR 24[rsp]	# _1754, %sfp
	pxor	xmm0, xmm0	# _395
	mov	rdx, QWORD PTR 16[rsp]	# pretmp_2831, %sfp
	cvtsi2sd	xmm0, DWORD PTR 16[rcx]	# _395, MEM[(struct ObjArray *)_1754].size
# src/vm.c:156:     *vm.stackTop = value;
	movsd	QWORD PTR -8[r13], xmm0	# MEM[(Value *)_1783 + -8B], _395
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], r13	# vm.stackTop, _1783
	jmp	.L125	#
.L566:
# src/vm.c:882:     CASE(OP_LESS):    BINARY_OP(BOOL_VAL,   <); DISPATCH();
	sub	rdi, 1	# iftmp.51_1449,
	jmp	.L206	#
.L544:
# src/vm.c:881:     CASE(OP_GREATER): BINARY_OP(BOOL_VAL,   >); DISPATCH();
	sub	rdi, 1	# iftmp.49_1448,
	jmp	.L201	#
.L113:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:595:         tableSet(&vm.globals, name, peek(0));
	mov	rdi, QWORD PTR 8[rsp]	#, %sfp
	mov	rsi, r13	#, name
	mov	rdx, QWORD PTR -8[rax]	# MEM[(Value *)_1681 + -8B], MEM[(Value *)_1681 + -8B]
	call	"tableSet"@PLT	#
# src/vm.c:596:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _250, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2235,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2235
	movzx	eax, BYTE PTR [rax]	# _253, *_250
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_253]
.L117:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:614:         tableSet(&vm.globals, name, peek(0));
	mov	rdi, QWORD PTR 8[rsp]	#, %sfp
	mov	rsi, r13	#, name
	mov	rdx, QWORD PTR -8[rax]	# MEM[(Value *)_1686 + -8B], MEM[(Value *)_1686 + -8B]
	call	"tableSet"@PLT	#
# src/vm.c:615:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _291, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2273,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2273
	movzx	eax, BYTE PTR [rax]	# _294, *_291
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_294]
.L567:
# src/vm.c:171:         runtimeError("Expected %d arguments but got %d.", closure->function->arity, argCount);
	mov	edx, eax	#, argCount
	lea	rdi, .LC6[rip]	#,
	xor	eax, eax	#
	call	"runtimeError"	#
# src/vm.c:172:         if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# _2536, errorWasHandled
	jmp	.L288	#
.L568:
# src/vm.c:171:         runtimeError("Expected %d arguments but got %d.", closure->function->arity, argCount);
	mov	edx, eax	#, argCount
	lea	rdi, .LC6[rip]	#,
	xor	eax, eax	#
	call	"runtimeError"	#
# src/vm.c:172:         if (errorWasHandled) return true;
	movzx	eax, BYTE PTR "errorWasHandled"[rip]	# _2512, errorWasHandled
	jmp	.L282	#
.L553:
# src/vm.c:548:             runtimeError("Undefined variable '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1894->chars, name_1894->chars
	lea	rdi, .LC12[rip]	#,
	call	"runtimeError"	#
# src/vm.c:549:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:549:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _137, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2117,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2117
	movzx	eax, BYTE PTR [rax]	# _140, *_137
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_140]
.L552:
# src/vm.c:560:             runtimeError("Undefined variable '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1887->chars, name_1887->chars
	lea	rdi, .LC12[rip]	#,
	call	"runtimeError"	#
# src/vm.c:561:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:561:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _171, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2146,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2146
	movzx	eax, BYTE PTR [rax]	# _174, *_171
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_174]
.L183:
# src/vm.c:851:         ObjArray* arr = newArray(size);
	mov	edi, r13d	#, size
	call	"newArray"@PLT	#
	mov	rsi, rax	# arr,
# src/vm.c:852:         for (int i = 0; i < size; i++) arr->values[i] = NULL_VAL;
	test	r13d, r13d	# size
	je	.L184	#,
# src/vm.c:852:         for (int i = 0; i < size; i++) arr->values[i] = NULL_VAL;
	mov	r8, QWORD PTR 24[rax]	# _720, arr_1731->values
	cmp	r13d, 1	# size,
	je	.L343	#,
	mov	edx, r13d	# bnd.164, size
# src/vm.c:852:         for (int i = 0; i < size; i++) arr->values[i] = NULL_VAL;
	movdqa	xmm0, XMMWORD PTR .LC24[rip]	# tmp2773,
	mov	rax, r8	# ivtmp.193, _720
	shr	edx	# bnd.164
	mov	edi, edx	# _3059, bnd.164
	sal	rdi, 4	# _3058,
	lea	rcx, [rdi+r8]	# _3056,
	and	edi, 16	# _3058,
	je	.L186	#,
	lea	rax, 16[r8]	# ivtmp.193,
	movups	XMMWORD PTR [r8], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_3060], tmp2773
	cmp	rcx, rax	# _3056, ivtmp.193
	je	.L427	#,
	.p2align 4
	.p2align 4
	.p2align 3
.L186:
	movups	XMMWORD PTR [rax], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_3060], tmp2773
	add	rax, 32	# ivtmp.193,
	movups	XMMWORD PTR -16[rax], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_3060], tmp2773
	cmp	rcx, rax	# _3056, ivtmp.193
	jne	.L186	#,
.L427:
	add	edx, edx	#
	cmp	edx, r13d	# niters_vector_mult_vf.165, size
	je	.L184	#,
.L185:
# src/vm.c:852:         for (int i = 0; i < size; i++) arr->values[i] = NULL_VAL;
	movabs	rax, 9222246136947933185	# tmp4220,
	mov	QWORD PTR [r8+rdx*8], rax	# *_318, tmp4220
.L184:
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _2017, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, "vm"[rip+8390152]	# tmp2779,
	cmp	rax, rdx	# _2017, tmp2779
	je	.L91	#,
# src/vm.c:853:         push(OBJ_VAL(arr));
	movabs	rdx, -1125899906842624	# tmp2780,
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2783,
# src/vm.c:853:         push(OBJ_VAL(arr));
	or	rdx, rsi	# tmp2781, arr
	mov	QWORD PTR -8[rax], rdx	# *_2017, tmp2781
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2783
# src/vm.c:854:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _726, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2784,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2784
	movzx	eax, BYTE PTR [rax]	# _729, *_726
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_729]
.L546:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, 1125899906842623	# tmp2699,
	and	rdx, rcx	# _2006, tmp2699
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	ecx, DWORD PTR [rdx]	#, _2006->type
	test	ecx, ecx	#
	jne	.L175	#,
# src/vm.c:813:         int idx = (int)AS_NUMBER(index);
	movq	xmm7, r8	# tmp4216, _2000
	cvttsd2si	ecx, xmm7	# idx, tmp4216
# src/vm.c:814:         if (idx < 0 || idx >= arr->size) {
	test	ecx, ecx	# idx
	js	.L176	#,
# src/vm.c:814:         if (idx < 0 || idx >= arr->size) {
	cmp	DWORD PTR 16[rdx], ecx	# MEM[(struct ObjArray *)_2006].size, idx
	jle	.L176	#,
# src/vm.c:820:         arr->values[idx] = value;
	mov	rdx, QWORD PTR 24[rdx]	# MEM[(struct ObjArray *)_2006].values, MEM[(struct ObjArray *)_2006].values
# src/vm.c:820:         arr->values[idx] = value;
	mov	ecx, ecx	# _672, idx
# src/vm.c:820:         arr->values[idx] = value;
	mov	QWORD PTR [rdx+rcx*8], r9	# *_674, _2003
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, "vm"[rip+8390152]	# tmp2715,
	cmp	rdi, rdx	# _1997, tmp2715
	je	.L91	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -24[rax], r9	# MEM[(Value *)_2001 + -24B], _2003
# src/vm.c:161:     vm.stackTop--;
	sub	rax, 16	# tmp2717,
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2717
# src/vm.c:822:         DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _675, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2718,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2718
	movzx	eax, BYTE PTR [rax]	# _678, *_675
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_678]
.L545:
# src/vm.c:840:             runtimeError("Array size must be a number.");
	xor	eax, eax	#
	lea	rdi, .LC22[rip]	#,
	call	"runtimeError"	#
# src/vm.c:841:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:841:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _709, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2758,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2758
	movzx	eax, BYTE PTR [rax]	# _712, *_709
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_712]
.L560:
# src/vm.c:926:             runtimeError("Operand to bitwise not must be a number.");
	xor	eax, eax	#
	lea	rdi, .LC29[rip]	#,
	call	"runtimeError"	#
# src/vm.c:927:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:927:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _979, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3224,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3224
	movzx	eax, BYTE PTR [rax]	# _982, *_979
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_982]
.L555:
# src/vm.c:940:             runtimeError("Operand to unary negation must be a number.");
	xor	eax, eax	#
	lea	rdi, .LC30[rip]	#,
	call	"runtimeError"	#
# src/vm.c:941:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:941:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _998, frame_1434->ip
	lea	rdx, 1[rax]	# tmp3265,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp3265
	movzx	eax, BYTE PTR [rax]	# _1001, *_998
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_1001]
.L189:
	neg	r13d	# _3052
	lea	rdi, 0[0+r8*8]	# _3044,
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	xor	edx, edx	# ivtmp.206
	movsxd	rax, r13d	# _3051, _3052
	lea	r10, [rcx+rax*8]	# _3049,
	.p2align 5
	.p2align 4
	.p2align 3
.L191:
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	rax, QWORD PTR [r10+rdx]	# _1068, MEM[(Value *)_3049 + ivtmp.206_3055 * 1]
# src/vm.c:860:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	QWORD PTR [rsi+rdx], rax	# MEM[(Value *)_739 + ivtmp.206_3055 * 1], _1068
# src/vm.c:859:         for (int i = count - 1; i >= 0; i--)
	add	rdx, 8	# ivtmp.206,
	cmp	rdi, rdx	# _3044, ivtmp.206
	jne	.L191	#,
	jmp	.L188	#
.L194:
	mov	eax, r13d	# _781, count
	neg	r13d	# _3037
	movsxd	rdx, r13d	# _3036, _3037
	lea	r9, [rcx+rdx*8]	# _3034,
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	xor	edx, edx	# ivtmp.216
	.p2align 5
	.p2align 4
	.p2align 3
.L196:
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	r8, QWORD PTR [r9+rdx*8]	# _2766, MEM[(Value *)_3034 + ivtmp.216_3039 * 8]
# src/vm.c:869:             array->values[count - i - 1] = vm.stackTop[-1 - i];
	mov	QWORD PTR [rsi+rdx*8], r8	# MEM[(Value *)_774 + ivtmp.216_3039 * 8], _2766
# src/vm.c:868:         for (int i = count - 1; i >= 0; i--)
	add	rdx, 1	# ivtmp.216,
	cmp	rax, rdx	# _781, ivtmp.216
	jne	.L196	#,
	jmp	.L193	#
.L576:
# src/vm.c:635:             ObjString* name = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:637:             if (!tableGet(&module->table, name, &value)) {
	lea	rdi, 16[rcx]	# _348,
# src/vm.c:635:             ObjString* name = READ_STRING();
	mov	rax, QWORD PTR 16[rax]	# _337->function, _337->function
	mov	rdx, QWORD PTR 64[rax]	# _339, _338->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _340, frame_1434->ip
	lea	rsi, 1[rax]	# tmp2335,
	mov	QWORD PTR 8[r14], rsi	# frame_1434->ip, tmp2335
	movzx	eax, BYTE PTR [rax]	# _343, *_340
	and	r9, QWORD PTR [rdx+rax*8]	# tmp2332, *_345
# src/vm.c:637:             if (!tableGet(&module->table, name, &value)) {
	lea	rdx, 112[rsp]	# tmp2338,
	mov	rsi, r9	#, name
# src/vm.c:635:             ObjString* name = READ_STRING();
	mov	r13, r9	# name, tmp2332
# src/vm.c:637:             if (!tableGet(&module->table, name, &value)) {
	call	"tableGet"@PLT	#
# src/vm.c:637:             if (!tableGet(&module->table, name, &value)) {
	test	al, al	# _349
	je	.L578	#,
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _1795, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, "vm"[rip+8390152]	# tmp2349,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# _1810,
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _1810
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rcx	# _1810, tmp2349
	je	.L91	#,
# src/vm.c:644:             push(value);
	mov	rdx, QWORD PTR 112[rsp]	# value.24_357, value
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rdx	# MEM[(Value *)_1795 + -8B], value.24_357
# src/vm.c:676:         DISPATCH();
	mov	rdx, QWORD PTR 8[r14]	# pretmp_2831, frame_1434->ip
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _1795
.L125:
# src/vm.c:676:         DISPATCH();
	lea	rax, 1[rdx]	# tmp2408,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2408
	movzx	eax, BYTE PTR [rdx]	# _411, *prephitmp_2832
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_411]
.L570:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR -16[rdx]	# _2054, MEM[(Value *)_2048 + -16B]
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r8, rax	# _2050, _2054
	and	r8, rsi	# _2050, _2044
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	r8, rsi	# _2050, _2044
	jne	.L210	#,
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rcx, rax	# _2052, _2054
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rcx], 9	# _2052->type,
	jne	.L210	#,
# src/vm.c:338:     int length = a->length + b->length;
	mov	r9d, DWORD PTR 16[r13]	# MEM[(struct ObjString *)_2046].length, MEM[(struct ObjString *)_2046].length
	add	r9d, DWORD PTR 16[rcx]	# length, MEM[(struct ObjString *)_2052].length
# src/vm.c:339:     char* chars = ALLOCATE(char, length + 1);
	xor	esi, esi	#
	xor	edi, edi	#
	lea	edx, 1[r9]	# _2485,
	mov	QWORD PTR 24[rsp], r8	# %sfp, _2050
	movsxd	rdx, edx	# _2486, _2485
	mov	DWORD PTR 16[rsp], r9d	# %sfp, length
# src/vm.c:338:     int length = a->length + b->length;
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _2052
# src/vm.c:339:     char* chars = ALLOCATE(char, length + 1);
	call	"reallocate"@PLT	#
# src/vm.c:340:     memcpy(chars, a->chars, a->length);
	mov	rcx, QWORD PTR 8[rsp]	# _2052, %sfp
	mov	rdi, rax	#,
	movsxd	rdx, DWORD PTR 16[rcx]	# _2489, MEM[(struct ObjString *)_2052].length
	mov	rsi, QWORD PTR 24[rcx]	# MEM[(struct ObjString *)_2052].chars, MEM[(struct ObjString *)_2052].chars
	call	"memcpy"@PLT	#
# src/vm.c:341:     memcpy(chars + a->length, b->chars, b->length);
	mov	rcx, QWORD PTR 8[rsp]	# _2052, %sfp
# src/vm.c:341:     memcpy(chars + a->length, b->chars, b->length);
	movsxd	rdx, DWORD PTR 16[r13]	# _2492, MEM[(struct ObjString *)_2046].length
	mov	rsi, QWORD PTR 24[r13]	# MEM[(struct ObjString *)_2046].chars, MEM[(struct ObjString *)_2046].chars
# src/vm.c:341:     memcpy(chars + a->length, b->chars, b->length);
	mov	QWORD PTR 8[rsp], rax	# %sfp,
# src/vm.c:341:     memcpy(chars + a->length, b->chars, b->length);
	movsxd	rdi, DWORD PTR 16[rcx]	# _2495, MEM[(struct ObjString *)_2052].length
# src/vm.c:341:     memcpy(chars + a->length, b->chars, b->length);
	add	rdi, rax	# _2496,
# src/vm.c:341:     memcpy(chars + a->length, b->chars, b->length);
	call	"memcpy"@PLT	#
# src/vm.c:342:     chars[length] = '\0';
	movsxd	rax, DWORD PTR 16[rsp]	#, %sfp
# src/vm.c:342:     chars[length] = '\0';
	mov	r10, QWORD PTR 8[rsp]	# chars, %sfp
	mov	BYTE PTR [r10+rax], 0	# *_2498,
# src/vm.c:344:     ObjString* result = takeString(chars, length);
	mov	esi, eax	#, length
	mov	rdi, r10	#, chars
	call	"takeString"@PLT	#
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2958,
# src/vm.c:344:     ObjString* result = takeString(chars, length);
	mov	rdx, rax	# result,
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _2500, vm.stackTop
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -16[rax]	# _2502,
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2502
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, rsi	# _2502, tmp2958
	je	.L91	#,
# src/vm.c:347:     push(OBJ_VAL(result));
	or	rdx, QWORD PTR 24[rsp]	# tmp2960, %sfp
# src/vm.c:161:     vm.stackTop--;
	lea	rsi, -8[rax]	# _2061,
# src/vm.c:347:     push(OBJ_VAL(result));
	mov	QWORD PTR -16[rax], rdx	# MEM[(Value *)_2500 + -16B], tmp2960
# src/vm.c:885:             concatenate();
	jmp	.L211	#
.L168:
# src/vm.c:770:         if ((!IS_STRING(val) && !IS_ARRAY(val)) || !IS_NUMBER(indexVal)) {
	movabs	rdi, 9222246136947933184	# tmp3927,
	mov	rax, rsi	# tmp4058, _1983
	not	rax	# tmp4058
	test	rax, rdi	# tmp4058, tmp3927
	je	.L167	#,
# src/vm.c:778:             int index = (int)AS_NUMBER(indexVal);
	movq	xmm7, rsi	# tmp4330, _1983
	cvttsd2si	eax, xmm7	# index, tmp4330
# src/vm.c:779:             if (index < 0 || index >= str->length) {
	test	eax, eax	# index
	js	.L337	#,
# src/vm.c:779:             if (index < 0 || index >= str->length) {
	cmp	DWORD PTR 16[rdx], eax	# MEM[(struct ObjString *)_1979].length, index
	jg	.L170	#,
.L337:
# src/vm.c:781:                 runtimeError("String index out of bounds.");
	xor	eax, eax	#
	lea	rdi, .LC18[rip]	#,
	call	"runtimeError"	#
# src/vm.c:782:                 if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:782:                 if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _627, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2656,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2656
	movzx	eax, BYTE PTR [rax]	# _630, *_627
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_630]
.L571:
# src/vm.c:681:             ObjString* name = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _413, frame_1434->ip
# src/vm.c:683:             if (!tableGet(&module->table, name, &value)) {
	lea	rdi, 16[rcx]	# _433,
# src/vm.c:681:             ObjString* name = READ_STRING_LONG();
	lea	rax, 3[rdx]	# tmp2418,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2418
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rsi, QWORD PTR 16[rax]	# _415->function, _415->function
	movzx	eax, BYTE PTR 2[rdx]	# _425, MEM[(uint8_t *)_413 + 2B]
	movzx	edx, WORD PTR [rdx]	# _423, MEM <short unsigned int> [(uint8_t *)_413]
	sal	eax, 16	# _426,
	or	eax, edx	# _428, _423
	mov	rdx, QWORD PTR 64[rsi]	# _416->chunk.constants.values, _416->chunk.constants.values
	and	r9, QWORD PTR [rdx+rax*8]	# tmp2417, *_430
# src/vm.c:683:             if (!tableGet(&module->table, name, &value)) {
	lea	rdx, 128[rsp]	# tmp2429,
	mov	rsi, r9	#, name
# src/vm.c:681:             ObjString* name = READ_STRING_LONG();
	mov	r13, r9	# name, tmp2417
# src/vm.c:683:             if (!tableGet(&module->table, name, &value)) {
	call	"tableGet"@PLT	#
# src/vm.c:683:             if (!tableGet(&module->table, name, &value)) {
	test	al, al	# _434
	je	.L579	#,
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _1937, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, "vm"[rip+8390152]	# tmp2440,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# _1938,
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _1938
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rcx	# _1938, tmp2440
	je	.L91	#,
# src/vm.c:690:             push(value);
	mov	rdx, QWORD PTR 128[rsp]	# value.30_442, value
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rdx	# MEM[(Value *)_1937 + -8B], value.30_442
# src/vm.c:722:         DISPATCH();
	mov	rdx, QWORD PTR 8[r14]	# pretmp_2828, frame_1434->ip
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _1937
.L140:
# src/vm.c:722:         DISPATCH();
	lea	rax, 1[rdx]	# tmp2511,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2511
	movzx	eax, BYTE PTR [rdx]	# _514, *prephitmp_2829
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_514]
.L259:
# /usr/include/bits/stdio.h:84:   return putc (__c, stdout);
	mov	rsi, QWORD PTR "stdout"[rip]	#, stdout
# src/vm.c:1012:                     putchar(c);
	movsx	edi, al	# _1027, c
# /usr/include/bits/stdio.h:84:   return putc (__c, stdout);
	call	"putc"@PLT	#
	jmp	.L269	#
.L577:
# src/vm.c:647:             ObjString* name = READ_STRING();
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
# src/vm.c:649:             if (tableGet(&instance->fields, name, &value)) {
	lea	rdi, 24[rcx]	# _369,
	mov	QWORD PTR 16[rsp], r8	# %sfp, _1761
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _1754
# src/vm.c:647:             ObjString* name = READ_STRING();
	mov	rax, QWORD PTR 16[rax]	# _358->function, _358->function
	mov	rdx, QWORD PTR 64[rax]	# _360, _359->chunk.constants.values
	mov	rax, QWORD PTR 8[r14]	# _361, frame_1434->ip
	lea	rsi, 1[rax]	# tmp2353,
	mov	QWORD PTR 8[r14], rsi	# frame_1434->ip, tmp2353
	movzx	eax, BYTE PTR [rax]	# _364, *_361
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_366
# src/vm.c:649:             if (tableGet(&instance->fields, name, &value)) {
	lea	rdx, 120[rsp]	# tmp2356,
# src/vm.c:647:             ObjString* name = READ_STRING();
	and	r13, r9	# name, tmp2332
# src/vm.c:649:             if (tableGet(&instance->fields, name, &value)) {
	mov	rsi, r13	#, name
	call	"tableGet"@PLT	#
# src/vm.c:649:             if (tableGet(&instance->fields, name, &value)) {
	mov	rcx, QWORD PTR 8[rsp]	# _1754, %sfp
	mov	r8, QWORD PTR 16[rsp]	# _1761, %sfp
	test	al, al	# _370
	je	.L127	#,
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _1924, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, "vm"[rip+8390152]	# tmp2360,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# _1925,
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _1925
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rcx	# _1925, tmp2360
	je	.L91	#,
# src/vm.c:651:                 push(value);
	mov	rdx, QWORD PTR 120[rsp]	# value.25_371, value
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rdx	#, value.25_371
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _1924
.L128:
# src/vm.c:676:         DISPATCH();
	mov	rdx, QWORD PTR 8[r14]	# pretmp_2831, frame_1434->ip
	jmp	.L125	#
.L572:
# src/vm.c:693:             ObjString* name = READ_STRING_LONG();
	mov	rdx, QWORD PTR 8[r14]	# _443, frame_1434->ip
# src/vm.c:695:             if (tableGet(&instance->fields, name, &value)) {
	lea	rdi, 24[rcx]	# _463,
	mov	QWORD PTR 16[rsp], r8	# %sfp, _1931
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _1933
# src/vm.c:693:             ObjString* name = READ_STRING_LONG();
	lea	rax, 3[rdx]	# tmp2442,
	mov	QWORD PTR 8[r14], rax	# frame_1434->ip, tmp2442
	mov	rax, QWORD PTR [r14]	# frame_1434->closure, frame_1434->closure
	mov	rsi, QWORD PTR 16[rax]	# _445->function, _445->function
	movzx	eax, BYTE PTR 2[rdx]	# _455, MEM[(uint8_t *)_443 + 2B]
	movzx	edx, WORD PTR [rdx]	# _453, MEM <short unsigned int> [(uint8_t *)_443]
	sal	eax, 16	# _456,
	or	eax, edx	# _458, _453
	mov	rdx, QWORD PTR 64[rsi]	# _446->chunk.constants.values, _446->chunk.constants.values
	mov	r13, QWORD PTR [rdx+rax*8]	# name, *_460
# src/vm.c:695:             if (tableGet(&instance->fields, name, &value)) {
	lea	rdx, 136[rsp]	# tmp2453,
# src/vm.c:693:             ObjString* name = READ_STRING_LONG();
	and	r13, r9	# name, tmp2417
# src/vm.c:695:             if (tableGet(&instance->fields, name, &value)) {
	mov	rsi, r13	#, name
	call	"tableGet"@PLT	#
# src/vm.c:695:             if (tableGet(&instance->fields, name, &value)) {
	mov	rcx, QWORD PTR 8[rsp]	# _1933, %sfp
	mov	r8, QWORD PTR 16[rsp]	# _1931, %sfp
	test	al, al	# _464
	je	.L142	#,
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _1942, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, "vm"[rip+8390152]	# tmp2457,
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# _1943,
	mov	QWORD PTR 8392312[r15], rdx	# vm.stackTop, _1943
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rcx	# _1943, tmp2457
	je	.L91	#,
# src/vm.c:697:                 push(value);
	mov	rdx, QWORD PTR 136[rsp]	# value.31_465, value
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR -8[rax], rdx	#, value.31_465
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _1942
.L143:
# src/vm.c:722:         DISPATCH();
	mov	rdx, QWORD PTR 8[r14]	# pretmp_2828, frame_1434->ip
	jmp	.L140	#
.L176:
# src/vm.c:816:             runtimeError("Array index out of range.");
	xor	eax, eax	#
	lea	rdi, .LC21[rip]	#,
	call	"runtimeError"	#
# src/vm.c:817:             if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:817:             if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _666, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2707,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2707
	movzx	eax, BYTE PTR [rax]	# _669, *_666
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_669]
.L334:
# src/vm.c:793:                 runtimeError("Array index out of bounds.");
	xor	eax, eax	#
	lea	rdi, .LC19[rip]	#,
	call	"runtimeError"	#
# src/vm.c:794:                 if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:794:                 if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _642, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2674,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2674
	movzx	eax, BYTE PTR [rax]	# _645, *_642
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_645]
.L264:
# src/vm.c:1006:                             runtimeError("Unknown format specifier '%%%c'.", spec);
	lea	rdi, .LC37[rip]	#,
	xor	eax, eax	#
	mov	r14, QWORD PTR 16[rsp]	# frame, %sfp
	call	"runtimeError"	#
	jmp	.L257	#
.L263:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rcx, -1125899906842624	# tmp3299,
	mov	rax, rdi	# tmp4061, v
	not	rax	# tmp4061
	test	rax, rcx	# tmp4061, tmp3299
	je	.L580	#,
.L267:
# src/vm.c:995:                                 runtimeError("%%s expects string.");
	lea	rdi, .LC36[rip]	#,
	xor	eax, eax	#
	mov	r14, QWORD PTR 16[rsp]	# frame, %sfp
	call	"runtimeError"	#
	jmp	.L257	#
.L578:
# src/vm.c:639:                 runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1837->chars, name_1837->chars
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:640:                 if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:640:                 if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _352, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2342,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2342
	movzx	eax, BYTE PTR [rax]	# _355, *_352
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_355]
.L579:
# src/vm.c:685:                 runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1812->chars, name_1812->chars
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:686:                 if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:686:                 if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _437, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2433,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2433
	movzx	eax, BYTE PTR [rax]	# _440, *_437
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_440]
.L127:
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	mov	rdi, QWORD PTR 16[rcx]	# MEM[(struct ObjInstance *)_1754].class_, MEM[(struct ObjInstance *)_1754].class_
	lea	rdx, 144[rsp]	# tmp2362,
	mov	rsi, r13	#, name
	mov	QWORD PTR 8[rsp], r8	# %sfp, _1761
	add	rdi, 24	# _2403,
	call	"tableGet"@PLT	#
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	test	al, al	# _2404
	jne	.L129	#,
# src/vm.c:236:         runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# MEM[(char * *)name_1829 + 24B], MEM[(char * *)name_1829 + 24B]
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:652:             } else if (!bindMethod(instance->class_, name)) {
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	jne	.L128	#,
# src/vm.c:654:                 runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1829->chars, name_1829->chars
	xor	eax, eax	#
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:655:                 if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:655:                 if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _376, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2380,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2380
	movzx	eax, BYTE PTR [rax]	# _379, *_376
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_379]
.L142:
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	mov	rdi, QWORD PTR 16[rcx]	# MEM[(struct ObjInstance *)_1933].class_, MEM[(struct ObjInstance *)_1933].class_
	lea	rdx, 152[rsp]	# tmp2459,
	mov	rsi, r13	#, name
	mov	QWORD PTR 8[rsp], r8	# %sfp, _1931
	add	rdi, 24	# _2421,
	call	"tableGet"@PLT	#
# src/vm.c:277:     if (!tableGet(&class_->methods, name, &method)) {
	test	al, al	# _2422
	jne	.L144	#,
# src/vm.c:236:         runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# MEM[(char * *)name_1803 + 24B], MEM[(char * *)name_1803 + 24B]
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:698:             } else if (!bindMethod(instance->class_, name)) {
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	jne	.L143	#,
# src/vm.c:700:                 runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_1803->chars, name_1803->chars
	xor	eax, eax	#
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:701:                 if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:701:                 if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _470, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2477,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2477
	movzx	eax, BYTE PTR [rax]	# _473, *_470
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_473]
.L144:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	movabs	rsi, 1125899906842623	# tmp2417,
	and	rsi, QWORD PTR 152[rsp]	# tmp2417, method
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	mov	rdi, QWORD PTR -8[rax]	# MEM[(Value *)_2427 + -8B], MEM[(Value *)_2427 + -8B]
	call	"newBoundMethod"@PLT	#
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2471,
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	mov	rdx, rax	# bound,
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _2430, vm.stackTop
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -8[rax]	# _2431,
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2431
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, rsi	# _2431, tmp2471
	je	.L91	#,
# src/vm.c:286:     push(OBJ_VAL(bound));
	or	rdx, QWORD PTR 8[rsp]	# tmp2473, %sfp
	mov	QWORD PTR -8[rax], rdx	#, tmp2473
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _2430
	jmp	.L143	#
.L129:
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 8392312[r15]	# vm.stackTop, vm.stackTop
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	movabs	rsi, 1125899906842623	# tmp2332,
	and	rsi, QWORD PTR 144[rsp]	# tmp2332, method
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	mov	rdi, QWORD PTR -8[rax]	# MEM[(Value *)_2409 + -8B], MEM[(Value *)_2409 + -8B]
	call	"newBoundMethod"@PLT	#
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, "vm"[rip+8390152]	# tmp2374,
# src/vm.c:283:     ObjBoundMethod* bound = newBoundMethod(peek(0), AS_CLOSURE(method));
	mov	rdx, rax	# bound,
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR 8392312[r15]	# _2412, vm.stackTop
# src/vm.c:161:     vm.stackTop--;
	lea	rcx, -8[rax]	# _2413,
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, _2413
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rcx, rsi	# _2413, tmp2374
	je	.L91	#,
# src/vm.c:286:     push(OBJ_VAL(bound));
	or	rdx, QWORD PTR 8[rsp]	# tmp2376, %sfp
	mov	QWORD PTR -8[rax], rdx	#, tmp2376
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, _2412
	jmp	.L128	#
.L170:
# src/vm.c:785:             char buffer[2] = { str->chars[index], '\0' };
	mov	rdx, QWORD PTR 24[rdx]	# MEM[(struct ObjString *)_1979].chars, MEM[(struct ObjString *)_1979].chars
	mov	eax, eax	# _633, index
# src/vm.c:161:     vm.stackTop--;
	sub	rcx, 16	# tmp2665,
# src/vm.c:787:             push(OBJ_VAL(copyString(buffer, 1)));
	mov	esi, 1	#,
	lea	rdi, 182[rsp]	# tmp2666,
# src/vm.c:785:             char buffer[2] = { str->chars[index], '\0' };
	movzx	eax, BYTE PTR [rdx+rax]	# _635, *_634
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR 8392312[r15], rcx	# vm.stackTop, tmp2665
# src/vm.c:785:             char buffer[2] = { str->chars[index], '\0' };
	mov	BYTE PTR 183[rsp], 0	# buffer[1],
	mov	BYTE PTR 182[rsp], al	# buffer[0], _635
# src/vm.c:787:             push(OBJ_VAL(copyString(buffer, 1)));
	call	"copyString"@PLT	#
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, "vm"[rip+8390152]	# tmp2668,
# src/vm.c:787:             push(OBJ_VAL(copyString(buffer, 1)));
	mov	rdx, rax	# _636,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 8392312[r15]	# _1991, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, rcx	# _1991, tmp2668
	je	.L91	#,
# src/vm.c:787:             push(OBJ_VAL(copyString(buffer, 1)));
	or	rdx, r13	# tmp2670, _1977
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp2672,
# src/vm.c:787:             push(OBJ_VAL(copyString(buffer, 1)));
	mov	QWORD PTR -8[rax], rdx	# *_1991, tmp2670
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR 8392312[r15], rax	# vm.stackTop, tmp2672
	jmp	.L172	#
.L149:
# src/vm.c:712:                 runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 8[rsp]	#, %sfp
	xor	eax, eax	#
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:713:                 if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:713:                 if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _500, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2501,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2501
	movzx	eax, BYTE PTR [rax]	# _503, *_500
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_503]
.L134:
# src/vm.c:666:                 runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 8[rsp]	#, %sfp
	xor	eax, eax	#
	lea	rdi, .LC11[rip]	#,
	call	"runtimeError"	#
# src/vm.c:667:                 if (errorWasHandled) DISPATCH();
	cmp	BYTE PTR "errorWasHandled"[rip], 0	# errorWasHandled,
	je	.L104	#,
# src/vm.c:667:                 if (errorWasHandled) DISPATCH();
	mov	rax, QWORD PTR 8[r14]	# _397, frame_1434->ip
	lea	rdx, 1[rax]	# tmp2398,
	mov	QWORD PTR 8[r14], rdx	# frame_1434->ip, tmp2398
	movzx	eax, BYTE PTR [rax]	# _400, *_397
	jmp	[QWORD PTR [rbx+rax*8]]	# dispatchTable[_400]
.L343:
# src/vm.c:852:         for (int i = 0; i < size; i++) arr->values[i] = NULL_VAL;
	xor	edx, edx	#
	jmp	.L185	#
.L559:
# src/vm.c:161:     vm.stackTop--;
	sub	rsi, 16	# tmp3774,
# src/vm.c:1142:             return INTERPRET_OK;
	xor	eax, eax	# <retval>
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR "vm"[rip+8392312], rsi	# vm.stackTop, tmp3774
# src/vm.c:1142:             return INTERPRET_OK;
	jmp	.L86	#
.L580:
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, 1125899906842623	# tmp3302,
	and	rax, rdi	# _2162, v
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _2163->type,
	jne	.L267	#,
# src/vm.c:999:                             printObject(v, NULL);
	xor	esi, esi	#
	call	"printObject"@PLT	#
# src/vm.c:1000:                             break;
	jmp	.L266	#
.L91:
	call	"push.part.0"	#
.L574:
# src/vm.c:977:                         runtimeError("Not enough arguments for format string.");
	lea	rdi, .LC34[rip]	#,
	xor	eax, eax	#
	mov	r14, QWORD PTR 16[rsp]	# frame, %sfp
	call	"runtimeError"	#
	jmp	.L257	#
.L573:
# src/vm.c:970:                         runtimeError("Incomplete format specifier.");
	lea	rdi, .LC33[rip]	#,
	xor	eax, eax	#
	mov	r14, QWORD PTR 16[rsp]	# frame, %sfp
	call	"runtimeError"	#
	jmp	.L257	#
.L564:
# src/vm.c:914:             result = fmod(a, b);
	movsd	xmm0, QWORD PTR 8[rsp]	#, %sfp
	mov	QWORD PTR 24[rsp], rsi	# %sfp, _2093
	call	"fmod"@PLT	#
	mov	rsi, QWORD PTR 24[rsp]	# _2093, %sfp
	movsd	xmm2, QWORD PTR 16[rsp]	# result, %sfp
	jmp	.L228	#
.L569:
# src/vm.c:1201: }
	call	"__stack_chk_fail"@PLT	#
.L575:
# src/vm.c:986:                                 runtimeError("%%d expects number.");
	lea	rdi, .LC35[rip]	#,
	xor	eax, eax	#
	mov	r14, QWORD PTR 16[rsp]	# frame, %sfp
	call	"runtimeError"	#
	jmp	.L257	#
	.cfi_endproc
.LFE46:
	.size	"run", .-"run"
	.p2align 4
	.globl	"defineNative"
	.type	"defineNative", @function
"defineNative":
.LFB28:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsi	# native, native
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi	# name, name
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
# src/vm.c:84:     push(OBJ_VAL(copyString(name, strlen(name))));
	call	"strlen"@PLT	#
# src/vm.c:84:     push(OBJ_VAL(copyString(name, strlen(name))));
	mov	rdi, rbx	#, name
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rbx, "vm"[rip+8390152]	# tmp124,
# src/vm.c:84:     push(OBJ_VAL(copyString(name, strlen(name))));
	mov	esi, eax	# _1, tmp152
	call	"copyString"@PLT	#
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rdx, QWORD PTR "vm"[rip+8392312]	# _24, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rbx	# _24, tmp124
	je	.L583	#,
# src/vm.c:84:     push(OBJ_VAL(copyString(name, strlen(name))));
	movabs	rcx, -1125899906842624	# tmp125,
	or	rax, rcx	# tmp126, tmp125
	mov	QWORD PTR [rdx], rax	# *_24, tmp126
# src/vm.c:157:     vm.stackTop++;
	lea	rax, 8[rdx]	# _25,
	mov	QWORD PTR "vm"[rip+8392312], rax	# vm.stackTop, _25
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, rbx	# _25, tmp124
	je	.L583	#,
# src/vm.c:85:     push(OBJ_VAL(native));
	or	rbp, rcx	# tmp130, tmp125
# src/vm.c:157:     vm.stackTop++;
	add	rdx, 16	# tmp132,
# src/vm.c:86:     tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
	mov	rdi, rbx	#, tmp124
# src/vm.c:85:     push(OBJ_VAL(native));
	mov	QWORD PTR -8[rdx], rbp	# MEM[(Value *)_24 + 8B], tmp130
# src/vm.c:86:     tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
	mov	rsi, QWORD PTR "vm"[rip+1544]	# _10, vm.stack[0]
	movabs	rbp, 1125899906842623	# tmp137,
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR "vm"[rip+8392312], rdx	# vm.stackTop, tmp132
# src/vm.c:86:     tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
	mov	rdx, QWORD PTR "vm"[rip+1552]	#, vm.stack[1]
# src/vm.c:86:     tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
	and	rsi, rbp	# _10, tmp137
# src/vm.c:86:     tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
	call	"tableSet"@PLT	#
# src/vm.c:87:     tableSet(&vm.consts, AS_STRING(vm.stack[0]), BOOL_VAL(true));
	mov	rsi, QWORD PTR "vm"[rip+1544]	# tmp137, vm.stack[0]
# src/vm.c:87:     tableSet(&vm.consts, AS_STRING(vm.stack[0]), BOOL_VAL(true));
	lea	rdi, 24[rbx]	# tmp143,
	movabs	rdx, 9222246136947933187	#,
# src/vm.c:87:     tableSet(&vm.consts, AS_STRING(vm.stack[0]), BOOL_VAL(true));
	and	rsi, rbp	# tmp137, tmp137
# src/vm.c:87:     tableSet(&vm.consts, AS_STRING(vm.stack[0]), BOOL_VAL(true));
	call	"tableSet"@PLT	#
# src/vm.c:161:     vm.stackTop--;
	sub	QWORD PTR "vm"[rip+8392312], 16	# vm.stackTop,
# src/vm.c:90: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L583:
	.cfi_restore_state
	call	"push.part.0"	#
	.cfi_endproc
.LFE28:
	.size	"defineNative", .-"defineNative"
	.p2align 4
	.globl	"defineModule"
	.type	"defineModule", @function
"defineModule":
.LFB52:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rdi	# name, name
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rsi	# module, module
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 32
	call	"strlen"@PLT	#
	mov	rdi, rbp	#, name
	lea	rbp, "vm"[rip+8390152]	# tmp124,
	mov	esi, eax	# _5, tmp152
	call	"copyString"@PLT	#
	mov	rdx, QWORD PTR "vm"[rip+8392312]	# _10, vm.stackTop
	cmp	rdx, rbp	# _10, tmp124
	je	.L587	#,
	movabs	rcx, -1125899906842624	# tmp125,
	or	rax, rcx	# tmp126, tmp125
	mov	QWORD PTR [rdx], rax	# *_10, tmp126
	lea	rax, 8[rdx]	# _11,
	mov	QWORD PTR "vm"[rip+8392312], rax	# vm.stackTop, _11
	cmp	rax, rbp	# _11, tmp124
	je	.L587	#,
	or	rbx, rcx	# tmp130, tmp125
	add	rdx, 16	# tmp132,
	mov	rdi, rbp	#, tmp124
	mov	QWORD PTR -8[rdx], rbx	# MEM[(Value *)_10 + 8B], tmp130
	mov	rsi, QWORD PTR "vm"[rip+1544]	# _17, vm.stack[0]
	movabs	rbx, 1125899906842623	# tmp137,
	mov	QWORD PTR "vm"[rip+8392312], rdx	# vm.stackTop, tmp132
	mov	rdx, QWORD PTR "vm"[rip+1552]	#, vm.stack[1]
	and	rsi, rbx	# _17, tmp137
	call	"tableSet"@PLT	#
	and	rbx, QWORD PTR "vm"[rip+1544]	# tmp137, vm.stack[0]
	lea	rdi, 24[rbp]	# tmp143,
	movabs	rdx, 9222246136947933187	#,
	mov	rsi, rbx	# _20, tmp137
	call	"tableSet"@PLT	#
	sub	QWORD PTR "vm"[rip+8392312], 16	# vm.stackTop,
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L587:
	.cfi_restore_state
	call	"push.part.0"	#
	.cfi_endproc
.LFE52:
	.size	"defineModule", .-"defineModule"
	.section	.rodata.str1.1
.LC41:
	.string	"init"
	.text
	.p2align 4
	.globl	"initVM"
	.type	"initVM", @function
"initVM":
.LFB30:
	.cfi_startproc
# src/vm.c:22:     vm.stackTop = vm.stack;
	lea	rax, "vm"[rip+1544]	# tmp105,
# src/vm.c:101: void initVM() {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/vm.c:23:     vm.frameCount = 0;
	mov	DWORD PTR "vm"[rip+1536], 0	# vm.frameCount,
# src/vm.c:22:     vm.stackTop = vm.stack;
	movq	xmm0, rax	# _23, tmp105
# src/vm.c:113:     initTable(&vm.globals);
	lea	rdi, 8388608[rax]	#,
# src/vm.c:24:     vm.openUpvalues = NULL;
	mov	QWORD PTR "vm"[rip+8390232], 0	# vm.openUpvalues,
# src/vm.c:22:     vm.stackTop = vm.stack;
	movups	XMMWORD PTR "vm"[rip+8392312], xmm0	# MEM <vector(2) long unsigned int> [(void *)&vm + 8392312B], _23
# src/vm.c:104:     vm.bytesAllocated = 0;
	movdqa	xmm0, XMMWORD PTR .LC40[rip]	# tmp108,
# src/vm.c:25:     vm.handlerCount = 0;
	mov	DWORD PTR "vm"[rip+8392288], 0	# vm.handlerCount,
# src/vm.c:104:     vm.bytesAllocated = 0;
	movups	XMMWORD PTR "vm"[rip+8392296], xmm0	# MEM <vector(2) long unsigned int> [(long unsigned int *)&vm + 8392296B], tmp108
# src/vm.c:109:     vm.grayCount = 0;
	mov	QWORD PTR "vm"[rip+8392328], 0	# MEM <vector(2) int> [(int *)&vm + 8392328B],
# src/vm.c:111:     vm.grayStack = NULL;
	mov	QWORD PTR "vm"[rip+8392336], 0	# vm.grayStack,
# src/vm.c:113:     initTable(&vm.globals);
	call	"initTable"@PLT	#
# src/vm.c:114:     initTable(&vm.consts);
	lea	rdi, "vm"[rip+8390176]	#,
	call	"initTable"@PLT	#
# src/vm.c:115:     initTable(&vm.strings);
	lea	rdi, "vm"[rip+8390200]	#,
	call	"initTable"@PLT	#
# src/vm.c:118:     vm.initString = copyString("init", 4);
	mov	esi, 4	#,
	lea	rdi, .LC41[rip]	#,
# src/vm.c:117:     vm.initString = NULL;
	mov	QWORD PTR "vm"[rip+8390224], 0	# vm.initString,
# src/vm.c:118:     vm.initString = copyString("init", 4);
	call	"copyString"@PLT	#
# src/vm.c:118:     vm.initString = copyString("init", 4);
	mov	QWORD PTR "vm"[rip+8390224], rax	# vm.initString, _1
# src/vm.c:121: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 8
# src/vm.c:120:     defineAllNatives();
	jmp	"defineAllNatives"@PLT	#
	.cfi_endproc
.LFE30:
	.size	"initVM", .-"initVM"
	.p2align 4
	.globl	"freeVM"
	.type	"freeVM", @function
"freeVM":
.LFB31:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/vm.c:124:     freeTable(&vm.globals);
	lea	rdi, "vm"[rip+8390152]	#,
	call	"freeTable"@PLT	#
# src/vm.c:125:     freeTable(&vm.consts);
	lea	rdi, "vm"[rip+8390176]	# tmp99,
	call	"freeTable"@PLT	#
# src/vm.c:126:     freeTable(&vm.strings);
	lea	rdi, "vm"[rip+8390200]	# tmp100,
	call	"freeTable"@PLT	#
# src/vm.c:129: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/vm.c:127:     vm.initString = NULL;
	mov	QWORD PTR "vm"[rip+8390224], 0	# vm.initString,
# src/vm.c:128:     freeObjects();
	jmp	"freeObjects"@PLT	#
	.cfi_endproc
.LFE31:
	.size	"freeVM", .-"freeVM"
	.p2align 4
	.globl	"freeResources"
	.type	"freeResources", @function
"freeResources":
.LFB32:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 8[rsp], rbx	#,
	.cfi_offset 3, -40
# src/vm.c:132:     Obj* iter = vm.objects;
	mov	rbx, QWORD PTR "vm"[rip+8392320]	# next, vm.objects
# src/vm.c:134:     while (iter != NULL) {
	test	rbx, rbx	# next
	je	.L593	#,
	mov	QWORD PTR 24[rsp], r12	#,
	.cfi_offset 12, -24
# src/vm.c:133:     Obj* previous = NULL;
	xor	r12d, r12d	# previous
	mov	QWORD PTR 32[rsp], r13	#,
	.cfi_offset 13, -16
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	r13, 1125899906842623	# tmp108,
	mov	QWORD PTR 16[rsp], rbp	#,
	.cfi_offset 6, -32
	jmp	.L600	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L597:
# src/vm.c:144:             previous = iter;
	mov	r12, rbp	# previous, iter
# src/vm.c:134:     while (iter != NULL) {
	test	rbx, rbx	# next
	je	.L609	#,
.L600:
	mov	rbp, rbx	# iter, next
# src/vm.c:135:         Obj* next = iter->next;  // save before any potential free
	mov	rbx, QWORD PTR 8[rbx]	# next, iter_23->next
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rax, rbp	# _18, iter
	and	rax, r13	# _18, tmp108
# src/object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 8	# _18->type,
	jne	.L597	#,
# src/vm.c:136:         if (IS_RESOURCE(OBJ_VAL(iter)) && AS_RESOURCE(OBJ_VAL(iter))->destroy) {
	mov	rdx, QWORD PTR 32[rax]	# _2, MEM[(struct ObjResource *)_18].destroy
# src/vm.c:136:         if (IS_RESOURCE(OBJ_VAL(iter)) && AS_RESOURCE(OBJ_VAL(iter))->destroy) {
	test	rdx, rdx	# _2
	je	.L597	#,
# src/vm.c:137:             AS_RESOURCE(OBJ_VAL(iter))->destroy(AS_RESOURCE(OBJ_VAL(iter))->handle);
	mov	rdi, QWORD PTR 24[rax]	# MEM[(struct ObjResource *)_18].handle, MEM[(struct ObjResource *)_18].handle
	call	rdx	# _2
# src/vm.c:138:             if (previous == NULL)
	test	r12, r12	# previous
	je	.L610	#,
# src/vm.c:141:                 previous->next = next;
	mov	QWORD PTR 8[r12], rbx	# previous_24->next, next
.L599:
# src/vm.c:142:             free(iter);
	mov	rdi, rbp	#, iter
	call	"free"@PLT	#
# src/vm.c:134:     while (iter != NULL) {
	test	rbx, rbx	# next
	jne	.L600	#,
.L609:
	mov	rbp, QWORD PTR 16[rsp]	#,
	.cfi_restore 6
	mov	r12, QWORD PTR 24[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 32[rsp]	#,
	.cfi_restore 13
.L593:
# src/vm.c:148: }
	mov	rbx, QWORD PTR 8[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L610:
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
# src/vm.c:139:                 vm.objects = next;
	mov	QWORD PTR "vm"[rip+8392320], rbx	# vm.objects, next
	jmp	.L599	#
	.cfi_endproc
.LFE32:
	.size	"freeResources", .-"freeResources"
	.p2align 4
	.globl	"push"
	.type	"push", @function
"push":
.LFB33:
	.cfi_startproc
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR "vm"[rip+8392312]	# _1, vm.stackTop
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, "vm"[rip+8390152]	# tmp102,
	cmp	rax, rdx	# _1, tmp102
	je	.L616	#,
# src/vm.c:156:     *vm.stackTop = value;
	mov	QWORD PTR [rax], rdi	# *_1, value
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp104,
	mov	QWORD PTR "vm"[rip+8392312], rax	# vm.stackTop, tmp104
	ret	
.L616:
# src/vm.c:150: void push(Value value) {
	push	rax	#
	.cfi_def_cfa_offset 16
	call	"push.part.0"	#
	.cfi_endproc
.LFE33:
	.size	"push", .-"push"
	.p2align 4
	.globl	"pop"
	.type	"pop", @function
"pop":
.LFB34:
	.cfi_startproc
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR "vm"[rip+8392312]	# _1, vm.stackTop
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# tmp103,
# src/vm.c:162:     return *vm.stackTop;
	mov	rax, QWORD PTR -8[rax]	# MEM[(Value *)_1 + -8B], MEM[(Value *)_1 + -8B]
# src/vm.c:161:     vm.stackTop--;
	mov	QWORD PTR "vm"[rip+8392312], rdx	# vm.stackTop, tmp103
# src/vm.c:163: }
	ret	
	.cfi_endproc
.LFE34:
	.size	"pop", .-"pop"
	.p2align 4
	.globl	"peek"
	.type	"peek", @function
"peek":
.LFB35:
	.cfi_startproc
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR "vm"[rip+8392312]	# vm.stackTop, vm.stackTop
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	not	edi	# _2
	movsxd	rdi, edi	# _3, _2
# src/vm.c:166:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR [rax+rdi*8]	# *_5, *_5
# src/vm.c:167: }
	ret	
	.cfi_endproc
.LFE35:
	.size	"peek", .-"peek"
	.p2align 4
	.globl	"interpret"
	.type	"interpret", @function
"interpret":
.LFB47:
	.cfi_startproc
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 32
	mov	QWORD PTR [rsp], rbx	#,
	.cfi_offset 3, -32
	mov	rbx, rdi	# source, source
	mov	QWORD PTR 8[rsp], rbp	#,
	.cfi_offset 6, -24
# src/vm.c:22:     vm.stackTop = vm.stack;
	lea	rbp, "vm"[rip]	# tmp115,
# src/vm.c:1204:     initLookup();
	call	"initLookup"@PLT	#
# src/vm.c:22:     vm.stackTop = vm.stack;
	lea	rax, 1544[rbp]	# tmp167,
# src/vm.c:1207:     ObjFunction* function = compile(source);
	mov	rdi, rbx	#, source
# src/vm.c:23:     vm.frameCount = 0;
	mov	DWORD PTR "vm"[rip+1536], 0	# vm.frameCount,
# src/vm.c:22:     vm.stackTop = vm.stack;
	mov	QWORD PTR "vm"[rip+8392312], rax	# vm.stackTop, tmp167
# src/vm.c:24:     vm.openUpvalues = NULL;
	mov	QWORD PTR "vm"[rip+8390232], 0	# vm.openUpvalues,
# src/vm.c:25:     vm.handlerCount = 0;
	mov	DWORD PTR "vm"[rip+8392288], 0	# vm.handlerCount,
# src/vm.c:1207:     ObjFunction* function = compile(source);
	call	"compile"@PLT	#
# src/vm.c:1208:     if (function == NULL) return INTERPRET_COMPILE_ERROR;
	test	rax, rax	# function
	je	.L620	#,
	mov	rdi, rax	# function,
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR "vm"[rip+8392312]	# _19, vm.stackTop
	mov	QWORD PTR 16[rsp], r12	#,
	.cfi_offset 12, -16
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	r12, 8390152[rbp]	# tmp121,
	cmp	rax, r12	# _19, tmp121
	je	.L622	#,
# src/vm.c:1210:     push(OBJ_VAL(function));
	mov	rdx, rdi	# tmp123, function
# src/vm.c:157:     vm.stackTop++;
	add	rax, 8	# tmp125,
# src/vm.c:1210:     push(OBJ_VAL(function));
	movabs	rbx, -1125899906842624	# tmp122,
	or	rdx, rbx	# tmp123, tmp122
	mov	QWORD PTR -8[rax], rdx	# *_19, tmp123
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR "vm"[rip+8392312], rax	# vm.stackTop, tmp125
# src/vm.c:1211:     ObjClosure* closure = newClosure(function);
	call	"newClosure"@PLT	#
	mov	rcx, rax	# closure,
# src/vm.c:161:     vm.stackTop--;
	mov	rax, QWORD PTR "vm"[rip+8392312]	# _17, vm.stackTop
# src/vm.c:161:     vm.stackTop--;
	lea	rdx, -8[rax]	# _18,
	mov	QWORD PTR "vm"[rip+8392312], rdx	# vm.stackTop, _18
# src/vm.c:151:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, r12	# _18, tmp121
	je	.L622	#,
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	rdi, QWORD PTR 16[rcx]	# _32, closure_13->function
# src/vm.c:1213:     push(OBJ_VAL(closure));
	or	rbx, rcx	# tmp130, closure
	mov	QWORD PTR -8[rax], rbx	# MEM[(Value *)_17 + -8B], tmp130
# src/vm.c:170:     if (argCount != closure->function->arity) {
	mov	esi, DWORD PTR 16[rdi]	# _33, _32->arity
# src/vm.c:157:     vm.stackTop++;
	mov	QWORD PTR "vm"[rip+8392312], rax	# vm.stackTop, _17
# src/vm.c:170:     if (argCount != closure->function->arity) {
	test	esi, esi	# _33
	jne	.L627	#,
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rax, DWORD PTR "vm"[rip+1536]	#, vm.frameCount
# src/vm.c:176:     if (vm.frameCount == FRAMES_MAX) {
	cmp	eax, 64	# _35,
	je	.L628	#,
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	esi, 1[rax]	# tmp136,
# src/vm.c:182:     frame->closure = closure;
	lea	rax, [rax+rax*2]	# tmp142,
	mov	QWORD PTR 0[rbp+rax*8], rcx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_35].closure, closure
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	rcx, QWORD PTR 32[rdi]	# _32->chunk.code, _32->chunk.code
# src/vm.c:181:     CallFrame* frame = &vm.frames[vm.frameCount++];
	mov	DWORD PTR "vm"[rip+1536], esi	# vm.frameCount, tmp136
# src/vm.c:183:     frame->ip = closure->function->chunk.code;
	mov	QWORD PTR 8[rbp+rax*8], rcx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_35].ip, _32->chunk.code
# src/vm.c:184:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[rbp+rax*8], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[_35].slots, _18
.L624:
# src/vm.c:1216:     return run();
	mov	r12, QWORD PTR 16[rsp]	#,
	.cfi_remember_state
	.cfi_restore 12
# src/vm.c:1217: }
	mov	rbx, QWORD PTR [rsp]	#,
	mov	rbp, QWORD PTR 8[rsp]	#,
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
# src/vm.c:1216:     return run();
	jmp	"run"	#
	.p2align 4,,10
	.p2align 3
.L627:
	.cfi_restore_state
# src/vm.c:171:         runtimeError("Expected %d arguments but got %d.", closure->function->arity, argCount);
	xor	edx, edx	#
	lea	rdi, .LC6[rip]	#,
	xor	eax, eax	#
	call	"runtimeError"	#
	jmp	.L624	#
	.p2align 4,,10
	.p2align 3
.L620:
	.cfi_restore 12
# src/vm.c:1217: }
	mov	rbx, QWORD PTR [rsp]	#,
	mov	rbp, QWORD PTR 8[rsp]	#,
	mov	eax, 1	#,
	add	rsp, 24	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L628:
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -16
# src/vm.c:177:         runtimeError("Call stack overflow.");
	lea	rdi, .LC7[rip]	#,
	xor	eax, eax	#
	call	"runtimeError"	#
# src/vm.c:178:         return false;
	jmp	.L624	#
.L622:
	call	"push.part.0"	#
	.cfi_endproc
.LFE47:
	.size	"interpret", .-"interpret"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	"dispatchTable.0", @object
	.size	"dispatchTable.0", 544
"dispatchTable.0":
	.quad	.L88
	.quad	.L90
	.quad	.L93
	.quad	.L94
	.quad	.L95
	.quad	.L96
	.quad	.L97
	.quad	.L98
	.quad	.L99
	.quad	.L100
	.quad	.L101
	.quad	.L105
	.quad	.L108
	.quad	.L109
	.quad	.L110
	.quad	.L114
	.quad	.L118
	.quad	.L119
	.quad	.L120
	.quad	.L135
	.quad	.L150
	.quad	.L155
	.quad	.L160
	.quad	.L163
	.quad	.L166
	.quad	.L174
	.quad	.L179
	.quad	.L180
	.quad	.L187
	.quad	.L192
	.quad	.L181
	.quad	.L197
	.quad	.L198
	.quad	.L203
	.quad	.L208
	.quad	.L212
	.quad	.L215
	.quad	.L218
	.quad	.L221
	.quad	.L250
	.quad	.L252
	.quad	.L233
	.quad	.L236
	.quad	.L239
	.quad	.L248
	.quad	.L245
	.quad	.L242
	.quad	.L254
	.quad	.L271
	.quad	.L272
	.quad	.L273
	.quad	.L276
	.quad	.L277
	.quad	.L278
	.quad	.L279
	.quad	.L280
	.quad	.L286
	.quad	.L292
	.quad	.L303
	.quad	.L314
	.quad	.L318
	.quad	.L319
	.quad	.L320
	.quad	.L326
	.quad	.L327
	.quad	.L328
	.quad	.L332
	.quad	.L333
	.local	"errorWasHandled"
	.comm	"errorWasHandled",1,1
	.globl	"eventQueue"
	.bss
	.align 32
	.type	"eventQueue", @object
	.size	"eventQueue", 3080
"eventQueue":
	.zero	3080
	.globl	"vm"
	.align 32
	.type	"vm", @object
	.size	"vm", 8392344
"vm":
	.zero	8392344
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC24:
	.quad	9222246136947933185
	.quad	9222246136947933185
	.align 16
.LC31:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 16
.LC40:
	.quad	0
	.quad	1048576
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
