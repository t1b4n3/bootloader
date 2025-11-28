	org 7c00h
	jmp short START

msg: db "You pressed a key\n"
endmsg:

START: 
	; wait for keyboard press
	mov ah, 0
	int 16h

	cmp ah, 00
	jne START_PRINT
	jmp START

START_PRINT:
	mov bx, 000fh

	mov cx, 1
	xor dx, dx
	mov ds, dx
	cld

PRINT:
	mov si, msg
CHAR:
	mov ah, 2
	int 10h
	lodsb

	mov ah, 9
	int 10h
	inc dl

	cmp dl, 80
	jne SKIP
	xor dl, dl
	inc dh

	cmp dh, 25
	jne SKIP
	xor dh, dh

SKIP:	
	cmp si, endmsg
	jne CHAR

times 0200h - 2 -($-$$) db 0 
	dw 0aa55h
