;Macro List for 007

;output_msg ecx , edx
%macro output_msg 2
	mov edx, %2
	mov ecx, %1
	mov ebx, 1
	mov eax, 4
	int 0x80
%endmacro

;input_msg ecx , edx
%macro input_msg 2
	mov edx, %2
	mov ecx, %1
	mov ebx,0
	mov eax,3
	int 0x80
%endmacro

;exit_prog
%macro exit_prog 0
	mov ebx,0
	mov eax,1
	int 0x80
%endmacro


