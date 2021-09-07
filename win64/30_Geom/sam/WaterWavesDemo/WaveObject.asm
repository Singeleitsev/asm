;-------------------------------------------------------------------------
; WaveObject
;-------------------------------------------------------------------------
; Библиотека для применения эффектов "падающих капель" на bitmap'ы
;-------------------------------------------------------------------------
; Версия: 1.0.041019
; Оригинальная разработка: luoyunbin@sina.com (http://asm.yeah.net)
; Портировано на FASM: ManHunter / PCL (http://www.manhunter.ru)
; Отладка и доработка: user
;-------------------------------------------------------------------------
; Используемые константы и структуры
;-------------------------------------------------------------------------
; F_WO_ACTIVE             = 0001h
; F_WO_NEED_UPDATE        = 0002h
; F_WO_EFFECT             = 0004h
; F_WO_ELLIPSE            = 0008h
;
; struct  WAVE_OBJECT
;         hWnd            dd ?
;         dwFlag          dd ?
;
;         hDcRender       dd ?
;         hBmpRender      dd ?
;         lpDIBitsSource  dd ?
;         lpDIBitsRender  dd ?
;         lpWave1         dd ?
;         lpWave2         dd ?
;
;         dwBmpWidth      dd ?
;         dwBmpHeight     dd ?
;         dwDIByteWidth   dd ?
;         dwWaveByteWidth dd ?
;         dwRandom        dd ?
;
;         dwEffectType    dd ?
;         dwEffectParam1  dd ?
;         dwEffectParam2  dd ?
;         dwEffectParam3  dd ?
;
;         dwEff2X         dd ?
;         dwEff2Y         dd ?
;         dwEff2XAdd      dd ?
;         dwEff2YAdd      dd ?
;         dwEff2Flip      dd ?
;
;         stBmpInfo       BITMAPINFO
; ends
;-------------------------------------------------------------------------

;-------------------------------------------------------------------------
; Инициализация
;-------------------------------------------------------------------------
; _hWnd = хэндл окна, в котором будет отрисовываться изображение
; _hBmp = хэндл битмапа
; _dwSpeed = скорость опроса таймера
; _dwType = тип эффекта
;-------------------------------------------------------------------------
proc _WaveInit _lpWaveObject:DWORD,_hWnd:DWORD,_hBmp:DWORD,_dwSpeed:DWORD,_dwType:DWORD
        local   dwReturn:DWORD
        local   stBmp:BITMAP

        pusha
        xor     eax,eax
        mov     [dwReturn],eax
        mov     ebx,[_lpWaveObject]
        invoke  RtlZeroMemory,ebx,sizeof.WAVE_OBJECT

        cmp     [_dwType],0
        jz      @f
        or      [ebx+WAVE_OBJECT.dwFlag],F_WO_ELLIPSE
@@:
        push    [_hWnd]
        pop     [ebx+WAVE_OBJECT.hWnd]
        invoke  GetTickCount
        mov     [ebx+WAVE_OBJECT.dwRandom],eax

        lea     eax,[stBmp]
        invoke  GetObject,[_hBmp],sizeof.BITMAP,eax
        or      eax,eax
        jnz     .loc_endif_1
@@:
        inc     [dwReturn]
        jmp     .Ret
.loc_endif_1:
        mov     eax,[stBmp.bmHeight]
        mov     [ebx+WAVE_OBJECT.dwBmpHeight],eax
        cmp     eax,3
        jle     @b
        mov     eax,[stBmp.bmWidth]
        mov     [ebx+WAVE_OBJECT.dwBmpWidth],eax
        cmp     eax,3
        jle     @b

        push    eax
        shl     eax,2
        mov     [ebx+WAVE_OBJECT.dwWaveByteWidth],eax
        pop     eax
        lea     eax,[eax+eax*2]
        add     eax,3
        and     eax,not 0011b
        mov     [ebx+WAVE_OBJECT.dwDIByteWidth],eax

        invoke  GetDC,[_hWnd]
        mov     esi,eax
        invoke  CreateCompatibleDC,esi
        mov     [ebx+WAVE_OBJECT.hDcRender],eax
        invoke  CreateCompatibleBitmap,esi,[ebx+WAVE_OBJECT.dwBmpWidth],[ebx+WAVE_OBJECT.dwBmpHeight]
        mov     [ebx+WAVE_OBJECT.hBmpRender],eax
        invoke  SelectObject,[ebx+WAVE_OBJECT.hDcRender],eax

        mov     eax,[ebx+WAVE_OBJECT.dwWaveByteWidth]
        mul     [ebx+WAVE_OBJECT.dwBmpHeight]
        mov     edi,eax
        invoke  GlobalAlloc,GPTR,edi
        mov     [ebx+WAVE_OBJECT.lpWave1],eax
        invoke  GlobalAlloc,GPTR,edi
        mov     [ebx+WAVE_OBJECT.lpWave2],eax

        mov     eax,[ebx+WAVE_OBJECT.dwDIByteWidth]
        mul     [ebx+WAVE_OBJECT.dwBmpHeight]
        mov     edi,eax
        invoke  GlobalAlloc,GPTR,edi
        mov     [ebx+WAVE_OBJECT.lpDIBitsSource],eax
        invoke  GlobalAlloc,GPTR,edi
        mov     [ebx+WAVE_OBJECT.lpDIBitsRender],eax

        mov     [ebx+WAVE_OBJECT.stBmpInfo.bmiHeader.biSize],sizeof.BITMAPINFOHEADER
        push    [ebx+WAVE_OBJECT.dwBmpWidth]
        pop     [ebx+WAVE_OBJECT.stBmpInfo.bmiHeader.biWidth]
        mov     eax,[ebx+WAVE_OBJECT.dwBmpHeight]
        neg     eax
        mov     [ebx+WAVE_OBJECT.stBmpInfo.bmiHeader.biHeight],eax
        inc     [ebx+WAVE_OBJECT.stBmpInfo.bmiHeader.biPlanes]
        mov     [ebx+WAVE_OBJECT.stBmpInfo.bmiHeader.biBitCount],24
        mov     [ebx+WAVE_OBJECT.stBmpInfo.bmiHeader.biCompression],BI_RGB
        mov     [ebx+WAVE_OBJECT.stBmpInfo.bmiHeader.biSizeImage],0

        invoke  CreateCompatibleDC,esi
        push    eax
        invoke  SelectObject,eax,[_hBmp]
        invoke  ReleaseDC,[_hWnd],esi
        pop     eax
        mov     esi,eax

        lea     eax,[ebx+WAVE_OBJECT.stBmpInfo]
        invoke  GetDIBits,esi,[_hBmp],0,[ebx+WAVE_OBJECT.dwBmpHeight],\
                [ebx+WAVE_OBJECT.lpDIBitsSource],eax,DIB_RGB_COLORS

        lea     eax,[ebx+WAVE_OBJECT.stBmpInfo]
        invoke  GetDIBits,esi,[_hBmp],0,[ebx+WAVE_OBJECT.dwBmpHeight],\
                [ebx+WAVE_OBJECT.lpDIBitsRender],eax,DIB_RGB_COLORS
        invoke  DeleteDC,esi

        cmp     [ebx+WAVE_OBJECT.lpWave1],0
        je      @f
        cmp     [ebx+WAVE_OBJECT.lpWave2],0
        je      @f
        cmp     [ebx+WAVE_OBJECT.lpDIBitsSource],0
        je      @f
        cmp     [ebx+WAVE_OBJECT.lpDIBitsRender],0
        je      @f
        cmp     [ebx+WAVE_OBJECT.hDcRender],0
        jnz     .loc_endif_2
@@:
        stdcall _WaveFree,ebx
        inc     [dwReturn]
.loc_endif_2:
        invoke  SetTimer,[_hWnd],ebx,[_dwSpeed],_WaveTimerProc

        or      [ebx+WAVE_OBJECT.dwFlag],F_WO_ACTIVE or F_WO_NEED_UPDATE
        stdcall _WaveRender,ebx
        invoke  GetDC,[ebx+WAVE_OBJECT.hWnd]
        stdcall _WaveUpdateFrame,ebx,eax,TRUE
        invoke  ReleaseDC,[ebx+WAVE_OBJECT.hWnd],eax
.Ret:
        popad
        mov     eax,[dwReturn]
        ret
endp

;-------------------------------------------------------------------------
; Установка или изменение типа и параметров эффекта
;-------------------------------------------------------------------------
; _dwType = тип эффекта:
;       0 - нет никаких эффектов
;       1 - мелкий дождик
;       2 - глайдер
;       3 - проливной дождь
; _dwParam1 = скорость применения эффекта
; _dwParam2 = сила падения капель
; _dwParam3 = количество одновременных кругов на воде
;-------------------------------------------------------------------------
proc _WaveEffect _lpWaveObject:DWORD,_dwType:DWORD,_dwParam1:DWORD,_dwParam2:DWORD,_dwParam3:DWORD
        local   dwMaxY:DWORD
        local   dwMaxX:DWORD

        push    ebx eax

        mov     ebx,[_lpWaveObject]

        mov     eax,[_dwType]

        cmp     eax,0
        jne     .loc_else_1

        and     [ebx+WAVE_OBJECT.dwFlag],not F_WO_EFFECT
        mov     [ebx+WAVE_OBJECT.dwEffectType],eax
        jmp     .loc_endif
.loc_else_1:
        cmp     eax,2
        jne     .loc_else_2

        mov     eax,[_dwParam1]
        mov     [ebx+WAVE_OBJECT.dwEff2XAdd],eax
        mov     [ebx+WAVE_OBJECT.dwEff2YAdd],eax

        mov     eax,[ebx+WAVE_OBJECT.dwBmpWidth]
        dec     eax
        dec     eax
        stdcall _WaveRandom,ebx,eax
        inc     eax
        mov     [ebx+WAVE_OBJECT.dwEff2X],eax

        mov     eax,[ebx+WAVE_OBJECT.dwBmpHeight]
        dec     eax
        dec     eax
        stdcall _WaveRandom,ebx,eax
        inc     eax
        mov     [ebx+WAVE_OBJECT.dwEff2Y],eax
.loc_else_2:
        push    [_dwType]
        pop     [ebx+WAVE_OBJECT.dwEffectType]
        push    [_dwParam1]
        pop     [ebx+WAVE_OBJECT.dwEffectParam1]
        push    [_dwParam2]
        pop     [ebx+WAVE_OBJECT.dwEffectParam2]
        push    [_dwParam3]
        pop     [ebx+WAVE_OBJECT.dwEffectParam3]
        or      [ebx+WAVE_OBJECT.dwFlag],F_WO_EFFECT
.loc_endif:
        pop     eax
        pop     ebx
        ret
endp

;-------------------------------------------------------------------------
; Генераторы случайных чисел
;-------------------------------------------------------------------------
proc _WaveRandom16 _lpWaveObject:DWORD
        mov     ebx,[_lpWaveObject]
        push    edx
        push    ecx
        mov     eax,[ebx+WAVE_OBJECT.dwRandom]
        mov     ecx,32768-1     ; 2^15-1
        mul     ecx
        add     eax,2048-1      ; 2^11-1
        adc     edx,0
        mov     ecx,2147483647  ; 2^31-1
        div     ecx
        mov     eax,[ebx+WAVE_OBJECT.dwRandom]
        mov     [ebx+WAVE_OBJECT.dwRandom],edx
        and     eax,0000ffffh
        pop     ecx
        pop     edx
        ret
endp

proc _WaveRandom _lpWaveObject:DWORD, _dwMax:DWORD
        push    ebx ecx edx

        stdcall _WaveRandom16,[_lpWaveObject]
        mov     edx,eax
        stdcall _WaveRandom16,[_lpWaveObject]
        shl     eax,16
        or      ax,dx
        mov     ecx,[_dwMax]
        or      ecx,ecx
        jz      @f
        xor     edx,edx
        div     ecx
        mov     eax,edx
@@:
        pop     edx ecx ebx
        ret
endp

;-------------------------------------------------------------------------
; Перермешивание волн
;-------------------------------------------------------------------------
; Wave2(x,y) = (Wave1(x+1,y)+Wave1(x-1,y)+Wave1(x,y+1)+Wave1(x,y-1))/2-Wave2(x,y)
; Wave2(x,y) = Wave2(x,y) - Wave2(x,y) >> 5
; xchg Wave1,Wave2
;-------------------------------------------------------------------------
proc _WaveSpread _lpWaveObject:DWORD
        pusha
        mov     ebx,[_lpWaveObject]
        test    [ebx+WAVE_OBJECT.dwFlag],F_WO_ACTIVE
        jz      .Ret

        mov     esi,[ebx+WAVE_OBJECT.lpWave1]
        mov     edi,[ebx+WAVE_OBJECT.lpWave2]
        mov     ecx,[ebx+WAVE_OBJECT.dwBmpWidth]
        mov     eax,[ebx+WAVE_OBJECT.dwBmpHeight]
        dec     eax
        mul     ecx
        jmp     .loc_while_chk
.loc_while:
        push    eax

        test    [ebx+WAVE_OBJECT.dwFlag],F_WO_ELLIPSE
        jz      .loc_else

        mov     edx,[esi+ecx*4-1*4]
        add     edx,[esi+ecx*4+1*4]
        add     edx,[esi+ecx*4-2*4]
        add     edx,[esi+ecx*4+2*4]
        lea     edx,[edx+edx*2]
        add     edx,[esi+ecx*4-3*4]
        add     edx,[esi+ecx*4-3*4]
        add     edx,[esi+ecx*4+3*4]
        add     edx,[esi+ecx*4+3*4]

        lea     eax,[esi+ecx*4]
        sub     eax,[ebx+WAVE_OBJECT.dwWaveByteWidth]
        mov     eax,[eax]
        shl     eax,3
        add     edx,eax

        lea     eax,[esi+ecx*4]
        add     eax,[ebx+WAVE_OBJECT.dwWaveByteWidth]
        mov     eax,[eax]
        shl     eax,3
        add     edx,eax

        sar     edx,4
        sub     edx,[edi+ecx*4]

        mov     eax,edx
        sar     eax,5
        sub     edx,eax

        mov     [edi+ecx*4],edx
        jmp     .loc_endif
.loc_else:
        mov     edx,[esi+ecx*4-1*4]
        add     edx,[esi+ecx*4+1*4]

        lea     eax,[esi+ecx*4]
        sub     eax,[ebx+WAVE_OBJECT.dwWaveByteWidth]
        add     edx,[eax]

        lea     eax,[esi+ecx*4]
        add     eax,[ebx+WAVE_OBJECT.dwWaveByteWidth]
        add     edx,[eax]

        sar     edx,1
        sub     edx,[edi+ecx*4]

        mov     eax,edx
        sar     eax,5
        sub     edx,eax

        mov     [edi+ecx*4],edx
.loc_endif:
        pop     eax
        inc     ecx

.loc_while_chk:
        cmp     ecx,eax
        jb      .loc_while

        mov     [ebx+WAVE_OBJECT.lpWave1],edi
        mov     [ebx+WAVE_OBJECT.lpWave2],esi
.Ret:
        popad
        ret
endp

;-------------------------------------------------------------------------
; Получение цвета нового пиксела из смежных
;-------------------------------------------------------------------------
; esi -> edi, ecx = line width
; return = (4*Pixel(x,y)+3*Pixel(x-1,y)+3*Pixel(x+1,y)+3*Pixel(x,y+1)+3*Pixel(x,y-1))/16
;-------------------------------------------------------------------------
_WaveGetPixel:
        movzx   eax,byte [esi]
        shl     eax,2
        movzx   edx,byte [esi+3]
        lea     edx,[edx+2*edx]
        add     eax,edx
        movzx   edx,byte [esi-3]
        lea     edx,[edx+2*edx]
        add     eax,edx
        movzx   edx,byte [esi+ecx]
        lea     edx,[edx+2*edx]
        add     eax,edx
        mov     edx,esi
        sub     edx,ecx
        movzx   edx,byte [edx]
        lea     edx,[edx+2*edx]
        add     eax,edx
        shr     eax,4
        mov     [edi],al
        inc     esi
        inc     edi
        retn

;-------------------------------------------------------------------------
; Отрисовка волн
;-------------------------------------------------------------------------
; posx = Wave1(x-1,y)-Wave1(x+1,y)+x
; posy = Wave1(x,y-1)-Wave1(x,y+1)+y
; SourceBmp(x,y) = DestBmp(posx,posy)
;-------------------------------------------------------------------------
proc _WaveRender _lpWaveObject:DWORD
        local   dwFlag:DWORD
        local   dwPtrSource:DWORD
        local   dwPosY:DWORD
        local   dwPosX:DWORD

        pushad
        xor     eax,eax
        mov     [dwFlag],eax
        mov     ebx,[_lpWaveObject]

        test    [ebx+WAVE_OBJECT.dwFlag],F_WO_ACTIVE
        jz      .Ret

        or      [ebx+WAVE_OBJECT.dwFlag],F_WO_NEED_UPDATE
        mov     esi,[ebx+WAVE_OBJECT.lpWave1]
        mov     edi,[ebx+WAVE_OBJECT.dwWaveByteWidth]

        xor     ecx,ecx
        inc     ecx
.Loop1:
        xor     edx,edx
.Loop2:
        push    edx

        mov     eax,edi
        sub     eax,[ebx+WAVE_OBJECT.dwWaveByteWidth]
        mov     eax,[esi+eax]
        mov     [dwPosY],eax

        mov     eax,[ebx+WAVE_OBJECT.dwWaveByteWidth]
        lea     eax,[edi+eax]
        mov     eax,[esi+eax]
        sub     [dwPosY],eax
        add     [dwPosY],ecx

        mov     eax,[esi+edi-4]
        sub     eax,[esi+edi+4]
        add     eax,edx                 ;@dwPosX = eax
        mov     [dwPosX],eax

        cmp     eax,0
        jl      .Continue
        cmp     eax,[ebx+WAVE_OBJECT.dwBmpWidth]
        jge     .Continue
        mov     eax,[dwPosY]
        cmp     eax,0
        jl      .Continue
        cmp     eax,[ebx+WAVE_OBJECT.dwBmpHeight]
        jge     .Continue

;-------------------------------------------------------------------------
; ptrSource = dwPosY * dwDIByteWidth + dwPosX * 3
; ptrDest = i * dwDIByteWidth + j * 3
;-------------------------------------------------------------------------

        mov     eax,[dwPosX]
        lea     eax,[eax+eax*2]
        mov     [dwPosX],eax
        push    edx
        mov     eax,[dwPosY]
        mul     [ebx+WAVE_OBJECT.dwDIByteWidth]
        add     eax,[dwPosX]
        mov     [dwPtrSource],eax

        mov     eax,ecx
        mul     [ebx+WAVE_OBJECT.dwDIByteWidth]
        pop     edx
        lea     edx,[edx+edx*2]
        add     eax,edx                 ;@dwPtrDest = eax

        pushad
        mov     ecx,[dwPtrSource]
        mov     esi,[ebx+WAVE_OBJECT.lpDIBitsSource]
        mov     edi,[ebx+WAVE_OBJECT.lpDIBitsRender]
        lea     esi,[esi+ecx]
        lea     edi,[edi+eax]
        cmp     ecx,eax
        jz      .loc_else
        or      [dwFlag],1
        mov     ecx,[ebx+WAVE_OBJECT.dwDIByteWidth]
.loc_else:
        cld
        movsw
        movsb
.loc_endif:
        popad

.Continue:
        pop     edx
        inc     edx
        add     edi,4
        cmp     edx,[ebx+WAVE_OBJECT.dwBmpWidth]
        jb      .Loop2

        inc     ecx
        mov     eax,[ebx+WAVE_OBJECT.dwBmpHeight]
        dec     eax
        cmp     ecx,eax
        jb      .Loop1

        DIB_RGB_COLORS = 0

        lea     eax,[ebx+WAVE_OBJECT.stBmpInfo]
        invoke  SetDIBits,[ebx+WAVE_OBJECT.hDcRender],[ebx+WAVE_OBJECT.hBmpRender],\
                0,[ebx+WAVE_OBJECT.dwBmpHeight],[ebx+WAVE_OBJECT.lpDIBitsRender],\
                eax,DIB_RGB_COLORS
        cmp     [dwFlag],0
        jnz     .Ret
        and     [ebx+WAVE_OBJECT.dwFlag],not F_WO_ACTIVE
.Ret:
        popad
        ret
endp

;-------------------------------------------------------------------------
; Обновление изображения
;-------------------------------------------------------------------------
proc _WaveUpdateFrame _lpWaveObject:DWORD,_hDc:DWORD,_bIfForce:DWORD
        pushad
        mov     ebx,[_lpWaveObject]

        cmp     [_bIfForce],0
        jnz     @f
        test    [ebx+WAVE_OBJECT.dwFlag], F_WO_NEED_UPDATE
        jz      .loc_endif
@@:
        invoke  BitBlt,[_hDc],0,0,[ebx+WAVE_OBJECT.dwBmpWidth],\
                [ebx+WAVE_OBJECT.dwBmpHeight],[ebx+WAVE_OBJECT.hDcRender],\
                0,0,SRCCOPY
        and     [ebx+WAVE_OBJECT.dwFlag],not F_WO_NEED_UPDATE
.loc_endif:
        popad
        ret
endp

;-------------------------------------------------------------------------
; Отработка падения капли, например, по таймеру или при движении курсора
;-------------------------------------------------------------------------
proc _WaveDropStone _lpWaveObject:DWORD,_dwX:DWORD,_dwY:DWORD,_dwSize:DWORD,_dwWeight:DWORD
        local   dwMaxY:DWORD
        local   dwMaxX:DWORD

        pushad
        mov     ebx,[_lpWaveObject]

        mov     edx,[_dwSize]
        shr     edx,1

        mov     eax,[_dwX]
        mov     esi,[_dwY]

        mov     ecx,eax
        mov     edi,esi
        add     eax,edx         ; x + size
        sub     ecx,edx         ; x - size

        push    edx
        test    [ebx+WAVE_OBJECT.dwFlag],F_WO_ELLIPSE
        jz      @f
        shr     edx,1
@@:
        add     esi,edx         ; y + size
        sub     edi,edx         ; y - size
        pop     edx

        shl     edx,1
        or      edx,edx
        jnz     @f
        inc     edx
@@:
        mov     [_dwSize],edx

        inc     eax
        cmp     eax,[ebx+WAVE_OBJECT.dwBmpWidth]
        jge     .Ret
        cmp     ecx,1
        jl      .Ret
        inc     esi
        cmp     esi,[ebx+WAVE_OBJECT.dwBmpHeight]
        jge     .Ret
        cmp     edi,1
        jl      .Ret

        dec     eax
        dec     esi

        mov     [dwMaxX],eax
        mov     [dwMaxY],esi
        jmp     .loc_endw_1
.loc_while_1:
        push    edi
        jmp     .loc_endw_2

.loc_while_2:
        mov     eax,ecx
        sub     eax,[_dwX]
        imul    eax
        push    eax
        mov     eax,edi
        sub     eax,[_dwY]
        imul    eax
        pop     edx
        add     eax,edx
        push    eax
        mov     eax,[_dwSize]
        imul    eax
        pop     edx

        cmp     edx,eax
        ja      @f
        mov     eax,edi
        mul     [ebx+WAVE_OBJECT.dwBmpWidth]
        add     eax,ecx
        shl     eax,2
        add     eax,[ebx+WAVE_OBJECT.lpWave1]
        push    [_dwWeight]
        pop     dword [eax]
@@:
        inc     edi

.loc_endw_2:
        cmp     edi,[dwMaxY]
        jbe     .loc_while_2

        pop     edi
        inc     ecx
.loc_endw_1:
        cmp     ecx,[dwMaxX]
        jbe     .loc_while_1

        or      [ebx+WAVE_OBJECT.dwFlag],F_WO_ACTIVE
.Ret:
        popa
        ret
endp

;-------------------------------------------------------------------------
; Вызов эффекта по таймеру
;-------------------------------------------------------------------------
proc _WaveTimerProc _hWnd:DWORD,_uMsg:DWORD,_idEvent:DWORD,_dwTime:DWORD
        pusha
        mov     ebx,[_idEvent]

        stdcall _WaveSpread,ebx
        stdcall _WaveRender,ebx

        test    [ebx+WAVE_OBJECT.dwFlag],F_WO_NEED_UPDATE
        jz      @f
        invoke  GetDC,[ebx+WAVE_OBJECT.hWnd]
        stdcall _WaveUpdateFrame,ebx,eax,FALSE
        invoke  ReleaseDC,[ebx+WAVE_OBJECT.hWnd],eax
@@:
        test    [ebx+WAVE_OBJECT.dwFlag],F_WO_EFFECT
        jz      .Ret
        mov     eax,[ebx+WAVE_OBJECT.dwEffectType]
;-------------------------------------------------------------------------
; Type1  - мелкий дождь
; Param1 - скорость
; Param2 - сила падения капель
; Param3 - количество кругов на воде
;-------------------------------------------------------------------------
        cmp     eax,1
        jne     .loc_else_1

        mov     eax,[ebx+WAVE_OBJECT.dwEffectParam1]
        or      eax,eax
        jz      @f
        stdcall _WaveRandom,ebx,eax
        or      eax,eax
        jnz     .Ret
@@:
        mov     eax,[ebx+WAVE_OBJECT.dwBmpWidth]
        dec     eax
        dec     eax
        stdcall _WaveRandom,ebx,eax
        inc     eax
        mov     ecx,eax

        mov     eax,[ebx+WAVE_OBJECT.dwBmpHeight]
        dec     eax
        dec     eax
        stdcall _WaveRandom,ebx,eax
        inc     eax
        mov     edx,eax

        stdcall _WaveRandom,ebx,[ebx+WAVE_OBJECT.dwEffectParam2]
        inc     eax
        mov     esi,eax
        stdcall _WaveRandom,ebx,[ebx+WAVE_OBJECT.dwEffectParam3]
        add     eax,50
        stdcall _WaveDropStone,ebx,ecx,edx,esi,eax

        jmp     .loc_endif_1
;-------------------------------------------------------------------------
; Type2  - глайдер
; Param1 - скорость движения глайдера
; Param2 - сила волны
; Param3 - количество кругов на воде
;-------------------------------------------------------------------------
.loc_else_1:
        cmp     eax,2
        jne     .loc_else_2

        inc     [ebx+WAVE_OBJECT.dwEff2Flip]
        test    [ebx+WAVE_OBJECT.dwEff2Flip],1
        jnz     .Ret

        mov     ecx,[ebx+WAVE_OBJECT.dwEff2X]
        mov     edx,[ebx+WAVE_OBJECT.dwEff2Y]
        add     ecx,[ebx+WAVE_OBJECT.dwEff2XAdd]
        add     edx,[ebx+WAVE_OBJECT.dwEff2YAdd]

        cmp     ecx,1
        jge     @f
        sub     ecx,1
        neg     ecx
        neg     [ebx+WAVE_OBJECT.dwEff2XAdd]
@@:
        cmp     edx,1
        jge     @f
        sub     edx,1
        neg     edx
        neg     [ebx+WAVE_OBJECT.dwEff2YAdd]
@@:
        mov     eax,[ebx+WAVE_OBJECT.dwBmpWidth]
        dec     eax
        cmp     ecx,eax
        jl      @f
        sub     ecx,eax
        xchg    eax,ecx
        sub     ecx,eax
        neg     [ebx+WAVE_OBJECT.dwEff2XAdd]
@@:
        mov     eax,[ebx+WAVE_OBJECT.dwBmpHeight]
        dec     eax
        cmp     edx,eax
        jl      @f
        sub     edx,eax
        xchg    eax,edx
        sub     edx,eax
        neg     [ebx+WAVE_OBJECT.dwEff2YAdd]
@@:
        mov     [ebx+WAVE_OBJECT.dwEff2X],ecx
        mov     [ebx+WAVE_OBJECT.dwEff2Y],edx
        stdcall _WaveDropStone,ebx,ecx,edx,[ebx+WAVE_OBJECT.dwEffectParam2],[ebx+WAVE_OBJECT.dwEffectParam3]
        jmp     .loc_endif_1
;-------------------------------------------------------------------------
; Type3  - проливной дождь
; Param1 - скорость
; Param2 - сила падения капель
; Param3 - количество кругов на воде
;-------------------------------------------------------------------------
.loc_else_2:
        cmp     eax,3
        jne     .loc_endif_1
        xor     edi,edi
        jmp     .loc_endw
.loc_while:
        mov     eax,[ebx+WAVE_OBJECT.dwBmpWidth]
        dec     eax
        dec     eax
        stdcall _WaveRandom,ebx,eax
        inc     eax
        mov     ecx,eax

        mov     eax,[ebx+WAVE_OBJECT.dwBmpHeight]
        dec     eax
        dec     eax
        stdcall _WaveRandom,ebx,eax
        inc     eax
        mov     edx,eax

        stdcall _WaveRandom,ebx,[ebx+WAVE_OBJECT.dwEffectParam2]
        inc     eax
        mov     esi,eax
        stdcall _WaveRandom,ebx,[ebx+WAVE_OBJECT.dwEffectParam3]
        stdcall _WaveDropStone,ebx,ecx,edx,esi,eax
        inc     edi

.loc_endw:
        cmp     edi,[ebx+WAVE_OBJECT.dwEffectParam1]
        jbe     .loc_while

.loc_endif_1:

.Ret:
        popa
        ret
endp

;-------------------------------------------------------------------------
; Освобождение ресурсов
;-------------------------------------------------------------------------
proc _WaveFree _lpWaveObject:DWORD
        pusha
        mov     ebx,[_lpWaveObject]
        cmp     [ebx+WAVE_OBJECT.hDcRender],0
        je      @f
        invoke  DeleteDC,[ebx+WAVE_OBJECT.hDcRender]
@@:
        cmp     [ebx+WAVE_OBJECT.hBmpRender],0
        je      @f
        invoke  DeleteObject,[ebx+WAVE_OBJECT.hBmpRender]
@@:
        cmp     [ebx+WAVE_OBJECT.lpDIBitsSource],0
        je      @f
        invoke  GlobalFree,[ebx+WAVE_OBJECT.lpDIBitsSource]
@@:
        cmp     [ebx+WAVE_OBJECT.lpDIBitsRender],0
        je      @f
        invoke  GlobalFree,[ebx+WAVE_OBJECT.lpDIBitsRender]
@@:
        cmp     [ebx+WAVE_OBJECT.lpWave1],0
        je      @f
        invoke  GlobalFree,[ebx+WAVE_OBJECT.lpWave1]
@@:
        cmp     [ebx+WAVE_OBJECT.lpWave2],0
        je      @f
        invoke  GlobalFree,[ebx+WAVE_OBJECT.lpWave2]
@@:
        invoke  KillTimer,[ebx+WAVE_OBJECT.hWnd],ebx
        invoke  RtlZeroMemory,ebx,sizeof.WAVE_OBJECT

        popa
        ret
endp
