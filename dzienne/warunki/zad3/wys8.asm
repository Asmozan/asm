extern printf
extern scanf

global main

section .data
	
	wynik	db	'%ld',10,0
	format	db	'%ld',0

section .bss

	liczba1	resb	64
	liczba2	resb	64
	liczba3 resb	64

section .text
main:	
	mov 	rdi, format
	mov 	rsi, liczba1
	mov 	rax, 0
	call	scanf

	mov 	rdi, format
	mov 	rsi, liczba2
	mov 	rax, 0
	call 	scanf

	mov 	rdi, format
	mov 	rsi, liczba3
	mov 	rax, 0
	call	scanf

_cmp:
	mov	rbx,qword [liczba1]
	cmp	rbx,qword [liczba2]
	jg	_swap1

	mov	rbx,qword [liczba2]
	cmp	rbx,qword [liczba3]
	jg	_swap2

	jmp	_koniec
	

_swap1:

	mov 	rdx,qword [liczba2]
	mov 	qword [liczba2],rbx
	mov 	qword [liczba1],rdx
	xor	rdx,rdx
	xor	rbx,rbx
	jmp 	_cmp

_swap2:

	mov 	rdx,qword [liczba3]
	mov 	qword [liczba3],rbx
	mov 	qword [liczba2],rdx
	xor	rdx,rdx
	xor	rbx,rbx
	jmp 	_cmp

_koniec:
	
	mov	rdi,wynik
	mov	rsi,qword [liczba1]
	xor	rax,rax
	call	printf

	
	mov	rdi,wynik
	mov	rsi,qword [liczba2]
	xor	rax,rax
	call	printf

	
	mov	rdi,wynik
	mov	rsi,qword [liczba3]
	xor	rax,rax
	call	printf

	mov	rax,1
	mov 	rbx,0
	int	80h


