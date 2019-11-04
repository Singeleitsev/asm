.model small
.stack 256
.386
.data
string db "Keep rollin', rollin', rollin'"
len_string=$-string
adr_string	dd	string
.code
main:
	mov ax,@data
	mov ds,ax
	xor dx,dx
	mov cx,25
;-----------------------------------------
m1:	mov al,1	;cursor to the end
	xor bh,bh	;videopage No.
	mov bl,7	;atrib
push	cx
	mov cx,len_string
	les bp,adr_string	;address to ES:BP
	mov ah,13h
	int 10h
	inc dh		;string No.
	inc dl		;row No.
pop	cx
	loop m1
;define and slide the page
	mov al,4	;4 strings
	mov bh,0
	mov ch,5
	mov cl,5
	mov dh,10
	mov dl,30
	mov ah,06h
	int 10h
exit:
	mov ax,4c00h
	int 21h
end	main