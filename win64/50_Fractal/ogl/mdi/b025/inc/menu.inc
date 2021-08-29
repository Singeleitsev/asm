;Position of SubMenus in Menus
        INIT_MENU_POS equ 0 ;Position of SubMenu in MenuInit = 0
        R2_MENU_POS equ 2 ;Position of SubMenu in MenuR2 = 2
        R3_MENU_POS equ 1 ;Position of SubMenu in MenuR3 = 1
;File
        IDM_NEWR2 equ 10
        IDM_NEWR3 equ 11
        IDM_CLOSE equ 12
        IDM_EXIT equ 13
;Color
        IDM_BLACK equ 20
        IDM_RED equ 21
        IDM_GREEN equ 22
        IDM_BLUE equ 23
        IDM_WHITE equ 24
;Window
        IDM_TILE equ 30
        IDM_CASCADE equ 31
        IDM_ARRANGE equ 32
        IDM_CLOSEALL equ 33
;Help
        IDM_ABOUT equ 40
;First Child
        IDM_FIRSTCHILD equ 100
;Added during translation into MASM
        MdiMenuInit equ 50
        MdiMenuR2 equ 51
        MdiMenuR3 equ 52
        MdiAccel equ 60
