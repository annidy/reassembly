# otool -tvV a.out
.globl _setkey
_setkey:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -0x4(%rbp)
	movl	-0x4(%rbp), %edi
	movl	%edi, -0xc(%rbp)
	movl	$0x0, -0x8(%rbp)
L_e34:
	cmpl	$0x1a, -0x8(%rbp)
	jge	L_e7c
	leaq	_keybuf(%rip), %rax
	movl	$0x1a, %ecx
	movl	-0xc(%rbp), %edx
	movq	%rax, -0x18(%rbp)
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movb	%dl, %sil
	movslq	-0x8(%rbp), %rdi
	movq	-0x18(%rbp), %r8
	movb	%sil, (%r8,%rdi)
	movl	-0x4(%rbp), %ecx
	addl	-0xc(%rbp), %ecx
	movl	%ecx, -0xc(%rbp)
	movl	-0x8(%rbp), %eax
	addl	$0x1, %eax
	movl	%eax, -0x8(%rbp)
	jmp	L_e34
L_e7c:
	popq	%rbp
	retq
	nop

.globl _encrypt
_encrypt:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0x10, %rsp
	movq	%rdi, -0x8(%rbp)
	movq	-0x8(%rbp), %rdi
	movq	%rdi, -0x10(%rbp)
L_e94:
	movq	-0x8(%rbp), %rax
	cmpb	$0x0, (%rax)
	je	L_f40
	movq	-0x8(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0x61, %ecx
	jl	L_ee8
	movq	-0x8(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0x7a, %ecx
	jg	L_ee8
	movq	-0x8(%rbp), %rax
	movsbl	(%rax), %ecx
	subl	$0x61, %ecx
	movb	%cl, %dl
	movsbl	%dl, %edi
	callq	_codepoint
	movsbl	%al, %ecx
	addl	$0x61, %ecx
	movb	%cl, %al
	movq	-0x8(%rbp), %rsi
	movb	%al, (%rsi)
	jmp	L_f2f
L_ee8:
	movq	-0x8(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0x41, %ecx
	jl	L_f2a
	movq	-0x8(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0x5a, %ecx
	jg	L_f2a
	movq	-0x8(%rbp), %rax
	movsbl	(%rax), %ecx
	subl	$0x41, %ecx
	movb	%cl, %dl
	movsbl	%dl, %edi
	callq	_codepoint
	movsbl	%al, %ecx
	addl	$0x41, %ecx
	movb	%cl, %al
	movq	-0x8(%rbp), %rsi
	movb	%al, (%rsi)
L_f2a:
	jmp	L_f2f
L_f2f:
	movq	-0x8(%rbp), %rax
	addq	$0x1, %rax
	movq	%rax, -0x8(%rbp)
	jmp	L_e94
L_f40:
	movq	-0x10(%rbp), %rax
	addq	$0x10, %rsp
	popq	%rbp
	retq
	nopw	(%rax,%rax)

_codepoint:
	pushq	%rbp
	movq	%rsp, %rbp
	movb	%dil, %al
	leaq	_keybuf(%rip), %rcx
	movb	%al, -0x1(%rbp)
	movsbq	-0x1(%rbp), %rdx
	movsbl	(%rcx,%rdx), %eax
	popq	%rbp
	retq
