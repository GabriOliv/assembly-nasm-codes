
;section .bss
;   input_01 resb char_max	
;   text resd 1
;
;    input_msg 0, input_01, char_max

%macro macro_uppercase 2
;Ex:
;   macro_uppercase input_01, text
;1
;   input_01
;2
;   text

    mov esi, 0

    macro_uppercase_ParseString:

        mov al, [%1+esi]

        cmp esi, [%2]
        je macro_uppercase_Finish
        
        cmp al, "a"
        jb macro_uppercase_Next

        cmp al, "z"
        ja macro_uppercase_Next

        macro_uppercase_Uppercase:
            ;UPPERCASE
            ;z 122 01111010
            ;  223 11011111
            ;  AND --------
            ;Z 090 01011010
            and al, 223

        macro_uppercase_Return:
            ;Return char to string
            mov[%1+esi],al

        macro_uppercase_Next:
            inc esi
            jmp macro_uppercase_ParseString

    macro_uppercase_Finish:

%endmacro
