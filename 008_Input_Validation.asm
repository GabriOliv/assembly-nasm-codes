;==========================================
;Macro List for 008
;==========================================
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

;format_out eax
%macro format_out 1
	mov ebx, 10
	mov esi, 0
	push_stack:
		mov edx, 0
		div ebx
		push rdx
		inc esi
		cmp eax, 0
		je end_stack
		jmp push_stack
	end_stack:
		mov edi, 0
		mov [qde2], esi
	pop_stack:
		pop rax
		add al, 48
		mov [soma+edi], al
		inc edi
		dec esi
		jnz pop_stack
%endmacro

;exit_prog
%macro exit_prog 0
	mov ebx,0
	mov eax,1
	int 0x80
%endmacro

;==========================================
;Main Code
;==========================================
section .data
	mensini db LF, "Programa Soma Assembly"
			db LF, HT,"[Receba dois numeros]"
			db LF, HT,"[6 Digitos MAX]", LF
	tam_ini equ $- mensini

	pedido1 db LF, "1º: "
	pedido1_tam equ $- pedido1
	pedido2 db LF, "2º: "
	pedido2_tam equ $- pedido2
	mens_soma db LF, HT,"Soma: "
	tam_soma equ $- mens_soma

	HT equ 0x09	;\t
	LF equ 0x0A	;\n
	n_max equ 20
	linha db LF

section .bss

	num resb n_max	;Generic Call
	qtd resd 1

	n1 resb n_max	;Primeiro Valor
	num1 resd 1
	n2 resb n_max	;Segundo Valor
	num2 resd 1

	soma resb 7
	vt resd 1
	qde1 resd 1
	qde2 resd 1

section .text
global _start
_start:

;Msg Inicial
	output_msg linha, 1
	output_msg linha, 1
	output_msg mensini, tam_ini

;Msg Pedido 1
pedir1:
	output_msg pedido1, pedido1_tam
	input_msg num, n_max

	dec eax
	jz pedir1
	cmp eax, 6
	ja pedir1
	mov[qtd], eax
	mov [vt], dword 0

	call valida

	cmp [vt], dword 0
	jne pedir1
	mov [num1], eax

;Msg Pedido 2
pedir2:
	output_msg pedido2, pedido2_tam
	input_msg num, n_max

	dec eax
	jz pedir2
	cmp eax, 6
	ja pedir2
	mov[qtd], eax
	mov [vt], dword 0

	call valida

	cmp [vt], dword 0
	jne pedir2
	mov [num2], eax

;Soma dos Numeros
	mov eax, [num1]
	add eax, [num2]
	format_out eax

;Msg Final
	output_msg mens_soma, tam_soma
	output_msg soma, [qde2]
	output_msg linha, 1
	output_msg linha, 1

;Fim de Programa
	exit_prog

;==========================================
;PROCEDIMENTOS
;==========================================
valida:
	mov esi, 0
val_car:
	mov al, [num+esi]
	sub al, 48
	cmp al, 9
	ja erro
	mov [num+esi], al
	inc esi
	cmp esi, [qtd]
	jne val_car
	call format_number

	jmp sai_val
erro:
	mov[vt], dword 1
sai_val:
	ret

;------------------------------------------

format_number:
	mov esi, 0
	mov eax, 0
	mov ebx, 10
	ini_loop:
		mul ebx
		mov edx, 0
		mov dl, [num+esi]
		add eax, edx
		inc esi
		cmp esi, [qtd]
		je sai_for_number
		jmp ini_loop
	sai_for_number:
		ret
