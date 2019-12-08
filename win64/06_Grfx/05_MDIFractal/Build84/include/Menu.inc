;SubMenu Positions
        INIT_MENU_POS equ 0 ;Position of SubMenu in MenuInit = 0
        SIEVE_MENU_POS equ 1 ;Position of SubMenu in MenuSieve = 1
        GASKET_MENU_POS equ 1 ;Position of SubMenu in MenuGasket = 1
	NGON_MENU_POS equ 2 ;Position of SubMenu in MenuNgon = 1
	TREE_MENU_POS equ 1 ;Position of SubMenu in MenuNgon = 1

;File
        IDM_NEWSIEVE equ 10h
        IDM_NEWGASKET equ 20h
        IDM_NEWNGON equ 30h
        IDM_NEWTREE equ 40h

        IDM_CLOSE equ 90h
	IDM_CLOSEALL equ 91h
        IDM_EXIT equ 99h

;Window
        IDM_TILE_VER equ 810h
        IDM_TILE_HOR equ 820h
        IDM_CASCADE equ 830h

;Help
        IDM_ABOUT equ 910h

;Added during translation into MASM
        MdiMenuInit equ 1000h
        MdiMenuSieve equ 1010h
        MdiMenuGasket equ 1020h
	MdiMenuNgon equ 1030h
	MdiMenuTree equ 1040h

;Accelerator Table
        MdiAccel equ 2000h

;First Child
        IDM_FIRSTCHILD equ 9000h
