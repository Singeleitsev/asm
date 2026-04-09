;case WM_CLOSE:
lbl_WndProc_Close:

mov rcx,hWnd
mov rdx,g_hMDIClient
mov r8,10h ;WM_CLOSE
mov r9,wParam
mov rax,lParam
mov qword ptr[rsp+20h],rax
call DefFrameProcA

jmp lbl_WndProc_End

