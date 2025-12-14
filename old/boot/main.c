

int main() {
	char *var = "Hello World!";
	char *end;
	__asm {
		org 7c00h

		mov bx, 000fh
		mov cx, 1
		xor dx, dx
		mov ds, dx
		cld

	PRINT:
		mov si var
		
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
		cmp si, end
		jne CHAR
		jmp PRINT
	
	times 510-($-$$) db 0
		dw 0aa55h
	}
}
