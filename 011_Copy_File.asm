;==========================================
;Script 011
;	Copy File
;==========================================

;------------------------------------------
;Macro List for 011
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

	;Program Strings
		string_01 db LF, "File 01 Open ...", LF
		string_01_length equ $ - string_01
		
		string_02 db LF, "File 02 Open ...", LF
		string_02_length equ $ - string_02
		
		string_03 db LF, "File Copied ...", LF
		string_03_length equ $ - string_03
		
		string_error db LF, "Open File Error", LF
		string_error_length equ $ - string_error
		
    ;File Name
        file_name_01 db "file_get_011.txt", 0 
        file_name_02 db "file_set_011.txt", 0 

	;Text block (double word)x10
    	block dd 10


section .bss

	;Files Descriptor & Buffer
		fd_01 resd 1
		buffer_01 resb 10

		fd_02 resd 1
		buffer_02 resb 10


section .text
global _start

    _start:

		mov ebx, file_name_01	;File Name 01
		mov ecx, 0				;Read Only
		mov edx, 700q			;File Permissions, rwx by onwer only
		mov eax, 5				;Open File 
		int 0x80

		cmp eax, 0				;If ERROR
		jl file_error			;End Program
		mov [fd_01], eax		;Save fd 01

		write_macro 1, string_01, string_01_length

		mov ebx, file_name_02	;File Name 02
		mov ecx, 777q			;File Permissions, rwx all
		mov eax, 8				;Create File / Trunc File
		int 0x80

		cmp eax, 0				;If ERROR
		jl file_error			;End Program
		mov [fd_02], eax		;Save fd 02

		write_macro 1, string_02, string_02_length

    read_buffer:

		read_macro [fd_01], buffer_01, [block]

		cmp eax, 10
		jnl write_file
		mov [block], eax


	write_file:

        ;Write inside File 02
        write_macro [fd_02], buffer_01 , [block]

		cmp dword [block], 10
		je read_buffer

		write_macro 1, string_03, string_03_length

		jmp fim


	file_error:

		write_macro 1, string_error, string_error_length

		call fim

	fim:

		exit_macro


