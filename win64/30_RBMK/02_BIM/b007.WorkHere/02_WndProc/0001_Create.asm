lbl_wmcreate:

;hMenu = CreateMenu();
Call CreateMenu
mov hMenu, rax

;hMenuFile = Createmenu();
Call CreateMenu
mov hMenuFile, rax
;AppendMenu(hMenu, MF_POPUP,(UINT) hMenuFile, "&File");
mov rcx, hMenu
mov rdx, 10h ;MF_POPUP
mov r8, hMenuFile
lea r9, szMenuFile
Call AppendMenuA
;AppendMenu(hMenuFile, MF_STRING, IDM_NEW, "&New");
;AppendMenu(hMenuFile, MF_STRING, IDM_OPEN, "&Open...");
;AppendMenu(hMenuFile, MF_STRING, IDM_SAVE, "&Save");
;AppendMenu(hMenuFile, MF_STRING, IDM_SAVEAS, "Save &As...");
;AppendMenu(hMenuFile, MF_SEPARATOR, 0, NULL);
;AppendMenu(hMenuFile, MF_STRING, IDM_EXIT, "E&xit");
mov rcx, hMenuFile
xor rdx, rdx ;MF_STRING = 0
movsx r8, IDM_EXIT
lea r9, szMenuFileExit
Call AppendMenuA

;hMenuEdit = CreateMenu();
;AppendMenu(hMenu, MF_POPUP,(UINT) hMenuEdit, "&Edit");
;AppendMenu(hMenuEdit, MF_STRING, IDM_UNDO, "&Undo");
;AppendMenu(hMenuEdit, MF_SEPARATOR, 0, NULL);
;AppendMenu(hMenuEdit, MF_STRING, IDM_CUT, "Cu&t");
;AppendMenu(hMenuEdit, MF_STRING, IDM_COPY, "&Copy");
;AppendMenu(hMenuEdit, MF_STRING, IDM_PASTE, "&Paste");
;AppendMenu(hMenuEdit, MF_STRING, IDM_DEL, "De&lete");

;hMenuTimer = CreateMenu()
;AppendMenu(hMenu, MF_POPUP,(UINT) hMenuTimer, "&Timer");
;AppendMenu(hMenuTimer, MF_STRING, IDM_START, "&Start");
;AppendMenu(hMenuTimer, MF_STRING | MF_GRAYED, IDM_STOP, "S&top");

;hMenuHelp = CreateMenu();
Call CreateMenu
mov hMenuHelp, rax
;AppendMenu(hMenu, MF_POPUP,(UINT) hMenuHelp, "&Help");
mov rcx, hMenu
mov rdx, 10h ;MF_POPUP
mov r8, hMenuHelp
lea r9, szMenuHelp
Call AppendMenuA
;AppendMenu(hMenuHelp, MF_STRING, IDM_HELP, "&Help...");
;AppendMenu(hMenuHelp, MF_STRING, IDM_ABOUT, "&About MenuDemo...");
mov rcx, hMenuHelp
xor rdx, rdx ;MF_STRING = 0
movsx r8, IDM_ABOUT
lea r9, szMenuHelpAbout
Call AppendMenuA

;SetMenu(hwnd, hMenuMain);
mov rcx, hwnd
mov rdx, hMenu
Call SetMenu
;DrawMenuBar(hwnd);
mov rcx, hwnd
Call DrawMenuBar

xor eax,eax
jmp lbl_finish

