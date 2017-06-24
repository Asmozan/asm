global main
extern printf
extern scanf
 
section .data

	napis		db	'%ld',10,0
	format		db	'%ld',0
	


section .bss

	liczba	resq	1
	licznik	resq 	1

section .text
main:

	mov 	rdi,format
	mov	rsi,liczba
	xor	rax,rax
	call	scanf	

	mov	qword [licznik],0
	xor	rdx,rdx
	xor	rcx,rcx
_petla:

	inc	qword [licznik]
	add	rdx,qword [licznik]



	mov	rcx, qword [licznik]
	cmp	rcx,[liczba]

	jb	_petla

	mov	rdi,napis
	mov	rsi,rdx
	xor	rax,rax
	call	printf

	mov	rax,1
	mov	rbx,0
	int	80h
