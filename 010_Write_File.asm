;==========================================
;Script 010
;	Write File
;==========================================

;------------------------------------------
;Macro List for 010
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

;write_macro ebx, ecx , edx
%macro write_macro 3
	mov edx, %3
	mov ecx, %2
	mov ebx, %1
	mov eax, 4
	int 0x80
%endmacro

;--------------------------------
;Main Code
;--------------------------------
section .data

	;Constants
		LF equ 10					;New Line
		input_01_length equ 30		;Input Length

	;Program Strings
		string_01 db LF, "|.....Input Size 30..........|", LF
		string_01_length equ $ - string_01
		
		string_02 db LF, "Text Saved inside 'file_set_010.txt' ", LF
		string_02_length equ $ - string_02
		
		string_error db LF, "Open File Error", LF
		string_error_length equ $ - string_error
		
	;File Name
	file_name db "file_set_010.txt", 0 


section .bss

	;User Input
	input_01 resb input_01_length		;Buffer Length
	input_01_buffer resd 1				;Buffer Variable

	;File Descriptor
	fd resd 1
	;File Buffer
	buffer resb 10


section .text
global _start

	_start:

		write_macro 1, string_01, string_01_length

		mov ebx, file_name			;File Name
		mov ecx, 777q				;File Permissions, rwx all
		mov eax, 8					;Create File / Trunc File
		int 0x80

		cmp eax, 0					;If ERROR
		jl file_error				;End Program
		mov [fd], eax				;Save fd

		;User Input
		read_macro 0, input_01 , input_01_length
		mov [input_01_buffer],eax 	;Save number of bytes received from Input

	output_tela:		

		write_macro [fd], input_01 , input_01_length


		write_macro 1, string_02, string_02_length
		jmp fim

	file_error:

		write_macro 1, string_error, string_error_length

	fim:

		exit_macro

