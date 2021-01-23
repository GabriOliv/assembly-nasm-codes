;Extern Macro Lib Include
%include "007_1_Macro_Lib.asm"

;Declaring Datas and Constants
section .data
	;Constants
	LF equ 10			;New Line
	numero_max equ 30	;Buffer Size

	;Program Strings
	string_1 db LF, "Input: "	;String Output
	length_1 equ $ - string_1	;String Length

	string_2 db LF, "Impar", LF	;String Output
	length_2 equ $ - string_2	;String Length

	string_3 db LF, "Par", LF	;String Output
	length_3 equ $ - string_3	;String Length

;Declaring Variables
section .bss	
	;Program Input
	numero resb numero_max	;Buffer Length
	num resd 1				;Buffer Variable

;Declaring Code
section .text

global _start	;declared entrypoint (ld)
_start:			;entrypoint

;output Titulo
output_msg string_1, length_1	;macro write

;input Numero
input_msg numero, numero_max	;macro read


;Bloco de Comparacao
sub eax,2
mov [num],eax	;move EAX para variavel num
mov esi,eax
mov edx,0
mov ebx,2
mov al,[numero + esi]
div ebx

cmp edx, 0		;comparacao com 0
jz teste		;jump se Zero

;Bloco False
;output False Msg
output_msg string_2, length_2	;macro write
exit_prog						;macro exit

;Bloco True
teste:
;output True Msg
output_msg string_3, length_3	;macro write
exit_prog						;macro exit
