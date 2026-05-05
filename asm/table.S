	.file	"table.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 16.1.1 20260430 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 16.1.1 20260430, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=x86-64-v2 -mtune=generic -masm=intel -O3
	.text
	.p2align 4
	.globl	"initTable"
	.type	"initTable", @function
"initTable":
.LFB26:
	.cfi_startproc
# src/table.c:12:     table->count = 0;
	mov	QWORD PTR [rdi], 0	# MEM <vector(2) int> [(int *)table_2(D)],
# src/table.c:14:     table->tombstones = 0;
	mov	DWORD PTR 8[rdi], 0	# table_2(D)->tombstones,
# src/table.c:15:     table->entries = NULL;
	mov	QWORD PTR 16[rdi], 0	# table_2(D)->entries,
# src/table.c:16: }
	ret	
	.cfi_endproc
.LFE26:
	.size	"initTable", .-"initTable"
	.p2align 4
	.globl	"freeTable"
	.type	"freeTable", @function
"freeTable":
.LFB27:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/table.c:19:     FREE_ARRAY(Entry, table->entries, table->capacity);
	movsxd	rsi, DWORD PTR 4[rdi]	# _2, table_6(D)->capacity
# src/table.c:18: void freeTable(Table* table) {
	mov	rbx, rdi	# table, table
# src/table.c:19:     FREE_ARRAY(Entry, table->entries, table->capacity);
	xor	edx, edx	#
	mov	rdi, QWORD PTR 16[rdi]	# table_6(D)->entries, table_6(D)->entries
	sal	rsi, 4	# _3,
	call	"reallocate"@PLT	#
# src/table.c:12:     table->count = 0;
	mov	QWORD PTR [rbx], 0	# MEM <vector(2) int> [(int *)table_6(D)],
# src/table.c:14:     table->tombstones = 0;
	mov	DWORD PTR 8[rbx], 0	# table_6(D)->tombstones,
# src/table.c:15:     table->entries = NULL;
	mov	QWORD PTR 16[rbx], 0	# table_6(D)->entries,
# src/table.c:21: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE27:
	.size	"freeTable", .-"freeTable"
	.p2align 4
	.globl	"tableGet"
	.type	"tableGet", @function
"tableGet":
.LFB29:
	.cfi_startproc
# src/table.c:43: bool tableGet(Table* table, ObjString* key, Value* value) {
	mov	rax, rdi	# table, table
	mov	r10, rdx	# value, value
	mov	rdi, rsi	# key, key
# src/table.c:44:     if (table->count == 0) return false;
	mov	edx, DWORD PTR [rax]	#, table_17(D)->count
	test	edx, edx	#
	je	.L6	#,
# src/table.c:50:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	movabs	r9, 9222246136947933185	# tmp125,
# src/table.c:46:     uint32_t index = key->hash & (table->capacity - 1);
	mov	esi, DWORD PTR 4[rax]	# tmp130, table_17(D)->capacity
# src/table.c:46:     uint32_t index = key->hash & (table->capacity - 1);
	mov	edx, DWORD PTR 32[rdi]	# index, key_18(D)->hash
# src/table.c:48:         Entry* entry = &table->entries[index];
	mov	r8, QWORD PTR 16[rax]	# _25, table_17(D)->entries
# src/table.c:46:     uint32_t index = key->hash & (table->capacity - 1);
	sub	esi, 1	# _5,
# src/table.c:46:     uint32_t index = key->hash & (table->capacity - 1);
	and	edx, esi	# index, _5
# src/table.c:48:         Entry* entry = &table->entries[index];
	mov	eax, edx	# _26, index
	sal	rax, 4	# _27,
# src/table.c:48:         Entry* entry = &table->entries[index];
	add	rax, r8	# entry, _25
# src/table.c:49:         if (entry->key == key) { *value = entry->value; return true; }
	mov	rcx, QWORD PTR [rax]	# _9, entry_28->key
# src/table.c:49:         if (entry->key == key) { *value = entry->value; return true; }
	cmp	rdi, rcx	# key, _9
	jne	.L7	#,
	jmp	.L10	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L9:
# src/table.c:51:         index = (index + 1) & (table->capacity - 1);
	add	edx, 1	# _12,
# src/table.c:51:         index = (index + 1) & (table->capacity - 1);
	and	edx, esi	# index, _5
# src/table.c:48:         Entry* entry = &table->entries[index];
	mov	eax, edx	# _7, index
	sal	rax, 4	# _8,
# src/table.c:48:         Entry* entry = &table->entries[index];
	add	rax, r8	# entry, _25
# src/table.c:49:         if (entry->key == key) { *value = entry->value; return true; }
	mov	rcx, QWORD PTR [rax]	# _9, entry_20->key
# src/table.c:49:         if (entry->key == key) { *value = entry->value; return true; }
	cmp	rcx, rdi	# _9, key
	je	.L10	#,
.L7:
# src/table.c:50:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	test	rcx, rcx	# _9
	jne	.L9	#,
# src/table.c:50:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	cmp	QWORD PTR 8[rax], r9	# entry_33->value, tmp125
	jne	.L9	#,
.L6:
# src/table.c:44:     if (table->count == 0) return false;
	xor	eax, eax	# <retval>
# src/table.c:53: }
	ret	
	.p2align 4,,10
	.p2align 3
.L10:
# src/table.c:49:         if (entry->key == key) { *value = entry->value; return true; }
	mov	rax, QWORD PTR 8[rax]	# _10, entry_32->value
# src/table.c:49:         if (entry->key == key) { *value = entry->value; return true; }
	mov	QWORD PTR [r10], rax	# *value_22(D), _10
# src/table.c:49:         if (entry->key == key) { *value = entry->value; return true; }
	mov	eax, 1	# <retval>,
	ret	
	.cfi_endproc
.LFE29:
	.size	"tableGet", .-"tableGet"
	.p2align 4
	.globl	"tableSet"
	.type	"tableSet", @function
"tableSet":
.LFB31:
	.cfi_startproc
	sub	rsp, 72	#,
	.cfi_def_cfa_offset 80
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	pxor	xmm0, xmm0	# _5
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	mov	eax, DWORD PTR [rdi]	# _1, table_21(D)->count
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	pxor	xmm1, xmm1	# _3
# src/table.c:79: bool tableSet(Table* table, ObjString* key, Value value) {
	mov	QWORD PTR 40[rsp], r12	#,
	.cfi_offset 12, -40
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	mov	r12d, DWORD PTR 4[rdi]	# capacity, table_21(D)->capacity
# src/table.c:79: bool tableSet(Table* table, ObjString* key, Value value) {
	mov	QWORD PTR 56[rsp], r14	#,
	.cfi_offset 14, -24
	mov	r14, rdx	# value, value
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	lea	edx, 1[rax]	# _2,
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	cvtsi2sd	xmm0, r12d	# _5, capacity
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	cvtsi2sd	xmm1, edx	# _3, _2
# src/table.c:79: bool tableSet(Table* table, ObjString* key, Value value) {
	mov	QWORD PTR 24[rsp], rbx	#,
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	mulsd	xmm0, QWORD PTR .LC0[rip]	# _6,
# src/table.c:79: bool tableSet(Table* table, ObjString* key, Value value) {
	mov	QWORD PTR 32[rsp], rbp	#,
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	mov	rbx, rsi	# key, key
	mov	rbp, rdi	# table, table
# src/table.c:80:     if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
	comisd	xmm1, xmm0	# _3, _6
	ja	.L13	#,
# src/table.c:87:     Entry* entry = findEntry(table->entries, table->capacity, key);
	mov	r8, QWORD PTR 16[rdi]	# entries, table_21(D)->entries
# src/table.c:24:     uint32_t index = key->hash & (capacity - 1);
	lea	r9d, -1[r12]	# prephitmp_173,
.L14:
# src/table.c:30:             if (IS_NULL(entry->value)) {
	movabs	rdi, 9222246136947933185	# tmp187,
# src/table.c:24:     uint32_t index = key->hash & (capacity - 1);
	mov	edx, DWORD PTR 32[rbx]	# index, key_24(D)->hash
# src/table.c:25:     Entry* tombstone = NULL;
	xor	esi, esi	# tombstone
# src/table.c:24:     uint32_t index = key->hash & (capacity - 1);
	and	edx, r9d	# index, prephitmp_173
	jmp	.L35	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L29:
# src/table.c:35:         } else if (entry->key == key) {
	cmp	rbx, rcx	# key, _39
	je	.L49	#,
.L33:
# src/table.c:39:         index = (index + 1) & (capacity - 1);
	add	edx, 1	# _42,
# src/table.c:39:         index = (index + 1) & (capacity - 1);
	and	edx, r9d	# index, prephitmp_173
.L35:
# src/table.c:28:         Entry* entry = &entries[index];
	mov	eax, edx	# _36, index
	sal	rax, 4	# _37,
# src/table.c:28:         Entry* entry = &entries[index];
	add	rax, r8	# entry, entries
# src/table.c:29:         if (entry->key == NULL) {
	mov	rcx, QWORD PTR [rax]	# _39, entry_38->key
# src/table.c:29:         if (entry->key == NULL) {
	test	rcx, rcx	# _39
	jne	.L29	#,
# src/table.c:30:             if (IS_NULL(entry->value)) {
	cmp	QWORD PTR 8[rax], rdi	# entry_38->value, tmp187
	je	.L50	#,
# src/table.c:33:                 if (tombstone == NULL) tombstone = entry;
	test	rsi, rsi	# tombstone
	cmove	rsi, rax	# tombstone,, tombstone, entry
	jmp	.L33	#
.L41:
# src/table.c:89:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	mov	rax, rsi	# entry, tombstone
	.p2align 4
	.p2align 3
.L49:
	xor	edx, edx	# <retval>
.L34:
# src/table.c:95: }
	mov	rbp, QWORD PTR 32[rsp]	#,
	mov	r12, QWORD PTR 40[rsp]	#,
# src/table.c:92:     entry->key = key;
	mov	QWORD PTR [rax], rbx	# _120->key, key
# src/table.c:93:     entry->value = value;
	mov	QWORD PTR 8[rax], r14	# _120->value, value
# src/table.c:95: }
	mov	rbx, QWORD PTR 24[rsp]	#,
	mov	eax, edx	#, <retval>
	mov	r14, QWORD PTR 56[rsp]	#,
	add	rsp, 72	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L13:
	.cfi_restore_state
# src/table.c:81:         int capacity = (table->tombstones > table->count / 4)
	test	eax, eax	# _1
	lea	edx, 3[rax]	# tmp166,
	cmovs	eax, edx	# tmp166,, _1
	sar	eax, 2	# _8,
# src/table.c:83:             : GROW_CAPACITY(table->capacity);
	cmp	DWORD PTR 8[rdi], eax	# table_21(D)->tombstones, _8
	jle	.L51	#,
# src/table.c:56:     Entry* entries = ALLOCATE(Entry, capacity);
	movsxd	rdx, r12d	# _46, capacity
	xor	esi, esi	#
	xor	edi, edi	#
	sal	rdx, 4	# _47,
	call	"reallocate"@PLT	#
# src/table.c:24:     uint32_t index = key->hash & (capacity - 1);
	lea	r9d, -1[r12]	# prephitmp_173,
# src/table.c:56:     Entry* entries = ALLOCATE(Entry, capacity);
	mov	r8, rax	# entries, entries
# src/table.c:57:     for (int i = 0; i < capacity; i++) {
	test	r12d, r12d	# capacity
	jle	.L18	#,
.L17:
# src/table.c:59:         entries[i].value = NULL_VAL;
	movabs	rcx, 9222246136947933185	# tmp173,
	mov	rax, r8	# ivtmp.40, entries
# src/table.c:57:     for (int i = 0; i < capacity; i++) {
	xor	edx, edx	# i
	.p2align 5
	.p2align 4
	.p2align 3
.L19:
# src/table.c:57:     for (int i = 0; i < capacity; i++) {
	add	edx, 1	# i,
# src/table.c:58:         entries[i].key = NULL;
	mov	QWORD PTR [rax], 0	# MEM[(struct ObjString * *)_188],
# src/table.c:57:     for (int i = 0; i < capacity; i++) {
	add	rax, 16	# ivtmp.40,
# src/table.c:59:         entries[i].value = NULL_VAL;
	mov	QWORD PTR -8[rax], rcx	# MEM[(long unsigned int *)_188 + 8B], tmp173
# src/table.c:57:     for (int i = 0; i < capacity; i++) {
	cmp	edx, r12d	# i, capacity
	jl	.L19	#,
.L18:
# src/table.c:64:     for (int i = 0; i < table->capacity; i++) {
	mov	ecx, DWORD PTR 4[rbp]	# _98, table_21(D)->capacity
# src/table.c:74:     FREE_ARRAY(Entry, table->entries, table->capacity);
	mov	rdi, QWORD PTR 16[rbp]	# pretmp_217, table_21(D)->entries
# src/table.c:62:     table->count = 0;
	mov	DWORD PTR 0[rbp], 0	# table_21(D)->count,
# src/table.c:63:     table->tombstones = 0;
	mov	DWORD PTR 8[rbp], 0	# table_21(D)->tombstones,
# src/table.c:64:     for (int i = 0; i < table->capacity; i++) {
	test	ecx, ecx	# _98
	jle	.L20	#,
	mov	QWORD PTR 48[rsp], r13	#,
	.cfi_offset 13, -32
	mov	r13d, ecx	# _176, _98
	mov	r10, rdi	# ivtmp.32, pretmp_217
# src/table.c:30:             if (IS_NULL(entry->value)) {
	movabs	r11, 9222246136947933185	# tmp189,
	sal	r13, 4	# _181,
	mov	QWORD PTR 64[rsp], r15	#,
	.cfi_offset 15, -16
# src/table.c:30:             if (IS_NULL(entry->value)) {
	mov	r15d, ecx	# _98, _98
	mov	QWORD PTR [rsp], r14	# %sfp, value
	mov	r14, rbx	# key, key
	mov	rbx, rdi	# pretmp_217, pretmp_217
	add	rdi, r13	# _183, _181
	mov	r13, r10	# ivtmp.32, ivtmp.32
	.p2align 4
	.p2align 3
.L28:
# src/table.c:66:         if (entry->key == NULL) continue;
	mov	rsi, QWORD PTR 0[r13]	# _59, MEM[(struct ObjString * *)_175]
# src/table.c:66:         if (entry->key == NULL) continue;
	test	rsi, rsi	# _59
	je	.L21	#,
# src/table.c:24:     uint32_t index = key->hash & (capacity - 1);
	mov	edx, DWORD PTR 32[rsi]	# index, _59->hash
# src/table.c:25:     Entry* tombstone = NULL;
	xor	r10d, r10d	# tombstone
# src/table.c:24:     uint32_t index = key->hash & (capacity - 1);
	and	edx, r9d	# index, prephitmp_173
	jmp	.L27	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L22:
# src/table.c:35:         } else if (entry->key == key) {
	cmp	rsi, rcx	# _59, _68
	je	.L24	#,
.L26:
# src/table.c:39:         index = (index + 1) & (capacity - 1);
	add	edx, 1	# _71,
# src/table.c:39:         index = (index + 1) & (capacity - 1);
	and	edx, r9d	# index, prephitmp_173
.L27:
# src/table.c:28:         Entry* entry = &entries[index];
	mov	eax, edx	# _65, index
	sal	rax, 4	# _66,
# src/table.c:28:         Entry* entry = &entries[index];
	add	rax, r8	# entry, entries
# src/table.c:29:         if (entry->key == NULL) {
	mov	rcx, QWORD PTR [rax]	# _68, entry_67->key
# src/table.c:29:         if (entry->key == NULL) {
	test	rcx, rcx	# _68
	jne	.L22	#,
# src/table.c:30:             if (IS_NULL(entry->value)) {
	cmp	QWORD PTR 8[rax], r11	# entry_67->value, tmp189
	je	.L52	#,
# src/table.c:33:                 if (tombstone == NULL) tombstone = entry;
	test	r10, r10	# tombstone
	cmove	r10, rax	# tombstone,, tombstone, entry
	jmp	.L26	#
.L51:
	.cfi_restore 13
	.cfi_restore 15
# src/table.c:83:             : GROW_CAPACITY(table->capacity);
	cmp	r12d, 7	# capacity,
	jle	.L53	#,
# src/table.c:81:         int capacity = (table->tombstones > table->count / 4)
	lea	edx, [r12+r12]	#,
# src/table.c:56:     Entry* entries = ALLOCATE(Entry, capacity);
	xor	esi, esi	#
	xor	edi, edi	#
# src/table.c:81:         int capacity = (table->tombstones > table->count / 4)
	mov	r12, rdx	#,
# src/table.c:56:     Entry* entries = ALLOCATE(Entry, capacity);
	sal	rdx, 4	# _83,
	call	"reallocate"@PLT	#
# src/table.c:24:     uint32_t index = key->hash & (capacity - 1);
	lea	r9d, -1[r12]	# prephitmp_173,
# src/table.c:56:     Entry* entries = ALLOCATE(Entry, capacity);
	mov	r8, rax	# entries, entries
	jmp	.L17	#
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_offset 13, -32
	.cfi_offset 15, -16
# src/table.c:31:                 return tombstone != NULL ? tombstone : entry;
	test	r10, r10	# tombstone
	cmovne	rax, r10	# entry,, entry, tombstone
.L24:
# src/table.c:70:         dest->value = entry->value;
	mov	rdx, QWORD PTR 8[r13]	# _74, MEM[(long unsigned int *)_175 + 8B]
# src/table.c:69:         dest->key = entry->key;
	mov	QWORD PTR [rax], rsi	# _73->key, _59
# src/table.c:70:         dest->value = entry->value;
	mov	QWORD PTR 8[rax], rdx	# _73->value, _74
# src/table.c:71:         table->count++;
	add	DWORD PTR 0[rbp], 1	# table_21(D)->count,
.L21:
# src/table.c:64:     for (int i = 0; i < table->capacity; i++) {
	add	r13, 16	# ivtmp.32,
	cmp	r13, rdi	# ivtmp.32, _183
	jne	.L28	#,
	mov	ecx, r15d	# _98, _98
	mov	rdi, rbx	# pretmp_217, pretmp_217
	mov	r13, QWORD PTR 48[rsp]	#,
	.cfi_restore 13
	mov	rbx, r14	# key, key
	mov	r15, QWORD PTR 64[rsp]	#,
	.cfi_restore 15
	mov	r14, QWORD PTR [rsp]	# value, %sfp
.L20:
# src/table.c:74:     FREE_ARRAY(Entry, table->entries, table->capacity);
	movsxd	rsi, ecx	# _79, _98
	xor	edx, edx	#
	mov	DWORD PTR 12[rsp], r9d	# %sfp, prephitmp_173
	sal	rsi, 4	# _80,
	mov	QWORD PTR [rsp], r8	# %sfp, entries
	call	"reallocate"@PLT	#
# src/table.c:75:     table->entries = entries;
	mov	r8, QWORD PTR [rsp]	# entries, %sfp
# src/table.c:76:     table->capacity = capacity;
	mov	DWORD PTR 4[rbp], r12d	# table_21(D)->capacity, capacity
	mov	r9d, DWORD PTR 12[rsp]	# prephitmp_173, %sfp
# src/table.c:75:     table->entries = entries;
	mov	QWORD PTR 16[rbp], r8	# table_21(D)->entries, entries
	jmp	.L14	#
.L50:
# src/table.c:31:                 return tombstone != NULL ? tombstone : entry;
	test	rsi, rsi	# tombstone
	je	.L32	#,
# src/table.c:89:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	cmp	QWORD PTR [rsi], 0	# tombstone_41->key,
	jne	.L41	#,
# src/table.c:89:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	cmp	QWORD PTR 8[rsi], rdi	# tombstone_41->value, tmp187
	je	.L54	#,
# src/table.c:90:     else if (isNewKey) table->tombstones--;
	sub	DWORD PTR 8[rbp], 1	# table_21(D)->tombstones,
	mov	rax, rsi	# entry, tombstone
	mov	edx, 1	# <retval>,
	jmp	.L34	#
.L53:
# src/table.c:56:     Entry* entries = ALLOCATE(Entry, capacity);
	mov	edx, 128	#,
	xor	esi, esi	#
	xor	edi, edi	#
# src/table.c:81:         int capacity = (table->tombstones > table->count / 4)
	mov	r12d, 8	# capacity,
# src/table.c:56:     Entry* entries = ALLOCATE(Entry, capacity);
	call	"reallocate"@PLT	#
	mov	r9d, 7	# prephitmp_173,
	mov	r8, rax	# entries, entries
	jmp	.L17	#
.L54:
# src/table.c:89:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	mov	rax, rsi	# entry, tombstone
.L32:
# src/table.c:89:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	add	DWORD PTR 0[rbp], 1	# table_21(D)->count,
	mov	edx, 1	# <retval>,
	jmp	.L34	#
	.cfi_endproc
.LFE31:
	.size	"tableSet", .-"tableSet"
	.p2align 4
	.globl	"tableDelete"
	.type	"tableDelete", @function
"tableDelete":
.LFB32:
	.cfi_startproc
# src/table.c:97: bool tableDelete(Table* table, ObjString* key) {
	mov	r9, rdi	# table, table
	mov	rdi, rsi	# key, key
# src/table.c:98:     if (table->count == 0) return false;
	mov	r10d, DWORD PTR [r9]	# _1, table_19(D)->count
# src/table.c:98:     if (table->count == 0) return false;
	test	r10d, r10d	# _1
	je	.L56	#,
# src/table.c:100:     uint32_t index = key->hash & (table->capacity - 1);
	mov	eax, DWORD PTR 4[r9]	# tmp132, table_19(D)->capacity
# src/table.c:100:     uint32_t index = key->hash & (table->capacity - 1);
	mov	edx, DWORD PTR 32[rdi]	# index, key_20(D)->hash
# src/table.c:110:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	movabs	r11, 9222246136947933185	# tmp128,
# src/table.c:102:         Entry* entry = &table->entries[index];
	mov	r8, QWORD PTR 16[r9]	# _29, table_19(D)->entries
# src/table.c:100:     uint32_t index = key->hash & (table->capacity - 1);
	lea	esi, -1[rax]	# _5,
# src/table.c:100:     uint32_t index = key->hash & (table->capacity - 1);
	and	edx, esi	# index, _5
# src/table.c:102:         Entry* entry = &table->entries[index];
	mov	eax, edx	# _30, index
	sal	rax, 4	# _31,
# src/table.c:102:         Entry* entry = &table->entries[index];
	add	rax, r8	# entry, _29
# src/table.c:103:         if (entry->key == key) {
	mov	rcx, QWORD PTR [rax]	# _9, entry_32->key
# src/table.c:103:         if (entry->key == key) {
	cmp	rdi, rcx	# key, _9
	jne	.L57	#,
	jmp	.L60	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L59:
# src/table.c:111:         index = (index + 1) & (table->capacity - 1);
	add	edx, 1	# _14,
# src/table.c:111:         index = (index + 1) & (table->capacity - 1);
	and	edx, esi	# index, _5
# src/table.c:102:         Entry* entry = &table->entries[index];
	mov	eax, edx	# _7, index
	sal	rax, 4	# _8,
# src/table.c:102:         Entry* entry = &table->entries[index];
	add	rax, r8	# entry, _29
# src/table.c:103:         if (entry->key == key) {
	mov	rcx, QWORD PTR [rax]	# _9, entry_22->key
# src/table.c:103:         if (entry->key == key) {
	cmp	rcx, rdi	# _9, key
	je	.L60	#,
.L57:
# src/table.c:110:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	test	rcx, rcx	# _9
	jne	.L59	#,
# src/table.c:110:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	cmp	QWORD PTR 8[rax], r11	# entry_37->value, tmp128
	jne	.L59	#,
.L56:
# src/table.c:98:     if (table->count == 0) return false;
	xor	eax, eax	# <retval>
# src/table.c:113: }
	ret	
	.p2align 4,,10
	.p2align 3
.L60:
# src/table.c:105:             entry->value = BOOL_VAL(true);
	movabs	rsi, 9222246136947933187	# tmp134,
# src/table.c:107:             table->count--;  // ← you're also missing this
	sub	r10d, 1	# tmp123,
# src/table.c:104:             entry->key = NULL;
	mov	QWORD PTR [rax], 0	# entry_36->key,
# src/table.c:105:             entry->value = BOOL_VAL(true);
	mov	QWORD PTR 8[rax], rsi	# entry_36->value, tmp134
# src/table.c:108:             return true;
	mov	eax, 1	# <retval>,
# src/table.c:106:             table->tombstones++;
	add	DWORD PTR 8[r9], 1	# table_19(D)->tombstones,
# src/table.c:107:             table->count--;  // ← you're also missing this
	mov	DWORD PTR [r9], r10d	# table_19(D)->count, tmp123
# src/table.c:108:             return true;
	ret	
	.cfi_endproc
.LFE32:
	.size	"tableDelete", .-"tableDelete"
	.p2align 4
	.globl	"tableAddAll"
	.type	"tableAddAll", @function
"tableAddAll":
.LFB33:
	.cfi_startproc
# src/table.c:116:     for (int i = 0; i < from->capacity; i++) {
	mov	edx, DWORD PTR 4[rdi]	# prephitmp_17, from_11(D)->capacity
# src/table.c:116:     for (int i = 0; i < from->capacity; i++) {
	test	edx, edx	# prephitmp_17
	jle	.L72	#,
# src/table.c:115: void tableAddAll(Table* from, Table* to) {
	push	r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi	# from, from
	push	rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rsi	# to, to
	push	rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
# src/table.c:116:     for (int i = 0; i < from->capacity; i++) {
	xor	ebx, ebx	# ivtmp.53
	jmp	.L75	#
	.p2align 4,,10
	.p2align 3
.L76:
# src/table.c:119:             tableSet(to, entry->key, entry->value);
	mov	rdx, QWORD PTR 8[rax]	# entry_12->value, entry_12->value
	mov	rdi, rbp	#, to
# src/table.c:116:     for (int i = 0; i < from->capacity; i++) {
	add	rbx, 1	# ivtmp.53,
# src/table.c:119:             tableSet(to, entry->key, entry->value);
	call	"tableSet"	#
# src/table.c:116:     for (int i = 0; i < from->capacity; i++) {
	mov	edx, DWORD PTR 4[r12]	# prephitmp_17, from_11(D)->capacity
# src/table.c:116:     for (int i = 0; i < from->capacity; i++) {
	cmp	edx, ebx	# prephitmp_17, ivtmp.53
	jle	.L65	#,
.L75:
	mov	rcx, QWORD PTR 16[r12]	# from_11(D)->entries, from_11(D)->entries
.L69:
# src/table.c:117:         Entry* entry = &from->entries[i];
	mov	rax, rbx	# _27, ivtmp.53
	sal	rax, 4	# _27,
	add	rax, rcx	# entry, from_11(D)->entries
# src/table.c:118:         if (entry->key != NULL) {
	mov	rsi, QWORD PTR [rax]	# _4, entry_12->key
# src/table.c:118:         if (entry->key != NULL) {
	test	rsi, rsi	# _4
	jne	.L76	#,
# src/table.c:116:     for (int i = 0; i < from->capacity; i++) {
	add	rbx, 1	# ivtmp.53,
	cmp	edx, ebx	# prephitmp_17, ivtmp.53
	jg	.L69	#,
.L65:
# src/table.c:122: }
	pop	rbx	#
	.cfi_def_cfa_offset 24
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L72:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret	
	.cfi_endproc
.LFE33:
	.size	"tableAddAll", .-"tableAddAll"
	.p2align 4
	.globl	"tableFindString"
	.type	"tableFindString", @function
"tableFindString":
.LFB34:
	.cfi_startproc
	sub	rsp, 88	#,
	.cfi_def_cfa_offset 96
# src/table.c:125:     if (table->count == 0) return NULL;
	mov	eax, DWORD PTR [rdi]	#, table_19(D)->count
# src/table.c:124: ObjString* tableFindString(Table* table, const char* chars, int length, uint32_t hash) {
	mov	QWORD PTR 48[rsp], rbp	#,
# src/table.c:125:     if (table->count == 0) return NULL;
	test	eax, eax	#
	.cfi_offset 6, -48
	je	.L83	#,
# src/table.c:127:     uint32_t index = hash & (table->capacity - 1);
	mov	eax, DWORD PTR 4[rdi]	# tmp142, table_19(D)->capacity
	mov	QWORD PTR 64[rsp], r13	#,
	mov	QWORD PTR 40[rsp], rbx	#,
	.cfi_offset 13, -32
	.cfi_offset 3, -56
	lea	r13d, -1[rax]	# _4,
# src/table.c:133:                    memcmp(entry->key->chars, chars, length) == 0) {
	movsxd	rax, edx	# _12, length
	mov	QWORD PTR 56[rsp], r12	#,
	.cfi_offset 12, -40
# src/table.c:131:             if (IS_NULL(entry->value)) return NULL;
	movabs	r12, 9222246136947933185	# tmp131,
# src/table.c:127:     uint32_t index = hash & (table->capacity - 1);
	mov	ebx, r13d	# index, _4
	mov	QWORD PTR 72[rsp], r14	#,
	.cfi_offset 14, -24
# src/table.c:129:         Entry* entry = &table->entries[index];
	mov	r14, QWORD PTR 16[rdi]	# _5, table_19(D)->entries
	mov	QWORD PTR 80[rsp], r15	#,
	.cfi_offset 15, -16
# src/table.c:127:     uint32_t index = hash & (table->capacity - 1);
	and	ebx, ecx	# index, hash
	mov	r15d, edx	# length, length
	mov	QWORD PTR 24[rsp], rsi	# %sfp, chars
# src/table.c:133:                    memcmp(entry->key->chars, chars, length) == 0) {
	mov	QWORD PTR 16[rsp], rax	# %sfp, _12
	jmp	.L82	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L79:
# src/table.c:132:         } else if (entry->key->length == length && entry->key->hash == hash &&
	cmp	DWORD PTR 16[rbp], r15d	# _8->length, length
	je	.L89	#,
.L81:
# src/table.c:137:         index = (index + 1) & (table->capacity - 1);
	add	ebx, 1	# _15,
# src/table.c:137:         index = (index + 1) & (table->capacity - 1);
	and	ebx, r13d	# index, _4
.L82:
# src/table.c:129:         Entry* entry = &table->entries[index];
	mov	eax, ebx	# _6, index
	sal	rax, 4	# _7,
# src/table.c:129:         Entry* entry = &table->entries[index];
	add	rax, r14	# entry, _5
# src/table.c:130:         if (entry->key == NULL) {
	mov	rbp, QWORD PTR [rax]	# <retval>, entry_22->key
# src/table.c:130:         if (entry->key == NULL) {
	test	rbp, rbp	# <retval>
	jne	.L79	#,
# src/table.c:131:             if (IS_NULL(entry->value)) return NULL;
	cmp	QWORD PTR 8[rax], r12	# entry_22->value, tmp131
	jne	.L81	#,
.L88:
# src/table.c:139: }
	mov	rax, rbp	#, <retval>
	mov	rbx, QWORD PTR 40[rsp]	#,
	.cfi_remember_state
	.cfi_restore 3
	mov	r12, QWORD PTR 56[rsp]	#,
	.cfi_restore 12
	mov	r13, QWORD PTR 64[rsp]	#,
	.cfi_restore 13
	mov	r14, QWORD PTR 72[rsp]	#,
	.cfi_restore 14
	mov	r15, QWORD PTR 80[rsp]	#,
	.cfi_restore 15
	mov	rbp, QWORD PTR 48[rsp]	#,
	add	rsp, 88	#,
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L89:
	.cfi_restore_state
# src/table.c:132:         } else if (entry->key->length == length && entry->key->hash == hash &&
	cmp	DWORD PTR 32[rbp], ecx	# _8->hash, hash
	jne	.L81	#,
# src/table.c:133:                    memcmp(entry->key->chars, chars, length) == 0) {
	mov	rdi, QWORD PTR 24[rbp]	# _8->chars, _8->chars
	mov	rdx, QWORD PTR 16[rsp]	#, %sfp
	mov	DWORD PTR 12[rsp], ecx	# %sfp, hash
	mov	rsi, QWORD PTR 24[rsp]	#, %sfp
	call	"memcmp"@PLT	#
# src/table.c:132:         } else if (entry->key->length == length && entry->key->hash == hash &&
	mov	ecx, DWORD PTR 12[rsp]	# hash, %sfp
	test	eax, eax	# tmp136
	jne	.L81	#,
	jmp	.L88	#
.L83:
	.cfi_restore 3
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
# src/table.c:125:     if (table->count == 0) return NULL;
	xor	ebp, ebp	# <retval>
# src/table.c:139: }
	mov	rax, rbp	#, <retval>
	mov	rbp, QWORD PTR 48[rsp]	#,
	add	rsp, 88	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE34:
	.size	"tableFindString", .-"tableFindString"
	.p2align 4
	.globl	"tableRemoveWhite"
	.type	"tableRemoveWhite", @function
"tableRemoveWhite":
.LFB35:
	.cfi_startproc
	mov	r10, rdi	# table, table
# src/table.c:142:     for (int i = 0; i < table->capacity; i++) {
	mov	edi, DWORD PTR 4[rdi]	# _34, table_11(D)->capacity
# src/table.c:142:     for (int i = 0; i < table->capacity; i++) {
	test	edi, edi	# _34
	jle	.L106	#,
# src/table.c:143:         Entry* entry = &table->entries[i];
	mov	r8, QWORD PTR 16[r10]	# _1, table_11(D)->entries
	mov	r9d, edi	# _76, _34
# src/table.c:141: void tableRemoveWhite(Table* table) {
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/table.c:100:     uint32_t index = key->hash & (table->capacity - 1);
	sub	edi, 1	# _19,
	sal	r9, 4	# _75,
# src/table.c:141: void tableRemoveWhite(Table* table) {
	push	rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
# src/table.c:110:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	movabs	rbx, 9222246136947933185	# tmp138,
	mov	rsi, r8	# ivtmp.67, _1
	add	r9, r8	# _73, _1
	jmp	.L96	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L92:
# src/table.c:142:     for (int i = 0; i < table->capacity; i++) {
	add	rsi, 16	# ivtmp.67,
	cmp	r9, rsi	# _73, ivtmp.67
	je	.L112	#,
.L96:
# src/table.c:144:         if (entry->key != NULL && !entry->key->obj.isMarked) {
	mov	rcx, QWORD PTR [rsi]	# _4, MEM[(struct ObjString * *)_80]
# src/table.c:144:         if (entry->key != NULL && !entry->key->obj.isMarked) {
	test	rcx, rcx	# _4
	je	.L92	#,
# src/table.c:144:         if (entry->key != NULL && !entry->key->obj.isMarked) {
	cmp	BYTE PTR 4[rcx], 0	# _4->obj.isMarked,
	jne	.L92	#,
# src/table.c:98:     if (table->count == 0) return false;
	mov	r11d, DWORD PTR [r10]	# _15, table_11(D)->count
# src/table.c:98:     if (table->count == 0) return false;
	test	r11d, r11d	# _15
	je	.L92	#,
# src/table.c:100:     uint32_t index = key->hash & (table->capacity - 1);
	mov	edx, DWORD PTR 32[rcx]	# index, _4->hash
	and	edx, edi	# index, _19
	jmp	.L110	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L94:
# src/table.c:111:         index = (index + 1) & (table->capacity - 1);
	add	edx, 1	# _31,
# src/table.c:111:         index = (index + 1) & (table->capacity - 1);
	and	edx, edi	# index, _19
.L110:
# src/table.c:102:         Entry* entry = &table->entries[index];
	mov	eax, edx	# _13, index
	sal	rax, 4	# _39,
# src/table.c:102:         Entry* entry = &table->entries[index];
	add	rax, r8	# entry, _1
# src/table.c:103:         if (entry->key == key) {
	mov	rbp, QWORD PTR [rax]	# _26,* entry
# src/table.c:103:         if (entry->key == key) {
	cmp	rcx, rbp	# _4, _26
	je	.L113	#,
# src/table.c:110:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	test	rbp, rbp	# _26
	jne	.L94	#,
# src/table.c:110:         if (entry->key == NULL && IS_NULL(entry->value)) return false;
	cmp	QWORD PTR 8[rax], rbx	# entry_48->value, tmp138
	jne	.L94	#,
# src/table.c:142:     for (int i = 0; i < table->capacity; i++) {
	add	rsi, 16	# ivtmp.67,
	cmp	r9, rsi	# _73, ivtmp.67
	jne	.L96	#,
.L112:
# src/table.c:148: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbp	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L113:
	.cfi_restore_state
# src/table.c:105:             entry->value = BOOL_VAL(true);
	movabs	rcx, 9222246136947933187	# tmp144,
# src/table.c:107:             table->count--;  // ← you're also missing this
	sub	r11d, 1	# tmp131,
# src/table.c:104:             entry->key = NULL;
	mov	QWORD PTR [rax], 0	# entry_47->key,
# src/table.c:105:             entry->value = BOOL_VAL(true);
	mov	QWORD PTR 8[rax], rcx	# entry_47->value, tmp144
# src/table.c:106:             table->tombstones++;
	add	DWORD PTR 8[r10], 1	# table_11(D)->tombstones,
# src/table.c:107:             table->count--;  // ← you're also missing this
	mov	DWORD PTR [r10], r11d	# table_11(D)->count, tmp131
# src/table.c:108:             return true;
	jmp	.L92	#
.L106:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	ret	
	.cfi_endproc
.LFE35:
	.size	"tableRemoveWhite", .-"tableRemoveWhite"
	.p2align 4
	.globl	"markTable"
	.type	"markTable", @function
"markTable":
.LFB36:
	.cfi_startproc
# src/table.c:151:     for (int i = 0; i < table->capacity; i++) {
	mov	eax, DWORD PTR 4[rdi]	# prephitmp_17, table_11(D)->capacity
# src/table.c:151:     for (int i = 0; i < table->capacity; i++) {
	test	eax, eax	# prephitmp_17
	jle	.L121	#,
# src/table.c:150: void markTable(Table* table) {
	push	r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi	# table, table
	push	rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
# src/table.c:151:     for (int i = 0; i < table->capacity; i++) {
	xor	ebp, ebp	# ivtmp.74
# src/table.c:150: void markTable(Table* table) {
	push	rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	jmp	.L124	#
	.p2align 4,,10
	.p2align 3
.L125:
# src/table.c:154:         markObject((Obj*) entry->key);
	call	"markObject"@PLT	#
# src/table.c:155:         markValue(entry->value);
	mov	rdi, QWORD PTR 8[rbx]	# entry_12->value, entry_12->value
# src/table.c:151:     for (int i = 0; i < table->capacity; i++) {
	add	rbp, 1	# ivtmp.74,
# src/table.c:155:         markValue(entry->value);
	call	"markValue"@PLT	#
# src/table.c:151:     for (int i = 0; i < table->capacity; i++) {
	mov	eax, DWORD PTR 4[r12]	# prephitmp_17, table_11(D)->capacity
# src/table.c:151:     for (int i = 0; i < table->capacity; i++) {
	cmp	eax, ebp	# prephitmp_17, ivtmp.74
	jle	.L114	#,
.L124:
	mov	rdx, QWORD PTR 16[r12]	# table_11(D)->entries, table_11(D)->entries
.L118:
# src/table.c:152:         Entry* entry = &table->entries[i];
	mov	rbx, rbp	# _27, ivtmp.74
	sal	rbx, 4	# _27,
	add	rbx, rdx	# entry, table_11(D)->entries
# src/table.c:153:         if (entry->key == NULL) continue;
	mov	rdi, QWORD PTR [rbx]	# _4, entry_12->key
# src/table.c:153:         if (entry->key == NULL) continue;
	test	rdi, rdi	# _4
	jne	.L125	#,
# src/table.c:151:     for (int i = 0; i < table->capacity; i++) {
	add	rbp, 1	# ivtmp.74,
	cmp	eax, ebp	# prephitmp_17, ivtmp.74
	jg	.L118	#,
.L114:
# src/table.c:157: }
	pop	rbx	#
	.cfi_def_cfa_offset 24
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L121:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret	
	.cfi_endproc
.LFE36:
	.size	"markTable", .-"markTable"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-858993459
	.long	1071959244
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
