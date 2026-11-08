RefreshStatus proc
PROLOG 100h

;xCamText
mov esi,dword ptr[vecCamPos+0] ;Pass as Binary via rsi
lea rdi,sz_xCamValue ;use rdi instead or rdx
call FloatToANSI 

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
xor r8,r8 ;Part 0
lea r9,sz_xCamText
call SendMessageA

;yCamText
mov esi,dword ptr[vecCamPos+4] ;Pass as Binary via rsi
lea rdi,sz_yCamValue ;use rdi instead or rdx
call FloatToANSI 

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,1 ;Part 1
lea r9,sz_yCamText
call SendMessageA

;zCamText
mov esi,dword ptr[vecCamPos+8] ;Pass as Binary via rsi
lea rdi,sz_zCamValue ;use rdi instead or rdx
call FloatToANSI 

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,2 ;Part 2
lea r9,sz_zCamText
call SendMessageA

;xObjText
mov esi,dword ptr[vecObjPos+0] ;Pass as Binary via rsi
lea rdi,sz_xObjValue ;use rdi instead or rdx
call FloatToANSI 

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,3 ;Part 3
lea r9,sz_xObjText
call SendMessageA

;yObjText
mov esi,dword ptr[vecObjPos+4] ;Pass as Binary via rsi
lea rdi,sz_yObjValue ;use rdi instead or rdx
call FloatToANSI 

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,4 ;Part 4
lea r9,sz_yObjText
call SendMessageA

;zObjText
mov esi,dword ptr[vecObjPos+8] ;Pass as Binary via rsi
lea rdi,sz_zObjValue ;use rdi instead or rdx
call FloatToANSI

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,5 ;Part 5
lea r9,sz_zObjText
call SendMessageA

EPILOG
RefreshStatus endp


