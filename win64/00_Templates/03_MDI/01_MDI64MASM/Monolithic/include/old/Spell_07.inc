;-----------------------------------------------------------------------------
;Макрос вывода MessageBox c ASCII-представлением 
;16-ричного значения 64-битного регистра RAX
;Вход1: RAX = исходное значение
;Вход2: Имя дескриптора вызывающего окна (либо 0)
;Вход3: Имя переменной szCaption для названия MessageBox'а
;Вход4: Имя переменной формата szText db "Регистр rax: 0000.0000.0000.0000h",0
;Выход: MessageBox типа MB_OK + MB_ICONINFORMATION
;-----------------------------------------------------------------------------

Spell64rax MACRO hWnd, szCaption, szText
LOCAL GetWord, GetByte, add37h, SetByte, ShowMessage
push rax
push rbx
push rcx
push rdx
push r8
push r9

;Адрес байта в памяти поместим в регистр rbx
mov rbx, offset szText	;Адрес начала строки
add rbx, sizeof szText	;Адрес байта, следующего за концом строки
sub rbx, 3		;Адрес младшей цифры в строке

;В регистр rcx поместим сразу два счётчика:
;ch = 4 внешних цикла и cl = 4 внутренних цикла
xor rcx, rcx		;Чистим rcx
mov ch, 4
 GetWord:
mov cl, 4
;Берём младший байт и выделяем из него младшую 16-ричную цифру (4 бита)
 GetByte:
xor rdx, rdx		;Чистим rdx
mov dl, al		;Берём минимум: только младшие 8 бит
;Чистим dl: обнуляем старшие 4 бита, оставляем только младшие 4 бита
and dl, 0Fh
;Переводим полученную цифру в ASCII-код:
;если младшие 4 бита образуют цифру от 0 до 9, то прибавляем 30h
;если младшие 4 бита образуют цифру от 0Ah до 0Fh, то прибавляем 37h
cmp dx, 9
jg add37h
add dx, 30h
jmp SetByte
  add37h:
add dx, 37h
;Сохраняем байт по заданному адресу
  SetByte:
mov [rbx], dl
;Сдвигаем под следующую 16-ричную цифру
ror rax, 4	;Сдвиг исходного числа
dec rbx		;Обновление адреса
;Уменьшаем счётчик внутреннего цикла
dec cl
cmp cl, 0
jg GetByte 
;Пропускаем место для точки между группами из четырёх разрядов
dec rbx
;Уменьшаем счётчик внешнего цикла
dec ch
cmp ch, 0
jg GetDWord

  ShowMessage:
mov rcx, hWnd		;hWnd
lea rdx, szText		;lpText
lea r8, szCaption	;lpCaption
mov r9, 40h		;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h
call MessageBoxA

pop r9
pop r8
pop rdx
pop rcx
pop rbx
pop rax
ENDM ;Spell64rax
;-----------------------------------------------------------------------------