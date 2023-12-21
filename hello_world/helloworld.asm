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


mensagem : var #21
static mensagem + #0, #'A'
static mensagem + #1, #'A'
static mensagem + #2, #'A'
static mensagem + #3, #'a'
static mensagem + #4, #'B'
static mensagem + #5, #'C'
static mensagem + #6, #'E'
static mensagem + #7, #'N'
static mensagem + #8, #'T'
static mensagem + #9, #'E'
static mensagem + #10, #'R'
static mensagem + #11, #' '
static mensagem + #12, #'T'
static mensagem + #13, #'O'
static mensagem + #14, #' '
static mensagem + #15, #'S'
static mensagem + #16, #'T'
static mensagem + #17, #'A'
static mensagem + #18, #'R'
static mensagem + #19, #'T'
static mensagem + #20, #'\0'


mensagem2 : string "Olá, mundo!"

;---- Inicio do Programa Principal -----

main:
	loadn r0, #0			; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #mensagem2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #256			; Seleciona a COR da Mensagem
	
	call Imprimestr

	halt
	
;---- Fim do Programa Principal -----
	
;---- Inicio das Subrotinas -----
	
Imprimestr:					; Rotina de Impresao de Mensagens: r0 = Posicao da tela que o primeiro caractere da mensagem eh impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.  Obs: a mensagem eh impressa ate' encontrar "/0"
	push r0					; Protege o r0 na pilha para preservar seu valor
	push r1					; Protege o r1 na pilha para preservar seu valor
	push r2					; Protege o r1 na pilha para preservar seu valor
	push r3					; Protege o r3 na pilha para ser usado na subrotina
	push r4					; Protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'			; Criterio de parada

ImprimestrLoop:	
	loadi r4, r1
	cmp r4, r3
	jeq ImprimestrSai		; Verifica se a caractere da mensagem eh '\0' e vai para a ImprimestrSai se for
	add r4, r2, r4
	outchar r4, r0			; Imprime string na tela
	inc r0
	inc r1
	jmp ImprimestrLoop		; Continua o loop
	
ImprimestrSai:	
	pop r4					; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
	
	