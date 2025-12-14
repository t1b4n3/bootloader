	org 7c00h
	jmp short START

cmd: db "> "
endcmd:

START:

echo times 128 db 0
counter db 0

	mov bx, 000fh

	mov cx, 1
	xor dx, dx
	mov ds, dx
	cld

CLEAR:
	mov ax, 0600h
	mov bh, 07
	mov cx, 0000h
	mov dx, 184fh
	int 10h

PRINT:
	mov si, cmd
CHAR:
	mov ah, 2
	int 10h
	lodsb

	mov ah, 9
	int 10h
	inc dl
	
	cmp si, endcmd
	jne CHAR

	xor si, si

ECHO:
	mov ah, 0
	int 16h

	;mov si, counter
	mov [echo + si], al
	mov ah, 0eh
	int 10h

	cmp al, 0dh
	jne NOTENTER
	cmp ah, 1ch
	jne NOTENTER
	
	mov si, echo
	jmp CHAR


NOTENTER:
	;inc counter
	inc si
	jmp ECHO


times 510-($-$$) db 0
	dw 0aa55h
