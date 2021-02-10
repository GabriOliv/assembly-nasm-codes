; Assembly NASM Library Macro
; syscall_exit
;
; exit int status
;
; arg:
;		eax		1
;		ebx		exit code
; return:
;		eax 	-/-
; errors:
;		eax 	-/-
;
;syscall_exit
%macro syscall_exit 0
	mov eax, 1
	mov ebx, 0
	int 0x80
%endmacro
