;Position of SubMenus in Menus
        INIT_MENU_POS equ 0 ;Position of SubMenu in MenuInit = 0
        ChNPP_MENU_POS equ 2 ;Position of SubMenu in MenuChNPP = 2
        RBMK_MENU_POS equ 1 ;Position of SubMenu in MenuRBMK = 1
;File
        IDM_NEWChNPP equ 10
        IDM_NEWRBMK equ 11
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
        MdiMenuChNPP equ 51
        MdiMenuRBMK equ 52
        MdiAccel equ 60
