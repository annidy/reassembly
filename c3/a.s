

	.globl	_codepoint
	.p2align	4, 0x90
_codepoint:                             ## @codepoint
	push	rbp
	mov	rbp, rsp
	mov	al, dil
	mov	rcx, qword ptr [rip + _keybuf@GOTPCREL]
	mov	[rbp - 1], al
	movsx	rdx, [rbp - 1]
	movsx	eax, byte ptr [rcx + rdx]
	pop	rbp
	ret
	.cfi_endproc
