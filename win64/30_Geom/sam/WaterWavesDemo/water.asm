format PE GUI 4.0
entry start

include 'win32a.inc'

ID_IMG = 101

;----------------------------------------------------------------------
struct  RGBQUAD
        rgbBlue         db ?
        rgbGreen        db ?
        rgbRed          db ?
        rgbReserved     db ?
ends

struct  BITMAPINFO
        bmiHeader       BITMAPINFOHEADER
        bmiColors       RGBQUAD
ends

F_WO_ACTIVE             = 0001h
F_WO_NEED_UPDATE        = 0002h
F_WO_EFFECT             = 0004h
F_WO_ELLIPSE            = 0008h

struct  WAVE_OBJECT
        hWnd            dd ?
        dwFlag          dd ?

        hDcRender       dd ?
        hBmpRender      dd ?
        lpDIBitsSource  dd ?
        lpDIBitsRender  dd ?
        lpWave1         dd ?
        lpWave2         dd ?

        dwBmpWidth      dd ?
        dwBmpHeight     dd ?
        dwDIByteWidth   dd ?  ; = (dwBmpWidth * 3 + 3) and ~3
        dwWaveByteWidth dd ?  ; = dwBmpWidth * 4
        dwRandom        dd ?

        dwEffectType    dd ?
        dwEffectParam1  dd ?
        dwEffectParam2  dd ?
        dwEffectParam3  dd ?

        dwEff2X         dd ?
        dwEff2Y         dd ?
        dwEff2XAdd      dd ?
        dwEff2YAdd      dd ?
        dwEff2Flip      dd ?

        stBmpInfo       BITMAPINFO
ends

;----------------------------------------------------------------------

section '.data' data readable writeable

hInstance       dd ?
hBitmap         dd ?
stWaveObj       WAVE_OBJECT
stPs            PAINTSTRUCT
stRect          RECT

;----------------------------------------------------------------------

section '.code' code readable executable
  start:
        invoke  GetModuleHandle,0
        mov     [hInstance],eax

        invoke  DialogBoxParam,[hInstance],1,HWND_DESKTOP,DialogProc,0

        invoke  ExitProcess,0

; ----------------------------------------------

proc DialogProc hwnddlg,msg,wparam,lparam
        cmp     [msg],WM_INITDIALOG
        je      wminitdialog
        cmp     [msg],WM_PAINT
        je      wmpaint
        cmp     [msg],WM_COMMAND
        je      wmcommand
        cmp     [msg],WM_CLOSE
        je      wmclose
        cmp     [msg],WM_LBUTTONDOWN
        je      wmlbutton
        cmp     [msg],WM_MOUSEMOVE
        je      wmmouse

        xor     eax,eax
        jmp     finish

wminitdialog:
        ; Загрузить битмап
        invoke  LoadBitmap,[hInstance],1
        mov     [hBitmap],eax
        push    [hBitmap]
        invoke  GetDlgItem,[hwnddlg],ID_IMG
        ; Инициализация водной поверхности
        stdcall _WaveInit,stWaveObj,eax,[hBitmap],30,0
        pop     [hBitmap]
        invoke  DeleteObject,[hBitmap]
        ; Настроить эффекты
        stdcall _WaveEffect,stWaveObj,1,5,4,250
        jmp     finish

wmpaint:
        invoke  BeginPaint,[hwnddlg],stPs
        invoke  GetDlgItem,[hwnddlg],ID_IMG
        invoke  GetDC,eax
        stdcall _WaveUpdateFrame,stWaveObj,eax,TRUE
        invoke  EndPaint,[hwnddlg],stPs

        xor     eax,eax
        jmp     finish

wmlbutton:
        ; Клик левой кнопкой мышки
        mov     eax,[lparam]
        movzx   ecx,ax          ; x
        shr     eax,16          ; y
        stdcall _WaveDropStone,stWaveObj,ecx,eax,2,256

        ; Перетаскивание окна за любое место
        invoke  ReleaseCapture
        invoke  SendMessage,[hwnddlg],WM_SYSCOMMAND,61458,0

        jmp     processed

wmmouse:
        ; Движение курсора мыши над изображением
        mov     eax,[lparam]
        movzx   ecx,ax          ; x
        shr     eax,16          ; y
        stdcall _WaveDropStone,stWaveObj,ecx,eax,2,256
        jmp     processed

wmcommand:
        cmp     [wparam],BN_CLICKED shl 16 + IDCANCEL
        je      wmclose
        jmp     processed

; ----------------------------------------------

wmclose:
        stdcall _WaveFree,stWaveObj
        invoke  EndDialog,[hwnddlg],0
processed:
        xor     eax,eax
finish:
        pop     ebp
        retn
endp

include 'WaveObject.asm'

;----------------------------------------------

section '.idata' import data readable writeable

library kernel32,'kernel32.dll',\
        user32,'user32.dll',\
        shell32,'shell32.dll',\
        gdi32,'gdi32.dll',\
        comdlg32,'comdlg32.dll',\
        comctl32,'comctl32.dll'

include "apia\kernel32.inc"
include "apia\user32.inc"
include "apia\shell32.inc"
include "apia\comdlg32.inc"
include 'apia\comctl32.inc'
include 'apia\gdi32.inc'

;----------------------------------------------

section '.rsrc' resource data readable

  directory RT_DIALOG,dialogs,\
            RT_BITMAP,bitmaps

  resource dialogs,\
           1,LANG_ENGLISH+SUBLANG_DEFAULT,example
  resource bitmaps,\
           1,LANG_NEUTRAL,logo_data

  bitmap logo_data,'water.bmp'

  dialog example,<'WaveObject Demo'>,0,0,346,250,WS_POPUP+DS_CENTER+WS_BORDER+WS_CAPTION, 1,0,'Arial',10
    dialogitem 'STATIC',1, ID_IMG, 1, 1, 1, 1 ,SS_BITMAP+WS_VISIBLE
    dialogitem 'BUTTON','Exit',IDCANCEL, 120, 235, 90, 12,WS_VISIBLE+BS_FLAT
  enddialog

