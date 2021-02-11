;Include Library
%include "library/lib_000.asm"
%include "macro/macro_01_lowercase.asm"
%include "macro/macro_02_uppercase.asm"

section .data
    ;Constants
        ;New Line
        LF equ 10
        ;Buffer Size
        char_max equ 50

    ;Program Strings
        string_01 db LF, ">  Input: "
        length_01 equ $ - string_01

        string_02 db "> Output: "
        length_02 equ $ - string_02

section .bss
	;Program Input
        input_01 resb char_max	
        text resd 1

section .text
    global _start
    _start:
        ;output string 01
        syscall_write 1, string_01, length_01	;macro write

        ;input Text
        input_msg 0, input_01, char_max	;macro read

        ;Save Input
        mov [text], eax


        macro_lowercase input_01, text
        ;output string 02
        syscall_write 1, string_02, length_02
        ;output parsed input
        syscall_write 1, input_01, [text]


        macro_uppercase input_01, text
        ;output string 02
        syscall_write 1, string_02, length_02
        ;output parsed input
        syscall_write 1, input_01, [text]


        syscall_exit
