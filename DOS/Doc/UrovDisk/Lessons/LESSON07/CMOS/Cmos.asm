%TITLE "Редактор CMOS и RTS памяти"

MASM
MODEL   small

;******************************************************************************

.386

.data   ;сегмент данных *******************************************************
        stroka          DB      00h     ;номер строки ввывода сообщения
        kolonka         DB      00h     ;номер колонки ввывода сообщения
        tek_el          DB      00h     ;значение ячейки по указаному адресу
        firstp_val      DB      00h     ;1-я шестнадцатиричная цифра в коде ASCII
        secondp_val     DB      00h     ;2-я шестнадцатиричная цифра в коде ASCII
        svalue          DB      00h     ;начальный адрес читаемой CMOS и RTS памяти
        evalue          DB      00h     ;конечный адрес читаемой CMOS и RTS памяти
        color           DB      0Fh     ;атрибут цвета выводимых строки или символа
        bit_number      DB      30h     ;номер бита
	file_name	DB	"CMOS.BAK",0
        file_name2      DB      "CMOS.SAV",0
	handle		DW	?
        screeng_mode    DB      ?       ;режим экрана
	count		DB	1	;счетчик
	chislo		DB	0	;bcd число

        message1        DB      "Cmos Editor v2.3             "
        dlmessage1      =       $-message1
        message2        DB      "Programmed by Pashkov Aleksey"
        dlmessage2      =       $-message2
        message3        DB      "6.99"
        dlmessage3      =       $-message3
	message4	DB	"Введите редактируемый адрес в hex форме - "
	dlmessage4	=	$-message4
	message5	DB	" О.К.  Press any key"
	dlmessage5	=	$-message5
	message6	DB	"CMOS скопирована в файл. Нажми любую клавишу"
	dlmessage6	=	$-message6
	message7	DB	"Введите значение в hex форме - "
	dlmessage7	=	$-message7
	message8	DB	"СMOS скопирована из файла. Нажми любую клавишу"
	dlmessage8	=	$-message8
        clear_str       DB      "                                                                                "
        dlclear_str     =       $-clear_str
        zagolovok       DB      "Адресс Значение Бит Знач Пояснение"
        Key_Menu        DB      "F2-ЗаписьCMOS|F3-ЧтениеCMOS|F4-Редактировать|F10-EXIT                           "
        ascii_code      DB      0h
        scan_code       DB      0h
        page_index      DW      0h
	error_message	DB	"Can't create file"

        mes0            DB      "                         секунды                                                "
                        DB      "                         секунды будильника                                     "
                        DB      "                         минуты                                                 "
                        DB      "                         минуты будильника                                      "
                        DB      "                         часы                                                   "
                        DB      "                         часы будильника                                        "
                        DB      "                         день недели                                            "
                        DB      "                         день месяца                                            "
                        DB      "                         месяц                                                  "
                        DB      "                         год                                                    "
                        DB      "                         RTS STATUS REGISTER A (статус регистер)                "
                        DB      "                         { биты с 0 по 3                                        "
                        DB      "                         выходная частота меандра,                              "
                        DB      "                         она равна 1024 Гц                                      "
                        DB      "                         биты должны быть равны 0110                           }"
                        DB      "                         обновление времени. 0=готов к чтению                   "
                        DB      "                         { биты с 4 по 6 - делитель частоты,                    "
                        DB      "                         для 32.768 кГц                                         "
                        DB      "                         биты должны быть равны 010                            }"
                        DB      "                                                                                "
                        DB      "                         RTS STATUS REGISTER B (статус регистр)                 "
                        DB      "                         зимнее/летнее время. 0=переключение запрещено          "
                        DB      "                         12/24 - часовой режим: 1=24 часовой                    "
                        DB      "                         BCD/BIN формат: 0=BCD                                  "
                        DB      "                         разрешение выходного меандра (см. 0Ah): 0=запрещено    "
                        DB      "                         разреш. прерываний по окончанию смены времени: 0=запр  "
                        DB      "                         разрешение прерываний от будильника: 0=запрещено       "
                        DB      "                         разрешение переодических прерываний: 0=запрещено       "
                        DB      "                         остановка часов: 0=нормальный ход                      "
                        DB      "                                                                                "
                        DB      "                         RTS STATUSREGISTER C чтение флагов идентиф-в прерываний"
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         UF прерывание по смене времени                         "
                        DB      "                         AF прерывание от будильника                            "
                        DB      "                         PF переодические прерывания                            "
                        DB      "                         IRQF общий запрос прерывания                           "
        dl0             =       $-mes0

        mes0D           DB      "                         RTS STATUS REGISTER D                                  "
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         зарезервирован                                         "
                        DB      "                         питание: 1=норма, 0=разряд батарей                     "
                        DB      "                                                                                "
                        DB      "                         POST DIAGNOSTIC STATUS BYTE                            "
                        DB      "                         1=зарезервирован                                       "
                        DB      "                         1=зерезервирован                                       "
                        DB      "                         1=Time Valid нет формальной ошибки часов-календаря25:98"
                        DB      "                         1=HDD Erorr ошибка при инициализации винчестера        "
                        DB      "                         1=несоотв-вие размера ОЗУ,опред-го тестом записи в CMOS"
                        DB      "                         1=Bad Config - ошибка конфигурации                     "
                        DB      "                         1=Checksum Bad - ошибка контрольной суммы CMOS         "
                        DB      "                         1=Power Lost - терялось питание CMOS                   "
                        DB      "                                                                                "
                        DB      "                         используется POST для определения предыстории остановки"
                        DB      "                         00=аппаратный или програмный сброс                     "
                        DB      "                         01=размер памяти определен                             "
                        DB      "                         02=тест памяти прошел                                  "
                        DB      "                         03=тест памяти выявил ошибку                           "
                        DB      "                         04=POST завершен идет перезагрузка системы             "
                        DB      "                         05=JMR FAR [0:0467h] с инициал-й контроллера прерываний"
                        DB      "                         06=тест защищеннго режима прошел                       "
                        DB      "                         07=тест защищеннго режима выявил ошибку                "
                        DB      "                         08=ошибка при определении размера памяти               "
                        DB      "                         09=перемещен блок Extendede Memory (INT15h)            "
                        DB      "                         0A=JMR FAR[0:0467h]без инициал-и контроллера прерываний"
                        DB      "                         0B=используется 80386                                  "
                        DB      "                                                                                "
                        DB      "                         ТИПЫ НГМД                                              "
                        DB      "                         Дисковод  B 0000=нету, 0001=360 Кбайт                  "
                        DB      "                         Дисковод  B 0010=1,2 Мбайт                             "
                        DB      "                         Дисковод  B 0011=720 Кбайт                             "
                        DB      "                         Дисковод  B 0100=1,4 Мбайт                             "
                        DB      "                         Дисковод  A 0000=нету, 0001=360 Кбайт                  "
                        DB      "                         Дисковод  A 0010=1,2 Мбайт                             "
                        DB      "                         Дисковод  A 0011=720 Кбайт                             "
                        DB      "                         Дисковод  A 0100=1,4 Мбайт                             "
        dl0D            =       $-mes0D

        mes10           DB      "                         Зарезервирован                                         "
                        DB      "                         ТИПЫ НЖМД                                              "
                        DB      "                         привод 1  { 0000=нет                                   "
                        DB      "                         привод 1    комбинация битов с 0001 по 1110            "
                        DB      "                         привод 1    соответстветствуют типам с 1 по 14         "
                        DB      "                         привод 1    1111=тип в байте 19h                      }"
                        DB      "                         привод 0  { 0000=нет                                   "
                        DB      "                         привод 0    комбинация битов с 0001 по 1110            "
                        DB      "                         привод 0    соответстветствуют типам с 1 по 14         "
                        DB      "                         привод 0    1111=тип в байте 1Ah                      }"
                        DB      "                                                                                "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         УСТАНОВЛЕННОЕ ОБОРУДОВАНИЕ                             "
                        DB      "                         1=есть НГМД                                            "
                        DB      "                         1=математический сопроцессор                           "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зареззервирован                                        "
                        DB      "                         { биты 2-3 тип первичного видеоадаптера 00-EGA или VGA "
                        DB      "                         01-CGA 40 столбцов, 10-CGA 80 ст, 11-MDA 80 ст        }"
                        DB      "                         { биты 6-7 количество НГМД:                            "
                        DB      "                         00 - 1, 01 - 2                                        }"
                        DB      "                                                                                "
                        DB      "                         { Размер базовой памяти,Kb                             "
                        DB      "                           Low/High 0280h=640K                                 }"
                        DB      "                         { Размер расширенной памяти, Kb                        "
                        DB      "                           Low/High                                            }"
                        DB      "                         { Расширенный тип диска C,D                            "
                        DB      "                           ( в PC/2 - зарезервированы )                        }"
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
        dl10            =       $-mes10

        mes20           DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         Зарезервирован                                         "
                        DB      "                         { Контрольная сумма CMOS cчитается относительно        "
                        DB      "                           адресов с 10h по 20h (High/Low)                     }"
                        DB      "                         { Реальный размер расширенной памяти, Kb               "
                        DB      "                           (High/Low)                                          }"
                        DB      "                         В PS/2 контрольная CRS-сумма CMOS с 10h-31h (High/Low) "
                        DB      "                         ФЛАГИ POST                                             "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         128Kb ОЗУ под границ 1Mb,1=есть,доступна теневая память"
                        DB      "                         SETUP флаг:1=первая загрузка после выполнения SETUP    "
                        DB      "                                                                                "
                        DB      "                         Зарезервированы (можно писать свою информацию          "
                        DB      "                         для привязки програмного обеспечения к машине).        "
                        DB      "                         Зарезервированы (можно писать свою информацию          "
                        DB      "                         для привязки програмного обеспечения к машине).        "
                        DB      "                         Зарезервированы (можно писать свою информацию          "
                        DB      "                         для привязки програмного обеспечения к машине).        "
                        DB      "                         Зарезервированы (можно писать свою информацию          "
                        DB      "                         для привязки програмного обеспечения к машине).        "
                        DB      "                         Зарезервированы (можно писать свою информацию          "
                        DB      "                         для привязки програмного обеспечения к машине).        "
                        DB      "                         Зарезервированы (можно писать свою информацию          "
                        DB      "                         для привязки програмного обеспечения к машине).        "
dl20                    =       $-mes20

mes_adr         DW      mes0, mes0D, mes10, mes20
mes_dl          DW      dl0, dl0D, dl10, dl20
mas_evalue      DB      0Ch, 10h, 20h, 3Fh
mas_svalue      DB      00h,0Dh,11h,21h

;******************************************************************************

.stack  256     ;сегмент стека ************************************************

;******************************************************************************

.code   ;сегмент кода

;процедура определения текущего графического режима ***************************
;выходные параметры:
;screeng_mode - номер трафического режима
        get_screeng_mode proc
                push    ax
                mov     ah,0Fh
                int     10h
                mov     screeng_mode,al

                pop     ax
                ret
        get_screeng_mode endp
;******************************************************************************

;процедура установки графического режима **************************************
;входные параметры:
;screeng_mode - номер графического режима который ныжно установить
        set_screeng_mode proc
                mov     ah,00h
                mov     al,screeng_mode
                int     10h

                ret
        set_screeng_mode endp
;******************************************************************************

;процедура очистки экрана *****************************************************
        clear_screeng proc
                mov     ah,00h
                mov     al,03h
                int     10h

                mov     ah,11h
                mov     al,12h
                mov     bl,00h
                int     10h

                ret
        clear_screeng endp
;******************************************************************************

;чтение шестнадцатиричного числа с клавиатуры *************************************************
;ВХОДНЫЕ ПАРАМЕТРЫ
;ВЫХОДНЫЕ ПАРАМЕТРЫ
;
	read_int proc
		push	ax
	
cyclRC:         call    press_key
		
		cmp	scan_code,01h
		je	exit_nsk
		
                cmp     ascii_code,00h
                je      cyclRC
		
		;отображение нажатой клавише на экране
		mov     al,ascii_code
                mov     tek_el,al
                call    print_el 

		;символ должен принадлежать от 0 до 9
cyclRC1:	cmp	ascii_code,30h
		jnae	cyclRC
		cmp	ascii_code,39h
		jna	RC1	

		;либо от "A" до "F"
cyclRC2:	cmp	ascii_code,41h
		jnae	cyclRC
		cmp	ascii_code,46h
		jna	RC2	

		;либо от "a" до	"f"
cyclRC3:	cmp	ascii_code,61h
		jnae	cyclRC
		cmp	ascii_code,66h
		jnbe	cyclRC
		
		sub	ascii_code,57h
		jmp	next_int
		
RC1:		sub	ascii_code,30h
		jmp	next_int
		
RC2:		sub	ascii_code,37h
		jmp	next_int

next_int:	call	cursor_position
		call	cursor_sdvig
		
		cmp	count,2
		je	second_int

		mov	ah,ascii_code
		shl	ah,4
		
second_int:	inc	count
		cmp	count,2
		jna	cyclRC
		or	ah,ascii_code
		mov	tek_el,ah
		mov	chislo,ah

		call	cursor_sdvig
		mov	count,1
exitRI:
		pop	ax
                ret
        read_int endp
;*****************************************************************************

;процедура вывода шестнадцатиричного числа с учетом цвета *********************
;входные параметры
;firstp_val - первый разряд числа
;secondp_val - второй разряд числа
        print_h_el proc
                push    ax
                push    bx
                push    cx
                push    dx

                mov     al,firstp_val   ;заносим в al превую цифру числа
                mov     ah,09h          ;номер процедуры BIOS
                mov     bl,0Fh          ;выбор цвета
                mov     cx,01h          ;количество повторений
                int     10h             ;вызов процедуры BIOS

                ;сдвиг на одну позию от текущей
                call    cursor_sdvig

                mov     al,secondp_val  ;заносим в al вторую цифру числа
                mov     ah,09h          ;номер процедуры BIOS
                mov     bl,0Fh          ;выбор цвета
                mov     cx,01h          ;количество повторений
                int     10h             ;вызов процедуры BIOS

                call    cursor_sdvig

                mov     al,"h"
                mov     ah,09h
                mov     bl,07h
                mov     cx,01h
                int     10h

                pop     dx
                pop     cx
                pop     bx
                pop     ax
                ret
        print_h_el endp
;*****************************************************************************

;процедура вывода значения ячекйи в двоичной системе ***************************
;входные параметры
;tek_el - значение хранящееся в ячейки
;svalue - адресс выводимого значения
        print_el_bin proc
                push    ax
                push    dx

                call    readSR

                mov     dl,tek_el
                mov     ah,00000001b

                ;вывод адреса ячейки
                mov     dh,svalue
                mov     tek_el,dh
                call    filter
                call    cursor_position
                add     kolonka,2
                call    print_position
                call    print_h_el
                ;*******************

                ;вывод значения ячейки в шестнадцатиричной форме
                mov     dh,dl
                mov     tek_el,dh
                call    filter
                mov     kolonka,10
                call    print_position
                call    print_h_el
                ;***********************************************

        startpeb:
                mov     dh,dl
                mov     tek_el,dh

                ;вывод номера бита
                push    ax

                mov     ah,bit_number
                mov     tek_el,ah
                mov     kolonka,17
                call    print_position
                call    print_el

                inc     ah
                mov     bit_number,ah
                pop     ax
                ;*****************

                ;вывод значения ячейки в двоичной форме
                mov     al,dl
                and     al,ah

                cmp     al,00h
                je      noll
                mov     tek_el,"1"
                jmp     peb1
        noll:
                mov     tek_el,"0"
        peb1:
                mov     kolonka,21
                call    print_position

                call    print_el
                call    corretka
                call    cursor_position
                ;***************************************

                shl     ah,1

                cmp     ah,00h
                jne     startpeb

                mov     bit_number,30h

                call    corretka

                pop     dx
                pop     ax
                ret
        print_el_bin endp
;******************************************************************************

;процедура вывода символа с учетом цвета *************************************
;входные параметры
;tek_el - выводимый символ
        print_el proc
                push    ax
                push    dx

                mov     al,tek_el       ;заносим в al вторую цифру числа
                mov     ah,09h          ;номер процедуры BIOS
                mov     bl,0Fh          ;выбор цвета
                mov     cx,01h          ;количество повторений
                int     10h             ;вызов процедуры BIOS

                pop     dx
                pop     ax
                ret
        print_el endp
;*****************************************************************************

;процедура вывода сообщений с учетом цвета ***********************************
;ВХОДНЫЕ ПАРАМЕТРЫ bp - указатель на сообщение, cx - длина строки
        print_string proc
                push    ax

                mov     ah,13h
                mov     al,01h          ;режим сервиса для вывода сообщения
                mov     bh,00h          ;номер страницы экрана
                mov     bl,color
                mov     dh,stroka
                mov     dl,kolonka
                int     10h

                ;востановление стандартного цвета
                mov     color,0Fh
                ;********************************

                pop     ax
                ret
        print_string endp
;*****************************************************************************

;процедура сдвига курсора на одну позицию вправо ******************************
        cursor_sdvig proc
                push    ax

                call    cursor_position
                inc     kolonka
                call    print_position

                pop     ax
                ret
        cursor_sdvig endp
;******************************************************************************

;процедура определения текущей позиции курсора ********************************
;выходные данные
;stroka - строка
;kolonka - колонка
        cursor_position proc
                push    ax
                push    bx
                push    dx

                mov     ah,03h
                mov     bh,00h
                int     10h

                mov     stroka,dh
                mov     kolonka,dl

                pop     dx
                pop     bx
                pop     ax
                ret
        cursor_position endp
;******************************************************************************

;процедура очистки строки *****************************************************
;ВХОДНЫЕ ПАРАМЕТРЫ
;color
;kolonka
;stroka
	clear_string proc
		push	bp
		push	cx
		
		call	print_position
                mov     bp,offset clear_str
                mov     cx,dlclear_str
                call    print_string
		
		pop	cx
		pop	bp
		ret
	clear_string endp
;******************************************************************************

;процедура позиционирования курсора *******************************************
;входные параметры
;stroka - строка
;kolonka - колонка
        print_position proc
                push    ax
                push    dx

                mov     ah,02h
                mov     dh,stroka
                mov     dl,kolonka
                int     10h

                pop     dx
                pop     ax
                ret
        print_position endp
;*****************************************************************************

;фильтр ввывода на экран, преоброзровывает числр в шестнадцатиричную форму *********************
;входные параметры
;tek_el - выводимое число
        filter proc
                push    ax
                push    dx

                ;обработка второй тетраэдры ******************************************
                mov     ah,tek_el       ;в ah фильтруемое значение
                and     ah,00001111b    ;выделяем вторую тетраэдру

                cmp     ah,0Ah          ;сравниваем ее с 0Ah
                jae     symb1           ;переоход если AL>=0Ah

                add     ah,30h          ;в al ASCII код цифры соответствующий цифре в al
                mov     secondp_val,ah  ;передача к.с.ц. во внешнюю переменную
                jmp     tetr2

        symb1:  ;если цифре соответствует шестнадцатеричная цифра - ABCDEF
                add     ah,37h          ;в al ASCII код цифры соответствующей цифре в al
                mov     secondp_val,ah  ;передача к.с.ц. во внешнюю переменную
                jmp     tetr2

        tetr2:  ;обработка второй тетраэдры ***********************************
                mov     ah,tek_el       ;в al фильтруемое значение
                shr     ah,4            ;сдвиг в вправо на четыре бита для получения первой тетраэдры

                cmp     ah,0Ah          ;сравниваем al с 0Ah
                jae     symb2   ;переход если AL>=0Ah

                add     ah,30h          ;в al ASCII код цифры соответствующей цифре в al
                mov     firstp_val,ah   ;передача к.с.ц. во внешнюю переменную
                jmp     exit
        symb2:
                add     ah,37h          ;в al ASCII код цифры соответствующей цифре в al
                mov     firstp_val,ah   ;передача к.с.ц. во внешнюю переменную

        exit:   pop     dx
                pop     ax
                ret
        filter endp
;*****************************************************************************

;процедура перехода на следующую строку **************************************
        corretka proc
                push    ax
                push    dx

                mov     ah,02h
                mov     dl,13
                int     21h
                mov     ah,02h
                mov     dl,10
                int     21h

                pop     dx
                pop     ax
                ret
        corretka endp
;*****************************************************************************

;процедура чтения значений CMOS и RTS ****************************************
;входные параметры
;svalue - адрес ячейки чтение значения которой производится
;выходные параметры
;tek_el - прочтенное значение
        readSR proc
                push    ax

                mov     al,svalue       ;номер ячейки из которой производитсячтение
                out     70h,al          ;заносим это значние в порт smoc rts
                wait
                xor     ax,ax           ;очистка регистра ax
                in      al,71h          ;вводим в регистр al из порта значение ячейки smoc rts
                wait
                mov     tek_el,al       ;присваеваем tek_el значение ячейки

                pop     ax
                ret
        readSR endp
;*****************************************************************************

;процедура ввода значения в ячейку CMOS **************************************
;ВХОДНЫЕ ПАРАМЕТРЫ
;tek_el - записываемое значение
        writeSR proc
                push    ax

                mov     al,svalue
                out     70h,al
                mov     al,tek_el
                out     71h,al

                pop     ax
                ret
        writeSR endp
;******************************************************************************

;функция нажата ли клавиша ****************************************************
        press_key proc
                push    ax

                mov     ah,00h
                int     16h
                mov     ascii_code,al
                mov     scan_code,ah

                pop     ax
                ret
        press_key endp
;******************************************************************************

;процедура вывода дампа памяти ************************************************
;выходные параметры
;svalue - начальный адрес
;page_index - номер страницы
        scr_page    proc
                push    ax
                push    bx
                push    si

                mov     si,page_index
                mov     al,mas_evalue[si]
		mov     evalue,al
		mov	al,mas_svalue[si]
		mov	svalue,al
                mov     bx,si
                add     bx,bx
                mov     bp,mes_adr[bx]
                mov     cx,mes_dl[bx]

                pop     si
                pop     bx
                pop     ax

                push    ax

                call    clear_screeng

                push    bp
                push    cx

                ;создания заголовка
                call    cursor_position
                mov     bp,offset zagolovok
                mov     cx,34
                mov     color,02h
                call    print_string
                call    corretka

                ;меню ф-х клавиш
                mov     kolonka,0
                mov     stroka,49
                mov     color,0Dh
                mov     bp,offset Key_Menu
                mov     cx,60
                call    print_string
                ;******************

                pop     cx
                pop     bp

                ;вывод пояснений
                mov     stroka,02h
                call    print_string
                ;***************

                ;вывод адреса и содержимого
                call    print_position
                call    menu_byte       ;печать адреса и значения по этому адресу
                ;**************************

                ;call    press_key

                pop     ax
                ret
        scr_page endp
;******************************************************************************
;процедура вывода адреса и значения ячейки по этому адресу в меню *************
;входные параметры
;svalue - адрес
        menu_byte proc
                push    ax
                push    dx

        start:
                mov     dh,svalue       ;помещаем в dh адресс читаем ячейки
                mov     tek_el,dh       ;адресс чит ячейки в tek_el

                ;выбор двоичный или шестнадцатиричный вывод содержимого ячейки
                cmp     dh,0Ah
                je      bin_el
                cmp     dh,0Bh
                je      bin_el
                cmp     dh,0Ch
                je      bin_el
                cmp     dh,0Dh
                je      bin_el
                cmp     dh,0Eh
                je      bin_el
                cmp     dh,10h
                je      bin_el2
                cmp     dh,12h
                je      bin_el
                cmp     dh,14h
                je      bin_el
                cmp     dh,33h
                je      bin_el
                ;*************************************************************

                ;сдвигаем курсор вправо на 2 позиций перед выводом адреса ячейки
                call    cursor_position ;опред полож курсора
                add     kolonka,02h     ;увеличиваем номер текущей колонки на 2
                call    print_position  ;сдвигаем курсор
                ;***************************************************************

                call    filter
                call    print_h_el      ;выводим адр чит яч

                ;сдвигаем курсор вправо на 6 позиций перед выводом значения ячейки
                call    cursor_position ;опред полож курсора
                add     kolonka,6h      ;увеличиваем номер текущей колонки на 2
                call    print_position  ;сдвигаем курсор
                ;*****************************************************************

                ;вывод шестнадцатиричного значения ячейки
                call    readSR
                call    filter
                call    print_h_el
                call    corretka
                ;****************************************

        exit_mbp:
                mov     ah,svalue
                inc     ah
                mov     svalue,ah

        cmp     ah,evalue
        jbe start

                pop     dx
                pop     ax
                ret
        bin_el:
                call    corretka
                call    print_el_bin
                jp exit_mbp
        bin_el2:
                mov     stroka,36
                call    print_position
                call    corretka
                call    print_el_bin
                jp exit_mbp
        menu_byte endp
;******************************************************************************

;обработка ошибки создания файла **********************************************
	error_file proc
		mov	bp,offset error_message
		mov	cx,16
		call print_string
		jmp	exit_dos

		ret
	error_file endp
;******************************************************************************

;открытие файла ***************************************************************
	open_file proc
                push    ax
                push    dx

                mov     ah,3Dh
                mov     al,02h
                mov     dx,offset file_name
                int     21h
                mov     handle,ax
		jnc	ok
	        call    error_file
ok:
                pop     dx
                pop     ax
		ret
	open_file endp
;******************************************************************************

;закрытие файла****************************************************************
	close_file proc
                push    ax
                push    bx

		;закрытие файла
		mov	ah,3Eh
		mov	bx,handle
		int	21h

                pop     bx
                pop     ax
		ret
	close_file endp
;******************************************************************************

;запись файла *****************************************************************
;ВХОДНЫЕ ПАРАМЕТРЫ
;svalue
;ax - имя файла
        save_file proc
                mov     dl,svalue
		pusha

		;создание файла
                mov     dx,ax
		mov	ah,3Ch
		mov	cx,00h
		int	21h
		mov	handle,ax
		jc	error_file

		;копирование CMOS в файл		
		mov	svalue,00h
cycl1:		call	readSR

		mov	ah,40h
		mov	bx,handle
		mov	cx,1
		mov	dx,offset tek_el
		int	21h

		inc	svalue
		cmp	svalue,40h
		jne	cycl1
                call    close_file

		;вывод сообщения
		mov     kolonka,0
                mov     stroka,47
		call	print_position
		mov     color,0Ah
                mov     bp,offset message6
                mov     cx,dlmessage6
                call    print_string
		call	press_key
		call	clear_string		
		

		popa
		mov	svalue,dl
                ret
        save_file endp
;******************************************************************************

;загрузить файл ***************************************************************
;ВХОДНЫЕ ПАРАМЕТРЫ
;svalue
;ax - имя файла
        load_file proc
		mov	dl,svalue
		pusha

                call    open_file
		mov	svalue,00h
cycl2:          mov     ah,3Fh
		mov	bx,handle
		mov	cx,1
		mov	dx,offset tek_el
		int	21h

                call    writeSR
		inc	svalue
		cmp	svalue,40h
                jne     cycl2
                call    close_file

		;вывод сообщения
		mov     kolonka,0
                mov     stroka,47
		call	print_position
		mov     color,0Ah
                mov     bp,offset message8
                mov     cx,dlmessage8
                call    print_string
		call	press_key
		call	clear_string		

		call	scr_page

		popa
		mov	svalue,dl
                ret                
        load_file endp
;******************************************************************************
;управляющая процедура ********************************************************
        main proc
                ;инициализация сегмента данных
                mov     ax,@data
                mov     ds,ax
                mov     es,ax
                xor     ax,ax
                ;*****************************

                ;инициализация текущего графического режима
                call    get_screeng_mode

                ;очистка экрана
                call    clear_screeng

                ;ввывод собщения об авторских правах
                mov     bp,offset message1
                mov     cx,dlmessage1
                call    print_string
                call    corretka

                call    cursor_position
                mov     bp,offset message2
                mov     cx,dlmessage2
                call    print_string
                call    corretka

                call    cursor_position
                mov     bp,offset message3
                mov     cx,dlmessage3
                call    print_string
                call    corretka
                ;***********************************

                ;mov     al,svalue
                ;mov     mas_svalue[0],al
                call    press_key
                call    scr_page

non_sys_key:    call    press_key

                ;нажата не системная клавиша
                cmp     ascii_code,00
                jne     non_sys_key

                ;обработка системных клавиш
                cmp     scan_code,51h
                je      PgDn

                cmp     scan_code,49h
                je      PgUp

                cmp     scan_code,44h
                je      exit_dos
		
		cmp	scan_code,3Ch
                je      save_cmos

		cmp	scan_code,3Dh
                je      load_cmos

		cmp	scan_code,3Eh
		je	edit_cmos

                jmp     non_sys_key

                ;************************************************************
PgDn:           cmp     svalue,40h
                je      non_sys_key
                inc     page_index
                mov     si,page_index
                call    scr_page
                jmp     non_sys_key

PgUp:           cmp     svalue,0Dh
                je      non_sys_key
                dec     page_index
                mov     si,page_index
                mov     ah,mas_svalue[si]
                mov     svalue,ah
                call    scr_page
                jmp     non_sys_key
		
save_cmos:      mov     ax,offset file_name
                call    save_file

		jmp	non_sys_key
                ;**************************************************************

load_cmos:      ;загрузка CMOS из файла ***************************************
                call    load_file
		jmp	non_sys_key

edit_cmos:	;редактирование CMOS ******************************************
		pusha

                mov     ax,offset file_name2
                call    save_file

		;ввод адрес
                mov     kolonka,0
                mov     stroka,47
		call	print_position
		
		mov     color,0Ah
		
                mov     bp,offset message4
                mov     cx,dlmessage4
                call    print_string
		
		call    read_int
		
		mov	al,chislo
		push	ax
		
		mov     bp,offset message5
                mov     cx,dlmessage5
                call    print_string
		
		call	press_key
		
		;очистка текущей строки
                mov     kolonka,0
                mov     stroka,47
		call	clear_string
                mov     color,0Ah

		;ввод нового значения по введенному адресу
                mov     bp,offset message7
                mov     cx,dlmessage7
                call    print_string
		
		call    read_int
		
		mov	al,chislo
		push	ax
		
                mov     bp,offset message5
                mov     cx,dlmessage5
                call    print_string
	
		pop	ax
		mov	tek_el,al

		pop	ax
		mov	svalue,al
	
		call 	writeSR

		call	press_key

exit_nsk:	;очистка текущей строки
                mov     kolonka,0
                mov     stroka,47
                mov     color,0Ah
		call	clear_string

		call	scr_page
		
		popa
		jmp	non_sys_key
;******************************************************************************

		;**************************************************************
                ;востановление графического режима который был до запуска программы
exit_dos:       call set_screeng_mode
                ;************************

        ;вызов стандартной функции DOS выход из программы
        mov     ax,4c00h
        int     21h
        ;************************************************

        main endp
;******************************************************************************

end main
