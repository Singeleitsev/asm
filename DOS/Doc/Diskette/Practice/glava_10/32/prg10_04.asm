;----------------------------------------------------------
;prg10_04.asm - программа умножения матрицы на вектор (XMM-вариант).
;----------------------------------------------------------
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
include xmm_32.inc
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	ExitProcess:PROC
.stack	256
.586
.data
;ALIGN 16
xyzw	dd	3 dup (2.0), 1.0	;исходные координаты точки (необходимо инициализировать) и w=1.0
M	dd	16 dup (0.0)	;матрица преобразования расположена по строкам (необходимо инициализировать)
TitleText	db	'Скалярное произведение двух векторов',0
.code
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	eax,eax
	jz	exit	;неудача
;выведем заголовок окна консоли SetConsoleTitle:
	push	offset TitleText
	call	SetConsoleTitleA
;проверить успех вывода заголовка
	test	eax,eax
	jz	exit	;неудача
;-------------------------------------------------------
	lea	edi,xyzw	;адрес вектора
	lea	ebx,M	;адрес матрицы M
	mov	ecx,4	;повторений цикла
	movups	rxmm0,xyzw	;загружаем вектор
row:
	movups	rxmm1,rxmm0	;копируем вектор
	movups	rxmm2,[ebx]	;загружаем очередную строку M
	mulps		rxmm2,rxmm1	;умножаем вектор на очередную строку M
;складываем частичные умножения:
	shufps	rxmm1, rxmm2,0ah
	addps	rxmm2, rxmm1
	shufps	rxmm3, rxmm2,1
	addss	rxmm3, rxmm2	;скалярное сложение
	movss	[edi],rxmm3	;скалярная пересылка
;готовимся к вычислению следующей координаты
	add	edi,4
	loop	row
;теперь необходимо разделить полученные x', y', z', w' на w':
	lea	edi,xyzw	;адрес вектора
	movups	rxmm0,xyzw	;загружаем вектор (x',y',z',w')
	movss	rxmm1,rxmm0	;пересылка w'
	shufps	rxmm1, rxmm1,0	;размножаем w'
	divps	rxmm0,rxmm1
	movups	xyzw, rxmm0	;сохраняем новое значение вектора
;получили (x, y, z, 1)=> убираем w=1 и получаем результат преобразования (x,y,z)
exit:	;выход из программы
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
