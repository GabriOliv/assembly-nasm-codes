section .data				;Declaring Datas and Constants
msg db 'Hello, world!', 0xa		;string
len equ $ - msg				;string length

section .bss	;declaring variables
section .text	;keeping actual code,where the execution start

global _start	;must be declared for linker (ld)
_start:		;tells linker entry point

mov edx,len	;message length
mov ecx,msg	;message to write

mov ebx,1	;file descriptor (std out)
mov eax,4	;system call number (sys_write)
int 0x80	;syscall kernel

mov eax,1	;system call number (sys_exit)
int 0x80	;call kernel
