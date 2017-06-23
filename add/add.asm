extern printf ;info ze bierzemy bilbioteki z c
extern scanf ;up
global main ;deklarujemy ze main bedzie globalny

section .data ;sekcja gdzie deklarujemy zmienne, to ze chlon to dawal na koniec to jakis zart okrutny
napis db "Dodawanie wnnosi: %d",10,0 ; wrzucamy do zmiennej napis typu db napis, konczymy ,0 bo to tak tablice charow z C wymagaja nulla, dajemy 10 bo kurwa nie wiem dlaczego, ale to dlatego ze printf tego wymaga
zm dd 0 ;inicjalizujemy zmeinna zm typu dd wartoscia 0
zm2 dd 0 ;up
format dd "%d",0 ; inicjalizujemy zmienna format typu dd napisem, to jest po to zeby nam dobrze formatowalo potem tekst... tez gowno z C przy %d pobiera zmienna do printfa

section .text ;sekcja gdzie kodzimy i popelniamy samobojstwo

main: ;kompiluemy gcc a to wymaga metody main

; pierwsza zmienna i przypisanie wartosci z klawy
mov rdi,format ;przenosi (mov -> move) zmienna format do rejestru rdi
mov rsi,zm ;up
xor rax,rax ;zeruje nam rejestr rax
call scanf ;wola scanfa czyli czytanie z klawy z C

; druga zmienna i przypisanie wartosci z klawy
mov rdi,format
mov rsi,zm2 
xor rax,rax 
call scanf

;a tu juz wlasciwe dodawanie
xor rsi,rsi ; zerujemy rsi
mov eax,[zm] ; przypisujemy zm do eaxa
add eax, [zm2] ; tu dodajemy zm2 do tego co jest w eax i zapisuje w eax
mov esi,eax ; przenosi eax do esi

;a tu mamy wypisywanie
mov rdi,napis ; up
xor rax,rax
call printf ;wywyoluje wypisane

mov rax,1
xor rbx,rbx
int 80h ;interupt , przerywa dzialanie programu
