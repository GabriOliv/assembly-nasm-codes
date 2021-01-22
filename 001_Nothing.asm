section .data
section .bss
section .text

	global _start
_start:

mov ebx, 0	; read syscall EAX
mov eax, 1	; code exit (sair)
int 0x80	; syscall

