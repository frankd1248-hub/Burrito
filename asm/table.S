	.file	"table.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=4096 -mtune=arrowlake-s -masm=intel -O3
	.text
	.p2align 4
	.globl	initTable
	.type	initTable, @function
initTable:
.LFB12:
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
.LFE12:
	.size	initTable, .-initTable
	.p2align 4
	.globl	freeTable
	.type	freeTable, @function
freeTable:
.LFB13:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/table.c:18: void freeTable(Table* table) {
	mov	rbx, rdi	# table, table
# src/table.c:19:     FREE_ARRAY(Entry, table->entries, table->capacity);
	xor	edx, edx	#
	movsxd	rax, DWORD PTR 4[rdi]	# _2, table_6(D)->capacity
	mov	rdi, QWORD PTR 16[rdi]	# table_6(D)->entries, table_6(D)->entries
	lea	rsi, [rax+rax*2]	# _3,
	sal	rsi, 3	# tmp108,
	call	reallocate@PLT	#
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
.LFE13:
	.size	freeTable, .-freeTable
	.p2align 4
	.globl	tableGet
	.type	tableGet, @function
tableGet:
.LFB15:
	.cfi_startproc
# src/table.c:44:     if (table->count == 0) return false;
	mov	ecx, DWORD PTR [rdi]	#, table_8(D)->count
# src/table.c:43: bool tableGet(Table* table, ObjString* key, Value* value) {
	mov	r10, rdx	# value, value
# src/table.c:44:     if (table->count == 0) return false;
	xor	edx, edx	# <retval>
# src/table.c:44:     if (table->count == 0) return false;
	test	ecx, ecx	#
# src/table.c:43: bool tableGet(Table* table, ObjString* key, Value* value) {
	mov	rax, rdi	# table, table
	mov	r9, rsi	# key, key
# src/table.c:44:     if (table->count == 0) return false;
	je	.L5	#,
# src/table.c:24:     uint32_t index = key->hash % capacity;
	mov	esi, DWORD PTR 4[rax]	# capacity.0_13, table_8(D)->capacity
# src/table.c:24:     uint32_t index = key->hash % capacity;
	mov	eax, DWORD PTR 32[r9]	# key_9(D)->hash, key_9(D)->hash
	xor	edx, edx	# index
	div	esi	# capacity.0_13
# src/table.c:46:     Entry* entry = findEntry(table->entries, table->capacity, key);
	mov	rdi, QWORD PTR 16[rdi]	# _3, table_8(D)->entries
# src/table.c:25:     Entry* tombstone = NULL;
	xor	r8d, r8d	# tombstone
	jmp	.L12	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L7:
# src/table.c:35:         } else if (entry->key == key) {
	cmp	r9, rax	# key, _19
	je	.L11	#,
.L10:
# src/table.c:39:         index = (index + 1) % capacity;
	lea	eax, 1[rdx]	# _22,
# src/table.c:39:         index = (index + 1) % capacity;
	xor	edx, edx	# index
	div	esi	# capacity.0_13
.L12:
# src/table.c:28:         Entry* entry = &entries[index];
	mov	eax, edx	# _16, index
	lea	rax, [rax+rax*2]	# _17,
# src/table.c:28:         Entry* entry = &entries[index];
	lea	rcx, [rdi+rax*8]	# entry,
# src/table.c:29:         if (entry->key == NULL) {
	mov	rax, QWORD PTR [rcx]	# _19, entry_18->key
# src/table.c:29:         if (entry->key == NULL) {
	test	rax, rax	# _19
	jne	.L7	#,
# src/table.c:30:             if (IS_NULL(entry->value)) {
	cmp	DWORD PTR 8[rcx], 1	# entry_18->value.type,
	je	.L16	#,
# src/table.c:33:                 if (tombstone == NULL) tombstone = entry;
	test	r8, r8	# tombstone
	cmove	r8, rcx	# tombstone,, tombstone, entry
	jmp	.L10	#
	.p2align 4,,10
	.p2align 3
.L16:
# src/table.c:44:     if (table->count == 0) return false;
	xor	edx, edx	# <retval>
# src/table.c:31:                 return tombstone != NULL ? tombstone : entry;
	test	r8, r8	# tombstone
	je	.L5	#,
# src/table.c:47:     if (entry->key == NULL) return false;
	cmp	QWORD PTR [r8], 0	# tombstone_21->key,
	je	.L5	#,
	mov	rcx, r8	# entry, tombstone
	.p2align 4,,10
	.p2align 3
.L11:
# src/table.c:49:     *value = entry->value;
	vmovdqu	xmm0, XMMWORD PTR 8[rcx]	# _41->value, _41->value
# src/table.c:50:     return true;
	mov	edx, 1	# <retval>,
# src/table.c:49:     *value = entry->value;
	vmovdqu	XMMWORD PTR [r10], xmm0	# *value_11(D), _41->value
.L5:
# src/table.c:51: }
	mov	eax, edx	#, <retval>
	ret	
	.cfi_endproc
.LFE15:
	.size	tableGet, .-tableGet
	.p2align 4
	.globl	tableSet
	.type	tableSet, @function
tableSet:
.LFB17:
	.cfi_startproc
	push	r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	vxorps	xmm0, xmm0, xmm0	# tmp219
	mov	r15, rcx	# value, value
	push	r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	mov	r14, rdx	# value, value
	push	r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	mov	r13, rdi	# table, table
	push	r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	mov	r12, rsi	# key, key
	push	rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 80
# src/table.c:78:     if (table->count + table->tombstones + 1 > table->capacity * TABLE_MAX_LOAD) {
	mov	eax, DWORD PTR 8[rdi]	# table_21(D)->tombstones, table_21(D)->tombstones
# src/table.c:78:     if (table->count + table->tombstones + 1 > table->capacity * TABLE_MAX_LOAD) {
	mov	ebx, DWORD PTR 4[rdi]	# _6, table_21(D)->capacity
# src/table.c:78:     if (table->count + table->tombstones + 1 > table->capacity * TABLE_MAX_LOAD) {
	add	eax, DWORD PTR [rdi]	# _3, table_21(D)->count
# src/table.c:78:     if (table->count + table->tombstones + 1 > table->capacity * TABLE_MAX_LOAD) {
	add	eax, 1	# _4,
# src/table.c:78:     if (table->count + table->tombstones + 1 > table->capacity * TABLE_MAX_LOAD) {
	vcvtsi2sd	xmm1, xmm0, eax	# tmp220, tmp219, _4
# src/table.c:78:     if (table->count + table->tombstones + 1 > table->capacity * TABLE_MAX_LOAD) {
	vcvtsi2sd	xmm0, xmm0, ebx	# tmp221, tmp219, _6
	vmulsd	xmm0, xmm0, QWORD PTR .LC0[rip]	# _8, _7,
# src/table.c:78:     if (table->count + table->tombstones + 1 > table->capacity * TABLE_MAX_LOAD) {
	vcomisd	xmm1, xmm0	# _5, _8
	ja	.L18	#,
# src/table.c:83:     Entry* entry = findEntry(table->entries, table->capacity, key);
	mov	r8, QWORD PTR 16[rdi]	# entries, table_21(D)->entries
.L19:
# src/table.c:24:     uint32_t index = key->hash % capacity;
	mov	eax, DWORD PTR 32[r12]	# key_24(D)->hash, key_24(D)->hash
	xor	edx, edx	# index
	div	ebx	# _177
# src/table.c:25:     Entry* tombstone = NULL;
	xor	esi, esi	# tombstone
	jmp	.L38	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L32:
# src/table.c:35:         } else if (entry->key == key) {
	cmp	r12, rcx	# key, _37
	je	.L54	#,
.L36:
# src/table.c:39:         index = (index + 1) % capacity;
	lea	eax, 1[rdx]	# _40,
# src/table.c:39:         index = (index + 1) % capacity;
	xor	edx, edx	# index
	div	ebx	# _177
.L38:
# src/table.c:28:         Entry* entry = &entries[index];
	mov	eax, edx	# _34, index
	lea	rax, [rax+rax*2]	# _35,
# src/table.c:28:         Entry* entry = &entries[index];
	lea	rax, [r8+rax*8]	# entry,
# src/table.c:29:         if (entry->key == NULL) {
	mov	rcx, QWORD PTR [rax]	# _37, entry_36->key
# src/table.c:29:         if (entry->key == NULL) {
	test	rcx, rcx	# _37
	jne	.L32	#,
# src/table.c:30:             if (IS_NULL(entry->value)) {
	cmp	DWORD PTR 8[rax], 1	# entry_36->value.type,
	je	.L55	#,
# src/table.c:33:                 if (tombstone == NULL) tombstone = entry;
	test	rsi, rsi	# tombstone
	cmove	rsi, rax	# tombstone,, tombstone, entry
	jmp	.L36	#
.L46:
	mov	rax, rsi	# entry, tombstone
	.p2align 4,,10
	.p2align 3
.L54:
	xor	edx, edx	# <retval>
.L37:
# src/table.c:88:     entry->key = key;
	mov	QWORD PTR [rax], r12	# _94->key, key
# src/table.c:89:     entry->value = value;
	mov	QWORD PTR 8[rax], r14	# _94->value, value
	mov	QWORD PTR 16[rax], r15	# _94->value, value
# src/table.c:91: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	eax, edx	#, <retval>
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
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
# src/table.c:79:         int capacity = GROW_CAPACITY(table->capacity);
	cmp	ebx, 7	# _6,
	jg	.L56	#,
	mov	ebx, 8	# _177,
	mov	edx, 192	# _149,
# src/table.c:79:         int capacity = GROW_CAPACITY(table->capacity);
	mov	ebp, 8	# capacity,
	mov	ecx, 8	# _155,
.L20:
# src/table.c:54:     Entry* entries = ALLOCATE(Entry, capacity);
	xor	esi, esi	#
	xor	edi, edi	#
	mov	QWORD PTR [rsp], rcx	# %sfp, _155
	call	reallocate@PLT	#
	mov	rcx, QWORD PTR [rsp]	# _155, %sfp
	mov	r8, rax	# entries, entries
	lea	rdx, [rcx+rcx*2]	# _154,
	lea	rdx, [rax+rdx*8]	# _146,
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L21:
# src/table.c:57:         entries[i].value = NULL_VAL;
	vpxor	xmm0, xmm0, xmm0	# tmp213
	vmovdqu	XMMWORD PTR 8[rax], xmm0	# _50->value, tmp213
# src/table.c:56:         entries[i].key = NULL;
	mov	QWORD PTR [rax], 0	# MEM[(struct ObjString * *)_50],
# src/table.c:57:         entries[i].value = NULL_VAL;
	mov	DWORD PTR 8[rax], 1	# MEM[(<unnamed type> *)_50 + 8B],
# src/table.c:55:     for (int i = 0; i < capacity; i++) {
	add	rax, 24	# ivtmp.39,
	cmp	rdx, rax	# _146, ivtmp.39
	jne	.L21	#,
# src/table.c:62:     for (int i = 0; i < table->capacity; i++) {
	movsxd	r10, DWORD PTR 4[r13]	#, table_21(D)->capacity
# src/table.c:60:     table->count = 0;
	mov	DWORD PTR 0[r13], 0	# table_21(D)->count,
# src/table.c:62:     for (int i = 0; i < table->capacity; i++) {
	test	r10d, r10d	# _95
# src/table.c:61:     table->tombstones = 0;
	mov	DWORD PTR 8[r13], 0	# table_21(D)->tombstones,
# src/table.c:72:     FREE_ARRAY(Entry, table->entries, table->capacity);
	mov	rcx, QWORD PTR 16[r13]	# pretmp_190, table_21(D)->entries
# src/table.c:62:     for (int i = 0; i < table->capacity; i++) {
	jle	.L31	#,
	mov	QWORD PTR [rsp], r14	# %sfp, value
	mov	QWORD PTR 8[rsp], r15	# %sfp, value
	lea	rax, [r10+r10*2]	# _163,
	mov	rdi, rcx	# ivtmp.31, pretmp_190
	lea	r9, [rcx+rax*8]	# _161,
	.p2align 4,,10
	.p2align 3
.L30:
# src/table.c:64:         if (entry->key == NULL) continue;
	mov	rsi, QWORD PTR [rdi]	# _57, MEM[(struct ObjString * *)_165]
# src/table.c:64:         if (entry->key == NULL) continue;
	test	rsi, rsi	# _57
	je	.L23	#,
# src/table.c:24:     uint32_t index = key->hash % capacity;
	mov	eax, DWORD PTR 32[rsi]	# _57->hash, _57->hash
	xor	edx, edx	# index
	div	ebx	# _177
# src/table.c:25:     Entry* tombstone = NULL;
	xor	r11d, r11d	# tombstone
	jmp	.L29	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L24:
# src/table.c:35:         } else if (entry->key == key) {
	cmp	rsi, rax	# _57, _65
	je	.L52	#,
.L28:
# src/table.c:39:         index = (index + 1) % capacity;
	lea	eax, 1[rdx]	# _68,
# src/table.c:39:         index = (index + 1) % capacity;
	xor	edx, edx	# index
	div	ebx	# _177
.L29:
# src/table.c:28:         Entry* entry = &entries[index];
	mov	eax, edx	# _62, index
	lea	rax, [rax+rax*2]	# _63,
# src/table.c:28:         Entry* entry = &entries[index];
	lea	r15, [r8+rax*8]	# entry,
# src/table.c:29:         if (entry->key == NULL) {
	mov	rax, QWORD PTR [r15]	# _65, entry_64->key
# src/table.c:29:         if (entry->key == NULL) {
	test	rax, rax	# _65
	jne	.L24	#,
# src/table.c:30:             if (IS_NULL(entry->value)) {
	cmp	DWORD PTR 8[r15], 1	# entry_64->value.type,
	je	.L57	#,
# src/table.c:33:                 if (tombstone == NULL) tombstone = entry;
	test	r11, r11	# tombstone
	cmove	r11, r15	# tombstone,, tombstone, entry
	jmp	.L28	#
.L56:
# src/table.c:79:         int capacity = GROW_CAPACITY(table->capacity);
	lea	ebp, [rbx+rbx]	# capacity,
# src/table.c:54:     Entry* entries = ALLOCATE(Entry, capacity);
	movsxd	rcx, ebp	# _155, capacity
	lea	rdx, [rcx+rcx*2]	# _149,
	sal	rdx, 3	# _149,
# src/table.c:24:     uint32_t index = key->hash % capacity;
	mov	ebx, ebp	# _177, capacity
	jmp	.L20	#
	.p2align 4,,10
	.p2align 3
.L52:
	mov	rax, r15	# entry, entry
.L26:
# src/table.c:68:         dest->value = entry->value;
	vmovdqu	xmm0, XMMWORD PTR 8[rdi]	# MEM[(struct  *)_165 + 8B], MEM[(struct  *)_165 + 8B]
# src/table.c:67:         dest->key = entry->key;
	mov	QWORD PTR [rax], rsi	# _70->key, _57
# src/table.c:68:         dest->value = entry->value;
	vmovdqu	XMMWORD PTR 8[rax], xmm0	# _70->value, MEM[(struct  *)_165 + 8B]
# src/table.c:69:         table->count++;
	add	DWORD PTR 0[r13], 1	# table_21(D)->count,
.L23:
# src/table.c:62:     for (int i = 0; i < table->capacity; i++) {
	add	rdi, 24	# ivtmp.31,
	cmp	r9, rdi	# _161, ivtmp.31
	jne	.L30	#,
	mov	r14, QWORD PTR [rsp]	# value, %sfp
	mov	r15, QWORD PTR 8[rsp]	# value, %sfp
.L31:
# src/table.c:72:     FREE_ARRAY(Entry, table->entries, table->capacity);
	lea	rsi, [r10+r10*2]	# _76,
	sal	rsi, 3	# tmp181,
	xor	edx, edx	#
	mov	rdi, rcx	#, pretmp_190
	mov	QWORD PTR [rsp], r8	# %sfp, entries
	call	reallocate@PLT	#
# src/table.c:73:     table->entries = entries;
	mov	r8, QWORD PTR [rsp]	# entries, %sfp
# src/table.c:74:     table->capacity = capacity;
	mov	DWORD PTR 4[r13], ebp	# table_21(D)->capacity, capacity
# src/table.c:73:     table->entries = entries;
	mov	QWORD PTR 16[r13], r8	# table_21(D)->entries, entries
# src/table.c:75: }
	jmp	.L19	#
	.p2align 4,,10
	.p2align 3
.L57:
# src/table.c:31:                 return tombstone != NULL ? tombstone : entry;
	mov	rax, r15	# entry, entry
	test	r11, r11	# tombstone
	cmovne	rax, r11	# entry,, entry, tombstone
	jmp	.L26	#
.L55:
# src/table.c:31:                 return tombstone != NULL ? tombstone : entry;
	test	rsi, rsi	# tombstone
	je	.L35	#,
# src/table.c:85:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	cmp	QWORD PTR [rsi], 0	# tombstone_39->key,
	jne	.L46	#,
# src/table.c:85:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	cmp	DWORD PTR 8[rsi], 1	# tombstone_39->value.type,
	je	.L58	#,
# src/table.c:86:     else if (isNewKey) table->tombstones--;
	sub	DWORD PTR 8[r13], 1	# table_21(D)->tombstones,
	mov	rax, rsi	# entry, tombstone
.L40:
	mov	edx, 1	# <retval>,
	jmp	.L37	#
.L58:
	mov	rax, rsi	# entry, tombstone
.L35:
# src/table.c:85:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	add	DWORD PTR 0[r13], 1	# table_21(D)->count,
# src/table.c:85:     if (isNewKey && IS_NULL(entry->value)) table->count++;
	jmp	.L40	#
	.cfi_endproc
.LFE17:
	.size	tableSet, .-tableSet
	.p2align 4
	.globl	tableDelete
	.type	tableDelete, @function
tableDelete:
.LFB18:
	.cfi_startproc
# src/table.c:94:     if (table->count == 0) return false;
	mov	edx, DWORD PTR [rdi]	#, table_10(D)->count
# src/table.c:94:     if (table->count == 0) return false;
	xor	eax, eax	# <retval>
# src/table.c:94:     if (table->count == 0) return false;
	test	edx, edx	#
# src/table.c:93: bool tableDelete(Table* table, ObjString* key) {
	mov	r10, rdi	# table, table
	mov	r9, rsi	# key, key
# src/table.c:94:     if (table->count == 0) return false;
	je	.L59	#,
# src/table.c:24:     uint32_t index = key->hash % capacity;
	mov	esi, DWORD PTR 4[r10]	# capacity.0_17, table_10(D)->capacity
# src/table.c:24:     uint32_t index = key->hash % capacity;
	mov	eax, DWORD PTR 32[r9]	# key_11(D)->hash, key_11(D)->hash
	xor	edx, edx	# index
	div	esi	# capacity.0_17
# src/table.c:96:     Entry* entry = findEntry(table->entries, table->capacity, key);
	mov	rdi, QWORD PTR 16[rdi]	# _3, table_10(D)->entries
# src/table.c:25:     Entry* tombstone = NULL;
	xor	r8d, r8d	# tombstone
	jmp	.L66	#
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L61:
# src/table.c:35:         } else if (entry->key == key) {
	cmp	r9, rcx	# key, _23
	je	.L65	#,
.L64:
# src/table.c:39:         index = (index + 1) % capacity;
	lea	eax, 1[rdx]	# _26,
# src/table.c:39:         index = (index + 1) % capacity;
	xor	edx, edx	# index
	div	esi	# capacity.0_17
.L66:
# src/table.c:28:         Entry* entry = &entries[index];
	mov	eax, edx	# _20, index
	lea	rax, [rax+rax*2]	# _21,
# src/table.c:28:         Entry* entry = &entries[index];
	lea	rax, [rdi+rax*8]	# entry,
# src/table.c:29:         if (entry->key == NULL) {
	mov	rcx, QWORD PTR [rax]	# _23, entry_22->key
# src/table.c:29:         if (entry->key == NULL) {
	test	rcx, rcx	# _23
	jne	.L61	#,
# src/table.c:30:             if (IS_NULL(entry->value)) {
	cmp	DWORD PTR 8[rax], 1	# entry_22->value.type,
	je	.L70	#,
# src/table.c:33:                 if (tombstone == NULL) tombstone = entry;
	test	r8, r8	# tombstone
	cmove	r8, rax	# tombstone,, tombstone, entry
	jmp	.L64	#
	.p2align 4,,10
	.p2align 3
.L70:
# src/table.c:94:     if (table->count == 0) return false;
	xor	eax, eax	# <retval>
# src/table.c:31:                 return tombstone != NULL ? tombstone : entry;
	test	r8, r8	# tombstone
	je	.L71	#,
# src/table.c:97:     if (entry->key == NULL) return false;
	cmp	QWORD PTR [r8], 0	# tombstone_25->key,
	je	.L59	#,
	mov	rax, r8	# entry, tombstone
	.p2align 4,,10
	.p2align 3
.L65:
# src/table.c:100:     entry->value = BOOL_VAL(true);
	vpxor	xmm0, xmm0, xmm0	# tmp128
	vmovdqu	XMMWORD PTR 8[rax], xmm0	# _46->value, tmp128
# src/table.c:99:     entry->key = NULL;
	mov	QWORD PTR [rax], 0	# _46->key,
# src/table.c:100:     entry->value = BOOL_VAL(true);
	mov	BYTE PTR 16[rax], 1	# _46->value.as.boolean,
# src/table.c:101:     table->tombstones++;
	add	DWORD PTR 8[r10], 1	# table_10(D)->tombstones,
# src/table.c:102:     return true;
	mov	eax, 1	# <retval>,
.L59:
# src/table.c:103: }
	ret	
.L71:
	ret	
	.cfi_endproc
.LFE18:
	.size	tableDelete, .-tableDelete
	.p2align 4
	.globl	tableAddAll
	.type	tableAddAll, @function
tableAddAll:
.LFB19:
	.cfi_startproc
# src/table.c:106:     for (int i = 0; i < from->capacity; i++) {
	mov	edx, DWORD PTR 4[rdi]	# prephitmp_16, from_10(D)->capacity
# src/table.c:106:     for (int i = 0; i < from->capacity; i++) {
	test	edx, edx	# prephitmp_16
	jle	.L81	#,
# src/table.c:105: void tableAddAll(Table* from, Table* to) {
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
# src/table.c:106:     for (int i = 0; i < from->capacity; i++) {
	xor	ebx, ebx	# ivtmp.51
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L85:
# src/table.c:109:             tableSet(to, entry->key, entry->value);
	mov	edx, DWORD PTR 8[rax]	# entry_11->value, entry_11->value
	mov	rcx, QWORD PTR 16[rax]	# entry_11->value, entry_11->value
	mov	rdi, rbp	#, to
	call	tableSet	#
# src/table.c:106:     for (int i = 0; i < from->capacity; i++) {
	mov	edx, DWORD PTR 4[r12]	# prephitmp_16, from_10(D)->capacity
# src/table.c:106:     for (int i = 0; i < from->capacity; i++) {
	add	rbx, 1	# ivtmp.51,
	cmp	edx, ebx	# prephitmp_16, ivtmp.51
	jle	.L79	#,
.L84:
	mov	rcx, QWORD PTR 16[r12]	# from_10(D)->entries, from_10(D)->entries
.L73:
# src/table.c:107:         Entry* entry = &from->entries[i];
	lea	rax, [rbx+rbx*2]	# _26,
	lea	rax, [rcx+rax*8]	# entry,
# src/table.c:108:         if (entry->key != NULL) {
	mov	rsi, QWORD PTR [rax]	# _4, entry_11->key
# src/table.c:108:         if (entry->key != NULL) {
	test	rsi, rsi	# _4
	jne	.L85	#,
# src/table.c:106:     for (int i = 0; i < from->capacity; i++) {
	add	rbx, 1	# ivtmp.51,
	cmp	edx, ebx	# prephitmp_16, ivtmp.51
	jg	.L73	#,
.L79:
# src/table.c:112: }
	pop	rbx	#
	.cfi_def_cfa_offset 24
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret	
	.cfi_endproc
.LFE19:
	.size	tableAddAll, .-tableAddAll
	.p2align 4
	.globl	tableFindString
	.type	tableFindString, @function
tableFindString:
.LFB20:
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
	push	rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24	#,
	.cfi_def_cfa_offset 80
# src/table.c:115:     if (table->count == 0) return NULL;
	mov	eax, DWORD PTR [rdi]	#, table_18(D)->count
	test	eax, eax	#
	je	.L91	#,
# src/table.c:117:     uint32_t index = hash % table->capacity;
	mov	r14d, DWORD PTR 4[rdi]	# _3, table_18(D)->capacity
	mov	ebp, edx	# length, length
# src/table.c:117:     uint32_t index = hash % table->capacity;
	mov	eax, ecx	# tmp119, hash
	xor	edx, edx	# index
	div	r14d	# _3
	mov	QWORD PTR 8[rsp], rsi	# %sfp, chars
# src/table.c:119:         Entry* entry = &table->entries[index];
	mov	r15, QWORD PTR 16[rdi]	# _4, table_18(D)->entries
# src/table.c:123:                    memcmp(entry->key->chars, chars, length) == 0) {
	movsxd	rax, ebp	# _11, length
	mov	QWORD PTR [rsp], rax	# %sfp, _11
	mov	r12d, ecx	# hash, hash
# src/table.c:117:     uint32_t index = hash % table->capacity;
	mov	r13d, edx	# index, index
	jmp	.L90	#
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L88:
# src/table.c:122:         } else if (entry->key->length == length && entry->key->hash == hash &&
	cmp	DWORD PTR 16[rbx], ebp	# _7->length, length
	je	.L96	#,
.L89:
# src/table.c:127:         index = (index + 1) % table->capacity;
	lea	eax, 1[r13]	# _14,
# src/table.c:127:         index = (index + 1) % table->capacity;
	xor	edx, edx	# index
	div	r14d	# _3
	mov	r13d, edx	# index, index
.L90:
# src/table.c:119:         Entry* entry = &table->entries[index];
	mov	edx, r13d	# _5, index
	lea	rax, [rdx+rdx*2]	# _6,
# src/table.c:119:         Entry* entry = &table->entries[index];
	lea	rax, [r15+rax*8]	# entry,
# src/table.c:120:         if (entry->key == NULL) {
	mov	rbx, QWORD PTR [rax]	# <retval>, entry_21->key
# src/table.c:120:         if (entry->key == NULL) {
	test	rbx, rbx	# <retval>
	jne	.L88	#,
# src/table.c:121:             if (IS_NULL(entry->value)) return NULL;
	cmp	DWORD PTR 8[rax], 1	# entry_21->value.type,
	jne	.L89	#,
.L86:
# src/table.c:129: }
	add	rsp, 24	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	rax, rbx	#, <retval>
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
	.p2align 4,,10
	.p2align 3
.L96:
	.cfi_restore_state
# src/table.c:122:         } else if (entry->key->length == length && entry->key->hash == hash &&
	cmp	DWORD PTR 32[rbx], r12d	# _7->hash, hash
	jne	.L89	#,
# src/table.c:123:                    memcmp(entry->key->chars, chars, length) == 0) {
	mov	rdi, QWORD PTR 24[rbx]	# _7->chars, _7->chars
	mov	rdx, QWORD PTR [rsp]	#, %sfp
	mov	rsi, QWORD PTR 8[rsp]	#, %sfp
	call	memcmp@PLT	#
# src/table.c:122:         } else if (entry->key->length == length && entry->key->hash == hash &&
	test	eax, eax	# tmp139
	jne	.L89	#,
	jmp	.L86	#
.L91:
# src/table.c:115:     if (table->count == 0) return NULL;
	xor	ebx, ebx	# <retval>
	jmp	.L86	#
	.cfi_endproc
.LFE20:
	.size	tableFindString, .-tableFindString
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-858993459
	.long	1071959244
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
