format          PE GUI 4.0                                                              ; ������ PE. ������ GUI 4.0.
entry           start                                                                   ; �������� ����� �����
include         '%include%\win32a.inc'                                                  ; ������ ����������� ��������� ����������.

IDD_MAIN        = 44                                                                    ; ������������� ����������� ����
IDD_EDIT        = 100                                                                   ; ������������� �������� ����������: ���� ��������������
IDD_BUTTONPATCH = 100                                                                   ; ������������� �������� ����������: ������
IDD_BUTTONEXIT  = 101                                                                   ; ������������� �������� ����������: ������

;=== ������� ���� ============================================================
 
section         '.text' code readable executable
 
  start: 
                invoke          InitCommonControlsEx                                    ; ��������� ����� �������� ����������
                invoke          GetModuleHandle,0                                       ; ������� ���������� ����������
                invoke          DialogBoxParam,eax,IDD_MAIN,HWND_DESKTOP,DialogProc,0   ; �������� ���������� ���� �� ������ �������
                or              eax,eax                                                 ; �������� �� ��� �������� ����������
                jz              exit                                                    ; ���� ������� ����������� ������, �� ��������� �������
                invoke          MessageBox,HWND_DESKTOP,message,caption,[flags]         ; ����� ������ ���� � ������� 
  exit:
                invoke          ExitProcess,0                                           ; ����� �� ���������.
 
;--- ��������� ��������� ������� (������� �������, ���������� ���������, ��������� ��������� ��������� ����������� ����)
 
proc            DialogProc      hWnd,wMsg,wParam,lParam
                push            ebx esi edi                                             ; �������� ��������
                cmp             [wMsg],WM_INITDIALOG                                    ; �������� �� WM_INITDIALOG
                je              .wminitdialog                                           ; �� ���������� wminitdialog
                cmp             [wMsg],WM_COMMAND                                       ; �������� �� WM_INITDIALOG
                je              .wmcommand                                              ; �� ���������� wminitdialog
                cmp             [wMsg],WM_CLOSE                                         ; �������� �� WM_CLOSE
                je              .wmclose                                                ; �� ���������� wmclose
                xor             eax,eax                                                 ; ���� �� �� ���������� �� ������ ���������, ���������� ������� 0
                jmp             .finish                                                 ; �� �����
  .wminitdialog:
                invoke          GetDlgItem,[hWnd],IDD_EDIT                              ; ������� ���������� ���� ��������������
                mov             [hEdit],eax                                             ; �������� ���
                stdcall         GetTimeText,editOutput                                  ; ���������� ������� �������
                invoke          lstrcat,editOutput,editPad                              ; ������� � ���� �����������
                invoke          lstrcat,editOutput,_pinitial                            ; ������� � ���� ���������
                invoke          SetDlgItemText,[hWnd],IDD_EDIT,editOutput               ; ��������� ����� � ���� ��������������
                jmp             .done
  .wmcommand:
                cmp             [wParam],BN_CLICKED shl 16 + IDD_BUTTONEXIT             ; ������ ������ Exit?
                je              .wmclose
                cmp             [wParam],BN_CLICKED shl 16 + IDD_BUTTONPATCH            ; ������ ������ Patch?
                je              .dopatch
                jmp             .done
  .dopatch:

; ��� ����� ������������� ��� ������ � ���������� ������

                stdcall         GetTimeText,editOutput                                  ; ���������� ������� ������� 

                invoke          lstrcat,editOutput,editPad                              ; ������� � ���� �����������
                invoke          lstrcat,editOutput,_psuccess                            ; ������� � ���� ���������

                invoke          GetWindowTextLength,[hEdit]                             ; ������� ����� ������ � ���� ��������������
                invoke          SendMessage,[hEdit],EM_SETSEL,eax,eax                   ; ��������� ������� ���� � ������� ���������� �������
                invoke          SendMessage,[hEdit],EM_REPLACESEL,FALSE,editOutput      ; ������� (�������) ����� � ���� ��������������

                jmp             .done
  .wmclose:                                                                             ; ���������� ��������� WM_CLOSE. ����������.
                invoke          EndDialog,[hWnd],0                                      ; �������� �������
  .done:
                mov             eax,1                                                   ; ��� ��������� ���� �� ������ ��������� ���������� 1
  .finish:
                pop             edi esi ebx                                             ; ����������� ��������
                ret
endp

proc            GetTimeText     pTimeStr:dword
                push            eax ebx ecx
                invoke          GetLocalTime,systime
                movzx           eax,[systime.wHour]
                movzx           ebx,[systime.wMinute]
                movzx           ecx,[systime.wSecond]
                invoke          wsprintf,[pTimeStr],tBufferFormat,eax,ebx,ecx
                pop             ecx ebx eax
                ret
endp
 
;=== ������� ������ ==========================================================
 
section         '.data' data readable writeable
 
_pinitial       db              'Engine started',13,10,0
_psuccess       db              'Patched successfully',13,10,0
editPad         db              ' : ',0
 
flags           dd              ?
caption         rb              40h
message         rb              100h

hEdit           dd              ?
systime         SYSTEMTIME
editOutput      rb 256
                db 0
tBufferFormat   db '%02u:%02u:%02u',0

;=== ������� ������� =========================================================

section         '.idata' import data readable writeable
 
library         kernel32,'KERNEL32.DLL',user32,'USER32.DLL',comctl32,'COMCTL32.DLL'
 
include         'api\kernel32.inc'
include         'api\user32.inc'
include         'api\comctl32.inc'
 
;=== ������ �������� =========================================================

section         '.rsrc' resource data readable
 
directory       RT_DIALOG,dialogs, RT_MANIFEST,manifests
 
resource        dialogs,\
                IDD_MAIN,LANG_ENGLISH+SUBLANG_DEFAULT,rsrc_dialog
 
dialog          rsrc_dialog,'Patcher',70,70,240,152,WS_CAPTION+WS_SYSMENU+WS_MINIMIZEBOX+DS_SYSMODAL+DS_MODALFRAME+DS_CENTER,0,0,'Arial',10
  dialogitem    'STATIC','Put AppName Here',  -1,2,2,236,11,WS_VISIBLE+SS_CENTER+SS_CENTERIMAGE+SS_SUNKEN
  dialogitem    'BUTTON','',                  -1,2,11,236,63,WS_VISIBLE+BS_GROUPBOX
  dialogitem    'STATIC','[Filename]',        -1,5,18,50,11,WS_VISIBLE+SS_LEFT+SS_CENTERIMAGE
  dialogitem    'STATIC','targetapp.exe',     -1,60,18,175,11,WS_VISIBLE+SS_SUNKEN+SS_LEFT+SS_CENTERIMAGE
  dialogitem    'STATIC','[URL]',             -1,5,32,50,11,WS_VISIBLE+SS_LEFT+SS_CENTERIMAGE
  dialogitem    'STATIC','http://datadump.ru',-1,60,32,175,11,WS_VISIBLE+SS_SUNKEN+SS_LEFT+SS_CENTERIMAGE
  dialogitem    'STATIC','[Author]',          -1,5,46,50,11,WS_VISIBLE+SS_LEFT+SS_CENTERIMAGE
  dialogitem    'STATIC','Einaare',           -1,60,46,175,11,WS_VISIBLE+SS_SUNKEN+SS_LEFT+SS_CENTERIMAGE
  dialogitem    'STATIC','[Release Date]',    -1,5,60,50,11,WS_VISIBLE+SS_LEFT+SS_CENTERIMAGE
  dialogitem    'STATIC','25.12.2017',        -1,60,60,175,11,WS_VISIBLE+SS_SUNKEN+SS_LEFT+SS_CENTERIMAGE
  dialogitem    'BUTTON','Log window',        -1,2,75,236,58,WS_VISIBLE+BS_GROUPBOX
  dialogitem    'EDIT',  '',                  IDD_EDIT,5,83,230,46,WS_VISIBLE+WS_BORDER+ES_MULTILINE+ES_AUTOHSCROLL+ES_AUTOVSCROLL+ES_READONLY+WS_VSCROLL
  dialogitem    'BUTTON','&Patch',            IDD_BUTTONPATCH,132,135,52,14,WS_VISIBLE+BS_DEFPUSHBUTTON
  dialogitem    'BUTTON','&Exit',             IDD_BUTTONEXIT,185,135,52,14,WS_VISIBLE+BS_FLAT
enddialog
 
resource        manifests,\ 
                1,LANG_ENGLISH+SUBLANG_DEFAULT,manifest
 
resdata manifest 
   db '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>',13,10 
   db '<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">',13,10 
   db '<assemblyIdentity name="patch.exe" processorArchitecture="x86" version="5.1.0.0" type="win32"/> ',13,10 
   db '<description>Patcher</description>',13,10 
   db '<dependency>',13,10 
   db '<dependentAssembly>',13,10 
   db '<assemblyIdentity type="win32" name="Microsoft.Windows.Common-Controls" version="6.0.0.0" processorArchitecture="x86" publicKeyToken="6595b64144ccf1df" language="*" />',13,10 
   db '</dependentAssembly>',13,10 
   db '</dependency>',13,10 
   db '</assembly>',13,10 
endres