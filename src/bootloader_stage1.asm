	;bits 16	
	org 0x7c00
	
	
start:
	mov bx, 0x8000
	mov al, 1
	mov ch, 0
	mov dh, 0
	mov cl, 2
	mov ah, 2
	int 0x13

	jmp 0x8000

times 510-($-$$) db 0
	dw 0xAA55
