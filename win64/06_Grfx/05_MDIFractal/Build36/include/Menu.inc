;Menu Positions
        INIT_MENU_POS equ 0 ;Position of SubMenu in MenuInit = 0
        SIEVE_MENU_POS equ 1 ;Position of SubMenu in MenuSieve = 1
        GASKET_MENU_POS equ 1 ;Position of SubMenu in MenuGasket = 1
	NGON_MENU_POS equ 1 ;Position of SubMenu in MenuNgon = 1

;File
        IDM_NEWSIEVE equ 11h
        IDM_NEWGASKET equ 12h
        IDM_NEWNGON equ 13h
        IDM_CLOSE equ 14h
	IDM_CLOSEALL equ 15h
        IDM_EXIT equ 16h

;Window
        IDM_TILE_VER equ 41h
        IDM_TILE_HOR equ 42h
        IDM_CASCADE equ 43h

;Help
        IDM_ABOUT equ 51h

;Added during translation into MASM
        MdiMenuInit equ 60h
        MdiMenuSieve equ 61h
        MdiMenuGasket equ 62h
	MdiMenuNgon equ 63h

;Accelerator Table
        MdiAccel equ 70h

;First Child
        IDM_FIRSTCHILD equ 100h
