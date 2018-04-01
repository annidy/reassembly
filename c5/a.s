# objdump -x86-asm-syntax=intel -no-show-raw-insn -no-leading-headers  -no-leading-addr -no-symbolic-operands -non-verbose -d a.out
.globl _setkey
_setkey:
	push	rbp
	mov	rbp, rsp
	mov	dword ptr [rbp - 4], edi
	mov	edi, dword ptr [rbp - 4]
	mov	dword ptr [rbp - 12], edi
	mov	dword ptr [rbp - 8], 0
	cmp	dword ptr [rbp - 8], 26
	jge	0x0000000100000e45
	lea	rax, [rip + 475]
	mov	ecx, 26
	mov	edx, dword ptr [rbp - 12]
	mov	qword ptr [rbp - 24], rax
	mov	eax, edx
	cdq
	idiv	ecx
	mov	sil, dl
	movsxd	rdi, dword ptr [rbp - 8]
	mov	r8, qword ptr [rbp - 24]
	mov	byte ptr [r8 + rdi], sil
	mov	ecx, dword ptr [rbp - 4]
	add	ecx, dword ptr [rbp - 12]
	mov	dword ptr [rbp - 12], ecx
	mov	eax, dword ptr [rbp - 8]
	add	eax, 1
	mov	dword ptr [rbp - 8], eax
L0000000100000e45: 	jmp	_setkey+0x14
	pop	rbp
	ret
	nop

.globl _encrypt
_encrypt:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 16], rdi
	mov	rax, qword ptr [rbp - 8]
	cmp	byte ptr [rax], 0
	je	_encrypt+0xC0
	mov	rax, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rax]
	cmp	ecx, 97
	jl	_encrypt+0x68
	mov	rax, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rax]
	cmp	ecx, 122
	jg	_encrypt+0x68
	mov	rax, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rax]
	sub	ecx, 97
	mov	dl, cl
	movsx	edi, dl
	call	_codepoint
	movsx	ecx, al
	add	ecx, 97
	mov	al, cl
	mov	rsi, qword ptr [rbp - 8]
	mov	byte ptr [rsi], al
	jmp	_encrypt+0xAF
	mov	rax, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rax]
	cmp	ecx, 65
	jl	_encrypt+0xAA
	mov	rax, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rax]
	cmp	ecx, 90
	jg	_encrypt+0xAA
	mov	rax, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rax]
	sub	ecx, 65
	mov	dl, cl
	movsx	edi, dl
	call	_codepoint
	movsx	ecx, al
	add	ecx, 65
	mov	al, cl
	mov	rsi, qword ptr [rbp - 8]
	mov	byte ptr [rsi], al
	jmp	_encrypt+0xAF
	mov	rax, qword ptr [rbp - 8]
	add	rax, 1
	mov	qword ptr [rbp - 8], rax
	jmp	_encrypt+0x14
	mov	rax, qword ptr [rbp - 16]
	add	rsp, 16
	pop	rbp
	ret
	nop	word ptr [rax + rax]

_codepoint:
	push	rbp
	mov	rbp, rsp
	mov	al, dil
	lea	rcx, [rip + 194]
	mov	byte ptr [rbp - 1], al
	movsx	rdx, byte ptr [rbp - 1]
	movsx	eax, byte ptr [rcx + rdx]
	pop	rbp
	ret
