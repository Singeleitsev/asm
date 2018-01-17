include windows.inc
include masm32.inc
include user32.inc
include kernel32.inc
include gdi32.inc
include shell32.inc
include comctl32.inc
include comdlg32.inc
include advapi32.inc
include shlwapi.inc


	
includelib masm32.lib
includelib user32.lib
includelib kernel32.lib
includelib gdi32.lib
includelib shell32.lib
includelib comctl32.lib
includelib comdlg32.lib
includelib advapi32.lib
includelib shlwapi.lib

include \masm32\MACROS\Macros.asm

WinMain		PROTO :DWORD,:DWORD,:DWORD,:DWORD
PageSetUp    PROTO:DWORD
SaveAsFile 	PROTO:DWORD
PrintStatusItems PROTO :DWORD
OpenFileA  	PROTO
SaveEdit 	PROTO
DoYouWantToSave PROTO
SetChildMenu PROTO
SetMainMenu PROTO
AboutProc PROTO :HWND,:UINT,:WPARAM,:LPARAM
ToolBarStatus PROTO
FormatFont PROTO
Combos PROTO
GetInfoForCombos PROTO
OptionProc PROTO :DWORD, :DWORD, :DWORD, :DWORD
OpenCommandLine PROTO :DWORD
LoadFile PROTO:DWORD
WordWrap PROTO
NonWrapedWindow PROTO :DWORD
WrapedWindow PROTO :DWORD
EditProc PROTO  :DWORD, :DWORD, :DWORD, :DWORD 
SetActiveButtos PROTO :DWORD
BaseAscii PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
DwToAscii PROTO :DWORD,:DWORD
Print PROTO
SetDefaultPSD PROTO
SetPaper PROTO
PrintEdit PROTO :DWORD,:DWORD
LoadLista PROTO :DWORD, :DWORD, :DWORD
SetWndToolTip PROTO   :DWORD, :DWORD, :DWORD
HeaderDlgProc PROTO :DWORD, :DWORD, :DWORD, :DWORD
FooterDlgProc PROTO :DWORD, :DWORD, :DWORD, :DWORD
FootFont  PROTO :DWORD
HeadFont  PROTO :DWORD
IndentComment PROTO :DWORD,:DWORD

.CONST
IDB_BITMAP1 			equ	303


SBR_PART_ONE			equ 0
SBR_PART_TWO			equ 1
SBR_PART_THRE			equ 2
SBR_PART_FOUR			equ 3
REM_BASE				equ WM_USER+1000
REM_VCENTER				equ REM_BASE+32
IDM_EDIT_FINDNEXT       equ 257
IDM_EDIT_FINDPREV       equ 258
IDM_FORMAT_CHOOSECOLOR	equ 259
IDM_FORMAT_WWRAP		equ 260
IDM_FORMAT_HEADER 		equ 261
IDM_FORMAT_FOOTER 		equ 262
IDM_FORMAT_INDENT 		equ 263
IDM_FORMAT_OUTDENT 		equ 264
IDM_FORMAT_COMMENT 		equ 265
IDM_FORMAT_UNCOMMENT 	equ 266

IDM_POS3  				equ 6028
IDM_POS4  				equ 6029

IDD_OPTIONDLG     		equ 301
IDR_POPUPMENU   		equ 5000
EditID	                = 97
IDD_PRINTPREVIEW 		equ 2006
IDB_ARROW				equ 32101
IDB_TOOLBAR				equ 51
IDR_MAINMENU			equ	101
IDR_CHILDMENU			equ	102
IDM_FILE_NEW			equ	201
IDM_FILE_OPEN			equ 202
IDM_FILE_CLOSE			equ	203
IDM_FILE_SAVE			equ 204
IDM_FILE_SAVEAS			equ 205
IDM_FILE_SETUP			equ 206
IDM_FILE_PREVIEW		equ 207
IDM_FILE_PRINT			equ 208
IDM_FILE_EXIT 			equ	210
IDM_EDIT_CUT			equ 211
IDM_EDIT_COPY			equ 212
IDM_EDIT_PASTE			equ 213
IDM_EDIT_DELETE 		equ 216
IDM_VIEW_TOOLBAR		equ 217
IDM_VIEW_STATUS			equ 218
IDM_FORMAT_FONT			equ 219
IDM_FORMAT_BOLD			equ 220
IDM_FORMAT_ITALIC		equ 221
IDM_FORMAT_UNDERLINE	equ 222
IDM_FORMAT_LEFT			equ 223
IDM_FORMAT_CENTER		equ 224
IDM_FORMAT_RIGHT		equ 225
IDM_WIN_TILEHORZ		equ	229
IDM_WIN_TILEVERT		equ	230
IDM_WIN_CASCADE			equ	231
IDM_HELP_CONTENTS		equ 232
IDM_HELP_ABOUT			equ 233
ID_TOOLBAR				equ 250
IDM_EDIT_UNDO			equ 251
IDM_EDIT_REDO			equ 252
IDM_EDIT_REPLACE		equ 253
IDM_EDIT_FIND			equ 254
IDM_EDIT_SELECTALL		equ 255
IDR_ACCEL				equ 256
IDR_CONTEXT				equ 11000
IDB_ICON_BITMAP         equ 300
IDD_DLGABOUT 			equ 4900
IDC_EDTABOUT			equ 1001
IDC_URL					equ 1002
IDC_BACKCOLORBOX        equ 1000
IDC_TEXTCOLORBOX        equ 1001


IDD_FINDDLG				equ 3100
IDC_FINDTEXT			equ 2001
IDC_BTN_REPLACE			equ 2007
IDC_REPLACETEXT			equ 2002
IDC_REPLACESTATIC		equ 2009
IDC_BTN_REPLACEALL		equ 2008
IDC_CHK_WHOLEWORD		equ 2004
IDC_CHK_MATCHCASE		equ 2003
IDC_RBN_DOWN			equ 2005
IDC_RBN_UP				equ 2006
IDC_RBN_ASCII			equ 2004
IDC_STATUSBAR4901 		equ 4901

IDD_PRTHEAD 			equ 2010

IDD_PRTFOOT 			equ 2020
ID_FONTCOMBO			equ 81
ID_FONTSIZECOMBO		equ 82

PRNPOS struct
	margins		RECT <?>
	pagesize	POINT <?>
	nlinespage	dd ?
PRNPOS ends
WINPOS struct
	fMax		dd ?
	fView		dd ?
	x			dd ?
	y			dd ?
	wt			dd ?
	ht			dd ?
	htout		dd ?
	wtpro		dd ?
	htpro		dd ?
	left		dd ?
	top			dd ?
	wttbx		dd ?
	dummy		dd 3 dup(?)
WINPOS ends
COLOR struct
	back			dd ?
	text			dd ?
COLOR ends

NAMEEXPORT struct
	nType		dd ?
	szFileName	db MAX_PATH dup(?)
	nOutput		dd ?
	fAuto		dd ?
NAMEEXPORT ends

GRIDSIZE struct
	x			dd ?
	y			dd ?
	show		dd ?
	snap		dd ?
	tips		dd ?
	color		dd ?
	line		dd ?
	stylehex	dd ?
	sizetofont	dd ?
	nodefines	dd ?
	simple		dd ?
	defstatic	dd ?
	standardmnu	dd ?
GRIDSIZE ends

MENUINFO STRUCT
	cbSize			DWORD	?
	fmask			DWORD	?
	dwstyle			DWORD	?
	cyMax			DWORD	?
	hbrBack			DWORD	?
	dwContextHelpID	DWORD	?
	dwMenuData		DWORD	?
MENUINFO ends

MENU struct
	szcap	db 32 dup(?)
	szcmnd	db 256 dup(?)
MENU ends
CUSTSTYLE struct
	szStyle			db 64 dup(?)
	nValue			dd ?
	nMask			dd ?
CUSTSTYLE ends
MENUDATA struct
	img		dd ?
	tpe		dd ?
MENUDATA ends

.DATA

m_psd               PAGESETUPDLG <?>
m_pd                PRINTDLG   <?>
ti					TOOLINFO	<?>
txtrng				TEXTRANGE <>

ToolTipClass           db          "tooltips_class32",0
szOpenFileFail        	db 'Cannot open the file',0
szSearched				db 'The specified region has been searched!',0
szReplace				db 'Replace ..',0
szOpen					db 'Open',0
szAboutMsg			db 'MASM & FASM MDIRichEdit editor',13,10,'HaBran (C) 2008', 13,10,'branislavhabus@optusnet.com.au',0 
szAboutUrl				db 'http://habran.winasm.net',0
szCust				db 'Cust#',0 
szOpenTitle    db  'Open File',0
szSaveTitle    db  'Save File As',0 
FontName       db  'Courier New',0
szClassName				db "FrameClass",0
szClientName			db "MDICLIENT",0
szChildClass			db "ChildClass",0
szChildTitle			db "Untitled",0
szAppName				db "MDIRichEditor",0
RichEdit       			db  'RichEdit20A',0
RichEdDLL      			db  'RICHED20.DLL',0
szFilter       db      'All Files',0,'*.*',0,
					   'Rich Text Files',0,'*.RTF',0,
                       'Asm Files & Inc Files & RC Files',0,'*.ASM;*.INC;*.RC',0,
                       'Text Files',0,'*.TXT',0,0
szSaveFilter       	db 'All Files (*.*)',0,'*.*',0                       
					db 'Rich Text Files(*.rtf)',0,'*.rtf',0
					db 'Assembly Files (*.asm)',0,'*.asm',0
                    db 'Include Files (*.inc)',0,'*.inc',0
                    db 'Resorce Files (*.rc)',0,'*.rc',0
                    db 'Text Files (*.txt)',0,'*.txt',0,0
DefRtfExt           db 'rtf',0          
SBLines			db 'Line: ',0
szVersion				db 'MDIRichEditor version 1.1.51',0
szError1       db  'The RICHED20.DLL was not found!',0
tbClass             	db "ToolbarWindow32",0
StatClass         db  'msctls_statusbar32',0
combobox     db      'COMBOBOX',0
hMiscTool    dd      0
hCFont       dd      0
hCSize       dd      0
hCColor      dd      0
hSel         dd      0
hAll         dd      0
hKey         dd      0 

footcolor	dd		0
headcolor     dd      0
hFont        dd      0
cFont        dd      0
pFont        dd      0
sFont        dd      0
headfont     dd		 0
footfont     dd      0
FontMS       db      'Arial',0
szSymbol	db       'Symbol',0 
lpcValues    dd      0
szREGSZ     db      'REG_SZ',0
lpcbValueName dd     0
szBuff       db      256 dup(?),0
szWork       db      256 dup(?),0
Head         dd     0
Tail		 dd		0
w3           dd     0
rval		 dd		0
extent       dd 	0
CharsetBuff      db      512 dup(0)
facebuff        db   6000 dup(0) 
index		dd 0
szFSize     db  '12',0
szSize       db      '2,3,4,5,6,7,8,9,10,11,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,',
                     '50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,',0
wm1           dd      0
w5           dd      0
w6           dd      0
szSel        db      'Selection',0
Butt         db      'BUTTON',0
szAll        db      'All',0
osvBN        dd      0
UpdateSel    dd      0
UpdateAll    dd      1
ComboColor   dd      00ffffffh,00000000h,00000080h,00008000h,00004000h,00004080h,000080ffh,00008080h
             dd      00800000h,00800080h,00808000h,00808080h,00c0c0c0h,000000ffh,0000ff00h,0000ffffh
             dd      00ff0000h,00ff8000h,00ff00ffh,00ffff00h
ComboEnd     dd      0   ; N O T E Don't move or remove
Misc         db      40 dup(?)
LineBuff     db      256 dup(?),0     
Clear        db      256 dup(' '),0
LineTxt				db 2048 dup(?)

mL             dd  360
mT             dd  360
mR             dd  360
mB             dd  302
hREdit       dd      0
TopLineP     dd      0
Len          dd      0
SBook        dd      0
EBook        dd      0
HBook        dd      0
SPos         dd      0
EPos         dd      0
FileOff      dd      0
Lnum         dd      0
Ltot         dd      0
CurPos       dd      0
SavPos       dd      0
SavPosL      dd      0
SavPosR      dd      0
Llen		 dd		0
CustomHead	 dd     0
szCustomHead db    256 dup(?)

PH           dd      2
Space2       db      40 dup(' '),0
szSpace      dd     ' ',0
Page1        equ     $ 
           db      'Page '
num          db      8 dup(?),0
dmsg         equ     $
			 db      '  '
dda          db      2 dup(?)
             db      '/'
dmo          db      2 dup(?)
             db      '/'
dyr          db      4 dup(?)
             db      '   '
tmsghour     db      2 dup(?)
             db      ':'
tmsgmin      db      2 dup(?)
             db      ':'
tmsgsec      db      2 dup(?)
             db      ' '
tmsgampm     db      '?' ;'A'/'P'
             db      'M',0


szSucks		db      '   habran sucks!',0
szNotSaved	db      '   File not saved!',0
szNoIdea	db      '   File Size: = I have no idea!',0
fsmsg        db     '   File Size: = '
Fsize        db      8 dup(0),0

LdataR       db      '    Line: '
cnt1         db      5 dup(?)
             db      '  of  '
cnt2         db      5 dup(?)
             db      0

LdataC       db      '    Column: '
cnt3         db      4 dup(?)
             db      '  of  '
cnt4         db      4 dup(?)
             db      0
selected	db		'     Sel: '
selnum		db		8 dup(?)
			db      0
bytesread    dd      0
WWrap       dd      0
sw2          dd      0
PointSize   dd      0
tempword     dd      0
frt						dd FR_DOWN
TextBGC     dd      00ffffffh
TextC       dd      00808000h

dirty      	dd 0


chcount dd 0
PrtText     dd 0
PrtHead     dd 1
PrtPath     dd 0
PrtTime		dd 0
PrtName     dd 1
PrtLeft		dd 1
PrtCenter   dd 0
PrtRight    dd 0

FootText    dd 0
PrtFoot     dd 1
FootNums	dd 0
FootPage	dd 1
FootLeft	dd 0
FootCenter  dd 1
FootRight   dd 0
FootTime	dd 0


nFootfntsize		dd 10
nHeadfntsize		dd 10


szPrtHeadBuff      db 256 dup (?),0
szPrtFootBuff		db 256 dup (?),0

hAccel       dd      0
szError3      db  'You have Selected Text On Your Document.',0Dh,0Ah
szSelect      db  'Selected Text!',0
WannaSave     db 'Want to save changes to',0Dh,0
szFind       		db 100 dup(?),0
szRepl        		db 100 dup(?),0
CustomColors dd 16 dup(?)
TextColor dd 0		; default to black
BackgroundColor dd 0FFFFFFh		; default to white
RTwips1000 REAL10  1.4
OldUrlProc		dd ?
fMouseOver		dd ?
hUrlFont		dd ?
hUrlFontU		dd ?
hUrlBrush		dd ?
fres					dd ?

tbb		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <0, IDM_FILE_NEW,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <1, IDM_FILE_OPEN,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <2, IDM_FILE_SAVE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <23, IDM_FILE_SETUP,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <3, IDM_FILE_PREVIEW,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <4, IDM_FILE_PRINT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <5, IDM_EDIT_CUT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <6, IDM_EDIT_COPY,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <7, IDM_EDIT_PASTE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <24, IDM_EDIT_DELETE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <8, IDM_EDIT_UNDO,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <9, IDM_EDIT_REDO,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <10,IDM_EDIT_FIND,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <22,IDM_EDIT_REPLACE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		
		TBBUTTON <26,IDM_FORMAT_INDENT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <27,IDM_FORMAT_OUTDENT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <28,IDM_FORMAT_COMMENT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <29,IDM_FORMAT_UNCOMMENT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <11, IDM_FORMAT_BOLD,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <12, IDM_FORMAT_ITALIC,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <13,IDM_FORMAT_UNDERLINE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <14,IDM_FORMAT_LEFT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <15,IDM_FORMAT_CENTER,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <16,IDM_FORMAT_RIGHT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
				
		TBBUTTON <18,IDM_WIN_TILEHORZ,TBSTATE_HIDDEN,TBSTYLE_BUTTON,0,0>
		TBBUTTON <19,IDM_WIN_TILEVERT,TBSTATE_HIDDEN,TBSTYLE_BUTTON,0,0>
		TBBUTTON <20,IDM_WIN_CASCADE,TBSTATE_HIDDEN,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <25,IDM_FORMAT_CHOOSECOLOR,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
		TBBUTTON <17,IDM_HELP_ABOUT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
		TBBUTTON <0, 0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>


col					COLOR <0FFFFFFh,0>

.data?
closed   			dd ?
lpType				dd ?
hReg				dd ?
hImageList     		dd ?
CommandLine    		dd ?
hREdDll        		dd ?
hInstance			dd ?
hMainMenu			dd ?
hChildMenu			dd ?
hPopUpMenu			dd ?
hWndClient			dd ?
hWndMain			dd ?
hStatus             dd ?
hToolbar            dd ?
MainExit       		dd ?
PathName       		db 256 dup(?)
FileName       		db  64 dup(?)
sbParts           	dd   4 dup (?)
Chg 				dd ?
cnt             	dd ?
xPerInch            dd ?
yPerInch            dd ?
TextSize            dd ?
hRREdit             dd ?
hImlTbr				dd ?
hImlTbrGray			dd ?
hContextMenu		dd ?
hContextMenuPopup	dd ?
mnupos				dd ?
mnubuff				db 8192 dup(?)
tmpbuff				db 1024 dup(?)
m_hToolTip			dd ?
hMenuBrushA			dd ?
hMenuBrushB			dd ?
hMnuFont			dd ?
hCustDll			dd 32 dup(?)
hIml				dd ?
lpcbData			dd ?
OldEditProc			dd ?
wstate				dd ?
hIcon				dd ?
sbView				dd ?
tbView				dd ?

pd          		PRINTDLG <>
doci        		DOCINFO <>
cr          		CHARRANGE <>
fr          		FORMATRANGE <>
rectP       		RECT <>
pf          		PARAFORMAT2 <>
charF    			CHARFORMAT2     <?> ; For EM_GETCHARFORMAT/EM_SETCHARFORMAT
mdiCreate			MDICREATESTRUCT <>
lf             		LOGFONT         <>
ofs            		OFSTRUCT <>
icex                INITCOMMONCONTROLSEX<>
HFlf            	LOGFONT         <>
FFlf            	LOGFONT         <>
hFind					dd ?
findbuff				db 256 dup(?)
replacebuff				db 256 dup(?)
ft       FINDTEXTEX        <>  ; For EM_EXGETSEL/EM_EXSETSEL
time     SYSTEMTIME      <?> ; For GetLocalTime
ascii 				db 12 dup (?)
rgb					dd ?
TabSize				dd ?
;---------------------------------------------
LOWORD MACRO bigword  
       mov  eax,bigword
       and  eax,0FFFFh      
ENDM
;---------------------------------------------
HIWORD MACRO bigword  
       mov  eax,bigword
       shr  eax,16
ENDM       
;---------------------------------------------
$invoke MACRO Fun:REQ, A:VARARG
  IFB <A>
    invoke Fun
  else
    invoke Fun, A
  endif
  exitm <eax>
ENDM
