	.file	"btime.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.type	"timeNative", @function
"timeNative":
.LFB17:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/btime.c:12:     *result = NUMBER_VAL((double) ((long) time(NULL)));
	xor	edi, edi	#
# src/natives/btime.c:11: static bool timeNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/btime.c:12:     *result = NUMBER_VAL((double) ((long) time(NULL)));
	call	"time"@PLT	#
# src/natives/btime.c:12:     *result = NUMBER_VAL((double) ((long) time(NULL)));
	pxor	xmm0, xmm0	# _2
	cvtsi2sd	xmm0, rax	# _2, _1
# src/natives/btime.c:14: }
	mov	eax, 1	#,
# src/natives/btime.c:12:     *result = NUMBER_VAL((double) ((long) time(NULL)));
	movsd	QWORD PTR [rbx], xmm0	# *result_6(D), _2
# src/natives/btime.c:14: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE17:
	.size	"timeNative", .-"timeNative"
	.p2align 4
	.type	"clockNative", @function
"clockNative":
.LFB16:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/btime.c:6: static bool clockNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/btime.c:7:     *result = NUMBER_VAL((double) clock() / CLOCKS_PER_SEC);
	call	"clock"@PLT	#
# src/natives/btime.c:7:     *result = NUMBER_VAL((double) clock() / CLOCKS_PER_SEC);
	pxor	xmm0, xmm0	# _2
	cvtsi2sd	xmm0, rax	# _2, _1
# src/natives/btime.c:9: }
	mov	eax, 1	#,
# src/natives/btime.c:7:     *result = NUMBER_VAL((double) clock() / CLOCKS_PER_SEC);
	divsd	xmm0, QWORD PTR .LC0[rip]	# _3,
# src/natives/btime.c:7:     *result = NUMBER_VAL((double) clock() / CLOCKS_PER_SEC);
	movsd	QWORD PTR [rbx], xmm0	# *result_7(D), _3
# src/natives/btime.c:9: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE16:
	.size	"clockNative", .-"clockNative"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"sleep() expects 1 number argument."
	.text
	.p2align 4
	.type	"sleepNative", @function
"sleepNative":
.LFB18:
	.cfi_startproc
	sub	rsp, 72	#,
	.cfi_def_cfa_offset 80
# src/natives/btime.c:16: static bool sleepNative(int argCount, Value* args, Value* result) {
	mov	rax, QWORD PTR fs:40	# tmp116, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 56[rsp], rax	# D.6042, tmp116
	xor	eax, eax	# tmp116
# src/natives/btime.c:18:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L7	#,
# src/natives/btime.c:18:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rcx, 9222246136947933184	# tmp118,
# src/natives/btime.c:18:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_8(D)
# src/natives/btime.c:18:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rsi, rax	# tmp147, _1
	not	rsi	# tmp147
	test	rsi, rcx	# tmp147, tmp118
	je	.L7	#,
# src/natives/btime.c:25:     SLEEP(seconds * 1000);
	movsd	xmm1, QWORD PTR .LC2[rip]	# tmp140,
	movq	xmm0, rax	# _4, _1
# src/natives/btime.h:16:         (time_t) (fmod(milliseconds, 1000.0) * 1000000)
	fld	QWORD PTR .LC2[rip]	#
# src/natives/btime.c:25:     SLEEP(seconds * 1000);
	mulsd	xmm0, xmm1	# _4, tmp140
# src/natives/btime.h:15:         (time_t) (milliseconds / 1000), 
	movapd	xmm2, xmm0	# _18, _4
# src/natives/btime.h:16:         (time_t) (fmod(milliseconds, 1000.0) * 1000000)
	movsd	QWORD PTR 8[rsp], xmm0	# %sfp, _4
	fld	QWORD PTR 8[rsp]	# %sfp
# src/natives/btime.h:15:         (time_t) (milliseconds / 1000), 
	divsd	xmm2, xmm1	# _18, tmp140
# src/natives/btime.h:15:         (time_t) (milliseconds / 1000), 
	cvttsd2si	rax, xmm2	# tmp126, _18
	mov	QWORD PTR 16[rsp], rax	# req.tv_sec, tmp126
.L10:
# src/natives/btime.h:16:         (time_t) (fmod(milliseconds, 1000.0) * 1000000)
	fprem	
	fnstsw	ax	# tmp129
	sahf	
	jp	.L10	#,
	fstp	st(1)		#
	fstp	QWORD PTR 8[rsp]	# %sfp
	movsd	xmm2, QWORD PTR 8[rsp]	# _20, %sfp
	ucomisd	xmm2, xmm2	# _20, _20
	jp	.L17	#,
.L11:
# src/natives/btime.h:16:         (time_t) (fmod(milliseconds, 1000.0) * 1000000)
	mulsd	xmm2, QWORD PTR .LC0[rip]	# _21,
# src/natives/btime.h:16:         (time_t) (fmod(milliseconds, 1000.0) * 1000000)
	cvttsd2si	rax, xmm2	# tmp133, _21
	mov	QWORD PTR 24[rsp], rax	# req.tv_nsec, tmp133
# src/natives/btime.h:20:     while (nanosleep(&req, &rem) == -1) {
	jmp	.L12	#
	.p2align 4,,10
	.p2align 3
.L13:
# src/natives/btime.h:21:         req = rem;
	movdqa	xmm0, XMMWORD PTR 32[rsp]	# rem, rem
	movaps	XMMWORD PTR 16[rsp], xmm0	# req, rem
.L12:
# src/natives/btime.h:20:     while (nanosleep(&req, &rem) == -1) {
	lea	rsi, 32[rsp]	# tmp156,
	lea	rdi, 16[rsp]	#,
	call	"nanosleep"@PLT	#
# src/natives/btime.h:20:     while (nanosleep(&req, &rem) == -1) {
	cmp	eax, -1	# _23,
	je	.L13	#,
# src/natives/btime.c:26:     return true;
	mov	eax, 1	# <retval>,
	jmp	.L6	#
	.p2align 4,,10
	.p2align 3
.L7:
# src/natives/btime.c:19:         *result = OBJ_VAL(copyString("sleep() expects 1 number argument.", 34));
	mov	esi, 34	#,
	lea	rdi, .LC1[rip]	#,
	mov	QWORD PTR 8[rsp], rdx	# %sfp, result
	call	"copyString"@PLT	#
# src/natives/btime.c:19:         *result = OBJ_VAL(copyString("sleep() expects 1 number argument.", 34));
	mov	rdx, QWORD PTR 8[rsp]	# result, %sfp
	movabs	rcx, -1125899906842624	# tmp121,
	or	rax, rcx	# tmp122, tmp121
	mov	QWORD PTR [rdx], rax	# *result_11(D), tmp122
# src/natives/btime.c:19:         *result = OBJ_VAL(copyString("sleep() expects 1 number argument.", 34));
	xor	eax, eax	# <retval>
.L6:
# src/natives/btime.c:27: }
	mov	rdx, QWORD PTR 56[rsp]	# tmp148, D.6042
	sub	rdx, QWORD PTR fs:40	# tmp148, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L18	#,
	add	rsp, 72	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L17:
	.cfi_restore_state
# src/natives/btime.h:16:         (time_t) (fmod(milliseconds, 1000.0) * 1000000)
	call	"fmod"@PLT	#
	movsd	xmm2, QWORD PTR 8[rsp]	# _20, %sfp
	jmp	.L11	#
.L18:
# src/natives/btime.c:27: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE18:
	.size	"sleepNative", .-"sleepNative"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"clock"
.LC6:
	.string	"sleep"
.LC7:
	.string	"time"
	.text
	.p2align 4
	.globl	"buildTimeModule"
	.type	"buildTimeModule", @function
"buildTimeModule":
.LFB19:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 8[rsp], rbx	#,
	.cfi_offset 3, -40
# src/natives/btime.c:31:     push(OBJ_VAL(module));
	movabs	rbx, -1125899906842624	# tmp115,
# src/natives/btime.c:29: ObjModule* buildTimeModule() {
	mov	QWORD PTR 16[rsp], rbp	#,
	mov	QWORD PTR 32[rsp], r13	#,
	.cfi_offset 6, -32
	.cfi_offset 13, -16
# src/natives/btime.c:30:     ObjModule* module = newModule();
	call	"newModule"@PLT	#
# src/natives/btime.c:31:     push(OBJ_VAL(module));
	mov	rdi, rax	# _2, <retval>
# src/natives/btime.c:30:     ObjModule* module = newModule();
	mov	rbp, rax	# <retval>,
# src/natives/btime.c:31:     push(OBJ_VAL(module));
	or	rdi, rbx	# _2, tmp115
# src/natives/btime.c:31:     push(OBJ_VAL(module));
	call	"push"@PLT	#
# src/natives/btime.c:33:     tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
	lea	rdi, "clockNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/btime.c:33:     tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
	mov	esi, 5	#,
	lea	rdi, .LC5[rip]	#,
# src/natives/btime.c:33:     tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
	mov	r13, rax	# _3,
# src/natives/btime.c:33:     tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
	call	"copyString"@PLT	#
# src/natives/btime.c:33:     tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
	mov	rdx, r13	# _3, _3
# src/natives/btime.c:33:     tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
	lea	rdi, 16[rbp]	#,
# src/natives/btime.c:33:     tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
	or	rdx, rbx	# _3, tmp115
# src/natives/btime.c:33:     tableSet(&module->table, copyString("clock", 5), OBJ_VAL(newNative(clockNative)));
	mov	rsi, rax	#, _6
	call	"tableSet"@PLT	#
# src/natives/btime.c:34:     tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
	lea	rdi, "sleepNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/btime.c:34:     tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
	mov	esi, 5	#,
	lea	rdi, .LC6[rip]	#,
# src/natives/btime.c:34:     tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
	mov	r13, rax	# _8,
# src/natives/btime.c:34:     tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
	call	"copyString"@PLT	#
# src/natives/btime.c:34:     tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
	mov	rdx, r13	# _8, _8
# src/natives/btime.c:34:     tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
	lea	rdi, 16[rbp]	#,
# src/natives/btime.c:34:     tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
	or	rdx, rbx	# _8, tmp115
# src/natives/btime.c:34:     tableSet(&module->table, copyString("sleep", 5), OBJ_VAL(newNative(sleepNative)));
	mov	rsi, rax	#, _11
	call	"tableSet"@PLT	#
# src/natives/btime.c:35:     tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));
	lea	rdi, "timeNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/btime.c:35:     tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));
	mov	esi, 4	#,
	lea	rdi, .LC7[rip]	#,
# src/natives/btime.c:35:     tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));
	mov	r13, rax	# _12,
# src/natives/btime.c:35:     tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));
	call	"copyString"@PLT	#
# src/natives/btime.c:35:     tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));
	mov	rdx, r13	# _12, _12
# src/natives/btime.c:35:     tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));
	lea	rdi, 16[rbp]	#,
# src/natives/btime.c:35:     tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));
	or	rdx, rbx	# _12, tmp115
# src/natives/btime.c:35:     tableSet(&module->table, copyString("time", 4), OBJ_VAL(newNative(timeNative)));
	mov	rsi, rax	#, _15
	call	"tableSet"@PLT	#
# src/natives/btime.c:37:     pop();
	call	"pop"@PLT	#
# src/natives/btime.c:39: }
	mov	rax, rbp	#, <retval>
	mov	rbx, QWORD PTR 8[rsp]	#,
	mov	rbp, QWORD PTR 16[rsp]	#,
	mov	r13, QWORD PTR 32[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE19:
	.size	"buildTimeModule", .-"buildTimeModule"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
