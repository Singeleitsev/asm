SetTextures proc

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;texture[0].LoadTGA();
;bool TEXTURE::LoadTGA()

;FILE *file = fopen(TexName, "rb") // Open The TGA Fi
lea rcx,szTGAFileName
mov rdx,80000000h ;dwDesiredAccess = GENERIC_READ
mov r8,1 ;dwShareMode = FILE_SHARE_READ
xor r9,r9
mov qword ptr [rsp+20h],3 ;dwCreationDisposition = OPEN_EXISTING
;mov qword ptr [rsp+28h],40000080h ;dwFlagsAndAttributes = FILE_ATTRIBUTE_NORMAL | FILE_FLAG_OVERLAPPED
mov  qword ptr [rsp+28h],80h ; FILE_ATTRIBUTE_NORMAL (not OVERLAPPED)
mov qword ptr [rsp+30h],0 ;hTemplateFile
Call CreateFileA
cmp rax,-1 ;INVALID_HANDLE_VALUE
je lbl_FileOpen_Err ;Image file not found
mov txr.lpszFileName,rax

;fread(TGAcompare,1,sizeof(TGAcompare),file) != sizeof(TGAcompare) || // Are There 12 Bytes To Read?
;mov ol.Offset_,0
mov rcx,rax ;txr.lpszFileName
lea rdx,TGAcompare ;lpBuffer
mov r8,12 ;nNumberOfBytesToRead = sizeof header
lea r9,NumberOfBytesRead
;lea rax,ol
;mov qword ptr [rsp+20h],rax ;lpOverlapped
mov qword ptr [rsp+20h],0
Call ReadFile
test rax,rax
jz lbl_ReadFile_Err
cmp NumberOfBytesRead,12
jne lbl_ReadFile_Err ;Failed to Read the File

;Check for known issues
lea rsi,TGAcompare
add rsi,2 ;TGAcompare[2]
cmp byte ptr[rsi],1
je lbl_GIF_Err ;Image cannot be indexed color
cmp byte ptr[rsi],3
je lbl_GrayScale_Err ;Image cannot be grayscale color
cmp byte ptr[rsi],9
je lbl_Compressed_Err ;Image cannot be compressed
cmp byte ptr[rsi],10
je lbl_Compressed_Err ;Image cannot be compressed

;memcmp(TGAheader,TGAcompare,sizeof(TGAheader)) != 0 // Does The Header Match What We Want?
mov rcx,12
lea rsi,TGAheader
lea rdi,TGAcompare
cld
repe cmpsb
jnz lbl_ImageLoad_Err ;Image load failed for unknown reason

;fread(header,1,sizeof(header),file) != sizeof(header) // If So Read Next 6 Header Bytes
;mov ol.Offset_,12
mov rcx,txr.lpszFileName
lea rdx,header ;lpBuffer
mov r8,6 ;nNumberOfBytesToRead = sizeof header
lea r9,NumberOfBytesRead
;lea rax,ol
;mov qword ptr [rsp+20h],rax ;lpOverlapped
mov qword ptr [rsp+20h],0
Call ReadFile
test rax,rax
jz lbl_ReadFile_Err
cmp NumberOfBytesRead,6
jne lbl_ReadFile_Err ;Failed to Read the File

lea rsi,header
add rsi,4
cmp byte ptr[rsi],18h ;24-bit TGA
je lbl_SetRGB
cmp byte ptr[rsi],20h ;32-bit TGA
je lbl_SetRGBA
jmp lbl_Bit_Err ;Image must be 24 or 32 bit

lbl_SetRGB:
mov txr.txrType,1907h ;GL_RGB
jmp lbl_CheckTGA
lbl_SetRGBA:
mov txr.txrType,1908h ;GL_RGBA
;jmp lbl_CheckTGA

lbl_CheckTGA:
;Width  = header[1] * 256 + header[0] // Determine The TGA Width;  (highbyte*256+lowbyte)
lea rsi,header
xor rax,rax
mov al,byte ptr[rsi+1]
shl ax,8 ;header[1] * 256
movzx bx,byte ptr[rsi]
add ax,bx
mov txr.txrWidth,eax
cmp rax,0
je lbl_Empty_Err ;Image must have width and height greater than 0

;Height = header[3] * 256 + header[2] // Determine The TGA Height; (highbyte*256+lowbyte)
;lea rsi,header
xor rax,rax
mov al,byte ptr[rsi+3]
shl ax,8 ;header[3] * 256
movzx bx,byte ptr[rsi+2]
add ax,bx
mov txr.txrHeight,eax
cmp rax,0
je lbl_Empty_Err ;Image must have width and height greater than 0

;Bpp = header[4] // Grab The TGA's Bits Per Pixel (24 or 32)
;lea rsi,header
xor rax,rax
mov al,byte ptr[rsi+4]
mov txr.txrBitsPP,eax

;bytesPerPixel = Bpp/8
shr al,3 ;Divide By 8 To Get The Bytes Per Pixel

;imageSize = Width*Height*bytesPerPixel // Calculate The Memory Required For The TGA Data
mov ebx,txr.txrWidth
imul ebx,txr.txrHeight
imul eax,ebx
mov txr.txrSize,eax

;ImageData = (GLubyte*)malloc(imageSize) // Reserve Memory To Hold The TGA Data
Call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,txr.txrSize
Call HeapAlloc
mov lpImageData,rax
cmp rax,0
je lbl_ImageLoad_Err ;Image load failed for unknown reason

;fread(ImageData, 1, imageSize, file)!=imageSize) // Does The Image Size Match The Memory Reserved?
;mov ol.Offset_,18 ;TGAheader + header = 12 + 6
mov rcx,txr.lpszFileName
mov rdx,lpImageData ;lpBuffer
xor r8,r8
mov r8d,txr.txrSize ;nNumberOfBytesToRead = sizeof ImageData = imageSize
lea r9,NumberOfBytesRead
;lea rax,ol
;mov qword ptr [rsp+20h],rax ;lpOverlapped
mov qword ptr [rsp+20h],0
Call ReadFile
test rax,rax
jz lbl_DataSize_Err
mov r8d,txr.txrSize
cmp NumberOfBytesRead,r8d
jne lbl_DataSize_Err ;Image Size Does Not Match The Memory Reserved

;for(GLuint i=0; i<(GLuint)imageSize; i+=bytesPerPixel);;;; // Loop Through The Image Data
xor rcx,rcx
xor rbx,rbx
mov ebx,txr.txrBitsPP
shr bx,3 ;Convert Bits to Bytes
xor rdx,rdx
mov edx,txr.txrSize
;Swaps The 1st And 3rd Bytes ('R'ed and 'B'lue)
lbl_SwapRnB:
;Temporarily Store The Value At Image Data 'i'
;temp = ImageData[i]
mov rsi,lpImageData
add rsi,rcx
mov al,byte ptr[rsi]
;ImageData[i] = ImageData[i + 2] // Set The 1st Byte To The Value Of The 3rd Byte
mov ah,byte ptr[rsi+2]
mov byte ptr[rsi],ah
;ImageData[i + 2] = (GLubyte)temp // Set The 3rd Byte To The Value In 'temp' (1st Byte Value)
mov byte ptr[rsi+2],al
add ecx,ebx ;i += bytesPerPixel
cmp ecx,edx ;i < imageSize
jl lbl_SwapRnB

;// Build A Texture From The Data
;glGenTextures(1, &TexID) // Generate OpenGL texture IDs
mov rcx,1 ;Number of texture names to be generated
lea rdx,txr.txrID ;Pointer to the array where names are stored
Call glGenTextures ;Generate texture names

;glBindTexture(GL_TEXTURE_2D, TexID);
mov rcx,0DE1h ;target = GL_TEXTURE_2D
xor rdx,rdx
mov edx,txr.txrID ;The name of a texture; the texture name cannot currently be in use
Call glBindTexture ;Enable the creation of a named texture that is bound to a texture target

;glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
mov rcx,0de1H ;GL_TEXTURE_2D
mov rdx,2802H ;GL_TEXTURE_WRAP_S
mov r8,46240000h ;2900h
movd xmm2,r8d ;GL_CLAMP == GLint(0x2900) == 46240000h
Call glTexParameterf

;glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
mov rcx,0de1H ;GL_TEXTURE_2D
mov rdx,2803H ;GL_TEXTURE_WRAP_T
mov r8,46240000h ;2900h
movd xmm2,r8d ;GL_CLAMP == GLint(0x2900) == 46240000h
Call glTexParameterf

;glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
mov rcx,0de1H ;GL_TEXTURE_2D
mov rdx,2800H ;GL_TEXTURE_MAG_FILTER
mov r8,46180400h ;2601h
movd xmm2,r8d; ;GL_LINEAR == GLint(0x2601) == 46180400h
Call glTexParameterf

;glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
mov rcx,0de1H ;GL_TEXTURE_2D
mov rdx,2800H ;GL_TEXTURE_MIN_FILTER
mov r8,461c0c00h ;2703h
movd xmm2,r8d ;GL_LINEAR_MIPMAP_LINEAR == GLint(0x2703) == 461c0c00h
Call glTexParameterf

;glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
mov rcx,2300H ;GL_TEXTURE_ENV
mov rdx,2200h ;GL_TEXTURE_ENV_MODE
mov r8,46040000h ;2100h
movd xmm2,r8d ;GL_MODULATE == GLint(0x2100) == 46040000h
Call glTexEnvf

;glTexImage2D(GL_TEXTURE_2D, 0, type, Width, Height, 0, type, GL_UNSIGNED_BYTE, ImageData);
mov rcx,0de1H ;GL_TEXTURE_2D
xor rdx,rdx
movsxd r8,txr.txrType
movsxd r9,txr.txrWidth
movsxd rax,txr.txrHeight
mov qword ptr[rsp+20h],rax
mov qword ptr[rsp+28h],rdx ;0
;movsxd r8,txr.txrType
mov qword ptr[rsp+30h],r8 ;txr.txrType
mov qword ptr[rsp+38h],1401H ;GL_UNSIGNED_BYTE
mov rax,lpImageData
mov qword ptr[rsp+40h],rax
Call glTexImage2D

;gluBuild2DMipmaps(GL_TEXTURE_2D, type, Width, Height, type, GL_UNSIGNED_BYTE, ImageData);
mov rcx,0de1H ;GL_TEXTURE_2D
movsxd rdx,txr.txrType
movsxd r8,txr.txrWidth
movsxd r9,txr.txrHeight
mov qword ptr[rsp+20h],rdx ;txr.txrType
mov qword ptr[rsp+28h],1401H ;GL_UNSIGNED_BYTE
mov rax,lpImageData
mov qword ptr[rsp+30h],rax
Call gluBuild2DMipmaps

;free(ImageData);
Call GetProcessHeap
mov rcx,rax
xor rdx,rdx
mov r8,lpImageData
Call HeapFree
mov lpImageData,0

mov rcx,txr.lpszFileName
Call CloseHandle

jmp lbl_SetTextures_Return1

include 409_Errors.asm

;Texture Building Went Ok, Return True
lbl_SetTextures_Return1:
mov rax,1

lbl_SetTextures_End:
;Epilogue
leave
ret
SetTextures endp

