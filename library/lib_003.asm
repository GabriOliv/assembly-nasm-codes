;Assembly NASM Library Macro
;syscall_read
;
; read int fd, void *buf, size_t count
;
; arg:
; 		eax 	3
; 		ebx		file descriptor
; 		ecx 	ptr to input buffer
; 		edx 	buffer size, max. count of bytes to receive
; return
; 		eax		no. of bytes received, file pointer advanced accordingly
; errors
;		eax		EAGAIN, EBADF, EFAULT, EINTR, EINVAL, EIO, EISDIR
;
;syscall_read
%macro input_msg 3
	mov eax, 3
	mov ebx, %1
	mov ecx, %2
	mov edx, %3
	int 0x80
%endmacro
