;lbl_RefreshStatus:

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi] ;Vector X, Component X
lea rdx,pszValXX
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
xor r8,r8 ;Part 0
lea r9,pszTxtXX
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+1*4] ;Vector Y, Component X
lea rdx,pszValYX
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,1 ;Part 1
lea r9,pszTxtYX
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+2*4] ;Vector Z, Component X
lea rdx,pszValZX
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,2 ;Part 2
lea r9,pszTxtZX
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+4*4] ;Vector X, Component Y
lea rdx,pszValXY
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,3 ;Part 3
lea r9,pszTxtXY
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+5*4] ;Vector Y, Component Y
lea rdx,pszValYY
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,4 ;Part 4
lea r9,pszTxtYY
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+6*4] ;Vector Z, Component Y
lea rdx,pszValZY
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,5 ;Part 5
lea r9,pszTxtZY
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+8*4] ;Vector X, Component Z
lea rdx,pszValXZ
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,6 ;Part 6
lea r9,pszTxtXZ
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+9*4] ;Vector Y, Component Z
lea rdx,pszValYZ
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,7 ;Part 7
lea r9,pszTxtYZ
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+0Ah*4] ;Vector Z, Component Z
lea rdx,pszValZZ
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,8 ;Part 8
lea r9,pszTxtZZ
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+0Ch*4] ;Vector X, Component W
lea rdx,pszValXW
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,9 ;Part 9
lea r9,pszTxtXW
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+0Dh*4] ;Vector Y, Component W
lea rdx,pszValYW
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,0Ah ;Part 10
lea r9,pszTxtYW
Call SendMessageA

lea rsi,mtxModelViewBuffer
mov ecx,dword ptr[rsi+0Eh*4] ;Vector Z, Component W
lea rdx,pszValZW
Call FloatConvert

mov rcx,ghWndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,0Bh ;Part 11
lea r9,pszTxtZW
Call SendMessageA

;lbl_RefreshStatus_End:
