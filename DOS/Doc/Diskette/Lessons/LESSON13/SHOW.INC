;;show.inc
;;���ம�।������ ��� ���㠫���樨 ॣ���஢ al, ah, ax, eax
;;�� �室�:
;;arg_n - ��� ������ �� ॣ���஢ al,ah,ax,eax
;;n_poz - ����� ����樨 �� ��࠭�, �� 㬮�砭�� - 1000
Show	MACRO	arg_n,n_poz:=<1000>
LOCAL	main_part,disp,pause,template,VideoBuffer,p_mode,m1,m2
;;���室 �� ��砫� ����� ������,
;;�⮡� �������� �믮������ ������
	jmp	main_part
;;������� ����⠭�� � ��६����
FALSE	equ	0	;;����
TRUE	equ	0ffffh	;;��⨭�
?reg8bit=false	;;䫠� ⮣�, �� ��।�� ॣ���� ah ��� al
?reg16bit=false	;;䫠� ⮣�, �� ��।�� ॣ���� ax
?reg32bit=false	;;䫠� ⮣�, �� ��।�� ॣ���� eax
;;⠡���-蠡��� ��� xlat
template	db	'0123456789ABCDEF'
;;���� ��������� - ��� ��אַ�� �뢮�� �� ��࠭
VideoBuffer	dw	0b800h

main_part:		;;��砫� ����� ������
;;��࠭���� � �⥪� �ᯮ��㥬�� ॣ���஢:
;;eax, ebx, ecx, edx, edi, ds, es
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	edi
	push	ds
	push	es
	push	cs
	pop	ds
;;� bx - ���� ⠡����-蠡���� (��� xlat)
	lea	bx,cs:template
	xor	cx,cx	;���⪠ cx
;;��砫� ����� ��।������ ⮣�,
;;����� ॣ���� �� ��।�� ������
IFIDNI	<al>,<&arg_n>	;;�᫨ ��㬥��=al ��� AL,
?reg8bit=TRUE		;;��⠭���� 䫠�� 8-��⮢��� ॣ����
	mov	ah,al
ENDIF
;;��।�� �� al ��� AL
IFIDNI	<ah>,<&arg_n>	;;�᫨ ��㬥��=ah ��� AH,
?reg8bit=TRUE		;;��⠭���� 䫠�� 8-��⮢��� ॣ����
ENDIF
;;��।�� �� AH ��� ah
IFIDNI	<ax>,<&arg_n>	;;�᫨ ��㬥�� ࠢ�� ax ��� AX,
?reg16bit=TRUE		;;��⠭���� 䫠�� 16-��⮢��� ॣ����
ENDIF
;;��।�� �� ah, AH ,ax ��� AX
IFIDNI	<eax>,<&arg_n>	;;�᫨ ��㬥�� ࠢ�� eax ��� EAX,
?reg32bit=TRUE		;;��⠭���� 䫠�� 32-��⮢��� ॣ����
ENDIF
;;��ࠡ�⪠ ᮤ�ন���� ॣ���஢ al, ah, ax, eax
IF	(?reg8bit)	;;�᫨ ��।�� al ��� ah
	push	eax
	and	ah,0f0h	;;���饭�� � ���襩 ���થ ��⮢ ah
	shr	ax,12	;;ᤢ�� ��⮢ � ��砫� (16-4=12)
	xlat		;;�࠭���� ⠡����-蠡����
;;����饭�� ᨬ���� �� al � edi
	mov	di,ax
	shl	di,8
	inc	cx
	pop	eax
	and	ax,0f00h	;;���饭�� � ����襩 ��ࠤ� ah
	shr	ax,8	;;ᤢ�� ��⮢ � ��砫� (16-(4+4)=8)
	xlat		;;�࠭���� ⠡����-蠡����
	or	di,ax	;;����饭�� ��।���� ᨬ���� � di
	shl	edi,16
	inc	cx
ENDIF
IF	(?reg16bit)	;;�᫨ ��।�� ax ��� ax
;;��砫� ��ࠡ�⪨ ���祭�� ॣ���� ax
	push	eax
;;���饭�� � ���襩 ���થ ��⮢ ax
	and	ax,0f000h
	shr	ax,12	;;ᤢ�� ��⮢ � ��砫� (16-4=12)
	xlat		;;�࠭���� ⠡����-蠡����
;;����饭�� ᨬ���� �� al � ������
;;��ࠤ� ���襩 �������� edi
	mov	di,ax
	shl	edi,8
	inc	cx
	pop	eax
	push	eax
;;���饭�� �� ��ன ���થ ��⮢ ax
	and	ax,0f00h
	shr	ax,8	;;ᤢ�� ��⮢ � ��砫� (16-(4+4)=8)
	xlat		;;�࠭���� ⠡����-蠡����
;;����饭�� ��।���� ᨬ���� � �������
;;��ࠤ� ���襩 �������� edi
	or	di,ax
	shl	edi,8
	inc	cx
	pop	eax
	push	eax
	and	ax,0f0h	;;���饭�� � ���쥩 ���થ ��⮢ � ax
	shr	ax,4	;;ᤢ�� ��⮢ � ��砫� (16-(4+4+4)=4)
	xlat		;;�࠭���� ⠡����-蠡����
	or	di,ax	;;����饭�� ��।���� ᨬ���� � edi
	shl	edi,8
	inc	cx
	pop	eax
	and	ax,0fh	;;���饭�� � ����襩 ���થ ��⮢ ax
	xlat		;;�࠭���� ⠡����-蠡����
	or	di,ax	;;����饭�� ��।���� ᨬ���� � edi
	inc	cx
ENDIF
IF	(?reg32bit)	;;�᫨ ��।�� eax ��� EAX
;;��砫� ��ࠡ�⪨ ���祭�� ॣ���� eax
	push	eax
;;���饭�� � ���襩 ���થ ��⮢ eax
	and	eax,0f0000000h
	shr	eax,28	;;ᤢ�� ��⮢ � ��砫� (32-4=28)
	xlat		;;�࠭���� ⠡����-蠡����
;;����饭�� ᨬ���� �� al � ������
;;��ࠤ� ���襩 �������� edx
	mov	dh,al
	shl	edx,8
	pop	eax
	push	eax
	inc	cx
	pop	eax
	push	eax
;;���饭�� � ᫥���饩 ���થ ��⮢ eax
	and	eax,0f000000h
	shr	eax,24	;;ᤢ�� ��⮢ � ��砫� (32-(4+4)=24)
	xlat		;;�࠭���� ⠡����-蠡����
;;����饭�� ��।���� ᨬ���� �� al � �������
;;��ࠤ� ���襩 �������� edx
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
;;�뢮� �� ��࠭ १����
;;१���� � ��� edx:ebx, ������⢮ ��� � cx
;;�஢�ਬ ०�� ࠡ��� ���ய�����
	mov	eax,cr0
	test	eax,00000001h
	jnz	p_mode
;;��� ॠ�쭮�� ०���
;;����㦠�� � es ���� ����������
	mov	ax,cs:VideoBuffer
	mov	es,ax
p_mode:
;;��� ॠ�쭮�� � ���饭���� ०����
;;������⢮ 横��� � cx
	cld		;;��ᬮ�� ���। - ��� stosw
	xchg	edi,ebx
	mov	di,n_poz	;;��砫쭠� ������ ���
			;;�뢮�� �� ��࠭
disp:
	cmp	ecx,4
	jle	m1	;���室, �᫨ ecx<=4
	shld	eax,edx,8
	shl	edx,8
	jmp	m2
m1:
	shld	eax,ebx,8
	shl	ebx,8
m2:
	mov	ah,71h	;;����-��ਡ��
	stosw		;;����஢���� ���祭�� ax
			;;� es:di (���������)
	loop	disp	;;����� 横�� cx ࠧ
	mov	cx,65535	;;����প�
pause:	loop	pause
;;��८�।������/����⠭������� �� �⥪�
;;�ᯮ��㥬�� ॣ���஢
	pop	es
	pop	ds
	pop	edi
	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
ENDM

