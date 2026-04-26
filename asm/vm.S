	.file	"vm.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=48 --param=l1-cache-line-size=64 --param=l2-cache-size=12288 -mtune=arrowlake-s -masm=intel -O3
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"[line %d] in "
.LC1:
	.string	"script\n"
.LC2:
	.string	"%s()\n"
	.text
	.p2align 4
	.type	runtimeError, @function
runtimeError:
.LFB24:
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
	sub	rsp, 216	#,
	.cfi_def_cfa_offset 256
	test	al, al	#
	mov	QWORD PTR 40[rsp], rsi	#,
	mov	QWORD PTR 48[rsp], rdx	#,
	mov	QWORD PTR 56[rsp], rcx	#,
	mov	QWORD PTR 64[rsp], r8	#,
	mov	QWORD PTR 72[rsp], r9	#,
	je	.L2	#,
	vmovaps	XMMWORD PTR 80[rsp], xmm0	#,
	vmovaps	XMMWORD PTR 96[rsp], xmm1	#,
	vmovaps	XMMWORD PTR 112[rsp], xmm2	#,
	vmovaps	XMMWORD PTR 128[rsp], xmm3	#,
	vmovaps	XMMWORD PTR 144[rsp], xmm4	#,
	vmovaps	XMMWORD PTR 160[rsp], xmm5	#,
	vmovaps	XMMWORD PTR 176[rsp], xmm6	#,
	vmovaps	XMMWORD PTR 192[rsp], xmm7	#,
.L2:
# src/vm.c:23: static void runtimeError(const char* format, ...) {
	mov	rax, QWORD PTR fs:40	# tmp128, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 24[rsp], rax	# D.5784, tmp128
	xor	eax, eax	# tmp128
# src/vm.c:26:     vfprintf(stderr, format, args);
	mov	rsi, rdi	#, format
# src/vm.c:25:     va_start(args, format);
	lea	rax, 256[rsp]	# tmp168,
# src/vm.c:26:     vfprintf(stderr, format, args);
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
# src/vm.c:25:     va_start(args, format);
	mov	QWORD PTR 8[rsp], rax	# MEM[(struct [1] *)&args].overflow_arg_area, tmp168
# src/vm.c:26:     vfprintf(stderr, format, args);
	mov	rdx, rsp	# tmp130,
# src/vm.c:25:     va_start(args, format);
	lea	rax, 32[rsp]	# tmp169,
	mov	DWORD PTR [rsp], 8	# MEM[(struct [1] *)&args].gp_offset,
	mov	DWORD PTR 4[rsp], 48	# MEM[(struct [1] *)&args].fp_offset,
	mov	QWORD PTR 16[rsp], rax	# MEM[(struct [1] *)&args].reg_save_area, tmp169
# src/vm.c:26:     vfprintf(stderr, format, args);
	call	vfprintf@PLT	#
# src/vm.c:28:     fputs("\n", stderr);
	mov	rsi, QWORD PTR stderr[rip]	#, stderr
	mov	edi, 10	#,
	call	fputc@PLT	#
# src/vm.c:30:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	mov	eax, DWORD PTR vm[rip+1536]	# i, vm.frameCount
# src/vm.c:30:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	lea	r13, vm[rip]	# tmp161,
# src/vm.c:30:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	sub	eax, 1	# i,
	js	.L7	#,
	movsxd	rdx, eax	# _44, i
	mov	eax, eax	# _13, i
	lea	rcx, [rdx+rdx*2]	# _43,
	sub	rdx, rax	# _53, _13
	lea	rax, [rdx+rdx*2]	# _54,
	lea	rbx, 0[r13+rcx*8]	# ivtmp.159,
	lea	r12, -24[r13+rax*8]	# _57,
	jmp	.L6	#
	.p2align 4,,10
	.p2align 3
.L4:
# src/vm.c:38:             fprintf(stderr, "%s()\n", function->name->chars);
	mov	rdx, QWORD PTR 24[rax]	# _12->chars, _12->chars
	lea	rsi, .LC2[rip]	#,
	xor	eax, eax	#
# src/vm.c:30:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	sub	rbx, 24	# ivtmp.159,
# src/vm.c:38:             fprintf(stderr, "%s()\n", function->name->chars);
	call	fprintf@PLT	#
# src/vm.c:30:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	cmp	rbx, r12	# ivtmp.159, _57
	je	.L7	#,
.L6:
# src/vm.c:32:         ObjFunction* function = frame->function;
	mov	rbp, QWORD PTR [rbx]	# function, MEM[(struct ObjFunction * *)_41]
# src/vm.c:33:         size_t instruction = frame->ip - function->chunk.code - 1;
	mov	rax, QWORD PTR 8[rbx]	# MEM[(uint8_t * *)_41 + 8B], MEM[(uint8_t * *)_41 + 8B]
# src/vm.c:34:         fprintf(stderr, "[line %d] in ", getLine(&function->chunk, instruction));
	lea	rdi, 24[rbp]	# _9,
# src/vm.c:33:         size_t instruction = frame->ip - function->chunk.code - 1;
	sub	rax, QWORD PTR 32[rbp]	# _6, function_27->chunk.code
# src/vm.c:34:         fprintf(stderr, "[line %d] in ", getLine(&function->chunk, instruction));
	lea	esi, -1[rax]	# _7,
	call	getLine@PLT	#
# src/vm.c:34:         fprintf(stderr, "[line %d] in ", getLine(&function->chunk, instruction));
	mov	rdi, QWORD PTR stderr[rip]	#, stderr
	mov	edx, eax	#, _10
	lea	rsi, .LC0[rip]	#,
	xor	eax, eax	#
	call	fprintf@PLT	#
# src/vm.c:35:         if (function->name == NULL) {
	mov	rax, QWORD PTR 72[rbp]	# _12, function_27->name
# src/vm.c:36:             fprintf(stderr, "script\n");
	mov	rdi, QWORD PTR stderr[rip]	# pretmp_51, stderr
# src/vm.c:35:         if (function->name == NULL) {
	test	rax, rax	# _12
	jne	.L4	#,
# src/vm.c:36:             fprintf(stderr, "script\n");
	mov	rcx, rdi	#, pretmp_51
	mov	edx, 7	#,
	mov	esi, 1	#,
	lea	rdi, .LC1[rip]	#,
# src/vm.c:30:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	sub	rbx, 24	# ivtmp.159,
# src/vm.c:36:             fprintf(stderr, "script\n");
	call	fwrite@PLT	#
# src/vm.c:30:     for (int i = vm.frameCount - 1; i >= 0; i--) {
	cmp	rbx, r12	# ivtmp.159, _57
	jne	.L6	#,
.L7:
# src/vm.c:19:     vm.stackTop = vm.stack;
	lea	rax, vm[rip+1544]	# tmp171,
	mov	QWORD PTR 16778832[r13], rax	# vm.stackTop, tmp171
# src/vm.c:20:     vm.frameCount = 0;
	mov	DWORD PTR vm[rip+1536], 0	# vm.frameCount,
# src/vm.c:43: }
	mov	rax, QWORD PTR 24[rsp]	# tmp166, D.5784
	sub	rax, QWORD PTR fs:40	# tmp166, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L14	#,
	add	rsp, 216	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
	ret	
.L14:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE24:
	.size	runtimeError, .-runtimeError
	.section	.rodata.str1.1
.LC3:
	.string	"Stack overflow!"
	.text
	.p2align 4
	.type	push.part.0, @function
push.part.0:
.LFB39:
	.cfi_startproc
# src/vm.c:83:         runtimeError("Stack overflow!");
	lea	rdi, .LC3[rip]	#,
# src/vm.c:81: void push(Value value) {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/vm.c:83:         runtimeError("Stack overflow!");
	xor	eax, eax	#
	call	runtimeError	#
# src/vm.c:84:         exit(1);
	mov	edi, 1	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE39:
	.size	push.part.0, .-push.part.0
	.p2align 4
	.globl	defineNative
	.type	defineNative, @function
defineNative:
.LFB25:
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
# src/vm.c:46:     push(OBJ_VAL(copyString(name, strlen(name))));
	call	strlen@PLT	#
# src/vm.c:46:     push(OBJ_VAL(copyString(name, strlen(name))));
	mov	esi, eax	# _1, tmp150
	mov	rdi, rbx	#, name
	call	copyString@PLT	#
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rbx, vm[rip]	# tmp119,
	mov	rdi, rax	# D.5110, _3
	mov	rax, QWORD PTR 16778832[rbx]	# _24, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	r8, 16778760[rbx]	# tmp120,
	cmp	rax, r8	# _24, tmp120
	je	.L19	#,
# src/vm.c:88:     vm.stackTop++;
	lea	rdx, 16[rax]	# _25,
	mov	esi, 3	# D.5110,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, r8	# _25, tmp120
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR [rax], rsi	# *_24, D.5110
	mov	QWORD PTR 8[rax], rdi	# *_24, D.5110
# src/vm.c:47:     push(OBJ_VAL(native));
	mov	esi, 3	# D.5111,
# src/vm.c:88:     vm.stackTop++;
	mov	QWORD PTR 16778832[rbx], rdx	# vm.stackTop, _25
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L19	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR 24[rax], rbp	# MEM[(struct Value *)_24 + 16B], D.5111
	mov	QWORD PTR 16[rax], rsi	# MEM[(struct Value *)_24 + 16B], D.5111
# src/vm.c:48:     tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
	mov	rdi, r8	#, tmp120
# src/vm.c:88:     vm.stackTop++;
	add	rax, 32	# tmp126,
# src/vm.c:48:     tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
	mov	edx, DWORD PTR vm[rip+1560]	#, vm.stack[1]
	mov	rcx, QWORD PTR vm[rip+1568]	#, vm.stack[1]
	mov	rsi, QWORD PTR vm[rip+1552]	#, vm.stack[0].as.obj
# src/vm.c:88:     vm.stackTop++;
	mov	QWORD PTR 16778832[rbx], rax	# vm.stackTop, tmp126
# src/vm.c:48:     tableSet(&vm.globals, AS_STRING(vm.stack[0]), vm.stack[1]);
	call	tableSet@PLT	#
# src/vm.c:49:     tableSet(&vm.consts, AS_STRING(vm.stack[0]), BOOL_VAL(true));
	mov	rsi, QWORD PTR vm[rip+1552]	#, vm.stack[0].as.obj
	lea	rdi, 16778784[rbx]	# tmp138,
	xor	edx, edx	#
	mov	ecx, 1	#,
	call	tableSet@PLT	#
# src/vm.c:92:     vm.stackTop--;
	sub	QWORD PTR 16778832[rbx], 32	# vm.stackTop,
# src/vm.c:52: }
	add	rsp, 8	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	#
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
.L19:
	.cfi_restore_state
	call	push.part.0	#
	.cfi_endproc
.LFE25:
	.size	defineNative, .-defineNative
	.p2align 4
	.globl	defineModule
	.type	defineModule, @function
defineModule:
.LFB41:
	.cfi_startproc
	jmp	defineNative	#
	.cfi_endproc
.LFE41:
	.size	defineModule, .-defineModule
	.p2align 4
	.globl	initVM
	.type	initVM, @function
initVM:
.LFB27:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/vm.c:20:     vm.frameCount = 0;
	lea	rbx, vm[rip]	# tmp100,
# src/vm.c:19:     vm.stackTop = vm.stack;
	lea	rax, 1544[rbx]	# tmp103,
	vmovq	xmm0, rax	# _10, tmp103
# src/vm.c:67:     initTable(&vm.globals);
	lea	rdi, 16778760[rbx]	# tmp104,
# src/vm.c:19:     vm.stackTop = vm.stack;
	vmovdqa	XMMWORD PTR 16778832[rbx], xmm0	# MEM <vector(2) long unsigned int> [(void *)&vm + 16778832B], _10
# src/vm.c:20:     vm.frameCount = 0;
	mov	DWORD PTR vm[rip+1536], 0	# vm.frameCount,
# src/vm.c:67:     initTable(&vm.globals);
	call	initTable@PLT	#
# src/vm.c:68:     initTable(&vm.consts);
	lea	rdi, 16778784[rbx]	# tmp106,
	call	initTable@PLT	#
# src/vm.c:69:     initTable(&vm.strings);
	lea	rdi, 16778808[rbx]	# tmp108,
	call	initTable@PLT	#
# src/vm.c:72: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/vm.c:71:     defineAllNatives();
	jmp	defineAllNatives@PLT	#
	.cfi_endproc
.LFE27:
	.size	initVM, .-initVM
	.p2align 4
	.globl	freeVM
	.type	freeVM, @function
freeVM:
.LFB28:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/vm.c:75:     freeTable(&vm.globals);
	lea	rbx, vm[rip]	# tmp99,
	lea	rdi, 16778760[rbx]	# tmp98,
	call	freeTable@PLT	#
# src/vm.c:76:     freeTable(&vm.consts);
	lea	rdi, 16778784[rbx]	# tmp100,
	call	freeTable@PLT	#
# src/vm.c:77:     freeTable(&vm.strings);
	lea	rdi, 16778808[rbx]	# tmp102,
	call	freeTable@PLT	#
# src/vm.c:79: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/vm.c:78:     freeObjects();
	jmp	freeObjects@PLT	#
	.cfi_endproc
.LFE28:
	.size	freeVM, .-freeVM
	.p2align 4
	.globl	push
	.type	push, @function
push:
.LFB29:
	.cfi_startproc
	mov	rdx, rsi	# value, value
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, vm[rip]	# tmp104,
	mov	rcx, QWORD PTR 16778832[rsi]	# _1, vm.stackTop
# src/vm.c:81: void push(Value value) {
	mov	rax, rdi	# value, value
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdi, 16778760[rsi]	# tmp105,
	cmp	rcx, rdi	# _1, tmp105
	je	.L31	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR [rcx], rax	# *_1, value
	mov	QWORD PTR 8[rcx], rdx	# *_1, value
# src/vm.c:88:     vm.stackTop++;
	add	rcx, 16	# tmp108,
	mov	QWORD PTR 16778832[rsi], rcx	# vm.stackTop, tmp108
	ret	
.L31:
# src/vm.c:81: void push(Value value) {
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	call	push.part.0	#
	.cfi_endproc
.LFE29:
	.size	push, .-push
	.p2align 4
	.globl	pop
	.type	pop, @function
pop:
.LFB30:
	.cfi_startproc
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, vm[rip]	# tmp103,
	mov	rax, QWORD PTR 16778832[rdx]	# _1, vm.stackTop
# src/vm.c:92:     vm.stackTop--;
	lea	rcx, -16[rax]	# tmp105,
	mov	QWORD PTR 16778832[rdx], rcx	# vm.stackTop, tmp105
# src/vm.c:93:     return *vm.stackTop;
	mov	rdx, QWORD PTR -8[rax]	# D.5283, MEM[(struct Value *)_1 + -16B]
# src/vm.c:93:     return *vm.stackTop;
	mov	eax, DWORD PTR -16[rax]	# <retval>, MEM[(struct Value *)_1 + -16B]
# src/vm.c:94: }
	ret	
	.cfi_endproc
.LFE30:
	.size	pop, .-pop
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Expected %d arguments but got %d."
	.section	.rodata.str1.1
.LC5:
	.string	"Call stack overflow."
.LC6:
	.string	"Undefined variable '%s'."
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Attempting to assign to constant '%s'."
	.section	.rodata.str1.1
.LC8:
	.string	"Only modules have properties."
.LC9:
	.string	"Undefined property '%s'."
.LC10:
	.string	"Operands must be numbers."
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Operands to addition must be two numbers or two strings."
	.align 8
.LC12:
	.string	"Operand to unary negation must be a number."
	.align 8
.LC14:
	.string	"Can only call functions and classes."
	.section	.text.unlikely,"ax",@progbits
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4
	.globl	interpret
	.type	interpret, @function
interpret:
.LFB37:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	r15	#
	push	r14	#
	push	r13	#
	push	r12	#
	push	rbx	#
	and	rsp, -32	#,
	sub	rsp, 160	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# src/vm.c:19:     vm.stackTop = vm.stack;
	mov	r12, QWORD PTR fs:40	# tmp1246, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 152[rsp], r12	# D.6204, tmp1246
	lea	r12, vm[rip]	# tmp1246,
# src/vm.c:20:     vm.frameCount = 0;
	mov	DWORD PTR vm[rip+1536], 0	# vm.frameCount,
# src/vm.c:19:     vm.stackTop = vm.stack;
	lea	rax, 1544[r12]	# tmp1294,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp1294
# src/vm.c:469:     ObjFunction* function = compile(source);
	call	compile@PLT	#
# src/vm.c:470:     if (function == NULL) return INTERPRET_COMPILE_ERROR;
	test	rax, rax	# function
	je	.L122	#,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rdx, QWORD PTR 16778832[r12]	# _12, vm.stackTop
	mov	rbx, rax	# function,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rax, 16778760[r12]	# tmp599,
	cmp	rdx, rax	# _12, tmp599
# src/vm.c:472:     push(OBJ_VAL(function));
	mov	esi, 3	# D.5276,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR [rdx], rsi	# *_12, D.5276
# src/vm.c:101:     if (argCount != function->arity) {
	mov	esi, DWORD PTR 16[rbx]	# _430, function_6->arity
# src/vm.c:88:     vm.stackTop++;
	lea	rax, 16[rdx]	# tmp602,
# src/vm.c:101:     if (argCount != function->arity) {
	test	esi, esi	# _430
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR 8[rdx], rbx	# *_12, D.5276
# src/vm.c:88:     vm.stackTop++;
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp602
# src/vm.c:101:     if (argCount != function->arity) {
	jne	.L139	#,
# src/vm.c:106:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rax, DWORD PTR vm[rip+1536]	#, vm.frameCount
# src/vm.c:106:     if (vm.frameCount == FRAMES_MAX) {
	cmp	eax, 64	# prephitmp_388,
	je	.L140	#,
.L38:
# src/vm.c:110:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	ecx, 1[rax]	# tmp612,
	mov	DWORD PTR vm[rip+1536], ecx	# vm.frameCount, tmp612
# src/vm.c:111:     frame->function = function;
	vmovq	xmm2, rbx	# function, function
	lea	rcx, [rax+rax*2]	# tmp618,
	vpinsrq	xmm0, xmm2, QWORD PTR 32[rbx], 1	# _1160, function, function_6->chunk.code
# src/vm.c:113:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[r12+rcx*8], rdx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[prephitmp_388].slots, _12
# src/vm.c:111:     frame->function = function;
	vmovdqu	XMMWORD PTR [r12+rcx*8], xmm0	# MEM <vector(2) long unsigned int> [(void *)vectp.286_1161], _1160
.L37:
# src/vm.c:162:     CallFrame* frame = &vm.frames[vm.frameCount - 1];
	lea	rax, [rax+rax*2]	# _714,
	lea	r15, [r12+rax*8]	# frame,
# src/vm.c:163:     register uint8_t* ip = frame->ip;
	mov	rbx, QWORD PTR 8[r15]	# ip, MEM <struct VM> [(struct CallFrame *)&vm].frames[prephitmp_345].ip
	lea	r14, .L41[rip]	# tmp1245,
	.p2align 4,,10
	.p2align 3
.L39:
# src/vm.c:204:         switch (instruction = READ_BYTE()) {
	cmp	BYTE PTR [rbx], 35	# MEM[(uint8_t *)ip_28 + -1B],
# src/vm.c:204:         switch (instruction = READ_BYTE()) {
	lea	r13, 1[rbx]	# ip,
# src/vm.c:204:         switch (instruction = READ_BYTE()) {
	ja	.L123	#,
	movzx	eax, BYTE PTR -1[r13]	# MEM[(uint8_t *)ip_28 + -1B], MEM[(uint8_t *)ip_28 + -1B]
	movsxd	rax, DWORD PTR [r14+rax*4]	# tmp646,
	add	rax, r14	# tmp647, tmp1245
	jmp	rax	# tmp647
	.section	.rodata
	.align 4
	.align 4
.L41:
	.long	.L76-.L41
	.long	.L75-.L41
	.long	.L74-.L41
	.long	.L73-.L41
	.long	.L72-.L41
	.long	.L71-.L41
	.long	.L70-.L41
	.long	.L69-.L41
	.long	.L68-.L41
	.long	.L67-.L41
	.long	.L66-.L41
	.long	.L65-.L41
	.long	.L64-.L41
	.long	.L63-.L41
	.long	.L62-.L41
	.long	.L61-.L41
	.long	.L60-.L41
	.long	.L59-.L41
	.long	.L58-.L41
	.long	.L57-.L41
	.long	.L56-.L41
	.long	.L55-.L41
	.long	.L54-.L41
	.long	.L53-.L41
	.long	.L52-.L41
	.long	.L51-.L41
	.long	.L50-.L41
	.long	.L49-.L41
	.long	.L48-.L41
	.long	.L47-.L41
	.long	.L46-.L41
	.long	.L45-.L41
	.long	.L44-.L41
	.long	.L43-.L41
	.long	.L42-.L41
	.long	.L40-.L41
	.text
	.p2align 4,,10
	.p2align 3
.L42:
# src/vm.c:431:                 int argCount = READ_BYTE();
	movzx	edi, BYTE PTR 0[r13]	#, *ip_28
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rsi, QWORD PTR 16778832[r12]	# _406, vm.stackTop
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	eax, edi	# _407, argCount
	not	eax	# _407
	cdqe
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	sal	rax, 4	# tmp1107,
	add	rax, rsi	# tmp1108, _406
# src/vm.c:431:                 int argCount = READ_BYTE();
	add	rbx, 2	# tmp1103,
# src/vm.c:118:     if (IS_OBJ(callee)) {
	cmp	DWORD PTR [rax], 3	# *_410,
# src/vm.c:431:                 int argCount = READ_BYTE();
	mov	QWORD PTR 8[r15], rbx	# frame_30->ip, tmp1103
	mov	r13, rdi	#,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rbx, QWORD PTR 8[rax]	# D.5939, *_410
# src/vm.c:118:     if (IS_OBJ(callee)) {
	jne	.L111	#,
# src/vm.c:119:         switch (OBJ_TYPE(callee)) {
	mov	eax, DWORD PTR [rbx]	# _470, SR.265_1005->type
# src/vm.c:119:         switch (OBJ_TYPE(callee)) {
	test	eax, eax	# _470
	je	.L112	#,
	cmp	eax, 2	# _470,
	jne	.L111	#,
# src/vm.c:125:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	sal	r13, 4	# _475,
# src/vm.c:125:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	sub	rsi, r13	# _477, _475
	lea	rdx, 128[rsp]	# tmp1138,
	call	[QWORD PTR 16[rbx]]	# MEM[(struct ObjNative *)SR.265_1005].function
# src/vm.c:125:                 if (native(argCount, vm.stackTop - argCount, &result)) {
	test	al, al	# _478
	je	.L117	#,
# src/vm.c:126:                     vm.stackTop -= argCount + 1;
	mov	rax, -16	# tmp1143,
	sub	rax, r13	# _480, _475
	add	rax, QWORD PTR 16778832[r12]	# _481, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp1146,
	cmp	rax, rdx	# _481, tmp1146
# src/vm.c:126:                     vm.stackTop -= argCount + 1;
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, _481
	vmovdqa	xmm0, XMMWORD PTR 128[rsp]	# value, MEM[(struct  *)_725]
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_481, value
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp1149,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp1149
# src/vm.c:436:                 frame = &vm.frames[vm.frameCount - 1];
	mov	eax, DWORD PTR 1536[r12]	# tmp1309, vm.frameCount
	sub	eax, 1	# prephitmp_740,
	cdqe
.L116:
# src/vm.c:436:                 frame = &vm.frames[vm.frameCount - 1];
	lea	rax, [rax+rax*2]	# _683,
	lea	r15, [r12+rax*8]	# frame,
# src/vm.c:437:                 ip = frame->ip;
	mov	rbx, QWORD PTR 8[r15]	# ip, MEM <struct VM> [(struct CallFrame *)&vm].frames[prephitmp_740].ip
# src/vm.c:438:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L43:
# src/vm.c:427:                 ip -= offset;
	movbe	ax, WORD PTR 0[r13]	# bswapdst_764, MEM <short unsigned int> [(uint8_t *)ip_28]
	movzx	eax, ax	# _400, bswapdst_764
	sub	rbx, rax	# _401, _400
	add	rbx, 3	# ip,
# src/vm.c:428:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L47:
# src/vm.c:92:     vm.stackTop--;
	mov	rax, QWORD PTR 16778832[r12]	# _365, vm.stackTop
# src/vm.c:93:     return *vm.stackTop;
	mov	rdi, QWORD PTR -16[rax]	# D.5942, MEM[(struct Value *)_365 + -16B]
	mov	rsi, QWORD PTR -8[rax]	# D.5942, MEM[(struct Value *)_365 + -16B]
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, -16[rax]	# tmp1085,
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, tmp1085
# src/vm.c:410:                 printValue(pop());
	call	printValue@PLT	#
# src/vm.c:411:                 printf("\n");
	mov	edi, 10	#,
	call	putchar@PLT	#
	.p2align 4,,10
	.p2align 3
.L97:
# src/vm.c:204:         switch (instruction = READ_BYTE()) {
	mov	rbx, r13	# ip, ip
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L48:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# _360, vm.stackTop
# src/vm.c:401:                 if (!IS_NUMBER(peek(0))) {
	cmp	DWORD PTR -16[rax], 2	# MEM <unsigned int> [(struct Value *)_360 + -16B],
	jne	.L141	#,
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, -16[rax]	# _362,
# src/vm.c:406:                 push(NUMBER_VAL(-AS_NUMBER(pop())));
	vmovsd	xmm0, QWORD PTR -8[rax]	# MEM[(struct Value *)_360 + -16B].as.number, MEM[(struct Value *)_360 + -16B].as.number
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, 16778760[r12]	# tmp1080,
	cmp	rdx, rsi	# _362, tmp1080
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, _362
# src/vm.c:406:                 push(NUMBER_VAL(-AS_NUMBER(pop())));
	vxorpd	xmm0, xmm0, XMMWORD PTR .LC13[rip]	# _364, MEM[(struct Value *)_360 + -16B].as.number,
# src/vm.c:406:                 push(NUMBER_VAL(-AS_NUMBER(pop())));
	mov	ecx, 2	# D.5988,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR -16[rax], rcx	# MEM[(struct Value *)_360 + -16B], D.5988
	vmovq	QWORD PTR -8[rax], xmm0	# MEM[(struct Value *)_360 + -16B], D.5988
# src/vm.c:88:     vm.stackTop++;
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, _360
	jmp	.L97	#
	.p2align 4,,10
	.p2align 3
.L49:
# src/vm.c:92:     vm.stackTop--;
	mov	rax, QWORD PTR 16778832[r12]	# _352, vm.stackTop
# src/vm.c:398:                 push(BOOL_VAL(isFalsey(pop())));
	xor	ecx, ecx	# D.5998
# src/vm.c:93:     return *vm.stackTop;
	mov	r8, QWORD PTR -16[rax]	# D.5945, MEM[(struct Value *)_352 + -16B]
# src/vm.c:92:     vm.stackTop--;
	lea	rsi, -16[rax]	# _353,
# src/vm.c:144:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	cmp	r8d, 1	# D.5945,
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rsi	# vm.stackTop, _353
# src/vm.c:93:     return *vm.stackTop;
	mov	rdi, QWORD PTR -8[rax]	# D.5945, MEM[(struct Value *)_352 + -16B]
	mov	edx, 1	# prephitmp_689,
# src/vm.c:144:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	je	.L108	#,
# src/vm.c:398:                 push(BOOL_VAL(isFalsey(pop())));
	xor	edi, 1	# _980,
	xor	edx, edx	#
	test	r8d, r8d	# D.5945
	cmove	edx, edi	# _980,, prephitmp_689
.L108:
	mov	cl, dl	# D.5998, prephitmp_689
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp1072,
	cmp	rsi, rdx	# _353, tmp1072
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR -16[rax], 0	# MEM[(struct Value *)_352 + -16B],
	mov	QWORD PTR -8[rax], rcx	# MEM[(struct Value *)_352 + -16B], D.5998
# src/vm.c:88:     vm.stackTop++;
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, _352
# src/vm.c:399:                 break;
	jmp	.L97	#
	.p2align 4,,10
	.p2align 3
.L50:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# _344, vm.stackTop
# src/vm.c:396:             case OP_DIVIDE:   BINARY_OP(NUMBER_VAL, /); break;
	cmp	DWORD PTR -16[rax], 2	# MEM <unsigned int> [(struct Value *)_344 + -16B],
	jne	.L106	#,
# src/vm.c:396:             case OP_DIVIDE:   BINARY_OP(NUMBER_VAL, /); break;
	cmp	DWORD PTR -32[rax], 2	# MEM <unsigned int> [(struct Value *)_344 + -32B],
	jne	.L106	#,
# src/vm.c:93:     return *vm.stackTop;
	vmovsd	xmm1, QWORD PTR -8[rax]	# SR.222, MEM[(struct Value *)_344 + -16B].as.number
# src/vm.c:396:             case OP_DIVIDE:   BINARY_OP(NUMBER_VAL, /); break;
	vmovsd	xmm0, QWORD PTR -24[rax]	# MEM[(struct Value *)_344 + -32B].as.number, MEM[(struct Value *)_344 + -32B].as.number
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, -32[rax]	# _349,
# src/vm.c:396:             case OP_DIVIDE:   BINARY_OP(NUMBER_VAL, /); break;
	vdivsd	xmm0, xmm0, xmm1	# _351, MEM[(struct Value *)_344 + -32B].as.number, SR.222
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, _349
.L135:
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, 16778760[r12]	# tmp1065,
	cmp	rdx, rsi	# _349, tmp1065
# src/vm.c:396:             case OP_DIVIDE:   BINARY_OP(NUMBER_VAL, /); break;
	mov	ecx, 2	# D.5989,
	vmovq	rbx, xmm0	# D.5989, _351
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
.L131:
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR -32[rax], rcx	#, D.5989
	mov	QWORD PTR -24[rax], rbx	#, D.5989
# src/vm.c:92:     vm.stackTop--;
	sub	rax, 16	# tmp1068,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp1068
# src/vm.c:396:             case OP_DIVIDE:   BINARY_OP(NUMBER_VAL, /); break;
	jmp	.L97	#
	.p2align 4,,10
	.p2align 3
.L45:
# src/vm.c:417:                 ip += offset;
	movbe	ax, WORD PTR 0[r13]	# bswapdst_831, MEM <short unsigned int> [(uint8_t *)ip_28]
	movzx	eax, ax	# _376, bswapdst_831
	lea	rbx, 3[rbx+rax]	# ip,
# src/vm.c:418:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L46:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# _367, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp1089,
	cmp	rax, rdx	# _367, tmp1089
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	vmovdqu	xmm0, XMMWORD PTR -16[rax]	# D.5941, MEM[(struct Value *)_367 + -16B]
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_367, D.5941
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp1092,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp1092
# src/vm.c:414:             case OP_DUP: push(peek(0)); break;
	jmp	.L97	#
	.p2align 4,,10
	.p2align 3
.L44:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:421:                 uint16_t offset = READ_SHORT();
	add	rbx, 3	# ip,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -16[rdx]	# D.5940, MEM[(struct Value *)_387 + -16B]
	movzx	eax, WORD PTR 0[r13]	# load_dst_805, MEM <short unsigned int> [(uint8_t *)ip_28]
# src/vm.c:144:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	cmp	ecx, 1	# D.5940,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[rdx]	# D.5940, MEM[(struct Value *)_387 + -16B]
# src/vm.c:144:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	je	.L110	#,
# src/vm.c:144:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	test	ecx, ecx	# D.5940
	jne	.L39	#,
# src/vm.c:144:     return IS_NULL(value) || (IS_BOOL(value) && !AS_BOOL(value));
	test	dl, dl	# D.5940
	jne	.L39	#,
.L110:
# src/vm.c:422:                 if (isFalsey(peek(0))) ip += offset;
	rol	ax, 8	# bswapdst_799,
	movzx	eax, ax	# _391, bswapdst_799
	add	rbx, rax	# ip, _391
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L51:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# _336, vm.stackTop
# src/vm.c:395:             case OP_MULTIPLY: BINARY_OP(NUMBER_VAL, *); break;
	cmp	DWORD PTR -16[rax], 2	# MEM <unsigned int> [(struct Value *)_336 + -16B],
	jne	.L106	#,
# src/vm.c:395:             case OP_MULTIPLY: BINARY_OP(NUMBER_VAL, *); break;
	cmp	DWORD PTR -32[rax], 2	# MEM <unsigned int> [(struct Value *)_336 + -32B],
	jne	.L106	#,
# src/vm.c:93:     return *vm.stackTop;
	vmovsd	xmm0, QWORD PTR -8[rax]	# SR.226, MEM[(struct Value *)_336 + -16B].as.number
# src/vm.c:92:     vm.stackTop--;
	lea	rsi, -32[rax]	# _341,
# src/vm.c:395:             case OP_MULTIPLY: BINARY_OP(NUMBER_VAL, *); break;
	vmulsd	xmm3, xmm0, QWORD PTR -24[rax]	# _343, SR.226, MEM[(struct Value *)_336 + -32B].as.number
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rsi	# vm.stackTop, _341
# src/vm.c:395:             case OP_MULTIPLY: BINARY_OP(NUMBER_VAL, *); break;
	vmovq	rdx, xmm3	# _343, _343
.L133:
	mov	rbx, rdx	# D.5990, _343
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp1057,
	cmp	rsi, rdx	# _341, tmp1057
# src/vm.c:395:             case OP_MULTIPLY: BINARY_OP(NUMBER_VAL, *); break;
	mov	ecx, 2	# D.5990,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	jne	.L131	#,
.L77:
	call	push.part.0	#
	.p2align 4,,10
	.p2align 3
.L52:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# _328, vm.stackTop
# src/vm.c:394:             case OP_SUBTRACT: BINARY_OP(NUMBER_VAL, -); break;
	cmp	DWORD PTR -16[rax], 2	# MEM <unsigned int> [(struct Value *)_328 + -16B],
	jne	.L106	#,
# src/vm.c:394:             case OP_SUBTRACT: BINARY_OP(NUMBER_VAL, -); break;
	cmp	DWORD PTR -32[rax], 2	# MEM <unsigned int> [(struct Value *)_328 + -32B],
	jne	.L106	#,
# src/vm.c:93:     return *vm.stackTop;
	vmovsd	xmm1, QWORD PTR -8[rax]	# SR.230, MEM[(struct Value *)_328 + -16B].as.number
# src/vm.c:394:             case OP_SUBTRACT: BINARY_OP(NUMBER_VAL, -); break;
	vmovsd	xmm0, QWORD PTR -24[rax]	# MEM[(struct Value *)_328 + -32B].as.number, MEM[(struct Value *)_328 + -32B].as.number
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, -32[rax]	# _333,
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, _333
# src/vm.c:394:             case OP_SUBTRACT: BINARY_OP(NUMBER_VAL, -); break;
	vsubsd	xmm0, xmm0, xmm1	# _335, MEM[(struct Value *)_328 + -32B].as.number, SR.230
	jmp	.L135	#
	.p2align 4,,10
	.p2align 3
.L53:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# _314, vm.stackTop
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# D.5963, MEM[(struct Value *)_314 + -16B]
	mov	rbx, QWORD PTR -8[rax]	# D.5963, MEM[(struct Value *)_314 + -16B]
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	edx, 3	# D.5963,
	je	.L142	#,
# src/vm.c:383:                 } else if (IS_NUMBER(peek(0)) && IS_NUMBER(peek(1))) {
	cmp	edx, 2	# D.5963,
	jne	.L101	#,
# src/vm.c:383:                 } else if (IS_NUMBER(peek(0)) && IS_NUMBER(peek(1))) {
	cmp	DWORD PTR -32[rax], 2	# MEM <unsigned int> [(struct Value *)_314 + -32B],
	jne	.L101	#,
# src/vm.c:93:     return *vm.stackTop;
	vmovsd	xmm0, QWORD PTR -8[rax]	# SR.234, MEM[(struct Value *)_314 + -16B].as.number
# src/vm.c:92:     vm.stackTop--;
	lea	rsi, -32[rax]	# _325,
# src/vm.c:386:                     push(NUMBER_VAL(a + b));
	vaddsd	xmm4, xmm0, QWORD PTR -24[rax]	# _327, SR.234, MEM[(struct Value *)_314 + -32B].as.number
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rsi	# vm.stackTop, _325
# src/vm.c:386:                     push(NUMBER_VAL(a + b));
	vmovq	rdx, xmm4	# _327, _327
	jmp	.L133	#
	.p2align 4,,10
	.p2align 3
.L54:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# _305, vm.stackTop
# src/vm.c:379:             case OP_LESS:     BINARY_OP(BOOL_VAL, <); break;
	cmp	DWORD PTR -16[rax], 2	# MEM <unsigned int> [(struct Value *)_305 + -16B],
	jne	.L106	#,
# src/vm.c:379:             case OP_LESS:     BINARY_OP(BOOL_VAL, <); break;
	cmp	DWORD PTR -32[rax], 2	# MEM <unsigned int> [(struct Value *)_305 + -32B],
	jne	.L106	#,
# src/vm.c:93:     return *vm.stackTop;
	vmovsd	xmm0, QWORD PTR -8[rax]	# SR.238, MEM[(struct Value *)_305 + -16B].as.number
# src/vm.c:379:             case OP_LESS:     BINARY_OP(BOOL_VAL, <); break;
	xor	ecx, ecx	# D.5993
# src/vm.c:379:             case OP_LESS:     BINARY_OP(BOOL_VAL, <); break;
	vcomisd	xmm0, QWORD PTR -24[rax]	# SR.238, MEM[(struct Value *)_305 + -32B].as.number
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, -32[rax]	# _310,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, 16778760[r12]	# tmp1004,
	seta	cl	#, D.5993
	cmp	rdx, rsi	# _310, tmp1004
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, _310
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
.L128:
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR -32[rax], 0	#,
	mov	QWORD PTR -24[rax], rcx	#, D.5993
# src/vm.c:92:     vm.stackTop--;
	sub	rax, 16	# tmp1007,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp1007
# src/vm.c:379:             case OP_LESS:     BINARY_OP(BOOL_VAL, <); break;
	jmp	.L97	#
	.p2align 4,,10
	.p2align 3
.L55:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# _296, vm.stackTop
# src/vm.c:378:             case OP_GREATER:  BINARY_OP(BOOL_VAL, >); break;
	cmp	DWORD PTR -16[rax], 2	# MEM <unsigned int> [(struct Value *)_296 + -16B],
	jne	.L106	#,
# src/vm.c:378:             case OP_GREATER:  BINARY_OP(BOOL_VAL, >); break;
	cmp	DWORD PTR -32[rax], 2	# MEM <unsigned int> [(struct Value *)_296 + -32B],
	jne	.L106	#,
# src/vm.c:93:     return *vm.stackTop;
	vmovsd	xmm0, QWORD PTR -8[rax]	# SR.242, MEM[(struct Value *)_296 + -16B].as.number
	vmovsd	xmm1, QWORD PTR -24[rax]	# SR.243, MEM[(struct Value *)_296 + -32B].as.number
# src/vm.c:378:             case OP_GREATER:  BINARY_OP(BOOL_VAL, >); break;
	xor	ecx, ecx	# D.5994
# src/vm.c:378:             case OP_GREATER:  BINARY_OP(BOOL_VAL, >); break;
	vcomisd	xmm1, xmm0	# SR.243, SR.242
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, -32[rax]	# _301,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rsi, 16778760[r12]	# tmp994,
	seta	cl	#, D.5994
	cmp	rdx, rsi	# _301, tmp994
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, _301
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	jne	.L128	#,
	jmp	.L77	#
	.p2align 4,,10
	.p2align 3
.L56:
# src/vm.c:92:     vm.stackTop--;
	mov	rax, QWORD PTR 16778832[r12]	# _289, vm.stackTop
# src/vm.c:375:                 push(BOOL_VAL(valuesEqual(a, b)));
	xor	ebx, ebx	# D.5995
# src/vm.c:92:     vm.stackTop--;
	lea	rsi, -32[rax]	# tmp979,
	mov	rdx, QWORD PTR -16[rax]	# b, MEM[(struct Value *)_289 + -16B]
	mov	rcx, QWORD PTR -8[rax]	# b, MEM[(struct Value *)_289 + -16B]
# src/vm.c:93:     return *vm.stackTop;
	mov	rdi, QWORD PTR -32[rax]	# D.5973, MEM[(struct Value *)_289 + -32B]
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rsi	# vm.stackTop, tmp979
# src/vm.c:93:     return *vm.stackTop;
	mov	rsi, QWORD PTR -24[rax]	# D.5973, MEM[(struct Value *)_289 + -32B]
# src/vm.c:375:                 push(BOOL_VAL(valuesEqual(a, b)));
	call	valuesEqual@PLT	#
	mov	bl, al	# D.5995, _292
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _294, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp985,
	cmp	rax, rdx	# _294, tmp985
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR [rax], 0	# *_294,
	mov	QWORD PTR 8[rax], rbx	# *_294, D.5995
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp988,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp988
	jmp	.L97	#
	.p2align 4,,10
	.p2align 3
.L57:
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR -16[rax], 3	# MEM[(struct Value *)_262 + -16B],
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[rax]	# D.5975, MEM[(struct Value *)_262 + -16B]
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	je	.L143	#,
.L92:
# src/vm.c:366:                     frame->ip = ip;
	mov	QWORD PTR 8[r15], r13	# frame_30->ip, ip
# src/vm.c:367:                     runtimeError("Only modules have properties.");
	lea	rdi, .LC8[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
.L81:
# src/vm.c:245:                     return INTERPRET_RUNTIME_ERROR;
	mov	eax, 2	# <retval>,
.L34:
# src/vm.c:476: }
	mov	rdx, QWORD PTR 152[rsp]	# tmp1284, D.6204
	sub	rdx, QWORD PTR fs:40	# tmp1284, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L144	#,
	lea	rsp, -40[rbp]	#,
	pop	rbx	#
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
.L58:
	.cfi_restore_state
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR -16[rax], 3	# MEM[(struct Value *)_244 + -16B],
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -8[rax]	# D.5977, MEM[(struct Value *)_244 + -16B]
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	jne	.L92	#,
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rdx], 1	# SR.277_957->type,
	jne	.L92	#,
# src/vm.c:329:                     ObjString* name = READ_STRING();
	movzx	eax, BYTE PTR 0[r13]	# _253, *ip_28
	mov	rcx, QWORD PTR [r15]	# frame_30->function, frame_30->function
# src/vm.c:329:                     ObjString* name = READ_STRING();
	sal	rax, 4	# tmp941,
	add	rax, QWORD PTR 64[rcx]	# tmp942, _249->chunk.constants.values
	mov	r13, QWORD PTR 8[rax]	# name, _255->as.obj
# src/vm.c:332:                     if (!tableGet(&module->table, name, &value)) {
	lea	rdi, 16[rdx]	# _257,
	mov	rsi, r13	#, name
	lea	rdx, 96[rsp]	#,
	call	tableGet@PLT	#
# src/vm.c:329:                     ObjString* name = READ_STRING();
	add	rbx, 2	# ip,
# src/vm.c:332:                     if (!tableGet(&module->table, name, &value)) {
	test	al, al	# _258
	je	.L145	#,
# src/vm.c:92:     vm.stackTop--;
	mov	rax, QWORD PTR 16778832[r12]	# _260, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, 16778760[r12]	# tmp950,
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, -16[rax]	# _261,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rcx	# _261, tmp950
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, _261
	vmovdqa	xmm0, XMMWORD PTR 96[rsp]	# value, value
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR -16[rax], xmm0	# MEM[(struct Value *)_260 + -16B], value
# src/vm.c:88:     vm.stackTop++;
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, _260
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L59:
# src/vm.c:318:                 ObjString* name = READ_STRING_LONG();
	movzx	eax, BYTE PTR 1[r13]	# _229, MEM[(uint8_t *)ip_28 + 1B]
	movzx	edx, BYTE PTR 2[r13]	# _234, MEM[(uint8_t *)ip_28 + 2B]
	sal	eax, 8	# _230,
	sal	edx, 16	# _235,
	or	eax, edx	# _996, _235
	movzx	edx, BYTE PTR 0[r13]	# _227, *ip_28
	mov	rcx, QWORD PTR [r15]	# frame_30->function, frame_30->function
	or	eax, edx	# _236, _227
	cdqe
# src/vm.c:318:                 ObjString* name = READ_STRING_LONG();
	sal	rax, 4	# tmp918,
	add	rax, QWORD PTR 64[rcx]	# tmp919, _224->chunk.constants.values
	mov	r13, QWORD PTR 8[rax]	# name, _239->as.obj
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:319:                 tableSet(&vm.globals, name, peek(0));
	lea	rdi, 16778760[r12]	# tmp924,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# D.5978, MEM[(struct Value *)_241 + -16B]
	mov	rcx, QWORD PTR -8[rax]	# D.5978, MEM[(struct Value *)_241 + -16B]
# src/vm.c:319:                 tableSet(&vm.globals, name, peek(0));
	mov	rsi, r13	#, name
	call	tableSet@PLT	#
# src/vm.c:320:                 tableSet(&vm.consts, name, BOOL_VAL(true));
	lea	rdi, 16778784[r12]	# tmp928,
	xor	edx, edx	#
	mov	ecx, 1	#,
	mov	rsi, r13	#, name
	call	tableSet@PLT	#
# src/vm.c:318:                 ObjString* name = READ_STRING_LONG();
	add	rbx, 4	# ip,
# src/vm.c:92:     vm.stackTop--;
	sub	QWORD PTR 16778832[r12], 16	# vm.stackTop,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L60:
# src/vm.c:312:                 ObjString* name = READ_STRING();
	movzx	eax, BYTE PTR 0[r13]	# _217, *ip_28
	mov	rdx, QWORD PTR [r15]	# frame_30->function, frame_30->function
# src/vm.c:312:                 ObjString* name = READ_STRING();
	sal	rax, 4	# tmp890,
	add	rax, QWORD PTR 64[rdx]	# tmp891, _213->chunk.constants.values
	mov	r13, QWORD PTR 8[rax]	# name, _219->as.obj
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:313:                 tableSet(&vm.globals, name, peek(0));
	lea	rdi, 16778760[r12]	# tmp896,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# D.5979, MEM[(struct Value *)_221 + -16B]
	mov	rcx, QWORD PTR -8[rax]	# D.5979, MEM[(struct Value *)_221 + -16B]
# src/vm.c:313:                 tableSet(&vm.globals, name, peek(0));
	mov	rsi, r13	#, name
	call	tableSet@PLT	#
# src/vm.c:314:                 tableSet(&vm.consts, name, BOOL_VAL(true));
	lea	rdi, 16778784[r12]	# tmp900,
	xor	edx, edx	#
	mov	ecx, 1	#,
	mov	rsi, r13	#, name
	call	tableSet@PLT	#
# src/vm.c:312:                 ObjString* name = READ_STRING();
	add	rbx, 2	# ip,
# src/vm.c:92:     vm.stackTop--;
	sub	QWORD PTR 16778832[r12], 16	# vm.stackTop,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L61:
# src/vm.c:293:                 ObjString* name = READ_STRING_LONG();
	movzx	eax, BYTE PTR 1[r13]	# _196, MEM[(uint8_t *)ip_28 + 1B]
	movzx	edx, BYTE PTR 2[r13]	# _201, MEM[(uint8_t *)ip_28 + 2B]
	sal	eax, 8	# _197,
	sal	edx, 16	# _202,
	or	eax, edx	# _985, _202
	movzx	edx, BYTE PTR 0[r13]	# _194, *ip_28
	mov	rcx, QWORD PTR [r15]	# frame_30->function, frame_30->function
	or	eax, edx	# _203, _194
	cdqe
# src/vm.c:293:                 ObjString* name = READ_STRING_LONG();
	sal	rax, 4	# tmp869,
	add	rax, QWORD PTR 64[rcx]	# tmp870, _191->chunk.constants.values
	mov	r13, QWORD PTR 8[rax]	# name, _206->as.obj
# src/vm.c:296:                 if (tableGet(&vm.consts, name, &isConst)) {
	lea	rdx, 112[rsp]	# tmp871,
	lea	rdi, 16778784[r12]	# tmp872,
	mov	rsi, r13	#, name
	call	tableGet@PLT	#
# src/vm.c:293:                 ObjString* name = READ_STRING_LONG();
	add	rbx, 4	# ip,
# src/vm.c:296:                 if (tableGet(&vm.consts, name, &isConst)) {
	test	al, al	# _208
	jne	.L138	#,
# src/vm.c:303:                 if (!tableGet(&vm.globals, name, &dummy)) {
	lea	rdi, 16778760[r12]	# tmp877,
	lea	rdx, 128[rsp]	# tmp876,
	mov	rsi, r13	#, name
	mov	QWORD PTR 24[rsp], rdi	# %sfp, tmp877
	call	tableGet@PLT	#
# src/vm.c:303:                 if (!tableGet(&vm.globals, name, &dummy)) {
	test	al, al	# _210
	mov	rdi, QWORD PTR 24[rsp]	# tmp877, %sfp
	je	.L137	#,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:309:                 tableSet(&vm.globals, name, peek(0));
	mov	rsi, r13	#, name
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# D.5980, MEM[(struct Value *)_212 + -16B]
	mov	rcx, QWORD PTR -8[rax]	# D.5980, MEM[(struct Value *)_212 + -16B]
# src/vm.c:309:                 tableSet(&vm.globals, name, peek(0));
	call	tableSet@PLT	#
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L62:
# src/vm.c:274:                 ObjString* name = READ_STRING();
	movzx	eax, BYTE PTR 0[r13]	# _182, *ip_28
	mov	rdx, QWORD PTR [r15]	# frame_30->function, frame_30->function
# src/vm.c:274:                 ObjString* name = READ_STRING();
	sal	rax, 4	# tmp841,
	add	rax, QWORD PTR 64[rdx]	# tmp842, _178->chunk.constants.values
	mov	r13, QWORD PTR 8[rax]	# name, _184->as.obj
# src/vm.c:277:                 if (tableGet(&vm.consts, name, &isConst)) {
	lea	rdx, 112[rsp]	# tmp843,
	lea	rdi, 16778784[r12]	# tmp844,
	mov	rsi, r13	#, name
	call	tableGet@PLT	#
# src/vm.c:274:                 ObjString* name = READ_STRING();
	add	rbx, 2	# ip,
# src/vm.c:277:                 if (tableGet(&vm.consts, name, &isConst)) {
	test	al, al	# _186
	jne	.L138	#,
# src/vm.c:284:                 if (!tableGet(&vm.globals, name, &dummy)) {
	lea	rdi, 16778760[r12]	# tmp849,
	lea	rdx, 128[rsp]	# tmp848,
	mov	rsi, r13	#, name
	mov	QWORD PTR 24[rsp], rdi	# %sfp, tmp849
	call	tableGet@PLT	#
# src/vm.c:284:                 if (!tableGet(&vm.globals, name, &dummy)) {
	test	al, al	# _188
	mov	rdi, QWORD PTR 24[rsp]	# tmp849, %sfp
	je	.L137	#,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:290:                 tableSet(&vm.globals, name, peek(0));
	mov	rsi, r13	#, name
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# D.5981, MEM[(struct Value *)_190 + -16B]
	mov	rcx, QWORD PTR -8[rax]	# D.5981, MEM[(struct Value *)_190 + -16B]
# src/vm.c:290:                 tableSet(&vm.globals, name, peek(0));
	call	tableSet@PLT	#
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L63:
# src/vm.c:268:                 ObjString* name = READ_STRING_LONG();
	movzx	eax, BYTE PTR 1[r13]	# _163, MEM[(uint8_t *)ip_28 + 1B]
	movzx	edx, BYTE PTR 2[r13]	# _168, MEM[(uint8_t *)ip_28 + 2B]
	sal	eax, 8	# _164,
	sal	edx, 16	# _169,
	or	eax, edx	# _997, _169
	movzx	edx, BYTE PTR 0[r13]	# _161, *ip_28
	mov	rcx, QWORD PTR [r15]	# frame_30->function, frame_30->function
	or	eax, edx	# _170, _161
	cdqe
# src/vm.c:268:                 ObjString* name = READ_STRING_LONG();
	sal	rax, 4	# tmp824,
	add	rax, QWORD PTR 64[rcx]	# tmp825, _158->chunk.constants.values
	mov	rsi, QWORD PTR 8[rax]	# name, _173->as.obj
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:269:                 tableSet(&vm.globals, name, peek(0));
	lea	rdi, 16778760[r12]	# tmp830,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# D.5982, MEM[(struct Value *)_175 + -16B]
	mov	rcx, QWORD PTR -8[rax]	# D.5982, MEM[(struct Value *)_175 + -16B]
# src/vm.c:268:                 ObjString* name = READ_STRING_LONG();
	add	rbx, 4	# ip,
# src/vm.c:269:                 tableSet(&vm.globals, name, peek(0));
	call	tableSet@PLT	#
# src/vm.c:92:     vm.stackTop--;
	sub	QWORD PTR 16778832[r12], 16	# vm.stackTop,
# src/vm.c:271:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L64:
# src/vm.c:262:                 ObjString* name = READ_STRING();
	movzx	eax, BYTE PTR 0[r13]	# _151, *ip_28
	mov	rdx, QWORD PTR [r15]	# frame_30->function, frame_30->function
# src/vm.c:262:                 ObjString* name = READ_STRING();
	sal	rax, 4	# tmp800,
	add	rax, QWORD PTR 64[rdx]	# tmp801, _147->chunk.constants.values
	mov	rsi, QWORD PTR 8[rax]	# name, _153->as.obj
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rax, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:263:                 tableSet(&vm.globals, name, peek(0));
	lea	rdi, 16778760[r12]	# tmp806,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR -16[rax]	# D.5983, MEM[(struct Value *)_155 + -16B]
	mov	rcx, QWORD PTR -8[rax]	# D.5983, MEM[(struct Value *)_155 + -16B]
# src/vm.c:262:                 ObjString* name = READ_STRING();
	add	rbx, 2	# ip,
# src/vm.c:263:                 tableSet(&vm.globals, name, peek(0));
	call	tableSet@PLT	#
# src/vm.c:92:     vm.stackTop--;
	sub	QWORD PTR 16778832[r12], 16	# vm.stackTop,
# src/vm.c:265:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L65:
# src/vm.c:251:                 ObjString* name = READ_STRING_LONG();
	movzx	eax, BYTE PTR 1[r13]	# _131, MEM[(uint8_t *)ip_28 + 1B]
	movzx	edx, BYTE PTR 2[r13]	# _136, MEM[(uint8_t *)ip_28 + 2B]
	sal	eax, 8	# _132,
	sal	edx, 16	# _137,
	or	eax, edx	# _992, _137
	movzx	edx, BYTE PTR 0[r13]	# _129, *ip_28
	mov	rcx, QWORD PTR [r15]	# frame_30->function, frame_30->function
	or	eax, edx	# _138, _129
	cdqe
# src/vm.c:251:                 ObjString* name = READ_STRING_LONG();
	sal	rax, 4	# tmp785,
	add	rax, QWORD PTR 64[rcx]	# tmp786, _126->chunk.constants.values
	mov	rax, QWORD PTR 8[rax]	# name, _141->as.obj
# src/vm.c:253:                 if (!tableGet(&vm.globals, name, &value)) {
	lea	r13, 16778760[r12]	# tmp788,
	lea	rdx, 80[rsp]	# tmp787,
	mov	rsi, rax	#, name
	mov	rdi, r13	#, tmp788
# src/vm.c:251:                 ObjString* name = READ_STRING_LONG();
	mov	QWORD PTR 24[rsp], rax	# %sfp, name
# src/vm.c:253:                 if (!tableGet(&vm.globals, name, &value)) {
	call	tableGet@PLT	#
# src/vm.c:251:                 ObjString* name = READ_STRING_LONG();
	add	rbx, 4	# ip,
# src/vm.c:253:                 if (!tableGet(&vm.globals, name, &value)) {
	test	al, al	# _143
	je	.L136	#,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _145, vm.stackTop
	vmovdqa	xmm0, XMMWORD PTR 80[rsp]	# value, value
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r13	# _145, tmp788
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_145, value
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp796,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp796
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L66:
# src/vm.c:240:                 ObjString* name = READ_STRING();
	movzx	eax, BYTE PTR 0[r13]	# _118, *ip_28
	mov	rdx, QWORD PTR [r15]	# frame_30->function, frame_30->function
# src/vm.c:240:                 ObjString* name = READ_STRING();
	sal	rax, 4	# tmp763,
	add	rax, QWORD PTR 64[rdx]	# tmp764, _114->chunk.constants.values
	mov	rax, QWORD PTR 8[rax]	# name, _120->as.obj
# src/vm.c:242:                 if (!tableGet(&vm.globals, name, &value)) {
	lea	r13, 16778760[r12]	# tmp766,
	lea	rdx, 64[rsp]	# tmp765,
	mov	rsi, rax	#, name
	mov	rdi, r13	#, tmp766
# src/vm.c:240:                 ObjString* name = READ_STRING();
	mov	QWORD PTR 24[rsp], rax	# %sfp, name
# src/vm.c:242:                 if (!tableGet(&vm.globals, name, &value)) {
	call	tableGet@PLT	#
# src/vm.c:240:                 ObjString* name = READ_STRING();
	add	rbx, 2	# ip,
# src/vm.c:242:                 if (!tableGet(&vm.globals, name, &value)) {
	test	al, al	# _122
	je	.L136	#,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _124, vm.stackTop
	vmovdqa	xmm0, XMMWORD PTR 64[rsp]	# value, value
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, r13	# _124, tmp766
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_124, value
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp774,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp774
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L67:
# src/vm.c:235:                 int slot = READ_LONG();
	movzx	eax, BYTE PTR 0[r13]	# _100, *ip_28
	movzx	edx, BYTE PTR 1[r13]	# _103, MEM[(uint8_t *)ip_28 + 1B]
	sal	eax, 16	# _101,
	sal	edx, 8	# _104,
	or	eax, edx	# _105, _104
	movzx	edx, BYTE PTR 2[r13]	# _107, MEM[(uint8_t *)ip_28 + 2B]
	add	rbx, 4	# ip,
# src/vm.c:235:                 int slot = READ_LONG();
	or	eax, edx	# slot_108, _107
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:236:                 frame->slots[slot] = peek(0);
	cdqe
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	vmovdqu	xmm0, XMMWORD PTR -16[rdx]	# D.5984, MEM[(struct Value *)_113 + -16B]
# src/vm.c:236:                 frame->slots[slot] = peek(0);
	sal	rax, 4	# _111,
	add	rax, QWORD PTR 16[r15]	# _112, frame_30->slots
# src/vm.c:236:                 frame->slots[slot] = peek(0);
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_112, D.5984
# src/vm.c:237:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L68:
# src/vm.c:231:                 frame->slots[slot] = peek(0);
	movzx	eax, BYTE PTR 0[r13]	# _94, *ip_28
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rdx, QWORD PTR 16778832[r12]	# vm.stackTop, vm.stackTop
# src/vm.c:231:                 frame->slots[slot] = peek(0);
	sal	rax, 4	# _95,
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	vmovdqu	xmm0, XMMWORD PTR -16[rdx]	# D.5986, MEM[(struct Value *)_97 + -16B]
# src/vm.c:231:                 frame->slots[slot] = peek(0);
	add	rax, QWORD PTR 16[r15]	# _96, frame_30->slots
# src/vm.c:230:                 uint8_t slot = READ_BYTE();
	add	rbx, 2	# ip,
# src/vm.c:231:                 frame->slots[slot] = peek(0);
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_96, D.5986
# src/vm.c:232:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L69:
# src/vm.c:225:                 int slot = READ_LONG();
	movzx	eax, BYTE PTR 0[r13]	# _76, *ip_28
	movzx	edx, BYTE PTR 1[r13]	# _79, MEM[(uint8_t *)ip_28 + 1B]
	sal	eax, 16	# _77,
	sal	edx, 8	# _80,
	or	eax, edx	# _81, _80
	movzx	edx, BYTE PTR 2[r13]	# _83, MEM[(uint8_t *)ip_28 + 2B]
# src/vm.c:225:                 int slot = READ_LONG();
	or	eax, edx	# slot_84, _83
# src/vm.c:226:                 push(frame->slots[slot]);
	cdqe
	sal	rax, 4	# tmp736,
	add	rax, QWORD PTR 16[r15]	# tmp737, frame_30->slots
	vmovdqu	xmm0, XMMWORD PTR [rax]	# value, *_88
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _89, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp739,
	cmp	rax, rdx	# _89, tmp739
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_89, value
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp742,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp742
# src/vm.c:225:                 int slot = READ_LONG();
	add	rbx, 4	# ip,
# src/vm.c:227:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L70:
# src/vm.c:221:                 push(frame->slots[slot]);
	movzx	eax, BYTE PTR 0[r13]	# _69, *ip_28
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp723,
	sal	rax, 4	# tmp720,
	add	rax, QWORD PTR 16[r15]	# tmp721, frame_30->slots
	vmovdqu	xmm0, XMMWORD PTR [rax]	# value, *_71
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _72, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, rdx	# _72, tmp723
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_72, value
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp726,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp726
# src/vm.c:220:                 uint8_t slot = READ_BYTE();
	add	rbx, 2	# ip,
# src/vm.c:222:                 break;
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L71:
# src/vm.c:92:     vm.stackTop--;
	sub	QWORD PTR 16778832[r12], 16	# vm.stackTop,
.L79:
# src/vm.c:204:         switch (instruction = READ_BYTE()) {
	mov	rbx, r13	# ip, ip
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L72:
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _62, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp708,
	cmp	rax, rdx	# _62, tmp708
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vpxor	xmm0, xmm0, xmm0	# tmp1249
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_62, tmp1249
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp711,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp711
# src/vm.c:217:             case OP_FALSE:    push(BOOL_VAL(false)); break;
	jmp	.L79	#
	.p2align 4,,10
	.p2align 3
.L73:
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _60, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp703,
	cmp	rax, rdx	# _60, tmp703
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR [rax], 0	# *_60,
	mov	QWORD PTR 8[rax], 1	# *_60,
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp706,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp706
# src/vm.c:216:             case OP_TRUE:     push(BOOL_VAL(true)); break;
	jmp	.L79	#
	.p2align 4,,10
	.p2align 3
.L74:
# src/vm.c:215:             case OP_NULL:     push(NULL_VAL); break;
	mov	QWORD PTR 32[rsp], 0	#,
	mov	DWORD PTR 40[rsp], 0	#,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp698,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _58, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rax, rdx	# _58, tmp698
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR [rax], 1	# *_58,
	mov	QWORD PTR 8[rax], 0	# *_58,
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp701,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp701
# src/vm.c:215:             case OP_NULL:     push(NULL_VAL); break;
	jmp	.L79	#
	.p2align 4,,10
	.p2align 3
.L75:
# src/vm.c:211:                 Value constant = READ_CONSTANT_LONG();
	movzx	eax, BYTE PTR 1[r13]	# _45, MEM[(uint8_t *)ip_28 + 1B]
	movzx	edx, BYTE PTR 2[r13]	# _50, MEM[(uint8_t *)ip_28 + 2B]
	sal	eax, 8	# _46,
	sal	edx, 16	# _51,
	or	eax, edx	# _993, _51
	movzx	edx, BYTE PTR 0[r13]	# _43, *ip_28
	mov	rcx, QWORD PTR [r15]	# frame_30->function, frame_30->function
	or	eax, edx	# _52, _43
	cdqe
# src/vm.c:211:                 Value constant = READ_CONSTANT_LONG();
	sal	rax, 4	# tmp669,
	add	rax, QWORD PTR 64[rcx]	# tmp670, _40->chunk.constants.values
	vmovdqu	xmm0, XMMWORD PTR [rax]	# constant, *_55
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _56, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp672,
	cmp	rax, rdx	# _56, tmp672
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_56, constant
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp675,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp675
# src/vm.c:211:                 Value constant = READ_CONSTANT_LONG();
	add	rbx, 4	# ip,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L76:
# src/vm.c:206:                 Value constant = READ_CONSTANT();
	movzx	eax, BYTE PTR 0[r13]	# _35, *ip_28
	mov	rdx, QWORD PTR [r15]	# frame_30->function, frame_30->function
# src/vm.c:206:                 Value constant = READ_CONSTANT();
	sal	rax, 4	# tmp652,
	add	rax, QWORD PTR 64[rdx]	# tmp653, _31->chunk.constants.values
	vmovdqu	xmm0, XMMWORD PTR [rax]	# constant, *_37
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _38, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp655,
	cmp	rax, rdx	# _38, tmp655
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rax], xmm0	# *_38, constant
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp658,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp658
# src/vm.c:206:                 Value constant = READ_CONSTANT();
	add	rbx, 2	# ip,
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L40:
# src/vm.c:442:                 vm.frameCount--;
	mov	eax, DWORD PTR 1536[r12]	# _417, vm.frameCount
# src/vm.c:92:     vm.stackTop--;
	mov	rcx, QWORD PTR 16778832[r12]	# _416, vm.stackTop
# src/vm.c:442:                 vm.frameCount--;
	lea	edx, -1[rax]	# _418,
# src/vm.c:443:                 if (vm.frameCount == 0) {
	test	edx, edx	# _418
# src/vm.c:93:     return *vm.stackTop;
	vmovdqu	xmm0, XMMWORD PTR -16[rcx]	# D.5938, MEM[(struct Value *)_416 + -16B]
# src/vm.c:442:                 vm.frameCount--;
	mov	DWORD PTR 1536[r12], edx	# vm.frameCount, _418
# src/vm.c:443:                 if (vm.frameCount == 0) {
	je	.L146	#,
# src/vm.c:448:                 vm.stackTop = frame->slots;
	mov	rdx, QWORD PTR 16[r15]	# _420, frame_30->slots
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, 16778760[r12]	# tmp1175,
	cmp	rdx, rcx	# _420, tmp1175
# src/vm.c:448:                 vm.stackTop = frame->slots;
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, _420
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
# src/vm.c:450:                 frame = &vm.frames[vm.frameCount - 1];
	sub	eax, 2	# _422,
# src/vm.c:450:                 frame = &vm.frames[vm.frameCount - 1];
	cdqe
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR [rdx], xmm0	# *_420, D.5938
# src/vm.c:450:                 frame = &vm.frames[vm.frameCount - 1];
	lea	rax, [rax+rax*2]	# _639,
# src/vm.c:88:     vm.stackTop++;
	add	rdx, 16	# tmp1178,
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, tmp1178
# src/vm.c:450:                 frame = &vm.frames[vm.frameCount - 1];
	lea	r15, [r12+rax*8]	# frame,
# src/vm.c:204:         switch (instruction = READ_BYTE()) {
	mov	rbx, r13	# ip, ip
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L111:
# src/vm.c:139:     runtimeError("Can only call functions and classes.");
	lea	rdi, .LC14[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
	jmp	.L81	#
	.p2align 4,,10
	.p2align 3
.L139:
# src/vm.c:102:         runtimeError("Expected %d arguments but got %d.", function->arity, argCount);
	xor	eax, eax	#
	xor	edx, edx	#
	lea	rdi, .LC4[rip]	#,
	call	runtimeError	#
# src/vm.c:162:     CallFrame* frame = &vm.frames[vm.frameCount - 1];
	mov	eax, DWORD PTR vm[rip+1536]	# tmp1295, vm.frameCount
	sub	eax, 1	# prephitmp_388,
	cdqe
# src/vm.c:103:         return false;
	jmp	.L37	#
.L140:
# src/vm.c:107:         runtimeError("Call stack overflow.");
	xor	eax, eax	#
	lea	rdi, .LC5[rip]	#,
	call	runtimeError	#
# src/vm.c:113:     frame->slots = vm.stackTop - argCount - 1;
	mov	rsi, QWORD PTR 16778832[r12]	# tmp1296, vm.stackTop
# src/vm.c:110:     CallFrame* frame = &vm.frames[vm.frameCount++];
	movsxd	rax, DWORD PTR vm[rip+1536]	#, vm.frameCount
# src/vm.c:113:     frame->slots = vm.stackTop - argCount - 1;
	lea	rdx, -16[rsi]	# _12,
	jmp	.L38	#
	.p2align 4,,10
	.p2align 3
.L122:
# src/vm.c:470:     if (function == NULL) return INTERPRET_COMPILE_ERROR;
	mov	eax, 1	# <retval>,
	jmp	.L34	#
.L143:
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rdx], 1	# SR.275_953->type,
	jne	.L92	#,
# src/vm.c:353:                     ObjString* name = READ_STRING_LONG();
	movzx	eax, BYTE PTR 1[r13]	# _272, MEM[(uint8_t *)ip_28 + 1B]
	movzx	ecx, BYTE PTR 2[r13]	# _277, MEM[(uint8_t *)ip_28 + 2B]
	sal	eax, 8	# _273,
	sal	ecx, 16	# _278,
	or	eax, ecx	# _983, _278
	movzx	ecx, BYTE PTR 0[r13]	# _270, *ip_28
	mov	rsi, QWORD PTR [r15]	# frame_30->function, frame_30->function
	or	eax, ecx	# _279, _270
	cdqe
# src/vm.c:353:                     ObjString* name = READ_STRING_LONG();
	sal	rax, 4	# tmp966,
	add	rax, QWORD PTR 64[rsi]	# tmp967, _267->chunk.constants.values
	mov	r13, QWORD PTR 8[rax]	# name, _282->as.obj
# src/vm.c:356:                     if (!tableGet(&module->table, name, &value)) {
	lea	rdi, 16[rdx]	# _284,
	mov	rsi, r13	#, name
	lea	rdx, 112[rsp]	#,
	call	tableGet@PLT	#
# src/vm.c:353:                     ObjString* name = READ_STRING_LONG();
	add	rbx, 4	# ip,
# src/vm.c:356:                     if (!tableGet(&module->table, name, &value)) {
	test	al, al	# _285
	je	.L147	#,
# src/vm.c:92:     vm.stackTop--;
	mov	rax, QWORD PTR 16778832[r12]	# _287, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rcx, 16778760[r12]	# tmp974,
# src/vm.c:92:     vm.stackTop--;
	lea	rdx, -16[rax]	# _288,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	cmp	rdx, rcx	# _288, tmp974
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rdx	# vm.stackTop, _288
	vmovdqa	xmm0, XMMWORD PTR 112[rsp]	# value, MEM[(struct  *)_738]
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	vmovdqu	XMMWORD PTR -16[rax], xmm0	# MEM[(struct Value *)_287 + -16B], value
# src/vm.c:88:     vm.stackTop++;
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, _287
	jmp	.L39	#
.L142:
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rbx], 3	# SR.273_411->type,
	je	.L148	#,
.L101:
# src/vm.c:388:                     frame->ip = ip;
	mov	QWORD PTR 8[r15], r13	# frame_30->ip, ip
# src/vm.c:389:                     runtimeError("Operands to addition must be two numbers or two strings.");
	lea	rdi, .LC11[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
# src/vm.c:390:                     return INTERPRET_RUNTIME_ERROR;
	jmp	.L81	#
.L106:
# src/vm.c:396:             case OP_DIVIDE:   BINARY_OP(NUMBER_VAL, /); break;
	mov	QWORD PTR 8[r15], r13	# frame_30->ip, ip
	lea	rdi, .LC10[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
	jmp	.L81	#
.L112:
# src/vm.c:101:     if (argCount != function->arity) {
	mov	eax, DWORD PTR 16[rbx]	# _487, MEM[(struct ObjFunction *)SR.265_1005].arity
# src/vm.c:101:     if (argCount != function->arity) {
	cmp	edi, eax	# argCount, _487
	jne	.L149	#,
# src/vm.c:106:     if (vm.frameCount == FRAMES_MAX) {
	movsxd	rax, DWORD PTR 1536[r12]	#, vm.frameCount
# src/vm.c:106:     if (vm.frameCount == FRAMES_MAX) {
	cmp	eax, 64	# prephitmp_740,
	je	.L150	#,
.L115:
# src/vm.c:111:     frame->function = function;
	vmovq	xmm5, rbx	# D.5939, D.5939
# src/vm.c:113:     frame->slots = vm.stackTop - argCount - 1;
	sal	r13, 4	# _496,
# src/vm.c:111:     frame->function = function;
	vpinsrq	xmm0, xmm5, QWORD PTR 32[rbx], 1	# _1165, D.5939, MEM[(struct ObjFunction *)SR.265_1005].chunk.code
# src/vm.c:110:     CallFrame* frame = &vm.frames[vm.frameCount++];
	lea	edx, 1[rax]	# tmp1115,
# src/vm.c:113:     frame->slots = vm.stackTop - argCount - 1;
	sub	rsi, r13	# _497, _496
# src/vm.c:110:     CallFrame* frame = &vm.frames[vm.frameCount++];
	mov	DWORD PTR 1536[r12], edx	# vm.frameCount, tmp1115
# src/vm.c:113:     frame->slots = vm.stackTop - argCount - 1;
	lea	rcx, -16[rsi]	# tmp1136,
# src/vm.c:111:     frame->function = function;
	lea	rdx, [rax+rax*2]	# tmp1121,
# src/vm.c:113:     frame->slots = vm.stackTop - argCount - 1;
	mov	QWORD PTR 16[r12+rdx*8], rcx	# MEM <struct VM> [(struct CallFrame *)&vm].frames[prephitmp_787].slots, tmp1136
# src/vm.c:111:     frame->function = function;
	vmovdqu	XMMWORD PTR [r12+rdx*8], xmm0	# MEM <vector(2) long unsigned int> [(void *)vectp.288_1166], _1165
	jmp	.L116	#
.L149:
# src/vm.c:102:         runtimeError("Expected %d arguments but got %d.", function->arity, argCount);
	mov	edx, edi	#, argCount
	mov	esi, eax	#, _487
	lea	rdi, .LC4[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
	jmp	.L81	#
.L148:
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR -32[rax], 3	# MEM[(struct Value *)_314 + -32B],
# src/vm.c:97:     return vm.stackTop[-1 - distance];
	mov	rcx, QWORD PTR -24[rax]	# D.5962, MEM[(struct Value *)_314 + -32B]
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	jne	.L101	#,
# src/object.h:68:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rcx], 3	# SR.271_919->type,
	jne	.L101	#,
# src/vm.c:151:     int length = a->length + b->length;
	mov	r8d, DWORD PTR 16[rbx]	# MEM[(struct ObjString *)SR.273_411].length, MEM[(struct ObjString *)SR.273_411].length
# src/vm.c:92:     vm.stackTop--;
	sub	rax, 32	# tmp1010,
# src/vm.c:151:     int length = a->length + b->length;
	add	r8d, DWORD PTR 16[rcx]	# length, MEM[(struct ObjString *)SR.271_919].length
# src/vm.c:152:     char* chars = ALLOCATE(char, length + 1);
	lea	edx, 1[r8]	# _451,
	xor	esi, esi	#
	xor	edi, edi	#
	movsxd	rdx, edx	# _452, _451
	mov	DWORD PTR 20[rsp], r8d	# %sfp, length
# src/vm.c:151:     int length = a->length + b->length;
	mov	QWORD PTR 24[rsp], rcx	# %sfp, D.5962
# src/vm.c:92:     vm.stackTop--;
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp1010
# src/vm.c:152:     char* chars = ALLOCATE(char, length + 1);
	call	reallocate@PLT	#
# src/vm.c:153:     memcpy(chars, a->chars, a->length);
	mov	rcx, QWORD PTR 24[rsp]	# D.5962, %sfp
	mov	rdi, rax	#,
	movsxd	rdx, DWORD PTR 16[rcx]	# _455, MEM[(struct ObjString *)SR.271_919].length
	mov	rsi, QWORD PTR 24[rcx]	# MEM[(struct ObjString *)SR.271_919].chars, MEM[(struct ObjString *)SR.271_919].chars
	call	memcpy@PLT	#
# src/vm.c:154:     memcpy(chars + a->length, b->chars, b->length);
	mov	rcx, QWORD PTR 24[rsp]	# D.5962, %sfp
# src/vm.c:154:     memcpy(chars + a->length, b->chars, b->length);
	movsxd	rdx, DWORD PTR 16[rbx]	# _458, MEM[(struct ObjString *)SR.273_411].length
# src/vm.c:154:     memcpy(chars + a->length, b->chars, b->length);
	movsxd	rdi, DWORD PTR 16[rcx]	# _461, MEM[(struct ObjString *)SR.271_919].length
# src/vm.c:154:     memcpy(chars + a->length, b->chars, b->length);
	mov	rsi, QWORD PTR 24[rbx]	# MEM[(struct ObjString *)SR.273_411].chars, MEM[(struct ObjString *)SR.273_411].chars
# src/vm.c:154:     memcpy(chars + a->length, b->chars, b->length);
	add	rdi, rax	# _462,
	mov	QWORD PTR 24[rsp], rax	# %sfp,
# src/vm.c:154:     memcpy(chars + a->length, b->chars, b->length);
	call	memcpy@PLT	#
# src/vm.c:155:     chars[length] = '\0';
	movsxd	rax, DWORD PTR 20[rsp]	#, %sfp
# src/vm.c:155:     chars[length] = '\0';
	mov	r9, QWORD PTR 24[rsp]	# chars, %sfp
# src/vm.c:157:     ObjString* result = takeString(chars, length);
	mov	esi, eax	#, length
# src/vm.c:155:     chars[length] = '\0';
	mov	BYTE PTR [r9+rax], 0	# *_464,
# src/vm.c:157:     ObjString* result = takeString(chars, length);
	mov	rdi, r9	#, chars
	call	takeString@PLT	#
	mov	rbx, rax	# D.6069, result
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	mov	rax, QWORD PTR 16778832[r12]	# _466, vm.stackTop
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	lea	rdx, 16778760[r12]	# tmp1036,
	cmp	rax, rdx	# _466, tmp1036
# src/vm.c:158:     push(OBJ_VAL(result));
	mov	ecx, 3	# D.6069,
# src/vm.c:82:     if (vm.stackTop == vm.stack + STACK_MAX) {
	je	.L77	#,
# src/vm.c:87:     *vm.stackTop = value;
	mov	QWORD PTR 8[rax], rbx	# *_466, D.6069
	mov	QWORD PTR [rax], rcx	# *_466, D.6069
# src/vm.c:88:     vm.stackTop++;
	add	rax, 16	# tmp1039,
	mov	QWORD PTR 16778832[r12], rax	# vm.stackTop, tmp1039
# src/vm.c:204:         switch (instruction = READ_BYTE()) {
	mov	rbx, r13	# ip, ip
# src/vm.c:159: }
	jmp	.L39	#
.L137:
# src/vm.c:304:                     frame->ip = ip;
	mov	QWORD PTR 8[r15], rbx	# frame_30->ip, ip
# src/vm.c:305:                     runtimeError("Undefined variable '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_207->chars,
	lea	rdi, .LC6[rip]	#,
	call	runtimeError	#
# src/vm.c:306:                     return INTERPRET_RUNTIME_ERROR;
	jmp	.L81	#
.L136:
# src/vm.c:255:                     runtimeError("Undefined variable '%s'.", name->chars);
	mov	rax, QWORD PTR 24[rsp]	# name, %sfp
# src/vm.c:254:                     frame->ip = ip;
	mov	QWORD PTR 8[r15], rbx	# frame_30->ip, ip
# src/vm.c:255:                     runtimeError("Undefined variable '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[rax]	# name_142->chars,
	lea	rdi, .LC6[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
	jmp	.L81	#
.L138:
# src/vm.c:297:                     frame->ip = ip;
	mov	QWORD PTR 8[r15], rbx	# frame_30->ip, ip
# src/vm.c:298:                     runtimeError("Attempting to assign to constant '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_207->chars,
	lea	rdi, .LC7[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
# src/vm.c:299:                     return INTERPRET_RUNTIME_ERROR;
	jmp	.L81	#
.L117:
# src/vm.c:131:                     runtimeError(AS_STRING(result)->chars);
	mov	rax, QWORD PTR 136[rsp]	# MEM[(struct  *)_725].as.obj, MEM[(struct  *)_725].as.obj
# src/vm.c:131:                     runtimeError(AS_STRING(result)->chars);
	mov	rdi, QWORD PTR 24[rax]	# MEM[(struct ObjString *)_483].chars, MEM[(struct ObjString *)_483].chars
	xor	eax, eax	#
	call	runtimeError	#
	jmp	.L81	#
.L150:
# src/vm.c:107:         runtimeError("Call stack overflow.");
	xor	eax, eax	#
	lea	rdi, .LC5[rip]	#,
	call	runtimeError	#
# src/vm.c:110:     CallFrame* frame = &vm.frames[vm.frameCount++];
	movsxd	rax, DWORD PTR 1536[r12]	#, vm.frameCount
# src/vm.c:113:     frame->slots = vm.stackTop - argCount - 1;
	mov	rsi, QWORD PTR 16778832[r12]	# _406, vm.stackTop
	jmp	.L115	#
.L141:
# src/vm.c:402:                     frame->ip = ip;
	mov	QWORD PTR 8[r15], r13	# frame_30->ip, ip
# src/vm.c:403:                     runtimeError("Operand to unary negation must be a number.");
	lea	rdi, .LC12[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
	jmp	.L81	#
.L146:
# src/vm.c:92:     vm.stackTop--;
	sub	rcx, 32	# tmp1173,
	mov	QWORD PTR 16778832[r12], rcx	# vm.stackTop, tmp1173
# src/vm.c:445:                     return INTERPRET_OK;
	xor	eax, eax	# <retval>
	jmp	.L34	#
.L145:
# src/vm.c:333:                         frame->ip = ip;
	mov	QWORD PTR 8[r15], rbx	# frame_30->ip, ip
# src/vm.c:334:                         runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_256->chars, name_256->chars
	lea	rdi, .LC9[rip]	#,
	xor	eax, eax	#
	call	runtimeError	#
	jmp	.L81	#
.L147:
# src/vm.c:357:                         frame->ip = ip;
	mov	QWORD PTR 8[r15], rbx	# frame_30->ip, ip
# src/vm.c:358:                         runtimeError("Undefined property '%s'.", name->chars);
	mov	rsi, QWORD PTR 24[r13]	# name_283->chars, name_283->chars
	lea	rdi, .LC9[rip]	#,
	call	runtimeError	#
	jmp	.L81	#
.L144:
# src/vm.c:476: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	interpret.cold, @function
interpret.cold:
.LFSB37:
.L123:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
# src/vm.c:204:         switch (instruction = READ_BYTE()) {
	mov	rbx, r13	# ip, ip
	jmp	.L39	#
	.cfi_endproc
.LFE37:
	.text
	.size	interpret, .-interpret
	.section	.text.unlikely
	.size	interpret.cold, .-interpret.cold
.LCOLDE17:
	.text
.LHOTE17:
	.globl	vm
	.bss
	.align 32
	.type	vm, @object
	.size	vm, 16778848
vm:
	.zero	16778848
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC13:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
