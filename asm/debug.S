	.file	"debug.c"
	.intel_syntax noprefix
# GNU C23 (GCC) version 15.2.1 20260209 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20260209, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# warning: MPC header version 1.3.1 differs from library version 1.4.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=arrowlake-s -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mpconfig -mpku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -muintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mavxvnniint16 -msm3 -msha512 -msm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=48 --param=l1-cache-line-size=64 --param=l2-cache-size=12288 -mtune=arrowlake-s -masm=intel -O3
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%06d "
.LC1:
	.string	"     | "
.LC2:
	.string	"%6d "
.LC3:
	.string	"OP_CONSTANT"
.LC4:
	.string	"%-16s %4d '"
.LC5:
	.string	"'"
.LC6:
	.string	"OP_CONSTANT_LONG"
.LC7:
	.string	"OP_NULL"
.LC8:
	.string	"OP_TRUE"
.LC9:
	.string	"OP_FALSE"
.LC10:
	.string	"OP_POP"
.LC11:
	.string	"OP_GET_LOCAL"
.LC12:
	.string	"%-16s %4d\n"
.LC13:
	.string	"OP_GET_LOCAL_LONG"
.LC14:
	.string	"OP_SET_LOCAL"
.LC15:
	.string	"OP_SET_LOCAL_LONG"
.LC16:
	.string	"OP_GET_GLOBAL"
.LC17:
	.string	"OP_GET_GLOBAL_LONG"
.LC18:
	.string	"OP_DEFINE_GLOBAL"
.LC19:
	.string	"OP_DEFINE_GLOBAL_LONG"
.LC20:
	.string	"OP_SET_GLOBAL"
.LC21:
	.string	"OP_SET_GLOBAL_LONG"
.LC22:
	.string	"OP_DEFINE_CONST"
.LC23:
	.string	"OP_DEFINE_CONST_LONG"
.LC24:
	.string	"OP_GET_PROPERTY"
.LC25:
	.string	"OP_GET_PROPERTY_LONG"
.LC26:
	.string	"OP_EQUAL"
.LC27:
	.string	"OP_GREATER"
.LC28:
	.string	"OP_LESS"
.LC29:
	.string	"OP_ADD"
.LC30:
	.string	"OP_SUBTRACT"
.LC31:
	.string	"OP_MULTIPLY"
.LC32:
	.string	"OP_DIVIDE"
.LC33:
	.string	"OP_NOT"
.LC34:
	.string	"OP_NEGATE"
.LC35:
	.string	"OP_PRINT"
.LC36:
	.string	"OP_JUMP"
.LC37:
	.string	"%-16s %4d -> %d\n"
.LC38:
	.string	"OP_JUMP_IF_FALSE"
.LC39:
	.string	"OP_LOOP"
.LC40:
	.string	"OP_CALL"
.LC41:
	.string	"OP_RETURN"
.LC42:
	.string	"Unknown opcode %d\n"
	.text
	.p2align 4
	.globl	dissassembleInstruction
	.type	dissassembleInstruction, @function
dissassembleInstruction:
.LFB18:
	.cfi_startproc
	push	r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
# src/debug.c:58:     printf("%06d ", offset);
	xor	eax, eax	#
# src/debug.c:57: int dissassembleInstruction(Chunk* chunk, int offset) {
	push	rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rdi	# chunk, chunk
# src/debug.c:58:     printf("%06d ", offset);
	lea	rdi, .LC0[rip]	#,
# src/debug.c:57: int dissassembleInstruction(Chunk* chunk, int offset) {
	push	rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
# src/debug.c:57: int dissassembleInstruction(Chunk* chunk, int offset) {
	mov	ebx, esi	# offset, offset
# src/debug.c:58:     printf("%06d ", offset);
	call	printf@PLT	#
# src/debug.c:59:     int line = getLine(chunk, offset);
	mov	esi, ebx	#, offset
	mov	rdi, rbp	#, chunk
	call	getLine@PLT	#
# src/debug.c:60:     if (offset > 0 && line == getLine(chunk, offset - 1)) {
	test	ebx, ebx	# offset
# src/debug.c:59:     int line = getLine(chunk, offset);
	mov	r12d, eax	# line,
# src/debug.c:60:     if (offset > 0 && line == getLine(chunk, offset - 1)) {
	jle	.L2	#,
# src/debug.c:60:     if (offset > 0 && line == getLine(chunk, offset - 1)) {
	lea	esi, -1[rbx]	# _1,
	mov	rdi, rbp	#, chunk
	call	getLine@PLT	#
# src/debug.c:60:     if (offset > 0 && line == getLine(chunk, offset - 1)) {
	cmp	eax, r12d	# _2, line
	je	.L46	#,
.L2:
# src/debug.c:63:         printf("%6d ", line);
	mov	esi, r12d	#, line
	lea	rdi, .LC2[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
.L3:
# src/debug.c:66:     uint8_t instruction = chunk->code[offset];
	mov	rdi, QWORD PTR 8[rbp]	# _3, chunk_14(D)->code
# src/debug.c:66:     uint8_t instruction = chunk->code[offset];
	movsxd	rcx, ebx	# _4, offset
# src/debug.c:66:     uint8_t instruction = chunk->code[offset];
	movzx	esi, BYTE PTR [rdi+rcx]	#, *_5
# src/debug.c:67:     switch(instruction) {
	cmp	sil, 35	# instruction,
	ja	.L4	#,
	lea	rdx, .L6[rip]	# tmp370,
	movzx	eax, sil	# instruction, instruction
	movsxd	rax, DWORD PTR [rdx+rax*4]	# tmp372,
	add	rax, rdx	# tmp373, tmp370
	jmp	rax	# tmp373
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L40-.L6
	.long	.L39-.L6
	.long	.L38-.L6
	.long	.L37-.L6
	.long	.L36-.L6
	.long	.L35-.L6
	.long	.L34-.L6
	.long	.L33-.L6
	.long	.L32-.L6
	.long	.L31-.L6
	.long	.L30-.L6
	.long	.L29-.L6
	.long	.L28-.L6
	.long	.L27-.L6
	.long	.L26-.L6
	.long	.L25-.L6
	.long	.L24-.L6
	.long	.L23-.L6
	.long	.L22-.L6
	.long	.L21-.L6
	.long	.L20-.L6
	.long	.L19-.L6
	.long	.L18-.L6
	.long	.L17-.L6
	.long	.L16-.L6
	.long	.L15-.L6
	.long	.L14-.L6
	.long	.L13-.L6
	.long	.L12-.L6
	.long	.L11-.L6
	.long	.L4-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
	.p2align 4,,10
	.p2align 3
.L46:
# src/debug.c:61:         printf("     | ");
	lea	rdi, .LC1[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
	jmp	.L3	#
	.p2align 4,,10
	.p2align 3
.L40:
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	movzx	edx, BYTE PTR 1[rdi+rcx]	#, *_113
# src/debug.c:15:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC3[rip]	#,
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	mov	r12, rdx	#,
	.p2align 4,,10
	.p2align 3
.L43:
# src/debug.c:15:     printf("%-16s %4d '", name, constant);
	lea	rdi, .LC4[rip]	#,
	xor	eax, eax	#
# src/debug.c:16:     printValue(chunk->constants.values[constant]);
	sal	r12, 4	# tmp433,
# src/debug.c:15:     printf("%-16s %4d '", name, constant);
	call	printf@PLT	#
# src/debug.c:16:     printValue(chunk->constants.values[constant]);
	add	r12, QWORD PTR 40[rbp]	# tmp434, chunk_14(D)->constants.values
	mov	edi, DWORD PTR [r12]	# *_194,
	mov	rsi, QWORD PTR 8[r12]	# *_194,
# src/debug.c:18:     return offset + 2;
	lea	ebp, 2[rbx]	# <retval>,
# src/debug.c:16:     printValue(chunk->constants.values[constant]);
	call	printValue@PLT	#
# src/debug.c:17:     printf("'\n");
	lea	rdi, .LC5[rip]	#,
	call	puts@PLT	#
.L1:
# src/debug.c:142: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	eax, ebp	#, <retval>
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC41[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:137:             return simpleInstruction("OP_RETURN", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L7:
# src/debug.c:38:     printf("%-16s %4d\n", name, slot);
	movzx	edx, BYTE PTR 1[rdi+rcx]	# _84, *_82
	lea	rsi, .LC40[rip]	#,
	lea	rdi, .LC12[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:39:     return offset + 2;
	lea	ebp, 2[rbx]	# <retval>,
# src/debug.c:135:             return byteInstruction("OP_CALL", chunk, offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L8:
# src/debug.c:51:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	movzx	edx, BYTE PTR 1[rdi+rcx]	# _397, *_395
# src/debug.c:52:     jump |= chunk->code[offset + 2];
	movzx	eax, BYTE PTR 2[rdi+rcx]	# _402, *_400
# src/debug.c:51:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	sal	edx, 8	# jump,
# src/debug.c:52:     jump |= chunk->code[offset + 2];
	or	eax, edx	# jump_403, jump
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	lea	ebp, 3[rbx]	# <retval>,
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	movzx	eax, ax	# _405, jump_403
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	mov	ecx, ebp	# _465, <retval>
	sub	ecx, eax	# _465, _405
	mov	edx, ebx	#, offset
	lea	rsi, .LC39[rip]	#,
	lea	rdi, .LC37[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:133:             return jumpInstruction("OP_LOOP", -1, chunk, offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L9:
# src/debug.c:51:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _381, *_379
# src/debug.c:52:     jump |= chunk->code[offset + 2];
	movzx	ecx, BYTE PTR 2[rdi+rcx]	# _386, *_384
# src/debug.c:51:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	sal	eax, 8	# jump,
# src/debug.c:52:     jump |= chunk->code[offset + 2];
	or	ecx, eax	# jump_387, jump
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	lea	ebp, 3[rbx]	# <retval>,
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	movzx	ecx, cx	# _389, jump_387
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	add	ecx, ebp	# _391, <retval>
	mov	edx, ebx	#, offset
	lea	rsi, .LC38[rip]	#,
	lea	rdi, .LC37[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:131:             return jumpInstruction("OP_JUMP_IF_FALSE", 1, chunk, offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L10:
# src/debug.c:51:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _365, *_363
# src/debug.c:52:     jump |= chunk->code[offset + 2];
	movzx	ecx, BYTE PTR 2[rdi+rcx]	# _370, *_368
# src/debug.c:51:     uint16_t jump = (uint16_t) (chunk->code[offset + 1] << 8);
	sal	eax, 8	# jump,
# src/debug.c:52:     jump |= chunk->code[offset + 2];
	or	ecx, eax	# jump_371, jump
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	lea	ebp, 3[rbx]	# <retval>,
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	movzx	ecx, cx	# _373, jump_371
# src/debug.c:53:     printf("%-16s %4d -> %d\n", name, offset, offset + 3 + sign * jump);
	add	ecx, ebp	# _375, <retval>
	mov	edx, ebx	#, offset
	lea	rsi, .LC36[rip]	#,
	lea	rdi, .LC37[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:129:             return jumpInstruction("OP_JUMP", 1, chunk, offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L11:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC35[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:127:             return simpleInstruction("OP_PRINT", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L12:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC34[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:125:             return simpleInstruction("OP_NEGATE", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L13:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC33[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:123:             return simpleInstruction("OP_NOT", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L14:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC32[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:121:             return simpleInstruction("OP_DIVIDE", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L15:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC31[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:119:             return simpleInstruction("OP_MULTIPLY", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L16:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC30[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:117:             return simpleInstruction("OP_SUBTRACT", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L17:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC29[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:115:             return simpleInstruction("OP_ADD", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L18:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC28[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:113:             return simpleInstruction("OP_LESS", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L19:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC27[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:111:             return simpleInstruction("OP_GREATER", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L20:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC26[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:109:             return simpleInstruction("OP_EQUAL", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L21:
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	movzx	r12d, BYTE PTR 2[rdi+rcx]	# _345, *_343
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdi+rcx]	# _351, *_349
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	sal	r12d, 8	# _346,
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _352,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _336, _352
# src/debug.c:22:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _341, *_339
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC25[rip]	#,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _353, _341
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	mov	edx, r12d	#, _353
.L44:
# src/debug.c:26:     printValue(chunk->constants.values[constant]);
	movsxd	r12, r12d	# _216, _213
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	lea	rdi, .LC4[rip]	#,
	xor	eax, eax	#
# src/debug.c:26:     printValue(chunk->constants.values[constant]);
	sal	r12, 4	# tmp448,
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	call	printf@PLT	#
# src/debug.c:26:     printValue(chunk->constants.values[constant]);
	add	r12, QWORD PTR 40[rbp]	# tmp449, chunk_14(D)->constants.values
	mov	edi, DWORD PTR [r12]	# *_218,
	mov	rsi, QWORD PTR 8[r12]	# *_218,
# src/debug.c:28:     return offset + 4;
	lea	ebp, 4[rbx]	# <retval>,
# src/debug.c:26:     printValue(chunk->constants.values[constant]);
	call	printValue@PLT	#
# src/debug.c:27:     printf("'\n");
	lea	rdi, .LC5[rip]	#,
	call	puts@PLT	#
# src/debug.c:142: }
	pop	rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	eax, ebp	#, <retval>
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L22:
	.cfi_restore_state
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	movzx	edx, BYTE PTR 1[rdi+rcx]	#, *_328
# src/debug.c:15:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC24[rip]	#,
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	mov	r12, rdx	#,
	jmp	.L43	#
	.p2align 4,,10
	.p2align 3
.L23:
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	movzx	r12d, BYTE PTR 2[rdi+rcx]	# _310, *_308
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdi+rcx]	# _316, *_314
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	sal	r12d, 8	# _311,
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _317,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _361, _317
# src/debug.c:22:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _306, *_304
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC23[rip]	#,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _318, _306
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	mov	edx, r12d	#, _318
	jmp	.L44	#
	.p2align 4,,10
	.p2align 3
.L24:
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	movzx	edx, BYTE PTR 1[rdi+rcx]	#, *_293
# src/debug.c:15:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC22[rip]	#,
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	mov	r12, rdx	#,
	jmp	.L43	#
	.p2align 4,,10
	.p2align 3
.L25:
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	movzx	r12d, BYTE PTR 2[rdi+rcx]	# _275, *_273
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdi+rcx]	# _281, *_279
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	sal	r12d, 8	# _276,
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _282,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _107, _282
# src/debug.c:22:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _271, *_269
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC21[rip]	#,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _283, _271
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	mov	edx, r12d	#, _283
	jmp	.L44	#
	.p2align 4,,10
	.p2align 3
.L26:
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	movzx	edx, BYTE PTR 1[rdi+rcx]	#, *_258
# src/debug.c:15:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC20[rip]	#,
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	mov	r12, rdx	#,
	jmp	.L43	#
	.p2align 4,,10
	.p2align 3
.L27:
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	movzx	r12d, BYTE PTR 2[rdi+rcx]	# _240, *_238
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdi+rcx]	# _246, *_244
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	sal	r12d, 8	# _241,
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _247,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _377, _247
# src/debug.c:22:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _236, *_234
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC19[rip]	#,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _248, _236
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	mov	edx, r12d	#, _248
	jmp	.L44	#
	.p2align 4,,10
	.p2align 3
.L28:
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	movzx	edx, BYTE PTR 1[rdi+rcx]	#, *_223
# src/debug.c:15:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC18[rip]	#,
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	mov	r12, rdx	#,
	jmp	.L43	#
	.p2align 4,,10
	.p2align 3
.L29:
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	movzx	r12d, BYTE PTR 2[rdi+rcx]	# _205, *_203
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdi+rcx]	# _211, *_209
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	sal	r12d, 8	# _206,
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _212,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _106, _212
# src/debug.c:22:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _201, *_199
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC17[rip]	#,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _213, _201
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	mov	edx, r12d	#, _213
	jmp	.L44	#
	.p2align 4,,10
	.p2align 3
.L30:
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	movzx	edx, BYTE PTR 1[rdi+rcx]	#, *_188
# src/debug.c:15:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC16[rip]	#,
# src/debug.c:14:     uint8_t constant = chunk->code[offset + 1];
	mov	r12, rdx	#,
	jmp	.L43	#
	.p2align 4,,10
	.p2align 3
.L31:
# src/debug.c:44:                    (chunk->code[offset + 2] << 8) |
	movzx	edx, BYTE PTR 2[rdi+rcx]	# _174, *_172
# src/debug.c:45:                    (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdi+rcx]	# _180, *_178
# src/debug.c:44:                    (chunk->code[offset + 2] << 8) |
	sal	edx, 8	# _175,
# src/debug.c:45:                    (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _181,
# src/debug.c:44:                    (chunk->code[offset + 2] << 8) |
	or	edx, eax	# _393, _181
# src/debug.c:43:     uint32_t slot = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _170, *_168
# src/debug.c:46:     printf("%-16s %4d\n", name, slot);
	lea	rsi, .LC15[rip]	#,
# src/debug.c:44:                    (chunk->code[offset + 2] << 8) |
	or	edx, eax	# _182, _170
# src/debug.c:46:     printf("%-16s %4d\n", name, slot);
	lea	rdi, .LC12[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:47:     return offset + 4;
	lea	ebp, 4[rbx]	# <retval>,
# src/debug.c:87:             return longByteInstruction("OP_SET_LOCAL_LONG", chunk, offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L32:
# src/debug.c:38:     printf("%-16s %4d\n", name, slot);
	movzx	edx, BYTE PTR 1[rdi+rcx]	# _69, *_67
	lea	rsi, .LC14[rip]	#,
	lea	rdi, .LC12[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:39:     return offset + 2;
	lea	ebp, 2[rbx]	# <retval>,
# src/debug.c:85:             return byteInstruction("OP_SET_LOCAL", chunk, offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L33:
# src/debug.c:44:                    (chunk->code[offset + 2] << 8) |
	movzx	edx, BYTE PTR 2[rdi+rcx]	# _154, *_152
# src/debug.c:45:                    (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdi+rcx]	# _160, *_158
# src/debug.c:44:                    (chunk->code[offset + 2] << 8) |
	sal	edx, 8	# _155,
# src/debug.c:45:                    (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _161,
# src/debug.c:44:                    (chunk->code[offset + 2] << 8) |
	or	edx, eax	# _105, _161
# src/debug.c:43:     uint32_t slot = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _150, *_148
# src/debug.c:46:     printf("%-16s %4d\n", name, slot);
	lea	rsi, .LC13[rip]	#,
# src/debug.c:44:                    (chunk->code[offset + 2] << 8) |
	or	edx, eax	# _162, _150
# src/debug.c:46:     printf("%-16s %4d\n", name, slot);
	lea	rdi, .LC12[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:47:     return offset + 4;
	lea	ebp, 4[rbx]	# <retval>,
# src/debug.c:83:             return longByteInstruction("OP_GET_LOCAL_LONG", chunk, offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L34:
# src/debug.c:38:     printf("%-16s %4d\n", name, slot);
	movzx	edx, BYTE PTR 1[rdi+rcx]	# _64, *_62
	lea	rsi, .LC11[rip]	#,
	lea	rdi, .LC12[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:39:     return offset + 2;
	lea	ebp, 2[rbx]	# <retval>,
# src/debug.c:81:             return byteInstruction("OP_GET_LOCAL", chunk, offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L35:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC10[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:79:             return simpleInstruction("OP_POP", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L36:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC9[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:77:             return simpleInstruction("OP_FALSE", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L37:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC8[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:75:             return simpleInstruction("OP_TRUE", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L38:
# src/debug.c:32:     printf("%s\n", name);
	lea	rdi, .LC7[rip]	#,
	call	puts@PLT	#
# src/debug.c:33:     return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
# src/debug.c:73:             return simpleInstruction("OP_NULL", offset);
	jmp	.L1	#
	.p2align 4,,10
	.p2align 3
.L39:
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	movzx	r12d, BYTE PTR 2[rdi+rcx]	# _130, *_128
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	movzx	eax, BYTE PTR 3[rdi+rcx]	# _136, *_134
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	sal	r12d, 8	# _131,
# src/debug.c:24:                        (chunk->code[offset + 3] << 16);
	sal	eax, 16	# _137,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _407, _137
# src/debug.c:22:     uint32_t constant = chunk->code[offset + 1] |
	movzx	eax, BYTE PTR 1[rdi+rcx]	# _126, *_124
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	lea	rsi, .LC6[rip]	#,
# src/debug.c:23:                        (chunk->code[offset + 2] << 8) |
	or	r12d, eax	# _138, _126
# src/debug.c:25:     printf("%-16s %4d '", name, constant);
	mov	edx, r12d	#, _138
	jmp	.L44	#
	.p2align 4,,10
	.p2align 3
.L4:
# src/debug.c:139:             printf("Unknown opcode %d\n", instruction);
	lea	rdi, .LC42[rip]	#,
	xor	eax, eax	#
	call	printf@PLT	#
# src/debug.c:140:             return offset + 1;
	lea	ebp, 1[rbx]	# <retval>,
	jmp	.L1	#
	.cfi_endproc
.LFE18:
	.size	dissassembleInstruction, .-dissassembleInstruction
	.section	.rodata.str1.1
.LC43:
	.string	"== %s ==\n"
	.text
	.p2align 4
	.globl	dissassembleChunk
	.type	dissassembleChunk, @function
dissassembleChunk:
.LFB11:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# src/debug.c:7:     printf("== %s ==\n", name);
	xor	eax, eax	#
# src/debug.c:6: void dissassembleChunk(Chunk* chunk, const char* name) {
	mov	rbx, rdi	# chunk, chunk
# src/debug.c:7:     printf("== %s ==\n", name);
	lea	rdi, .LC43[rip]	#,
	call	printf@PLT	#
# src/debug.c:8:     for (int offset = 0; offset < chunk->count;) {
	mov	eax, DWORD PTR [rbx]	#, chunk_7(D)->count
	test	eax, eax	#
	jle	.L51	#,
# src/debug.c:8:     for (int offset = 0; offset < chunk->count;) {
	xor	esi, esi	# offset
	.p2align 4,,10
	.p2align 3
.L49:
# src/debug.c:9:         offset = dissassembleInstruction(chunk, offset);
	mov	rdi, rbx	#, chunk
	call	dissassembleInstruction	#
# src/debug.c:8:     for (int offset = 0; offset < chunk->count;) {
	cmp	DWORD PTR [rbx], eax	# chunk_7(D)->count, offset
# src/debug.c:9:         offset = dissassembleInstruction(chunk, offset);
	mov	esi, eax	# offset, offset
# src/debug.c:8:     for (int offset = 0; offset < chunk->count;) {
	jg	.L49	#,
.L51:
# src/debug.c:11: }
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE11:
	.size	dissassembleChunk, .-dissassembleChunk
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
