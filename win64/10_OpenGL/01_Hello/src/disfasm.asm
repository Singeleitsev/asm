sub     rsp,8
sub     rsp,20
mov     rcx,0
call    qword ptr ds:[<&GetModuleHandleA>]
add     rsp,20
mov     qword ptr ds:[402038],rax
sub     rsp,20
mov     rcx,0
mov     rdx,7F00
call    qword ptr ds:[<&LoadIconA>]
add     rsp,20
mov     qword ptr ds:[402040],rax
sub     rsp,20
mov     rcx,0
mov     rdx,7F00
call    qword ptr ds:[<&LoadCursorA>]
add     rsp,20
mov     qword ptr ds:[402048],rax
sub     rsp,20
mov     rcx,opengl.402020
call    qword ptr ds:[<&RegisterClassA>]
add     rsp,20
sub     rsp,60
mov     rcx,0
mov     rdx,opengl.40200F
mov     r8,opengl.402000
mov     r9,16CF0000
mov     qword ptr ss:[rsp+20],10
mov     qword ptr ss:[rsp+28],10
mov     qword ptr ss:[rsp+30],1B0
mov     qword ptr ss:[rsp+38],1B0
mov     qword ptr ss:[rsp+40],0
mov     qword ptr ss:[rsp+48],0
mov     rax,qword ptr ds:[402038]
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+58],0
call    qword ptr ds:[<&CreateWindowExA>]
add     rsp,60
sub     rsp,20
lea     rcx,qword ptr ds:[402078]
mov     rdx,0
mov     r8,0
mov     r9,0
call    qword ptr ds:[<&GetMessageA>]
add     rsp,20
cmp     eax,1
jb      opengl.40114D
jne     opengl.4010F0
sub     rsp,20
lea     rcx,qword ptr ds:[402078]
call    qword ptr ds:[<&TranslateMessage>]
add     rsp,20
sub     rsp,20
lea     rcx,qword ptr ds:[402078]
call    qword ptr ds:[<&DispatchMessageA>]
add     rsp,20
jmp     opengl.4010F0
sub     rsp,20
mov     rcx,qword ptr ds:[402088]
call    qword ptr ds:[<&RtlExitUserProcess>]
add     rsp,20
push    rbp
mov     rbp,rsp
sub     rsp,8
push    rbx
push    rsi
push    rdi
mov     qword ptr ss:[rbp+10],rcx
sub     rsp,20
cmp     edx,1
je      opengl.4011AC
cmp     edx,5
je      opengl.4012AA
cmp     edx,F
je      opengl.4012E4
cmp     edx,100
je      opengl.401499
cmp     edx,2
je      opengl.4014A3
call    qword ptr ds:[<&NtdllDefWindowProc_A>]
jmp     opengl.4014E4
call    qword ptr ds:[<&GetDC>]
mov     qword ptr ds:[402068],rax
lea     rdi,qword ptr ds:[4020B8]
mov     rcx,5
xor     eax,eax
rep stosq qword ptr ds:[rdi],rax
mov     word ptr ds:[4020B8],28
mov     word ptr ds:[4020BA],1
mov     dword ptr ds:[4020BC],25
mov     byte ptr ds:[4020D2],0
mov     byte ptr ds:[4020C0],0
mov     byte ptr ds:[4020C1],10
mov     byte ptr ds:[4020CF],10
mov     byte ptr ds:[4020CA],0
mov     byte ptr ds:[4020D0],0
mov     rcx,qword ptr ds:[402068]
lea     rdx,qword ptr ds:[4020B8]
call    qword ptr ds:[<&ChoosePixelFormat>]
mov     rcx,qword ptr ds:[402068]
mov     edx,eax
lea     r8,qword ptr ds:[4020B8]
call    qword ptr ds:[<&SetPixelFormat>]
mov     rcx,qword ptr ds:[402068]
call    qword ptr ds:[<&wglCreateContext>]
mov     qword ptr ds:[402070],rax
mov     rcx,qword ptr ds:[402068]
mov     rdx,qword ptr ds:[402070]
call    qword ptr ds:[<&wglMakeCurrent>]
mov     rcx,qword ptr ss:[rbp+10]
lea     rdx,qword ptr ds:[4020A8]
call    qword ptr ds:[<&GetClientRect>]
mov     rcx,0
mov     rdx,0
mov     r8d,dword ptr ds:[4020B0]
mov     r9d,dword ptr ds:[4020B4]
call    qword ptr ds:[<&glViewport>]
call    qword ptr ds:[<&GetTickCount>]
mov     dword ptr ds:[4020E0],eax
xor     eax,eax
jmp     opengl.4014E4
mov     rcx,qword ptr ss:[rbp+10]
lea     rdx,qword ptr ds:[4020A8]
call    qword ptr ds:[<&GetClientRect>]
mov     rcx,0
mov     rdx,0
mov     r8d,dword ptr ds:[4020B0]
mov     r9d,dword ptr ds:[4020B4]
call    qword ptr ds:[<&glViewport>]
xor     eax,eax
jmp     opengl.4014E4
call    qword ptr ds:[<&GetTickCount>]
sub     eax,dword ptr ds:[4020E0]
cmp     eax,A
jb      opengl.401324
add     dword ptr ds:[4020E0],eax
movd    xmm0,dword ptr ds:[40201C]
mov     eax,0
movd    xmm1,eax
mov     eax,0
movd    xmm2,eax
mov     eax,3F800000
movd    xmm3,eax
call    qword ptr ds:[<&glRotatef>]
mov     rcx,4000
call    qword ptr ds:[<&glClear>]
mov     rcx,7
call    qword ptr ds:[<&glBegin>]
mov     eax,3F800000
movd    xmm0,eax
mov     eax,3DCCCCCD
movd    xmm1,eax
mov     eax,3DCCCCCD
movd    xmm2,eax
call    qword ptr ds:[<&glColor3f>]
movabs  rax,BFE3333333333333
movq    xmm0,rax
movabs  rax,BFE3333333333333
movq    xmm1,rax
mov     rax,0
movq    xmm2,rax
call    qword ptr ds:[<&glVertex3d>]
mov     eax,3DCCCCCD
movd    xmm0,eax
mov     eax,3DCCCCCD
movd    xmm1,eax
mov     eax,3DCCCCCD
movd    xmm2,eax
call    qword ptr ds:[<&glColor3f>]
movabs  rax,3FE3333333333333
movq    xmm0,rax
movabs  rax,BFE3333333333333
movq    xmm1,rax
mov     rax,0
movq    xmm2,rax
call    qword ptr ds:[<&glVertex3d>]
mov     eax,3DCCCCCD
movd    xmm0,eax
mov     eax,3DCCCCCD
movd    xmm1,eax
mov     eax,3F800000
movd    xmm2,eax
call    qword ptr ds:[<&glColor3f>]
movabs  rax,3FE3333333333333
movq    xmm0,rax
movabs  rax,3FE3333333333333
movq    xmm1,rax
mov     rax,0
movq    xmm2,rax
call    qword ptr ds:[<&glVertex3d>]
mov     eax,3F800000
movd    xmm0,eax
mov     eax,3DCCCCCD
movd    xmm1,eax
mov     eax,3F800000
movd    xmm2,eax
call    qword ptr ds:[<&glColor3f>]
movabs  rax,BFE3333333333333
movq    xmm0,rax
movabs  rax,3FE3333333333333
movq    xmm1,rax
mov     rax,0
movq    xmm2,rax
call    qword ptr ds:[<&glVertex3d>]
call    qword ptr ds:[<&glEnd>]
mov     rcx,qword ptr ds:[402068]
call    qword ptr ds:[<&SwapBuffers>]
xor     eax,eax
jmp     opengl.4014E4
cmp     r8d,1B
jne     opengl.4011A1
mov     rcx,0
mov     rdx,0
call    qword ptr ds:[<&wglMakeCurrent>]
mov     rcx,qword ptr ds:[402070]
call    qword ptr ds:[<&wglDeleteContext>]
mov     rcx,qword ptr ss:[rbp+10]
mov     rdx,qword ptr ds:[402068]
call    qword ptr ds:[<&ReleaseDC>]
mov     rcx,0
call    qword ptr ds:[<&PostQuitMessage>]
xor     eax,eax
add     rsp,20
pop     rdi
pop     rsi
pop     rbx
leave   
ret     