global main
extern printf
extern scanf

section .data

	format db '%s',0
	znak dq 0

section .text
main:

_petla:

	mov	rdi, format
	mov	rsi, znak
	mov	rax, 0
	call	scanf

	mov 	eax, [znak]
	cmp	eax, 'k'

	je 	_koniec
	jmp 	_petla

_koniec:
	mov	 rax, 1
	mov	 rbx, 0
	int	 80h
