	.file	"bcast.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"?"
.LC1:
	.string	"null"
.LC2:
	.string	"true"
.LC3:
	.string	"false"
.LC4:
	.string	"%g"
.LC5:
	.string	"{ }"
.LC6:
	.string	"%s"
.LC7:
	.string	", "
.LC8:
	.string	" }"
.LC9:
	.string	"<Class %s>"
.LC10:
	.string	"<Closure %s>"
.LC11:
	.string	"<Function %s>"
.LC12:
	.string	"<Instance of %s>"
.LC13:
	.string	"<Module>"
.LC14:
	.string	"<Native>"
.LC15:
	.string	"<Upvalue>"
.LC16:
	.string	"<Resource>"
.LC17:
	.string	"<unknown>"
	.text
	.p2align 4
	.type	"toString", @function
"toString":
.LFB29:
	.cfi_startproc
	sub	rsp, 312	#,
	.cfi_def_cfa_offset 320
# src/natives/bcast.c:87:     if (IS_NULL(arg)) {
	mov	rax, QWORD PTR fs:40	# tmp191, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 280[rsp], rax	# D.6702, tmp191
	movabs	rax, 9222246136947933185	# tmp191,
	cmp	rdi, rax	# arg, tmp191
	je	.L38	#,
# src/natives/bcast.c:89:     } else if (IS_BOOL(arg)) {
	movabs	rdx, 9222246136947933187	# tmp195,
# src/natives/bcast.c:89:     } else if (IS_BOOL(arg)) {
	mov	rax, rdi	# _3, arg
	or	rax, 1	# _3,
# src/natives/bcast.c:89:     } else if (IS_BOOL(arg)) {
	cmp	rax, rdx	# _3, tmp195
	je	.L39	#,
# src/natives/bcast.c:93:     } else if (IS_NUMBER(arg)) {
	movabs	rdx, 9222246136947933184	# tmp202,
	mov	rax, rdi	# tmp315, arg
	not	rax	# tmp315
	test	rax, rdx	# tmp315, tmp202
	jne	.L40	#,
# src/natives/bcast.c:97:     } else if (IS_OBJ(arg)) {
	movabs	rdx, -1125899906842624	# tmp210,
	mov	rax, rdi	# tmp314, arg
	not	rax	# tmp314
	test	rax, rdx	# tmp314, tmp210
	jne	.L7	#,
# src/natives/bcast.c:98:         switch (AS_OBJ(arg)->type) {
	movabs	r8, 1125899906842623	# tmp212,
	and	r8, rdi	# _13, arg
# src/natives/bcast.c:98:         switch (AS_OBJ(arg)->type) {
	cmp	DWORD PTR [r8], 10	# _13->type,
	ja	.L7	#,
	mov	eax, DWORD PTR [r8]	# _13->type, _13->type
	lea	rdx, .L9[rip]	# tmp214,
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp216,
	add	rax, rdx	# tmp217, tmp214
	jmp	rax	# tmp217
	.section	.rodata
	.align 4
	.align 4
.L9:
	.long	.L17-.L9
	.long	.L7-.L9
	.long	.L16-.L9
	.long	.L15-.L9
	.long	.L14-.L9
	.long	.L13-.L9
	.long	.L12-.L9
	.long	.L11-.L9
	.long	.L10-.L9
	.long	.L26-.L9
	.long	.L8-.L9
	.text
	.p2align 4,,10
	.p2align 3
.L40:
# src/natives/bcast.c:95:         int length = snprintf(str, sizeof(str), "%g", AS_NUMBER(arg));
	movq	xmm0, rdi	# arg, arg
	mov	esi, 256	#,
	lea	rdi, 16[rsp]	#,
	mov	eax, 1	#,
	lea	rdx, .LC4[rip]	#,
	call	"snprintf"@PLT	#
.L35:
# src/natives/bcast.c:135:                 return OBJ_VAL(copyString(buf, len));
	mov	esi, eax	#, len
	lea	rdi, 16[rsp]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:135:                 return OBJ_VAL(copyString(buf, len));
	movabs	rdx, -1125899906842624	# tmp256,
	or	rax, rdx	# <retval>, tmp256
.L1:
# src/natives/bcast.c:166: }
	mov	rdx, QWORD PTR 280[rsp]	# tmp316, D.6702
	sub	rdx, QWORD PTR fs:40	# tmp316, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L41	#,
	add	rsp, 312	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
# src/natives/bcast.c:165:     return OBJ_VAL(copyString("<unknown>", 9));
	mov	esi, 9	#,
	lea	rdi, .LC17[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:165:     return OBJ_VAL(copyString("<unknown>", 9));
	movabs	rdx, -1125899906842624	# tmp282,
	or	rax, rdx	# <retval>, tmp282
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L39:
# src/natives/bcast.c:92:             : OBJ_VAL(copyString("false", 5));
	cmp	rdi, rax	# arg, _3
	je	.L42	#,
# src/natives/bcast.c:92:             : OBJ_VAL(copyString("false", 5));
	mov	esi, 5	#,
	lea	rdi, .LC3[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:92:             : OBJ_VAL(copyString("false", 5));
	movabs	rdx, -1125899906842624	# tmp200,
	or	rax, rdx	# <retval>, tmp200
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L38:
# src/natives/bcast.c:88:         return OBJ_VAL(copyString("null", 4));
	mov	esi, 4	#,
	lea	rdi, .LC1[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:88:         return OBJ_VAL(copyString("null", 4));
	movabs	rdx, -1125899906842624	# tmp193,
	or	rax, rdx	# <retval>, tmp193
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L42:
# src/natives/bcast.c:91:             ? OBJ_VAL(copyString("true", 4))
	mov	esi, 4	#,
	lea	rdi, .LC2[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:92:             : OBJ_VAL(copyString("false", 5));
	movabs	rdx, -1125899906842624	# tmp198,
	or	rax, rdx	# <retval>, tmp198
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L26:
# src/natives/bcast.c:98:         switch (AS_OBJ(arg)->type) {
	mov	rax, rdi	# <retval>, arg
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L8:
# src/natives/bcast.c:161:             case OBJ_UPVALUE: return OBJ_VAL(copyString("<Upvalue>", 9));
	mov	esi, 9	#,
	lea	rdi, .LC15[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:161:             case OBJ_UPVALUE: return OBJ_VAL(copyString("<Upvalue>", 9));
	movabs	rdx, -1125899906842624	# tmp278,
	or	rax, rdx	# <retval>, tmp278
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L17:
# src/natives/bcast.c:101:                 if (array->size == 0)
	mov	esi, DWORD PTR 16[r8]	#, MEM[(struct ObjArray *)_13].size
	test	esi, esi	#
	jne	.L18	#,
# src/natives/bcast.c:102:                     return OBJ_VAL(copyString("{ }", 3));
	mov	esi, 3	#,
	lea	rdi, .LC5[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:102:                     return OBJ_VAL(copyString("{ }", 3));
	movabs	rdx, -1125899906842624	# tmp220,
	or	rax, rdx	# <retval>, tmp220
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L16:
# src/natives/bcast.c:133:                 int len = snprintf(buf, sizeof(buf), "<Class %s>",
	mov	rax, QWORD PTR 16[r8]	# MEM[(struct ObjClass *)_13].name, MEM[(struct ObjClass *)_13].name
	lea	rdx, .LC9[rip]	#,
	mov	rcx, QWORD PTR 24[rax]	# _44->chars, _44->chars
.L36:
	mov	esi, 256	#,
	lea	rdi, 16[rsp]	#,
	xor	eax, eax	#
	call	"snprintf"@PLT	#
	jmp	.L35	#
	.p2align 4,,10
	.p2align 3
.L13:
# src/natives/bcast.c:152:                 ObjString* name = AS_INSTANCE(arg)->class_->name;
	mov	rax, QWORD PTR 16[r8]	# MEM[(struct ObjInstance *)_13].class_, MEM[(struct ObjInstance *)_13].class_
# src/natives/bcast.c:154:                 int len = snprintf(buf, sizeof(buf), "<Instance of %s>",
	lea	rdx, .LC12[rip]	#,
	mov	rax, QWORD PTR 16[rax]	# _53->name, _53->name
	mov	rcx, QWORD PTR 24[rax]	# name_88->chars, name_88->chars
	jmp	.L36	#
	.p2align 4,,10
	.p2align 3
.L12:
# src/natives/bcast.c:158:             case OBJ_MODULE: return OBJ_VAL(copyString("<Module>", 8));
	mov	esi, 8	#,
	lea	rdi, .LC13[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:158:             case OBJ_MODULE: return OBJ_VAL(copyString("<Module>", 8));
	movabs	rdx, -1125899906842624	# tmp274,
	or	rax, rdx	# <retval>, tmp274
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L11:
# src/natives/bcast.c:159:             case OBJ_NATIVE: return OBJ_VAL(copyString("<Native>", 8));
	mov	esi, 8	#,
	lea	rdi, .LC14[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:159:             case OBJ_NATIVE: return OBJ_VAL(copyString("<Native>", 8));
	movabs	rdx, -1125899906842624	# tmp276,
	or	rax, rdx	# <retval>, tmp276
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L10:
# src/natives/bcast.c:162:             case OBJ_RESOURCE: return OBJ_VAL(copyString("<Resource>", 10));
	mov	esi, 10	#,
	lea	rdi, .LC16[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:162:             case OBJ_RESOURCE: return OBJ_VAL(copyString("<Resource>", 10));
	movabs	rdx, -1125899906842624	# tmp280,
	or	rax, rdx	# <retval>, tmp280
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L15:
# src/natives/bcast.c:138:                 ObjString* name = AS_CLOSURE(arg)->function->name;
	mov	rax, QWORD PTR 16[r8]	# MEM[(struct ObjClosure *)_13].function, MEM[(struct ObjClosure *)_13].function
# src/natives/bcast.c:140:                 int len = snprintf(buf, sizeof(buf), "<Closure %s>",
	lea	rcx, .LC0[rip]	# iftmp.1_72,
# src/natives/bcast.c:138:                 ObjString* name = AS_CLOSURE(arg)->function->name;
	mov	rax, QWORD PTR 72[rax]	# name, _48->name
# src/natives/bcast.c:140:                 int len = snprintf(buf, sizeof(buf), "<Closure %s>",
	test	rax, rax	# name
	je	.L23	#,
# src/natives/bcast.c:140:                 int len = snprintf(buf, sizeof(buf), "<Closure %s>",
	mov	rcx, QWORD PTR 24[rax]	# iftmp.1_72, name_101->chars
.L23:
# src/natives/bcast.c:140:                 int len = snprintf(buf, sizeof(buf), "<Closure %s>",
	lea	rdx, .LC10[rip]	#,
	jmp	.L36	#
	.p2align 4,,10
	.p2align 3
.L14:
# src/natives/bcast.c:145:                 ObjString* name = AS_FUNCTION(arg)->name;
	mov	rax, QWORD PTR 72[r8]	# name, MEM[(struct ObjFunction *)_13].name
# src/natives/bcast.c:147:                 int len = snprintf(buf, sizeof(buf), "<Function %s>",
	lea	rcx, .LC0[rip]	# iftmp.2_73,
# src/natives/bcast.c:147:                 int len = snprintf(buf, sizeof(buf), "<Function %s>",
	test	rax, rax	# name
	je	.L24	#,
# src/natives/bcast.c:147:                 int len = snprintf(buf, sizeof(buf), "<Function %s>",
	mov	rcx, QWORD PTR 24[rax]	# iftmp.2_73, name_94->chars
.L24:
# src/natives/bcast.c:147:                 int len = snprintf(buf, sizeof(buf), "<Function %s>",
	lea	rdx, .LC11[rip]	#,
	jmp	.L36	#
	.p2align 4,,10
	.p2align 3
.L18:
	mov	QWORD PTR [rsp], r8	# %sfp, _13
	mov	QWORD PTR 304[rsp], r15	#,
	.cfi_offset 15, -16
# src/natives/bcast.c:105:                 push(arg);
	call	"push"@PLT	#
# src/natives/bcast.c:107:                 char* result = malloc(32768);
	mov	edi, 32768	#,
	call	"malloc"@PLT	#
# src/natives/bcast.c:111:                 for (int i = 0; i < array->size; i++) {
	mov	r8, QWORD PTR [rsp]	# _13, %sfp
# src/natives/bcast.c:109:                 length += snprintf(result + length, 32768 - length, "{ ");
	mov	edx, 8315	#,
	mov	WORD PTR [rax], dx	# MEM <char[1:3]> [(void *)result_115],
# src/natives/bcast.c:107:                 char* result = malloc(32768);
	mov	r15, rax	# result, result
# src/natives/bcast.c:111:                 for (int i = 0; i < array->size; i++) {
	mov	ecx, DWORD PTR 16[r8]	#, MEM[(struct ObjArray *)_13].size
# src/natives/bcast.c:109:                 length += snprintf(result + length, 32768 - length, "{ ");
	mov	BYTE PTR 2[rax], 0	# MEM <char[1:3]> [(void *)result_115],
# src/natives/bcast.c:111:                 for (int i = 0; i < array->size; i++) {
	test	ecx, ecx	#
	jle	.L27	#,
	mov	QWORD PTR 288[rsp], rbx	#,
# src/natives/bcast.c:109:                 length += snprintf(result + length, 32768 - length, "{ ");
	mov	r9d, 2	# length,
	mov	QWORD PTR 296[rsp], r14	#,
	.cfi_offset 3, -32
	.cfi_offset 14, -24
# src/natives/bcast.c:111:                 for (int i = 0; i < array->size; i++) {
	xor	r14d, r14d	# ivtmp.18
.L22:
# src/natives/bcast.c:113:                     ObjArray* arr = AS_ARRAY(peek(0));
	movabs	rbx, 1125899906842623	# tmp325,
# src/natives/bcast.c:113:                     ObjArray* arr = AS_ARRAY(peek(0));
	xor	edi, edi	#
	mov	DWORD PTR [rsp], r9d	# %sfp, length
	mov	QWORD PTR 8[rsp], r8	# %sfp, _13
	call	"peek"@PLT	#
# src/natives/bcast.c:113:                     ObjArray* arr = AS_ARRAY(peek(0));
	and	rax, rbx	# _19, tmp325
# src/natives/bcast.c:114:                     Value elem = toString(arr->values[i]);
	mov	rax, QWORD PTR 24[rax]	# arr_119->values, arr_119->values
	mov	rdi, QWORD PTR [rax+r14*8]	# *_23, *_23
	call	"toString"	#
# src/natives/bcast.c:116:                     length += snprintf(result + length, 32768 - length,
	movsxd	rdi, DWORD PTR [rsp]	#, %sfp
	mov	esi, 32768	# _28,
	lea	rdx, .LC6[rip]	#,
# src/natives/bcast.c:115:                     ObjString* s = AS_STRING(elem);
	and	rax, rbx	# _25, tmp327
# src/natives/bcast.c:116:                     length += snprintf(result + length, 32768 - length,
	mov	rcx, QWORD PTR 24[rax]	# s_122->chars, s_122->chars
	sub	esi, edi	# _28, length
	xor	eax, eax	#
# src/natives/bcast.c:116:                     length += snprintf(result + length, 32768 - length,
	add	rdi, r15	# _30, result
# src/natives/bcast.c:116:                     length += snprintf(result + length, 32768 - length,
	call	"snprintf"@PLT	#
# src/natives/bcast.c:116:                     length += snprintf(result + length, 32768 - length,
	mov	r9d, DWORD PTR [rsp]	# length, %sfp
# src/natives/bcast.c:118:                     if (i < array->size - 1)
	mov	r8, QWORD PTR 8[rsp]	# _13, %sfp
# src/natives/bcast.c:116:                     length += snprintf(result + length, 32768 - length,
	add	r9d, eax	# length, _124
# src/natives/bcast.c:118:                     if (i < array->size - 1)
	mov	eax, DWORD PTR 16[r8]	# tmp330, MEM[(struct ObjArray *)_13].size
	sub	eax, 1	# _32,
# src/natives/bcast.c:118:                     if (i < array->size - 1)
	cmp	eax, r14d	# _32, ivtmp.18
	jg	.L43	#,
.L20:
# src/natives/bcast.c:120:                     if (length >= 32767) break;
	cmp	r9d, 32766	# length,
	jg	.L34	#,
# src/natives/bcast.c:111:                 for (int i = 0; i < array->size; i++) {
	lea	rax, 1[r14]	# ivtmp.18,
	mov	r14, rax	# ivtmp.18, ivtmp.18
	cmp	DWORD PTR 16[r8], eax	# MEM[(struct ObjArray *)_13].size, tmp335
	jg	.L22	#,
.L34:
	mov	rbx, QWORD PTR 288[rsp]	#,
	.cfi_restore 3
	mov	r14, QWORD PTR 296[rsp]	#,
	.cfi_restore 14
.L19:
# src/natives/bcast.c:123:                 length += snprintf(result + length, 32768 - length, " }");
	mov	esi, 32768	# tmp246,
# src/natives/bcast.c:123:                 length += snprintf(result + length, 32768 - length, " }");
	movsxd	rdi, r9d	# _40, length
	xor	eax, eax	#
	mov	DWORD PTR [rsp], r9d	# %sfp, length
# src/natives/bcast.c:123:                 length += snprintf(result + length, 32768 - length, " }");
	sub	esi, r9d	# _38, length
# src/natives/bcast.c:123:                 length += snprintf(result + length, 32768 - length, " }");
	add	rdi, r15	# _41, result
# src/natives/bcast.c:123:                 length += snprintf(result + length, 32768 - length, " }");
	lea	rdx, .LC8[rip]	#,
	movsxd	rsi, esi	# _39, _38
	call	"snprintf"@PLT	#
# src/natives/bcast.c:123:                 length += snprintf(result + length, 32768 - length, " }");
	mov	r9d, DWORD PTR [rsp]	# length, %sfp
	lea	esi, [r9+rax]	# length,
	mov	DWORD PTR [rsp], esi	# %sfp, length
# src/natives/bcast.c:124:                 pop(); // unroot array
	call	"pop"@PLT	#
# src/natives/bcast.c:126:                 Value res = OBJ_VAL(copyString(result, length));
	mov	esi, DWORD PTR [rsp]	# length, %sfp
	mov	rdi, r15	#, result
	call	"copyString"@PLT	#
# src/natives/bcast.c:127:                 free(result);
	mov	rdi, r15	#, result
# src/natives/bcast.c:126:                 Value res = OBJ_VAL(copyString(result, length));
	movabs	rdx, -1125899906842624	# tmp250,
	or	rax, rdx	# <retval>, tmp250
	mov	QWORD PTR [rsp], rax	# %sfp, <retval>
# src/natives/bcast.c:127:                 free(result);
	call	"free"@PLT	#
# src/natives/bcast.c:128:                 return res;
	mov	rax, QWORD PTR [rsp]	# <retval>, %sfp
	mov	r15, QWORD PTR 304[rsp]	#,
	.cfi_restore 15
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_offset 3, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# src/natives/bcast.c:119:                         length += snprintf(result + length, 32768 - length, ", ");
	mov	esi, 32768	# _163,
# src/natives/bcast.c:119:                         length += snprintf(result + length, 32768 - length, ", ");
	movsxd	rdi, r9d	# _165, length
	xor	eax, eax	#
	mov	DWORD PTR [rsp], r9d	# %sfp, length
# src/natives/bcast.c:119:                         length += snprintf(result + length, 32768 - length, ", ");
	sub	esi, r9d	# _163, length
# src/natives/bcast.c:123:                 length += snprintf(result + length, 32768 - length, " }");
	add	rdi, r15	# _166, result
# src/natives/bcast.c:119:                         length += snprintf(result + length, 32768 - length, ", ");
	lea	rdx, .LC7[rip]	#,
# src/natives/bcast.c:123:                 length += snprintf(result + length, 32768 - length, " }");
	movsxd	rsi, esi	# _164, _163
# src/natives/bcast.c:119:                         length += snprintf(result + length, 32768 - length, ", ");
	call	"snprintf"@PLT	#
# src/natives/bcast.c:119:                         length += snprintf(result + length, 32768 - length, ", ");
	mov	r9d, DWORD PTR [rsp]	# length, %sfp
	mov	r8, QWORD PTR 8[rsp]	# _13, %sfp
	add	r9d, eax	# length, _127
	jmp	.L20	#
.L27:
	.cfi_restore 3
	.cfi_restore 14
# src/natives/bcast.c:109:                 length += snprintf(result + length, 32768 - length, "{ ");
	mov	r9d, 2	# length,
	jmp	.L19	#
.L41:
	.cfi_restore 15
	mov	QWORD PTR 288[rsp], rbx	#,
	mov	QWORD PTR 296[rsp], r14	#,
	mov	QWORD PTR 304[rsp], r15	#,
	.cfi_offset 3, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# src/natives/bcast.c:166: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE29:
	.size	"toString", .-"toString"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC18:
	.string	"toString() expects one argument."
	.text
	.p2align 4
	.type	"toStringNative", @function
"toStringNative":
.LFB30:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bcast.c:168: static bool toStringNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bcast.c:170:     if (argCount != 1) {
	cmp	edi, 1	# argCount,
	je	.L45	#,
# src/natives/bcast.c:171:         *result = OBJ_VAL(copyString("toString() expects one argument.", 32));
	mov	esi, 32	#,
	lea	rdi, .LC18[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:171:         *result = OBJ_VAL(copyString("toString() expects one argument.", 32));
	movabs	rdx, -1125899906842624	# tmp107,
	or	rax, rdx	# _3, tmp107
# src/natives/bcast.c:172:         return false;
	xor	edx, edx	# <retval>
	mov	QWORD PTR [rbx], rax	# *result_12(D), _3
# src/natives/bcast.c:178: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore_state
# src/natives/bcast.c:176:     *result = toString(args[0]);
	mov	rdi, QWORD PTR [rsi]	# *args_10(D), *args_10(D)
	call	"toString"	#
# src/natives/bcast.c:177:     return true;
	mov	edx, 1	# <retval>,
	mov	QWORD PTR [rbx], rax	# *result_12(D), _3
# src/natives/bcast.c:178: }
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE30:
	.size	"toStringNative", .-"toStringNative"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"ntos() expects one number argument."
	.section	.rodata.str1.1
.LC20:
	.string	"%.4lf"
.LC21:
	.string	"Internal failure"
.LC24:
	.string	"%ld"
	.text
	.p2align 4
	.type	"ntosNative", @function
"ntosNative":
.LFB26:
	.cfi_startproc
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 24[rsp], rbp	#,
	.cfi_offset 6, -24
	mov	rbp, rdx	# result, result
# src/natives/bcast.c:10:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L49	#,
# src/natives/bcast.c:10:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	movabs	rdx, 9222246136947933184	# tmp124,
# src/natives/bcast.c:10:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_24(D)
# src/natives/bcast.c:10:     if (argCount != 1 || !IS_NUMBER(args[0])) {
	mov	rcx, rax	# tmp156, _1
	not	rcx	# tmp156
	test	rcx, rdx	# tmp156, tmp124
	je	.L49	#,
	movq	xmm0, rax	# _25, _1
	mov	QWORD PTR 8[rsp], rax	# %sfp, _25
# src/natives/bcast.c:17:     int size = snprintf(NULL, 0, "%.4lf", val);
	xor	esi, esi	#
	xor	edi, edi	#
	lea	rdx, .LC20[rip]	#,
	mov	eax, 1	#,
	mov	QWORD PTR 16[rsp], rbx	#,
	mov	QWORD PTR 32[rsp], r14	#,
	.cfi_offset 3, -32
	.cfi_offset 14, -16
# src/natives/bcast.c:17:     int size = snprintf(NULL, 0, "%.4lf", val);
	call	"snprintf"@PLT	#
# src/natives/bcast.c:18:     char* str = malloc(sizeof(char) * size + 1);
	lea	edi, 1[rax]	#,
# src/natives/bcast.c:18:     char* str = malloc(sizeof(char) * size + 1);
	lea	r14d, 1[rax]	# _7,
# src/natives/bcast.c:18:     char* str = malloc(sizeof(char) * size + 1);
	call	"malloc"@PLT	#
	mov	rbx, rax	# str,
# src/natives/bcast.c:20:     if (str == NULL) {
	test	rax, rax	# str
	je	.L60	#,
# src/natives/bcast.c:26:     if (fabs(round(val) - val) < 0.00001) {
	movsd	xmm0, QWORD PTR 8[rsp]	#, %sfp
	call	"round"@PLT	#
# src/natives/bcast.c:26:     if (fabs(round(val) - val) < 0.00001) {
	movsd	xmm2, QWORD PTR .LC23[rip]	# tmp138,
# src/natives/bcast.c:26:     if (fabs(round(val) - val) < 0.00001) {
	movapd	xmm3, xmm0	# _12, _11
	subsd	xmm3, QWORD PTR 8[rsp]	# _12, %sfp
# src/natives/bcast.c:26:     if (fabs(round(val) - val) < 0.00001) {
	movapd	xmm1, xmm0	# _11,
# src/natives/bcast.c:26:     if (fabs(round(val) - val) < 0.00001) {
	movapd	xmm0, xmm3	# _12, _12
# src/natives/bcast.c:26:     if (fabs(round(val) - val) < 0.00001) {
	andpd	xmm0, XMMWORD PTR .LC22[rip]	# _13,
# src/natives/bcast.c:26:     if (fabs(round(val) - val) < 0.00001) {
	comisd	xmm2, xmm0	# tmp138, _13
	jbe	.L58	#,
# src/natives/bcast.c:27:         written = snprintf(str, size + 1, "%ld", (long)round(val));
	cvttsd2si	rcx, xmm1	# _14, _11
	mov	rsi, r14	#, _7
	mov	rdi, rbx	#, str
	xor	eax, eax	#
	lea	rdx, .LC24[rip]	#,
	call	"snprintf"@PLT	#
	mov	esi, eax	# written, written
.L56:
# src/natives/bcast.c:31:     *result = OBJ_VAL(copyString(str, written));
	mov	rdi, rbx	#, str
	call	"copyString"@PLT	#
# src/natives/bcast.c:32:     free(str);
	mov	rdi, rbx	#, str
# src/natives/bcast.c:31:     *result = OBJ_VAL(copyString(str, written));
	movabs	rdx, -1125899906842624	# tmp142,
	or	rax, rdx	# tmp143, tmp142
	mov	QWORD PTR 0[rbp], rax	# *result_35(D), tmp143
# src/natives/bcast.c:32:     free(str);
	call	"free"@PLT	#
# src/natives/bcast.c:33:     return true;
	mov	rbx, QWORD PTR 16[rsp]	#,
	.cfi_restore 3
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_restore 14
	mov	eax, 1	# <retval>,
# src/natives/bcast.c:34: }
	mov	rbp, QWORD PTR 24[rsp]	#,
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L49:
	.cfi_def_cfa_offset 48
# src/natives/bcast.c:11:         *result = OBJ_VAL(copyString("ntos() expects one number argument.", 35));
	mov	esi, 35	#,
	lea	rdi, .LC19[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:11:         *result = OBJ_VAL(copyString("ntos() expects one number argument.", 35));
	movabs	rdx, -1125899906842624	# tmp127,
	or	rax, rdx	# tmp128, tmp127
	mov	QWORD PTR 0[rbp], rax	# *result_35(D), tmp128
.L53:
# src/natives/bcast.c:34: }
	mov	rbp, QWORD PTR 24[rsp]	#,
# src/natives/bcast.c:12:         return false;
	xor	eax, eax	# <retval>
# src/natives/bcast.c:34: }
	add	rsp, 40	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -32
	.cfi_offset 14, -16
# src/natives/bcast.c:29:         written = snprintf(str, size + 1, "%.4lf", val);
	movsd	xmm0, QWORD PTR 8[rsp]	#, %sfp
	mov	rsi, r14	#, _7
	lea	rdx, .LC20[rip]	#,
	mov	rdi, rbx	#, str
	mov	eax, 1	#,
	call	"snprintf"@PLT	#
	mov	esi, eax	# written, written
	jmp	.L56	#
.L60:
# src/natives/bcast.c:21:         *result = OBJ_VAL(copyString("Internal failure", 16));
	mov	esi, 16	#,
	lea	rdi, .LC21[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:21:         *result = OBJ_VAL(copyString("Internal failure", 16));
	mov	edx, 16383	# tmp133,
# src/natives/bcast.c:22:         return false;
	mov	rbx, QWORD PTR 16[rsp]	#,
	.cfi_restore 3
	mov	r14, QWORD PTR 32[rsp]	#,
	.cfi_restore 14
# src/natives/bcast.c:21:         *result = OBJ_VAL(copyString("Internal failure", 16));
	sal	rdx, 50	# tmp133,
	or	rax, rdx	# tmp134, tmp133
	mov	QWORD PTR 0[rbp], rax	# *result_35(D), tmp134
# src/natives/bcast.c:22:         return false;
	jmp	.L53	#
	.cfi_endproc
.LFE26:
	.size	"ntosNative", .-"ntosNative"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"ston() expects one string argument."
	.section	.rodata.str1.1
.LC26:
	.string	"Invalid string"
	.text
	.p2align 4
	.type	"stonNative", @function
"stonNative":
.LFB27:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 48
# src/natives/bcast.c:36: static bool stonNative(int argCount, Value* args, Value* result) {
	mov	rbx, QWORD PTR fs:40	# result, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 24[rsp], rbx	# D.6745, result
	mov	rbx, rdx	# result, result
# src/natives/bcast.c:38:     if (argCount != 1 || !IS_STRING(args[0])) {
	cmp	edi, 1	# argCount,
	jne	.L62	#,
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, -1125899906842624	# tmp119,
# src/natives/bcast.c:38:     if (argCount != 1 || !IS_STRING(args[0])) {
	mov	rax, QWORD PTR [rsi]	# _1, *args_13(D)
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	mov	rcx, rax	# _17, _1
	and	rcx, rdx	# _17, tmp119
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	rcx, rdx	# _17, tmp119
	je	.L69	#,
.L62:
# src/natives/bcast.c:39:         *result = OBJ_VAL(copyString("ston() expects one string argument.", 35));
	mov	esi, 35	#,
	lea	rdi, .LC25[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:39:         *result = OBJ_VAL(copyString("ston() expects one string argument.", 35));
	movabs	rdx, -1125899906842624	# tmp126,
	or	rax, rdx	# _5, tmp126
# src/natives/bcast.c:40:         return false;
	xor	edx, edx	# <retval>
.L65:
# src/natives/bcast.c:47:         *result = OBJ_VAL(copyString("Invalid string", 14));
	mov	QWORD PTR [rbx], rax	# *result_18(D), _5
# src/natives/bcast.c:53: }
	mov	rax, QWORD PTR 24[rsp]	# tmp137, D.6745
	sub	rax, QWORD PTR fs:40	# tmp137, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L70	#,
	add	rsp, 32	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	mov	eax, edx	#, <retval>
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L69:
	.cfi_restore_state
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	movabs	rdx, 1125899906842623	# tmp121,
	and	rax, rdx	# _23, tmp121
# src/natives/../object.h:155:     return IS_OBJ(value) && AS_OBJ(value)->type == type;
	cmp	DWORD PTR [rax], 9	# _23->type,
	jne	.L62	#,
# src/natives/bcast.c:45:     double val = strtod(AS_CSTRING(args[0]), &end);
	mov	rdi, QWORD PTR 24[rax]	# MEM[(struct ObjString *)_23].chars, MEM[(struct ObjString *)_23].chars
	lea	rsi, 16[rsp]	# tmp122,
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _17
	call	"strtod"@PLT	#
# src/natives/bcast.c:46:     if (*end != '\0') {
	mov	rdx, QWORD PTR 16[rsp]	# end, end
# src/natives/bcast.c:46:     if (*end != '\0') {
	mov	rcx, QWORD PTR 8[rsp]	# _17, %sfp
	cmp	BYTE PTR [rdx], 0	# *end.3_7,
	jne	.L71	#,
# src/natives/../value.h:58:     memcpy(&value, &num, sizeof(double));
	movq	rax, xmm0	# _5, val
# src/natives/bcast.c:52:     return true;
	mov	edx, 1	# <retval>,
	jmp	.L65	#
	.p2align 4,,10
	.p2align 3
.L71:
# src/natives/bcast.c:47:         *result = OBJ_VAL(copyString("Invalid string", 14));
	mov	esi, 14	#,
	lea	rdi, .LC26[rip]	#,
	mov	QWORD PTR 8[rsp], rcx	# %sfp, _17
	call	"copyString"@PLT	#
# src/natives/bcast.c:47:         *result = OBJ_VAL(copyString("Invalid string", 14));
	xor	edx, edx	# <retval>
	or	rax, QWORD PTR 8[rsp]	# _5, %sfp
	jmp	.L65	#
.L70:
# src/natives/bcast.c:53: }
	call	"__stack_chk_fail"@PLT	#
	.cfi_endproc
.LFE27:
	.size	"stonNative", .-"stonNative"
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"typeOf() only takes one argument."
	.section	.rodata.str1.1
.LC28:
	.string	"bool"
.LC29:
	.string	"number"
.LC30:
	.string	"Array"
.LC31:
	.string	"Class"
.LC32:
	.string	"Closure"
.LC33:
	.string	"Function"
.LC34:
	.string	"Instance"
.LC35:
	.string	"Module"
.LC36:
	.string	"Native"
.LC37:
	.string	"String"
.LC38:
	.string	"Upvalue"
	.text
	.p2align 4
	.type	"typeOfNative", @function
"typeOfNative":
.LFB28:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/natives/bcast.c:55: static bool typeOfNative(int argCount, Value* args, Value* result) {
	mov	rbx, rdx	# result, result
# src/natives/bcast.c:57:     if (argCount != 1) {
	cmp	edi, 1	# argCount,
	jne	.L90	#,
# src/natives/bcast.c:63:     if (IS_BOOL(args[0])) {
	movabs	rdx, 9222246136947933187	# tmp152,
	mov	rax, QWORD PTR [rsi]	# _14, *args_10(D)
# src/natives/bcast.c:63:     if (IS_BOOL(args[0])) {
	mov	rcx, rax	# _16, _14
	or	rcx, 1	# _16,
# src/natives/bcast.c:63:     if (IS_BOOL(args[0])) {
	cmp	rcx, rdx	# _16, tmp152
	je	.L91	#,
# src/natives/bcast.c:65:     } else if (IS_NULL(args[0])) {
	movabs	rdx, 9222246136947933185	# tmp156,
	cmp	rax, rdx	# _14, tmp156
	je	.L92	#,
# src/natives/bcast.c:67:     } else if (IS_NUMBER(args[0])) {
	movabs	rcx, 9222246136947933184	# tmp161,
	mov	rdx, rax	# tmp222, _14
	not	rdx	# tmp222
	test	rdx, rcx	# tmp222, tmp161
	je	.L78	#,
# src/natives/bcast.c:68:         *result = OBJ_VAL(copyString("number", 6));
	mov	esi, 6	#,
	lea	rdi, .LC29[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:68:         *result = OBJ_VAL(copyString("number", 6));
	movabs	rdx, -1125899906842624	# tmp164,
	or	rax, rdx	# tmp165, tmp164
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp165
.L76:
# src/natives/bcast.c:59:         return false;
	mov	eax, 1	# <retval>,
# src/natives/bcast.c:84: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L90:
	.cfi_restore_state
# src/natives/bcast.c:58:         *result = OBJ_VAL(copyString("typeOf() only takes one argument.", 33));
	mov	esi, 33	#,
	lea	rdi, .LC27[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:58:         *result = OBJ_VAL(copyString("typeOf() only takes one argument.", 33));
	movabs	rdx, -1125899906842624	# tmp149,
	or	rax, rdx	# tmp150, tmp149
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp150
# src/natives/bcast.c:59:         return false;
	xor	eax, eax	# <retval>
# src/natives/bcast.c:84: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L78:
	.cfi_restore_state
# src/natives/bcast.c:69:     } else if (IS_OBJ(args[0])) {
	movabs	rcx, -1125899906842624	# tmp167,
	mov	rdx, rax	# tmp221, _14
	not	rdx	# tmp221
	test	rdx, rcx	# tmp221, tmp167
	jne	.L76	#,
# src/natives/bcast.c:70:         switch (AS_OBJ(args[0])->type) {
	movabs	rdx, 1125899906842623	# tmp170,
	and	rax, rdx	# _28, tmp170
# src/natives/bcast.c:70:         switch (AS_OBJ(args[0])->type) {
	cmp	DWORD PTR [rax], 10	# _29->type,
	ja	.L76	#,
	mov	eax, DWORD PTR [rax]	# _29->type, _29->type
	lea	rdx, .L80[rip]	# tmp172,
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp174,
	add	rax, rdx	# tmp175, tmp172
	jmp	rax	# tmp175
	.section	.rodata
	.align 4
	.align 4
.L80:
	.long	.L88-.L80
	.long	.L76-.L80
	.long	.L87-.L80
	.long	.L86-.L80
	.long	.L85-.L80
	.long	.L84-.L80
	.long	.L83-.L80
	.long	.L82-.L80
	.long	.L76-.L80
	.long	.L81-.L80
	.long	.L79-.L80
	.text
	.p2align 4,,10
	.p2align 3
.L92:
# src/natives/bcast.c:66:         *result = OBJ_VAL(copyString("null", 4));
	mov	esi, 4	#,
	lea	rdi, .LC1[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:66:         *result = OBJ_VAL(copyString("null", 4));
	movabs	rdx, -1125899906842624	# tmp158,
	or	rax, rdx	# tmp159, tmp158
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp159
	jmp	.L76	#
	.p2align 4,,10
	.p2align 3
.L91:
# src/natives/bcast.c:64:         *result = OBJ_VAL(copyString("bool", 4));
	mov	esi, 4	#,
	lea	rdi, .LC28[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:64:         *result = OBJ_VAL(copyString("bool", 4));
	movabs	rdx, -1125899906842624	# tmp154,
	or	rax, rdx	# tmp155, tmp154
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp155
	jmp	.L76	#
.L79:
# src/natives/bcast.c:79:             case OBJ_UPVALUE:  *result = OBJ_VAL(copyString("Upvalue", 7)); break;
	mov	esi, 7	#,
	lea	rdi, .LC38[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:79:             case OBJ_UPVALUE:  *result = OBJ_VAL(copyString("Upvalue", 7)); break;
	movabs	rdx, -1125899906842624	# tmp202,
	or	rax, rdx	# tmp203, tmp202
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp203
# src/natives/bcast.c:79:             case OBJ_UPVALUE:  *result = OBJ_VAL(copyString("Upvalue", 7)); break;
	jmp	.L76	#
.L81:
# src/natives/bcast.c:78:             case OBJ_STRING:   *result = OBJ_VAL(copyString("String", 6)); break;
	mov	esi, 6	#,
	lea	rdi, .LC37[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:78:             case OBJ_STRING:   *result = OBJ_VAL(copyString("String", 6)); break;
	movabs	rdx, -1125899906842624	# tmp199,
	or	rax, rdx	# tmp200, tmp199
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp200
# src/natives/bcast.c:78:             case OBJ_STRING:   *result = OBJ_VAL(copyString("String", 6)); break;
	jmp	.L76	#
.L82:
# src/natives/bcast.c:77:             case OBJ_NATIVE:   *result = OBJ_VAL(copyString("Native", 6)); break;
	mov	esi, 6	#,
	lea	rdi, .LC36[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:77:             case OBJ_NATIVE:   *result = OBJ_VAL(copyString("Native", 6)); break;
	movabs	rdx, -1125899906842624	# tmp196,
	or	rax, rdx	# tmp197, tmp196
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp197
# src/natives/bcast.c:77:             case OBJ_NATIVE:   *result = OBJ_VAL(copyString("Native", 6)); break;
	jmp	.L76	#
.L83:
# src/natives/bcast.c:76:             case OBJ_MODULE:   *result = OBJ_VAL(copyString("Module", 6)); break;
	mov	esi, 6	#,
	lea	rdi, .LC35[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:76:             case OBJ_MODULE:   *result = OBJ_VAL(copyString("Module", 6)); break;
	movabs	rdx, -1125899906842624	# tmp193,
	or	rax, rdx	# tmp194, tmp193
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp194
# src/natives/bcast.c:76:             case OBJ_MODULE:   *result = OBJ_VAL(copyString("Module", 6)); break;
	jmp	.L76	#
.L84:
# src/natives/bcast.c:75:             case OBJ_INSTANCE: *result = OBJ_VAL(copyString("Instance", 8)); break;
	mov	esi, 8	#,
	lea	rdi, .LC34[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:75:             case OBJ_INSTANCE: *result = OBJ_VAL(copyString("Instance", 8)); break;
	movabs	rdx, -1125899906842624	# tmp190,
	or	rax, rdx	# tmp191, tmp190
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp191
# src/natives/bcast.c:75:             case OBJ_INSTANCE: *result = OBJ_VAL(copyString("Instance", 8)); break;
	jmp	.L76	#
.L85:
# src/natives/bcast.c:74:             case OBJ_FUNCTION: *result = OBJ_VAL(copyString("Function", 8)); break;
	mov	esi, 8	#,
	lea	rdi, .LC33[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:74:             case OBJ_FUNCTION: *result = OBJ_VAL(copyString("Function", 8)); break;
	movabs	rdx, -1125899906842624	# tmp187,
	or	rax, rdx	# tmp188, tmp187
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp188
# src/natives/bcast.c:74:             case OBJ_FUNCTION: *result = OBJ_VAL(copyString("Function", 8)); break;
	jmp	.L76	#
.L86:
# src/natives/bcast.c:73:             case OBJ_CLOSURE:  *result = OBJ_VAL(copyString("Closure", 7)); break;
	mov	esi, 7	#,
	lea	rdi, .LC32[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:73:             case OBJ_CLOSURE:  *result = OBJ_VAL(copyString("Closure", 7)); break;
	movabs	rdx, -1125899906842624	# tmp184,
	or	rax, rdx	# tmp185, tmp184
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp185
# src/natives/bcast.c:73:             case OBJ_CLOSURE:  *result = OBJ_VAL(copyString("Closure", 7)); break;
	jmp	.L76	#
.L87:
# src/natives/bcast.c:72:             case OBJ_CLASS:    *result = OBJ_VAL(copyString("Class", 5)); break;
	mov	esi, 5	#,
	lea	rdi, .LC31[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:72:             case OBJ_CLASS:    *result = OBJ_VAL(copyString("Class", 5)); break;
	movabs	rdx, -1125899906842624	# tmp181,
	or	rax, rdx	# tmp182, tmp181
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp182
# src/natives/bcast.c:72:             case OBJ_CLASS:    *result = OBJ_VAL(copyString("Class", 5)); break;
	jmp	.L76	#
.L88:
# src/natives/bcast.c:71:             case OBJ_ARRAY:    *result = OBJ_VAL(copyString("Array", 5)); break;
	mov	esi, 5	#,
	lea	rdi, .LC30[rip]	#,
	call	"copyString"@PLT	#
# src/natives/bcast.c:71:             case OBJ_ARRAY:    *result = OBJ_VAL(copyString("Array", 5)); break;
	movabs	rdx, -1125899906842624	# tmp178,
	or	rax, rdx	# tmp179, tmp178
	mov	QWORD PTR [rbx], rax	# *result_11(D), tmp179
# src/natives/bcast.c:71:             case OBJ_ARRAY:    *result = OBJ_VAL(copyString("Array", 5)); break;
	jmp	.L76	#
	.cfi_endproc
.LFE28:
	.size	"typeOfNative", .-"typeOfNative"
	.section	.rodata.str1.1
.LC39:
	.string	"ntos"
.LC40:
	.string	"ston"
.LC41:
	.string	"typeOf"
.LC42:
	.string	"toString"
	.text
	.p2align 4
	.globl	"buildCastModule"
	.type	"buildCastModule", @function
"buildCastModule":
.LFB31:
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
# src/natives/bcast.c:182:     push(OBJ_VAL(module));
	movabs	rbx, -1125899906842624	# tmp119,
# src/natives/bcast.c:180: ObjModule* buildCastModule() {
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 48
# src/natives/bcast.c:181:     ObjModule* module = newModule();
	call	"newModule"@PLT	#
# src/natives/bcast.c:182:     push(OBJ_VAL(module));
	mov	rdi, rax	# _2, <retval>
# src/natives/bcast.c:181:     ObjModule* module = newModule();
	mov	r12, rax	# <retval>,
# src/natives/bcast.c:182:     push(OBJ_VAL(module));
	or	rdi, rbx	# _2, tmp119
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	lea	rbp, 16[r12]	# _7,
# src/natives/bcast.c:182:     push(OBJ_VAL(module));
	call	"push"@PLT	#
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	lea	rdi, "ntosNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	mov	esi, 4	#,
	lea	rdi, .LC39[rip]	#,
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	mov	r13, rax	# _3,
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	call	"copyString"@PLT	#
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	mov	rdx, r13	# _3, _3
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	mov	rdi, rbp	#, _7
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	or	rdx, rbx	# _3, tmp119
# src/natives/bcast.c:184:     tableSet(&module->table, copyString("ntos", 4), OBJ_VAL(newNative(ntosNative)));
	mov	rsi, rax	#, _6
	call	"tableSet"@PLT	#
# src/natives/bcast.c:185:     tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
	lea	rdi, "stonNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bcast.c:185:     tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
	mov	esi, 4	#,
	lea	rdi, .LC40[rip]	#,
# src/natives/bcast.c:185:     tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
	mov	r13, rax	# _8,
# src/natives/bcast.c:185:     tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
	call	"copyString"@PLT	#
# src/natives/bcast.c:185:     tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
	mov	rdx, r13	# _8, _8
# src/natives/bcast.c:185:     tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
	mov	rdi, rbp	#, _7
# src/natives/bcast.c:185:     tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
	or	rdx, rbx	# _8, tmp119
# src/natives/bcast.c:185:     tableSet(&module->table, copyString("ston", 4), OBJ_VAL(newNative(stonNative)));
	mov	rsi, rax	#, _11
	call	"tableSet"@PLT	#
# src/natives/bcast.c:186:     tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));
	lea	rdi, "typeOfNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bcast.c:186:     tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));
	mov	esi, 6	#,
	lea	rdi, .LC41[rip]	#,
# src/natives/bcast.c:186:     tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));
	mov	r13, rax	# _12,
# src/natives/bcast.c:186:     tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));
	call	"copyString"@PLT	#
# src/natives/bcast.c:186:     tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));
	mov	rdx, r13	# _12, _12
# src/natives/bcast.c:186:     tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));
	mov	rdi, rbp	#, _7
# src/natives/bcast.c:186:     tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));
	or	rdx, rbx	# _12, tmp119
# src/natives/bcast.c:186:     tableSet(&module->table, copyString("typeOf", 6), OBJ_VAL(newNative(typeOfNative)));
	mov	rsi, rax	#, _15
	call	"tableSet"@PLT	#
# src/natives/bcast.c:187:     tableSet(&module->table, copyString("toString", 8), OBJ_VAL(newNative(toStringNative)));
	lea	rdi, "toStringNative"[rip]	#,
	call	"newNative"@PLT	#
# src/natives/bcast.c:187:     tableSet(&module->table, copyString("toString", 8), OBJ_VAL(newNative(toStringNative)));
	mov	esi, 8	#,
	lea	rdi, .LC42[rip]	#,
# src/natives/bcast.c:187:     tableSet(&module->table, copyString("toString", 8), OBJ_VAL(newNative(toStringNative)));
	mov	r13, rax	# _16,
# src/natives/bcast.c:187:     tableSet(&module->table, copyString("toString", 8), OBJ_VAL(newNative(toStringNative)));
	call	"copyString"@PLT	#
# src/natives/bcast.c:187:     tableSet(&module->table, copyString("toString", 8), OBJ_VAL(newNative(toStringNative)));
	mov	rdx, r13	# _16, _16
# src/natives/bcast.c:187:     tableSet(&module->table, copyString("toString", 8), OBJ_VAL(newNative(toStringNative)));
	mov	rdi, rbp	#, _7
# src/natives/bcast.c:187:     tableSet(&module->table, copyString("toString", 8), OBJ_VAL(newNative(toStringNative)));
	or	rdx, rbx	# _16, tmp119
# src/natives/bcast.c:187:     tableSet(&module->table, copyString("toString", 8), OBJ_VAL(newNative(toStringNative)));
	mov	rsi, rax	#, _19
	call	"tableSet"@PLT	#
# src/natives/bcast.c:189:     pop();
	call	"pop"@PLT	#
# src/natives/bcast.c:191: }
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
.LFE31:
	.size	"buildCastModule", .-"buildCastModule"
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC22:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC23:
	.long	-1998362383
	.long	1055193269
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
