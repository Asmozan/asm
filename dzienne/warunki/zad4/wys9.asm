extern printf
extern scanf

global main

section .data
	
	text	db	'%ld',10,0
	format	db	'%ld',0
	p3	db	'Liczba jest podzielna przez 3',10,0
	p7r2	db	'Reszta z dzielenia tej liczby przez 7 wynosi 2',10,0

section .bss

	liczba	resb	16
	wynik	resb	16
	reszta	resb	16

section .text
main:	
	mov 	rdi, format
	mov 	rsi, liczba
	mov 	rax, 0
	call	scanf

	mov	dx,0
	mov	ax,[liczba]
	mov	bx,3
	div	bx

	cmp	dx,0
	
	je	_p3

_dzielenie7:

	mov	dx,0
	mov	ax,[liczba]
	mov	bx,7
	div	bx

	cmp	dx,2
	
	je	_p7r2
	jmp	_koniec

_p3:
	
	mov	rdi,p3
	xor	rax,rax
	call	printf
	jmp	_dzielenie7

_p7r2:

	mov	rdi,p7r2
	xor	rax,rax
	call	printf

_koniec:

	mov	rax,1
	mov 	rbx,0
	int	80h


