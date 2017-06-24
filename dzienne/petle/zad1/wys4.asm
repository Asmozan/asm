global _start

section .data

section .bss

	licznik:		resb	1	

section .text
_start:
					
	mov	byte [licznik],0


_petla:						

	inc	byte [licznik]			

	mov 	rax,4
	mov	rbx,1
	mov	rcx,licznik			
	mov	rdx,8
	int 	80h
	

	cmp	word [licznik],128


	jnz	_petla				


	mov	rax,1		
	mov	rbx,0
	int	80h				

