push ebp
mov ebp,esp
sub esp,58
push ebx
push esi
push edi
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ds:[405E90],eax
cmp dword ptr ss:[ebp+C],0
jne mdidemo.40118B
mov dword ptr ss:[ebp-34],30
mov dword ptr ss:[ebp-30],3
mov dword ptr ss:[ebp-2C],mdidemo.401305
mov dword ptr ss:[ebp-28],0
mov dword ptr ss:[ebp-24],0
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-20],eax
push 7F00
push 0
call dword ptr ds:[<&LoadIconA>]
mov dword ptr ss:[ebp-1C],eax
push 7F00
push 0
call dword ptr ds:[<&LoadCursorA>]
mov dword ptr ss:[ebp-18],eax
mov dword ptr ss:[ebp-14],D
mov dword ptr ss:[ebp-10],0
mov dword ptr ss:[ebp-C],mdidemo.405030
push 7F00
push 0
call dword ptr ds:[<&LoadIconA>]
mov dword ptr ss:[ebp-8],eax
lea eax,dword ptr ss:[ebp-34]
push eax
call dword ptr ds:[<&RegisterClassExA>]
mov dword ptr ss:[ebp-34],30
mov dword ptr ss:[ebp-30],3
mov dword ptr ss:[ebp-2C],mdidemo.4016EB
mov dword ptr ss:[ebp-28],0
mov dword ptr ss:[ebp-24],4
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-20],eax
push 7F00
push 0
call dword ptr ds:[<&LoadIconA>]
mov dword ptr ss:[ebp-1C],eax
push 7F00
push 0
call dword ptr ds:[<&LoadCursorA>]
mov dword ptr ss:[ebp-18],eax
push 0
call dword ptr ds:[<&GetStockObject>]
mov dword ptr ss:[ebp-14],eax
mov dword ptr ss:[ebp-10],0
mov dword ptr ss:[ebp-C],mdidemo.405040
push 7F00
push 0
call dword ptr ds:[<&LoadIconA>]
mov dword ptr ss:[ebp-8],eax
lea eax,dword ptr ss:[ebp-34]
push eax
call dword ptr ds:[<&RegisterClassExA>]
mov dword ptr ss:[ebp-34],30
mov dword ptr ss:[ebp-30],3
mov dword ptr ss:[ebp-2C],mdidemo.4019D7
mov dword ptr ss:[ebp-28],0
mov dword ptr ss:[ebp-24],4
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-20],eax
push 7F00
push 0
call dword ptr ds:[<&LoadIconA>]
mov dword ptr ss:[ebp-1C],eax
push 7F00
push 0
call dword ptr ds:[<&LoadCursorA>]
mov dword ptr ss:[ebp-18],eax
push 0
call dword ptr ds:[<&GetStockObject>]
mov dword ptr ss:[ebp-14],eax
mov dword ptr ss:[ebp-10],0
mov dword ptr ss:[ebp-C],mdidemo.405050
push 7F00
push 0
call dword ptr ds:[<&LoadIconA>]
mov dword ptr ss:[ebp-8],eax
lea eax,dword ptr ss:[ebp-34]
push eax
call dword ptr ds:[<&RegisterClassExA>]
push mdidemo.405074
mov eax,dword ptr ds:[405E90]
push eax
call dword ptr ds:[<&LoadMenuA>]
mov dword ptr ds:[405EAC],eax
push mdidemo.405080
mov eax,dword ptr ds:[405E90]
push eax
call dword ptr ds:[<&LoadMenuA>]
mov dword ptr ds:[405EB8],eax
push mdidemo.405090
mov eax,dword ptr ds:[405E90]
push eax
call dword ptr ds:[<&LoadMenuA>]
mov dword ptr ds:[405E94],eax
push 0
mov eax,dword ptr ds:[405EAC]
push eax
call dword ptr ds:[<&GetSubMenu>]
mov dword ptr ds:[405EB0],eax
push 2
mov eax,dword ptr ds:[405EB8]
push eax
call dword ptr ds:[<&GetSubMenu>]
mov dword ptr ds:[405EA4],eax
push 1
mov eax,dword ptr ds:[405E94]
push eax
call dword ptr ds:[<&GetSubMenu>]
mov dword ptr ds:[405EA8],eax
push mdidemo.40509C
mov eax,dword ptr ds:[405E90]
push eax
call dword ptr ds:[<&LoadAcceleratorsA>]
mov dword ptr ss:[ebp-4],eax
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
mov eax,dword ptr ds:[405EAC]
push eax
push 0
push 80000000
push 80000000
push 80000000
push 80000000
push 2CF0000
push mdidemo.4050A8
push mdidemo.405030
push 0
call dword ptr ds:[<&CreateWindowExA>]
mov dword ptr ss:[ebp-58],eax
push 5
mov eax,dword ptr ss:[ebp-58]
push eax
call dword ptr ds:[<&GetWindow>]
mov dword ptr ss:[ebp-54],eax
mov eax,dword ptr ss:[ebp+14]
push eax
mov eax,dword ptr ss:[ebp-58]
push eax
call dword ptr ds:[<&ShowWindow>]
mov eax,dword ptr ss:[ebp-58]
push eax
call dword ptr ds:[<&UpdateWindow>]
push 0
push 0
push 0
lea eax,dword ptr ss:[ebp-50]
push eax
call dword ptr ds:[<&GetMessageA>]
test eax,eax
je mdidemo.4012DE
lea eax,dword ptr ss:[ebp-50]
push eax
mov eax,dword ptr ss:[ebp-54]
push eax
call dword ptr ds:[<&TranslateMDISysAccel>]
test eax,eax
jne mdidemo.4012D9
lea eax,dword ptr ss:[ebp-50]
push eax
mov eax,dword ptr ss:[ebp-4]
push eax
mov eax,dword ptr ss:[ebp-58]
push eax
call dword ptr ds:[<&TranslateAccelerator>]
test eax,eax
jne mdidemo.4012D9
lea eax,dword ptr ss:[ebp-50]
push eax
call dword ptr ds:[<&TranslateMessage>]
lea eax,dword ptr ss:[ebp-50]
push eax
call dword ptr ds:[<&DispatchMessageA>]
jmp mdidemo.40127D
mov eax,dword ptr ds:[405EB8]
push eax
call dword ptr ds:[<&DestroyMenu>]
mov eax,dword ptr ds:[405E94]
push eax
call dword ptr ds:[<&DestroyMenu>]
mov eax,dword ptr ss:[ebp-48]
jmp mdidemo.4012FE
pop edi
pop esi
pop ebx
leave 
ret 10
push ebp
mov ebp,esp
sub esp,38
push ebx
push esi
push edi
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-34],eax
jmp mdidemo.4015F5
mov eax,dword ptr ds:[405EB0]
mov dword ptr ss:[ebp-C],eax
mov dword ptr ss:[ebp-8],64
lea eax,dword ptr ss:[ebp-C]
push eax
mov eax,dword ptr ds:[405E90]
push eax
push 1
mov eax,dword ptr ss:[ebp+8]
push eax
push 0
push 0
push 0
push 0
push 52000000
push 0
push mdidemo.4050BC
push 0
call dword ptr ds:[<&CreateWindowExA>]
mov dword ptr ds:[405EBC],eax
xor eax,eax
jmp mdidemo.401655
mov eax,dword ptr ss:[ebp+10]
mov dword ptr ss:[ebp-38],eax
jmp mdidemo.40154B
mov dword ptr ss:[ebp-30],mdidemo.405040
mov dword ptr ss:[ebp-2C],mdidemo.4050C8
mov eax,dword ptr ds:[405E90]
mov dword ptr ss:[ebp-28],eax
mov dword ptr ss:[ebp-24],80000000
mov dword ptr ss:[ebp-20],80000000
mov dword ptr ss:[ebp-1C],80000000
mov dword ptr ss:[ebp-18],80000000
mov dword ptr ss:[ebp-14],0
mov dword ptr ss:[ebp-10],0
lea eax,dword ptr ss:[ebp-30]
push eax
push 0
push 220
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
mov dword ptr ss:[ebp-4],eax
xor eax,eax
jmp mdidemo.401655
mov dword ptr ss:[ebp-30],mdidemo.405050
mov dword ptr ss:[ebp-2C],mdidemo.4050D0
mov eax,dword ptr ds:[405E90]
mov dword ptr ss:[ebp-28],eax
mov dword ptr ss:[ebp-24],80000000
mov dword ptr ss:[ebp-20],80000000
mov dword ptr ss:[ebp-1C],80000000
mov dword ptr ss:[ebp-18],80000000
mov dword ptr ss:[ebp-14],0
mov dword ptr ss:[ebp-10],0
lea eax,dword ptr ss:[ebp-30]
push eax
push 0
push 220
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
mov dword ptr ss:[ebp-4],eax
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 229
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
mov dword ptr ss:[ebp-4],eax
push 0
push 0
push 11
mov eax,dword ptr ss:[ebp-4]
push eax
call dword ptr ds:[<&SendMessageA>]
test eax,eax
je mdidemo.401474
push 0
mov eax,dword ptr ss:[ebp-4]
push eax
push 221
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 10
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 226
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 227
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 228
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
xor eax,eax
jmp mdidemo.401655
push 0
push mdidemo.40165C
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&EnumChildWindows>]
xor eax,eax
jmp mdidemo.401655
push 0
push 0
push 229
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&SendMessageA>]
mov dword ptr ss:[ebp-4],eax
mov eax,dword ptr ss:[ebp-4]
push eax
call dword ptr ds:[<&IsWindow>]
test eax,eax
je mdidemo.401541
mov eax,dword ptr ss:[ebp+14]
push eax
mov eax,dword ptr ss:[ebp+10]
push eax
push 111
mov eax,dword ptr ss:[ebp-4]
push eax
call dword ptr ds:[<&SendMessageA>]
jmp mdidemo.4015A7
jmp mdidemo.4015A7
sub dword ptr ss:[ebp-38],A
cmp dword ptr ss:[ebp-38],17
ja mdidemo.401500
mov eax,dword ptr ss:[ebp-38]
xor ecx,ecx
mov cl,byte ptr ds:[eax+40158F]
jmp dword ptr ds:[ecx*4+40156B]
imul edx,dword ptr ds:[ebx],40
add ah,cl
adc eax,dword ptr ds:[eax]
sub eax,7B004014
adc al,40
add byte ptr ds:[edx-51FFBFEC],dl
adc al,40
add dl,cl
adc al,40
add dh,ah
adc al,40
add byte ptr ds:[eax],al
adc eax,1000040
add al,byte ptr ds:[ebx]
or byte ptr ds:[eax],cl
or byte ptr ds:[eax],cl
or byte ptr ds:[eax],cl
or byte ptr ds:[eax],cl
or byte ptr ds:[eax],cl
or byte ptr ds:[eax],cl
or byte ptr ds:[eax],cl
or byte ptr ds:[eax],cl
add al,5
push es
pop es
jmp mdidemo.401634
push 0
push 21
push 111
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SendMessageA>]
push 5
mov eax,dword ptr ds:[405EBC]
push eax
call dword ptr ds:[<&GetWindow>]
test eax,eax
je mdidemo.4015DC
xor eax,eax
jmp mdidemo.401655
jmp mdidemo.401634
push 0
call dword ptr ds:[<&PostQuitMessage>]
xor eax,eax
jmp mdidemo.401655
jmp mdidemo.401634
cmp dword ptr ss:[ebp-34],11
ja mdidemo.401622
cmp dword ptr ss:[ebp-34],10
jae mdidemo.4015AC
cmp dword ptr ss:[ebp-34],1
je mdidemo.401319
cmp dword ptr ss:[ebp-34],2
je mdidemo.4015E1
jmp mdidemo.401634
cmp dword ptr ss:[ebp-34],111
je mdidemo.401360
jmp mdidemo.401634
mov eax,dword ptr ss:[ebp+14]
push eax
mov eax,dword ptr ss:[ebp+10]
push eax
mov eax,dword ptr ss:[ebp+C]
push eax
mov eax,dword ptr ds:[405EBC]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&DefFrameProcA>]
jmp mdidemo.401655
pop edi
pop esi
pop ebx
leave 
ret 10
push ebp
mov ebp,esp
push ebx
push esi
push edi
push 4
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindow>]
test eax,eax
je mdidemo.401680
mov eax,1
jmp mdidemo.4016E4
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
push 223
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetParent>]
push eax
call dword ptr ds:[<&SendMessageA>]
push 0
push 0
push 11
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SendMessageA>]
test eax,eax
jne mdidemo.4016BE
mov eax,1
jmp mdidemo.4016E4
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
push 221
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetParent>]
push eax
call dword ptr ds:[<&SendMessageA>]
mov eax,1
jmp mdidemo.4016E4
pop edi
pop esi
pop ebx
leave 
ret 8
push ebp
mov ebp,esp
sub esp,64
push ebx
push esi
push edi
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-60],eax
jmp mdidemo.40194E
push 8
push 8
call dword ptr ds:[<&GetProcessHeap>]
push eax
call dword ptr ds:[<&RtlAllocateHeap>]
mov dword ptr ss:[ebp-58],eax
mov eax,dword ptr ss:[ebp-58]
mov dword ptr ds:[eax],14
mov eax,dword ptr ss:[ebp-58]
mov dword ptr ds:[eax+4],0
mov eax,dword ptr ss:[ebp-58]
push eax
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SetWindowLongA>]
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetParent>]
mov dword ptr ds:[405EA0],eax
mov eax,dword ptr ds:[405EA0]
push eax
call dword ptr ds:[<&GetParent>]
mov dword ptr ds:[405EB4],eax
xor eax,eax
jmp mdidemo.4019D0
mov eax,dword ptr ss:[ebp+10]
mov dword ptr ss:[ebp-64],eax
jmp mdidemo.4017D5
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-58],eax
mov eax,dword ptr ds:[405EB4]
push eax
call dword ptr ds:[<&GetMenu>]
mov dword ptr ss:[ebp-5C],eax
push 0
mov eax,dword ptr ss:[ebp-58]
mov eax,dword ptr ds:[eax]
push eax
mov eax,dword ptr ss:[ebp-5C]
push eax
call dword ptr ds:[<&CheckMenuItem>]
mov eax,dword ptr ss:[ebp+10]
mov ecx,dword ptr ss:[ebp-58]
mov dword ptr ds:[ecx],eax
push 8
mov eax,dword ptr ss:[ebp-58]
mov eax,dword ptr ds:[eax]
push eax
mov eax,dword ptr ss:[ebp-5C]
push eax
call dword ptr ds:[<&CheckMenuItem>]
mov eax,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[eax*4+405010]
mov ecx,dword ptr ss:[ebp-58]
mov dword ptr ds:[ecx+4],eax
push 0
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&InvalidateRect>]
jmp mdidemo.4017EE
cmp dword ptr ss:[ebp-64],14
jb mdidemo.4017EE
cmp dword ptr ss:[ebp-64],18
jbe mdidemo.401768
jmp mdidemo.4017EE
xor eax,eax
jmp mdidemo.4019D0
lea eax,dword ptr ss:[ebp-50]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&BeginPaint>]
mov dword ptr ss:[ebp-54],eax
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-58],eax
mov eax,dword ptr ss:[ebp-58]
mov eax,dword ptr ds:[eax+4]
push eax
mov eax,dword ptr ss:[ebp-54]
push eax
call dword ptr ds:[<&SetTextColor>]
lea eax,dword ptr ss:[ebp-10]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetClientRect>]
push 25
lea eax,dword ptr ss:[ebp-10]
push eax
push FFFFFFFF
push mdidemo.4050DC
mov eax,dword ptr ss:[ebp-54]
push eax
call dword ptr ds:[<&DrawTextA>]
lea eax,dword ptr ss:[ebp-50]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&EndPaint>]
xor eax,eax
jmp mdidemo.4019D0
mov eax,dword ptr ss:[ebp+14]
cmp dword ptr ss:[ebp+8],eax
jne mdidemo.401889
mov eax,dword ptr ds:[405EA4]
push eax
mov eax,dword ptr ds:[405EB8]
push eax
push 230
mov eax,dword ptr ds:[405EA0]
push eax
call dword ptr ds:[<&SendMessageA>]
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-58],eax
mov eax,dword ptr ss:[ebp+8]
sub eax,dword ptr ss:[ebp+14]
cmp eax,1
sbb eax,eax
and eax,8
push eax
mov eax,dword ptr ss:[ebp-58]
mov eax,dword ptr ds:[eax]
push eax
mov eax,dword ptr ds:[405EB8]
push eax
call dword ptr ds:[<&CheckMenuItem>]
mov eax,dword ptr ss:[ebp+14]
cmp dword ptr ss:[ebp+8],eax
je mdidemo.4018E2
mov eax,dword ptr ds:[405EB0]
push eax
mov eax,dword ptr ds:[405EAC]
push eax
push 230
mov eax,dword ptr ds:[405EA0]
push eax
call dword ptr ds:[<&SendMessageA>]
mov eax,dword ptr ds:[405EB4]
push eax
call dword ptr ds:[<&DrawMenuBar>]
xor eax,eax
jmp mdidemo.4019D0
push 21
push mdidemo.4050EC
push mdidemo.4050F4
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&MessageBoxA>]
cmp eax,1
je mdidemo.40191B
xor eax,eax
jmp mdidemo.4019D0
jmp mdidemo.4019B5
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-58],eax
mov eax,dword ptr ss:[ebp-58]
push eax
push 0
call dword ptr ds:[<&GetProcessHeap>]
push eax
call dword ptr ds:[<&HeapFree>]
xor eax,eax
jmp mdidemo.4019D0
jmp mdidemo.4019B5
cmp dword ptr ss:[ebp-60],F
ja mdidemo.401977
je mdidemo.4017F5
cmp dword ptr ss:[ebp-60],1
je mdidemo.4016FF
cmp dword ptr ss:[ebp-60],2
je mdidemo.401920
jmp mdidemo.4019B5
cmp dword ptr ss:[ebp-60],111
ja mdidemo.4019A3
je mdidemo.40175D
cmp dword ptr ss:[ebp-60],10
jb mdidemo.4019B5
cmp dword ptr ss:[ebp-60],11
jbe mdidemo.4018F5
jmp mdidemo.4019B5
cmp dword ptr ss:[ebp-60],222
je mdidemo.401860
jmp mdidemo.4019B5
mov eax,dword ptr ss:[ebp+14]
push eax
mov eax,dword ptr ss:[ebp+10]
push eax
mov eax,dword ptr ss:[ebp+C]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&DefMDIChildProcA>]
jmp mdidemo.4019D0
pop edi
pop esi
pop ebx
leave 
ret 10
push ebp
mov ebp,esp
sub esp,6C
push ebx
push esi
push edi
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-6C],eax
jmp mdidemo.401C78
push 4
push 8
call dword ptr ds:[<&GetProcessHeap>]
push eax
call dword ptr ds:[<&RtlAllocateHeap>]
mov dword ptr ss:[ebp-48],eax
mov eax,dword ptr ss:[ebp-48]
push eax
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SetWindowLongA>]
push 0
push FA
push 1
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&SetTimer>]
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetParent>]
mov dword ptr ds:[405E9C],eax
mov eax,dword ptr ds:[405E9C]
push eax
call dword ptr ds:[<&GetParent>]
mov dword ptr ds:[405E98],eax
xor eax,eax
jmp mdidemo.401CE5
cmp dword ptr ss:[ebp+10],1
je mdidemo.401A7D
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-48],eax
mov eax,dword ptr ss:[ebp+14]
mov ecx,dword ptr ss:[ebp-48]
mov word ptr ds:[ecx],ax
mov eax,dword ptr ss:[ebp+14]
shr eax,10
and eax,FFFF
mov ecx,dword ptr ss:[ebp-48]
mov word ptr ds:[ecx+2],ax
jmp mdidemo.401CCA
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-48],eax
call mdidemo.401CF0
mov ecx,dword ptr ss:[ebp-48]
movsx ecx,word ptr ds:[ecx]
cdq 
idiv ecx
mov dword ptr ss:[ebp-64],edx
call mdidemo.401CF0
mov ecx,dword ptr ss:[ebp-48]
movsx ecx,word ptr ds:[ecx]
cdq 
idiv ecx
mov dword ptr ss:[ebp-50],edx
call mdidemo.401CF0
mov ecx,dword ptr ss:[ebp-48]
movsx ecx,word ptr ds:[ecx+2]
cdq 
idiv ecx
mov dword ptr ss:[ebp-68],edx
call mdidemo.401CF0
mov ecx,dword ptr ss:[ebp-48]
movsx ecx,word ptr ds:[ecx+2]
cdq 
idiv ecx
mov dword ptr ss:[ebp-44],edx
call mdidemo.401CF0
and eax,FF
mov word ptr ss:[ebp-58],ax
call mdidemo.401CF0
and eax,FF
mov word ptr ss:[ebp-4C],ax
call mdidemo.401CF0
and eax,FF
mov word ptr ss:[ebp-60],ax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetDC>]
mov dword ptr ss:[ebp-54],eax
xor eax,eax
mov al,byte ptr ss:[ebp-4C]
shl eax,8
xor ecx,ecx
mov cl,byte ptr ss:[ebp-58]
or eax,ecx
xor ecx,ecx
mov cl,byte ptr ss:[ebp-60]
shl ecx,10
or eax,ecx
push eax
call dword ptr ds:[<&CreateSolidBrush>]
mov dword ptr ss:[ebp-5C],eax
mov eax,dword ptr ss:[ebp-5C]
push eax
mov eax,dword ptr ss:[ebp-54]
push eax
call dword ptr ds:[<&SelectObject>]
mov eax,dword ptr ss:[ebp-68]
mov ecx,dword ptr ss:[ebp-44]
cmp eax,ecx
jg mdidemo.401B4F
mov eax,ecx
push eax
mov eax,dword ptr ss:[ebp-50]
mov ecx,dword ptr ss:[ebp-64]
cmp eax,ecx
jg mdidemo.401B60
mov eax,ecx
push eax
mov eax,dword ptr ss:[ebp-68]
mov ecx,dword ptr ss:[ebp-44]
cmp eax,ecx
jl mdidemo.401B71
mov eax,ecx
push eax
mov eax,dword ptr ss:[ebp-50]
mov ecx,dword ptr ss:[ebp-64]
cmp eax,ecx
jl mdidemo.401B82
mov eax,ecx
push eax
mov eax,dword ptr ss:[ebp-54]
push eax
call dword ptr ds:[<&Rectangle>]
mov eax,dword ptr ss:[ebp-54]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&ReleaseDC>]
mov eax,dword ptr ss:[ebp-5C]
push eax
call dword ptr ds:[<&DeleteObject>]
xor eax,eax
jmp mdidemo.401CE5
push 1
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&InvalidateRect>]
lea eax,dword ptr ss:[ebp-40]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&BeginPaint>]
mov dword ptr ss:[ebp-54],eax
lea eax,dword ptr ss:[ebp-40]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&EndPaint>]
xor eax,eax
jmp mdidemo.401CE5
mov eax,dword ptr ss:[ebp+8]
cmp dword ptr ss:[ebp+14],eax
jne mdidemo.401C0E
mov eax,dword ptr ds:[405EA8]
push eax
mov eax,dword ptr ds:[405E94]
push eax
push 230
mov eax,dword ptr ds:[405E9C]
push eax
call dword ptr ds:[<&SendMessageA>]
jmp mdidemo.401C2B
mov eax,dword ptr ds:[405EB0]
push eax
mov eax,dword ptr ds:[405EAC]
push eax
push 230
mov eax,dword ptr ds:[405E9C]
push eax
call dword ptr ds:[<&SendMessageA>]
mov eax,dword ptr ds:[405E98]
push eax
call dword ptr ds:[<&DrawMenuBar>]
xor eax,eax
jmp mdidemo.401CE5
push 0
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&GetWindowLongA>]
mov dword ptr ss:[ebp-48],eax
mov eax,dword ptr ss:[ebp-48]
push eax
push 0
call dword ptr ds:[<&GetProcessHeap>]
push eax
call dword ptr ds:[<&HeapFree>]
push 1
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&KillTimer>]
xor eax,eax
jmp mdidemo.401CE5
jmp mdidemo.401CCA
cmp dword ptr ss:[ebp-6C],F
ja mdidemo.401CAB
je mdidemo.401BAC
cmp dword ptr ss:[ebp-6C],1
je mdidemo.4019EB
cmp dword ptr ss:[ebp-6C],2
je mdidemo.401C3E
cmp dword ptr ss:[ebp-6C],5
je mdidemo.401A49
jmp mdidemo.401CCA
cmp dword ptr ss:[ebp-6C],113
je mdidemo.401A82
cmp dword ptr ss:[ebp-6C],222
je mdidemo.401BE0
jmp mdidemo.401CCA
mov eax,dword ptr ss:[ebp+14]
push eax
mov eax,dword ptr ss:[ebp+10]
push eax
mov eax,dword ptr ss:[ebp+C]
push eax
mov eax,dword ptr ss:[ebp+8]
push eax
call dword ptr ds:[<&DefMDIChildProcA>]
jmp mdidemo.401CE5
pop edi
pop esi
pop ebx
leave 
ret 10