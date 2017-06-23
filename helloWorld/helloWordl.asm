extern printf ;info ze zaciagamy funkcje z c

section .data ;sekcja dla zmiennych

msg: db "Hello Wrld",0 ;tworzymy tablice charow, 0 zamyka
fmt: db "%s", 10, 0 ;taki chcemy format printf

section .text

global main ;entry point kotrego potrzebuje gccec
main: ;entry point programu
	push rbp ;zaczynamy stack, tak jakby otworzyc braclet
		mov rdi,fmt
		mov rsi,msg
		mov rax,0 
		call printf
	pop rbp

	mov rax,0
ret 
