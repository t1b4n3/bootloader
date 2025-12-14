	org 7c00h

	jmp short START

name: db "T1B4N3 is my hacker handle "
endname:

START:
	mov bx, 000fh

	mov cx, 1 ; write 1 char
	xor dx, dx ; start to left corner
	mov ds, dx ; ensure ds = 0 to load the message
	cld	; ensure direction flag is cleared

PRINT:
	mov si, name ; loads addr of first byte

CHAR: 	
	mov ah, 2  ; BIOS interrupt 10 | subfunction 2 to set cursor
	int 10h
	lodsb	; load a byte of the message into al

	mov ah, 9 ; BIOS interrupt 10 | subfunction 2 write char 
	int 10h
	inc dl 	; advance curso

	cmp dl, 80 ; wrap around edge of screed
	jne SKIP
	xor dl, dl
	inc dh

	cmp dh, 25; wrap around botton of screen
	jne SKIP
	xor dh, dh

SKIP:
	cmp si, endname
	jne CHAR
	
times 0200h - 2 - ($-$$) db 0 ; zerofill
	dw 0aa55h ; boot sector signature
