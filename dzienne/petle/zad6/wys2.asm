global _start

section .data

	gwiazdka	db	'*',0
	gwiazdka_dl	equ	$-gwiazdka
	liczba		dw	0		;zmienna dlugosci boku kwadratu
	liczba_dl	equ	$-liczba
	linia		db	10,0
	linia_dl	equ	$-linia

section .bss

	licznik:		resb	1	;liczniki petli 
	licznik2:		resb	1

section .text
_start:

	mov 	rax,3				;wczytanie liczby
	mov	rbx,0
	mov	rcx,liczba
	mov	rdx,liczba_dl
	int 	80h

	sub	word [liczba],48		;zamiana wartosci ASCII na liczbe
	mov	byte [licznik2],0		

_p2:						;poczatek pierwszej petli
	mov	byte [licznik],0


_petla:						;poczatek drugiej petli

	inc	byte [licznik]			;zwiekszenie licznika

	mov 	rax,4
	mov	rbx,1
	mov	rcx,gwiazdka			;wyswietlanie gwiazdki
	mov	rdx,gwiazdka_dl
	int 	80h
	
	mov	rax,0
	mov	ah,[liczba]			;sprawdzanie warunku
	cmp	byte [licznik],ah


	jnz	_petla				;koniec drugiej petli

	inc	byte [licznik2]

	mov 	rax,4
	mov	rbx,1
	mov	rcx,linia			;wyswietlanie przejscia do nowej linii
	mov	rdx,linia_dl
	int 	80h

	mov	rax,0
	mov	ah,[liczba]			;sprawdzanie waruku
	cmp	byte [licznik2],ah

	jnz	_p2				;koniec pierwszej petli

	mov	rax,1		
	mov	rbx,0
	int	80h				;koniec programu


