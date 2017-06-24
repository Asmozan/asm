extern printf
extern scanf

global main

section .data

	liczba dd 0
	dodatnia db 'Liczba jest dodatnia',10,0
	ujemna db 'Liczba jest ujemna',10,0
	zero db 'Liczba jest rowna zero',10,0
	format db '%d',0


section .text
main:
	mov rdi, format
	mov rsi, liczba
	mov rax, 0
	call scanf
	
	mov esi, [liczba]
	cmp esi, 0
	
	jg _dodatnia
	jl _ujemna
	je _zero

_dodatnia:
	mov rdi,dodatnia
	mov rax,0
	call printf
	jmp _koniec

_ujemna:
	mov rdi,ujemna
	mov rax,0
	call printf
	jmp _koniec

_zero:
	mov rdi,zero
	mov rax,0
	call printf
	jmp _koniec

_koniec:
	mov rax,1
	mov rbx,0
	int 80h


