;Position of SubMenus in Menus
        INIT_MENU_POS equ 0 ;Position of SubMenu in MenuInit = 0
        HELLO_MENU_POS equ 2 ;Position of SubMenu in MenuHello = 2
        RECT_MENU_POS equ 1 ;Position of SubMenu in MenuRect = 1
;File
        IDM_NEWHELLO equ 10
        IDM_NEWRECT equ 11
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
        MdiMenuHello equ 51
        MdiMenuRect equ 52
        MdiAccel equ 60
