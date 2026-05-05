	.file	"natives.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"assert() takes a bool and a string."
	.text
	.p2align 4
	.type	"assertNative", @function
"assertNative":
.LFB31:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/natives.c:60: static bool assertNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/natives.c:62:     if (argCount != 2 || !IS_BOOL(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L2	#,
# src/natives/natives.c:62:     if (argCount != 2 || !IS_BOOL(args[0]) || !IS_STRING(args[1])) {
	movabs	rax, 9222246136947933187	# tmp112,
# src/natives/natives.c:62:     if (argCount != 2 || !IS_BOOL(args[0]) || !IS_STRING(args[1])) {
	mov	rcx, QWORD PTR [rsi]	# _1, *args_11(D)
	mov	rdx, rcx	# _2, _1
	or	rdx, 1	# _2,
# src/natives/natives.c:62:     if (argCount != 2 || !IS_BOOL(args[0]) || !IS_STRING(args[1])) {
	cmp	rdx, rax	# _2, tmp112
	je	.L7	#,
.L2:
# src/natives/natives.c:63:         *result = OBJ_VAL(copyString("assert() takes a bool and a string.", 35));
	mov	esi, 35	#,
	lea	rdi, .LC0[rip]	#,
	call	"copyString"@PLT	#
# src/natives/natives.c:63:         *result = OBJ_VAL(copyString("assert() takes a bool and a string.", 35));
	movabs	rdx, -1125899906842624	# tmp120,
	or	rax, rdx	# _6, tmp120
# src/natives/natives.c:64:         return false;
	xor	edx, edx	# <retval>
.L3:
# src/natives/natives.c:68:         *result = args[1];
	mov	QWORD PTR [rbx], rax	# *result_13(D), _6
# src/natives/natives.c:73: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
# src/natives/natives.c:62:     if (argCount != 2 || !IS_BOOL(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR 8[rsi]	# _6, MEM[(Value *)args_11(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rsi, -1125899906842624	# tmp114,
	mov	rdi, rax	# tmp136, _6
	not	rdi	# tmp136
	test	rdi, rsi	# tmp136, tmp114
	jne	.L2	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rsi, 1125899906842623	# tmp117,
	and	rsi, rax	# _18, _6
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rsi], 9	# _19->type,
	jne	.L2	#,
# src/natives/natives.c:67:     if (!AS_BOOL(args[0])) {
	cmp	rcx, rdx	# _1, _2
# src/natives/natives.c:72:     return true;
	movabs	rdx, 9222246136947933185	# tmp129,
	cmove	rax, rdx	# _6,, _6, tmp129
	sete	dl	#, <retval>
	jmp	.L3	#
	.cfi_endproc
.LFE31:
	.size	"assertNative", .-"assertNative"
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"setField() requires an instance, a string, and a value."
	.text
	.p2align 4
	.type	"setFieldNative", @function
"setFieldNative":
.LFB30:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/natives.c:48:     if (argCount != 3 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 3	# argCount,
	jne	.L9	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp118,
# src/natives/natives.c:48:     if (argCount != 3 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_13(D)
	mov	rcx, rsi	# args, args
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rdi, rax	# _15, _1
	and	rdi, rdx	# _15, tmp118
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rdi, rdx	# _15, tmp118
	je	.L12	#,
.L9:
# src/natives/natives.c:49:         *result = OBJ_VAL(copyString("setField() requires an instance, a string, and a value.", 55));
	mov	esi, 55	#,
	lea	rdi, .LC1[rip]	#,
	call	"copyString"@PLT	#
# src/natives/natives.c:49:         *result = OBJ_VAL(copyString("setField() requires an instance, a string, and a value.", 55));
	movabs	rdx, -1125899906842624	# tmp128,
	or	rax, rdx	# _5, tmp128
# src/natives/natives.c:50:         return false;
	xor	edx, edx	# <retval>
.L10:
	mov	QWORD PTR [rbx], rax	# *result_17(D), _5
# src/natives/natives.c:58: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp120,
	and	rax, rdx	# _21, tmp120
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 5	# _21->type,
	jne	.L9	#,
# src/natives/natives.c:48:     if (argCount != 3 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	mov	rsi, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_13(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r8, rsi	# tmp134, _2
	not	r8	# tmp134
	test	r8, rdi	# tmp134, _15
	jne	.L9	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rsi, rdx	# _25, tmp120
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rsi], 9	# _25->type,
	jne	.L9	#,
# src/natives/natives.c:55:     tableSet(&instance->fields, AS_STRING(args[1]), args[2]);
	mov	rdx, QWORD PTR 16[rcx]	# MEM[(Value *)args_13(D) + 16B], MEM[(Value *)args_13(D) + 16B]
	lea	rdi, 24[rax]	# _7,
	mov	QWORD PTR 8[rsp], rcx	# %sfp, args
	call	"tableSet"@PLT	#
# src/natives/natives.c:56:     *result = args[2];
	mov	rcx, QWORD PTR 8[rsp]	# args, %sfp
# src/natives/natives.c:57:     return true;
	mov	edx, 1	# <retval>,
# src/natives/natives.c:56:     *result = args[2];
	mov	rax, QWORD PTR 16[rcx]	# _5, MEM[(Value *)args_13(D) + 16B]
# src/natives/natives.c:57:     return true;
	jmp	.L10	#
	.cfi_endproc
.LFE30:
	.size	"setFieldNative", .-"setFieldNative"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"getField() requires an instance and a string."
	.text
	.p2align 4
	.type	"getFieldNative", @function
"getFieldNative":
.LFB29:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/natives.c:31: static bool getFieldNative(int argCount, Value* args, Value* result) {
	mov	rbx, QWORD PTR fs:40	# result, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 8[rsp], rbx	# D.6707, result
	mov	rbx, rdx	# result, result
# src/natives/natives.c:33:     if (argCount != 2 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L14	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp119,
# src/natives/natives.c:33:     if (argCount != 2 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_12(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# _14, _1
	and	rcx, rdx	# _14, tmp119
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rdx	# _14, tmp119
	je	.L18	#,
.L14:
# src/natives/natives.c:34:         *result = OBJ_VAL(copyString("getField() requires an instance and a string.", 45));
	mov	esi, 45	#,
	lea	rdi, .LC2[rip]	#,
	call	"copyString"@PLT	#
# src/natives/natives.c:34:         *result = OBJ_VAL(copyString("getField() requires an instance and a string.", 45));
	movabs	rdx, -1125899906842624	# tmp129,
	or	rax, rdx	# _5, tmp129
# src/natives/natives.c:35:         return false;
	xor	edx, edx	# <retval>
.L15:
	mov	QWORD PTR [rbx], rax	# *result_16(D), _5
# src/natives/natives.c:44: }
	mov	rax, QWORD PTR 8[rsp]	# tmp137, D.6707
	sub	rax, QWORD PTR fs:40	# tmp137, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L19	#,
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp121,
	and	rax, rdx	# _21, tmp121
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 5	# _21->type,
	jne	.L14	#,
# src/natives/natives.c:33:     if (argCount != 2 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	mov	rsi, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_12(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rdi, rsi	# tmp136, _2
	not	rdi	# tmp136
	test	rdi, rcx	# tmp136, _14
	jne	.L14	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rsi, rdx	# _25, tmp121
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rsi], 9	# _25->type,
	jne	.L14	#,
# src/natives/natives.c:41:     tableGet(&instance->fields, AS_STRING(args[1]), &value);
	mov	rdx, rsp	# tmp126,
	lea	rdi, 24[rax]	# _6,
	call	"tableGet"@PLT	#
# src/natives/natives.c:42:     *result = value;
	mov	rax, QWORD PTR [rsp]	# _5, value
# src/natives/natives.c:43:     return true;
	mov	edx, 1	# <retval>,
	jmp	.L15	#
.L19:
# src/natives/natives.c:44: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE29:
	.size	"getFieldNative", .-"getFieldNative"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"hasField() requires an instance and a string."
	.text
	.p2align 4
	.type	"hasFieldNative", @function
"hasFieldNative":
.LFB28:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/natives.c:17: static bool hasFieldNative(int argCount, Value* args, Value* result) {
	mov	rbx, QWORD PTR fs:40	# result, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 8[rsp], rbx	# D.6713, result
	mov	rbx, rdx	# result, result
# src/natives/natives.c:19:     if (argCount != 2 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L21	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp121,
# src/natives/natives.c:19:     if (argCount != 2 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_13(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# _15, _1
	and	rcx, rdx	# _15, tmp121
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rdx	# _15, tmp121
	je	.L25	#,
.L21:
# src/natives/natives.c:20:         *result = OBJ_VAL(copyString("hasField() requires an instance and a string.", 45));
	mov	esi, 45	#,
	lea	rdi, .LC3[rip]	#,
	call	"copyString"@PLT	#
# src/natives/natives.c:20:         *result = OBJ_VAL(copyString("hasField() requires an instance and a string.", 45));
	movabs	rdx, -1125899906842624	# tmp133,
	or	rax, rdx	# _5, tmp133
# src/natives/natives.c:21:         return false;
	xor	edx, edx	# <retval>
.L22:
# src/natives/natives.c:20:         *result = OBJ_VAL(copyString("hasField() requires an instance and a string.", 45));
	mov	QWORD PTR [rbx], rax	# *result_17(D), _5
# src/natives/natives.c:29: }
	mov	rax, QWORD PTR 8[rsp]	# tmp142, D.6713
	sub	rax, QWORD PTR fs:40	# tmp142, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L26	#,
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp123,
	and	rax, rdx	# _22, tmp123
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 5	# _22->type,
	jne	.L21	#,
# src/natives/natives.c:19:     if (argCount != 2 || !IS_INSTANCE(args[0]) || !IS_STRING(args[1])) {
	mov	rsi, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_13(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rdi, rsi	# tmp141, _2
	not	rdi	# tmp141
	test	rdi, rcx	# tmp141, _15
	jne	.L21	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rsi, rdx	# _26, tmp123
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rsi], 9	# _26->type,
	jne	.L21	#,
# src/natives/natives.c:27:     *result = BOOL_VAL(tableGet(&instance->fields, AS_STRING(args[1]), &dummy));
	mov	rdx, rsp	# tmp128,
	lea	rdi, 24[rax]	# _6,
	call	"tableGet"@PLT	#
# src/natives/natives.c:27:     *result = BOOL_VAL(tableGet(&instance->fields, AS_STRING(args[1]), &dummy));
	movabs	rdx, 9222246136947933186	# tmp131,
	movzx	eax, al	# _28, _7
	add	rax, rdx	# _5, tmp131
# src/natives/natives.c:28:     return true;
	mov	edx, 1	# <retval>,
	jmp	.L22	#
.L26:
# src/natives/natives.c:29: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE28:
	.size	"hasFieldNative", .-"hasFieldNative"
	.p2align 4
	.type	"exitNative", @function
"exitNative":
.LFB27:
	.cfi_startproc
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# src/natives/natives.c:14:     exit(AS_NUMBER(args[0]));
	cvttsd2si	edi, QWORD PTR [rsi]	# _2, *args_4(D)
	call	"exit"@PLT	#
	.cfi_endproc
.LFE27:
	.size	"exitNative", .-"exitNative"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"cast"
.LC5:
	.string	"io"
.LC6:
	.string	"math"
.LC7:
	.string	"str"
.LC8:
	.string	"time"
.LC9:
	.string	"game"
.LC10:
	.string	"graphics"
.LC11:
	.string	"exit"
.LC12:
	.string	"hasField"
.LC13:
	.string	"getField"
.LC14:
	.string	"setField"
.LC15:
	.string	"assert"
	.text
	.p2align 4
	.globl	"defineAllNatives"
	.type	"defineAllNatives", @function
"defineAllNatives":
.LFB32:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/natives.c:76:     defineModule("cast", buildCastModule());
	call	"buildCastModule"@PLT	#
# src/natives/natives.c:76:     defineModule("cast", buildCastModule());
	lea	rdi, .LC4[rip]	#,
	mov	rsi, rax	#, _1
	call	"defineModule"@PLT	#
# src/natives/natives.c:77:     defineModule("io", buildIOModule());
	call	"buildIOModule"@PLT	#
# src/natives/natives.c:77:     defineModule("io", buildIOModule());
	lea	rdi, .LC5[rip]	#,
	mov	rsi, rax	#, _2
	call	"defineModule"@PLT	#
# src/natives/natives.c:78:     defineModule("math", buildMathModule());
	call	"buildMathModule"@PLT	#
# src/natives/natives.c:78:     defineModule("math", buildMathModule());
	lea	rdi, .LC6[rip]	#,
	mov	rsi, rax	#, _3
	call	"defineModule"@PLT	#
# src/natives/natives.c:79:     defineModule("str", buildStringModule());
	call	"buildStringModule"@PLT	#
# src/natives/natives.c:79:     defineModule("str", buildStringModule());
	lea	rdi, .LC7[rip]	#,
	mov	rsi, rax	#, _4
	call	"defineModule"@PLT	#
# src/natives/natives.c:80:     defineModule("time", buildTimeModule());
	call	"buildTimeModule"@PLT	#
# src/natives/natives.c:80:     defineModule("time", buildTimeModule());
	lea	rdi, .LC8[rip]	#,
	mov	rsi, rax	#, _5
	call	"defineModule"@PLT	#
# src/natives/natives.c:82:     ObjModule** gmodules = buildGraphicsModules();
	call	"buildGraphicsModules"@PLT	#
# src/natives/natives.c:84:     defineModule("game", gmodules[1]);
	lea	rdi, .LC9[rip]	#,
	mov	rsi, QWORD PTR 8[rax]	# MEM[(struct ObjModule * *)gmodules_25 + 8B], MEM[(struct ObjModule * *)gmodules_25 + 8B]
# src/natives/natives.c:82:     ObjModule** gmodules = buildGraphicsModules();
	mov	rbx, rax	# gmodules,
# src/natives/natives.c:84:     defineModule("game", gmodules[1]);
	call	"defineModule"@PLT	#
# src/natives/natives.c:85:     defineModule("graphics", gmodules[0]);
	mov	rsi, QWORD PTR [rbx]	# *gmodules_25, *gmodules_25
	lea	rdi, .LC10[rip]	#,
	call	"defineModule"@PLT	#
# src/natives/natives.c:87:     defineNative("exit", newNative(exitNative));
	lea	rdi, "exitNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/natives.c:87:     defineNative("exit", newNative(exitNative));
	lea	rdi, .LC11[rip]	#,
	mov	rsi, rax	#, _8
	call	"defineNative"@PLT	#
# src/natives/natives.c:88:     defineNative("hasField", newNative(hasFieldNative));
	lea	rdi, "hasFieldNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/natives.c:88:     defineNative("hasField", newNative(hasFieldNative));
	lea	rdi, .LC12[rip]	#,
	mov	rsi, rax	#, _9
	call	"defineNative"@PLT	#
# src/natives/natives.c:89:     defineNative("getField", newNative(getFieldNative));
	lea	rdi, "getFieldNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/natives.c:89:     defineNative("getField", newNative(getFieldNative));
	lea	rdi, .LC13[rip]	#,
	mov	rsi, rax	#, _10
	call	"defineNative"@PLT	#
# src/natives/natives.c:90:     defineNative("setField", newNative(setFieldNative));
	lea	rdi, "setFieldNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/natives.c:90:     defineNative("setField", newNative(setFieldNative));
	lea	rdi, .LC14[rip]	#,
	mov	rsi, rax	#, _11
	call	"defineNative"@PLT	#
# src/natives/natives.c:91:     defineNative("assert", newNative(assertNative));
	lea	rdi, "assertNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/natives.c:91:     defineNative("assert", newNative(assertNative));
	lea	rdi, .LC15[rip]	#,
# src/natives/natives.c:92: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
# src/natives/natives.c:91:     defineNative("assert", newNative(assertNative));
	mov	rsi, rax	#, _12
	jmp	"defineNative"@PLT	#
	.cfi_endproc
.LFE32:
	.size	"defineAllNatives", .-"defineAllNatives"
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
