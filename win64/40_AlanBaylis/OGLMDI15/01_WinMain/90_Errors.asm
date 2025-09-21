;WinMain

lbl_RegisterClass_Err:
lea rdx,szRegisterClass_Err ;'Failed to Register the Window'
jmp lbl_ShowErrorMessage

lbl_CreateWindowFrame_Err:
lea rdx,szCreateWindowFrame_Err ;'Failed to Create the Frame Window'
jmp lbl_ShowErrorMessage

;SetTextures

lbl_FileOpen_Err:
lea rdx,szFileOpen_Err ;'Image file not found'
jmp lbl_ShowErrorMessage

lbl_GIF_Err:
lea rdx,szGIF_Err ;'Image cannot be indexed color'
jmp lbl_ShowErrorMessage

lbl_GrayScale_Err:
lea rdx,szGrayScale_Err ;'Image cannot be grayscale color'
jmp lbl_ShowErrorMessage

lbl_Compressed_Err:
lea rdx,szCompressed_Err ;'Image cannot be compressed'
jmp lbl_ShowErrorMessage

lbl_Empty_Err:
lea rdx,szEmpty_Err ;'Image must have a width and height greater than 0'
jmp lbl_ShowErrorMessage

lbl_Bit_Err:
lea rdx,szBit_Err ;'Image must be 24 or 32 bit'
jmp lbl_ShowErrorMessage

lbl_ImageLoad_Err:
lea rdx,szImageLoad_Err ;'Image load failed for unknown reason'
jmp lbl_ShowErrorMessage

;WndProc



;Show Message and Quit
lbl_ShowErrorMessage:
xor rcx,rcx
lea r8,szError
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,80000000h ;mov eax,-1
jmp lbl_WinMain_End


