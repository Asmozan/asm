extern printf
extern scanf

global main

section .data
	
	wynik	db	'= %ld',10,0
	format1	db	'%ld',0
	format2 db 	'%s',0

section .bss

	liczba1	resb	64
	liczba2	resb	64
	znak	resb	1

section .text
main:	
	mov 	rdi, format1
	mov 	rsi, liczba1
	mov 	rax, 0
	call	scanf

	mov 	rdi, format2
	mov 	rsi, znak
	mov 	rax, 0
	call 	scanf

	mov 	rdi, format1
	mov 	rsi, liczba2
	mov 	rax, 0
	call	scanf

	xor	rax,rax
	mov	ah,'+'	
	cmp	ah,byte [znak]
	
	je	_dodaj
	
	mov	ah,'-'
	cmp	ah,byte [znak]

	je	_odejmij
	jne	_koniec

	xor	rcx,rcx

_dodaj:

	mov	rcx,[liczba1]
	add	rcx,[liczba2]
	
	jmp	_wynik

_odejmij:

	mov	rcx,[liczba1]
	sub	rcx,[liczba2]	

	jmp	_wynik

_wynik:
	mov	rdi,wynik
	mov	rsi,rcx
	xor	rax,rax
	call	printf

_koniec:
	
	mov	rax,1
	mov 	rbx,0
	int	80h


