;   nasm -f elf64 wys.asm
global main

section .idata
extern printf
extern scanf
 
section .data
 
    gwiazdka    db  '*',0
    liczba      dq  0               ;zmienna dlugosci boku kwadratu
    linia       db  10,0

    scanf_format: db "%ld", 0
 
section .bss
 
    licznik:        resb    1       ;liczniki petli
    licznik2:       resb    1
 
section .text
main:
 
    mov rdi, scanf_format
    mov rsi, liczba
    xor rax, rax
    call scanf
      
 
_p2:                                ;poczatek pierwszej petli
    mov     byte [licznik],0
 
 
_petla:                             ;poczatek drugiej petli
 
    inc     byte [licznik]              ;zwiekszenie licznika
 
    mov rdi, gwiazdka
    xor rax, rax
    call printf
   
    mov     rax,0
    mov     ah,[liczba]                 ;sprawdzanie warunku
    cmp     byte [licznik],ah
 
 
    jnz     _petla                      ;koniec drugiej petli
 
    inc     byte [licznik2]
 
    mov rdi, linia
    xor rax, rax
    call printf
 
    mov     rax,0
    mov     ah,[liczba]                 ;sprawdzanie waruku
    cmp     byte [licznik2],ah
 
    jnz     _p2                         ;koniec pierwszej petli
       
    mov     rax,1      
    mov     rbx,0
    int     80h                         ;koniec programu
