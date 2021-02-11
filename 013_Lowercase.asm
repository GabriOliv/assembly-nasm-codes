;Include Library
%include "library/lib_000.asm"

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

        ;Start counter esi
        mov esi, 0

        ParseString:

            ;Move char to al
            mov al, [input_01+esi]

            ;Jump If Counter(esi) is Equal Size([text])
            cmp esi, [text] ;Compara índice com o Tamanho da String
            je Finish	;Jump se Igual

            ;Jump If Below "A"
            cmp al,"A"
            jb Next

            ;Jump If Above "Z"
            cmp al, "Z"
            ja Next

            ;UPPERCASE
            ;z 122 01111010
            ;  223 11011111
            ;  AND --------

            ;lowercase
            ;Z 090 01011010
            ;  032 00100000
            ;  OR  --------

            or al, 32

            ;Return char to string
            mov[input_01+esi],al

        Next:
            inc esi; increementando contador
            jmp ParseString 

        Finish:
            ;output string 02
            syscall_write 1, string_02, length_02

            ;output parsed input
            syscall_write 1, input_01, [text]

            syscall_exit









