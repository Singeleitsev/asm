;displays the original bitmap on screen and saves to the buffer array

virtual at buffer
  BMPHEADER:
    .ID 	 dw ?	  ;BM
    .filesize	 dd ?
    .res1	 dw ?
    .res2	 dw ?
    .ptrbits	 dw ?
    .bisize	 dd ?
    .biwidth	 dd ?
    .biheight	  dd ?
    .biplanes	 dw ?
    .bibitcount  dw ?
    .bicompress  dd ?
    .bisizeimage dd ?
    .bixppmeter  dd ?
    .biyppmeter  dd ?
    .biclrused	 dd ?
    .biclrimp	 dd ?

end virtual

load_picture:
	invoke	CreateFile,picture,GENERIC_READ,0,0,OPEN_EXISTING,0,0
	mov	edi,eax
	invoke	ReadFile,edi,BMPHEADER,22000,bytes_count,0
	invoke	CloseHandle,edi

	mov	rsi, buffer
	add	rsi, 54 		 ;set source
	mov	rdi,[ddsd.lpSurface]	 ;set destination

;      add rdi, 71680     ;go to start of last line
	mov rax, [ddsd.lPitch]
	mov rbx, 20
	mul rbx
	add rdi, rax

	mov ebx, 21; pic height
	mov ecx, 320 ; pic width

inloop1:
      movsb
      movsb
      movsb
      stosb
	dec ecx
	jnz inloop1
      sub rdi, 3584 ; one line
      sub rdi, 1280 ; picture line
	mov ecx,  320
	dec ebx
	jnz inloop1

	ret
