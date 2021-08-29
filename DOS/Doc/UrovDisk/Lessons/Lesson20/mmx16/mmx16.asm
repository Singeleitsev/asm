;---------mmx16.asm----------------------------------
.586p
model	use16 small
%NOINCL	;запретить вывод текста включаемых файлов
include mmx16.inc
.stack	100h
.data	;сегмент данных
mmx_mes	db	"Микропроцессор поддерживает MMX-технологию","$"
no_mmx_mes	db	"Микропроцессор не поддерживает MMX-технологию","$"
.code	
main	proc	;начало процедуры main
	mov	ax,@data	
	mov	ds,ax
	xor	edx,edx
	mov	eax,1
	cpuid
	bt	edx,23
	jnc	no_mmx
	mov	ah,9
	mov	dx,offset	mmx_mes
	int	21h
	jmp	exit
no_mmx:	mov	ah,9
	mov	dx,offset	no_mmx_mes
	int	21h
exit:
 	mov	ax,4c00h	;пересылка 4c00h в регистр ax
 	int	21h	;вызов прерывания с номером 21h
main	endp		;конец процедуры main
end	main		;конец программы с точкой входа main