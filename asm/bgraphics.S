	.file	"bgraphics.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.type	"getEventsNative", @function
"getEventsNative":
.LFB35:
	.cfi_startproc
	sub	rsp, 72	#,
	.cfi_def_cfa_offset 80
# src/natives/bgraphics.c:147:     ObjArray* outer = newArray(eventQueue.count);
	mov	edi, DWORD PTR "eventQueue"[rip+3072]	#, eventQueue.count
# src/natives/bgraphics.c:146: static bool getEventsNative(int argCount, Value* args, Value* result) {
	mov	QWORD PTR 32[rsp], rbp	#,
	.cfi_offset 6, -48
# src/natives/bgraphics.c:148:     push(OBJ_VAL(outer));
	movabs	rbp, -1125899906842624	# tmp129,
# src/natives/bgraphics.c:146: static bool getEventsNative(int argCount, Value* args, Value* result) {
	mov	QWORD PTR 40[rsp], r12	#,
	mov	QWORD PTR 56[rsp], r14	#,
	mov	QWORD PTR 8[rsp], rdx	# %sfp, result
	.cfi_offset 12, -40
	.cfi_offset 14, -24
# src/natives/bgraphics.c:147:     ObjArray* outer = newArray(eventQueue.count);
	call	"newArray"@PLT	#
# src/natives/bgraphics.c:148:     push(OBJ_VAL(outer));
	mov	r14, rax	# _3, outer
# src/natives/bgraphics.c:147:     ObjArray* outer = newArray(eventQueue.count);
	mov	r12, rax	# outer,
# src/natives/bgraphics.c:148:     push(OBJ_VAL(outer));
	or	r14, rbp	# _3, tmp129
# src/natives/bgraphics.c:148:     push(OBJ_VAL(outer));
	mov	rdi, r14	#, _3
	call	"push"@PLT	#
# src/natives/bgraphics.c:150:     for (int i = 0; i < eventQueue.count; i++) {
	mov	eax, DWORD PTR "eventQueue"[rip+3072]	#, eventQueue.count
	test	eax, eax	#
	jle	.L2	#,
	mov	QWORD PTR 48[rsp], r13	#,
	.cfi_offset 13, -32
	lea	r13, "eventQueue"[rip]	# tmp144,
	mov	QWORD PTR 24[rsp], rbx	#,
	.cfi_offset 3, -56
	mov	rbx, r13	# ivtmp.46, tmp144
	mov	QWORD PTR 64[rsp], r15	#,
	.cfi_offset 15, -16
# src/natives/bgraphics.c:150:     for (int i = 0; i < eventQueue.count; i++) {
	xor	r15d, r15d	# ivtmp.44
	.p2align 4
	.p2align 3
.L5:
# src/natives/bgraphics.c:153:         ObjArray* ev = newArray(4);
	mov	edi, 4	#,
# src/natives/bgraphics.c:150:     for (int i = 0; i < eventQueue.count; i++) {
	add	rbx, 24	# ivtmp.46,
# src/natives/bgraphics.c:153:         ObjArray* ev = newArray(4);
	call	"newArray"@PLT	#
# src/natives/bgraphics.c:154:         ev->values[0] = NUMBER_VAL((double)e->type);
	mov	esi, DWORD PTR -24[rbx]	# MEM[(<unnamed type> *)_30], MEM[(<unnamed type> *)_30]
	pxor	xmm0, xmm0	# _5
# src/natives/bgraphics.c:155:         ev->values[1] = NUMBER_VAL((double)e->button);
	pxor	xmm1, xmm1	# _8
# src/natives/bgraphics.c:154:         ev->values[0] = NUMBER_VAL((double)e->type);
	mov	rcx, QWORD PTR 24[rax]	# _6, ev_28->values
# src/natives/bgraphics.c:155:         ev->values[1] = NUMBER_VAL((double)e->button);
	cvtsi2sd	xmm1, DWORD PTR -20[rbx]	# _8, MEM[(int *)_30 + 4B]
# src/natives/bgraphics.c:159:         outer->values[i] = OBJ_VAL(ev);
	or	rax, rbp	# tmp141, tmp129
# src/natives/bgraphics.c:154:         ev->values[0] = NUMBER_VAL((double)e->type);
	cvtsi2sd	xmm0, rsi	# _5, MEM[(<unnamed type> *)_30]
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	unpcklpd	xmm0, xmm1	# _19, _8
# src/natives/bgraphics.c:154:         ev->values[0] = NUMBER_VAL((double)e->type);
	movups	XMMWORD PTR [rcx], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_6], _19
# src/natives/bgraphics.c:156:         ev->values[2] = NUMBER_VAL(e->x);
	movupd	xmm0, XMMWORD PTR -16[rbx]	# vect__9.39_48, MEM <vector(2) double> [(double *)_30 + 8B]
# src/natives/bgraphics.c:156:         ev->values[2] = NUMBER_VAL(e->x);
	movups	XMMWORD PTR 16[rcx], xmm0	# MEM <vector(2) long unsigned int> [(Value *)_6 + 16B], vect__9.39_48
# src/natives/bgraphics.c:159:         outer->values[i] = OBJ_VAL(ev);
	mov	rcx, QWORD PTR 24[r12]	# outer_22->values, outer_22->values
# src/natives/bgraphics.c:159:         outer->values[i] = OBJ_VAL(ev);
	mov	QWORD PTR [rcx+r15*8], rax	# *_15, tmp141
# src/natives/bgraphics.c:150:     for (int i = 0; i < eventQueue.count; i++) {
	add	r15, 1	# ivtmp.44,
	cmp	DWORD PTR 3072[r13], r15d	# eventQueue.count, ivtmp.44
	jg	.L5	#,
	mov	rbx, QWORD PTR 24[rsp]	#,
	.cfi_restore 3
	mov	r13, QWORD PTR 48[rsp]	#,
	.cfi_restore 13
	mov	r15, QWORD PTR 64[rsp]	#,
	.cfi_restore 15
.L2:
# src/natives/bgraphics.c:162:     pop();
	call	"pop"@PLT	#
# src/natives/bgraphics.c:163:     *result = OBJ_VAL(outer);
	mov	rax, QWORD PTR 8[rsp]	# result, %sfp
# src/natives/bgraphics.c:165: }
	mov	rbp, QWORD PTR 32[rsp]	#,
	mov	r12, QWORD PTR 40[rsp]	#,
# src/natives/bgraphics.c:163:     *result = OBJ_VAL(outer);
	mov	QWORD PTR [rax], r14	# *result_25(D), _3
# src/natives/bgraphics.c:165: }
	mov	r14, QWORD PTR 56[rsp]	#,
	mov	eax, 1	#,
	add	rsp, 72	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE35:
	.size	"getEventsNative", .-"getEventsNative"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"pollEvents() does not expect arguments."
	.text
	.p2align 4
	.type	"gPollEventsNative", @function
"gPollEventsNative":
.LFB27:
	.cfi_startproc
	sub	rsp, 88	#,
	.cfi_def_cfa_offset 96
	mov	QWORD PTR 72[rsp], r13	#,
	.cfi_offset 13, -24
	mov	r13, QWORD PTR fs:40	# result, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 40[rsp], r13	# D.9944, result
	mov	r13, rdx	# result, result
# src/natives/bgraphics.c:25:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L25	#,
# src/natives/bgraphics.c:33:     int buttons[] = { MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT, MOUSE_BUTTON_MIDDLE };
	movabs	rax, 4294967296	# tmp126,
	mov	QWORD PTR 64[rsp], r12	#,
# src/natives/bgraphics.c:31:     eventQueue.count = 0;
	mov	DWORD PTR "eventQueue"[rip+3072], 0	# eventQueue.count,
# src/natives/bgraphics.c:33:     int buttons[] = { MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT, MOUSE_BUTTON_MIDDLE };
	mov	QWORD PTR 24[rsp], rax	# MEM <vector(2) int> [(int *)&buttons], tmp126
	mov	DWORD PTR 32[rsp], 2	# buttons[2],
	mov	QWORD PTR 48[rsp], rbx	#,
	.cfi_offset 12, -32
	.cfi_offset 3, -48
	xor	ebx, ebx	# ivtmp.62
	mov	QWORD PTR 56[rsp], rbp	#,
	.cfi_offset 6, -40
	lea	rbp, "eventQueue"[rip]	# tmp182,
.L14:
# src/natives/bgraphics.c:37:         double mx = (double)GetMouseX();
	call	"GetMouseX"@PLT	#
	mov	r12d, eax	# _4,
# src/natives/bgraphics.c:38:         double my = (double)GetMouseY();
	call	"GetMouseY"@PLT	#
# src/natives/bgraphics.c:39:         if (eventQueue.count < EVENT_QUEUE_MAX) {
	cmp	DWORD PTR 3072[rbp], 127	# eventQueue.count,
	jle	.L26	#,
.L12:
# src/natives/bgraphics.c:36:     for (int i = 0; i < 3; i++) {
	add	rbx, 1	# ivtmp.62,
	cmp	rbx, 3	# ivtmp.62,
	jne	.L14	#,
# src/natives/bgraphics.c:52:     return true;
	mov	rbx, QWORD PTR 48[rsp]	#,
	.cfi_restore 3
	mov	rbp, QWORD PTR 56[rsp]	#,
	.cfi_restore 6
# src/natives/bgraphics.c:36:     for (int i = 0; i < 3; i++) {
	movabs	rax, 9222246136947933187	# _3,
# src/natives/bgraphics.c:52:     return true;
	mov	edx, 1	# <retval>,
	mov	r12, QWORD PTR 64[rsp]	#,
	.cfi_restore 12
.L11:
# src/natives/bgraphics.c:26:         *result = OBJ_VAL(copyString("pollEvents() does not expect arguments.", 39));
	mov	QWORD PTR 0[r13], rax	# *result_26(D), _3
# src/natives/bgraphics.c:53: }
	mov	rax, QWORD PTR 40[rsp]	# tmp190, D.9944
	sub	rax, QWORD PTR fs:40	# tmp190, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L27	#,
	mov	r13, QWORD PTR 72[rsp]	#,
	mov	eax, edx	#, <retval>
	add	rsp, 88	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_def_cfa_offset 96
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
# src/natives/bgraphics.c:37:         double mx = (double)GetMouseX();
	movd	xmm0, r12d	# _48, _4
# src/natives/bgraphics.c:40:             if (IsMouseButtonPressed(buttons[i])) {
	mov	r12d, DWORD PTR 24[rsp+rbx*4]	# _7, MEM[(int *)&buttons + ivtmp.62_43 * 4]
	mov	QWORD PTR 80[rsp], r14	#,
	.cfi_offset 14, -16
	mov	r14d, ebx	# i, ivtmp.62
# src/natives/bgraphics.c:37:         double mx = (double)GetMouseX();
	pinsrd	xmm0, eax, 1	# _48, _5
# src/natives/bgraphics.c:40:             if (IsMouseButtonPressed(buttons[i])) {
	mov	edi, r12d	#, _7
# src/natives/bgraphics.c:37:         double mx = (double)GetMouseX();
	cvtdq2pd	xmm1, xmm0	# vect_mx_29.56, _48
	movaps	XMMWORD PTR [rsp], xmm1	# %sfp, vect_mx_29.56
# src/natives/bgraphics.c:40:             if (IsMouseButtonPressed(buttons[i])) {
	call	"IsMouseButtonPressed"@PLT	#
# src/natives/bgraphics.c:40:             if (IsMouseButtonPressed(buttons[i])) {
	test	al, al	# _8
	je	.L13	#,
# src/natives/bgraphics.c:41:                 eventQueue.events[eventQueue.count++] =
	movsxd	rax, DWORD PTR 3072[rbp]	#, eventQueue.count
# src/natives/bgraphics.c:41:                 eventQueue.events[eventQueue.count++] =
	movapd	xmm1, XMMWORD PTR [rsp]	# vect_mx_29.56, %sfp
# src/natives/bgraphics.c:41:                 eventQueue.events[eventQueue.count++] =
	lea	edx, 1[rax]	# tmp132,
# src/natives/bgraphics.c:41:                 eventQueue.events[eventQueue.count++] =
	lea	rax, [rax+rax*2]	# tmp138,
# src/natives/bgraphics.c:41:                 eventQueue.events[eventQueue.count++] =
	mov	DWORD PTR 3072[rbp], edx	# eventQueue.count, tmp132
# src/natives/bgraphics.c:41:                 eventQueue.events[eventQueue.count++] =
	lea	rdx, "eventQueue"[rip+8]	# tmp154,
	mov	DWORD PTR 0[rbp+rax*8], 0	# eventQueue.events[_9].type,
	mov	DWORD PTR 4[rbp+rax*8], ebx	# eventQueue.events[_9].button, ivtmp.62
	movups	XMMWORD PTR [rdx+rax*8], xmm1	# MEM <vector(2) double> [(double *)vectp.58_54], vect_mx_29.56
.L13:
# src/natives/bgraphics.c:44:             if (IsMouseButtonReleased(buttons[i])) {
	mov	edi, r12d	#, _7
	call	"IsMouseButtonReleased"@PLT	#
# src/natives/bgraphics.c:44:             if (IsMouseButtonReleased(buttons[i])) {
	test	al, al	# _11
	je	.L24	#,
# src/natives/bgraphics.c:45:                 eventQueue.events[eventQueue.count++] =
	movsxd	rax, DWORD PTR 3072[rbp]	#, eventQueue.count
# src/natives/bgraphics.c:45:                 eventQueue.events[eventQueue.count++] =
	movapd	xmm2, XMMWORD PTR [rsp]	# vect_mx_29.56, %sfp
# src/natives/bgraphics.c:45:                 eventQueue.events[eventQueue.count++] =
	lea	edx, 1[rax]	# tmp157,
# src/natives/bgraphics.c:45:                 eventQueue.events[eventQueue.count++] =
	lea	rax, [rax+rax*2]	# tmp163,
# src/natives/bgraphics.c:45:                 eventQueue.events[eventQueue.count++] =
	mov	DWORD PTR 3072[rbp], edx	# eventQueue.count, tmp157
# src/natives/bgraphics.c:45:                 eventQueue.events[eventQueue.count++] =
	lea	rdx, "eventQueue"[rip+8]	# tmp179,
	mov	DWORD PTR 4[rbp+rax*8], r14d	# eventQueue.events[_12].button, i
	mov	r14, QWORD PTR 80[rsp]	#,
	.cfi_remember_state
	.cfi_restore 14
	mov	DWORD PTR 0[rbp+rax*8], 1	# eventQueue.events[_12].type,
	movups	XMMWORD PTR [rdx+rax*8], xmm2	# MEM <vector(2) double> [(double *)vectp.60_56], vect_mx_29.56
	jmp	.L12	#
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	mov	r14, QWORD PTR 80[rsp]	#,
	.cfi_restore 14
	jmp	.L12	#
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
# src/natives/bgraphics.c:26:         *result = OBJ_VAL(copyString("pollEvents() does not expect arguments.", 39));
	mov	esi, 39	#,
	lea	rdi, .LC0[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:26:         *result = OBJ_VAL(copyString("pollEvents() does not expect arguments.", 39));
	movabs	rdx, -1125899906842624	# tmp124,
	or	rax, rdx	# _3, tmp124
# src/natives/bgraphics.c:27:         return false;
	xor	edx, edx	# <retval>
	jmp	.L11	#
.L27:
	mov	QWORD PTR 48[rsp], rbx	#,
	mov	QWORD PTR 56[rsp], rbp	#,
	mov	QWORD PTR 64[rsp], r12	#,
	mov	QWORD PTR 80[rsp], r14	#,
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 14, -16
# src/natives/bgraphics.c:53: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE27:
	.size	"gPollEventsNative", .-"gPollEventsNative"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"drawCircle() expects six number arguments."
	.text
	.p2align 4
	.type	"gDrawCircleNative", @function
"gDrawCircleNative":
.LFB39:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:216: static bool gDrawCircleNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:218:     if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	cmp	edi, 6	# argCount,
	jne	.L29	#,
# src/natives/bgraphics.c:218:     if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	movabs	rax, 9222246136947933184	# tmp134,
	mov	rdx, QWORD PTR [rsi]	# _1, *args_29(D)
# src/natives/bgraphics.c:218:     if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rcx, rdx	# tmp175, _1
	not	rcx	# tmp175
	test	rcx, rax	# tmp175, tmp134
	je	.L29	#,
# src/natives/bgraphics.c:218:     if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rcx, QWORD PTR 8[rsi]	# _3, MEM[(Value *)args_29(D) + 8B]
# src/natives/bgraphics.c:218:     if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rdi, rcx	# tmp174, _3
	not	rdi	# tmp174
	test	rdi, rax	# tmp174, tmp134
	je	.L29	#,
# src/natives/bgraphics.c:218:     if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rdi, QWORD PTR 16[rsi]	# _5, MEM[(Value *)args_29(D) + 16B]
# src/natives/bgraphics.c:218:     if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	r8, rdi	# tmp173, _5
	not	r8	# tmp173
	test	r8, rax	# tmp173, tmp134
	je	.L29	#,
# src/natives/bgraphics.c:219:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5])) {
	mov	r8, QWORD PTR 24[rsi]	# _7, MEM[(Value *)args_29(D) + 24B]
# src/natives/bgraphics.c:218:     if (argCount != 6 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	r9, r8	# tmp172, _7
	not	r9	# tmp172
	test	r9, rax	# tmp172, tmp134
	je	.L29	#,
# src/natives/bgraphics.c:219:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5])) {
	mov	r9, QWORD PTR 32[rsi]	# _9, MEM[(Value *)args_29(D) + 32B]
# src/natives/bgraphics.c:219:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5])) {
	mov	r10, r9	# tmp171, _9
	not	r10	# tmp171
	test	r10, rax	# tmp171, tmp134
	je	.L29	#,
# src/natives/bgraphics.c:219:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5])) {
	mov	rsi, QWORD PTR 40[rsi]	# _11, MEM[(Value *)args_29(D) + 40B]
# src/natives/bgraphics.c:219:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5])) {
	mov	r10, rsi	# tmp170, _11
	not	r10	# tmp170
	test	r10, rax	# tmp170, tmp134
	je	.L29	#,
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm1, rdx	# tmp183, _1
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm2, rcx	# tmp184, _3
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm3, rdi	# tmp185, _5
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm1	# _16, tmp183
# src/natives/bgraphics.c:226:     DrawCircle(
	movq	xmm5, r9	# tmp188, _9
# src/natives/bgraphics.c:226:     DrawCircle(
	movq	xmm6, r8	# tmp189, _7
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	ecx, xmm3	# _20, tmp185
# src/natives/bgraphics.c:226:     DrawCircle(
	movq	xmm4, rsi	# tmp187, _11
	pxor	xmm0, xmm0	# _22
# src/natives/bgraphics.c:226:     DrawCircle(
	cvttsd2si	esi, xmm5	# _23, tmp188
# src/natives/bgraphics.c:226:     DrawCircle(
	cvtsd2ss	xmm0, xmm4	# _22, tmp187
# src/natives/bgraphics.c:226:     DrawCircle(
	cvttsd2si	edi, xmm6	# _24, tmp189
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movzx	eax, dl	# color, _16
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm2	# _18, tmp184
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movzx	ecx, cl	# _20, _20
	sal	ecx, 16	# tmp157,
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	mov	ah, dl	# color, _18
# src/natives/bgraphics.c:225:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	and	eax, -16711681	# color,
	mov	edx, eax	# tmp158, color
	or	edx, ecx	# tmp159, tmp157
	or	edx, -16777216	# tmp161,
# src/natives/bgraphics.c:226:     DrawCircle(
	call	"DrawCircle"@PLT	#
# src/natives/bgraphics.c:231:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:230:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _15,
	mov	QWORD PTR [rbx], rax	# *result_41(D), _15
# src/natives/bgraphics.c:232: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
# src/natives/bgraphics.c:220:         *result = OBJ_VAL(copyString("drawCircle() expects six number arguments.", 41));
	mov	esi, 41	#,
	lea	rdi, .LC2[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:220:         *result = OBJ_VAL(copyString("drawCircle() expects six number arguments.", 41));
	movabs	rdx, -1125899906842624	# tmp152,
	or	rax, rdx	# _15, tmp152
# src/natives/bgraphics.c:221:         return false;
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_41(D), _15
# src/natives/bgraphics.c:232: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE39:
	.size	"gDrawCircleNative", .-"gDrawCircleNative"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"drawLine() expects seven number arguments."
	.text
	.p2align 4
	.type	"gDrawLineNative", @function
"gDrawLineNative":
.LFB40:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:234: static bool gDrawLineNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:236:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	cmp	edi, 7	# argCount,
	jne	.L34	#,
# src/natives/bgraphics.c:236:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	movabs	rax, 9222246136947933184	# tmp138,
	mov	rdx, QWORD PTR [rsi]	# _1, *args_32(D)
# src/natives/bgraphics.c:236:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rcx, rdx	# tmp184, _1
	not	rcx	# tmp184
	test	rcx, rax	# tmp184, tmp138
	je	.L34	#,
# src/natives/bgraphics.c:236:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rcx, QWORD PTR 8[rsi]	# _3, MEM[(Value *)args_32(D) + 8B]
# src/natives/bgraphics.c:236:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rdi, rcx	# tmp183, _3
	not	rdi	# tmp183
	test	rdi, rax	# tmp183, tmp138
	je	.L34	#,
# src/natives/bgraphics.c:236:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rdi, QWORD PTR 16[rsi]	# _5, MEM[(Value *)args_32(D) + 16B]
# src/natives/bgraphics.c:236:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	r8, rdi	# tmp182, _5
	not	r8	# tmp182
	test	r8, rax	# tmp182, tmp138
	je	.L34	#,
# src/natives/bgraphics.c:237:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r9, QWORD PTR 24[rsi]	# _7, MEM[(Value *)args_32(D) + 24B]
# src/natives/bgraphics.c:236:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	r8, r9	# tmp181, _7
	not	r8	# tmp181
	test	r8, rax	# tmp181, tmp138
	je	.L34	#,
# src/natives/bgraphics.c:237:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r10, QWORD PTR 32[rsi]	# _9, MEM[(Value *)args_32(D) + 32B]
# src/natives/bgraphics.c:237:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r8, r10	# tmp180, _9
	not	r8	# tmp180
	test	r8, rax	# tmp180, tmp138
	je	.L34	#,
# src/natives/bgraphics.c:237:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r11, QWORD PTR 40[rsi]	# _11, MEM[(Value *)args_32(D) + 40B]
# src/natives/bgraphics.c:237:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r8, r11	# tmp179, _11
	not	r8	# tmp179
	test	r8, rax	# tmp179, tmp138
	je	.L34	#,
# src/natives/bgraphics.c:237:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	rsi, QWORD PTR 48[rsi]	# _13, MEM[(Value *)args_32(D) + 48B]
# src/natives/bgraphics.c:237:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r8, rsi	# tmp178, _13
	not	r8	# tmp178
	test	r8, rax	# tmp178, tmp138
	je	.L34	#,
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm0, rdx	# tmp193, _1
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm1, rcx	# tmp194, _3
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm2, rdi	# tmp195, _5
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm0	# _18, tmp193
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	movq	xmm3, rsi	# tmp197, _13
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	movq	xmm4, r11	# tmp198, _11
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	movq	xmm5, r10	# tmp199, _9
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	cvttsd2si	ecx, xmm3	# _24, tmp197
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	movq	xmm6, r9	# tmp200, _7
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	cvttsd2si	esi, xmm5	# _26, tmp199
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	cvttsd2si	edi, xmm6	# _27, tmp200
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movzx	eax, dl	# color, _18
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm1	# _20, tmp194
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	mov	ah, dl	# color, _20
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm2	# _22, tmp195
# src/natives/bgraphics.c:243:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	and	eax, -16711681	# color,
	mov	r8d, eax	# tmp165, color
	movzx	edx, dl	# _22, _22
	sal	edx, 16	# tmp164,
	or	r8d, edx	# tmp166, tmp164
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	cvttsd2si	edx, xmm4	# _25, tmp198
# src/natives/bgraphics.c:244:     DrawLine((int) AS_NUMBER(args[3]), (int) AS_NUMBER(args[4]), 
	or	r8d, -16777216	#,
	call	"DrawLine"@PLT	#
# src/natives/bgraphics.c:247:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:246:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _17,
	mov	QWORD PTR [rbx], rax	# *result_45(D), _17
# src/natives/bgraphics.c:248: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
# src/natives/bgraphics.c:238:         *result = OBJ_VAL(copyString("drawLine() expects seven number arguments.", 41));
	mov	esi, 41	#,
	lea	rdi, .LC3[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:238:         *result = OBJ_VAL(copyString("drawLine() expects seven number arguments.", 41));
	movabs	rdx, -1125899906842624	# tmp159,
	or	rax, rdx	# _17, tmp159
# src/natives/bgraphics.c:239:         return false;
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_45(D), _17
# src/natives/bgraphics.c:248: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE40:
	.size	"gDrawLineNative", .-"gDrawLineNative"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"drawText() expects seven arguments: one string and six numbers."
	.text
	.p2align 4
	.type	"gDrawTextNative", @function
"gDrawTextNative":
.LFB38:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:198: static bool gDrawTextNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:200:     if (argCount != 7 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	cmp	edi, 7	# argCount,
	jne	.L39	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp140,
# src/natives/bgraphics.c:200:     if (argCount != 7 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rax, QWORD PTR [rsi]	# _1, *args_31(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# tmp187, _1
	not	rcx	# tmp187
	test	rcx, rdx	# tmp187, tmp140
	je	.L43	#,
.L39:
# src/natives/bgraphics.c:202:         *result = OBJ_VAL(copyString("drawText() expects seven arguments: one string and six numbers.", 63));
	mov	esi, 63	#,
	lea	rdi, .LC4[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:202:         *result = OBJ_VAL(copyString("drawText() expects seven arguments: one string and six numbers.", 63));
	movabs	rdx, -1125899906842624	# tmp162,
	or	rax, rdx	# _16, tmp162
# src/natives/bgraphics.c:203:         return false;
	xor	edx, edx	# <retval>
.L41:
	mov	QWORD PTR [rbx], rax	# *result_42(D), _16
# src/natives/bgraphics.c:214: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp142,
	and	rax, rdx	# _38, tmp142
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _38->type,
	jne	.L39	#,
# src/natives/bgraphics.c:200:     if (argCount != 7 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	movabs	rdx, 9222246136947933184	# tmp144,
	mov	rcx, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_31(D) + 8B]
# src/natives/bgraphics.c:200:     if (argCount != 7 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rdi, rcx	# tmp186, _2
	not	rdi	# tmp186
	test	rdi, rdx	# tmp186, tmp144
	je	.L39	#,
# src/natives/bgraphics.c:200:     if (argCount != 7 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rdi, QWORD PTR 16[rsi]	# _4, MEM[(Value *)args_31(D) + 16B]
# src/natives/bgraphics.c:200:     if (argCount != 7 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	r8, rdi	# tmp185, _4
	not	r8	# tmp185
	test	r8, rdx	# tmp185, tmp144
	je	.L39	#,
# src/natives/bgraphics.c:201:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r8, QWORD PTR 24[rsi]	# _6, MEM[(Value *)args_31(D) + 24B]
# src/natives/bgraphics.c:200:     if (argCount != 7 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	r9, r8	# tmp184, _6
	not	r9	# tmp184
	test	r9, rdx	# tmp184, tmp144
	je	.L39	#,
# src/natives/bgraphics.c:201:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r9, QWORD PTR 32[rsi]	# _8, MEM[(Value *)args_31(D) + 32B]
# src/natives/bgraphics.c:201:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r10, r9	# tmp183, _8
	not	r10	# tmp183
	test	r10, rdx	# tmp183, tmp144
	je	.L39	#,
# src/natives/bgraphics.c:201:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r10, QWORD PTR 40[rsi]	# _10, MEM[(Value *)args_31(D) + 40B]
# src/natives/bgraphics.c:201:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r11, r10	# tmp182, _10
	not	r11	# tmp182
	test	r11, rdx	# tmp182, tmp144
	je	.L39	#,
# src/natives/bgraphics.c:201:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	rsi, QWORD PTR 48[rsi]	# _12, MEM[(Value *)args_31(D) + 48B]
# src/natives/bgraphics.c:201:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r11, rsi	# tmp181, _12
	not	r11	# tmp181
	test	r11, rdx	# tmp181, tmp144
	je	.L39	#,
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	movq	xmm0, rcx	# tmp196, _2
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	movq	xmm1, rdi	# tmp197, _4
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	movq	xmm2, r8	# tmp198, _6
# src/natives/bgraphics.c:208:     DrawText(
	mov	rdi, QWORD PTR 24[rax]	# MEM[(struct ObjString *)_38].chars, MEM[(struct ObjString *)_38].chars
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	cvttsd2si	ecx, xmm0	# _17, tmp196
# src/natives/bgraphics.c:208:     DrawText(
	movq	xmm3, rsi	# tmp200, _12
# src/natives/bgraphics.c:208:     DrawText(
	movq	xmm4, r10	# tmp201, _10
# src/natives/bgraphics.c:208:     DrawText(
	movq	xmm5, r9	# tmp202, _8
	cvttsd2si	esi, xmm5	# _25, tmp202
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	movzx	edx, cl	# color, _17
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	cvttsd2si	ecx, xmm1	# _19, tmp197
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	mov	dh, cl	# color, _19
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	cvttsd2si	ecx, xmm2	# _21, tmp198
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	and	edx, -16711681	# color,
	mov	r8d, edx	# tmp168, color
# src/natives/bgraphics.c:208:     DrawText(
	cvttsd2si	edx, xmm4	# _24, tmp201
# src/natives/bgraphics.c:207:     Color color = {(int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), (int) AS_NUMBER(args[3]), 255};
	movzx	ecx, cl	# _21, _21
	sal	ecx, 16	# tmp167,
	or	r8d, ecx	# tmp169, tmp167
# src/natives/bgraphics.c:208:     DrawText(
	cvttsd2si	ecx, xmm3	# _23, tmp200
# src/natives/bgraphics.c:208:     DrawText(
	or	r8d, -16777216	#,
	call	"DrawText"@PLT	#
# src/natives/bgraphics.c:213:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:212:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _16,
# src/natives/bgraphics.c:213:     return true;
	jmp	.L41	#
	.cfi_endproc
.LFE38:
	.size	"gDrawTextNative", .-"gDrawTextNative"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"drawRect() expects seven number arguments."
	.text
	.p2align 4
	.type	"gDrawRectNative", @function
"gDrawRectNative":
.LFB37:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:179: static bool gDrawRectNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:181:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	cmp	edi, 7	# argCount,
	jne	.L45	#,
# src/natives/bgraphics.c:181:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	movabs	rax, 9222246136947933184	# tmp138,
	mov	rdx, QWORD PTR [rsi]	# _1, *args_32(D)
# src/natives/bgraphics.c:181:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rcx, rdx	# tmp184, _1
	not	rcx	# tmp184
	test	rcx, rax	# tmp184, tmp138
	je	.L45	#,
# src/natives/bgraphics.c:181:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rcx, QWORD PTR 8[rsi]	# _3, MEM[(Value *)args_32(D) + 8B]
# src/natives/bgraphics.c:181:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rdi, rcx	# tmp183, _3
	not	rdi	# tmp183
	test	rdi, rax	# tmp183, tmp138
	je	.L45	#,
# src/natives/bgraphics.c:181:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	rdi, QWORD PTR 16[rsi]	# _5, MEM[(Value *)args_32(D) + 16B]
# src/natives/bgraphics.c:181:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	r8, rdi	# tmp182, _5
	not	r8	# tmp182
	test	r8, rax	# tmp182, tmp138
	je	.L45	#,
# src/natives/bgraphics.c:182:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r9, QWORD PTR 24[rsi]	# _7, MEM[(Value *)args_32(D) + 24B]
# src/natives/bgraphics.c:181:     if (argCount != 7 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2]) || 
	mov	r8, r9	# tmp181, _7
	not	r8	# tmp181
	test	r8, rax	# tmp181, tmp138
	je	.L45	#,
# src/natives/bgraphics.c:182:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r10, QWORD PTR 32[rsi]	# _9, MEM[(Value *)args_32(D) + 32B]
# src/natives/bgraphics.c:182:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r8, r10	# tmp180, _9
	not	r8	# tmp180
	test	r8, rax	# tmp180, tmp138
	je	.L45	#,
# src/natives/bgraphics.c:182:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r11, QWORD PTR 40[rsi]	# _11, MEM[(Value *)args_32(D) + 40B]
# src/natives/bgraphics.c:182:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r8, r11	# tmp179, _11
	not	r8	# tmp179
	test	r8, rax	# tmp179, tmp138
	je	.L45	#,
# src/natives/bgraphics.c:182:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	rsi, QWORD PTR 48[rsi]	# _13, MEM[(Value *)args_32(D) + 48B]
# src/natives/bgraphics.c:182:         !IS_NUMBER(args[3]) || !IS_NUMBER(args[4]) || !IS_NUMBER(args[5]) || !IS_NUMBER(args[6])) {
	mov	r8, rsi	# tmp178, _13
	not	r8	# tmp178
	test	r8, rax	# tmp178, tmp138
	je	.L45	#,
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm0, rdx	# tmp193, _1
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm1, rcx	# tmp194, _3
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm2, rdi	# tmp195, _5
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm0	# _18, tmp193
# src/natives/bgraphics.c:189:     DrawRectangle(
	movq	xmm3, rsi	# tmp197, _13
# src/natives/bgraphics.c:189:     DrawRectangle(
	movq	xmm4, r11	# tmp198, _11
# src/natives/bgraphics.c:189:     DrawRectangle(
	movq	xmm5, r10	# tmp199, _9
# src/natives/bgraphics.c:189:     DrawRectangle(
	cvttsd2si	ecx, xmm3	# _24, tmp197
# src/natives/bgraphics.c:189:     DrawRectangle(
	movq	xmm6, r9	# tmp200, _7
# src/natives/bgraphics.c:189:     DrawRectangle(
	cvttsd2si	esi, xmm5	# _26, tmp199
# src/natives/bgraphics.c:189:     DrawRectangle(
	cvttsd2si	edi, xmm6	# _27, tmp200
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movzx	eax, dl	# color, _18
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm1	# _20, tmp194
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	mov	ah, dl	# color, _20
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm2	# _22, tmp195
# src/natives/bgraphics.c:188:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	and	eax, -16711681	# color,
	mov	r8d, eax	# tmp165, color
	movzx	edx, dl	# _22, _22
	sal	edx, 16	# tmp164,
	or	r8d, edx	# tmp166, tmp164
# src/natives/bgraphics.c:189:     DrawRectangle(
	cvttsd2si	edx, xmm4	# _25, tmp198
# src/natives/bgraphics.c:189:     DrawRectangle(
	or	r8d, -16777216	#,
	call	"DrawRectangle"@PLT	#
# src/natives/bgraphics.c:195:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:194:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _17,
	mov	QWORD PTR [rbx], rax	# *result_45(D), _17
# src/natives/bgraphics.c:196: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore_state
# src/natives/bgraphics.c:183:         *result = OBJ_VAL(copyString("drawRect() expects seven number arguments.", 41));
	mov	esi, 41	#,
	lea	rdi, .LC5[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:183:         *result = OBJ_VAL(copyString("drawRect() expects seven number arguments.", 41));
	movabs	rdx, -1125899906842624	# tmp159,
	or	rax, rdx	# _17, tmp159
# src/natives/bgraphics.c:184:         return false;
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_45(D), _17
# src/natives/bgraphics.c:196: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE37:
	.size	"gDrawRectNative", .-"gDrawRectNative"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"getDeltaTime() does not expect arguments."
	.text
	.p2align 4
	.type	"getDeltaTimeNative", @function
"getDeltaTimeNative":
.LFB34:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:134: static bool getDeltaTimeNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:136:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L53	#,
# src/natives/bgraphics.c:142:     *result = NUMBER_VAL((double) GetFrameTime());
	call	"GetFrameTime"@PLT	#
# src/natives/bgraphics.c:143:     return true;
	mov	eax, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	cvtss2sd	xmm0, xmm0	# _11, _4
	movq	QWORD PTR [rbx], xmm0	# *result_12(D), _11
# src/natives/bgraphics.c:144: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L53:
	.cfi_restore_state
# src/natives/bgraphics.c:137:         *result = OBJ_VAL(copyString("getDeltaTime() does not expect arguments.", 41));
	mov	esi, 41	#,
	lea	rdi, .LC6[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:137:         *result = OBJ_VAL(copyString("getDeltaTime() does not expect arguments.", 41));
	movabs	rdx, -1125899906842624	# tmp108,
	or	rax, rdx	# _1, tmp108
	movq	xmm0, rax	# _11, _1
# src/natives/bgraphics.c:138:         return false;
	xor	eax, eax	# <retval>
	movq	QWORD PTR [rbx], xmm0	# *result_12(D), _11
# src/natives/bgraphics.c:144: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE34:
	.size	"getDeltaTimeNative", .-"getDeltaTimeNative"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"clearColor() expects three number arguments."
	.text
	.p2align 4
	.type	"gClearColorNative", @function
"gClearColorNative":
.LFB32:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:107: static bool gClearColorNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:109:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	cmp	edi, 3	# argCount,
	jne	.L55	#,
# src/natives/bgraphics.c:109:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	movabs	rax, 9222246136947933184	# tmp122,
	mov	rdx, QWORD PTR [rsi]	# _1, *args_20(D)
# src/natives/bgraphics.c:109:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	rcx, rdx	# tmp148, _1
	not	rcx	# tmp148
	test	rcx, rax	# tmp148, tmp122
	je	.L55	#,
# src/natives/bgraphics.c:109:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	rcx, QWORD PTR 8[rsi]	# _3, MEM[(Value *)args_20(D) + 8B]
# src/natives/bgraphics.c:109:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	rdi, rcx	# tmp147, _3
	not	rdi	# tmp147
	test	rdi, rax	# tmp147, tmp122
	je	.L55	#,
# src/natives/bgraphics.c:109:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	rsi, QWORD PTR 16[rsi]	# _5, MEM[(Value *)args_20(D) + 16B]
# src/natives/bgraphics.c:109:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	rdi, rsi	# tmp146, _5
	not	rdi	# tmp146
	test	rdi, rax	# tmp146, tmp122
	je	.L55	#,
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm0, rdx	# tmp153, _1
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm1, rcx	# tmp154, _3
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movq	xmm2, rsi	# tmp155, _5
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm0	# _10, tmp153
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	movzx	eax, dl	# color, _10
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm1	# _12, tmp154
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	mov	ah, dl	# color, _12
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	cvttsd2si	edx, xmm2	# _14, tmp155
# src/natives/bgraphics.c:115:     Color color = {(int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), (int) AS_NUMBER(args[2]), 255};
	and	eax, -16711681	# color,
	mov	edi, eax	# tmp137, color
	movzx	edx, dl	# _14, _14
	sal	edx, 16	# tmp136,
	or	edi, edx	# tmp138, tmp136
	or	edi, -16777216	# tmp140,
# src/natives/bgraphics.c:116:     ClearBackground(color);
	call	"ClearBackground"@PLT	#
# src/natives/bgraphics.c:118:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:117:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _9,
	mov	QWORD PTR [rbx], rax	# *result_29(D), _9
# src/natives/bgraphics.c:119: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L55:
	.cfi_restore_state
# src/natives/bgraphics.c:110:         *result = OBJ_VAL(copyString("clearColor() expects three number arguments.", 44));
	mov	esi, 44	#,
	lea	rdi, .LC7[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:110:         *result = OBJ_VAL(copyString("clearColor() expects three number arguments.", 44));
	movabs	rdx, -1125899906842624	# tmp131,
	or	rax, rdx	# _9, tmp131
# src/natives/bgraphics.c:111:         return false;
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_29(D), _9
# src/natives/bgraphics.c:119: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE32:
	.size	"gClearColorNative", .-"gClearColorNative"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"endDraw() expects no arguments."
	.text
	.p2align 4
	.type	"gEndDrawNative", @function
"gEndDrawNative":
.LFB31:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:94: static bool gEndDrawNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:96:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L63	#,
# src/natives/bgraphics.c:102:     EndDrawing();
	call	"EndDrawing"@PLT	#
# src/natives/bgraphics.c:104:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:103:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _3,
	mov	QWORD PTR [rbx], rax	# *result_9(D), _3
# src/natives/bgraphics.c:105: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L63:
	.cfi_restore_state
# src/natives/bgraphics.c:97:         *result = OBJ_VAL(copyString("endDraw() expects no arguments.", 33));
	mov	esi, 33	#,
	lea	rdi, .LC8[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:97:         *result = OBJ_VAL(copyString("endDraw() expects no arguments.", 33));
	movabs	rdx, -1125899906842624	# tmp106,
	or	rax, rdx	# _3, tmp106
# src/natives/bgraphics.c:98:         return false;
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_9(D), _3
# src/natives/bgraphics.c:105: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE31:
	.size	"gEndDrawNative", .-"gEndDrawNative"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"beginDraw() expects no arguments."
	.text
	.p2align 4
	.type	"gBeginDrawNative", @function
"gBeginDrawNative":
.LFB30:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:81: static bool gBeginDrawNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:83:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L68	#,
# src/natives/bgraphics.c:89:     BeginDrawing();
	call	"BeginDrawing"@PLT	#
# src/natives/bgraphics.c:91:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:90:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _3,
	mov	QWORD PTR [rbx], rax	# *result_9(D), _3
# src/natives/bgraphics.c:92: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L68:
	.cfi_restore_state
# src/natives/bgraphics.c:84:         *result = OBJ_VAL(copyString("beginDraw() expects no arguments.", 33));
	mov	esi, 33	#,
	lea	rdi, .LC9[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:84:         *result = OBJ_VAL(copyString("beginDraw() expects no arguments.", 33));
	movabs	rdx, -1125899906842624	# tmp106,
	or	rax, rdx	# _3, tmp106
# src/natives/bgraphics.c:85:         return false;
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_9(D), _3
# src/natives/bgraphics.c:92: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE30:
	.size	"gBeginDrawNative", .-"gBeginDrawNative"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"closeWindow() expects no arguments."
	.text
	.p2align 4
	.type	"gCloseWindowNative", @function
"gCloseWindowNative":
.LFB28:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:55: static bool gCloseWindowNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:57:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L73	#,
# src/natives/bgraphics.c:63:     freeResources();
	call	"freeResources"@PLT	#
# src/natives/bgraphics.c:64:     CloseWindow();
	call	"CloseWindow"@PLT	#
# src/natives/bgraphics.c:66:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:65:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _3,
	mov	QWORD PTR [rbx], rax	# *result_10(D), _3
# src/natives/bgraphics.c:67: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore_state
# src/natives/bgraphics.c:58:         *result = OBJ_VAL(copyString("closeWindow() expects no arguments.", 35));
	mov	esi, 35	#,
	lea	rdi, .LC10[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:58:         *result = OBJ_VAL(copyString("closeWindow() expects no arguments.", 35));
	movabs	rdx, -1125899906842624	# tmp106,
	or	rax, rdx	# _3, tmp106
# src/natives/bgraphics.c:59:         return false;
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_10(D), _3
# src/natives/bgraphics.c:67: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE28:
	.size	"gCloseWindowNative", .-"gCloseWindowNative"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"isKeyDown() expects one number argument; key code."
	.text
	.p2align 4
	.type	"gIsKeyDownNative", @function
"gIsKeyDownNative":
.LFB36:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:167: static bool gIsKeyDownNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:169:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L75	#,
# src/natives/bgraphics.c:169:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rdx, 9222246136947933184	# tmp113,
# src/natives/bgraphics.c:169:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_10(D)
# src/natives/bgraphics.c:169:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rcx, rax	# tmp128, _1
	not	rcx	# tmp128
	test	rcx, rdx	# tmp128, tmp113
	je	.L75	#,
# src/natives/bgraphics.c:175:     *result = BOOL_VAL(IsKeyDown((int) round(AS_NUMBER(args[0]))));
	movq	xmm0, rax	# _1, _1
	call	"round"@PLT	#
# src/natives/bgraphics.c:175:     *result = BOOL_VAL(IsKeyDown((int) round(AS_NUMBER(args[0]))));
	cvttsd2si	edi, xmm0	# _4, _3
	call	"IsKeyDown"@PLT	#
# src/natives/bgraphics.c:175:     *result = BOOL_VAL(IsKeyDown((int) round(AS_NUMBER(args[0]))));
	movabs	rdx, 9222246136947933186	# tmp120,
	movzx	eax, al	# _24, _5
	add	rax, rdx	# _7, tmp120
# src/natives/bgraphics.c:176:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:170:         *result = OBJ_VAL(copyString("isKeyDown() expects one number argument; key code.", 50));
	mov	QWORD PTR [rbx], rax	# *result_13(D), _7
# src/natives/bgraphics.c:177: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L75:
	.cfi_restore_state
# src/natives/bgraphics.c:170:         *result = OBJ_VAL(copyString("isKeyDown() expects one number argument; key code.", 50));
	mov	esi, 50	#,
	lea	rdi, .LC11[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:170:         *result = OBJ_VAL(copyString("isKeyDown() expects one number argument; key code.", 50));
	movabs	rdx, -1125899906842624	# tmp116,
	or	rax, rdx	# _7, tmp116
	xor	edx, edx	# <retval>
# src/natives/bgraphics.c:170:         *result = OBJ_VAL(copyString("isKeyDown() expects one number argument; key code.", 50));
	mov	QWORD PTR [rbx], rax	# *result_13(D), _7
# src/natives/bgraphics.c:177: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE36:
	.size	"gIsKeyDownNative", .-"gIsKeyDownNative"
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"targetFPS() expects one number argument."
	.text
	.p2align 4
	.type	"gTargetFPSNative", @function
"gTargetFPSNative":
.LFB33:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:121: static bool gTargetFPSNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:123:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L80	#,
# src/natives/bgraphics.c:123:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rdx, 9222246136947933184	# tmp110,
# src/natives/bgraphics.c:123:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_8(D)
# src/natives/bgraphics.c:123:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rcx, rax	# tmp120, _1
	not	rcx	# tmp120
	test	rcx, rdx	# tmp120, tmp110
	je	.L80	#,
# src/natives/bgraphics.c:129:     SetTargetFPS((int) AS_NUMBER(args[0]));
	movq	xmm0, rax	# tmp123, _1
	cvttsd2si	edi, xmm0	# _4, tmp123
	call	"SetTargetFPS"@PLT	#
# src/natives/bgraphics.c:131:     return true;
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:130:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _17,
	mov	QWORD PTR [rbx], rax	# *result_11(D), _17
# src/natives/bgraphics.c:132: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L80:
	.cfi_restore_state
# src/natives/bgraphics.c:124:         *result = OBJ_VAL(copyString("targetFPS() expects one number argument.", 40));
	mov	esi, 40	#,
	lea	rdi, .LC12[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:124:         *result = OBJ_VAL(copyString("targetFPS() expects one number argument.", 40));
	movabs	rdx, -1125899906842624	# tmp113,
	or	rax, rdx	# _17, tmp113
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_11(D), _17
# src/natives/bgraphics.c:132: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE33:
	.size	"gTargetFPSNative", .-"gTargetFPSNative"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"shouldCloseWindow() expects no arguments."
	.text
	.p2align 4
	.type	"gWindowShouldCloseNative", @function
"gWindowShouldCloseNative":
.LFB29:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bgraphics.c:69: static bool gWindowShouldCloseNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bgraphics.c:71:     if (argCount != 0) {
	test	edi, edi	# argCount
	jne	.L88	#,
# src/natives/bgraphics.c:77:     *result = BOOL_VAL(WindowShouldClose());
	call	"WindowShouldClose"@PLT	#
# src/natives/bgraphics.c:77:     *result = BOOL_VAL(WindowShouldClose());
	movabs	rdx, 9222246136947933186	# tmp110,
	movzx	eax, al	# _19, _1
	add	rax, rdx	# cstore_3, tmp110
# src/natives/bgraphics.c:78:     return true;
	mov	edx, 1	# <retval>,
	mov	QWORD PTR [rbx], rax	# *result_9(D), cstore_3
# src/natives/bgraphics.c:79: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L88:
	.cfi_restore_state
# src/natives/bgraphics.c:72:         *result = OBJ_VAL(copyString("shouldCloseWindow() expects no arguments.", 41));
	mov	esi, 41	#,
	lea	rdi, .LC13[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:72:         *result = OBJ_VAL(copyString("shouldCloseWindow() expects no arguments.", 41));
	movabs	rdx, -1125899906842624	# tmp108,
	or	rax, rdx	# cstore_3, tmp108
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_9(D), cstore_3
# src/natives/bgraphics.c:79: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE29:
	.size	"gWindowShouldCloseNative", .-"gWindowShouldCloseNative"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"init() requires three arguments: width, height, and title."
	.text
	.p2align 4
	.type	"gInitNative", @function
"gInitNative":
.LFB26:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bgraphics.c:11:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_STRING(args[2])) {
	cmp	edi, 3	# argCount,
	jne	.L90	#,
# src/natives/bgraphics.c:11:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_STRING(args[2])) {
	movabs	rax, 9222246136947933184	# tmp125,
	mov	rdx, QWORD PTR [rsi]	# _2, *args_15(D)
	and	rdx, rax	# _2, tmp125
# src/natives/bgraphics.c:11:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_STRING(args[2])) {
	cmp	rdx, rax	# _2, tmp125
	je	.L90	#,
# src/natives/bgraphics.c:11:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_STRING(args[2])) {
	mov	rdx, QWORD PTR 8[rsi]	# _4, MEM[(Value *)args_15(D) + 8B]
	and	rdx, rax	# _4, tmp125
# src/natives/bgraphics.c:11:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_STRING(args[2])) {
	cmp	rdx, rax	# _4, tmp125
	je	.L90	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp131,
# src/natives/bgraphics.c:11:     if (argCount != 3 || !IS_NUMBER(args[0]) || !IS_NUMBER(args[1]) || !IS_STRING(args[2])) {
	mov	rax, QWORD PTR 16[rsi]	# _5, MEM[(Value *)args_15(D) + 16B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# tmp149, _5
	not	rcx	# tmp149
	test	rcx, rdx	# tmp149, tmp131
	je	.L93	#,
.L90:
# src/natives/bgraphics.c:12:         *result = OBJ_VAL(copyString("init() requires three arguments: width, height, and title.", 58));
	mov	esi, 58	#,
	lea	rdi, .LC14[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:12:         *result = OBJ_VAL(copyString("init() requires three arguments: width, height, and title.", 58));
	movabs	rdx, -1125899906842624	# tmp143,
	or	rax, rdx	# _9, tmp143
# src/natives/bgraphics.c:13:         return false;
	xor	edx, edx	# <retval>
.L91:
	mov	QWORD PTR [rbx], rax	# *result_19(D), _9
# src/natives/bgraphics.c:21: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L93:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp134,
	and	rax, rdx	# _17, tmp134
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _16->type,
	jne	.L90	#,
# src/natives/bgraphics.c:17:     SetTraceLogLevel(LOG_NONE);
	mov	edi, 7	#,
	mov	QWORD PTR 8[rsp], rsi	# %sfp, args
	call	"SetTraceLogLevel"@PLT	#
# src/natives/bgraphics.c:18:     InitWindow((int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), AS_CSTRING(args[2]));
	mov	rsi, QWORD PTR 8[rsp]	# args, %sfp
	movabs	rdx, 1125899906842623	# tmp134,
# src/natives/bgraphics.c:18:     InitWindow((int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), AS_CSTRING(args[2]));
	cvttsd2si	eax, QWORD PTR 8[rsi]	# _29, MEM[(Value *)args_15(D) + 8B]
# src/natives/bgraphics.c:18:     InitWindow((int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), AS_CSTRING(args[2]));
	and	rdx, QWORD PTR 16[rsi]	# _24, MEM[(Value *)args_15(D) + 16B]
# src/natives/bgraphics.c:18:     InitWindow((int) AS_NUMBER(args[0]), (int) AS_NUMBER(args[1]), AS_CSTRING(args[2]));
	cvttsd2si	edi, QWORD PTR [rsi]	# _32, *args_15(D)
	mov	rdx, QWORD PTR 24[rdx]	# _25->chars, _25->chars
	mov	esi, eax	#, _29
	call	"InitWindow"@PLT	#
	mov	edx, 1	# <retval>,
# src/natives/bgraphics.c:19:     *result = BOOL_VAL(true);
	movabs	rax, 9222246136947933187	# _9,
	jmp	.L91	#
	.cfi_endproc
.LFE26:
	.size	"gInitNative", .-"gInitNative"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC15:
	.string	"init"
.LC16:
	.string	"closeWindow"
.LC17:
	.string	"windowShouldClose"
.LC18:
	.string	"beginDraw"
.LC19:
	.string	"endDraw"
.LC20:
	.string	"clearColor"
.LC21:
	.string	"targetFPS"
.LC22:
	.string	"getDeltaTime"
.LC23:
	.string	"drawRect"
.LC24:
	.string	"drawText"
.LC25:
	.string	"drawLine"
.LC26:
	.string	"drawCircle"
.LC27:
	.string	"pollEvents"
.LC28:
	.string	"getEvents"
.LC29:
	.string	"isKeyDown"
.LC30:
	.string	"KEY_A"
.LC31:
	.string	"KEY_B"
.LC32:
	.string	"KEY_C"
.LC33:
	.string	"KEY_D"
.LC34:
	.string	"KEY_E"
.LC35:
	.string	"KEY_F"
.LC36:
	.string	"KEY_G"
.LC37:
	.string	"KEY_H"
.LC38:
	.string	"KEY_I"
.LC39:
	.string	"KEY_J"
.LC40:
	.string	"KEY_K"
.LC41:
	.string	"KEY_L"
.LC42:
	.string	"KEY_M"
.LC43:
	.string	"KEY_N"
.LC44:
	.string	"KEY_O"
.LC45:
	.string	"KEY_P"
.LC46:
	.string	"KEY_Q"
.LC47:
	.string	"KEY_R"
.LC48:
	.string	"KEY_S"
.LC49:
	.string	"KEY_T"
.LC50:
	.string	"KEY_U"
.LC51:
	.string	"KEY_V"
.LC52:
	.string	"KEY_W"
.LC53:
	.string	"KEY_X"
.LC54:
	.string	"KEY_Y"
.LC55:
	.string	"KEY_Z"
.LC56:
	.string	"KEY_ZERO"
.LC57:
	.string	"KEY_ONE"
.LC58:
	.string	"KEY_TWO"
.LC59:
	.string	"KEY_THREE"
.LC60:
	.string	"KEY_FOUR"
.LC61:
	.string	"KEY_FIVE"
.LC62:
	.string	"KEY_SIX"
.LC63:
	.string	"KEY_SEVEN"
.LC64:
	.string	"KEY_EIGHT"
.LC65:
	.string	"KEY_NINE"
.LC66:
	.string	"KEY_F1"
.LC67:
	.string	"KEY_F2"
.LC68:
	.string	"KEY_F3"
.LC69:
	.string	"KEY_F4"
.LC70:
	.string	"KEY_F5"
.LC71:
	.string	"KEY_F6"
.LC72:
	.string	"KEY_F7"
.LC73:
	.string	"KEY_F8"
.LC74:
	.string	"KEY_F9"
.LC75:
	.string	"KEY_F10"
.LC76:
	.string	"KEY_F11"
.LC77:
	.string	"KEY_F12"
.LC78:
	.string	"KEY_SPACE"
.LC79:
	.string	"KEY_ENTER"
.LC80:
	.string	"KEY_ESCAPE"
.LC81:
	.string	"KEY_TAB"
.LC82:
	.string	"KEY_BACKSPACE"
.LC83:
	.string	"KEY_INSERT"
.LC84:
	.string	"KEY_DELETE"
.LC85:
	.string	"KEY_HOME"
.LC86:
	.string	"KEY_END"
.LC87:
	.string	"KEY_PAGE_UP"
.LC88:
	.string	"KEY_PAGE_DOWN"
.LC89:
	.string	"KEY_CAPS_LOCK"
.LC90:
	.string	"KEY_UP"
.LC91:
	.string	"KEY_DOWN"
.LC92:
	.string	"KEY_LEFT"
.LC93:
	.string	"KEY_RIGHT"
.LC94:
	.string	"KEY_LEFT_SHIFT"
.LC95:
	.string	"KEY_RIGHT_SHIFT"
.LC96:
	.string	"KEY_LEFT_CONTROL"
.LC97:
	.string	"KEY_RIGHT_CONTROL"
.LC98:
	.string	"KEY_LEFT_ALT"
.LC99:
	.string	"KEY_RIGHT_ALT"
.LC100:
	.string	"KEY_LEFT_SUPER"
.LC101:
	.string	"KEY_RIGHT_SUPER"
.LC102:
	.string	"KEY_APOSTROPHE"
.LC103:
	.string	"KEY_COMMA"
.LC104:
	.string	"KEY_MINUS"
.LC105:
	.string	"KEY_PERIOD"
.LC106:
	.string	"KEY_SLASH"
.LC107:
	.string	"KEY_SEMICOLON"
.LC108:
	.string	"KEY_EQUAL"
.LC109:
	.string	"KEY_LEFT_BRACKET"
.LC110:
	.string	"KEY_BACKSLASH"
.LC111:
	.string	"KEY_RIGHT_BRACKET"
.LC112:
	.string	"KEY_GRAVE"
.LC113:
	.string	"MOUSE_DOWN"
.LC114:
	.string	"MOUSE_UP"
.LC115:
	.string	"MOUSE_LEFT"
.LC116:
	.string	"MOUSE_RIGHT"
.LC117:
	.string	"MOUSE_MIDDLE"
	.text
	.p2align 4
	.globl	"buildGraphicsModules"
	.type	"buildGraphicsModules", @function
"buildGraphicsModules":
.LFB43:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
# src/natives/bgraphics.c:270:     ObjModule** modules = malloc(sizeof(ObjModule*) * 2);
	mov	edi, 16	#,
# src/natives/bgraphics.c:269: ObjModule** buildGraphicsModules() {
	mov	QWORD PTR 8[rsp], rbp	#,
	.cfi_offset 6, -40
# src/natives/bgraphics.c:273:     push(OBJ_VAL(grmodule));
	movabs	rbp, -1125899906842624	# tmp263,
# src/natives/bgraphics.c:269: ObjModule** buildGraphicsModules() {
	mov	QWORD PTR 16[rsp], r12	#,
	mov	QWORD PTR 24[rsp], r13	#,
	mov	QWORD PTR 32[rsp], r14	#,
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
# src/natives/bgraphics.c:270:     ObjModule** modules = malloc(sizeof(ObjModule*) * 2);
	call	"malloc"@PLT	#
	mov	r12, rax	# tmp513,
# src/natives/bgraphics.c:272:     ObjModule* grmodule = newModule();
	call	"newModule"@PLT	#
# src/natives/bgraphics.c:273:     push(OBJ_VAL(grmodule));
	mov	rdi, rax	# _2, grmodule
# src/natives/bgraphics.c:272:     ObjModule* grmodule = newModule();
	mov	r13, rax	# grmodule,
# src/natives/bgraphics.c:273:     push(OBJ_VAL(grmodule));
	or	rdi, rbp	# _2, tmp263
# src/natives/bgraphics.c:273:     push(OBJ_VAL(grmodule));
	call	"push"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gInitNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC15[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _201,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _201, _201
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _201, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _204
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gCloseWindowNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 11	#,
	lea	rdi, .LC16[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _196,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _196, _196
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _196, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _199
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gWindowShouldCloseNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 17	#,
	lea	rdi, .LC17[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _191,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _191, _191
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _191, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _194
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gBeginDrawNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 9	#,
	lea	rdi, .LC18[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _186,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _186, _186
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _186, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _189
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gEndDrawNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 7	#,
	lea	rdi, .LC19[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _181,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _181, _181
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _181, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _184
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gClearColorNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 10	#,
	lea	rdi, .LC20[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _176,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _176, _176
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _176, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _179
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gTargetFPSNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 9	#,
	lea	rdi, .LC21[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _171,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _171, _171
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _171, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _174
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "getDeltaTimeNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 12	#,
	lea	rdi, .LC22[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _166,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _166, _166
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _166, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _169
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gDrawRectNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 8	#,
	lea	rdi, .LC23[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _161,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _161, _161
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _161, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _164
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gDrawTextNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 8	#,
	lea	rdi, .LC24[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _156,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _156, _156
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _156, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _159
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gDrawLineNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 8	#,
	lea	rdi, .LC25[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _151,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _151, _151
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _151, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _154
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gDrawCircleNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 10	#,
	lea	rdi, .LC26[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _146,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _146, _146
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _146, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _149
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:288:     modules[0] = grmodule;
	mov	QWORD PTR [r12], r13	# *modules_7, grmodule
# src/natives/bgraphics.c:290:     ObjModule* gamodule = newModule();
	call	"newModule"@PLT	#
# src/natives/bgraphics.c:291:     push(OBJ_VAL(gamodule));
	mov	rdi, rax	# _4, gamodule
# src/natives/bgraphics.c:290:     ObjModule* gamodule = newModule();
	mov	r13, rax	# gamodule,
# src/natives/bgraphics.c:291:     push(OBJ_VAL(gamodule));
	or	rdi, rbp	# _4, tmp263
# src/natives/bgraphics.c:291:     push(OBJ_VAL(gamodule));
	call	"push"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gPollEventsNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 10	#,
	lea	rdi, .LC27[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _141,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _141, _141
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _141, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _144
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "getEventsNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 9	#,
	lea	rdi, .LC28[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _136,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _136, _136
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _136, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _139
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "gIsKeyDownNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 9	#,
	lea	rdi, .LC29[rip]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r14, rax	# _131,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r14	# _131, _131
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, 16[r13]	#,
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbp	# _131, tmp263
# src/natives/bgraphics.c:257:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _134
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC30[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634274385308418048	#,
	mov	rsi, rax	#, _41
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC31[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634344754052595712	#,
	mov	rsi, rax	#, _43
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC32[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634415122796773376	#,
	mov	rsi, rax	#, _44
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC33[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634485491540951040	#,
	mov	rsi, rax	#, _45
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC34[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634555860285128704	#,
	mov	rsi, rax	#, _46
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC35[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634626229029306368	#,
	mov	rsi, rax	#, _47
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC36[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634696597773484032	#,
	mov	rsi, rax	#, _48
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC37[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634766966517661696	#,
	mov	rsi, rax	#, _49
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC38[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634837335261839360	#,
	mov	rsi, rax	#, _50
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC39[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634907704006017024	#,
	mov	rsi, rax	#, _51
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC40[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4634978072750194688	#,
	mov	rsi, rax	#, _52
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC41[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635048441494372352	#,
	mov	rsi, rax	#, _53
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC42[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635118810238550016	#,
	mov	rsi, rax	#, _54
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC43[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635189178982727680	#,
	mov	rsi, rax	#, _55
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC44[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635259547726905344	#,
	mov	rsi, rax	#, _56
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC45[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635329916471083008	#,
	mov	rsi, rax	#, _57
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC46[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635400285215260672	#,
	mov	rsi, rax	#, _58
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC47[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635470653959438336	#,
	mov	rsi, rax	#, _59
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC48[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635541022703616000	#,
	mov	rsi, rax	#, _60
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC49[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635611391447793664	#,
	mov	rsi, rax	#, _61
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC50[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635681760191971328	#,
	mov	rsi, rax	#, _62
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC51[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635752128936148992	#,
	mov	rsi, rax	#, _63
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC52[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635822497680326656	#,
	mov	rsi, rax	#, _64
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC53[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635892866424504320	#,
	mov	rsi, rax	#, _65
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC54[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4635963235168681984	#,
	mov	rsi, rax	#, _66
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 5	#,
	lea	rdi, .LC55[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4636033603912859648	#,
	mov	rsi, rax	#, _67
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC56[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4631952216750555136	#,
	mov	rsi, rax	#, _68
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC57[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4632092954238910464	#,
	mov	rsi, rax	#, _69
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC58[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4632233691727265792	#,
	mov	rsi, rax	#, _70
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC59[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4632374429215621120	#,
	mov	rsi, rax	#, _71
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC60[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4632515166703976448	#,
	mov	rsi, rax	#, _72
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC61[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4632655904192331776	#,
	mov	rsi, rax	#, _73
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC62[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4632796641680687104	#,
	mov	rsi, rax	#, _74
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC63[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4632937379169042432	#,
	mov	rsi, rax	#, _75
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC64[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4633078116657397760	#,
	mov	rsi, rax	#, _76
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC65[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4633218854145753088	#,
	mov	rsi, rax	#, _77
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC66[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643809350144491520	#,
	mov	rsi, rax	#, _78
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC67[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643826942330535936	#,
	mov	rsi, rax	#, _79
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC68[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643844534516580352	#,
	mov	rsi, rax	#, _80
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC69[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643862126702624768	#,
	mov	rsi, rax	#, _81
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC70[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643879718888669184	#,
	mov	rsi, rax	#, _82
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC71[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643897311074713600	#,
	mov	rsi, rax	#, _83
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC72[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643914903260758016	#,
	mov	rsi, rax	#, _84
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC73[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643932495446802432	#,
	mov	rsi, rax	#, _85
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC74[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643950087632846848	#,
	mov	rsi, rax	#, _86
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC75[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643967679818891264	#,
	mov	rsi, rax	#, _87
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC76[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643985272004935680	#,
	mov	rsi, rax	#, _88
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC77[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644002864190980096	#,
	mov	rsi, rax	#, _89
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC78[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4629700416936869888	#,
	mov	rsi, rax	#, _90
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC79[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643228808005025792	#,
	mov	rsi, rax	#, _91
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 10	#,
	lea	rdi, .LC80[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643211215818981376	#,
	mov	rsi, rax	#, _92
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC81[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643246400191070208	#,
	mov	rsi, rax	#, _93
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 13	#,
	lea	rdi, .LC82[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643263992377114624	#,
	mov	rsi, rax	#, _94
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 10	#,
	lea	rdi, .LC83[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643281584563159040	#,
	mov	rsi, rax	#, _95
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 10	#,
	lea	rdi, .LC84[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643299176749203456	#,
	mov	rsi, rax	#, _96
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC85[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643422322051514368	#,
	mov	rsi, rax	#, _97
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC86[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643439914237558784	#,
	mov	rsi, rax	#, _98
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 11	#,
	lea	rdi, .LC87[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643387137679425536	#,
	mov	rsi, rax	#, _99
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 13	#,
	lea	rdi, .LC88[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643404729865469952	#,
	mov	rsi, rax	#, _100
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 13	#,
	lea	rdi, .LC89[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643633428284047360	#,
	mov	rsi, rax	#, _101
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 6	#,
	lea	rdi, .LC90[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643369545493381120	#,
	mov	rsi, rax	#, _102
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC91[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643351953307336704	#,
	mov	rsi, rax	#, _103
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC92[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643334361121292288	#,
	mov	rsi, rax	#, _104
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC93[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643316768935247872	#,
	mov	rsi, rax	#, _105
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 14	#,
	lea	rdi, .LC94[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644688959446712320	#,
	mov	rsi, rax	#, _106
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 15	#,
	lea	rdi, .LC95[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644759328190889984	#,
	mov	rsi, rax	#, _107
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 16	#,
	lea	rdi, .LC96[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644706551632756736	#,
	mov	rsi, rax	#, _108
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 17	#,
	lea	rdi, .LC97[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644776920376934400	#,
	mov	rsi, rax	#, _109
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 12	#,
	lea	rdi, .LC98[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644724143818801152	#,
	mov	rsi, rax	#, _110
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 13	#,
	lea	rdi, .LC99[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644794512562978816	#,
	mov	rsi, rax	#, _111
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 14	#,
	lea	rdi, .LC100[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644741736004845568	#,
	mov	rsi, rax	#, _112
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 15	#,
	lea	rdi, .LC101[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4644812104749023232	#,
	mov	rsi, rax	#, _113
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 14	#,
	lea	rdi, .LC102[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4630685579355357184	#,
	mov	rsi, rax	#, _114
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC103[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4631389266797133824	#,
	mov	rsi, rax	#, _115
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC104[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4631530004285489152	#,
	mov	rsi, rax	#, _116
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 10	#,
	lea	rdi, .LC105[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4631670741773844480	#,
	mov	rsi, rax	#, _117
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC106[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4631811479262199808	#,
	mov	rsi, rax	#, _118
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 13	#,
	lea	rdi, .LC107[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4633500329122463744	#,
	mov	rsi, rax	#, _119
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC108[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4633781804099174400	#,
	mov	rsi, rax	#, _120
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 16	#,
	lea	rdi, .LC109[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4636103972657037312	#,
	mov	rsi, rax	#, _121
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 13	#,
	lea	rdi, .LC110[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4636174341401214976	#,
	mov	rsi, rax	#, _122
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 17	#,
	lea	rdi, .LC111[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4636244710145392640	#,
	mov	rsi, rax	#, _123
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 9	#,
	lea	rdi, .LC112[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4636455816377925632	#,
	mov	rsi, rax	#, _124
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 10	#,
	lea	rdi, .LC83[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643281584563159040	#,
	mov	rsi, rax	#, _125
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 10	#,
	lea	rdi, .LC84[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643299176749203456	#,
	mov	rsi, rax	#, _126
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC85[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643422322051514368	#,
	mov	rsi, rax	#, _127
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 7	#,
	lea	rdi, .LC86[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643439914237558784	#,
	mov	rsi, rax	#, _128
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 11	#,
	lea	rdi, .LC87[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643387137679425536	#,
	mov	rsi, rax	#, _129
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 13	#,
	lea	rdi, .LC88[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4643404729865469952	#,
	mov	rsi, rax	#, _130
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 10	#,
	lea	rdi, .LC113[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	xor	edx, edx	#
	lea	rdi, 16[r13]	#,
	mov	rsi, rax	#, _35
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 8	#,
	lea	rdi, .LC114[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4607182418800017408	#,
	mov	rsi, rax	#, _37
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 10	#,
	lea	rdi, .LC115[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	xor	edx, edx	#
	lea	rdi, 16[r13]	#,
	mov	rsi, rax	#, _38
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 11	#,
	lea	rdi, .LC116[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4607182418800017408	#,
	mov	rsi, rax	#, _39
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	mov	esi, 12	#,
	lea	rdi, .LC117[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bgraphics.c:261:     tableSet(&module->table, copyString(name, length), NUMBER_VAL(value));
	lea	rdi, 16[r13]	#,
	movabs	rdx, 4611686018427387904	#,
	mov	rsi, rax	#, _40
	call	"tableSet"@PLT	#
# src/natives/bgraphics.c:299:     modules[1] = gamodule;
	mov	QWORD PTR 8[r12], r13	# MEM[(struct ObjModule * *)modules_7 + 8B], gamodule
# src/natives/bgraphics.c:301:     pop();
	call	"pop"@PLT	#
# src/natives/bgraphics.c:302:     pop();
	call	"pop"@PLT	#
# src/natives/bgraphics.c:304: }
	mov	rax, r12	#, tmp513
	mov	rbp, QWORD PTR 8[rsp]	#,
	mov	r12, QWORD PTR 16[rsp]	#,
	mov	r13, QWORD PTR 24[rsp]	#,
	mov	r14, QWORD PTR 32[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE43:
	.size	"buildGraphicsModules", .-"buildGraphicsModules"
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
