	.file	"bstring.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"len() takes one string argument"
	.text
	.p2align 4
	.type	"sLengthNative", @function
"sLengthNative":
.LFB26:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bstring.c:15: static bool sLengthNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bstring.c:17:     if (argCount != 1 || !IS_STRING(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L2	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp113,
# src/natives/bstring.c:17:     if (argCount != 1 || !IS_STRING(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_11(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# tmp124, _1
	not	rcx	# tmp124
	test	rcx, rdx	# tmp124, tmp113
	je	.L6	#,
.L2:
# src/natives/bstring.c:18:         *result = OBJ_VAL(copyString("len() takes one string argument", 31));
	mov	esi, 31	#,
	lea	rdi, .LC0[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:18:         *result = OBJ_VAL(copyString("len() takes one string argument", 31));
	movabs	rdx, -1125899906842624	# tmp118,
	or	rax, rdx	# _4, tmp118
# src/natives/bstring.c:19:         return false;
	xor	edx, edx	# <retval>
.L3:
	mov	QWORD PTR [rbx], rax	# *result_14(D), _4
# src/natives/bstring.c:25: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp115,
	and	rax, rdx	# _18, tmp115
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _18->type,
	jne	.L2	#,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	pxor	xmm0, xmm0	# tmp127
# src/natives/bstring.c:24:     return true;
	mov	edx, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	cvtsi2sd	xmm0, DWORD PTR 16[rax]	# tmp127, MEM[(struct ObjString *)_18].length
	movq	rax, xmm0	# _4, tmp127
# src/natives/bstring.c:24:     return true;
	jmp	.L3	#
	.cfi_endproc
.LFE26:
	.size	"sLengthNative", .-"sLengthNative"
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"lower() takes one string argument."
	.text
	.p2align 4
	.type	"sLowerNative", @function
"sLowerNative":
.LFB33:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bstring.c:252:     if (argCount != 1 || !IS_STRING(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L8	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, -1125899906842624	# tmp131,
# src/natives/bstring.c:252:     if (argCount != 1 || !IS_STRING(args[0])) {
	mov	rdx, QWORD PTR [rsi]	# _1, *args_31(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rdx	# tmp154, _1
	not	rcx	# tmp154
	test	rcx, rax	# tmp154, tmp131
	je	.L17	#,
.L8:
# src/natives/bstring.c:253:         *result = OBJ_VAL(copyString("lower() takes one string argument.", 34));
	mov	esi, 34	#,
	lea	rdi, .LC1[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:253:         *result = OBJ_VAL(copyString("lower() takes one string argument.", 34));
	movabs	rdx, -1125899906842624	# tmp138,
	or	rax, rdx	# tmp139, tmp138
	mov	QWORD PTR [rbx], rax	# *result_37(D), tmp139
# src/natives/bstring.c:254:         return false;
	xor	eax, eax	# <retval>
.L7:
# src/natives/bstring.c:272: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, 1125899906842623	# tmp133,
	and	rdx, rax	# _47, tmp133
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rdx], 9	# _47->type,
	jne	.L8	#,
# src/natives/bstring.c:259:     char* res = malloc(sizeof(char) * (string->length + 1));
	mov	ecx, DWORD PTR 16[rdx]	# _52, MEM[(struct ObjString *)_47].length
	mov	QWORD PTR 8[rsp], rdx	# %sfp, _47
# src/natives/bstring.c:259:     char* res = malloc(sizeof(char) * (string->length + 1));
	lea	edi, 1[rcx]	# _6,
	mov	DWORD PTR [rsp], ecx	# %sfp, _52
# src/natives/bstring.c:259:     char* res = malloc(sizeof(char) * (string->length + 1));
	movsxd	rdi, edi	# _7, _6
	call	"malloc"@PLT	#
# src/natives/bstring.c:261:     for (int i = 0; i < string->length; i++) {
	movsxd	rcx, DWORD PTR [rsp]	#, %sfp
	mov	rdx, QWORD PTR 8[rsp]	# _47, %sfp
# src/natives/bstring.c:259:     char* res = malloc(sizeof(char) * (string->length + 1));
	mov	rdi, rax	# res,
# src/natives/bstring.c:261:     for (int i = 0; i < string->length; i++) {
	xor	eax, eax	# ivtmp.28
	test	ecx, ecx	# _52
	jle	.L10	#,
	.p2align 6
	.p2align 4
	.p2align 3
.L9:
# src/natives/bstring.c:262:         char c = string->chars[i];
	mov	rcx, QWORD PTR 24[rdx]	# MEM[(struct ObjString *)_47].chars, MEM[(struct ObjString *)_47].chars
	movzx	ecx, BYTE PTR [rcx+rax]	# c, *_66
# src/natives/bstring.c:263:         if (c >= 'A' && c <= 'Z') {
	lea	esi, -65[rcx]	# _63,
# src/natives/bstring.c:263:         if (c >= 'A' && c <= 'Z') {
	cmp	sil, 25	# _63,
	ja	.L12	#,
# src/natives/bstring.c:264:             res[i] = c + 32;
	add	ecx, 32	# tmp142,
.L12:
# src/natives/bstring.c:264:             res[i] = c + 32;
	mov	BYTE PTR [rdi+rax], cl	# MEM[(char *)res_34 + ivtmp.28_41 * 1], c
# src/natives/bstring.c:261:     for (int i = 0; i < string->length; i++) {
	movsxd	rcx, DWORD PTR 16[rdx]	#, MEM[(struct ObjString *)_47].length
# src/natives/bstring.c:261:     for (int i = 0; i < string->length; i++) {
	add	rax, 1	# ivtmp.28,
	cmp	ecx, eax	# _52, ivtmp.28
	jg	.L9	#,
.L10:
# src/natives/bstring.c:267:     res[string->length] = '\0';
	mov	BYTE PTR [rdi+rcx], 0	# *_19,
# src/natives/bstring.c:269:     *result = OBJ_VAL(copyString(res, string->length));
	mov	esi, DWORD PTR 16[rdx]	# MEM[(struct ObjString *)_47].length, MEM[(struct ObjString *)_47].length
	mov	QWORD PTR [rsp], rdi	# %sfp, res
	call	"copyString"@PLT	#
# src/natives/bstring.c:270:     free(res);
	mov	rdi, QWORD PTR [rsp]	# res, %sfp
# src/natives/bstring.c:269:     *result = OBJ_VAL(copyString(res, string->length));
	movabs	rdx, -1125899906842624	# tmp145,
	or	rax, rdx	# tmp146, tmp145
	mov	QWORD PTR [rbx], rax	# *result_37(D), tmp146
# src/natives/bstring.c:270:     free(res);
	call	"free"@PLT	#
# src/natives/bstring.c:271:     return true;
	mov	eax, 1	# <retval>,
	jmp	.L7	#
	.cfi_endproc
.LFE33:
	.size	"sLowerNative", .-"sLowerNative"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"upper() takes one string argument."
	.text
	.p2align 4
	.type	"sUpperNative", @function
"sUpperNative":
.LFB32:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bstring.c:228:     if (argCount != 1 || !IS_STRING(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L19	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, -1125899906842624	# tmp131,
# src/natives/bstring.c:228:     if (argCount != 1 || !IS_STRING(args[0])) {
	mov	rdx, QWORD PTR [rsi]	# _1, *args_31(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rdx	# tmp154, _1
	not	rcx	# tmp154
	test	rcx, rax	# tmp154, tmp131
	je	.L28	#,
.L19:
# src/natives/bstring.c:229:         *result = OBJ_VAL(copyString("upper() takes one string argument.", 34));
	mov	esi, 34	#,
	lea	rdi, .LC2[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:229:         *result = OBJ_VAL(copyString("upper() takes one string argument.", 34));
	movabs	rdx, -1125899906842624	# tmp138,
	or	rax, rdx	# tmp139, tmp138
	mov	QWORD PTR [rbx], rax	# *result_37(D), tmp139
# src/natives/bstring.c:230:         return false;
	xor	eax, eax	# <retval>
.L18:
# src/natives/bstring.c:248: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L28:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, 1125899906842623	# tmp133,
	and	rdx, rax	# _47, tmp133
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rdx], 9	# _47->type,
	jne	.L19	#,
# src/natives/bstring.c:235:     char* res = malloc(sizeof(char) * (string->length + 1));
	mov	ecx, DWORD PTR 16[rdx]	# _52, MEM[(struct ObjString *)_47].length
	mov	QWORD PTR 8[rsp], rdx	# %sfp, _47
# src/natives/bstring.c:235:     char* res = malloc(sizeof(char) * (string->length + 1));
	lea	edi, 1[rcx]	# _6,
	mov	DWORD PTR [rsp], ecx	# %sfp, _52
# src/natives/bstring.c:235:     char* res = malloc(sizeof(char) * (string->length + 1));
	movsxd	rdi, edi	# _7, _6
	call	"malloc"@PLT	#
# src/natives/bstring.c:237:     for (int i = 0; i < string->length; i++) {
	movsxd	rcx, DWORD PTR [rsp]	#, %sfp
	mov	rdx, QWORD PTR 8[rsp]	# _47, %sfp
# src/natives/bstring.c:235:     char* res = malloc(sizeof(char) * (string->length + 1));
	mov	rdi, rax	# res,
# src/natives/bstring.c:237:     for (int i = 0; i < string->length; i++) {
	xor	eax, eax	# ivtmp.39
	test	ecx, ecx	# _52
	jle	.L21	#,
	.p2align 6
	.p2align 4
	.p2align 3
.L20:
# src/natives/bstring.c:238:         char c = string->chars[i];
	mov	rcx, QWORD PTR 24[rdx]	# MEM[(struct ObjString *)_47].chars, MEM[(struct ObjString *)_47].chars
	movzx	ecx, BYTE PTR [rcx+rax]	# c, *_66
# src/natives/bstring.c:239:         if (c >= 'a' && c <= 'z') {
	lea	esi, -97[rcx]	# _63,
# src/natives/bstring.c:239:         if (c >= 'a' && c <= 'z') {
	cmp	sil, 25	# _63,
	ja	.L23	#,
# src/natives/bstring.c:240:             res[i] = c - 32;
	sub	ecx, 32	# tmp142,
.L23:
# src/natives/bstring.c:240:             res[i] = c - 32;
	mov	BYTE PTR [rdi+rax], cl	# MEM[(char *)res_34 + ivtmp.39_41 * 1], c
# src/natives/bstring.c:237:     for (int i = 0; i < string->length; i++) {
	movsxd	rcx, DWORD PTR 16[rdx]	#, MEM[(struct ObjString *)_47].length
# src/natives/bstring.c:237:     for (int i = 0; i < string->length; i++) {
	add	rax, 1	# ivtmp.39,
	cmp	ecx, eax	# _52, ivtmp.39
	jg	.L20	#,
.L21:
# src/natives/bstring.c:243:     res[string->length] = '\0';
	mov	BYTE PTR [rdi+rcx], 0	# *_19,
# src/natives/bstring.c:245:     *result = OBJ_VAL(copyString(res, string->length));
	mov	esi, DWORD PTR 16[rdx]	# MEM[(struct ObjString *)_47].length, MEM[(struct ObjString *)_47].length
	mov	QWORD PTR [rsp], rdi	# %sfp, res
	call	"copyString"@PLT	#
# src/natives/bstring.c:246:     free(res);
	mov	rdi, QWORD PTR [rsp]	# res, %sfp
# src/natives/bstring.c:245:     *result = OBJ_VAL(copyString(res, string->length));
	movabs	rdx, -1125899906842624	# tmp145,
	or	rax, rdx	# tmp146, tmp145
	mov	QWORD PTR [rbx], rax	# *result_37(D), tmp146
# src/natives/bstring.c:246:     free(res);
	call	"free"@PLT	#
# src/natives/bstring.c:247:     return true;
	mov	eax, 1	# <retval>,
	jmp	.L18	#
	.cfi_endproc
.LFE32:
	.size	"sUpperNative", .-"sUpperNative"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"trim() expects one string argument."
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	""
.LC5:
	.string	"trim() ran out of memory."
	.text
	.p2align 4
	.type	"sTrimNative", @function
"sTrimNative":
.LFB31:
	.cfi_startproc
	sub	rsp, 56	#,
	.cfi_def_cfa_offset 64
	mov	QWORD PTR 40[rsp], rbx	#,
	.cfi_offset 3, -24
	mov	rbx, rdx	# result, result
# src/natives/bstring.c:188:     if (argCount != 1 || !IS_STRING(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L30	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp147,
# src/natives/bstring.c:188:     if (argCount != 1 || !IS_STRING(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_36(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# tmp188, _1
	not	rcx	# tmp188
	test	rcx, rdx	# tmp188, tmp147
	je	.L54	#,
.L30:
# src/natives/bstring.c:189:         *result = OBJ_VAL(copyString("trim() expects one string argument.", 35));
	mov	esi, 35	#,
	lea	rdi, .LC3[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:189:         *result = OBJ_VAL(copyString("trim() expects one string argument.", 35));
	movabs	rdx, -1125899906842624	# tmp151,
	or	rax, rdx	# tmp152, tmp151
	mov	QWORD PTR [rbx], rax	# *result_51(D), tmp152
.L33:
# src/natives/bstring.c:190:         return false;
	xor	eax, eax	# <retval>
.L29:
# src/natives/bstring.c:224: }
	mov	rbx, QWORD PTR 40[rsp]	#,
	add	rsp, 56	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp149,
	and	rax, rdx	# _61, tmp149
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _61->type,
	jne	.L30	#,
# src/natives/bstring.c:194:     int length = AS_STRING(args[0])->length;
	mov	edx, DWORD PTR 16[rax]	# length, MEM[(struct ObjString *)_61].length
# src/natives/bstring.c:200:     for (int i = 0; i < length; i++) {
	test	edx, edx	# length
	jle	.L32	#,
# src/natives/bstring.c:195:     char* string = AS_CSTRING(args[0]);
	mov	r8, QWORD PTR 24[rax]	# string, MEM[(struct ObjString *)_61].chars
	mov	edi, edx	# _76, length
	xor	esi, esi	# ivtmp.59
.L35:
	movzx	eax, BYTE PTR [r8+rsi]	# tmp191, MEM[(char *)string_39 + ivtmp.59_16 * 1]
	sub	eax, 9	# _5,
	cmp	al, 23	# _5,
	ja	.L34	#,
	mov	ecx, 8388627	# tmp157,
	bt	rcx, rax	# tmp157, _5
	jc	.L55	#,
.L34:
# src/natives/bstring.c:207:     for (int i = length - 1; i >= start; i--) {
	lea	edi, -1[rdx]	#,
	mov	QWORD PTR 48[rsp], r14	#,
	.cfi_offset 14, -16
	mov	ecx, esi	# i, ivtmp.59
	lea	r9, 1[r8]	# _30,
# src/natives/bstring.c:207:     for (int i = length - 1; i >= start; i--) {
	cmp	esi, edi	# ivtmp.59, i
	jg	.L39	#,
.L38:
	movzx	eax, BYTE PTR -1[r9+rdi]	# tmp192, MEM[(char *)_30 + -1B + ivtmp.50_72 * 1]
	sub	eax, 9	# _78,
	cmp	al, 23	# _78,
	ja	.L37	#,
	mov	esi, 8388627	# tmp167,
	bt	rsi, rax	# tmp167, _78
	jc	.L56	#,
.L37:
# src/natives/bstring.c:210:         end = i + 1; break;
	lea	edx, 1[rdi]	# length,
.L39:
# src/natives/bstring.c:213:     int len = end - start;
	sub	edx, ecx	# length, i
	mov	QWORD PTR 24[rsp], r8	# %sfp, string
	mov	r14d, edx	# len, len
# src/natives/bstring.c:214:     char* res = malloc(sizeof(char) * len);
	movsxd	rdx, edx	# _18, len
# src/natives/bstring.c:213:     int len = end - start;
	mov	DWORD PTR 20[rsp], ecx	# %sfp, i
# src/natives/bstring.c:214:     char* res = malloc(sizeof(char) * len);
	mov	rdi, rdx	#, _18
	mov	QWORD PTR 8[rsp], rdx	# %sfp, _18
	call	"malloc"@PLT	#
# src/natives/bstring.c:215:     if (res == NULL) {
	mov	rdx, QWORD PTR 8[rsp]	# _18, %sfp
	mov	r8, QWORD PTR 24[rsp]	# string, %sfp
	test	rax, rax	# tmp185
# src/natives/bstring.c:214:     char* res = malloc(sizeof(char) * len);
	mov	rdi, rax	# tmp185,
# src/natives/bstring.c:215:     if (res == NULL) {
	je	.L57	#,
# src/natives/bstring.c:220:     strncpy(res, string + start, len);
	mov	ecx, DWORD PTR 20[rsp]	# _22, %sfp
# src/natives/bstring.c:220:     strncpy(res, string + start, len);
	lea	rsi, [r8+rcx]	# _23,
# src/natives/bstring.c:220:     strncpy(res, string + start, len);
	call	"strncpy"@PLT	#
# src/natives/bstring.c:221:     *result = OBJ_VAL(copyString(res, len));
	mov	esi, r14d	#, len
# src/natives/bstring.c:220:     strncpy(res, string + start, len);
	mov	rdi, rax	# tmp185,
# src/natives/bstring.c:221:     *result = OBJ_VAL(copyString(res, len));
	mov	QWORD PTR 8[rsp], rax	# %sfp, tmp185
	call	"copyString"@PLT	#
# src/natives/bstring.c:222:     free(res);
	mov	rdi, QWORD PTR 8[rsp]	# tmp185, %sfp
# src/natives/bstring.c:221:     *result = OBJ_VAL(copyString(res, len));
	movabs	rdx, -1125899906842624	# tmp176,
	or	rax, rdx	# tmp177, tmp176
	mov	QWORD PTR [rbx], rax	# *result_51(D), tmp177
# src/natives/bstring.c:222:     free(res);
	call	"free"@PLT	#
	mov	r14, QWORD PTR 48[rsp]	#,
	.cfi_restore 14
.L36:
# src/natives/bstring.c:205:     if (!foundStart) { *result = OBJ_VAL(copyString("", 0)); return true; }
	mov	eax, 1	# <retval>,
	jmp	.L29	#
	.p2align 4,,10
	.p2align 3
.L55:
# src/natives/bstring.c:200:     for (int i = 0; i < length; i++) {
	add	rsi, 1	# ivtmp.59,
	cmp	rsi, rdi	# ivtmp.59, _76
	jne	.L35	#,
.L32:
# src/natives/bstring.c:205:     if (!foundStart) { *result = OBJ_VAL(copyString("", 0)); return true; }
	xor	esi, esi	#
	lea	rdi, .LC4[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:205:     if (!foundStart) { *result = OBJ_VAL(copyString("", 0)); return true; }
	movabs	rdx, -1125899906842624	# tmp160,
	or	rax, rdx	# tmp161, tmp160
	mov	QWORD PTR [rbx], rax	# *result_51(D), tmp161
# src/natives/bstring.c:205:     if (!foundStart) { *result = OBJ_VAL(copyString("", 0)); return true; }
	jmp	.L36	#
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_offset 14, -16
# src/natives/bstring.c:207:     for (int i = length - 1; i >= start; i--) {
	sub	rdi, 1	# ivtmp.50,
	cmp	ecx, edi	# i, ivtmp.50
	jle	.L38	#,
	jmp	.L39	#
.L57:
# src/natives/bstring.c:216:         *result = OBJ_VAL(copyString("trim() ran out of memory.", 25));
	mov	esi, 25	#,
	lea	rdi, .LC5[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:216:         *result = OBJ_VAL(copyString("trim() ran out of memory.", 25));
	mov	edx, 16383	# tmp171,
	mov	r14, QWORD PTR 48[rsp]	#,
	.cfi_restore 14
	sal	rdx, 50	# tmp171,
	or	rax, rdx	# tmp172, tmp171
	mov	QWORD PTR [rbx], rax	# *result_51(D), tmp172
# src/natives/bstring.c:217:         return false;
	jmp	.L33	#
	.cfi_endproc
.LFE31:
	.size	"sTrimNative", .-"sTrimNative"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"substr() takes one string and two number arguments."
	.align 8
.LC7:
	.string	"Invalid string index(ces) in substr()"
	.text
	.p2align 4
	.type	"sSubstrNative", @function
"sSubstrNative":
.LFB27:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 16[rsp], rbx	#,
	.cfi_offset 3, -32
	mov	rbx, rdx	# result, result
# src/natives/bstring.c:29:     if (argCount != 3 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	cmp	edi, 3	# argCount,
	jne	.L59	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp138,
# src/natives/bstring.c:29:     if (argCount != 3 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_26(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# _30, _1
	and	rcx, rdx	# _30, tmp138
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rdx	# _30, tmp138
	je	.L67	#,
.L59:
# src/natives/bstring.c:30:         *result = OBJ_VAL(copyString("substr() takes one string and two number arguments.", 51));
	mov	esi, 51	#,
	lea	rdi, .LC6[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:30:         *result = OBJ_VAL(copyString("substr() takes one string and two number arguments.", 51));
	movabs	rdx, -1125899906842624	# tmp148,
	or	rax, rdx	# tmp149, tmp148
	mov	QWORD PTR [rbx], rax	# *result_39(D), tmp149
.L65:
# src/natives/bstring.c:31:         return false;
	xor	eax, eax	# <retval>
.L58:
# src/natives/bstring.c:54: }
	mov	rbx, QWORD PTR 16[rsp]	#,
	add	rsp, 40	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L67:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp140,
	and	rax, rdx	# _27, tmp140
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _27->type,
	jne	.L59	#,
# src/natives/bstring.c:29:     if (argCount != 3 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	movabs	rdx, 9222246136947933184	# tmp142,
	mov	rdi, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_26(D) + 8B]
# src/natives/bstring.c:29:     if (argCount != 3 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	r8, rdi	# tmp175, _2
	not	r8	# tmp175
	test	r8, rdx	# tmp175, tmp142
	je	.L59	#,
# src/natives/bstring.c:29:     if (argCount != 3 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	rsi, QWORD PTR 16[rsi]	# _4, MEM[(Value *)args_26(D) + 16B]
# src/natives/bstring.c:29:     if (argCount != 3 || !IS_STRING(args[0]) || !IS_NUMBER(args[1]) || !IS_NUMBER(args[2])) {
	mov	r8, rsi	# tmp174, _4
	not	r8	# tmp174
	test	r8, rdx	# tmp174, tmp142
	je	.L59	#,
# src/natives/bstring.c:35:     int beginIndex = (int) AS_NUMBER(args[1]);
	movq	xmm0, rdi	# tmp180, _2
	cvttsd2si	edx, xmm0	# beginIndex, tmp180
# src/natives/bstring.c:40:     if (beginIndex < 0 || endIndex > AS_STRING(args[0])->length || beginIndex > endIndex) {
	test	edx, edx	# beginIndex
	js	.L62	#,
# src/natives/bstring.c:36:     int endIndex = (int) AS_NUMBER(args[2]);
	movq	xmm1, rsi	# tmp181, _4
	cvttsd2si	esi, xmm1	# endIndex, tmp181
# src/natives/bstring.c:40:     if (beginIndex < 0 || endIndex > AS_STRING(args[0])->length || beginIndex > endIndex) {
	cmp	DWORD PTR 16[rax], esi	# MEM[(struct ObjString *)_27].length, endIndex
	jl	.L62	#,
	cmp	edx, esi	# beginIndex, endIndex
	jg	.L62	#,
	mov	QWORD PTR 24[rsp], r14	#,
	.cfi_offset 14, -24
# src/natives/bstring.c:37:     int length = endIndex - beginIndex;
	mov	r14d, esi	# endIndex, endIndex
	sub	r14d, edx	# endIndex, beginIndex
	mov	QWORD PTR 32[rsp], r15	#,
	.cfi_offset 15, -16
# src/natives/bstring.c:38:     char* string = AS_CSTRING(args[0]);
	mov	r15, QWORD PTR 24[rax]	# string, MEM[(struct ObjString *)_27].chars
# src/natives/bstring.c:45:     char* res = malloc(sizeof(char) * (endIndex - beginIndex + 1));
	lea	edi, 1[r14]	# _14,
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _30
# src/natives/bstring.c:37:     int length = endIndex - beginIndex;
	mov	DWORD PTR [rsp], edx	# %sfp, beginIndex
# src/natives/bstring.c:45:     char* res = malloc(sizeof(char) * (endIndex - beginIndex + 1));
	call	"malloc"@PLT	#
# src/natives/bstring.c:46:     strncpy(res, string + beginIndex, length);
	mov	edx, DWORD PTR [rsp]	# _16, %sfp
	mov	r8d, r14d	# _15, length
# src/natives/bstring.c:45:     char* res = malloc(sizeof(char) * (endIndex - beginIndex + 1));
	mov	rdi, rax	# tmp172,
# src/natives/bstring.c:46:     strncpy(res, string + beginIndex, length);
	mov	QWORD PTR [rsp], r8	# %sfp, _15
# src/natives/bstring.c:46:     strncpy(res, string + beginIndex, length);
	lea	rsi, [r15+rdx]	# _17,
# src/natives/bstring.c:46:     strncpy(res, string + beginIndex, length);
	mov	rdx, r8	#, _15
	call	"strncpy"@PLT	#
# src/natives/bstring.c:47:     res[length] = '\0';
	mov	r8, QWORD PTR [rsp]	# _15, %sfp
# src/natives/bstring.c:49:     *result = OBJ_VAL(copyString(res, length));
	mov	esi, r14d	#, length
# src/natives/bstring.c:46:     strncpy(res, string + beginIndex, length);
	mov	rdi, rax	# tmp172,
# src/natives/bstring.c:49:     *result = OBJ_VAL(copyString(res, length));
	mov	QWORD PTR [rsp], rax	# %sfp, tmp172
# src/natives/bstring.c:47:     res[length] = '\0';
	mov	BYTE PTR [rax+r8], 0	# *_18,
# src/natives/bstring.c:49:     *result = OBJ_VAL(copyString(res, length));
	call	"copyString"@PLT	#
# src/natives/bstring.c:49:     *result = OBJ_VAL(copyString(res, length));
	or	rax, QWORD PTR 8[rsp]	# tmp165, %sfp
# src/natives/bstring.c:51:     free(res);
	mov	rdi, QWORD PTR [rsp]	# tmp172, %sfp
# src/natives/bstring.c:49:     *result = OBJ_VAL(copyString(res, length));
	mov	QWORD PTR [rbx], rax	# *result_39(D), tmp165
# src/natives/bstring.c:51:     free(res);
	call	"free"@PLT	#
# src/natives/bstring.c:53:     return true;
	mov	r14, QWORD PTR 24[rsp]	#,
	.cfi_restore 14
	mov	r15, QWORD PTR 32[rsp]	#,
	.cfi_restore 15
	mov	eax, 1	# <retval>,
	jmp	.L58	#
	.p2align 4,,10
	.p2align 3
.L62:
# src/natives/bstring.c:41:         *result = OBJ_VAL(copyString("Invalid string index(ces) in substr()", 37));
	mov	esi, 37	#,
	lea	rdi, .LC7[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:41:         *result = OBJ_VAL(copyString("Invalid string index(ces) in substr()", 37));
	movabs	rdx, -1125899906842624	# tmp155,
	or	rax, rdx	# tmp156, tmp155
	mov	QWORD PTR [rbx], rax	# *result_39(D), tmp156
# src/natives/bstring.c:42:         return false;
	jmp	.L65	#
	.cfi_endproc
.LFE27:
	.size	"sSubstrNative", .-"sSubstrNative"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"join() expects an array and a string arguments."
	.section	.rodata.str1.1
.LC9:
	.string	"join() ran out of memory."
	.text
	.p2align 4
	.type	"sJoinNative", @function
"sJoinNative":
.LFB30:
	.cfi_startproc
	sub	rsp, 56	#,
	.cfi_def_cfa_offset 64
	mov	QWORD PTR 16[rsp], rbx	#,
	.cfi_offset 3, -48
	mov	rbx, rdx	# result, result
# src/natives/bstring.c:156:     if (argCount != 2 || !IS_ARRAY(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L69	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, -1125899906842624	# tmp159,
# src/natives/bstring.c:156:     if (argCount != 2 || !IS_ARRAY(args[0]) || !IS_STRING(args[1])) {
	mov	rdx, QWORD PTR [rsi]	# _1, *args_47(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rdx	# _49, _1
	and	rcx, rax	# _49, tmp159
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rax	# _49, tmp159
	je	.L90	#,
.L69:
# src/natives/bstring.c:157:         *result = OBJ_VAL(copyString("join() expects an array and a string arguments.", 47));
	mov	esi, 47	#,
	lea	rdi, .LC8[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:157:         *result = OBJ_VAL(copyString("join() expects an array and a string arguments.", 47));
	movabs	rdx, -1125899906842624	# tmp169,
	or	rax, rdx	# tmp170, tmp169
	mov	QWORD PTR [rbx], rax	# *result_54(D), tmp170
.L72:
# src/natives/bstring.c:158:         return false;
	xor	eax, eax	# <retval>
.L68:
# src/natives/bstring.c:184: }
	mov	rbx, QWORD PTR 16[rsp]	#,
	add	rsp, 56	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L90:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rax, 1125899906842623	# tmp161,
	and	rdx, rax	# _66, tmp161
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	edi, DWORD PTR [rdx]	#, _66->type
	test	edi, edi	#
	jne	.L69	#,
# src/natives/bstring.c:156:     if (argCount != 2 || !IS_ARRAY(args[0]) || !IS_STRING(args[1])) {
	mov	rsi, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_47(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rdi, rsi	# tmp213, _2
	not	rdi	# tmp213
	test	rdi, rcx	# tmp213, _49
	jne	.L69	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rsi, rax	# _2, tmp161
	mov	QWORD PTR 32[rsp], r12	#,
	.cfi_offset 12, -32
	mov	r12, rsi	# _70, _70
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rsi], 9	# _70->type,
	je	.L91	#,
	mov	r12, QWORD PTR 32[rsp]	#,
	.cfi_restore 12
	jmp	.L69	#
.L91:
	.cfi_offset 12, -32
# src/natives/bstring.c:165:     int length = delim->length * (array->size > 0 ? array->size - 1 : 0);
	mov	esi, DWORD PTR 16[rdx]	#, MEM[(struct ObjArray *)_66].size
# src/natives/bstring.c:165:     int length = delim->length * (array->size > 0 ? array->size - 1 : 0);
	mov	ecx, 1	# tmp212,
	mov	QWORD PTR 48[rsp], r15	#,
	mov	QWORD PTR 40[rsp], r14	#,
	test	esi, esi	# _7
	cmovg	ecx, esi	# _7,, _8
	sub	ecx, 1	# _9,
# src/natives/bstring.c:165:     int length = delim->length * (array->size > 0 ? array->size - 1 : 0);
	imul	ecx, DWORD PTR 16[r12]	# _9, MEM[(struct ObjString *)_70].length
	.cfi_offset 15, -16
	.cfi_offset 14, -24
	mov	r15d, ecx	# length, _9
# src/natives/bstring.c:166:     for (int i = 0; i < array->size; i++)
	test	esi, esi	# _7
	jle	.L92	#,
# src/natives/bstring.c:167:         length += AS_STRING(array->values[i])->length;
	mov	rdi, QWORD PTR 24[rdx]	# pretmp_113, MEM[(struct ObjArray *)_66].values
	mov	QWORD PTR 24[rsp], rbp	#,
	.cfi_offset 6, -40
	mov	rcx, rdi	# ivtmp.82, pretmp_113
# src/natives/bstring.c:167:         length += AS_STRING(array->values[i])->length;
	mov	rbp, rdi	# pretmp_113, pretmp_113
	lea	rdi, [rdi+rsi*8]	# _108,
	.p2align 5
	.p2align 4
	.p2align 3
.L73:
	mov	rsi, QWORD PTR [rcx]	# _15, MEM[(Value *)_112]
# src/natives/bstring.c:166:     for (int i = 0; i < array->size; i++)
	add	rcx, 8	# ivtmp.82,
# src/natives/bstring.c:167:         length += AS_STRING(array->values[i])->length;
	and	rsi, rax	# _15, tmp161
# src/natives/bstring.c:167:         length += AS_STRING(array->values[i])->length;
	mov	esi, DWORD PTR 16[rsi]	# tmp225, _16->length
	add	r15d, esi	# length, tmp225
# src/natives/bstring.c:166:     for (int i = 0; i < array->size; i++)
	cmp	rdi, rcx	# _108, ivtmp.82
	jne	.L73	#,
# src/natives/bstring.c:170:     char* res = calloc(length + 1, sizeof(char));
	lea	edi, 1[r15]	# _18,
# src/natives/bstring.c:170:     char* res = calloc(length + 1, sizeof(char));
	mov	esi, 1	#,
	mov	QWORD PTR [rsp], rdx	# %sfp, _66
	movsxd	rdi, edi	# _19, _18
	call	"calloc"@PLT	#
# src/natives/bstring.c:171:     if (res == NULL) {
	mov	rdx, QWORD PTR [rsp]	# _66, %sfp
	test	rax, rax	# res
# src/natives/bstring.c:170:     char* res = calloc(length + 1, sizeof(char));
	mov	r14, rax	# res, res
# src/natives/bstring.c:171:     if (res == NULL) {
	je	.L93	#,
	xor	ecx, ecx	# ivtmp.73
	jmp	.L74	#
	.p2align 4,,10
	.p2align 3
.L76:
# src/natives/bstring.c:176:     for (int i = 0; i < array->size; i++) {
	add	rcx, 1	# ivtmp.73,
	cmp	eax, ecx	# _31, ivtmp.73
	jle	.L89	#,
.L77:
# src/natives/bstring.c:177:         strcat(res, AS_CSTRING(array->values[i]));
	mov	rbp, QWORD PTR 24[rdx]	# pretmp_113, MEM[(struct ObjArray *)_66].values
.L74:
	mov	rdi, r14	#, res
	mov	QWORD PTR 8[rsp], rdx	# %sfp, _66
	mov	QWORD PTR [rsp], rcx	# %sfp, ivtmp.73
	call	"strlen"@PLT	#
	mov	rcx, QWORD PTR [rsp]	# ivtmp.73, %sfp
	movabs	rsi, 1125899906842623	# _28,
# src/natives/bstring.c:177:         strcat(res, AS_CSTRING(array->values[i]));
	lea	rdi, [r14+rax]	# _109,
# src/natives/bstring.c:177:         strcat(res, AS_CSTRING(array->values[i]));
	and	rsi, QWORD PTR 0[rbp+rcx*8]	# _28, *_26
# src/natives/bstring.c:177:         strcat(res, AS_CSTRING(array->values[i]));
	mov	rsi, QWORD PTR 24[rsi]	# _29->chars, _29->chars
	call	"stpcpy"@PLT	#
# src/natives/bstring.c:178:         if (i < array->size - 1) strcat(res, delim->chars);
	mov	rdx, QWORD PTR 8[rsp]	# _66, %sfp
# src/natives/bstring.c:178:         if (i < array->size - 1) strcat(res, delim->chars);
	mov	rcx, QWORD PTR [rsp]	# ivtmp.73, %sfp
# src/natives/bstring.c:177:         strcat(res, AS_CSTRING(array->values[i]));
	mov	rdi, rax	# tmp209,
# src/natives/bstring.c:178:         if (i < array->size - 1) strcat(res, delim->chars);
	mov	eax, DWORD PTR 16[rdx]	# _31, MEM[(struct ObjArray *)_66].size
# src/natives/bstring.c:178:         if (i < array->size - 1) strcat(res, delim->chars);
	lea	esi, -1[rax]	# _32,
# src/natives/bstring.c:178:         if (i < array->size - 1) strcat(res, delim->chars);
	cmp	esi, ecx	# _32, ivtmp.73
	jle	.L76	#,
# src/natives/bstring.c:178:         if (i < array->size - 1) strcat(res, delim->chars);
	mov	rsi, QWORD PTR 24[r12]	# MEM[(struct ObjString *)_70].chars, MEM[(struct ObjString *)_70].chars
	call	"strcpy"@PLT	#
# src/natives/bstring.c:176:     for (int i = 0; i < array->size; i++) {
	mov	rcx, QWORD PTR [rsp]	# ivtmp.73, %sfp
	mov	rdx, QWORD PTR 8[rsp]	# _66, %sfp
	add	rcx, 1	# ivtmp.73,
	cmp	DWORD PTR 16[rdx], ecx	# MEM[(struct ObjArray *)_66].size, ivtmp.73
	jg	.L77	#,
.L89:
	mov	rbp, QWORD PTR 24[rsp]	#,
	.cfi_restore 6
.L80:
# src/natives/bstring.c:181:     *result = OBJ_VAL(copyString(res, length));
	mov	esi, r15d	#, length
	mov	rdi, r14	#, res
	call	"copyString"@PLT	#
# src/natives/bstring.c:182:     free(res);
	mov	rdi, r14	#, res
# src/natives/bstring.c:181:     *result = OBJ_VAL(copyString(res, length));
	movabs	rdx, -1125899906842624	# tmp196,
	or	rax, rdx	# tmp197, tmp196
	mov	QWORD PTR [rbx], rax	# *result_54(D), tmp197
# src/natives/bstring.c:182:     free(res);
	call	"free"@PLT	#
# src/natives/bstring.c:183:     return true;
	mov	r12, QWORD PTR 32[rsp]	#,
	.cfi_remember_state
	.cfi_restore 12
	mov	r14, QWORD PTR 40[rsp]	#,
	.cfi_restore 14
	mov	eax, 1	# <retval>,
	mov	r15, QWORD PTR 48[rsp]	#,
	.cfi_restore 15
	jmp	.L68	#
.L92:
	.cfi_restore_state
# src/natives/bstring.c:170:     char* res = calloc(length + 1, sizeof(char));
	lea	edi, 1[rcx]	# _39,
# src/natives/bstring.c:170:     char* res = calloc(length + 1, sizeof(char));
	mov	esi, 1	#,
	movsxd	rdi, edi	# _38, _39
	call	"calloc"@PLT	#
	mov	r14, rax	# res, res
# src/natives/bstring.c:171:     if (res == NULL) {
	test	rax, rax	# res
	jne	.L80	#,
.L79:
# src/natives/bstring.c:172:         *result = OBJ_VAL(copyString("join() ran out of memory.", 25));
	mov	esi, 25	#,
	lea	rdi, .LC9[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:172:         *result = OBJ_VAL(copyString("join() ran out of memory.", 25));
	mov	edx, 16383	# tmp183,
	mov	r12, QWORD PTR 32[rsp]	#,
	.cfi_restore 12
	mov	r14, QWORD PTR 40[rsp]	#,
	.cfi_restore 14
	sal	rdx, 50	# tmp183,
	mov	r15, QWORD PTR 48[rsp]	#,
	.cfi_restore 15
	or	rax, rdx	# tmp184, tmp183
	mov	QWORD PTR [rbx], rax	# *result_54(D), tmp184
# src/natives/bstring.c:173:         return false;
	jmp	.L72	#
.L93:
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	mov	rbp, QWORD PTR 24[rsp]	#,
	.cfi_restore 6
	jmp	.L79	#
	.cfi_endproc
.LFE30:
	.size	"sJoinNative", .-"sJoinNative"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"find() expects two string arguments."
	.text
	.p2align 4
	.type	"sFindNative", @function
"sFindNative":
.LFB28:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdx	# result, result
	sub	rsp, 16	#,
	.cfi_def_cfa_offset 32
# src/natives/bstring.c:58:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L95	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp121,
# src/natives/bstring.c:58:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_12(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# _18, _1
	and	rcx, rdx	# _18, tmp121
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rdx	# _18, tmp121
	je	.L101	#,
.L95:
# src/natives/bstring.c:59:         *result = OBJ_VAL(copyString("find() expects two string arguments.", 36));
	mov	esi, 36	#,
	lea	rdi, .LC10[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:59:         *result = OBJ_VAL(copyString("find() expects two string arguments.", 36));
	movabs	rdx, -1125899906842624	# tmp130,
	or	rax, rdx	# _5, tmp130
# src/natives/bstring.c:60:         return false;
	xor	edx, edx	# <retval>
.L96:
# src/natives/bstring.c:59:         *result = OBJ_VAL(copyString("find() expects two string arguments.", 36));
	mov	QWORD PTR [rbx], rax	# *result_19(D), _5
# src/natives/bstring.c:76: }
	add	rsp, 16	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L101:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp123,
	and	rax, rdx	# _14, tmp123
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _14->type,
	jne	.L95	#,
# src/natives/bstring.c:58:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	mov	rsi, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_12(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rdi, rsi	# tmp139, _2
	not	rdi	# tmp139
	test	rdi, rcx	# tmp139, _18
	jne	.L95	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rsi, rdx	# _27, tmp123
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rsi], 9	# _27->type,
	jne	.L95	#,
# src/natives/bstring.c:64:     char* haystack = AS_CSTRING(args[0]);
	mov	rdx, QWORD PTR 24[rax]	# haystack, MEM[(struct ObjString *)_14].chars
# src/natives/bstring.c:67:     char* found = strstr(haystack, needle);
	mov	rsi, QWORD PTR 24[rsi]	# MEM[(struct ObjString *)_27].chars, MEM[(struct ObjString *)_27].chars
	mov	rdi, rdx	#, haystack
	mov	QWORD PTR 8[rsp], rdx	# %sfp, haystack
	call	"strstr"@PLT	#
# src/natives/bstring.c:69:     if (found == NULL) {
	test	rax, rax	# found
	je	.L102	#,
# src/natives/bstring.c:74:     *result = NUMBER_VAL(found - haystack);
	sub	rax, QWORD PTR 8[rsp]	# _6, %sfp
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	pxor	xmm0, xmm0	# tmp143
# src/natives/bstring.c:71:         return true;
	mov	edx, 1	# <retval>,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	cvtsi2sd	xmm0, rax	# tmp143, _6
	movq	rax, xmm0	# _5, tmp143
# src/natives/bstring.c:75:     return true;
	jmp	.L96	#
.L102:
# src/natives/bstring.c:69:     if (found == NULL) {
	movabs	rax, -4616189618054758400	# _5,
# src/natives/bstring.c:71:         return true;
	mov	edx, 1	# <retval>,
	jmp	.L96	#
	.cfi_endproc
.LFE28:
	.size	"sFindNative", .-"sFindNative"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"split() expects two string arguments"
	.align 8
.LC12:
	.string	"Cannot split by empty string in split()."
	.text
	.p2align 4
	.type	"sSplitNative", @function
"sSplitNative":
.LFB29:
	.cfi_startproc
	sub	rsp, 120	#,
	.cfi_def_cfa_offset 128
	mov	QWORD PTR 72[rsp], rbx	#,
	.cfi_offset 3, -56
	mov	rbx, rdx	# result, result
# src/natives/bstring.c:80:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	cmp	edi, 2	# argCount,
	jne	.L104	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp186,
# src/natives/bstring.c:80:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_88(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# _90, _1
	and	rcx, rdx	# _90, tmp186
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rdx	# _90, tmp186
	je	.L117	#,
.L104:
# src/natives/bstring.c:81:         *result = OBJ_VAL(copyString("split() expects two string arguments", 36));
	mov	esi, 36	#,
	lea	rdi, .LC11[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bstring.c:81:         *result = OBJ_VAL(copyString("split() expects two string arguments", 36));
	movabs	rdx, -1125899906842624	# tmp197,
	or	rax, rdx	# tmp198, tmp197
	mov	QWORD PTR [rbx], rax	# *result_129(D), tmp198
.L107:
# src/natives/bstring.c:82:         return false;
	xor	eax, eax	# <retval>
.L103:
# src/natives/bstring.c:152: }
	mov	rbx, QWORD PTR 72[rsp]	#,
	add	rsp, 120	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L117:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdi, 1125899906842623	# tmp188,
	and	rax, rdi	# _1, tmp188
	mov	rdx, rax	# _142, _1
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _142->type,
	jne	.L104	#,
# src/natives/bstring.c:80:     if (argCount != 2 || !IS_STRING(args[0]) || !IS_STRING(args[1])) {
	mov	rax, QWORD PTR 8[rsi]	# _2, MEM[(Value *)args_88(D) + 8B]
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	r8, rax	# _144, _2
	and	r8, rcx	# _144, _90
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	r8, rcx	# _144, _90
	jne	.L104	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	and	rax, rdi	# _146, tmp188
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _146->type,
	jne	.L104	#,
# src/natives/bstring.c:87:     char* needle   = AS_CSTRING(args[1]);
	mov	rax, QWORD PTR 24[rax]	# needle, MEM[(struct ObjString *)_146].chars
	mov	QWORD PTR 8[rsp], r8	# %sfp, _144
	mov	QWORD PTR [rsp], rdx	# %sfp, _142
# src/natives/bstring.c:88:     int   needleLen = strlen(needle);
	mov	rdi, rax	#, needle
# src/natives/bstring.c:87:     char* needle   = AS_CSTRING(args[1]);
	mov	QWORD PTR 24[rsp], rax	# %sfp, needle
# src/natives/bstring.c:88:     int   needleLen = strlen(needle);
	call	"strlen"@PLT	#
# src/natives/bstring.c:91:     if (needleLen == 0) {
	mov	rdx, QWORD PTR [rsp]	# _142, %sfp
	mov	r8, QWORD PTR 8[rsp]	# _144, %sfp
	test	eax, eax	#
	je	.L118	#,
	mov	QWORD PTR 104[rsp], r14	#,
	.cfi_offset 14, -24
# src/natives/bstring.c:86:     char* haystack = AS_CSTRING(args[0]);
	mov	r14, QWORD PTR 24[rdx]	# haystack, MEM[(struct ObjString *)_142].chars
	mov	QWORD PTR 80[rsp], rbp	#,
# src/natives/bstring.c:89:     char* end      = haystack + strlen(haystack);
	mov	rdi, r14	#, haystack
	mov	QWORD PTR 88[rsp], r12	#,
	mov	QWORD PTR 96[rsp], r13	#,
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
# src/natives/bstring.c:121:         haystack = found + needleLen;
	mov	r13d, 8	# newCapacity,
	mov	QWORD PTR 112[rsp], r15	#,
	.cfi_offset 15, -16
# src/natives/bstring.c:86:     char* haystack = AS_CSTRING(args[0]);
	mov	r15, r14	# haystack, haystack
	mov	QWORD PTR [rsp], rax	# %sfp,
# src/natives/bstring.c:89:     char* end      = haystack + strlen(haystack);
	call	"strlen"@PLT	#
# src/natives/bstring.c:98:     char**  array   = ALLOCATE(char*, capacity);
	mov	edx, 64	#,
	xor	esi, esi	#
	xor	edi, edi	#
# src/natives/bstring.c:89:     char* end      = haystack + strlen(haystack);
	add	rax, r14	# end, haystack
	mov	QWORD PTR 48[rsp], rax	# %sfp, end
# src/natives/bstring.c:98:     char**  array   = ALLOCATE(char*, capacity);
	call	"reallocate"@PLT	#
# src/natives/bstring.c:99:     int*    lengths = ALLOCATE(int,   capacity);
	mov	edx, 32	#,
	xor	esi, esi	#
	xor	edi, edi	#
# src/natives/bstring.c:98:     char**  array   = ALLOCATE(char*, capacity);
	mov	rbp, rax	# array, array
# src/natives/bstring.c:99:     int*    lengths = ALLOCATE(int,   capacity);
	call	"reallocate"@PLT	#
# src/natives/bstring.c:121:         haystack = found + needleLen;
	mov	QWORD PTR 56[rsp], rbx	# %sfp, result
	xor	ebx, ebx	# ivtmp.98
	mov	QWORD PTR 16[rsp], 8	# %sfp,
# src/natives/bstring.c:99:     int*    lengths = ALLOCATE(int,   capacity);
	mov	r12, rax	# lengths, lengths
# src/natives/bstring.c:121:         haystack = found + needleLen;
	movsxd	rax, DWORD PTR [rsp]	# _28, %sfp
	mov	QWORD PTR 32[rsp], rax	# %sfp, _28
	jmp	.L111	#
	.p2align 4,,10
	.p2align 3
.L110:
# src/natives/bstring.c:114:         char* sub = ALLOCATE(char, idx + 1);
	lea	edx, 1[r14]	# _19,
	xor	esi, esi	#
	xor	edi, edi	#
	mov	QWORD PTR 8[rsp], rcx	# %sfp, found
	movsxd	rdx, edx	# _20, _19
	call	"reallocate"@PLT	#
# src/natives/bstring.c:115:         memcpy(sub, haystack, idx);
	movsxd	rdx, r14d	# _21, _11
	mov	rsi, r15	#, haystack
# src/natives/bstring.c:114:         char* sub = ALLOCATE(char, idx + 1);
	mov	rdi, rax	# sub,
# src/natives/bstring.c:115:         memcpy(sub, haystack, idx);
	mov	QWORD PTR [rsp], rdx	# %sfp, _21
	call	"memcpy"@PLT	#
# src/natives/bstring.c:116:         sub[idx] = '\0';
	mov	rdx, QWORD PTR [rsp]	# _21, %sfp
# src/natives/bstring.c:121:         haystack = found + needleLen;
	mov	rcx, QWORD PTR 8[rsp]	# found, %sfp
# src/natives/bstring.c:116:         sub[idx] = '\0';
	mov	BYTE PTR [rax+rdx], 0	# *_22,
# src/natives/bstring.c:117:         array[count]   = sub;
	mov	QWORD PTR 0[rbp+rbx*8], rax	# *_25, sub
# src/natives/bstring.c:121:         haystack = found + needleLen;
	mov	rax, QWORD PTR 32[rsp]	# _28, %sfp
# src/natives/bstring.c:118:         lengths[count] = idx;
	mov	DWORD PTR [r12+rbx*4], r14d	# *_27, _11
# src/natives/bstring.c:101:     while (true) {
	add	rbx, 1	# ivtmp.98,
# src/natives/bstring.c:121:         haystack = found + needleLen;
	lea	r15, [rcx+rax]	# haystack,
.L111:
# src/natives/bstring.c:102:         char* found = strstr(haystack, needle);
	mov	rsi, QWORD PTR 24[rsp]	#, %sfp
	mov	rdi, r15	#, haystack
	call	"strstr"@PLT	#
# src/natives/bstring.c:107:         if (count + 1 >= capacity) {
	lea	r8d, 1[rbx]	# _205,
# src/natives/bstring.c:102:         char* found = strstr(haystack, needle);
	mov	rcx, rax	# found,
# src/natives/bstring.c:148:     FREE_ARRAY(char*,  array,   capacity);
	mov	rax, QWORD PTR 16[rsp]	# _206, %sfp
	lea	r9, 0[0+rax*8]	# prephitmp_192,
# src/natives/bstring.c:149:     FREE_ARRAY(int,    lengths, capacity);
	lea	r10, 0[0+rax*4]	# prephitmp_194,
# src/natives/bstring.c:103:         if (found == NULL) break;
	test	rcx, rcx	# found
	je	.L109	#,
# src/natives/bstring.c:105:         int idx = found - haystack;
	mov	rax, rcx	# _11, found
	sub	rax, r15	# _11, haystack
	mov	r14, rax	# _11, _11
# src/natives/bstring.c:107:         if (count + 1 >= capacity) {
	cmp	r13d, r8d	# newCapacity, _205
	jg	.L110	#,
# src/natives/bstring.c:108:             int newCapacity = GROW_CAPACITY(capacity);
	lea	eax, [r13+r13]	#,
# src/natives/bstring.c:109:             array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
	mov	rsi, r9	#, prephitmp_192
	mov	rdi, rbp	#, array
	mov	QWORD PTR 8[rsp], rcx	# %sfp, found
	lea	rdx, 0[0+rax*8]	# _14,
	mov	QWORD PTR 40[rsp], r10	# %sfp, prephitmp_194
# src/natives/bstring.c:108:             int newCapacity = GROW_CAPACITY(capacity);
	mov	r13d, eax	# newCapacity, newCapacity
# src/natives/bstring.c:109:             array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
	mov	QWORD PTR [rsp], r9	# %sfp, prephitmp_192
	mov	QWORD PTR 16[rsp], rax	# %sfp, _206
	call	"reallocate"@PLT	#
# src/natives/bstring.c:110:             lengths = GROW_ARRAY(int,   lengths, capacity, newCapacity);
	mov	rdx, QWORD PTR [rsp]	#, %sfp
	mov	rsi, QWORD PTR 40[rsp]	#, %sfp
	mov	rdi, r12	#, lengths
# src/natives/bstring.c:109:             array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
	mov	rbp, rax	# array, array
# src/natives/bstring.c:110:             lengths = GROW_ARRAY(int,   lengths, capacity, newCapacity);
	call	"reallocate"@PLT	#
	mov	rcx, QWORD PTR 8[rsp]	# found, %sfp
	mov	r12, rax	# lengths, lengths
	jmp	.L110	#
.L109:
# src/natives/bstring.c:124:     int remaining = end - haystack;
	mov	rax, QWORD PTR 48[rsp]	# end, %sfp
	mov	esi, r13d	# newCapacity, newCapacity
	mov	QWORD PTR [rsp], rbx	# %sfp, ivtmp.98
	mov	r13d, ebx	# count, ivtmp.98
	mov	rbx, QWORD PTR 56[rsp]	# result, %sfp
	sub	rax, r15	# end, haystack
	mov	r14, rax	# _29, end
# src/natives/bstring.c:125:     if (count + 1 >= capacity) {
	cmp	esi, r8d	# newCapacity, _205
	jle	.L119	#,
.L112:
# src/natives/bstring.c:131:     char* sub = ALLOCATE(char, remaining + 1);
	lea	edx, 1[r14]	# _37,
	xor	esi, esi	#
	xor	edi, edi	#
	mov	DWORD PTR 32[rsp], r8d	# %sfp, _205
	movsxd	rdx, edx	# _38, _37
	mov	QWORD PTR 24[rsp], r10	# %sfp, prephitmp_194
	mov	QWORD PTR 16[rsp], r9	# %sfp, prephitmp_192
	call	"reallocate"@PLT	#
# src/natives/bstring.c:132:     memcpy(sub, haystack, remaining);
	mov	rsi, r15	#, haystack
	movsxd	rdx, r14d	# _39, _29
	mov	rdi, rax	#,
	mov	QWORD PTR 8[rsp], rdx	# %sfp, _39
	call	"memcpy"@PLT	#
# src/natives/bstring.c:133:     sub[remaining] = '\0';
	mov	rdx, QWORD PTR 8[rsp]	# _39, %sfp
# src/natives/bstring.c:138:     ObjArray* arr = newArray(count);
	mov	edi, DWORD PTR 32[rsp]	#, %sfp
# src/natives/bstring.c:132:     memcpy(sub, haystack, remaining);
	mov	rcx, rax	# sub,
# src/natives/bstring.c:133:     sub[remaining] = '\0';
	mov	BYTE PTR [rax+rdx], 0	# *_40,
# src/natives/bstring.c:134:     array[count]   = sub;
	mov	eax, r13d	# _41, count
# src/natives/bstring.c:134:     array[count]   = sub;
	mov	QWORD PTR 0[rbp+rax*8], rcx	# *_43, sub
# src/natives/bstring.c:135:     lengths[count] = remaining;
	mov	DWORD PTR [r12+rax*4], r14d	# *_45, _29
# src/natives/bstring.c:138:     ObjArray* arr = newArray(count);
	call	"newArray"@PLT	#
# src/natives/bstring.c:139:     push(OBJ_VAL(arr));
	mov	rdi, rax	# _47, arr
# src/natives/bstring.c:138:     ObjArray* arr = newArray(count);
	mov	r13, rax	# arr, arr
# src/natives/bstring.c:139:     push(OBJ_VAL(arr));
	movabs	rax, -1125899906842624	# tmp306,
	or	rdi, rax	# _47, tmp306
# src/natives/bstring.c:139:     push(OBJ_VAL(arr));
	call	"push"@PLT	#
	mov	r9, QWORD PTR 16[rsp]	# prephitmp_192, %sfp
	mov	r10, QWORD PTR 24[rsp]	# prephitmp_194, %sfp
	mov	r8, r12	# ivtmp.94, lengths
	mov	rax, QWORD PTR [rsp]	# ivtmp.98, %sfp
	mov	QWORD PTR 24[rsp], rbx	# %sfp, result
	xor	ebx, ebx	# ivtmp.96
	mov	QWORD PTR 8[rsp], r9	# %sfp, prephitmp_192
	mov	QWORD PTR 16[rsp], r10	# %sfp, prephitmp_194
	lea	r15, 8[0+rax*8]	# _167,
	.p2align 4
	.p2align 3
.L113:
# src/natives/bstring.c:141:         arr->values[i] = OBJ_VAL(copyString(array[i], lengths[i]));
	mov	esi, DWORD PTR [r8]	# MEM[(int *)_172], MEM[(int *)_172]
	mov	rdi, QWORD PTR 0[rbp+rbx]	# MEM[(char * *)array_75 + ivtmp.96_174 * 1], MEM[(char * *)array_75 + ivtmp.96_174 * 1]
	mov	QWORD PTR [rsp], r8	# %sfp, ivtmp.94
	call	"copyString"@PLT	#
# src/natives/bstring.c:141:         arr->values[i] = OBJ_VAL(copyString(array[i], lengths[i]));
	mov	rdx, QWORD PTR 24[r13]	# arr_126->values, arr_126->values
# src/natives/bstring.c:142:         FREE_ARRAY(char, array[i], lengths[i] + 1);  // ← free after copyString is done with it
	mov	r8, QWORD PTR [rsp]	# ivtmp.94, %sfp
# src/natives/bstring.c:141:         arr->values[i] = OBJ_VAL(copyString(array[i], lengths[i]));
	movabs	rcx, -1125899906842624	# tmp311,
	or	rax, rcx	# tmp235, tmp311
# src/natives/bstring.c:142:         FREE_ARRAY(char, array[i], lengths[i] + 1);  // ← free after copyString is done with it
	mov	rdi, QWORD PTR 0[rbp+rbx]	# MEM[(char * *)array_75 + ivtmp.96_174 * 1], MEM[(char * *)array_75 + ivtmp.96_174 * 1]
# src/natives/bstring.c:141:         arr->values[i] = OBJ_VAL(copyString(array[i], lengths[i]));
	mov	QWORD PTR [rdx+rbx], rax	# *_58, tmp235
# src/natives/bstring.c:142:         FREE_ARRAY(char, array[i], lengths[i] + 1);  // ← free after copyString is done with it
	mov	eax, DWORD PTR [r8]	# tmp312, MEM[(int *)_172]
	xor	edx, edx	#
# src/natives/bstring.c:140:     for (int i = 0; i < count; i++) {
	add	rbx, 8	# ivtmp.96,
# src/natives/bstring.c:142:         FREE_ARRAY(char, array[i], lengths[i] + 1);  // ← free after copyString is done with it
	lea	esi, 1[rax]	# _61,
	movsxd	rsi, esi	# _62, _61
	call	"reallocate"@PLT	#
# src/natives/bstring.c:140:     for (int i = 0; i < count; i++) {
	mov	r8, QWORD PTR [rsp]	# ivtmp.94, %sfp
	add	r8, 4	# ivtmp.94,
	cmp	r15, rbx	# _167, ivtmp.96
	jne	.L113	#,
# src/natives/bstring.c:145:     *result = peek(0);
	mov	r10, QWORD PTR 16[rsp]	# prephitmp_194, %sfp
	xor	edi, edi	#
	mov	rbx, QWORD PTR 24[rsp]	# result, %sfp
	mov	QWORD PTR [rsp], r10	# %sfp, prephitmp_194
	call	"peek"@PLT	#
# src/natives/bstring.c:145:     *result = peek(0);
	mov	QWORD PTR [rbx], rax	# *result_129(D), _64
# src/natives/bstring.c:146:     pop();
	call	"pop"@PLT	#
# src/natives/bstring.c:148:     FREE_ARRAY(char*,  array,   capacity);
	mov	rsi, QWORD PTR 8[rsp]	#, %sfp
	mov	rdi, rbp	#, array
	xor	edx, edx	#
	call	"reallocate"@PLT	#
# src/natives/bstring.c:149:     FREE_ARRAY(int,    lengths, capacity);
	mov	rsi, QWORD PTR [rsp]	#, %sfp
	mov	rdi, r12	#, lengths
	xor	edx, edx	#
	call	"reallocate"@PLT	#
# src/natives/bstring.c:151:     return true;
	mov	rbp, QWORD PTR 80[rsp]	#,
	.cfi_restore 6
	mov	r12, QWORD PTR 88[rsp]	#,
	.cfi_restore 12
	mov	eax, 1	# <retval>,
	mov	r13, QWORD PTR 96[rsp]	#,
	.cfi_restore 13
	mov	r14, QWORD PTR 104[rsp]	#,
	.cfi_restore 14
	mov	r15, QWORD PTR 112[rsp]	#,
	.cfi_restore 15
	jmp	.L103	#
.L118:
# src/natives/bstring.c:92:         *result = OBJ_VAL(copyString("Cannot split by empty string in split().", 40));
	mov	esi, 40	#,
	lea	rdi, .LC12[rip]	#,
	mov	QWORD PTR [rsp], r8	# %sfp, _144
	call	"copyString"@PLT	#
# src/natives/bstring.c:92:         *result = OBJ_VAL(copyString("Cannot split by empty string in split().", 40));
	or	rax, QWORD PTR [rsp]	# tmp201, %sfp
	mov	QWORD PTR [rbx], rax	# *result_129(D), tmp201
# src/natives/bstring.c:93:         return false;
	jmp	.L107	#
.L119:
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# src/natives/bstring.c:127:         array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
	lea	ecx, [rsi+rsi]	# _31,
	mov	rdi, rbp	#, array
	mov	rsi, r9	#, prephitmp_192
	mov	DWORD PTR 32[rsp], r8d	# %sfp, _205
	sal	rcx, 3	# _32,
	mov	QWORD PTR 24[rsp], r10	# %sfp, prephitmp_194
	mov	rdx, rcx	#, _32
	mov	QWORD PTR 8[rsp], r9	# %sfp, prephitmp_192
	mov	QWORD PTR 16[rsp], rcx	# %sfp, _32
	call	"reallocate"@PLT	#
# src/natives/bstring.c:128:         lengths = GROW_ARRAY(int,   lengths, capacity, newCapacity);
	mov	rdx, QWORD PTR 8[rsp]	#, %sfp
	mov	rsi, QWORD PTR 24[rsp]	#, %sfp
	mov	rdi, r12	#, lengths
# src/natives/bstring.c:127:         array   = GROW_ARRAY(char*, array,   capacity, newCapacity);
	mov	rbp, rax	# array, array
# src/natives/bstring.c:128:         lengths = GROW_ARRAY(int,   lengths, capacity, newCapacity);
	call	"reallocate"@PLT	#
	mov	r10, QWORD PTR 8[rsp]	# prephitmp_194, %sfp
	mov	r9, QWORD PTR 16[rsp]	# prephitmp_192, %sfp
	mov	r8d, DWORD PTR 32[rsp]	# _205, %sfp
	mov	r12, rax	# lengths, lengths
	jmp	.L112	#
	.cfi_endproc
.LFE29:
	.size	"sSplitNative", .-"sSplitNative"
	.section	.rodata.str1.1
.LC13:
	.string	"len"
.LC14:
	.string	"substr"
.LC15:
	.string	"find"
.LC16:
	.string	"split"
.LC17:
	.string	"join"
.LC18:
	.string	"trim"
.LC19:
	.string	"upper"
.LC20:
	.string	"lower"
	.text
	.p2align 4
	.globl	"buildStringModule"
	.type	"buildStringModule", @function
"buildStringModule":
.LFB35:
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
# src/natives/bstring.c:280:     push(OBJ_VAL(module));
	movabs	rbx, -1125899906842624	# tmp135,
# src/natives/bstring.c:278: ObjModule* buildStringModule() {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 48
# src/natives/bstring.c:279:     ObjModule* module = newModule();
	call	"newModule"@PLT	#
# src/natives/bstring.c:280:     push(OBJ_VAL(module));
	mov	rdi, rax	# _2, <retval>
# src/natives/bstring.c:279:     ObjModule* module = newModule();
	mov	r12, rax	# <retval>,
# src/natives/bstring.c:280:     push(OBJ_VAL(module));
	or	rdi, rbx	# _2, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rbp, 16[r12]	# _55,
# src/natives/bstring.c:280:     push(OBJ_VAL(module));
	call	"push"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sLengthNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 3	#,
	lea	rdi, .LC13[rip]	#,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _51,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _51, _51
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdi, rbp	#, _55
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbx	# _51, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _54
	call	"tableSet"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sSubstrNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 6	#,
	lea	rdi, .LC14[rip]	#,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _46,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _46, _46
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdi, rbp	#, _55
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbx	# _46, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _49
	call	"tableSet"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sFindNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC15[rip]	#,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _41,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _41, _41
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdi, rbp	#, _55
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbx	# _41, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _44
	call	"tableSet"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sSplitNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 5	#,
	lea	rdi, .LC16[rip]	#,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _36,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _36, _36
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdi, rbp	#, _55
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbx	# _36, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _39
	call	"tableSet"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sJoinNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC17[rip]	#,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _31,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _31, _31
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdi, rbp	#, _55
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbx	# _31, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _34
	call	"tableSet"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sTrimNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 4	#,
	lea	rdi, .LC18[rip]	#,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _26,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _26, _26
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdi, rbp	#, _55
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbx	# _26, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _29
	call	"tableSet"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sUpperNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 5	#,
	lea	rdi, .LC19[rip]	#,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _21,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _21, _21
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdi, rbp	#, _55
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbx	# _21, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _24
	call	"tableSet"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	lea	rdi, "sLowerNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	esi, 5	#,
	lea	rdi, .LC20[rip]	#,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	r13, rax	# _16,
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	call	"copyString"@PLT	#
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdx, r13	# _16, _16
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rdi, rbp	#, _55
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	or	rdx, rbx	# _16, tmp135
# src/natives/bstring.c:275:     tableSet(&module->table, copyString(name, length), OBJ_VAL(newNative(fn)));
	mov	rsi, rax	#, _19
	call	"tableSet"@PLT	#
# src/natives/bstring.c:291:     pop();
	call	"pop"@PLT	#
# src/natives/bstring.c:293: }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 40
	mov	rax, r12	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE35:
	.size	"buildStringModule", .-"buildStringModule"
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
