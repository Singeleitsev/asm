;;show.inc
;;���������������� ��� ������������ ��������� al, ah, ax, eax
;;�� �����:
;;arg_n - ��� ������ �� ��������� al, ah, ax, eax
;;n_poz - ����� ������� �� ������, �� ��������� - 1000
Show	MACRO	arg_n,n_poz:=<1000>
LOCAL	main_part,disp,pause,template,VideoBuffer,p_mode,m1,m2
;;������� �� ������ ����� ������,
;;����� �������� ���������� ������
	jmp	main_part
;;��������� ��������� � ����������
FALSE	equ	0	;����
TRUE	equ	0ffffh	;������
?reg8bit=false	;���� ����, ��� ������� ������� ah ��� al
?reg16bit=false	;���� ����, ��� ������� ������� ax
?reg32bit=false	;���� ����, ��� ������� ������� eax
;�������-������ ��� xlat
template	db	'0123456789ABCDEF'
;����� ����������� - ��� ������� ������ �� �����
VideoBuffer	dw	0b800h

main_part:		;������ ����� ������
;���������� � ����� ������������ ���������:
;eax, ebx, ecx, edx, edi, ds, es
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	edi
	push	ds
	push	es
	push	cs
	pop	ds
;� bx - ����� �������-������� (��� xlat)
	lea	bx,cs:template
	xor	cx,cx	;������� cx
;������ ����� ����������� ����,
;����� ������� ��� ������� �������
IFIDNI	<al>,<&arg_n>	;���� ��������=al ��� AL,
?reg8bit=TRUE		;��������� ����� 8-�������� ��������
	mov	ah,al
ENDIF
;������� �� al ��� AL
IFIDNI	<ah>,<&arg_n>	;���� ��������=ah ��� AH,
?reg8bit=TRUE		;��������� ����� 8-�������� ��������
ENDIF
;������� �� AH ��� ah
IFIDNI	<ax>,<&arg_n>	;���� �������� ����� ax ��� AX,
?reg16bit=TRUE		;��������� ����� 16-�������� ��������
ENDIF
;������� �� ah, AH ,ax ��� AX
IFIDNI	<eax>,<&arg_n>	;���� �������� ����� eax ��� EAX,
?reg32bit=TRUE		;��������� ����� 32-�������� ��������
ENDIF
;��������� ����������� ��������� al, ah, ax, eax
IF	(?reg8bit)	;���� ������� al ��� ah
	push	eax
	and	ah,0f0h	;��������� � ������� �������� ����� ah
	shr	ax,12	;����� ����� � ������ (16-4=12)
	xlat		;���������� �������-�������
;��������� ������� �� al � edi
	mov	di,ax
	shl	di,8
	inc	cx
	pop	eax
	and	ax,0f00h	;��������� � ������� ������� ah
	shr	ax,8	;����� ����� � ������ (16-(4+4)=8)
	xlat		;���������� �������-�������
	or	di,ax	;��������� ���������� ������� � di
	shl	edi,16
	inc	cx
ENDIF
IF	(?reg16bit)	;���� ������� ax ��� ax
;������ ��������� �������� �������� ax
	push	eax
;��������� � ������� �������� ����� ax
	and	ax,0f000h
	shr	ax,12	;����� ����� � ������ (16-4=12)
	xlat		;���������� �������-�������
;��������� ������� �� al � �������
;������� ������� �������� edi
	mov	di,ax
	shl	edi,8
	inc	cx
	pop	eax
	push	eax
;��������� �� ������ �������� ����� ax
	and	ax,0f00h
	shr	ax,8	;����� ����� � ������ (16-(4+4)=8)
	xlat		;���������� �������-�������
;��������� ���������� ������� � �������
;������� ������� �������� edi
	or	di,ax
	shl	edi,8
	inc	cx
	pop	eax
	push	eax
	and	ax,0f0h	;��������� � ������� �������� ����� � ax
	shr	ax,4	;����� ����� � ������ (16-(4+4+4)=4)
	xlat		;���������� �������-�������
	or	di,ax	;��������� ���������� ������� � edi
	shl	edi,8
	inc	cx
	pop	eax
	and	ax,0fh	;��������� � ������� �������� ����� ax
	xlat		;���������� �������-�������
	or	di,ax	;��������� ���������� ������� � edi
	inc	cx
ENDIF
IF	(?reg32bit)	;���� ������� eax ��� EAX
;������ ��������� �������� �������� eax
	push	eax
;��������� � ������� �������� ����� eax
	and	eax,0f0000000h
	shr	eax,28	;����� ����� � ������ (32-4=28)
	xlat		;���������� �������-�������
;��������� ������� �� al � �������
;������� ������� �������� edx
	mov	dh,al
	shl	edx,8
	pop	eax
	push	eax
	inc	cx
	pop	eax
	push	eax
;��������� � ��������� �������� ����� eax
	and	eax,0f000000h
	shr	eax,24	;����� ����� � ������ (32-(4+4)=24)
	xlat		;���������� �������-�������
;��������� ���������� ������� �� al � �������
;������� ������� �������� edx
	mov	dh,al
	shl	edx,8
	inc	cx
	pop	eax
	push	eax
	and	eax,0f00000h
	shr	eax,20
	xlat
	mov	dh,al
	inc	cx
	pop	eax
	push	eax
	and	eax,0f0000h
	shr	eax,16
	xlat
	mov	dl,al
	inc	cx
	pop	eax
	push	eax
	and	eax,0f000h
	shr	eax,12
	xlat
	or	di,ax
	shl	edi,8
	inc	cx
	pop	eax
	push	eax
	and	eax,0f00h
	shr	eax,8
	xlat
	or	di,ax
	shl	edi,8
	pop	eax
	push	eax
	inc	cx
	and	eax,0f0h
	shr	eax,4
	xlat
	or	di,ax
	shl	edi,8
	inc	cx
	pop	eax
	push	eax
	and	eax,0fh
	xlat
	or	di,ax
	inc	cx
	ENDIF
;����� �� ����� ����������
;��������� - � ���� edx:ebx, ���������� ���� - � cx
;�������� ����� ������ ���������������
	mov	eax,cr0
	test	eax,00000001h
	jnz	p_mode
;��� ��������� ������
;��������� � es ����� �����������
	mov	ax,cs:VideoBuffer
	mov	es,ax
p_mode:
;��� ��������� � ����������� �������
;���������� ������ � cx
	cld		;�������� ������ - ��� stosw
	xchg	edi,ebx
	mov	di,n_poz	;��������� ������� ���
					;������ �� �����
disp:
	cmp	ecx,4
	jle	m1	;�������, ���� ecx<=4
	shld	eax,edx,8
	shl	edx,8
	jmp	m2
m1:
	shld	eax,ebx,8
	shl	ebx,8
m2:
	mov	ah,71h	;����-�������
	stosw		;����������� �������� ax
				;� es:di (����������)
	loop	disp	;������ ����� cx ���
	mov	cx,65535	;��������
pause:	loop	pause
;���������������/�������������� �� �����
;������������ ���������
	pop	es
	pop	ds
	pop	edi
	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
ENDM
