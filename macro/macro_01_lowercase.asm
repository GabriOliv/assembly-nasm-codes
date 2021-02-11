
;section .bss
;   input_01 resb char_max	
;   text resd 1
;
;    input_msg 0, input_01, char_max

%macro macro_lowercase 2
;Ex:
;   macro_lowercase input_01, text
;1
;   input_01
;2
;   text

    mov esi, 0

    macro_lowercase_ParseString:

        mov al, [%1+esi]

        cmp esi, [%2]
        je macro_lowercase_Finish
        
        cmp al, "A"
        jb macro_lowercase_Next

        cmp al, "Z"
        ja macro_lowercase_Next

        macro_lowercase_Lowercase:
            ;lowercase
            ;Z 090 01011010
            ;  032 00100000
            ;  OR  --------
            ;z 122 01111010
            or al, 32

        macro_lowercase_Return:
            ;Return char to string
            mov[%1+esi],al

        macro_lowercase_Next:
            inc esi
            jmp macro_lowercase_ParseString

    macro_lowercase_Finish:

%endmacro
