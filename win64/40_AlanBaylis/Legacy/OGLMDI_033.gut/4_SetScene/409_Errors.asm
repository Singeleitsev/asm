lbl_FileOpen_Err:
lea rdx,szFileOpen_Err ;'Image file not found'
jmp lbl_SetTextures_ShowErrorMessage

lbl_ReadFile_Err:
mov rcx,txr.lpszFileName
Call CloseHandle
mov txr.lpszFileName,0
lea rdx,szReadFile_Err ;'Failed to Read the Image File'
jmp lbl_SetTextures_ShowErrorMessage

lbl_GIF_Err:
mov rcx,txr.lpszFileName
Call CloseHandle
mov txr.lpszFileName,0
lea rdx,szGIF_Err ;'Image must not be indexed color'
jmp lbl_SetTextures_ShowErrorMessage

lbl_GrayScale_Err:
mov rcx,txr.lpszFileName
Call CloseHandle
mov txr.lpszFileName,0
lea rdx,szGrayScale_Err ;'Image must not be grayscale color'
jmp lbl_SetTextures_ShowErrorMessage

lbl_Compressed_Err:
mov rcx,txr.lpszFileName
Call CloseHandle
mov txr.lpszFileName,0
lea rdx,szCompressed_Err ;'Image must not be compressed'
jmp lbl_SetTextures_ShowErrorMessage

lbl_ImageLoad_Err:
mov rcx,txr.lpszFileName
Call CloseHandle
mov txr.lpszFileName,0
lea rdx,szImageLoad_Err ;'Image load failed for unknown reason'
jmp lbl_SetTextures_ShowErrorMessage

lbl_Bit_Err:
mov rcx,txr.lpszFileName
Call CloseHandle
mov txr.lpszFileName,0
lea rdx,szBit_Err ;'Image must be 24 or 32 bit'
jmp lbl_SetTextures_ShowErrorMessage

lbl_Empty_Err:
mov rcx,txr.lpszFileName
Call CloseHandle
mov txr.lpszFileName,0
lea rdx,szEmpty_Err ;'Image must have a width and height greater than 0'
jmp lbl_SetTextures_ShowErrorMessage

lbl_DataSize_Err:
Call GetProcessHeap
mov rcx,rax
xor rdx,rdx
lea r8,lpImageData
Call HeapFree
mov rcx,txr.lpszFileName
Call CloseHandle
mov txr.lpszFileName,0
lea rdx,szDataSize_Err ;'Image Size Does Not Match The Memory Reserved'
jmp lbl_SetTextures_ShowErrorMessage

;Show Message and Quit
lbl_SetTextures_ShowErrorMessage:
xor rcx,rcx
lea r8,szError
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
xor rax,rax
jmp lbl_SetTextures_End


