;Declaring Datas and Constants

section .data

	;Constants
	LF equ 10			;New Line
	numero_max equ 10	;Buffer Size

	;Program Strings
	string_1 db LF, "Input: "	;String Output
	length_1 equ $ - string_1	;String Length

	string_2 db LF, "   Impar!!! ", LF	;String Output
	length_2 equ $ - string_2		;String Length

	string_3 db LF, "   Par!!!", LF	;String Output
	length_3 equ $ - string_3		;String Length

;Declaring Variables
section .bss	

	;Program Input
	numero resb numero_max	;Buffer Length
	num resd 1				;Buffer Variable

;Declaring Code
section .text

global _start	;declared entrypoint (ld)
_start:			;entrypoint

;[04]output
mov edx,length_1		;message length
mov ecx,string_1		;message to write
mov ebx,1				;[out text]file descriptor
mov eax,4				;[sys write] system call number
int 0x80				;call kernel

;[03]input
mov edx,numero_max		;input length
mov ecx,numero			;input text
mov ebx,0				;[in text]file descriptor
mov eax,3				;[sys read] system call number
int 0x80

sub eax,2
mov [num],eax	;move EAX para variavel num

;Bloco de Comparacao
mov esi,eax
mov edx,0
mov ebx,2
mov al,[numero + esi]
div ebx

cmp edx, 0		;comparacao com 0
jz teste		;jump se Zero

;Bloco False
;[04]output
mov edx,length_2	;message length
mov ecx,string_2	;message to write
mov ebx,1			;[out text]file descriptor
mov eax,4			;[sys write] system call number
int 0x80			;call kernel

jmp exit_prog		;jump exit



;Bloco True
teste:
;[04]output
mov edx,length_3	;message length
mov ecx,string_3	;message to write
mov ebx,1			;[out text]file descriptor
mov eax,4			;[sys write] system call number
int 0x80			;call kernel

jmp exit_prog		;jump exit



exit_prog:
;[01]exit
mov ebx,0
mov eax,1
int 0x80
