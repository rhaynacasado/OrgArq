; ------- TABELA DE CORES -------

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho				    0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 branco						1111 0000


jmp main

mensagem2: string "OrgArq Ativ 3 - Jogo da Nave"


main:
	loadn r0, #0	        ; Posicao onde a mensagem sera escrita
	loadn r1, #mensagem2	; Carrega r1 com o endereco com a mensagem2
	loadn r2, #1536	        ; Define a cor

    call Imprimestr         ; Vai para a rotina Imprimestr

    loadn r0, #40           ; Posicao da nave na tela
	loadn r1, #'@'	        ; Char da Nave
	loadn r2, #32	        ; Char espaço em branco
    loadn r5, #1199         ; Fim da tela


Loop:
    call ApagaObj
    call RecalculaPos
    call ImprimeObj
    call Delay
    jmp Loop

	halt


Imprimestr:	                ; Rotina de Impresao de Mensagens: r0 = Posicao da tela que o primeiro caractere da mensagem eh impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem
	push r0	                ; Protege o r0 na pilha para preservar seu valor
	push r1	                ; Protege o r1 na pilha para preservar seu valor
	push r2	                ; Protege o r1 na pilha para preservar seu valor
	push r3	                ; Protege o r3 na pilha para ser usado na subrotina
	push r4	                ; Protege o r4 na pilha para ser usado na subrotina

	loadn r3, #'\0'	        ; Criterio de parada

ImprimestrLoop:
	loadi r4, r1
	cmp r4, r3
	jeq ImprimestrSai       ; Verifica se a caractere da mensagem eh '\0' e vai para a ImprimestrSai se for
	add r4, r2, r4
	outchar r4, r0          ; Imprime string na tela
	inc r0
	inc r1
	jmp ImprimestrLoop      ; Continua o loop

ImprimestrSai:
	pop r4	                ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ApagaObj:
    outchar r2, r0          ; r0 -> Posição r2 -> " "
    rts

RecalculaPos:
    inc r0                  ; r0++
    cmp r0, r5
    ceq RetornaZero
    rts

ImprimeObj:
    outchar r1, r0        ; r0-> Posicao  r1-> "O"
    rts

Delay:                   ; Utiliza Push e Pop para nao afetar os Registradores do programa primário
    push r0
    push r1

    loadn r1, #50

    Delay_volta2:           
        loadn r0, #3000

        Delay_volta1:
            dec r0;                 
            jnz Delay_volta1
            dec r1
            jnz Delay_volta2

    pop r1
    pop r0

    rts


RetornaZero:
    loadn r0, #40
    rts