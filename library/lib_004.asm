;Assembly NASM Library Macro
;syscall_write
;
; write int fd, void *buf, size_t count
;
; arg:
;		eax 	4
; 		ebx 	file descriptor
; 		ecx 	ptr to output buffer
; 		edx 	count of bytes to send
; return:
;		eax 	no. of sent bytes (if POSIX conforming f.s.)
; errors:
;		eax 	EAGAIN, EBADF, EFAULT, EINTR, EINVAL, EIO, ENOSPC, EPIPE
;
;syscall_write
%macro syscall_write 3
	mov eax, 4
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
%endmacro
