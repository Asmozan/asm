global main

section .idata
extern printf
extern scanf
 
section .data
 
    napis			db  '%ld',10,0
    liczba      	dq  0               
    scanf_format:	db 	'%ld', 0
	liczba2			dq  0
 
section .bss
 
    licznik:        resb    1   

 
section .text
main:
 
    mov rdi, scanf_format
    mov rsi, liczba
    xor rax, rax
    call scanf

	mov byte[licznik],0
	mov byte[liczba2],0
      

_petla:                         
 
    inc     byte [licznik]              ;zwiekszenie licznika
	add		byte[liczba2],2
 
    mov rdi, qword napis
	mov rsi, qword [liczba2]
    xor rax, rax
    call printf
   
    mov     rax,0
    mov     ah,[liczba]                 ;sprawdzanie warunku
    cmp     byte [licznik],ah
 
 
    jnz     _petla                      ;koniec petli
 

    mov     rax,1      
    mov     rbx,0
    int     80h                         ;koniec programu
