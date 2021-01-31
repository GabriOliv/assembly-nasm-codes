;==========================================
;Script 009
;	Open File
;==========================================

;------------------------------------------
;Macro List for 009
;------------------------------------------

;exit_macro
%macro exit_macro 0
	mov ebx,0
	mov eax,1
	int 0x80
%endmacro

;read_macro ebx, ecx , edx
%macro read_macro 3
	mov edx, %3
	mov ecx, %2
	mov ebx, %1
	mov eax,3
	int 0x80
%endmacro

;write_macro ecx , edx
%macro write_macro 2
	mov edx, %2
	mov ecx, %1
	mov ebx, 1
	mov eax, 4
	int 0x80
%endmacro

;--------------------------------
;Main Code
;--------------------------------
section .data

	;Constants
		LF equ 10			;New Line

	;Program Strings
		;String Output
		string_01 db LF, "Text from 001_Nothing.asm:", LF, LF
		;String Length
		string_01_length equ $ - string_01

		;String Output
		string_error db LF, "Erro ao abrir arquivo", LF
		;String Length
		string_error_length equ $ - string_error

	;File Name
	file_name db "001_Nothing.asm", 0 
	;Text block (double word)x10
	block dd 10


section .bss

	;File Descriptor
	fd resd 1
	;File Buffer
	buffer resb 10


section .text
global _start

	_start:

		write_macro string_01, string_01_length

		mov ebx, file_name		;Open File
		mov ecx, 0				;Read Only
		mov edx, 700q			;File Permissions, rwx by onwer only
		mov eax, 5				;Syscall ID 
		int 0x80

		cmp eax, 0				;If ERROR
		jl file_error			;End Program
		mov [fd], eax			;Save fd

	read_buffer:

		read_macro [fd], buffer, [block]

		cmp eax, 10				;If End of Line
		jnl output_tela
		mov [block], eax

	output_tela:

		;Output Line
		write_macro buffer, [block]

		cmp dword [block], 10	;If have 1 more Line
		je read_buffer
		jmp fim

	file_error:

		;Error Msg
		write_macro string_error, string_error_length

	fim:

		exit_macro


