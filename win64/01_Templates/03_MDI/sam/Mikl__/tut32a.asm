.586p
.model tiny
include windows.inc
;for WinXP - 1970 bytes
du	macro string
	irpc c,<string>
	if '&c'gt 127
	db ('&c'- 0B0h),4
	else
	dw '&c'
	endif
	endm
	dw 0
	endm

.code
exebase		equ 400000h
IDC_MENU		equ 10000
IDM_FILE_EXIT		equ 0
IDM_FILE_NEW		equ 1
IDM_WINDOW_NEXT		equ 2
IDM_WINDOW_PREVIOUS	equ 3
MI_CLOSE		equ 4
MI_TILEHOR		equ 5
MI_TILEVER		equ 6
MI_CASCADE		equ 7
IDM_HELP_ABOUT		equ 8
MI_CLOSE_ALL            equ 9
main:
;signatures----------------------------
dosHeader 		dd IMAGE_DOS_SIGNATURE;'MZ'
ntHeader  		dd IMAGE_NT_SIGNATURE;'PE'
;image_header--------------------------
Machine			dw IMAGE_FILE_MACHINE_I386; (Intel386)
Count_of_section	dw 1
hWnd	 dd 0;TimeStump		dd 0
hClient  dd 0;Symbol_table_offset	dd 0
hMenu	 dd 0;Symbol_table_count	dd 0
Size_of_optional_header	dw section_table-optional_header
Characteristics		dw IMAGE_FILE_32BIT_MACHINE or \
 IMAGE_FILE_RELOCS_STRIPPED or IMAGE_FILE_EXECUTABLE_IMAGE or \
 IMAGE_FILE_LINE_NUMS_STRIPPED or IMAGE_FILE_LOCAL_SYMS_STRIPPED
;-------------------------------------
optional_header:
Magic_optional_header	dw IMAGE_NT_OPTIONAL_HDR32_MAGIC
Linker_version_major_and_minor dw 0 
Size_of_code		dd end_import-start
Size_of_init_data	dd 0
Size_of_uninit_data	dd 0
entry_point	 	dd start
base_of_code		dd start
base_of_data		dd 0
image_base		dd exebase
e_lfanew		dd ntHeader-dosHeader;section alignment
file_alignment		dd 4
OS_version_major_minor	dd 4
image_version_major_minor dd 0
subsystem_version_major_minor dd 4
reserved1		dd 0
size_of_image		dd end_import
size_of_header		dd start
checksum		dd 0
subsystem_and_DLL_flag	dd IMAGE_SUBSYSTEM_WINDOWS_GUI
Stack_allocation	dd 100000h
Stack_commit		dd 1000h
Heap_allocation		dd 100000h
Heap_commit		dd 1000h
loader_flag		dd 0
number_of_dirs		dd (section_table-export_RVA)/8
export_RVA  		dd 0
export_size 		dd 0
import_RVA  		dd import
import_size 		dd end_import-import
resuorce_RVA		dd resource
resuorce_size           dd end_resource-resource
;------------------------------------------------
section_table 		dd 'xet.','t'
virtual_size		dd 0		
virtual_address		dd start	
Physical_size		dd end_import-start
Physical_offset		dd start	
Relocations 		dd 0	
Linenumbers		dd 0		
Relocations_and_Linenumbers_count dd 0
Attributes              dd 0	
;---------------------------------------------------------
start:	xchg ebx,eax
	mov esi,exebase
	mov edi,offset wndFTitle+exebase
;-----------------------------+
; registering the window class| 
;-----------------------------+
        push ebx
	push edi; ”казатель на им€ нашего класса
	push IDC_MENU ;ћеню
	push COLOR_APPWORKSPACE  ;‘он нашего окна
	push 10011h ; урсор окна по умолчанию (здесь указан ID обычной стрелки)
	push ebx    ;»конка окна по умолчанию
	push esi;јдрес нашей программы в пам€ти ? Windows всегда еЄ грузит 
;по этому адресу
	push DLGWINDOWEXTRA
	push ebx  ;и эта тоже
	push offset WndProc+exebase ;јдрес процедуры обработки событий
	push CS_HREDRAW or CS_VREDRAW  ; —тиль нашего окна
	push sizeof(WNDCLASSEX)
	push esp  ;&WNDCLASSEX 
	call RegisterClassEx+exebase
        mov [esp].WNDCLASSEX.lpfnWndProc,offset MdiChildProc+exebase;mov [edi].lpfnWndProc,offset MdiChildProc+exebase
	mov [esp].WNDCLASSEX.cbWndExtra,ebx
	mov [esp].WNDCLASSEX.lpszMenuName,ebx
	mov [esp].WNDCLASSEX.lpszClassName,offset MdiChildClassName+exebase
        push esp
	call RegisterClassEx+exebase
;--------------------------+
; creating the main window |
;--------------------------+
	push ebx
	push esi
	shl esi,9
        push ebx
	push ebx
	push 600
	push 800
	push esi
	push esi
	push WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN or WS_VISIBLE
	push edi;offset wndFTitle+exebase
	push edi;offset ClassName+exebase
	push WS_EX_CLIENTEDGE
	call CreateWindowEx+exebase
        mov hWnd+exebase,eax
	push eax
	call GetMenu+exebase
	mov hMenu+exebase,eax
	mov cc.hWindowMenu+exebase,eax
	mov edi,offset rect+exebase
	push edi
	push hWnd+exebase
	call GetClientRect+exebase
        push offset cc+exebase
	push esi
        push ebx
	push hWnd+exebase
	push [edi+RECT.bottom]
	push [edi+RECT.right]
	push ebx
	push ebx
	push WS_VISIBLE or WS_CHILD or WS_VSCROLL or WS_HSCROLL or WS_CLIPCHILDREN
	push ebx
	push offset MdiClientClassName+exebase
	push WS_EX_CLIENTEDGE
	call CreateWindowEx+exebase
	mov hClient+exebase,eax
	mov ebp,esp
;---------------------------+
; entering the message loop |
;---------------------------+
message_loop:
	push ebx
	push ebx
	push ebx
	push ebp
	call GetMessage+exebase
	push ebp
	push hClient++exebase
        call TranslateMDISysAccel+exebase
	test eax,eax
	jnz message_loop
	push ebp
	call DispatchMessage+exebase
	jmp message_loop
;----------------------+
; the window procedure |
;----------------------+
WndProc:
hWin	equ dword ptr [ebp+8]
uMsg	equ dword ptr [ebp+0Ch]
wParam	equ dword ptr [ebp+10h]
lParam	equ dword ptr [ebp+14h]

	push ebp
	mov ebp,esp
	mov eax,uMsg
	dec eax
	dec eax;cmp eax,WM_DESTROY
	je wmDESTROY
	sub eax,WM_SIZE-WM_DESTROY;cmp eax,WM_SIZE
	je wmSIZE
	sub eax,WM_COMMAND-WM_SIZE
	jz wmCOMMAND
DefFrame: push lParam
	push wParam
	push uMsg
	push hClient+exebase
	push hWin
	call DefFrameProc+exebase
	jmp wmBYE
wmCOMMAND: mov eax,wParam
	cmp eax,MI_CLOSE_ALL;5
	ja DefFrame
	jmp [menu_handlers+eax*4+exebase]
New:	inc count+exebase
	push count+exebase
	push offset form+exebase
	push offset buffer+exebase
	call wsprntf+exebase
	add esp,12
	mov esi,400000h
	push ebx
	push esi;hInstance
	shl esi,9
	push ebx
	push hClient+exebase
	push esi
	push esi
	push esi
	push esi
	push MDIS_ALLCHILDSTYLES
	push offset buffer+exebase
	push offset MdiChildClassName+exebase
	push WS_EX_MDICHILD or WS_EX_CLIENTEDGE
	call CreateWindowEx+exebase	
	jmp wmBYE
Exit:	mov eax,hWin
	jmp a1
Next:	push TRUE
	jmp a3
Prev:	push ebx
a3:	push ebx
	push WM_MDINEXT
a4:	push hClient+exebase
	jmp a2
Horiz:	push ebx
	push MDITILE_HORIZONTAL
a5:	push WM_MDITILE
	jmp a4
Vert:	push ebx
	push ebx
	jmp a5
Cascade: push ebx
	push MDITILE_SKIPDISABLED
	push WM_MDICASCADE
	jmp a4
Close:	dec count+exebase
	push ebx
	push ebx
	push WM_MDIGETACTIVE
	push hClient+exebase
	call SendMessage+exebase
a1:	push ebx
	push ebx
	push WM_CLOSE
	push eax
a2:	call SendMessage+exebase
	jmp wmBYE
About:	push ebx
	push offset AboutMsg+exebase
	push offset wndFTitle+exebase
	push hWin
	call ShellAbout+exebase
	jmp wmBYE
CloseAll: mov count+exebase,ebx
a6:	push ebx
	push ebx
	push WM_MDIGETACTIVE
	push hClient+exebase
	call SendMessage+exebase
	xchg eax,ecx
	jecxz wmBYE
	push ebx
	push ebx
	push WM_CLOSE
	push ecx
	call SendMessage+exebase
	jmp a6
wmSIZE: mov edi,offset rect+exebase
	push edi
	push hWin
	call GetClientRect+exebase
	push TRUE
	push [edi+RECT.bottom]
	push [edi+RECT.right]
	push ebx
	push ebx
	push hClient+exebase
	call MoveWindow+exebase
wmBYE:	leave	 
	retn 10h
wmDESTROY: push ebx
	call ExitProcess+exebase
;-----------------------------------
MdiChildProc:
hChild	equ dword ptr [ebp+8]
uMsg2	equ dword ptr [ebp+0Ch]
wParam2 equ dword ptr [ebp+10h]
lParam2 equ dword ptr [ebp+14h]
	push ebp
	mov ebp,esp
	cmp uMsg2,WM_MDIACTIVATE
	jz wmMDIACTIVATE
	cmp uMsg2,WM_CLOSE
	jz wmcCLOSE
	leave
	jmp DefMDIChildProc+exebase
wmMDIACTIVATE: mov eax,lParam2
	cmp eax,hChild
	setne bl;MF_ENABLED=0 MF_GRAYED=1
	mov esi,offset EnableMenuItem+exebase
	mov edi,hMenu+exebase
	push ebx
	push MI_CLOSE
	push edi;hMenu+exebase
	call dword ptr [esi];EnableMenuItem+exebase
	push ebx
	push MI_TILEHOR
	push edi;hMenu+exebase
	call dword ptr [esi];EnableMenuItem+exebase
	push ebx
	push MI_TILEVER
	push edi;hMenu+exebase
	call dword ptr [esi];EnableMenuItem+exebase
	push ebx
	push MI_CASCADE
	push edi;hMenu+exebase
	call dword ptr [esi];EnableMenuItem+exebase
	push ebx
	push IDM_WINDOW_NEXT
	push edi;hMenu+exebase
	call dword ptr [esi];EnableMenuItem+exebase
	push ebx
	push IDM_WINDOW_PREVIOUS
	push edi;hMenu+exebase
	call dword ptr [esi];EnableMenuItem+exebase
	push ebx
	push MI_CLOSE_ALL
	push edi;hMenu+exebase
	call dword ptr [esi];EnableMenuItem+exebase
	xor ebx,ebx
	push 1
	push edi;hMenu+exebase
	call GetSubMenu+exebase
	;mov edx,eax
	push eax
	push edi;hMenu+exebase
	push WM_MDISETMENU
	push hClient+exebase
	call SendMessage+exebase
        jmp wmcBYE
wmcCLOSE: push ebx
	push hChild
	push WM_MDIDESTROY
	push hClient+exebase
	call SendMessage+exebase
wmcBYE:	leave
	retn 10h
;-----------------------------------
cc CLIENTCREATESTRUCT <?,2000>
MdiChildClassName  db 'MDICHILD',0
MdiClientClassName db 'MDICLIENT',0
menu_handlers dd Exit+exebase,New+exebase,Next+exebase,Prev+exebase,Close+exebase,\
Horiz+exebase,Vert+exebase,Cascade+exebase,About+exebase,CloseAll+exebase
wndFTitle   db 'Iczelion Tutorial #32:Multiple Document Interface (MDI)',0
AboutMsg    db 'Mikl__ 2011',0
rect	RECT <?>
count	dd 0
form db 'Mdi Child %d',0
buffer	db 20 dup (?)
align 2
;--------------------------------------------------------------------
MFR_END		equ 80h
;MFR_POPUP	equ 1
;MFT_STRING	equ 0
;MFS_ENABLED	equ 0
;MFT_SEPARATOR	equ 800h
;RT_MENU		equ 4
POPUP		equ 10h
MENUBREAK       equ 40h
;ENDMENU		equ 80h
;DS_SETFONT	equ 40h
resource:
Characteristics1	dd 0
TimeDateStamp		dd 0
MajorVersion		dw 0
MinorVersion		dw 0;
NumberOfNamedEntries	dw 0;количество ресурсов с именами
NumberOfIdEntries	dw 1;количество ресурсов с идентификаторами
;на этом уровне идентификатор ресурсов €вл€етс€ типом ресурса
dw RT_MENU,0;номер типа ресурса
dw m1-resource,8000h; если во 2-ом слове установлен старший бит - есть ссылка 
;на оглавление второго уровн€. ¬ 1-ом слове смещение второго оглавлени€ 
;относительно начала раздела ресурсов
m1:
Characteristics2	dd 0
TimeDateStamp2		dd 0
MajorVersion2		dw 0
MinorVersion2		dw 0;
NumberOfNamedEntries2	dw 0;количество ресурсов с именами
NumberOfIdEntries2	dw 1;количество ресурсов с идентификаторами
;на этом уровне идентификатор ресурсов €вл€етс€ идентификатором меню
dw IDC_MENU,0
dw m2-resource,8000h; если во 2-ом слове установлен старший бит - есть ссылка 
;на оглавление третьего уровн€. ¬ 1-ом слове смещение третьего оглавлени€ 
;относительно начала раздела ресурсов
m2:
Characteristics3	dd 0
TimeDateStamp3		dd 0
MajorVersion3		dw 0
MinorVersion3		dw 0;
NumberOfNamedEntries3	dw 0;количество ресурсов с именами
NumberOfIdEntries3	dw 1;количество ресурсов с идентификаторами
;на этом уровне идентификатор ресурсов €вл€етс€ идентификатором €зыка, который 
;используетс€ даннvм ресурсом 256 * SUBLANG_ + LANG_
dw 40Ah,0,m3-resource,0
m3:;struct _IMAGE_RESOURCE_DATA_ENTRY
OffsetToData1	dd menu
Size1		dd end_menu-menu
CodePage1	dd 0
Reserved1	dd 0
menu dw 0,   0,POPUP
du <&File>
dw MFT_STRING  or  MFS_ENABLED,IDM_FILE_NEW
du <&New>
dw MFT_STRING  or  MFS_ENABLED  or  MF_GRAYED,MI_CLOSE
du <&Close	Ctrl+F4>
dw MENUBREAK,0,0;NOTEXT
dw MFT_STRING  or  MFS_ENABLED or  MFR_END,IDM_FILE_EXIT
du <&Exit>
dw POPUP
du <&Window>
dw MFT_STRING or MFS_ENABLED or MF_GRAYED,MI_TILEHOR
du <Tile &Horizontal>
dw MFT_STRING or MFS_ENABLED or MF_GRAYED,MI_TILEVER
du <Tile &Vertical>
dw MFT_STRING or MFS_ENABLED or MF_GRAYED,MI_CASCADE
du <&Cascade>
dw MFT_STRING or MFS_ENABLED or MF_GRAYED,IDM_WINDOW_NEXT
du <&Next	Ctrl+F6>
dw MFT_STRING or MFS_ENABLED or MF_GRAYED,IDM_WINDOW_PREVIOUS
du <&Previous	Ctrl+Shift+F6>
dw MFT_STRING or MFS_ENABLED or MFR_END or MF_GRAYED,MI_CLOSE_ALL
du <Close All>
dw POPUP or MFR_END
du <&Help>
dw MFR_END,IDM_HELP_ABOUT
du <&About>
end_menu:
end_resource:
;--------------------------------------------------------------------
import:
dd 0,0,0,user32_dll
dd user32_table
dd 0,0,0,kernel32_dll
dd kernel32_table
dd 0,0,0,shell32_dll
dd shell32_table
dd 0,0,0,0
user32_table:
RegisterClassEx		dd _RegisterClassEx
CreateWindowEx          dd _CreateWindowEx
GetMessage              dd _GetMessage
GetMenu			dd _GetMenu
GetSubMenu		dd _GetSubMenu
SendMessage		dd _SendMessage
DispatchMessage         dd _DispatchMessage
DefWindowProc           dd _DefWindowProc
DefFrameProc	    	dd _DefFrameProc
DefMDIChildProc		dd _DefMDIChildProc
TranslateMDISysAccel	dd _TranslateMDISysAccel
MoveWindow		dd _MoveWindow
EnableMenuItem		dd _EnableMenuItem
GetClientRect		dd _GetClientRect
wsprntf			dd _wsprntf,0

kernel32_table:
ExitProcess             dd _ExitProcess,0
shell32_table:
ShellAbout		dd _ShellAbout
                        dw 0
_RegisterClassEx	db 0,0,'RegisterClassExA'      
_CreateWindowEx		db 0,0,'CreateWindowExA'
_GetMessage		db 0,0,'GetMessageA'
_DispatchMessage	db 0,0,'DispatchMessageA'
_DefWindowProc		db 0,0,'DefWindowProcA'
_GetMenu		db 0,0,"GetMenu"
_GetSubMenu		db 0,0,"GetSubMenu"
_SendMessage		db 0,0,"SendMessageA"
_DefFrameProc	    	db 0,0,"DefFrameProcA"
_DefMDIChildProc	db 0,0,"DefMDIChildProcA"
_TranslateMDISysAccel	db 0,0,"TranslateMDISysAccel"
_EnableMenuItem		db 0,0,'EnableMenuItem'
_GetClientRect          db 0,0,"GetClientRect"
_wsprntf		db 0,0,"wsprintfA"
_MoveWindow		db 0,0,"MoveWindow",0

user32_dll		db 'user32'

_ExitProcess		db 0,0,'ExitProcess',0
kernel32_dll		db 'kernel32'

_ShellAbout		db 0,0,'ShellAboutA',0
shell32_dll		db 'shell32'
end_import:
end main