;prg16_1.asm
;Attention! tasm /m2 prg16_1,,,
.586P		;���������� ���������� Pentium
.MODEL	large
include	mac.inc
;��������� ��� �������� ������������ ���������
descr	STRUC
limit	dw	0
base_1	dw	0
base_2	db	0
attr	db	0
lim_atr	db	0
base_3	db	0
ENDS
;������ ������������� ������������
load_descr	MACRO	des,seg_addr,seg_size
 	mov	des.limit,seg_size
 	xor	eax,eax
 	mov	ax,seg_addr
 	shl	eax,4
 	mov	des.base_1,ax
 	rol	eax,16
 	mov	des.base_2,al
 	ENDM
atr	MACRO	descr,bit1,bit2,bit3
;����� ������������ �������� ���������
;��� �������� ������� ����������
	atr_&descr=constp or bit1 or bit2 or bit3
	ENDM
;��������� ��� �������� ����������������� gdtr
point	STRUC
lim	dw	0
adr	dd	0
	ENDS
;�������� ��� �������� ������������ ���������
;���������� ����� ����� AR ��� ����
;��������� - ���� 0, 4, 5, 6, 7
constp	equ	10010000b
;��� 1
code_r_n	equ	00010000b	;������� �������:
			;������ ���������;
code_r_y	equ	00000010b	;������� �������:
			;������ ���������
data_wm_n	equ	00000000b	;������� ������:
			;����������� ���������
data_wm_y	equ	00000010b	;������� ������:
			;����������� ���������;
;��� 2
code_n	equ	00000000b	;������� ������� ����
code_p	equ	00000100b	;����������� ������� ����
data_	equ	00000000b	;��� �������� ������
stack_	equ	00000000b	;��� �������� �����
;��� 3
code_	equ	00001000b	;������� ����
data_stk	equ	00000000b	;������� ������ ��� �����

stk	segment	stack 'stack' use16
	db	256 dup (0)
stk	ends
;������� ���������� ������������
gdt_seg	segment	para public 'data' use16
gdt_0	descr	<0,0,0,0,0,0>	;������� �� ������������
	atr	gdt_gdt_8,data_wm_y,data_,data_stk
;���� ��������� ���� gdt
gdt_gdt_8	descr	<0,0,0,atr_gdt_gdt_8,0,0>
;�� ����������
gdt_ldt_10	descr	<0,0,0,0,0,0>
	atr	gdt_ds_18,data_wm_y,data_,data_stk
;���������� �������� ������
gdt_ds_18	descr	<0,0,0,atr_gdt_ds_18,0,0>
	atr	gdt_vbf_20,data_wm_y,data_,data_stk
gdt_es_vbf_20	descr	<0,0,0,atr_gdt_vbf_20,0,0>	;����������
	atr	gdt_ss_28,data_wm_y,stack_,data_stk
	gdt_ss_28	descr	<0,0,0,atr_gdt_ss_28,0,0>	;������� �����
	atr	gdt_cs_30,code_r_y,code_n,code_
	gdt_cs_30	descr	<0,0,0,atr_gdt_cs_30,0,0>	;������� ����
gdt_size=$-gdt_0-1	;������ GDT ����� 1
GDT_SEG ENDS
;������ ���������
data	segment	para public 'data' use16	;������� ������
point_gdt	point	<gdt_size,0>
hello	db	"����� ��������� � ���������� ������"
hel_size=$-hello
tonelow	dw	2651	;������ ������� �������� 450 ��
cnt	db	0	;������� ��� ������ �� ���������
temp	dw	?	;������� ������� ��������
data_size=$-point_gdt-1
data	ends
code	segment	byte public 'code' use16
;������� ���� � 16-��������� ������� ���������
assume	cs:code,ss:stk
.SALL
main	proc
	mov	ax,stk
	mov	ss,ax
;��������� ������� ���������� ������������
assume	ds:gdt_seg
	mov	ax,gdt_seg
	mov	ds,ax
	load_descr	gdt_gdt_8,GDT_SEG,gdt_size
	load_descr	gdt_ds_18,DATA,data_size
	load_descr	gdt_es_vbf_20,0b800h,3999
	load_descr	gdt_ss_28,STK,255
	load_descr	gdt_cs_30,CODE,code_size
assume	ds:data
	mov	ax,data
	mov	ds,ax
;��������� gdtr
	xor	eax,eax
	mov	ax,gdt_seg
	shl	eax,4
	mov	point_gdt.adr,eax
	lgdt	point_gdt
;��������� ����������
	cli
	mov	al,80h
	out	70h,al
;������������� � ���������� �����
	mov	eax,cr0
	or	al,1
	mov	cr0,eax
;����������� ��������
	db	0eah	;�������� ��� ������� jmp
	dw	offset protect	;�������� ����� ��������
			;� �������� ������
	dw	30h	;�������� �������� ����
			;� ������� GDT
protect:
;��������� ��������� ��� ��������� ������������
	mov	ax,18h
	mov	ds,ax
	mov	ax,20h
	mov	es,ax
	mov	ax,28h
	mov	ss,ax
;�������� � ���������� ������:
;������� ������ � ����������
	mov	cx,hel_size	;����� ���������
	mov	si,offset hello	;����� ������ ���������
	mov	di,1640	;��������� ����� ����������� ��� ������
	mov	ah,07h	;������� ��������� ��������
outst:
	mov	al,[si]
	mov	es:[di],ax
	inc	si
	inc	di
	inc	di
	loop	outst
;��������� ������
go:
;������� ����� ��������� 110110110b (0�6h):
;�������� ������ ����� ����� 43h - �������
	mov	ax,0B06h
	out	43h,ax	;� ���� 43h
	in	al,61h	;������� �������� ����� 61h � al
	or	al,3	;�������������� ������� - ������ ���
	out	61h,al	;� ���� 61h
	mov	cx,2083	;���������� �����
musicup:
;� ax �������� ������ ������� ������� 1193000/2651 = 450 ��,
;��� 1193000- ������� ��������
	mov	ax,tonelow
	out	42h,al	;al � ���� 42h
	mov	al,ah	;����� ����� al � ah
	out	42h,al	;������� ����ax (ah) � ���� 42h
	add	tonelow,1	;����������� �������
	delay	1	;�������� �� 1 ���
	mov	dx,tonelow	; ������� �������� ������� � dx
	mov	temp,dx	;temp - ������� �������� �������
	loop	musicup	;��������� ���� ���������
	mov	cx,2083
musicdown:
	mov	ax,temp	;������� �������� ������� � ax
	out	42h,al	;������� ����ax (al)� ���� 42h
	mov	al,ah	;����� ����� al � ah
	out	42h,al	;� ���� 42h ��� ������� ���� ax (ah)
	sub	temp,1	;��������� �������� �������
	delay	1	;�������� �� 1 ���
	loop	musicdown	;��������� ���� ���������
nosound:
	in	al,61h	;������� �������� ����� 61h � al
;����� ��������� - ���������� �������� � �������
	and	al,0FCh
	out	61h,al	;� ���� 61h
	mov	dx,2651	;��� ����������� ������
	mov	tonelow,dx
;����������� ������� �������� - ���������� �������� ������
	inc	cnt
	cmp	cnt,5	;5 ���
	jne	go	;���� ��� - ���� �� ����� go
;������������ ������������ ��� ��������� ������
	assume	ds:gdt_seg
	mov	ax,8h
	mov	ds,ax
	mov	gdt_ds_18.limit,0ffffh
	mov	gdt_es_vbf_20.limit,0ffffh
	mov	gdt_ss_28.limit,0ffffh
	mov	gdt_cs_30.limit,0ffffh
assume	ds:data
;�������� ������� ������������
	mov	ax,18h
	mov	ds,ax
	mov	ax,20h
	mov	es,ax
	mov	ax,28h
	mov	ss,ax
	db	0eah
	dw	offset jump
	dw	30h
jump:
	mov	eax,cr0
	and	al,0feh
	mov	cr0,eax
	db	0eah
	dw	offset r_mode
	dw	code
r_mode:
	mov	ax,data
	mov	ds,ax
	mov	ax,stk
	mov	ss,ax
;��������� ����������
	sti
	xor	al,al
	out	70h,al
;��������� ������ ��������� (����������)
	mov	ax,4c00h
	int	21h
main	endp
code_size=$-main
code	ends
	end	main
