;0040.56BB Entry Point

push 0
push 0
push 0
push 0
push 0
push 0
call oglmdi2_vs7.4049B0
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
mov eax,dword ptr ds:[4120FC]
push oglmdi2_vs7.40E21C
push oglmdi2_vs7.40E218
push eax
call oglmdi2_vs7.404C43
mov ecx,dword ptr ds:[4120FC]
add esp,C
jmp oglmdi2_vs7.404630
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
mov eax,dword ptr ds:[412108]
mov ecx,C2C80000
mov dword ptr ds:[eax+4],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+8],ecx
mov edx,dword ptr ds:[412108]
mov eax,42C80000
mov dword ptr ds:[edx+C],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+28],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+2C],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+30],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+4C],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+50],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+54],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+70],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+74],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+78],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+94],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+98],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+9C],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+B8],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+BC],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+C0],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+DC],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+E0],eax
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+E4],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+100],ecx
mov edx,dword ptr ds:[412108]
mov dword ptr ds:[edx+104],eax
mov eax,dword ptr ds:[412108]
mov dword ptr ds:[eax+108],ecx
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
push esi
mov esi,dword ptr ds:[412108]
push edi
mov edi,dword ptr ds:[412104]
add edi,40
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,64
add esi,24
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,88
add esi,48
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov edi,dword ptr ds:[412104]
mov esi,dword ptr ds:[412108]
add edi,EC
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,110
add esi,48
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,134
add esi,6C
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,198
add esi,B4
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,1BC
add esi,90
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,1E0
add esi,FC
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,244
add esi,B4
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,268
add esi,FC
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,28C
add esi,D8
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,2F0
add esi,90
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov edi,dword ptr ds:[412104]
add edi,314
mov ecx,9
mov esi,dword ptr ds:[412108]
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,6C
add edi,338
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,90
add edi,39C
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,6C
add edi,3C0
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,FC
add edi,3E4
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,24
add edi,448
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,B4
add edi,46C
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,D8
add edi,490
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,24
add edi,4F4
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,D8
add edi,518
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,48
add edi,53C
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,6C
add edi,5A0
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,48
add edi,5C4
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,D8
add edi,5E8
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,64C
add esi,6C
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,670
add esi,D8
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,694
add esi,FC
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,6F8
add esi,B4
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,71C
add esi,24
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov edi,dword ptr ds:[412104]
mov esi,dword ptr ds:[412108]
add edi,740
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add edi,7A4
add esi,B4
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov edi,dword ptr ds:[412104]
mov esi,dword ptr ds:[412108]
add edi,7C8
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov esi,dword ptr ds:[412108]
mov edi,dword ptr ds:[412104]
add esi,90
add edi,7EC
mov ecx,9
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov ecx,dword ptr ds:[412104]
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,AC
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,158
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,204
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,2B0
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,35C
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,408
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,4B4
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,560
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,60C
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
add ecx,6B8
call oglmdi2_vs7.404500
mov ecx,dword ptr ds:[412104]
pop edi
add ecx,764
pop esi
jmp oglmdi2_vs7.404500
nop 
nop 
nop 
nop 
nop 
sub esp,64
push esi
push edi
push 405
call dword ptr ds:[<&glCullFace>]
mov esi,dword ptr ds:[<&glEnable>]
push B44
call esi
push 0
push 0
push 0
push 0
call dword ptr ds:[<&glClearColor>]
push 3FF00000
push 0
call dword ptr ds:[<&glClearDepth>]
push 201
call dword ptr ds:[<&glDepthFunc>]
push B71
call esi
push 1D01
call dword ptr ds:[<&glShadeModel>]
push BA1
call esi
mov edi,dword ptr ds:[<&glMaterialfv>]
lea eax,dword ptr ss:[esp+C]
push eax
push 1200
push 404
mov dword ptr ss:[esp+18],3F4CCCCD
mov dword ptr ss:[esp+1C],3F4CCCCD
mov dword ptr ss:[esp+20],3F4CCCCD
mov dword ptr ss:[esp+24],3F800000
mov dword ptr ss:[esp+28],3F4CCCCD
mov dword ptr ss:[esp+2C],3F4CCCCD
mov dword ptr ss:[esp+30],3F4CCCCD
mov dword ptr ss:[esp+34],3F800000
mov dword ptr ss:[esp+38],3F666666
mov dword ptr ss:[esp+3C],3F666666
mov dword ptr ss:[esp+40],3F666666
mov dword ptr ss:[esp+44],3F800000
mov dword ptr ss:[esp+48],0
mov dword ptr ss:[esp+4C],0
mov dword ptr ss:[esp+50],0
mov dword ptr ss:[esp+54],3F800000
mov dword ptr ss:[esp+14],42C80000
call edi
lea ecx,dword ptr ss:[esp+1C]
push ecx
push 1201
push 404
call edi
lea edx,dword ptr ss:[esp+2C]
push edx
push 1202
push 404
call edi
lea eax,dword ptr ss:[esp+3C]
push eax
push 1600
push 404
call edi
lea ecx,dword ptr ss:[esp+8]
push ecx
push 1601
push 404
call edi
mov edi,dword ptr ds:[<&glLightfv>]
lea edx,dword ptr ss:[esp+4C]
push edx
push 1200
push 4000
mov dword ptr ss:[esp+58],3E4CCCCD
mov dword ptr ss:[esp+5C],3E4CCCCD
mov dword ptr ss:[esp+60],3E4CCCCD
mov dword ptr ss:[esp+64],3F800000
call edi
mov dword ptr ss:[esp+5C],43480000
mov dword ptr ss:[esp+60],0
mov dword ptr ss:[esp+64],0
mov dword ptr ss:[esp+68],3F800000
lea eax,dword ptr ss:[esp+5C]
push eax
push 1203
push 4000
call edi
push B50
call esi
push 4000
call esi
call oglmdi2_vs7.401020
push DE1
call esi
pop edi
pop esi
add esp,64
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
mov eax,dword ptr ss:[esp+8]
test eax,eax
jne oglmdi2_vs7.401821
mov eax,1
mov dword ptr ss:[esp+8],eax
push eax
mov eax,dword ptr ss:[esp+8]
push eax
push 0
push 0
call dword ptr ds:[<&glViewport>]
push 1701
call dword ptr ds:[<&glMatrixMode>]
call dword ptr ds:[<&glLoadIdentity>]
fild dword ptr ss:[esp+4]
push 408F4000
push 0
fidiv dword ptr ss:[esp+10]
push 3FF00000
push 0
sub esp,8
fstp qword ptr ss:[esp]
push 40468000
push 0
call <oglmdi2_vs7.gluPerspective>
ret 
nop 
nop 
nop 
nop 
nop 
push ebp
mov ebp,esp
and esp,FFFFFFF8
sub esp,8
push esi
mov esi,dword ptr ss:[ebp+C]
test esi,esi
push edi
jne oglmdi2_vs7.40188A
mov esi,1
mov dword ptr ss:[ebp+C],esi
mov edi,dword ptr ss:[ebp+8]
push esi
push edi
push 0
push 0
call dword ptr ds:[<&glViewport>]
push 1701
call dword ptr ds:[<&glMatrixMode>]
call dword ptr ds:[<&glLoadIdentity>]
fild dword ptr ss:[ebp+C]
push 409F4000
push 0
fmul qword ptr ds:[40E228]
push C09F4000
push 0
sub esp,20
fstp qword ptr ss:[esp+18]
neg esi
mov dword ptr ss:[esp+3C],esi
fild dword ptr ss:[esp+3C]
neg edi
mov dword ptr ss:[esp+3C],edi
fmul qword ptr ds:[40E228]
fstp qword ptr ss:[esp+10]
fild dword ptr ss:[ebp+8]
fmul qword ptr ds:[40E228]
fstp qword ptr ss:[esp+8]
fild dword ptr ss:[esp+3C]
fmul qword ptr ds:[40E228]
fstp qword ptr ss:[esp]
call dword ptr ds:[<&glOrtho>]
pop edi
pop esi
mov esp,ebp
pop ebp
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
push 4100
call dword ptr ds:[<&glClear>]
push 1700
call dword ptr ds:[<&glMatrixMode>]
call dword ptr ds:[<&glLoadIdentity>]
mov al,byte ptr ds:[4120F4]
test al,al
je oglmdi2_vs7.401965
fild dword ptr ds:[412060]
fmul qword ptr ds:[40E228]
fadd dword ptr ds:[4120A8]
fstp dword ptr ds:[4120A8]
fild dword ptr ds:[411F40]
fmul qword ptr ds:[40E228]
fadd dword ptr ds:[412094]
fstp dword ptr ds:[412094]
push ebx
push esi
push edi
push C3FA0000
push 0
push 0
call dword ptr ds:[<&glTranslatef>]
mov eax,dword ptr ds:[4120A8]
mov esi,dword ptr ds:[<&glRotatef>]
push 0
push 0
push 3F800000
push eax
call esi
mov ecx,dword ptr ds:[412094]
push 0
push 3F800000
push 0
push ecx
call esi
mov edx,dword ptr ds:[4120FC]
mov eax,dword ptr ds:[edx+24]
push eax
push DE1
call dword ptr ds:[<&glBindTexture>]
call dword ptr ds:[<&glPushMatrix>]
push 4
call dword ptr ds:[<&glBegin>]
mov ecx,dword ptr ds:[412104]
mov ebx,dword ptr ds:[<&glNormal3fv>]
add ecx,50
push ecx
call ebx
mov esi,dword ptr ds:[<&glTexCoord2f>]
push 0
push 0
call esi
mov edx,dword ptr ds:[412104]
mov edi,dword ptr ds:[<&glVertex3fv>]
add edx,44
push edx
call edi
push 0
push 3F800000
call esi
mov eax,dword ptr ds:[412104]
add eax,68
push eax
call edi
push 3F800000
push 3F800000
call esi
mov ecx,dword ptr ds:[412104]
add ecx,8C
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,FC
push edx
call ebx
push 0
push 0
call esi
mov eax,dword ptr ds:[412104]
add eax,F0
push eax
call edi
push 3F800000
push 3F800000
call esi
mov ecx,dword ptr ds:[412104]
add ecx,114
push ecx
call edi
push 3F800000
push 0
call esi
mov edx,dword ptr ds:[412104]
add edx,138
push edx
call edi
mov eax,dword ptr ds:[412104]
add eax,1A8
push eax
call ebx
push 0
push 0
call esi
mov ecx,dword ptr ds:[412104]
add ecx,19C
push ecx
call edi
push 0
push 3F800000
call esi
mov edx,dword ptr ds:[412104]
add edx,1C0
push edx
call edi
push 3F800000
push 3F800000
call esi
mov eax,dword ptr ds:[412104]
add eax,1E4
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,254
push ecx
call ebx
push 0
push 0
call esi
mov edx,dword ptr ds:[412104]
add edx,248
push edx
call edi
push 3F800000
push 3F800000
call esi
mov eax,dword ptr ds:[412104]
add eax,26C
push eax
call edi
push 3F800000
push 0
call esi
mov ecx,dword ptr ds:[412104]
add ecx,290
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,300
push edx
call ebx
push 0
push 0
call esi
mov eax,dword ptr ds:[412104]
add eax,2F4
push eax
call edi
push 0
push 3F800000
call esi
mov ecx,dword ptr ds:[412104]
add ecx,318
push ecx
call edi
push 3F800000
push 3F800000
call esi
mov edx,dword ptr ds:[412104]
add edx,33C
push edx
call edi
mov eax,dword ptr ds:[412104]
add eax,3AC
push eax
call ebx
push 0
push 0
call esi
mov ecx,dword ptr ds:[412104]
add ecx,3A0
push ecx
call edi
push 3F800000
push 3F800000
call esi
mov edx,dword ptr ds:[412104]
add edx,3C4
push edx
call edi
push 3F800000
push 0
call esi
mov eax,dword ptr ds:[412104]
add eax,3E8
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,458
push ecx
call ebx
push 0
push 0
call esi
mov edx,dword ptr ds:[412104]
add edx,44C
push edx
call edi
push 0
push 3F800000
call esi
mov eax,dword ptr ds:[412104]
add eax,470
push eax
call edi
push 3F800000
push 3F800000
call esi
mov ecx,dword ptr ds:[412104]
add ecx,494
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,504
push edx
call ebx
push 0
push 0
call esi
mov eax,dword ptr ds:[412104]
add eax,4F8
push eax
call edi
push 3F800000
push 3F800000
call esi
mov ecx,dword ptr ds:[412104]
add ecx,51C
push ecx
call edi
push 3F800000
push 0
call esi
mov edx,dword ptr ds:[412104]
add edx,540
push edx
call edi
mov eax,dword ptr ds:[412104]
add eax,5B0
push eax
call ebx
push 0
push 0
call esi
mov ecx,dword ptr ds:[412104]
add ecx,5A4
push ecx
call edi
push 0
push 3F800000
call esi
mov edx,dword ptr ds:[412104]
add edx,5C8
push edx
call edi
push 3F800000
push 3F800000
call esi
mov eax,dword ptr ds:[412104]
add eax,5EC
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,65C
push ecx
call ebx
push 0
push 0
call esi
mov edx,dword ptr ds:[412104]
add edx,650
push edx
call edi
push 3F800000
push 3F800000
call esi
mov eax,dword ptr ds:[412104]
add eax,674
push eax
call edi
push 3F800000
push 0
call esi
mov ecx,dword ptr ds:[412104]
add ecx,698
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,708
push edx
call ebx
push 0
push 0
call esi
mov eax,dword ptr ds:[412104]
add eax,6FC
push eax
call edi
push 0
push 3F800000
call esi
mov ecx,dword ptr ds:[412104]
add ecx,720
push ecx
call edi
push 3F800000
push 3F800000
call esi
mov edx,dword ptr ds:[412104]
add edx,744
push edx
call edi
mov eax,dword ptr ds:[412104]
add eax,7B4
push eax
call ebx
push 0
push 0
call esi
mov ecx,dword ptr ds:[412104]
add ecx,7A8
push ecx
call edi
push 3F800000
push 3F800000
call esi
mov edx,dword ptr ds:[412104]
add edx,7CC
push edx
call edi
push 3F800000
push 0
call esi
mov eax,dword ptr ds:[412104]
add eax,7F0
push eax
call edi
call dword ptr ds:[<&glEnd>]
pop edi
pop esi
pop ebx
jmp dword ptr ds:[<&glPopMatrix>]
sub esp,30
push ebx
push ebp
push esi
push edi
push 4100
call dword ptr ds:[<&glClear>]
push 1700
call dword ptr ds:[<&glMatrixMode>]
call dword ptr ds:[<&glLoadIdentity>]
mov ecx,dword ptr ss:[esp+44]
lea eax,dword ptr ss:[esp+30]
push eax
push ecx
call dword ptr ds:[<&GetClientRect>]
mov ebx,dword ptr ds:[<&glDisable>]
push DE1
call ebx
push B50
call ebx
push 3F800000
push 0
push 0
push 3F800000
call dword ptr ds:[<&glColor4f>]
mov ebp,dword ptr ds:[<&glPushMatrix>]
call ebp
push 1
call dword ptr ds:[<&glBegin>]
mov edx,dword ptr ds:[412104]
mov edi,dword ptr ds:[<&glNormal3fv>]
add edx,50
push edx
call edi
mov eax,dword ptr ds:[412104]
mov esi,dword ptr ds:[<&glVertex3fv>]
add eax,44
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,68
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,68
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,8C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,8C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,44
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,F0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,114
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,114
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,138
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,138
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,F0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,1A8
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,19C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,1C0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,1C0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,1E4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,1E4
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,19C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,248
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,26C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,26C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,290
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,290
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,248
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,300
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,2F4
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,318
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,318
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,33C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,33C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,2F4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,3A0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,3C4
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,3C4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,3E8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,3E8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,3A0
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,458
push edx
call edi
mov eax,dword ptr ds:[412104]
add eax,44C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,470
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,470
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,494
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,494
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,44C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,4F8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,51C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,51C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,540
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,540
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,4F8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5B0
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,5A4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,5C8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5C8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,5EC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,5EC
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5A4
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,650
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,674
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,674
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,698
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,698
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,650
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,708
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,6FC
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,720
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,720
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,744
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,744
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,6FC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,7A8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,7CC
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,7CC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,7F0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,7F0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,7A8
push ecx
call esi
call dword ptr ds:[<&glEnd>]
mov edi,dword ptr ds:[<&glPopMatrix>]
call edi
mov esi,dword ptr ds:[<&glEnable>]
push B50
call esi
push DE1
call esi
lea edx,dword ptr ss:[esp+10]
push edx
push 1200
push 404
mov dword ptr ss:[esp+1C],3F4CCCCD
mov dword ptr ss:[esp+20],3F000000
mov dword ptr ss:[esp+24],3DCCCCCD
mov dword ptr ss:[esp+28],3F800000
mov dword ptr ss:[esp+2C],3F4CCCCD
mov dword ptr ss:[esp+30],3F000000
mov dword ptr ss:[esp+34],3DCCCCCD
mov dword ptr ss:[esp+38],3F800000
call dword ptr ds:[<&glMaterialfv>]
lea eax,dword ptr ss:[esp+20]
push eax
push 1201
push 404
call dword ptr ds:[<&glMaterialfv>]
push DE1
call ebx
call ebp
mov eax,dword ptr ds:[411F50]
mov edx,dword ptr ds:[412108]
lea ecx,dword ptr ds:[eax+eax*8]
lea eax,dword ptr ds:[edx+ecx*4]
mov ecx,dword ptr ds:[eax+C]
mov edx,dword ptr ds:[eax+8]
mov eax,dword ptr ds:[eax+4]
push ecx
push edx
push eax
call dword ptr ds:[<&glTranslatef>]
mov ecx,dword ptr ds:[41210C]
push 186B4
push ecx
call <oglmdi2_vs7.gluQuadricOrientation>
mov edx,dword ptr ds:[41210C]
push 14
push 14
push 40240000
push 0
push edx
call <oglmdi2_vs7.gluSphere>
call edi
push DE1
call esi
pop edi
pop esi
pop ebp
pop ebx
add esp,30
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
sub esp,30
push ebx
push ebp
push esi
push edi
push 4100
call dword ptr ds:[<&glClear>]
push 1700
call dword ptr ds:[<&glMatrixMode>]
call dword ptr ds:[<&glLoadIdentity>]
push 0
push 0
push 3F800000
push 42B40000
call dword ptr ds:[<&glRotatef>]
mov ecx,dword ptr ss:[esp+44]
lea eax,dword ptr ss:[esp+30]
push eax
push ecx
call dword ptr ds:[<&GetClientRect>]
mov ebx,dword ptr ds:[<&glDisable>]
push DE1
call ebx
push B50
call ebx
push 3F800000
push 0
push 3F800000
push 0
call dword ptr ds:[<&glColor4f>]
mov ebp,dword ptr ds:[<&glPushMatrix>]
call ebp
push 1
call dword ptr ds:[<&glBegin>]
mov edx,dword ptr ds:[412104]
mov edi,dword ptr ds:[<&glNormal3fv>]
add edx,50
push edx
call edi
mov eax,dword ptr ds:[412104]
mov esi,dword ptr ds:[<&glVertex3fv>]
add eax,44
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,68
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,68
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,8C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,8C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,44
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,F0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,114
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,114
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,138
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,138
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,F0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,1A8
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,19C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,1C0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,1C0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,1E4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,1E4
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,19C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,248
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,26C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,26C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,290
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,290
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,248
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,300
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,2F4
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,318
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,318
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,33C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,33C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,2F4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,3A0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,3C4
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,3C4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,3E8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,3E8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,3A0
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,458
push edx
call edi
mov eax,dword ptr ds:[412104]
add eax,44C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,470
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,470
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,494
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,494
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,44C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,4F8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,51C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,51C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,540
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,540
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,4F8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5B0
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,5A4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,5C8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5C8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,5EC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,5EC
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5A4
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,650
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,674
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,674
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,698
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,698
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,650
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,708
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,6FC
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,720
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,720
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,744
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,744
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,6FC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,7A8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,7CC
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,7CC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,7F0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,7F0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,7A8
push ecx
call esi
call dword ptr ds:[<&glEnd>]
mov edi,dword ptr ds:[<&glPopMatrix>]
call edi
mov esi,dword ptr ds:[<&glEnable>]
push B50
call esi
push DE1
call esi
lea edx,dword ptr ss:[esp+10]
push edx
push 1200
push 404
mov dword ptr ss:[esp+1C],3F4CCCCD
mov dword ptr ss:[esp+20],3F000000
mov dword ptr ss:[esp+24],3DCCCCCD
mov dword ptr ss:[esp+28],3F800000
mov dword ptr ss:[esp+2C],3F4CCCCD
mov dword ptr ss:[esp+30],3F000000
mov dword ptr ss:[esp+34],3DCCCCCD
mov dword ptr ss:[esp+38],3F800000
call dword ptr ds:[<&glMaterialfv>]
lea eax,dword ptr ss:[esp+20]
push eax
push 1201
push 404
call dword ptr ds:[<&glMaterialfv>]
push DE1
call ebx
call ebp
mov eax,dword ptr ds:[411F50]
mov edx,dword ptr ds:[412108]
lea ecx,dword ptr ds:[eax+eax*8]
lea eax,dword ptr ds:[edx+ecx*4]
mov ecx,dword ptr ds:[eax+C]
mov edx,dword ptr ds:[eax+8]
mov eax,dword ptr ds:[eax+4]
push ecx
push edx
push eax
call dword ptr ds:[<&glTranslatef>]
mov ecx,dword ptr ds:[41210C]
push 186B4
push ecx
call <oglmdi2_vs7.gluQuadricOrientation>
mov edx,dword ptr ds:[41210C]
push 14
push 14
push 40240000
push 0
push edx
call <oglmdi2_vs7.gluSphere>
call edi
push DE1
call esi
pop edi
pop esi
pop ebp
pop ebx
add esp,30
ret 
nop 
nop 
nop 
nop 
sub esp,30
push ebx
push ebp
push esi
push edi
push 4100
call dword ptr ds:[<&glClear>]
push 1700
call dword ptr ds:[<&glMatrixMode>]
call dword ptr ds:[<&glLoadIdentity>]
push 0
push 3F800000
push 0
push 42B40000
call dword ptr ds:[<&glRotatef>]
mov ecx,dword ptr ss:[esp+44]
lea eax,dword ptr ss:[esp+30]
push eax
push ecx
call dword ptr ds:[<&GetClientRect>]
mov ebx,dword ptr ds:[<&glDisable>]
push DE1
call ebx
push B50
call ebx
push 3F800000
push 3F800000
push 0
push 0
call dword ptr ds:[<&glColor4f>]
mov ebp,dword ptr ds:[<&glPushMatrix>]
call ebp
push 1
call dword ptr ds:[<&glBegin>]
mov edx,dword ptr ds:[412104]
mov edi,dword ptr ds:[<&glNormal3fv>]
add edx,50
push edx
call edi
mov eax,dword ptr ds:[412104]
mov esi,dword ptr ds:[<&glVertex3fv>]
add eax,44
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,68
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,68
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,8C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,8C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,44
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,F0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,114
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,114
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,138
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,138
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,F0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,1A8
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,19C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,1C0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,1C0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,1E4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,1E4
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,19C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,248
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,26C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,26C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,290
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,290
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,248
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,300
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,2F4
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,318
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,318
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,33C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,33C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,2F4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,3A0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,3C4
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,3C4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,3E8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,3E8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,3A0
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,458
push edx
call edi
mov eax,dword ptr ds:[412104]
add eax,44C
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,470
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,470
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,494
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,494
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,44C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,4F8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,51C
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,51C
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,540
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,540
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,4F8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5B0
push eax
call edi
mov ecx,dword ptr ds:[412104]
add ecx,5A4
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,5C8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5C8
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,5EC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,5EC
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,5A4
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,650
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,674
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,674
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,698
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,698
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,650
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,708
push ecx
call edi
mov edx,dword ptr ds:[412104]
add edx,6FC
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,720
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,720
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,744
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,744
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,6FC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,7A8
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,7CC
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,7CC
push ecx
call esi
mov edx,dword ptr ds:[412104]
add edx,7F0
push edx
call esi
mov eax,dword ptr ds:[412104]
add eax,7F0
push eax
call esi
mov ecx,dword ptr ds:[412104]
add ecx,7A8
push ecx
call esi
call dword ptr ds:[<&glEnd>]
mov edi,dword ptr ds:[<&glPopMatrix>]
call edi
mov esi,dword ptr ds:[<&glEnable>]
push B50
call esi
push DE1
call esi
lea edx,dword ptr ss:[esp+10]
push edx
push 1200
push 404
mov dword ptr ss:[esp+1C],3F4CCCCD
mov dword ptr ss:[esp+20],3F000000
mov dword ptr ss:[esp+24],3DCCCCCD
mov dword ptr ss:[esp+28],3F800000
mov dword ptr ss:[esp+2C],3F4CCCCD
mov dword ptr ss:[esp+30],3F000000
mov dword ptr ss:[esp+34],3DCCCCCD
mov dword ptr ss:[esp+38],3F800000
call dword ptr ds:[<&glMaterialfv>]
lea eax,dword ptr ss:[esp+20]
push eax
push 1201
push 404
call dword ptr ds:[<&glMaterialfv>]
push DE1
call ebx
call ebp
mov eax,dword ptr ds:[411F50]
mov edx,dword ptr ds:[412108]
lea ecx,dword ptr ds:[eax+eax*8]
lea eax,dword ptr ds:[edx+ecx*4]
mov ecx,dword ptr ds:[eax+C]
mov edx,dword ptr ds:[eax+8]
mov eax,dword ptr ds:[eax+4]
push ecx
push edx
push eax
call dword ptr ds:[<&glTranslatef>]
mov ecx,dword ptr ds:[41210C]
push 186B4
push ecx
call <oglmdi2_vs7.gluQuadricOrientation>
mov edx,dword ptr ds:[41210C]
push 14
push 14
push 40240000
push 0
push edx
call <oglmdi2_vs7.gluSphere>
call edi
push DE1
call esi
pop edi
pop esi
pop ebp
pop ebx
add esp,30
ret 
nop 
nop 
nop 
nop 
sub esp,64
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[esp+64]
push ebx
push ebp
mov dword ptr ss:[esp+68],eax
mov eax,dword ptr ss:[esp+74]
mov ebx,10
cmp eax,ebx
push esi
push edi
ja oglmdi2_vs7.4030A1
je oglmdi2_vs7.402FD4
mov ecx,eax
dec ecx
je oglmdi2_vs7.402F70
dec ecx
jne oglmdi2_vs7.4030A8
push 0
call dword ptr ds:[<&PostQuitMessage>]
jmp oglmdi2_vs7.403626
mov ecx,dword ptr ds:[412078]
mov edx,dword ptr ss:[esp+78]
lea eax,dword ptr ss:[esp+10]
push eax
push ecx
push 1387
push edx
push 80000000
push 80000000
push 80000000
push 80000000
push 46000000
push 0
push oglmdi2_vs7.40E284
push 200
mov dword ptr ss:[esp+40],0
mov dword ptr ss:[esp+44],C350
call dword ptr ds:[<&CreateWindowExA>]
push 5
push eax
mov dword ptr ds:[412058],eax
call dword ptr ds:[<&ShowWindow>]
jmp oglmdi2_vs7.403626
mov eax,dword ptr ds:[4120F8]
test eax,eax
je oglmdi2_vs7.40300D
xor esi,esi
test eax,eax
jle oglmdi2_vs7.40300D
mov ebp,dword ptr ds:[<&SendMessageA>]
xor edi,edi
jmp oglmdi2_vs7.402FF0
lea ecx,dword ptr ds:[ecx]
mov eax,dword ptr ds:[412100]
mov ecx,dword ptr ds:[edi+eax+C]
push 0
push 0
push ebx
push ecx
call ebp
mov eax,dword ptr ds:[4120F8]
inc esi
add edi,ebx
cmp esi,eax
jl oglmdi2_vs7.402FF0
mov edx,dword ptr ds:[412100]
push edx
call oglmdi2_vs7.404B30
mov eax,dword ptr ds:[4120FC]
add esp,4
test eax,eax
je oglmdi2_vs7.403042
mov ecx,dword ptr ds:[eax-4]
lea esi,dword ptr ds:[eax-4]
push oglmdi2_vs7.404620
push ecx
push 40
push eax
call oglmdi2_vs7.404B93
push esi
call oglmdi2_vs7.404B30
add esp,4
mov eax,dword ptr ds:[412108]
test eax,eax
je oglmdi2_vs7.403068
mov edx,dword ptr ds:[eax-4]
lea esi,dword ptr ds:[eax-4]
push oglmdi2_vs7.404620
push edx
push 24
push eax
call oglmdi2_vs7.404B93
push esi
call oglmdi2_vs7.404B30
add esp,4
mov eax,dword ptr ds:[412104]
test eax,eax
je oglmdi2_vs7.403091
mov ecx,dword ptr ds:[eax-4]
lea esi,dword ptr ds:[eax-4]
push oglmdi2_vs7.4044A0
push ecx
push AC
push eax
call oglmdi2_vs7.404B93
push esi
call oglmdi2_vs7.404B30
add esp,4
mov edx,dword ptr ss:[esp+78]
push edx
call dword ptr ds:[<&DestroyWindow>]
jmp oglmdi2_vs7.403626
cmp eax,111
je oglmdi2_vs7.4030CF
mov ecx,dword ptr ss:[esp+84]
mov edx,dword ptr ss:[esp+80]
push ecx
mov ecx,dword ptr ss:[esp+7C]
push edx
push eax
mov eax,dword ptr ds:[412058]
push eax
push ecx
call dword ptr ds:[<&DefFrameProcA>]
jmp oglmdi2_vs7.403628
mov esi,dword ptr ss:[esp+80]
movzx eax,si
add eax,FFFFDC95
cmp eax,F
ja oglmdi2_vs7.4035D0
jmp dword ptr ds:[eax*4+403640]
mov edx,dword ptr ss:[esp+78]
push 0
push 0
push ebx
push edx
call dword ptr ds:[<&PostMessageA>]
jmp oglmdi2_vs7.403626
mov eax,dword ptr ds:[4120F8]
cmp eax,dword ptr ds:[41109C]
jge oglmdi2_vs7.403626
mov cx,word ptr ds:[40E280]
mov edx,eax
mov word ptr ss:[esp+78],cx
xor eax,eax
inc edx
mov ecx,C
lea edi,dword ptr ss:[esp+40]
rep stosd dword ptr es:[edi],eax
mov ecx,dword ptr ds:[412078]
lea eax,dword ptr ss:[esp+40]
push eax
push ecx
push 0
mov dword ptr ds:[4120F8],edx
mov dl,byte ptr ds:[40E282]
mov byte ptr ss:[esp+86],dl
mov edx,dword ptr ds:[412058]
push edx
push 80000000
push 80000000
push 80000000
push 80000000
push 50CF0000
lea eax,dword ptr ss:[esp+9C]
push eax
push oglmdi2_vs7.411070
push 40
call dword ptr ds:[<&CreateWindowExA>]
mov esi,eax
test esi,esi
jne oglmdi2_vs7.40319F
push 30
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E25C
push eax
call dword ptr ds:[<&MessageBoxA>]
mov ecx,dword ptr ds:[4120F8]
mov edx,dword ptr ds:[412100]
shl ecx,4
mov ebp,1
mov dword ptr ds:[ecx+edx-10],ebp
mov eax,dword ptr ds:[4120F8]
mov ecx,dword ptr ds:[412100]
shl eax,4
push esi
mov dword ptr ds:[eax+ecx-4],esi
call dword ptr ds:[<&GetDC>]
mov edx,dword ptr ds:[4120F8]
mov ecx,dword ptr ds:[412100]
shl edx,4
mov dword ptr ds:[edx+ecx-C],eax
mov ecx,A
xor eax,eax
lea edi,dword ptr ss:[esp+18]
rep stosd dword ptr es:[edi],eax
mov word ptr ss:[esp+1A],bp
mov eax,dword ptr ds:[4120F8]
mov ecx,dword ptr ds:[412100]
lea edx,dword ptr ss:[esp+18]
push edx
shl eax,4
mov word ptr ss:[esp+1C],28
mov dword ptr ss:[esp+20],25
mov byte ptr ss:[esp+24],0
mov byte ptr ss:[esp+25],18
mov byte ptr ss:[esp+33],bl
mov byte ptr ss:[esp+36],0
mov edx,dword ptr ds:[eax+ecx-C]
push edx
call dword ptr ds:[<&ChoosePixelFormat>]
mov edx,dword ptr ds:[4120F8]
lea ecx,dword ptr ss:[esp+18]
push ecx
push eax
mov eax,dword ptr ds:[412100]
shl edx,4
mov ecx,dword ptr ds:[edx+eax-C]
push ecx
call dword ptr ds:[<&SetPixelFormat>]
mov edx,dword ptr ds:[4120F8]
mov eax,dword ptr ds:[412100]
shl edx,4
mov ecx,dword ptr ds:[edx+eax-C]
push ecx
call dword ptr ds:[<&wglCreateContext>]
mov edx,dword ptr ds:[4120F8]
mov ecx,dword ptr ds:[412100]
shl edx,4
mov dword ptr ds:[edx+ecx-8],eax
mov edx,dword ptr ds:[4120F8]
mov eax,dword ptr ds:[412100]
shl edx,4
mov ecx,dword ptr ds:[eax+edx-8]
add eax,edx
mov edx,dword ptr ds:[eax-C]
push ecx
push edx
call dword ptr ds:[<&wglMakeCurrent>]
call oglmdi2_vs7.401640
jmp oglmdi2_vs7.403626
mov eax,dword ptr ds:[4120F8]
cmp eax,dword ptr ds:[41109C]
jge oglmdi2_vs7.403626
mov ecx,dword ptr ds:[40E254]
mov edx,eax
mov dword ptr ss:[esp+10],ecx
xor eax,eax
inc edx
mov ecx,C
lea edi,dword ptr ss:[esp+40]
rep stosd dword ptr es:[edi],eax
mov ecx,dword ptr ds:[412078]
lea eax,dword ptr ss:[esp+40]
push eax
push ecx
push 0
mov dword ptr ds:[4120F8],edx
mov dx,word ptr ds:[40E258]
mov word ptr ss:[esp+20],dx
mov edx,dword ptr ds:[412058]
push edx
push 80000000
push 80000000
push 80000000
push 80000000
push 50CF0000
lea eax,dword ptr ss:[esp+34]
push eax
push oglmdi2_vs7.41107C
push 40
call dword ptr ds:[<&CreateWindowExA>]
mov esi,eax
test esi,esi
jne oglmdi2_vs7.40333F
push 30
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E238
push eax
call dword ptr ds:[<&MessageBoxA>]
mov ecx,dword ptr ds:[4120F8]
mov edx,dword ptr ds:[412100]
shl ecx,4
mov dword ptr ds:[ecx+edx-10],2
jmp oglmdi2_vs7.403527
mov eax,dword ptr ds:[4120F8]
cmp eax,dword ptr ds:[41109C]
jge oglmdi2_vs7.403626
mov edx,dword ptr ds:[412078]
mov ecx,eax
inc ecx
mov dword ptr ds:[4120F8],ecx
xor eax,eax
mov ecx,C
lea edi,dword ptr ss:[esp+40]
rep stosd dword ptr es:[edi],eax
lea ecx,dword ptr ss:[esp+40]
push ecx
push edx
push eax
mov eax,dword ptr ds:[412058]
push eax
push 80000000
push 80000000
push 80000000
push 80000000
push 50CF0000
lea ecx,dword ptr ss:[esp+9C]
push ecx
push oglmdi2_vs7.41107C
push 40
mov dword ptr ss:[esp+A8],706F54
call dword ptr ds:[<&CreateWindowExA>]
mov esi,eax
test esi,esi
jne oglmdi2_vs7.4033E7
push 30
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E238
push eax
call dword ptr ds:[<&MessageBoxA>]
mov edx,dword ptr ds:[4120F8]
mov eax,dword ptr ds:[412100]
shl edx,4
mov dword ptr ds:[edx+eax-10],3
mov ecx,dword ptr ds:[4120F8]
mov edx,dword ptr ds:[412100]
shl ecx,4
push esi
mov dword ptr ds:[ecx+edx-4],esi
call dword ptr ds:[<&GetDC>]
mov ecx,dword ptr ds:[4120F8]
mov edx,dword ptr ds:[412100]
shl ecx,4
mov dword ptr ds:[ecx+edx-C],eax
mov edx,dword ptr ds:[412100]
xor eax,eax
mov ecx,A
lea edi,dword ptr ss:[esp+18]
rep stosd dword ptr es:[edi],eax
mov ecx,dword ptr ds:[4120F8]
mov byte ptr ss:[esp+20],al
mov byte ptr ss:[esp+32],al
lea eax,dword ptr ss:[esp+18]
push eax
shl ecx,4
mov word ptr ss:[esp+1C],28
mov word ptr ss:[esp+1E],1
mov dword ptr ss:[esp+20],25
mov byte ptr ss:[esp+25],18
mov byte ptr ss:[esp+33],bl
mov eax,dword ptr ds:[ecx+edx-C]
push eax
jmp oglmdi2_vs7.40322F
mov eax,dword ptr ds:[4120F8]
cmp eax,dword ptr ds:[41109C]
jge oglmdi2_vs7.403626
mov ecx,dword ptr ds:[40E230]
mov edx,eax
mov dword ptr ss:[esp+10],ecx
xor eax,eax
inc edx
mov ecx,C
lea edi,dword ptr ss:[esp+40]
rep stosd dword ptr es:[edi],eax
mov ecx,dword ptr ds:[412078]
lea eax,dword ptr ss:[esp+40]
push eax
push ecx
push 0
mov dword ptr ds:[4120F8],edx
mov dl,byte ptr ds:[40E234]
mov byte ptr ss:[esp+20],dl
mov edx,dword ptr ds:[412058]
push edx
push 80000000
push 80000000
push 80000000
push 80000000
push 50CF0000
lea eax,dword ptr ss:[esp+34]
push eax
push oglmdi2_vs7.41107C
push 40
call dword ptr ds:[<&CreateWindowExA>]
mov esi,eax
test esi,esi
jne oglmdi2_vs7.403510
push 30
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E238
push eax
call dword ptr ds:[<&MessageBoxA>]
mov ecx,dword ptr ds:[4120F8]
mov edx,dword ptr ds:[412100]
shl ecx,4
mov dword ptr ds:[ecx+edx-10],4
mov eax,dword ptr ds:[4120F8]
mov ecx,dword ptr ds:[412100]
shl eax,4
push esi
mov dword ptr ds:[eax+ecx-4],esi
call dword ptr ds:[<&GetDC>]
mov edx,dword ptr ds:[4120F8]
mov ecx,dword ptr ds:[412100]
shl edx,4
mov dword ptr ds:[edx+ecx-C],eax
mov ecx,A
xor eax,eax
lea edi,dword ptr ss:[esp+18]
rep stosd dword ptr es:[edi],eax
mov word ptr ss:[esp+1A],1
jmp oglmdi2_vs7.4031F5
mov eax,dword ptr ds:[412058]
push 0
push 1
push 226
push eax
call dword ptr ds:[<&PostMessageA>]
jmp oglmdi2_vs7.403626
mov ecx,dword ptr ds:[412058]
push 0
push 0
push 226
push ecx
call dword ptr ds:[<&PostMessageA>]
jmp oglmdi2_vs7.403626
mov edx,dword ptr ds:[412058]
push 0
push 0
push 227
push edx
call dword ptr ds:[<&PostMessageA>]
jmp oglmdi2_vs7.403626
mov eax,dword ptr ds:[412058]
push 0
push 0
push 228
push eax
call dword ptr ds:[<&PostMessageA>]
jmp oglmdi2_vs7.403626
cmp si,C350
jb oglmdi2_vs7.4035F9
mov ecx,dword ptr ss:[esp+84]
mov edx,dword ptr ds:[412058]
mov eax,dword ptr ss:[esp+78]
push ecx
push esi
push 111
push edx
push eax
call dword ptr ds:[<&DefFrameProcA>]
jmp oglmdi2_vs7.403626
mov ecx,dword ptr ds:[412058]
mov edi,dword ptr ds:[<&SendMessageA>]
push 0
push 0
push 229
push ecx
call edi
test eax,eax
je oglmdi2_vs7.403626
mov edx,dword ptr ss:[esp+84]
push edx
push esi
push 111
push eax
call edi
xor eax,eax
mov ecx,dword ptr ss:[esp+70]
xor ecx,dword ptr ss:[esp+74]
pop edi
pop esi
pop ebp
pop ebx
call oglmdi2_vs7.404CCC
add esp,64
ret 10
nop 
add esi,dword ptr ds:[ecx]
inc eax
add byte ptr ds:[ecx+5B004032],ch
xor eax,dword ptr ds:[eax]
jl oglmdi2_vs7.403682
inc eax
add dh,ch
xor byte ptr ds:[eax],al
sal byte ptr ds:[35D00040],1
inc eax
add al,dl
xor eax,35D00040
inc eax
add al,dl
xor eax,35D00040
inc eax
add al,dl
xor eax,35A10040
inc eax
add byte ptr ds:[ecx-79FFBFCB],bh
xor eax,356C0040
inc eax
add byte ptr ds:[ebx+50A118EC],al
adc dword ptr ds:[ecx],eax
xor eax,dword ptr ss:[esp+18]
push ebx
push ebp
mov ebp,dword ptr ss:[esp+28]
cmp ebp,200
push esi
mov dword ptr ss:[esp+20],eax
push edi
ja oglmdi2_vs7.403833
je oglmdi2_vs7.4037EC
cmp ebp,101
ja oglmdi2_vs7.4037D9
je oglmdi2_vs7.4037C9
cmp ebp,10
je oglmdi2_vs7.4036DD
cmp ebp,100
jne oglmdi2_vs7.4038EA
mov eax,dword ptr ss:[esp+34]
mov byte ptr ds:[eax+411E40],1
jmp oglmdi2_vs7.4038EA
dec dword ptr ds:[4120F8]
jne oglmdi2_vs7.403716
push 0
push 0
call dword ptr ds:[<&wglMakeCurrent>]
mov eax,dword ptr ds:[412100]
mov ecx,dword ptr ds:[eax+4]
mov edx,dword ptr ds:[eax+C]
push ecx
push edx
call dword ptr ds:[<&ReleaseDC>]
mov eax,dword ptr ds:[412100]
mov ecx,dword ptr ds:[eax+8]
push ecx
call dword ptr ds:[<&wglDeleteContext>]
jmp oglmdi2_vs7.4038EA
mov edx,dword ptr ss:[esp+2C]
push edx
call dword ptr ds:[<&GetDlgCtrlID>]
mov esi,eax
mov eax,dword ptr ds:[412100]
sub esi,C350
mov edi,esi
shl edi,4
mov ecx,dword ptr ds:[edi+eax+4]
mov edx,dword ptr ds:[edi+eax+C]
push ecx
push edx
call dword ptr ds:[<&ReleaseDC>]
mov eax,dword ptr ds:[412100]
mov ecx,dword ptr ds:[edi+eax+8]
push ecx
call dword ptr ds:[<&wglDeleteContext>]
mov eax,dword ptr ds:[4120F8]
cmp esi,eax
jge oglmdi2_vs7.4038EA
mov ebx,dword ptr ds:[<&SetWindowTextA>]
jmp oglmdi2_vs7.403770
lea esp,dword ptr ss:[esp]
nop 
mov edx,dword ptr ds:[412100]
lea eax,dword ptr ds:[edi+edx]
lea ecx,dword ptr ds:[eax+10]
mov edx,dword ptr ds:[ecx]
mov dword ptr ds:[eax],edx
mov edx,dword ptr ds:[ecx+4]
mov dword ptr ds:[eax+4],edx
mov edx,dword ptr ds:[ecx+8]
mov dword ptr ds:[eax+8],edx
mov ecx,dword ptr ds:[ecx+C]
push esi
lea edx,dword ptr ss:[esp+14]
push oglmdi2_vs7.40E290
push edx
mov dword ptr ds:[eax+C],ecx
call oglmdi2_vs7.404C43
mov ecx,dword ptr ds:[412100]
mov edx,dword ptr ds:[edi+ecx+C]
add esp,C
lea eax,dword ptr ss:[esp+10]
push eax
push edx
call ebx
mov eax,dword ptr ds:[4120F8]
inc esi
add edi,10
cmp esi,eax
jl oglmdi2_vs7.403770
jmp oglmdi2_vs7.4038EA
mov eax,dword ptr ss:[esp+34]
mov byte ptr ds:[eax+411E40],0
jmp oglmdi2_vs7.4038EA
cmp ebp,111
jne oglmdi2_vs7.4038EA
xor eax,eax
jmp oglmdi2_vs7.403900
mov al,byte ptr ds:[4120F4]
test al,al
je oglmdi2_vs7.4038EA
mov eax,dword ptr ss:[esp+38]
mov ebx,dword ptr ds:[412070]
mov esi,dword ptr ds:[41207C]
movzx ecx,ax
mov edx,ecx
sub edx,ebx
shr eax,10
mov dword ptr ds:[411F40],edx
mov edx,eax
sub edx,esi
mov dword ptr ds:[412060],edx
mov dword ptr ds:[412070],ecx
mov dword ptr ds:[41207C],eax
jmp oglmdi2_vs7.4038EA
mov eax,ebp
sub eax,201
je oglmdi2_vs7.4038C3
dec eax
je oglmdi2_vs7.4038B4
sub eax,20
jne oglmdi2_vs7.4038EA
mov eax,dword ptr ds:[41205C]
push eax
call dword ptr ds:[<&GetMenu>]
mov edx,dword ptr ss:[esp+38]
mov edi,dword ptr ss:[esp+2C]
mov ebp,dword ptr ds:[<&EnableMenuItem>]
xor ecx,ecx
cmp edi,edx
setne cl
mov esi,eax
mov edi,ecx
mov ebx,edi
or ebx,400
push ebx
push 1
push esi
call ebp
push ebx
push 2
push esi
call ebp
push 0
push esi
call dword ptr ds:[<&GetSubMenu>]
push edi
mov esi,eax
push 2371
push esi
call ebp
push edi
push 2372
push esi
call ebp
mov eax,dword ptr ds:[41205C]
push eax
call dword ptr ds:[<&DrawMenuBar>]
mov ebp,dword ptr ss:[esp+30]
jmp oglmdi2_vs7.4038EA
mov byte ptr ds:[4120F4],0
call dword ptr ds:[<&ReleaseCapture>]
jmp oglmdi2_vs7.4038EA
mov eax,dword ptr ss:[esp+38]
mov edx,dword ptr ss:[esp+2C]
movzx ecx,ax
shr eax,10
push edx
mov byte ptr ds:[4120F4],1
mov dword ptr ds:[412070],ecx
mov dword ptr ds:[41207C],eax
call dword ptr ds:[<&SetCapture>]
mov eax,dword ptr ss:[esp+38]
mov ecx,dword ptr ss:[esp+34]
mov edx,dword ptr ss:[esp+2C]
push eax
push ecx
push ebp
push edx
call dword ptr ds:[<&DefMDIChildProcA>]
mov ecx,dword ptr ss:[esp+24]
xor ecx,dword ptr ss:[esp+28]
pop edi
pop esi
pop ebp
pop ebx
call oglmdi2_vs7.404CCC
add esp,18
ret 10
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
sub esp,24
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[esp+24]
push ebx
push ebp
mov ebp,dword ptr ss:[esp+34]
cmp ebp,111
push esi
mov dword ptr ss:[esp+2C],eax
push edi
ja oglmdi2_vs7.403B41
je oglmdi2_vs7.403B3A
lea eax,dword ptr ss:[ebp-5]
cmp eax,FC
ja oglmdi2_vs7.403EF3
movzx eax,byte ptr ds:[eax+403F34]
jmp dword ptr ds:[eax*4+403F20]
cmp dword ptr ss:[esp+40],1
je oglmdi2_vs7.403EF3
mov esi,dword ptr ss:[esp+38]
lea ecx,dword ptr ss:[esp+1C]
push ecx
push esi
call dword ptr ds:[<&GetClientRect>]
push esi
call dword ptr ds:[<&GetDlgCtrlID>]
mov edx,dword ptr ds:[412100]
sub eax,C350
shl eax,4
mov ecx,dword ptr ds:[eax+edx]
add eax,edx
cmp ecx,2
jne oglmdi2_vs7.4039CC
fild dword ptr ss:[esp+28]
fmul qword ptr ds:[40E228]
fsubr qword ptr ds:[40E2A8]
fstp dword ptr ds:[411094]
fild dword ptr ss:[esp+24]
fmul qword ptr ds:[40E228]
fsubr qword ptr ds:[40E2A8]
fstp dword ptr ds:[411098]
cmp dword ptr ds:[eax],3
jne oglmdi2_vs7.4039FD
fild dword ptr ss:[esp+28]
fmul qword ptr ds:[40E228]
fsub qword ptr ds:[40E2A8]
fstp dword ptr ds:[411090]
fild dword ptr ss:[esp+24]
fmul qword ptr ds:[40E228]
fsubr qword ptr ds:[40E2A8]
fstp dword ptr ds:[411098]
cmp dword ptr ds:[eax],4
jne oglmdi2_vs7.403EF3
fild dword ptr ss:[esp+24]
fmul qword ptr ds:[40E228]
fsubr qword ptr ds:[40E2A8]
fstp dword ptr ds:[411090]
fild dword ptr ss:[esp+28]
fmul qword ptr ds:[40E228]
fsubr qword ptr ds:[40E2A8]
fstp dword ptr ds:[411094]
jmp oglmdi2_vs7.403EF3
mov eax,dword ptr ss:[esp+40]
mov byte ptr ds:[eax+411E40],1
jmp oglmdi2_vs7.403EF3
mov ecx,dword ptr ss:[esp+40]
mov byte ptr ds:[ecx+411E40],0
jmp oglmdi2_vs7.403EF3
dec dword ptr ds:[4120F8]
jne oglmdi2_vs7.403A91
push 0
push 0
call dword ptr ds:[<&wglMakeCurrent>]
mov eax,dword ptr ds:[412100]
mov edx,dword ptr ds:[eax+4]
mov eax,dword ptr ds:[eax+C]
push edx
push eax
call dword ptr ds:[<&ReleaseDC>]
mov ecx,dword ptr ds:[412100]
mov edx,dword ptr ds:[ecx+8]
push edx
call dword ptr ds:[<&wglDeleteContext>]
jmp oglmdi2_vs7.403EF3
mov eax,dword ptr ss:[esp+38]
push eax
call dword ptr ds:[<&GetDlgCtrlID>]
mov esi,eax
mov eax,dword ptr ds:[412100]
sub esi,C350
mov edi,esi
shl edi,4
mov ecx,dword ptr ds:[edi+eax+4]
mov edx,dword ptr ds:[edi+eax+C]
push ecx
push edx
call dword ptr ds:[<&ReleaseDC>]
mov eax,dword ptr ds:[412100]
mov ecx,dword ptr ds:[edi+eax+8]
push ecx
call dword ptr ds:[<&wglDeleteContext>]
mov eax,dword ptr ds:[4120F8]
cmp esi,eax
jge oglmdi2_vs7.403EF3
mov ebx,dword ptr ds:[<&SetWindowTextA>]
mov edx,dword ptr ds:[412100]
lea eax,dword ptr ds:[edi+edx]
lea ecx,dword ptr ds:[eax+10]
mov edx,dword ptr ds:[ecx]
mov dword ptr ds:[eax],edx
mov edx,dword ptr ds:[ecx+4]
mov dword ptr ds:[eax+4],edx
mov edx,dword ptr ds:[ecx+8]
mov dword ptr ds:[eax+8],edx
mov ecx,dword ptr ds:[ecx+C]
push esi
lea edx,dword ptr ss:[esp+20]
push oglmdi2_vs7.40E290
push edx
mov dword ptr ds:[eax+C],ecx
call oglmdi2_vs7.404C43
mov ecx,dword ptr ds:[412100]
mov edx,dword ptr ds:[edi+ecx+C]
add esp,C
lea eax,dword ptr ss:[esp+1C]
push eax
push edx
call ebx
mov eax,dword ptr ds:[4120F8]
inc esi
add edi,10
cmp esi,eax
jl oglmdi2_vs7.403AE1
jmp oglmdi2_vs7.403EF3
xor eax,eax
jmp oglmdi2_vs7.403F09
lea eax,dword ptr ss:[ebp-200]
cmp eax,22
ja oglmdi2_vs7.403EF3
movzx eax,byte ptr ds:[eax+404048]
jmp dword ptr ds:[eax*4+404034]
mov eax,dword ptr ss:[esp+44]
mov edx,dword ptr ss:[esp+38]
movzx ecx,ax
shr eax,10
push edx
mov byte ptr ds:[4120F5],1
mov dword ptr ds:[411F48],ecx
mov dword ptr ds:[412090],eax
call dword ptr ds:[<&SetCapture>]
jmp oglmdi2_vs7.403EF3
mov byte ptr ds:[4120F5],0
call dword ptr ds:[<&ReleaseCapture>]
jmp oglmdi2_vs7.403EF3
mov esi,dword ptr ss:[esp+38]
lea eax,dword ptr ss:[esp+1C]
push eax
push esi
call dword ptr ds:[<&GetClientRect>]
mov eax,dword ptr ss:[esp+44]
movzx ecx,ax
shr eax,10
push esi
mov dword ptr ss:[esp+14],ecx
mov dword ptr ds:[4120AC],ecx
mov dword ptr ss:[esp+18],eax
mov dword ptr ds:[412074],eax
call dword ptr ds:[<&GetDlgCtrlID>]
mov esi,eax
mov al,byte ptr ds:[4120F5]
sub esi,C350
test al,al
je oglmdi2_vs7.403D34
mov ecx,dword ptr ds:[4120AC]
cmp ecx,dword ptr ss:[esp+1C]
mov edi,dword ptr ds:[411F48]
jl oglmdi2_vs7.403BFD
cmp ecx,dword ptr ss:[esp+24]
jle oglmdi2_vs7.403C05
mov ecx,edi
mov dword ptr ds:[4120AC],ecx
mov edx,dword ptr ss:[esp+20]
mov eax,dword ptr ds:[412074]
cmp eax,edx
mov edx,dword ptr ds:[412090]
jl oglmdi2_vs7.403C1E
cmp eax,dword ptr ss:[esp+28]
jle oglmdi2_vs7.403C25
mov eax,edx
mov dword ptr ds:[412074],eax
mov ebx,ecx
sub ebx,edi
mov edi,eax
mov dword ptr ds:[412090],eax
sub edi,edx
mov dword ptr ds:[411F48],ecx
mov ecx,dword ptr ds:[412100]
mov eax,esi
shl eax,4
mov dword ptr ds:[412068],ebx
mov dword ptr ds:[41206C],edi
cmp dword ptr ds:[eax+ecx],2
jne oglmdi2_vs7.403C93
mov ecx,dword ptr ds:[411F50]
fild dword ptr ds:[412068]
lea edx,dword ptr ds:[ecx+ecx*8]
mov ecx,dword ptr ds:[412108]
fadd dword ptr ds:[ecx+edx*4+4]
lea ecx,dword ptr ds:[ecx+edx*4+4]
fstp dword ptr ds:[ecx]
mov ecx,dword ptr ds:[411F50]
lea edx,dword ptr ds:[ecx+ecx*8]
mov ecx,dword ptr ds:[412108]
fld dword ptr ds:[ecx+edx*4+8]
lea ecx,dword ptr ds:[ecx+edx*4+8]
fisub dword ptr ds:[41206C]
fstp dword ptr ds:[ecx]
mov edx,dword ptr ds:[412100]
cmp dword ptr ds:[eax+edx],3
jne oglmdi2_vs7.403CDB
mov ecx,dword ptr ds:[411F50]
fild dword ptr ds:[412068]
mov edx,dword ptr ds:[412108]
lea ecx,dword ptr ds:[ecx+ecx*8]
fadd dword ptr ds:[edx+ecx*4+4]
lea ecx,dword ptr ds:[edx+ecx*4+4]
fstp dword ptr ds:[ecx]
mov ecx,dword ptr ds:[411F50]
mov edx,dword ptr ds:[412108]
fild dword ptr ds:[41206C]
lea ecx,dword ptr ds:[ecx+ecx*8]
lea ecx,dword ptr ds:[edx+ecx*4+C]
fadd dword ptr ds:[ecx]
fstp dword ptr ds:[ecx]
mov ecx,dword ptr ds:[412100]
cmp dword ptr ds:[eax+ecx],4
jne oglmdi2_vs7.403D22
mov eax,dword ptr ds:[411F50]
fild dword ptr ds:[412068]
lea edx,dword ptr ds:[eax+eax*8]
mov eax,dword ptr ds:[412108]
fadd dword ptr ds:[eax+edx*4+C]
lea eax,dword ptr ds:[eax+edx*4+C]
fstp dword ptr ds:[eax]
mov eax,dword ptr ds:[411F50]
mov edx,dword ptr ds:[412108]
lea ecx,dword ptr ds:[eax+eax*8]
fld dword ptr ds:[edx+ecx*4+8]
lea eax,dword ptr ds:[edx+ecx*4+8]
fisub dword ptr ds:[41206C]
fstp dword ptr ds:[eax]
call oglmdi2_vs7.401160
mov al,byte ptr ds:[4120F5]
test al,al
jne oglmdi2_vs7.403EF3
fild dword ptr ss:[esp+24]
fmul qword ptr ds:[40E2A0]
fiadd dword ptr ss:[esp+10]
call oglmdi2_vs7.404CDC
fild dword ptr ss:[esp+28]
mov dword ptr ds:[4120AC],eax
mov eax,dword ptr ds:[412100]
fmul qword ptr ds:[40E2A0]
shl esi,4
mov ecx,dword ptr ds:[esi+eax]
fiadd dword ptr ss:[esp+14]
cmp ecx,3
je oglmdi2_vs7.403D70
fmul qword ptr ds:[40E298]
call oglmdi2_vs7.404CDC
mov ebp,dword ptr ss:[esp+38]
mov dword ptr ds:[412074],eax
mov dword ptr ds:[41108C],2710
mov dword ptr ss:[esp+14],0
xor esi,esi
mov ecx,dword ptr ss:[esp+38]
push ecx
call dword ptr ds:[<&GetDlgCtrlID>]
mov edx,dword ptr ds:[412100]
mov edi,dword ptr ds:[412108]
sub eax,C350
shl eax,4
mov ebx,dword ptr ds:[eax+edx]
cmp ebx,2
jne oglmdi2_vs7.403DDD
fild dword ptr ds:[4120AC]
fsub dword ptr ds:[esi+edi+4]
call oglmdi2_vs7.404CDC
fild dword ptr ds:[412074]
mov ebp,eax
fsub dword ptr ds:[esi+edi+8]
call oglmdi2_vs7.404CDC
mov dword ptr ss:[esp+10],eax
cmp ebx,3
jne oglmdi2_vs7.403E06
fild dword ptr ds:[4120AC]
fsub dword ptr ds:[esi+edi+4]
call oglmdi2_vs7.404CDC
fild dword ptr ds:[412074]
mov ebp,eax
fsub dword ptr ds:[esi+edi+C]
call oglmdi2_vs7.404CDC
mov dword ptr ss:[esp+10],eax
cmp ebx,4
jne oglmdi2_vs7.403E2F
fild dword ptr ds:[4120AC]
fsub dword ptr ds:[esi+edi+C]
call oglmdi2_vs7.404CDC
fild dword ptr ds:[412074]
mov ebp,eax
fsub dword ptr ds:[esi+edi+8]
call oglmdi2_vs7.404CDC
mov dword ptr ss:[esp+10],eax
mov eax,dword ptr ss:[esp+10]
mov ecx,eax
imul ecx,eax
mov edx,ebp
imul edx,ebp
add ecx,edx
mov dword ptr ss:[esp+18],ecx
fild dword ptr ss:[esp+18]
fsqrt 
fild dword ptr ds:[41108C]
fld st(1)
fcompp 
fnstsw ax
test ah,5
jp oglmdi2_vs7.403E6F
call oglmdi2_vs7.404CDC
mov dword ptr ds:[41108C],eax
mov eax,dword ptr ss:[esp+14]
mov dword ptr ds:[411F50],eax
jmp oglmdi2_vs7.403E71
fstp st(0
mov edx,dword ptr ss:[esp+14]
inc edx
add esi,24
cmp esi,120
mov dword ptr ss:[esp+14],edx
jl oglmdi2_vs7.403D92
jmp oglmdi2_vs7.403EEF
mov ecx,dword ptr ds:[41205C]
push ecx
call dword ptr ds:[<&GetMenu>]
mov ecx,dword ptr ss:[esp+38]
mov ebp,dword ptr ds:[<&EnableMenuItem>]
mov esi,eax
mov eax,dword ptr ss:[esp+44]
xor edx,edx
cmp ecx,eax
setne dl
mov edi,edx
mov ebx,edi
or ebx,400
push ebx
push 1
push esi
call ebp
push ebx
push 2
push esi
call ebp
push 0
push esi
call dword ptr ds:[<&GetSubMenu>]
push edi
mov esi,eax
push 2371
push esi
call ebp
push edi
push 2372
push esi
call ebp
mov ecx,dword ptr ds:[41205C]
push ecx
call dword ptr ds:[<&DrawMenuBar>]
mov ebp,dword ptr ss:[esp+3C]
mov edx,dword ptr ss:[esp+44]
mov eax,dword ptr ss:[esp+40]
mov ecx,dword ptr ss:[esp+38]
push edx
push eax
push ebp
push ecx
call dword ptr ds:[<&DefMDIChildProcA>]
mov ecx,dword ptr ss:[esp+30]
xor ecx,dword ptr ss:[esp+34]
pop edi
pop esi
pop ebp
pop ebx
call oglmdi2_vs7.404CCC
add esp,24
ret 10
cmp word ptr ds:[eax],ax
push edi
cmp al,byte ptr ds:[eax]
aaa 
cmp al,byte ptr ds:[eax]
inc edi
cmp al,byte ptr ds:[eax]
inc eax
add byte ptr ds:[eax],al
add al,4
add al,4
add al,4
add al,4
add al,4
add dword ptr ss:[esp+eax],eax
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,2
add ecx,dword ptr ss:[ebp+3B9C0049]
inc eax
add byte ptr ds:[esi+3B],bl
inc eax
add byte ptr ds:[edx-74FFBFC5],cl
inc eax
add bl,dh
inc eax
add byte ptr ds:[eax],al
add dword ptr ds:[edx],eax
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,4
add al,3
nop 
nop 
nop 
nop 
nop 
sub esp,4C
push ebx
push ebp
push esi
mov esi,dword ptr ss:[esp+5C]
push edi
mov edi,dword ptr ds:[<&LoadIconA>]
push 69
xor ebx,ebx
push esi
mov dword ptr ds:[412078],esi
mov dword ptr ss:[esp+34],30
mov dword ptr ss:[esp+38],2B
mov dword ptr ss:[esp+3C],oglmdi2_vs7.403680
mov dword ptr ss:[esp+40],ebx
mov dword ptr ss:[esp+44],ebx
mov dword ptr ss:[esp+48],esi
call edi
mov ebp,dword ptr ds:[<&LoadCursorA>]
push 7F00
push ebx
mov dword ptr ss:[esp+4C],eax
call ebp
push 69
push esi
mov dword ptr ss:[esp+50],eax
mov dword ptr ss:[esp+54],11
mov dword ptr ss:[esp+58],ebx
mov dword ptr ss:[esp+5C],oglmdi2_vs7.411070
call edi
mov ebx,dword ptr ds:[<&RegisterClassExA>]
mov dword ptr ss:[esp+58],eax
lea eax,dword ptr ss:[esp+2C]
push eax
call ebx
test ax,ax
je oglmdi2_vs7.404160
xor eax,eax
push 69
push esi
mov dword ptr ss:[esp+34],30
mov dword ptr ss:[esp+38],2B
mov dword ptr ss:[esp+3C],oglmdi2_vs7.403920
mov dword ptr ss:[esp+40],eax
mov dword ptr ss:[esp+44],eax
mov dword ptr ss:[esp+48],esi
call edi
push 7F00
push 0
mov dword ptr ss:[esp+4C],eax
call ebp
push 69
push esi
mov dword ptr ss:[esp+50],eax
mov dword ptr ss:[esp+54],11
mov dword ptr ss:[esp+58],0
mov dword ptr ss:[esp+5C],oglmdi2_vs7.41107C
call edi
lea ecx,dword ptr ss:[esp+2C]
push ecx
mov dword ptr ss:[esp+5C],eax
call ebx
test ax,ax
jne oglmdi2_vs7.404180
push 30
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E32C
push 0
call dword ptr ds:[<&MessageBoxA>]
pop edi
pop esi
pop ebp
xor eax,eax
pop ebx
add esp,4C
ret 10
xor eax,eax
push 68
push esi
mov dword ptr ss:[esp+34],30
mov dword ptr ss:[esp+38],3
mov dword ptr ss:[esp+3C],oglmdi2_vs7.402F30
mov dword ptr ss:[esp+40],eax
mov dword ptr ss:[esp+44],eax
mov dword ptr ss:[esp+48],esi
call edi
push 7F00
push 0
mov dword ptr ss:[esp+4C],eax
call ebp
push 68
push esi
mov dword ptr ss:[esp+50],eax
mov dword ptr ss:[esp+54],11
mov dword ptr ss:[esp+58],oglmdi2_vs7.40E324
mov dword ptr ss:[esp+5C],oglmdi2_vs7.411064
call edi
lea edx,dword ptr ss:[esp+2C]
push edx
mov dword ptr ss:[esp+5C],eax
call ebx
test ax,ax
jne oglmdi2_vs7.40420A
push 30
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E300
push 0
call dword ptr ds:[<&MessageBoxA>]
pop edi
pop esi
pop ebp
or eax,FFFFFFFF
pop ebx
add esp,4C
ret 10
push 0
push esi
push 0
push 0
push 80000000
push 80000000
push 80000000
push 80000000
push 2CF0000
push oglmdi2_vs7.40E2E8
push oglmdi2_vs7.411064
push 0
call dword ptr ds:[<&CreateWindowExA>]
test eax,eax
mov dword ptr ds:[41205C],eax
jne oglmdi2_vs7.404265
push 30
push oglmdi2_vs7.40E2E0
push oglmdi2_vs7.40E2C4
push eax
call dword ptr ds:[<&MessageBoxA>]
pop edi
pop esi
pop ebp
or eax,FFFFFFFF
pop ebx
add esp,4C
ret 10
mov ecx,dword ptr ss:[esp+6C]
push ecx
push eax
call dword ptr ds:[<&ShowWindow>]
mov edx,dword ptr ds:[41205C]
push edx
call dword ptr ds:[<&UpdateWindow>]
call oglmdi2_vs7.401050
call oglmdi2_vs7.401160
push 0
push 0
push 0
lea eax,dword ptr ss:[esp+1C]
push eax
call dword ptr ds:[<&GetMessageA>]
test eax,eax
je oglmdi2_vs7.40448C
mov ebx,dword ptr ds:[<&wglMakeCurrent>]
mov ebp,dword ptr ds:[<&GetClientRect>]
lea ecx,dword ptr ds:[ecx]
mov edx,dword ptr ds:[412058]
lea ecx,dword ptr ss:[esp+10]
push ecx
push edx
call dword ptr ds:[<&TranslateMDISysAccel>]
test eax,eax
jne oglmdi2_vs7.4042DC
lea eax,dword ptr ss:[esp+10]
push eax
call dword ptr ds:[<&TranslateMessage>]
lea ecx,dword ptr ss:[esp+10]
push ecx
call dword ptr ds:[<&DispatchMessageA>]
mov eax,dword ptr ds:[4120F8]
test eax,eax
je oglmdi2_vs7.404473
xor edi,edi
test eax,eax
jle oglmdi2_vs7.404473
xor esi,esi
mov edx,dword ptr ds:[412100]
mov eax,dword ptr ds:[esi+edx+C]
push eax
call dword ptr ds:[<&IsIconic>]
test eax,eax
jne oglmdi2_vs7.404462
mov eax,dword ptr ds:[412100]
mov ecx,dword ptr ds:[esi+eax+8]
mov edx,dword ptr ds:[esi+eax+4]
push ecx
push edx
call ebx
mov eax,dword ptr ds:[412100]
mov ecx,dword ptr ds:[esi+eax+C]
push oglmdi2_vs7.412080
push ecx
call ebp
mov eax,dword ptr ds:[412088]
test eax,eax
jle oglmdi2_vs7.4043A1
mov ecx,dword ptr ds:[41208C]
test ecx,ecx
jle oglmdi2_vs7.4043A1
mov edx,dword ptr ds:[412100]
cmp dword ptr ds:[esi+edx],1
push ecx
push eax
jne oglmdi2_vs7.404360
call oglmdi2_vs7.401810
add esp,8
call oglmdi2_vs7.401910
jmp oglmdi2_vs7.4043A1
call oglmdi2_vs7.401870
mov ecx,dword ptr ds:[412100]
mov eax,dword ptr ds:[esi+ecx]
add esp,8
sub eax,2
je oglmdi2_vs7.404394
dec eax
je oglmdi2_vs7.404388
dec eax
jne oglmdi2_vs7.4043A1
mov eax,dword ptr ds:[esi+ecx+C]
push eax
call oglmdi2_vs7.402960
jmp oglmdi2_vs7.40439E
mov ecx,dword ptr ds:[esi+ecx+C]
push ecx
call oglmdi2_vs7.402390
jmp oglmdi2_vs7.40439E
mov edx,dword ptr ds:[esi+ecx+C]
push edx
call oglmdi2_vs7.401DD0
add esp,4
call dword ptr ds:[<&glFlush>]
mov eax,dword ptr ds:[412100]
mov ecx,dword ptr ds:[esi+eax+4]
push ecx
call dword ptr ds:[<&SwapBuffers>]
mov al,byte ptr ds:[411E71]
test al,al
je oglmdi2_vs7.4043E5
fld dword ptr ds:[411088]
fcomp dword ptr ds:[40E2C0]
fnstsw ax
test ah,5
jp oglmdi2_vs7.4043E5
fld dword ptr ds:[411088]
fadd qword ptr ds:[40E2B8]
fstp dword ptr ds:[411088]
mov al,byte ptr ds:[411E72]
test al,al
je oglmdi2_vs7.404413
fld dword ptr ds:[411088]
fcomp dword ptr ds:[40E2B0]
fnstsw ax
test ah,41
jne oglmdi2_vs7.404413
fld dword ptr ds:[411088]
fsub qword ptr ds:[40E2B8]
fstp dword ptr ds:[411088]
mov al,byte ptr ds:[411E73]
test al,al
je oglmdi2_vs7.404422
inc dword ptr ds:[4120EC]
mov al,byte ptr ds:[411E74]
test al,al
je oglmdi2_vs7.404431
dec dword ptr ds:[4120EC]
mov al,byte ptr ds:[411E75]
test al,al
je oglmdi2_vs7.404440
inc dword ptr ds:[4120F0]
mov al,byte ptr ds:[411E76]
test al,al
je oglmdi2_vs7.40444F
dec dword ptr ds:[4120F0]
mov al,byte ptr ds:[411E60]
test al,al
je oglmdi2_vs7.404462
call oglmdi2_vs7.401050
call oglmdi2_vs7.401160
mov eax,dword ptr ds:[4120F8]
inc edi
add esi,10
cmp edi,eax
jl oglmdi2_vs7.4042F5
push 0
push 0
push 0
lea edx,dword ptr ss:[esp+1C]
push edx
call dword ptr ds:[<&GetMessageA>]
test eax,eax
jne oglmdi2_vs7.4042B0
mov eax,dword ptr ss:[esp+18]
pop edi
pop esi
pop ebp
pop ebx
add esp,4C
ret 10
nop 
nop 
nop 
nop 
nop 
nop 
push FFFFFFFF
push oglmdi2_vs7.40CFF8
mov eax,dword ptr fs:[0]
push eax
mov dword ptr fs:[0],esp
push ecx
push esi
mov esi,ecx
mov dword ptr ss:[esp+4],esi
push oglmdi2_vs7.404620
push 3
push 24
lea eax,dword ptr ds:[esi+40]
push eax
mov dword ptr ss:[esp+20],0
call oglmdi2_vs7.404B93
mov ecx,esi
mov dword ptr ss:[esp+10],FFFFFFFF
call oglmdi2_vs7.404620
mov ecx,dword ptr ss:[esp+8]
pop esi
mov dword ptr fs:[0],ecx
add esp,10
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
sub esp,18
fld dword ptr ds:[ecx+68]
fsub dword ptr ds:[ecx+44]
fstp dword ptr ss:[esp+C]
fld dword ptr ds:[ecx+6C]
fsub dword ptr ds:[ecx+48]
fstp dword ptr ss:[esp+14]
fld dword ptr ds:[ecx+70]
fsub dword ptr ds:[ecx+4C]
fstp dword ptr ss:[esp]
fld dword ptr ds:[ecx+8C]
fsub dword ptr ds:[ecx+44]
fstp dword ptr ss:[esp+10]
fld dword ptr ds:[ecx+90]
fsub dword ptr ds:[ecx+48]
fstp dword ptr ss:[esp+8]
fld dword ptr ds:[ecx+94]
fsub dword ptr ds:[ecx+4C]
fst dword ptr ss:[esp+4]
fmul dword ptr ss:[esp+14]
fld dword ptr ss:[esp+8]
fmul dword ptr ss:[esp]
fsubp st(1)
fst dword ptr ds:[ecx+50]
fld dword ptr ss:[esp+10]
fmul dword ptr ss:[esp]
fld dword ptr ss:[esp+4]
fmul dword ptr ss:[esp+C]
fsubp st(1)
fst dword ptr ds:[ecx+54]
fld dword ptr ss:[esp+8]
fmul dword ptr ss:[esp+C]
fld dword ptr ss:[esp+10]
fmul dword ptr ss:[esp+14]
fsubp st(1)
fst dword ptr ss:[esp+14]
mov eax,dword ptr ss:[esp+14]
fst dword ptr ds:[ecx+58]
fld st(2)
mov dword ptr ds:[ecx+A0],eax
fstp dword ptr ds:[ecx+74]
fld st(1)
fstp dword ptr ds:[ecx+78]
fstp dword ptr ds:[ecx+7C]
fxch st(1)
fstp dword ptr ds:[ecx+98]
fstp dword ptr ds:[ecx+9C]
add esp,18
ret 
push FFFFFFFF
push oglmdi2_vs7.40CFF8
mov eax,dword ptr fs:[0]
push eax
mov dword ptr fs:[0],esp
push ecx
push esi
mov esi,ecx
mov dword ptr ss:[esp+4],esi
call oglmdi2_vs7.404610
push oglmdi2_vs7.404620
push oglmdi2_vs7.401000
push 3
push 24
lea eax,dword ptr ds:[esi+40]
push eax
mov dword ptr ss:[esp+24],0
call oglmdi2_vs7.404D51
mov ecx,dword ptr ss:[esp+8]
mov eax,esi
pop esi
mov dword ptr fs:[0],ecx
add esp,10
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
mov eax,ecx
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
sub esp,2C
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[esp+2C]
push ebx
push ebp
mov ebp,ecx
push oglmdi2_vs7.40E4C8
push ebp
mov dword ptr ss:[esp+38],eax
mov byte ptr ss:[esp+20],0
mov byte ptr ss:[esp+21],0
mov byte ptr ss:[esp+22],2
mov byte ptr ss:[esp+23],0
mov byte ptr ss:[esp+24],0
mov byte ptr ss:[esp+25],0
mov byte ptr ss:[esp+26],0
mov byte ptr ss:[esp+27],0
mov byte ptr ss:[esp+28],0
mov byte ptr ss:[esp+29],0
mov byte ptr ss:[esp+2A],0
mov byte ptr ss:[esp+2B],0
mov dword ptr ss:[esp+14],1908
call oglmdi2_vs7.4053FF
mov ebx,eax
add esp,8
test ebx,ebx
mov dword ptr ss:[esp+8],ebx
je oglmdi2_vs7.404911
push esi
push edi
push ebx
push C
lea eax,dword ptr ss:[esp+34]
push 1
push eax
call oglmdi2_vs7.4052EC
add esp,10
cmp eax,C
jne oglmdi2_vs7.404939
mov ecx,3
lea edi,dword ptr ss:[esp+2C]
lea esi,dword ptr ss:[esp+20]
xor edx,edx
repe cmpsd dword ptr ds:[esi],dword ptr es:[edi]
jne oglmdi2_vs7.404939
push ebx
push 6
lea eax,dword ptr ss:[esp+20]
push 1
push eax
call oglmdi2_vs7.4052EC
add esp,10
cmp eax,6
jne oglmdi2_vs7.404939
movzx ecx,byte ptr ss:[esp+19]
movzx edx,byte ptr ss:[esp+18]
movzx eax,byte ptr ss:[esp+1B]
shl ecx,8
add edx,ecx
movzx ecx,byte ptr ss:[esp+1A]
shl eax,8
add eax,ecx
test edx,edx
mov dword ptr ss:[ebp+1C],edx
mov dword ptr ss:[ebp+20],eax
jbe oglmdi2_vs7.4048BB
test eax,eax
jbe oglmdi2_vs7.4048BB
mov cl,byte ptr ss:[esp+1C]
cmp cl,18
je oglmdi2_vs7.404739
cmp cl,20
jne oglmdi2_vs7.4048BB
imul eax,edx
movzx ecx,cl
mov dword ptr ss:[ebp+18],ecx
shr ecx,3
mov edi,ecx
imul eax,edi
mov esi,eax
push esi
call oglmdi2_vs7.4052DA
add esp,4
test eax,eax
mov dword ptr ss:[ebp+14],eax
je oglmdi2_vs7.404892
push ebx
push esi
push 1
push eax
call oglmdi2_vs7.4052EC
add esp,10
cmp eax,esi
jne oglmdi2_vs7.404892
xor eax,eax
test esi,esi
jbe oglmdi2_vs7.4047A0
jmp oglmdi2_vs7.404780
lea ecx,dword ptr ds:[ecx]
mov edx,dword ptr ss:[ebp+14]
mov bl,byte ptr ds:[edx+eax+2]
lea ecx,dword ptr ds:[edx+eax]
movzx edx,byte ptr ds:[ecx]
mov byte ptr ds:[ecx],bl
mov ecx,dword ptr ss:[ebp+14]
mov byte ptr ds:[ecx+eax+2],dl
add eax,edi
cmp eax,esi
jb oglmdi2_vs7.404780
mov ebx,dword ptr ss:[esp+10]
push ebx
call oglmdi2_vs7.405212
add esp,4
lea esi,dword ptr ss:[ebp+24]
push esi
push 1
call dword ptr ds:[<&glGenTextures>]
mov edx,dword ptr ds:[esi]
push edx
push DE1
call dword ptr ds:[<&glBindTexture>]
mov esi,dword ptr ds:[<&glTexParameterf>]
push 46240000
push 2802
push DE1
call esi
push 46240000
push 2803
push DE1
call esi
push 46180400
push 2800
push DE1
call esi
push 461C0C00
push 2801
push DE1
call esi
cmp dword ptr ss:[ebp+18],18
mov esi,1907
je oglmdi2_vs7.40481C
mov esi,dword ptr ss:[esp+14]
push 46040000
push 2200
push 2300
call dword ptr ds:[<&glTexEnvf>]
mov eax,dword ptr ss:[ebp+14]
mov ecx,dword ptr ss:[ebp+20]
mov edx,dword ptr ss:[ebp+1C]
push eax
push 1401
push esi
push 0
push ecx
push edx
push esi
push 0
push DE1
call dword ptr ds:[<&glTexImage2D>]
mov eax,dword ptr ss:[ebp+14]
mov ecx,dword ptr ss:[ebp+20]
mov edx,dword ptr ss:[ebp+1C]
push eax
push 1401
push esi
push ecx
push edx
push esi
push DE1
call <oglmdi2_vs7.gluBuild2DMipmaps>
mov eax,dword ptr ss:[ebp+14]
push eax
call oglmdi2_vs7.4051DA
add esp,4
pop edi
pop esi
pop ebp
mov al,1
pop ebx
mov ecx,dword ptr ss:[esp+28]
xor ecx,dword ptr ss:[esp+2C]
add esp,2C
jmp oglmdi2_vs7.404CCC
mov ebp,dword ptr ss:[ebp+14]
test ebp,ebp
je oglmdi2_vs7.4048A2
push ebp
call oglmdi2_vs7.4051DA
add esp,4
push 10
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E4A0
push 0
call dword ptr ds:[<&MessageBoxA>]
jmp oglmdi2_vs7.40498B
push ebx
call oglmdi2_vs7.405212
mov eax,dword ptr ss:[ebp+1C]
mov esi,dword ptr ds:[<&MessageBoxA>]
add esp,4
test eax,eax
jbe oglmdi2_vs7.4048D8
mov eax,dword ptr ss:[ebp+20]
test eax,eax
ja oglmdi2_vs7.4048E8
push 10
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E46C
push 0
call esi
mov al,byte ptr ss:[esp+1C]
cmp al,18
je oglmdi2_vs7.404994
cmp al,20
je oglmdi2_vs7.404994
push 10
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E450
push 0
call esi
jmp oglmdi2_vs7.404994
push 10
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E434
push 0
call dword ptr ds:[<&MessageBoxA>]
pop ebp
xor al,al
pop ebx
mov ecx,dword ptr ss:[esp+28]
xor ecx,dword ptr ss:[esp+2C]
add esp,2C
jmp oglmdi2_vs7.404CCC
mov al,byte ptr ss:[esp+2E]
cmp al,1
mov esi,dword ptr ds:[<&MessageBoxA>]
jne oglmdi2_vs7.40495B
push 10
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E3F0
push 0
call esi
mov al,byte ptr ss:[esp+2E]
cmp al,3
jne oglmdi2_vs7.404973
push 10
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E3A8
push 0
call esi
mov al,byte ptr ss:[esp+2E]
cmp al,9
je oglmdi2_vs7.40497B
cmp al,A
jne oglmdi2_vs7.40498B
push 10
push oglmdi2_vs7.40E278
push oglmdi2_vs7.40E358
push 0
call esi
push ebx
call oglmdi2_vs7.405212
add esp,4
mov ecx,dword ptr ss:[esp+38]
pop edi
pop esi
pop ebp
xor al,al
xor ecx,dword ptr ss:[esp+30]
pop ebx
add esp,2C
jmp oglmdi2_vs7.404CCC
nop 
nop 
nop 
nop 
nop 
nop 
mov edx,dword ptr ss:[esp+8]
mov eax,ecx
mov ecx,dword ptr ss:[esp+4]
mov dword ptr ds:[eax+4],ecx
mov ecx,dword ptr ss:[esp+C]
mov dword ptr ds:[eax+8],edx
mov edx,dword ptr ss:[esp+10]
mov dword ptr ds:[eax+C],ecx
mov ecx,dword ptr ss:[esp+14]
mov dword ptr ds:[eax+10],edx
mov edx,dword ptr ss:[esp+18]
mov dword ptr ds:[eax],3
mov dword ptr ds:[eax+14],ecx
mov dword ptr ds:[eax+18],edx
ret 18
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
jmp dword ptr ds:[<&gluPerspective>]
jmp dword ptr ds:[<&gluSphere>]
jmp dword ptr ds:[<&gluQuadricOrientation>]
jmp dword ptr ds:[<&gluNewQuadric>]
jmp dword ptr ds:[<&gluBuild2DMipmaps>]
jmp oglmdi2_vs7.404A47
mov eax,dword ptr ds:[ecx+4]
test eax,eax
jbe oglmdi2_vs7.404A23
cmp eax,FFFFFFFF
jae oglmdi2_vs7.404A23
dec eax
mov dword ptr ds:[ecx+4],eax
mov eax,dword ptr ds:[ecx+4]
neg eax
sbb eax,eax
not eax
and eax,ecx
ret 
mov ecx,dword ptr ds:[ecx]
test ecx,ecx
je oglmdi2_vs7.404A46
call oglmdi2_vs7.404A13
test eax,eax
je oglmdi2_vs7.404A46
mov edx,dword ptr ds:[eax]
push 1
mov ecx,eax
call dword ptr ds:[edx]
ret 
push esi
mov esi,dword ptr ss:[esp+8]
jmp oglmdi2_vs7.404A5E
push esi
call oglmdi2_vs7.406100
test eax,eax
pop ecx
jne oglmdi2_vs7.404A5E
call oglmdi2_vs7.404AAA
push esi
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
je oglmdi2_vs7.404A4E
pop esi
ret 
mov dword ptr ds:[ecx],oglmdi2_vs7.40E4E0
jmp oglmdi2_vs7.4060C1
push esi
mov esi,ecx
call oglmdi2_vs7.404A6B
test byte ptr ss:[esp+8],1
je oglmdi2_vs7.404A8C
push esi
call oglmdi2_vs7.404B2B
pop ecx
mov eax,esi
pop esi
ret 4
push esi
push dword ptr ss:[esp+8]
mov esi,ecx
call oglmdi2_vs7.406077
mov dword ptr ds:[esi],oglmdi2_vs7.40E4E0
mov eax,esi
pop esi
ret 4
push ebp
mov ebp,esp
sub esp,10
test byte ptr ds:[412180],1
push esi
mov esi,oglmdi2_vs7.40E4E0
jne oglmdi2_vs7.404AEC
or dword ptr ds:[412180],1
lea eax,dword ptr ss:[ebp-4]
push eax
mov ecx,oglmdi2_vs7.412174
mov dword ptr ss:[ebp-4],oglmdi2_vs7.40E4E8
call oglmdi2_vs7.40603A
push oglmdi2_vs7.40D20E
mov dword ptr ds:[412174],esi
call oglmdi2_vs7.40625A
pop ecx
push oglmdi2_vs7.412174
lea ecx,dword ptr ss:[ebp-10]
call oglmdi2_vs7.406077
push oglmdi2_vs7.40F548
lea eax,dword ptr ss:[ebp-10]
push eax
mov dword ptr ss:[ebp-10],esi
call oglmdi2_vs7.406000
int3 
jmp oglmdi2_vs7.404B21
mov eax,dword ptr ds:[4110D8]
mov eax,dword ptr ds:[eax*4+4121A4]
inc dword ptr ds:[4110D8]
call eax
cmp dword ptr ds:[4110D8],A
jb oglmdi2_vs7.404B0D
ret 
jmp oglmdi2_vs7.4051DA
jmp oglmdi2_vs7.404B2B
push 14
push oglmdi2_vs7.40E4F8
call oglmdi2_vs7.406308
and dword ptr ss:[ebp-4],0
dec dword ptr ss:[ebp+10]
js oglmdi2_vs7.404B58
mov ecx,dword ptr ss:[ebp+8]
sub ecx,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp+8],ecx
call dword ptr ss:[ebp+14]
jmp oglmdi2_vs7.404B45
or dword ptr ss:[ebp-4],FFFFFFFF
call oglmdi2_vs7.406343
ret 10
mov eax,dword ptr ss:[ebp-14]
mov dword ptr ss:[ebp-1C],eax
mov eax,dword ptr ss:[ebp-1C]
mov eax,dword ptr ds:[eax]
mov dword ptr ss:[ebp-20],eax
mov eax,dword ptr ss:[ebp-20]
cmp dword ptr ds:[eax],E06D7363
je oglmdi2_vs7.404B8D
mov dword ptr ss:[ebp-24],0
mov eax,dword ptr ss:[ebp-24]
ret 
mov esp,dword ptr ss:[ebp-18]
jmp oglmdi2_vs7.404B58
call oglmdi2_vs7.4062AC
int3 
push C
push oglmdi2_vs7.40E508
call oglmdi2_vs7.406308
and dword ptr ss:[ebp-1C],0
mov esi,dword ptr ss:[ebp+C]
mov eax,esi
imul eax,dword ptr ss:[ebp+10]
add dword ptr ss:[ebp+8],eax
and dword ptr ss:[ebp-4],0
dec dword ptr ss:[ebp+10]
js oglmdi2_vs7.404BC3
sub dword ptr ss:[ebp+8],esi
mov ecx,dword ptr ss:[ebp+8]
call dword ptr ss:[ebp+14]
jmp oglmdi2_vs7.404BB3
mov dword ptr ss:[ebp-1C],1
or dword ptr ss:[ebp-4],FFFFFFFF
call oglmdi2_vs7.404BDB
call oglmdi2_vs7.406343
ret 10
cmp dword ptr ss:[ebp-1C],0
jne oglmdi2_vs7.404BF2
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.404B35
ret 
ret 
mov eax,oglmdi2_vs7.4066E6
mov dword ptr ds:[411554],eax
mov dword ptr ds:[411558],oglmdi2_vs7.4063AC
mov dword ptr ds:[41155C],oglmdi2_vs7.406411
mov dword ptr ds:[411560],oglmdi2_vs7.406354
mov dword ptr ds:[411564],oglmdi2_vs7.4063F7
mov dword ptr ds:[411568],eax
ret 
call oglmdi2_vs7.404BF4
call oglmdi2_vs7.406789
mov dword ptr ds:[4121D4],eax
call oglmdi2_vs7.406737
fnclex 
ret 
push ebp
mov ebp,esp
sub esp,20
push esi
mov esi,dword ptr ss:[ebp+8]
push edi
lea eax,dword ptr ss:[ebp+10]
push eax
push dword ptr ss:[ebp+C]
lea eax,dword ptr ss:[ebp-20]
push eax
mov dword ptr ss:[ebp-1C],7FFFFFFF
mov dword ptr ss:[ebp-14],42
mov dword ptr ss:[ebp-18],esi
mov dword ptr ss:[ebp-20],esi
call oglmdi2_vs7.406956
add esp,C
test esi,esi
mov edi,eax
je oglmdi2_vs7.404C95
dec dword ptr ss:[ebp-1C]
js oglmdi2_vs7.404C88
mov eax,dword ptr ss:[ebp-20]
and byte ptr ds:[eax],0
jmp oglmdi2_vs7.404C95
lea eax,dword ptr ss:[ebp-20]
push eax
push 0
call oglmdi2_vs7.4067B2
pop ecx
pop ecx
mov eax,edi
pop edi
pop esi
leave 
ret 
push 8
push oglmdi2_vs7.40E518
call oglmdi2_vs7.406308
and dword ptr ss:[ebp-4],0
push 0
push 1
call oglmdi2_vs7.407141
pop ecx
pop ecx
jmp oglmdi2_vs7.404CBF
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
or dword ptr ss:[ebp-4],FFFFFFFF
push 3
call dword ptr ds:[<&ExitProcess>]
int3 
cmp ecx,dword ptr ds:[411150]
jne oglmdi2_vs7.404CD5
ret 
jmp oglmdi2_vs7.404C9B
int3 
int3 
push ebp
mov ebp,esp
sub esp,20
and esp,FFFFFFF0
fld st(0
fst dword ptr ss:[esp+18]
fistp qword ptr ss:[esp+10]
fild qword ptr ss:[esp+10]
mov edx,dword ptr ss:[esp+18]
mov eax,dword ptr ss:[esp+10]
test eax,eax
je oglmdi2_vs7.404D3B
fsubp st(1)
test edx,edx
jns oglmdi2_vs7.404D23
fstp dword ptr ss:[esp]
mov ecx,dword ptr ss:[esp]
xor ecx,80000000
add ecx,7FFFFFFF
adc eax,0
mov edx,dword ptr ss:[esp+14]
adc edx,0
jmp oglmdi2_vs7.404D4F
fstp dword ptr ss:[esp]
mov ecx,dword ptr ss:[esp]
add ecx,7FFFFFFF
sbb eax,0
mov edx,dword ptr ss:[esp+14]
sbb edx,0
jmp oglmdi2_vs7.404D4F
mov edx,dword ptr ss:[esp+14]
test edx,7FFFFFFF
jne oglmdi2_vs7.404CFF
fstp dword ptr ss:[esp+18]
fstp dword ptr ss:[esp+18]
leave 
ret 
push 10
push oglmdi2_vs7.40E528
call oglmdi2_vs7.406308
xor eax,eax
mov dword ptr ss:[ebp-1C],eax
mov dword ptr ss:[ebp-4],eax
mov dword ptr ss:[ebp-20],eax
mov eax,dword ptr ss:[ebp-20]
cmp eax,dword ptr ss:[ebp+10]
jge oglmdi2_vs7.404D83
mov esi,dword ptr ss:[ebp+8]
mov ecx,esi
call dword ptr ss:[ebp+14]
add esi,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp+8],esi
inc dword ptr ss:[ebp-20]
jmp oglmdi2_vs7.404D68
mov dword ptr ss:[ebp-1C],1
or dword ptr ss:[ebp-4],FFFFFFFF
call oglmdi2_vs7.404D9B
call oglmdi2_vs7.406343
ret 14
cmp dword ptr ss:[ebp-1C],0
jne oglmdi2_vs7.404DB2
push dword ptr ss:[ebp+18]
push dword ptr ss:[ebp-20]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.404B35
ret 
push ebp
mov ebp,esp
push ecx
push ebx
mov eax,dword ptr ss:[ebp+C]
add eax,C
mov dword ptr ss:[ebp-4],eax
mov ebx,dword ptr fs:[0]
mov eax,dword ptr ds:[ebx]
mov dword ptr fs:[0],eax
mov eax,dword ptr ss:[ebp+8]
mov ebx,dword ptr ss:[ebp+C]
mov esp,dword ptr ds:[ebx-4]
mov ebp,dword ptr ss:[ebp-4]
jmp eax
pop ebx
leave 
ret 8
pop eax
pop ecx
xchg dword ptr ss:[esp],eax
jmp eax
push ebp
mov ebp,esp
push ecx
push ecx
push ebx
push esi
push edi
mov esi,dword ptr fs:[0]
mov dword ptr ss:[ebp-4],esi
mov dword ptr ss:[ebp-8],oglmdi2_vs7.404E13
push 0
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp-8]
push dword ptr ss:[ebp+8]
call <oglmdi2_vs7.RtlUnwind>
mov eax,dword ptr ss:[ebp+C]
mov eax,dword ptr ds:[eax+4]
and eax,FFFFFFFD
mov ecx,dword ptr ss:[ebp+C]
mov dword ptr ds:[ecx+4],eax
mov edi,dword ptr fs:[0]
mov ebx,dword ptr ss:[ebp-4]
mov dword ptr ds:[ebx],edi
mov dword ptr fs:[0],ebx
pop edi
pop esi
pop ebx
leave 
ret 8
push ebp
mov ebp,esp
sub esp,4
push ebx
push esi
push edi
cld 
mov dword ptr ss:[ebp-4],eax
xor eax,eax
push eax
push eax
push eax
push dword ptr ss:[ebp-4]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.407A24
add esp,20
mov dword ptr ss:[ebp-4],eax
pop edi
pop esi
pop ebx
mov eax,dword ptr ss:[ebp-4]
mov esp,ebp
pop ebp
ret 
cld 
mov eax,dword ptr ss:[esp+8]
push 0
push eax
push dword ptr ds:[eax+10]
push dword ptr ds:[eax+8]
push 0
push dword ptr ss:[esp+20]
push dword ptr ds:[eax+C]
push dword ptr ss:[esp+20]
call oglmdi2_vs7.407A24
add esp,20
ret 
push ebp
mov ebp,esp
push ebx
cld 
mov eax,dword ptr ss:[ebp+8]
mov eax,dword ptr ds:[eax+4]
and eax,66
test eax,eax
je oglmdi2_vs7.404EB7
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ds:[eax+24],1
xor eax,eax
inc eax
jmp oglmdi2_vs7.404F04
push 1
mov eax,dword ptr ss:[ebp+C]
push dword ptr ds:[eax+14]
mov eax,dword ptr ss:[ebp+C]
push dword ptr ds:[eax+10]
mov eax,dword ptr ss:[ebp+C]
push dword ptr ds:[eax+8]
push 0
push dword ptr ss:[ebp+10]
mov eax,dword ptr ss:[ebp+C]
push dword ptr ds:[eax+C]
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.407A24
add esp,20
mov eax,dword ptr ss:[ebp+C]
cmp dword ptr ds:[eax+24],0
jne oglmdi2_vs7.404EF5
push dword ptr ss:[ebp+8]
push dword ptr ss:[ebp+C]
call oglmdi2_vs7.404DEA
mov ebx,dword ptr ss:[ebp+C]
mov esp,dword ptr ds:[ebx+1C]
mov ebp,dword ptr ds:[ebx+20]
jmp dword ptr ds:[ebx+18]
xor eax,eax
inc eax
pop ebx
pop ebp
ret 
push ebp
mov ebp,esp
push ecx
cmp dword ptr ss:[ebp+C],0
push ebx
push esi
push edi
mov edi,dword ptr ss:[ebp+8]
mov esi,dword ptr ds:[edi+C]
mov ebx,dword ptr ds:[edi+10]
mov eax,esi
mov dword ptr ss:[ebp-4],eax
mov dword ptr ss:[ebp+8],esi
jl oglmdi2_vs7.404F5D
cmp esi,FFFFFFFF
jne oglmdi2_vs7.404F2F
call oglmdi2_vs7.4062D9
mov ecx,dword ptr ss:[ebp+10]
dec esi
lea eax,dword ptr ds:[esi+esi*4]
lea eax,dword ptr ds:[ebx+eax*4]
cmp dword ptr ds:[eax+4],ecx
jge oglmdi2_vs7.404F43
cmp ecx,dword ptr ds:[eax+8]
jle oglmdi2_vs7.404F48
cmp esi,FFFFFFFF
jne oglmdi2_vs7.404F54
mov eax,dword ptr ss:[ebp+8]
dec dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-4],eax
mov dword ptr ss:[ebp+8],esi
cmp dword ptr ss:[ebp+C],0
jge oglmdi2_vs7.404F25
mov eax,dword ptr ss:[ebp-4]
mov ecx,dword ptr ss:[ebp+14]
inc esi
mov dword ptr ds:[ecx],esi
mov ecx,dword ptr ss:[ebp+18]
mov dword ptr ds:[ecx],eax
cmp eax,dword ptr ds:[edi+C]
ja oglmdi2_vs7.404F71
cmp esi,eax
jbe oglmdi2_vs7.404F76
call oglmdi2_vs7.4062D9
pop edi
lea eax,dword ptr ds:[esi+esi*4]
pop esi
lea eax,dword ptr ds:[ebx+eax*4]
pop ebx
leave 
ret 
mov eax,dword ptr ss:[esp+4]
mov ecx,dword ptr ss:[esp+8]
mov dword ptr ds:[eax],ecx
mov ecx,dword ptr ds:[4121D8]
mov dword ptr ds:[eax+4],ecx
mov dword ptr ds:[4121D8],eax
ret 
mov eax,dword ptr ds:[4121D8]
jmp oglmdi2_vs7.404FAC
mov ecx,dword ptr ds:[eax]
cmp ecx,dword ptr ss:[esp+4]
je oglmdi2_vs7.404FB2
mov eax,dword ptr ds:[eax+4]
test eax,eax
jne oglmdi2_vs7.404FA1
inc eax
ret 
xor eax,eax
ret 
mov edx,dword ptr ss:[esp+4]
mov eax,dword ptr ds:[4121D8]
cmp edx,eax
jne oglmdi2_vs7.404FCB
mov eax,dword ptr ds:[edx+4]
mov dword ptr ds:[4121D8],eax
ret 
mov ecx,eax
add eax,4
jmp oglmdi2_vs7.404FDD
mov eax,dword ptr ds:[eax]
cmp edx,eax
je oglmdi2_vs7.404FE7
mov ecx,eax
lea eax,dword ptr ds:[ecx+4]
cmp dword ptr ds:[eax],0
jne oglmdi2_vs7.404FD2
jmp oglmdi2_vs7.4062D9
mov eax,dword ptr ds:[edx+4]
mov dword ptr ds:[ecx+4],eax
ret 
push ebp
mov ebp,esp
sub esp,14
mov eax,dword ptr ss:[ebp+C]
and dword ptr ss:[ebp-14],0
mov ecx,dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-C],eax
mov eax,dword ptr ss:[ebp+14]
inc eax
mov dword ptr ss:[ebp-10],oglmdi2_vs7.404E72
mov dword ptr ss:[ebp-8],ecx
mov dword ptr ss:[ebp-4],eax
mov eax,dword ptr fs:[0]
mov dword ptr ss:[ebp-14],eax
lea eax,dword ptr ss:[ebp-14]
mov dword ptr fs:[0],eax
push dword ptr ss:[ebp+18]
push ecx
push dword ptr ss:[ebp+10]
call oglmdi2_vs7.407AD0
mov ecx,eax
mov eax,dword ptr ss:[ebp-14]
mov dword ptr fs:[0],eax
mov eax,ecx
leave 
ret 
push ebp
mov ebp,esp
sub esp,34
push ebx
and dword ptr ss:[ebp-28],0
mov dword ptr ss:[ebp-24],oglmdi2_vs7.404E96
mov eax,dword ptr ss:[ebp+18]
mov dword ptr ss:[ebp-20],eax
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-1C],eax
mov eax,dword ptr ss:[ebp+1C]
mov dword ptr ss:[ebp-18],eax
mov eax,dword ptr ss:[ebp+20]
mov dword ptr ss:[ebp-14],eax
and dword ptr ss:[ebp-10],0
and dword ptr ss:[ebp-C],0
and dword ptr ss:[ebp-8],0
and dword ptr ss:[ebp-4],0
mov dword ptr ss:[ebp-10],oglmdi2_vs7.4050C0
mov dword ptr ss:[ebp-C],esp
mov dword ptr ss:[ebp-8],ebp
mov eax,dword ptr fs:[0]
mov dword ptr ss:[ebp-28],eax
lea eax,dword ptr ss:[ebp-28]
mov dword ptr fs:[0],eax
mov dword ptr ss:[ebp-34],1
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-30],eax
mov eax,dword ptr ss:[ebp+10]
mov dword ptr ss:[ebp-2C],eax
lea eax,dword ptr ss:[ebp-30]
push eax
mov eax,dword ptr ss:[ebp+8]
push dword ptr ds:[eax]
call dword ptr ds:[4121FC]
pop ecx
pop ecx
and dword ptr ss:[ebp-34],0
cmp dword ptr ss:[ebp-4],0
je oglmdi2_vs7.4050DD
mov ebx,dword ptr fs:[0]
mov eax,dword ptr ds:[ebx]
mov ebx,dword ptr ss:[ebp-28]
mov dword ptr ds:[ebx],eax
mov dword ptr fs:[0],ebx
jmp oglmdi2_vs7.4050E6
mov eax,dword ptr ss:[ebp-28]
mov dword ptr fs:[0],eax
mov eax,dword ptr ss:[ebp-34]
pop ebx
leave 
ret 
push ebp
mov ebp,esp
push ebx
push esi
push edi
push ebp
push 0
push 0
push oglmdi2_vs7.405104
push dword ptr ss:[ebp+8]
call <oglmdi2_vs7.RtlUnwind>
pop ebp
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret 
mov ecx,dword ptr ss:[esp+4]
test dword ptr ds:[ecx+4],6
mov eax,1
je oglmdi2_vs7.40512D
mov eax,dword ptr ss:[esp+8]
mov edx,dword ptr ss:[esp+10]
mov dword ptr ds:[edx],eax
mov eax,3
ret 
push ebx
push esi
push edi
mov eax,dword ptr ss:[esp+10]
push eax
push FFFFFFFE
push oglmdi2_vs7.40510C
push dword ptr fs:[0]
mov dword ptr fs:[0],esp
mov eax,dword ptr ss:[esp+20]
mov ebx,dword ptr ds:[eax+8]
mov esi,dword ptr ds:[eax+C]
cmp esi,FFFFFFFF
je oglmdi2_vs7.405188
cmp esi,dword ptr ss:[esp+24]
je oglmdi2_vs7.405188
lea esi,dword ptr ds:[esi+esi*2]
mov ecx,dword ptr ds:[ebx+esi*4]
mov dword ptr ss:[esp+8],ecx
mov dword ptr ds:[eax+C],ecx
cmp dword ptr ds:[ebx+esi*4+4],0
jne oglmdi2_vs7.405186
push 101
mov eax,dword ptr ds:[ebx+esi*4+8]
call oglmdi2_vs7.4051C2
call dword ptr ds:[ebx+esi*4+8]
jmp oglmdi2_vs7.40514B
pop dword ptr fs:[0]
add esp,C
pop edi
pop esi
pop ebx
ret 
xor eax,eax
mov ecx,dword ptr fs:[0]
cmp dword ptr ds:[ecx+4],oglmdi2_vs7.40510C
jne oglmdi2_vs7.4051B8
mov edx,dword ptr ds:[ecx+C]
mov edx,dword ptr ds:[edx+C]
cmp dword ptr ds:[ecx+8],edx
jne oglmdi2_vs7.4051B8
mov eax,1
ret 
push ebx
push ecx
mov ebx,oglmdi2_vs7.411154
jmp oglmdi2_vs7.4051CC
push ebx
push ecx
mov ebx,oglmdi2_vs7.411154
mov ecx,dword ptr ss:[ebp+8]
mov dword ptr ds:[ebx+8],ecx
mov dword ptr ds:[ebx+4],eax
mov dword ptr ds:[ebx+C],ebp
pop ecx
pop ebx
ret 4
push esi
mov esi,dword ptr ss:[esp+8]
test esi,esi
je oglmdi2_vs7.405210
cmp dword ptr ds:[4128D0],3
push esi
jne oglmdi2_vs7.405202
call oglmdi2_vs7.407BCF
test eax,eax
pop ecx
push esi
je oglmdi2_vs7.405202
push eax
call oglmdi2_vs7.407BFA
pop ecx
pop ecx
pop esi
ret 
push 0
push dword ptr ds:[4128CC]
call dword ptr ds:[<&HeapFree>]
pop esi
ret 
push esi
mov esi,dword ptr ss:[esp+8]
mov eax,dword ptr ds:[esi+C]
push edi
or edi,FFFFFFFF
test al,40
je oglmdi2_vs7.405227
or eax,FFFFFFFF
jmp oglmdi2_vs7.405261
test al,83
je oglmdi2_vs7.40525F
push esi
call oglmdi2_vs7.408788
push esi
mov edi,eax
call oglmdi2_vs7.40875D
push dword ptr ds:[esi+10]
call oglmdi2_vs7.4086AA
add esp,C
test eax,eax
jge oglmdi2_vs7.40524D
or edi,FFFFFFFF
jmp oglmdi2_vs7.40525F
mov eax,dword ptr ds:[esi+1C]
test eax,eax
je oglmdi2_vs7.40525F
push eax
call oglmdi2_vs7.4051DA
and dword ptr ds:[esi+1C],0
pop ecx
mov eax,edi
and dword ptr ds:[esi+C],0
pop edi
pop esi
ret 
cmp dword ptr ds:[4128D0],3
push esi
mov esi,dword ptr ss:[esp+8]
jne oglmdi2_vs7.405289
cmp esi,dword ptr ds:[4128BC]
ja oglmdi2_vs7.405289
push esi
call oglmdi2_vs7.4083AE
test eax,eax
pop ecx
jne oglmdi2_vs7.4052AC
test esi,esi
jne oglmdi2_vs7.40528E
inc esi
cmp dword ptr ds:[4128D0],1
je oglmdi2_vs7.40529D
add esi,F
and esi,FFFFFFF0
push esi
push 0
push dword ptr ds:[4128CC]
call dword ptr ds:[<&RtlAllocateHeap>]
pop esi
ret 
cmp dword ptr ss:[esp+4],FFFFFFE0
ja oglmdi2_vs7.4052D7
push dword ptr ss:[esp+4]
call oglmdi2_vs7.405268
test eax,eax
pop ecx
jne oglmdi2_vs7.4052D9
cmp dword ptr ss:[esp+8],eax
je oglmdi2_vs7.4052D9
push dword ptr ss:[esp+4]
call oglmdi2_vs7.406100
test eax,eax
pop ecx
jne oglmdi2_vs7.4052B5
xor eax,eax
ret 
push dword ptr ds:[412224]
push dword ptr ss:[esp+8]
call oglmdi2_vs7.4052AE
pop ecx
pop ecx
ret 
push ebp
mov ebp,esp
push ecx
push ecx
push ebx
mov ebx,dword ptr ss:[ebp+8]
push edi
mov edi,dword ptr ss:[ebp+C]
imul edi,dword ptr ss:[ebp+10]
test edi,edi
mov ecx,edi
mov dword ptr ss:[ebp-8],edi
mov dword ptr ss:[ebp+8],ecx
jne oglmdi2_vs7.405310
xor eax,eax
jmp oglmdi2_vs7.4053BB
push esi
mov esi,dword ptr ss:[ebp+14]
test word ptr ds:[esi+C],10C
je oglmdi2_vs7.405324
mov eax,dword ptr ds:[esi+18]
mov dword ptr ss:[ebp-4],eax
jmp oglmdi2_vs7.405330
mov dword ptr ss:[ebp-4],1000
jmp oglmdi2_vs7.405330
mov ecx,dword ptr ss:[ebp+8]
test word ptr ds:[esi+C],10C
je oglmdi2_vs7.405362
mov eax,dword ptr ds:[esi+4]
test eax,eax
je oglmdi2_vs7.405362
cmp ecx,eax
mov edi,ecx
jb oglmdi2_vs7.405347
mov edi,eax
push edi
push dword ptr ds:[esi]
push ebx
call oglmdi2_vs7.405930
sub dword ptr ss:[ebp+8],edi
sub dword ptr ds:[esi+4],edi
add dword ptr ds:[esi],edi
add esp,C
add ebx,edi
mov edi,dword ptr ss:[ebp-8]
jmp oglmdi2_vs7.4053AD
cmp ecx,dword ptr ss:[ebp-4]
jb oglmdi2_vs7.405395
cmp dword ptr ss:[ebp-4],0
mov eax,ecx
je oglmdi2_vs7.405378
xor edx,edx
div dword ptr ss:[ebp-4]
mov eax,ecx
sub eax,edx
push eax
push ebx
push dword ptr ds:[esi+10]
call oglmdi2_vs7.408974
add esp,C
test eax,eax
je oglmdi2_vs7.4053BF
cmp eax,FFFFFFFF
je oglmdi2_vs7.4053CF
sub dword ptr ss:[ebp+8],eax
add ebx,eax
jmp oglmdi2_vs7.4053AD
push esi
call oglmdi2_vs7.408896
cmp eax,FFFFFFFF
pop ecx
je oglmdi2_vs7.4053C3
mov byte ptr ds:[ebx],al
mov eax,dword ptr ds:[esi+18]
inc ebx
dec dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-4],eax
cmp dword ptr ss:[ebp+8],0
jne oglmdi2_vs7.40532D
mov eax,dword ptr ss:[ebp+10]
pop esi
pop edi
pop ebx
leave 
ret 
or dword ptr ds:[esi+C],10
mov eax,edi
sub eax,dword ptr ss:[ebp+8]
xor edx,edx
div dword ptr ss:[ebp+C]
jmp oglmdi2_vs7.4053BA
or dword ptr ds:[esi+C],20
jmp oglmdi2_vs7.4053C3
call oglmdi2_vs7.408E53
test eax,eax
jne oglmdi2_vs7.4053E9
mov dword ptr ds:[412228],18
ret 
push eax
push dword ptr ss:[esp+10]
push dword ptr ss:[esp+10]
push dword ptr ss:[esp+10]
call oglmdi2_vs7.408B54
add esp,10
ret 
push 40
push dword ptr ss:[esp+C]
push dword ptr ss:[esp+C]
call oglmdi2_vs7.4053D5
add esp,C
ret 
mov eax,dword ptr ds:[4138E0]
test eax,eax
push esi
push 14
pop esi
jne oglmdi2_vs7.405426
mov eax,200
jmp oglmdi2_vs7.40542C
cmp eax,esi
jge oglmdi2_vs7.405431
mov eax,esi
mov dword ptr ds:[4138E0],eax
push 4
push eax
call oglmdi2_vs7.409070
test eax,eax
pop ecx
pop ecx
mov dword ptr ds:[4128D8],eax
jne oglmdi2_vs7.405462
push 4
push esi
mov dword ptr ds:[4138E0],esi
call oglmdi2_vs7.409070
test eax,eax
pop ecx
pop ecx
mov dword ptr ds:[4128D8],eax
jne oglmdi2_vs7.405462
push 1A
pop eax
pop esi
ret 
xor edx,edx
mov ecx,oglmdi2_vs7.411168
jmp oglmdi2_vs7.405470
mov eax,dword ptr ds:[4128D8]
mov dword ptr ds:[edx+eax],ecx
add ecx,20
add edx,4
cmp ecx,oglmdi2_vs7.4113E8
jl oglmdi2_vs7.40546B
xor edx,edx
mov ecx,oglmdi2_vs7.411178
mov eax,edx
sar eax,5
mov eax,dword ptr ds:[eax*4+4127A0]
mov esi,edx
and esi,1F
mov eax,dword ptr ds:[eax+esi*8]
cmp eax,FFFFFFFF
je oglmdi2_vs7.4054A5
test eax,eax
jne oglmdi2_vs7.4054A8
or dword ptr ds:[ecx],FFFFFFFF
add ecx,20
inc edx
cmp ecx,oglmdi2_vs7.4111D8
jl oglmdi2_vs7.405488
xor eax,eax
pop esi
ret 
call oglmdi2_vs7.40888D
cmp byte ptr ds:[41226C],0
je oglmdi2_vs7.4054CB
jmp oglmdi2_vs7.4090EB
ret 
push ebx
push ebp
push esi
push edi
or ebx,FFFFFFFF
xor esi,esi
xor edx,edx
mov ecx,oglmdi2_vs7.4127A0
mov edi,100
mov eax,dword ptr ds:[ecx]
test eax,eax
je oglmdi2_vs7.405524
lea ebp,dword ptr ds:[eax+100]
jmp oglmdi2_vs7.4054FC
test byte ptr ds:[eax+4],1
je oglmdi2_vs7.405502
mov ebp,dword ptr ds:[ecx]
add eax,8
add ebp,edi
cmp eax,ebp
jb oglmdi2_vs7.4054EF
jmp oglmdi2_vs7.405513
or dword ptr ds:[eax],FFFFFFFF
sub eax,dword ptr ds:[ecx]
sar eax,3
add eax,edx
mov ebx,eax
cmp ebx,FFFFFFFF
jne oglmdi2_vs7.405562
add ecx,4
inc esi
add edx,20
cmp ecx,oglmdi2_vs7.4128A0
jl oglmdi2_vs7.4054E1
jmp oglmdi2_vs7.405562
push edi
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
je oglmdi2_vs7.405562
add dword ptr ds:[412780],20
lea ecx,dword ptr ds:[esi*4+4127A0]
mov dword ptr ds:[ecx],eax
lea edx,dword ptr ds:[eax+100]
jmp oglmdi2_vs7.405559
and byte ptr ds:[eax+4],0
or dword ptr ds:[eax],FFFFFFFF
mov byte ptr ds:[eax+5],A
mov edx,dword ptr ds:[ecx]
add eax,8
add edx,edi
cmp eax,edx
jb oglmdi2_vs7.405547
shl esi,5
mov ebx,esi
pop edi
pop esi
pop ebp
mov eax,ebx
pop ebx
ret 
mov eax,dword ptr ss:[esp+4]
cmp eax,dword ptr ds:[412780]
push esi
push edi
jae oglmdi2_vs7.4055C9
mov ecx,eax
sar ecx,5
mov esi,eax
and esi,1F
lea edi,dword ptr ds:[ecx*4+4127A0]
mov ecx,dword ptr ds:[edi]
shl esi,3
cmp dword ptr ds:[esi+ecx],FFFFFFFF
jne oglmdi2_vs7.4055C9
cmp dword ptr ds:[4113EC],1
push ebx
mov ebx,dword ptr ss:[esp+14]
jne oglmdi2_vs7.4055BF
sub eax,0
je oglmdi2_vs7.4055B6
dec eax
je oglmdi2_vs7.4055B1
dec eax
jne oglmdi2_vs7.4055BF
push ebx
push FFFFFFF4
jmp oglmdi2_vs7.4055B9
push ebx
push FFFFFFF5
jmp oglmdi2_vs7.4055B9
push ebx
push FFFFFFF6
call dword ptr ds:[<&SetStdHandle>]
mov eax,dword ptr ds:[edi]
mov dword ptr ds:[esi+eax],ebx
xor eax,eax
pop ebx
jmp oglmdi2_vs7.4055DD
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
pop edi
pop esi
ret 
mov ecx,dword ptr ss:[esp+4]
cmp ecx,dword ptr ds:[412780]
push esi
push edi
jae oglmdi2_vs7.405643
mov eax,ecx
sar eax,5
mov esi,ecx
lea edi,dword ptr ds:[eax*4+4127A0]
mov eax,dword ptr ds:[edi]
and esi,1F
shl esi,3
add eax,esi
test byte ptr ds:[eax+4],1
je oglmdi2_vs7.405643
cmp dword ptr ds:[eax],FFFFFFFF
je oglmdi2_vs7.405643
cmp dword ptr ds:[4113EC],1
jne oglmdi2_vs7.405639
xor eax,eax
sub ecx,eax
je oglmdi2_vs7.405630
dec ecx
je oglmdi2_vs7.40562B
dec ecx
jne oglmdi2_vs7.405639
push eax
push FFFFFFF4
jmp oglmdi2_vs7.405633
push eax
push FFFFFFF5
jmp oglmdi2_vs7.405633
push eax
push FFFFFFF6
call dword ptr ds:[<&SetStdHandle>]
mov eax,dword ptr ds:[edi]
or dword ptr ds:[esi+eax],FFFFFFFF
xor eax,eax
jmp oglmdi2_vs7.405657
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
pop edi
pop esi
ret 
mov eax,dword ptr ss:[esp+4]
cmp eax,dword ptr ds:[412780]
jae oglmdi2_vs7.405681
mov ecx,eax
sar ecx,5
mov ecx,dword ptr ds:[ecx*4+4127A0]
and eax,1F
lea eax,dword ptr ds:[ecx+eax*8]
test byte ptr ds:[eax+4],1
je oglmdi2_vs7.405681
mov eax,dword ptr ds:[eax]
ret 
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
ret 
cmp dword ptr ds:[4121E8],1
jne oglmdi2_vs7.4056A4
call oglmdi2_vs7.409319
push dword ptr ss:[esp+4]
call oglmdi2_vs7.4091A2
push FF
call dword ptr ds:[4113E8]
pop ecx
pop ecx
ret 
push 60
push oglmdi2_vs7.40E538
call oglmdi2_vs7.406308
mov edi,94
mov eax,edi
call oglmdi2_vs7.4099B0
mov dword ptr ss:[ebp-18],esp
mov esi,esp
mov dword ptr ds:[esi],edi
push esi
call dword ptr ds:[<&GetVersionExA>]
mov ecx,dword ptr ds:[esi+10]
mov dword ptr ds:[412234],ecx
mov eax,dword ptr ds:[esi+4]
mov dword ptr ds:[412240],eax
mov edx,dword ptr ds:[esi+8]
mov dword ptr ds:[412244],edx
mov esi,dword ptr ds:[esi+C]
and esi,7FFF
mov dword ptr ds:[412238],esi
cmp ecx,2
je oglmdi2_vs7.40571B
or esi,8000
mov dword ptr ds:[412238],esi
shl eax,8
add eax,edx
mov dword ptr ds:[41223C],eax
xor esi,esi
push esi
mov edi,dword ptr ds:[<&GetModuleHandleA>]
call edi
cmp word ptr ds:[eax],5A4D
jne oglmdi2_vs7.405756
mov ecx,dword ptr ds:[eax+3C]
add ecx,eax
cmp dword ptr ds:[ecx],4550
jne oglmdi2_vs7.405756
movzx eax,word ptr ds:[ecx+18]
cmp eax,10B
je oglmdi2_vs7.40576E
cmp eax,20B
je oglmdi2_vs7.40575B
mov dword ptr ss:[ebp-1C],esi
jmp oglmdi2_vs7.405782
cmp dword ptr ds:[ecx+84],E
jbe oglmdi2_vs7.405756
xor eax,eax
cmp dword ptr ds:[ecx+F8],esi
jmp oglmdi2_vs7.40577C
cmp dword ptr ds:[ecx+74],E
jbe oglmdi2_vs7.405756
xor eax,eax
cmp dword ptr ds:[ecx+E8],esi
setne al
mov dword ptr ss:[ebp-1C],eax
push esi
call oglmdi2_vs7.407B36
pop ecx
test eax,eax
jne oglmdi2_vs7.4057AE
cmp dword ptr ds:[4121E8],1
jne oglmdi2_vs7.40579B
call oglmdi2_vs7.409319
push 1C
call oglmdi2_vs7.4091A2
push FF
call oglmdi2_vs7.408CBC
pop ecx
pop ecx
call oglmdi2_vs7.409923
mov dword ptr ss:[ebp-4],esi
call oglmdi2_vs7.408EC5
test eax,eax
jge oglmdi2_vs7.4057C7
push 1B
call oglmdi2_vs7.405696
pop ecx
call dword ptr ds:[<&GetCommandLineA>]
mov dword ptr ds:[4128D4],eax
call oglmdi2_vs7.409801
mov dword ptr ds:[4121E0],eax
call oglmdi2_vs7.40975F
test eax,eax
jge oglmdi2_vs7.4057ED
push 8
call oglmdi2_vs7.405696
pop ecx
call oglmdi2_vs7.40952C
test eax,eax
jge oglmdi2_vs7.4057FE
push 9
call oglmdi2_vs7.405696
pop ecx
call oglmdi2_vs7.408CEC
mov dword ptr ss:[ebp-20],eax
cmp eax,esi
je oglmdi2_vs7.405811
push eax
call oglmdi2_vs7.405696
pop ecx
mov dword ptr ss:[ebp-38],esi
lea eax,dword ptr ss:[ebp-64]
push eax
call dword ptr ds:[<&GetStartupInfoA>]
call oglmdi2_vs7.4094C3
mov dword ptr ss:[ebp-68],eax
test byte ptr ss:[ebp-38],1
je oglmdi2_vs7.405832
movzx eax,word ptr ss:[ebp-34]
jmp oglmdi2_vs7.405835
push A
pop eax
push eax
push dword ptr ss:[ebp-68]
push esi
push esi
call edi
push eax
call oglmdi2_vs7.404070
mov edi,eax
mov dword ptr ss:[ebp-6C],edi
cmp dword ptr ss:[ebp-1C],esi
jne oglmdi2_vs7.405853
push edi
call oglmdi2_vs7.408E13
call oglmdi2_vs7.408E35
jmp oglmdi2_vs7.405885
mov eax,dword ptr ss:[ebp-14]
mov ecx,dword ptr ds:[eax]
mov ecx,dword ptr ds:[ecx]
mov dword ptr ss:[ebp-70],ecx
push eax
push ecx
call oglmdi2_vs7.409352
pop ecx
pop ecx
ret 
mov esp,dword ptr ss:[ebp-18]
mov edi,dword ptr ss:[ebp-70]
cmp dword ptr ss:[ebp-1C],0
jne oglmdi2_vs7.405880
push edi
call oglmdi2_vs7.408E24
call oglmdi2_vs7.408E44
or dword ptr ss:[ebp-4],FFFFFFFF
mov eax,edi
lea esp,dword ptr ss:[ebp-7C]
call oglmdi2_vs7.406343
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov ecx,dword ptr ss:[esp+4]
test ecx,3
je oglmdi2_vs7.4058D0
mov al,byte ptr ds:[ecx]
add ecx,1
test al,al
je oglmdi2_vs7.405903
test ecx,3
jne oglmdi2_vs7.4058AC
add eax,0
lea esp,dword ptr ss:[esp]
lea esp,dword ptr ss:[esp]
mov eax,dword ptr ds:[ecx]
mov edx,7EFEFEFF
add edx,eax
xor eax,FFFFFFFF
xor eax,edx
add ecx,4
test eax,81010100
je oglmdi2_vs7.4058D0
mov eax,dword ptr ds:[ecx-4]
test al,al
je oglmdi2_vs7.405921
test ah,ah
je oglmdi2_vs7.405917
test eax,FF0000
je oglmdi2_vs7.40590D
test eax,FF000000
je oglmdi2_vs7.405903
jmp oglmdi2_vs7.4058D0
lea eax,dword ptr ds:[ecx-1]
mov ecx,dword ptr ss:[esp+4]
sub eax,ecx
ret 
lea eax,dword ptr ds:[ecx-2]
mov ecx,dword ptr ss:[esp+4]
sub eax,ecx
ret 
lea eax,dword ptr ds:[ecx-3]
mov ecx,dword ptr ss:[esp+4]
sub eax,ecx
ret 
lea eax,dword ptr ds:[ecx-4]
mov ecx,dword ptr ss:[esp+4]
sub eax,ecx
ret 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
push edi
push esi
mov esi,dword ptr ss:[ebp+C]
mov ecx,dword ptr ss:[ebp+10]
mov edi,dword ptr ss:[ebp+8]
mov eax,ecx
mov edx,ecx
add eax,esi
cmp edi,esi
jbe oglmdi2_vs7.405950
cmp edi,eax
jb oglmdi2_vs7.405ACC
test edi,3
jne oglmdi2_vs7.40596C
shr ecx,2
and edx,3
cmp ecx,8
jb oglmdi2_vs7.40598C
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp dword ptr ds:[edx*4+405A7C]
mov eax,edi
mov edx,3
sub ecx,4
jb oglmdi2_vs7.405984
and eax,3
add ecx,eax
jmp dword ptr ds:[eax*4+405990]
jmp dword ptr ds:[ecx*4+405A8C]
nop 
jmp dword ptr ds:[ecx*4+405A10]
nop 
mov al,byte ptr ds:[CC004059]
pop ecx
inc eax
add al,dh
pop ecx
inc eax
add byte ptr ds:[ebx],ah
ror dword ptr ds:[edx-75F877FA],1
inc esi
add dword ptr ds:[eax+468A0147],ecx
add al,cl
jmp 287E1B7
add esi,3
add edi,3
cmp ecx,8
jb oglmdi2_vs7.40598C
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp dword ptr ds:[edx*4+405A7C]
lea ecx,dword ptr ds:[ecx]
and edx,ecx
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
mov al,byte ptr ds:[esi+1]
shr ecx,2
mov byte ptr ds:[edi+1],al
add esi,2
add edi,2
cmp ecx,8
jb oglmdi2_vs7.40598C
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp dword ptr ds:[edx*4+405A7C]
nop 
and edx,ecx
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
add esi,1
shr ecx,2
add edi,1
cmp ecx,8
jb oglmdi2_vs7.40598C
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp dword ptr ds:[edx*4+405A7C]
lea ecx,dword ptr ds:[ecx]
jae oglmdi2_vs7.405A6C
inc eax
add byte ptr ds:[eax+5A],ah
inc eax
add byte ptr ds:[eax+5A],bl
inc eax
add byte ptr ds:[eax+5A],dl
inc eax
add byte ptr ds:[eax+5A],cl
inc eax
add byte ptr ds:[eax+5A],al
inc eax
add byte ptr ds:[eax],bh
pop edx
inc eax
add byte ptr ds:[eax],dh
pop edx
inc eax
add byte ptr ds:[ebx-761B71BC],cl
inc esp
???
in al,8B
inc esp
mov gs,eax
mov dword ptr ds:[edi+ecx*4-18],eax
mov eax,dword ptr ds:[esi+ecx*4-14]
mov dword ptr ds:[edi+ecx*4-14],eax
mov eax,dword ptr ds:[esi+ecx*4-10]
mov dword ptr ds:[edi+ecx*4-10],eax
mov eax,dword ptr ds:[esi+ecx*4-C]
mov dword ptr ds:[edi+ecx*4-C],eax
mov eax,dword ptr ds:[esi+ecx*4-8]
mov dword ptr ds:[edi+ecx*4-8],eax
mov eax,dword ptr ds:[esi+ecx*4-4]
mov dword ptr ds:[edi+ecx*4-4],eax
lea eax,dword ptr ds:[ecx*4]
add esi,eax
add edi,eax
jmp dword ptr ds:[edx*4+405A7C]
mov edi,edi
mov word ptr ds:[edx+40],ds
add byte ptr ds:[edx+ebx*2+5AA00040],dl
inc eax
add byte ptr ds:[edx+ebx*2+458B0040],dh
or byte ptr ds:[esi+5F],bl
leave 
ret 
nop 
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
nop 
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
mov al,byte ptr ds:[esi+1]
mov byte ptr ds:[edi+1],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
lea ecx,dword ptr ds:[ecx]
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
mov al,byte ptr ds:[esi+1]
mov byte ptr ds:[edi+1],al
mov al,byte ptr ds:[esi+2]
mov byte ptr ds:[edi+2],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
nop 
lea esi,dword ptr ds:[ecx+esi-4]
lea edi,dword ptr ds:[ecx+edi-4]
test edi,3
jne oglmdi2_vs7.405B00
shr ecx,2
and edx,3
cmp ecx,8
jb oglmdi2_vs7.405AF4
std 
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
cld 
jmp dword ptr ds:[edx*4+405C18]
mov edi,edi
neg ecx
jmp dword ptr ds:[ecx*4+405BC8]
lea ecx,dword ptr ds:[ecx]
mov eax,edi
mov edx,3
cmp ecx,4
jb oglmdi2_vs7.405B18
and eax,3
sub ecx,eax
jmp dword ptr ds:[eax*4+405B1C]
jmp dword ptr ds:[ecx*4+405C18]
nop 
sub al,5B
inc eax
add byte ptr ds:[eax+5B],dl
inc eax
add byte ptr ds:[eax+5B],bh
inc eax
add byte ptr ds:[edx-2EDCFCBA],cl
mov byte ptr ds:[edi+3],al
sub esi,1
shr ecx,2
sub edi,1
cmp ecx,8
jb oglmdi2_vs7.405AF4
std 
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
cld 
jmp dword ptr ds:[edx*4+405C18]
lea ecx,dword ptr ds:[ecx]
mov al,byte ptr ds:[esi+3]
and edx,ecx
mov byte ptr ds:[edi+3],al
mov al,byte ptr ds:[esi+2]
shr ecx,2
mov byte ptr ds:[edi+2],al
sub esi,2
sub edi,2
cmp ecx,8
jb oglmdi2_vs7.405AF4
std 
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
cld 
jmp dword ptr ds:[edx*4+405C18]
nop 
mov al,byte ptr ds:[esi+3]
and edx,ecx
mov byte ptr ds:[edi+3],al
mov al,byte ptr ds:[esi+2]
mov byte ptr ds:[edi+2],al
mov al,byte ptr ds:[esi+1]
shr ecx,2
mov byte ptr ds:[edi+1],al
sub esi,3
sub edi,3
cmp ecx,8
jb oglmdi2_vs7.405AF4
std 
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
cld 
jmp dword ptr ds:[edx*4+405C18]
lea ecx,dword ptr ds:[ecx]
int3 
pop ebx
inc eax
add ah,dl
pop ebx
inc eax
add ah,bl
pop ebx
inc eax
add ah,ah
pop ebx
inc eax
add ah,ch
pop ebx
inc eax
add ah,dh
pop ebx
inc eax
add ah,bh
pop ebx
inc eax
add byte ptr ds:[edi],cl
pop esp
inc eax
add byte ptr ds:[ebx-76E371BC],cl
inc esp
???
sbb al,8B
inc esp
mov ds,word ptr ds:[eax]
mov dword ptr ds:[edi+ecx*4+18],eax
mov eax,dword ptr ds:[esi+ecx*4+14]
mov dword ptr ds:[edi+ecx*4+14],eax
mov eax,dword ptr ds:[esi+ecx*4+10]
mov dword ptr ds:[edi+ecx*4+10],eax
mov eax,dword ptr ds:[esi+ecx*4+C]
mov dword ptr ds:[edi+ecx*4+C],eax
mov eax,dword ptr ds:[esi+ecx*4+8]
mov dword ptr ds:[edi+ecx*4+8],eax
mov eax,dword ptr ds:[esi+ecx*4+4]
mov dword ptr ds:[edi+ecx*4+4],eax
lea eax,dword ptr ds:[ecx*4]
add esi,eax
add edi,eax
jmp dword ptr ds:[edx*4+405C18]
mov edi,edi
sub byte ptr ds:[eax+eax*2],bl
xor byte ptr ds:[eax+eax*2],bl
inc eax
pop esp
inc eax
add byte ptr ss:[esp+ebx*2+40],dl
add byte ptr ds:[ebx+5F5E0845],cl
leave 
ret 
nop 
mov al,byte ptr ds:[esi+3]
mov byte ptr ds:[edi+3],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
lea ecx,dword ptr ds:[ecx]
mov al,byte ptr ds:[esi+3]
mov byte ptr ds:[edi+3],al
mov al,byte ptr ds:[esi+2]
mov byte ptr ds:[edi+2],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
nop 
mov al,byte ptr ds:[esi+3]
mov byte ptr ds:[edi+3],al
mov al,byte ptr ds:[esi+2]
mov byte ptr ds:[edi+2],al
mov al,byte ptr ds:[esi+1]
mov byte ptr ds:[edi+1],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
int3 
int3 
int3 
push ebp
mov ebp,esp
push edi
push esi
mov esi,dword ptr ss:[ebp+C]
mov ecx,dword ptr ss:[ebp+10]
mov edi,dword ptr ss:[ebp+8]
mov eax,ecx
mov edx,ecx
add eax,esi
cmp edi,esi
jbe oglmdi2_vs7.405C90
cmp edi,eax
jb oglmdi2_vs7.405E0C
test edi,3
jne oglmdi2_vs7.405CAC
shr ecx,2
and edx,3
cmp ecx,8
jb oglmdi2_vs7.405CCC
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp dword ptr ds:[edx*4+405DBC]
mov eax,edi
mov edx,3
sub ecx,4
jb oglmdi2_vs7.405CC4
and eax,3
add ecx,eax
jmp dword ptr ds:[eax*4+405CD0]
jmp dword ptr ds:[ecx*4+405DCC]
nop 
jmp dword ptr ds:[ecx*4+405D50]
nop 
loopne oglmdi2_vs7.405D32
inc eax
add byte ptr ds:[ebx*2+5D300040],cl
inc eax
add byte ptr ds:[ebx],ah
ror dword ptr ds:[edx-75F877FA],1
inc esi
add dword ptr ds:[eax+468A0147],ecx
add al,cl
jmp 287E4F7
add esi,3
add edi,3
cmp ecx,8
jb oglmdi2_vs7.405CCC
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp dword ptr ds:[edx*4+405DBC]
lea ecx,dword ptr ds:[ecx]
and edx,ecx
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
mov al,byte ptr ds:[esi+1]
shr ecx,2
mov byte ptr ds:[edi+1],al
add esi,2
add edi,2
cmp ecx,8
jb oglmdi2_vs7.405CCC
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp dword ptr ds:[edx*4+405DBC]
nop 
and edx,ecx
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
add esi,1
shr ecx,2
add edi,1
cmp ecx,8
jb oglmdi2_vs7.405CCC
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp dword ptr ds:[edx*4+405DBC]
lea ecx,dword ptr ds:[ecx]
mov bl,5D
inc eax
add byte ptr ds:[eax-67FFBFA3],ah
pop ebp
inc eax
add byte ptr ds:[eax-77FFBFA3],dl
pop ebp
inc eax
add byte ptr ds:[eax+7800405D],al
pop ebp
inc eax
add byte ptr ds:[eax+5D],dh
inc eax
add byte ptr ds:[ebx-761B71BC],cl
inc esp
???
in al,8B
inc esp
mov gs,eax
mov dword ptr ds:[edi+ecx*4-18],eax
mov eax,dword ptr ds:[esi+ecx*4-14]
mov dword ptr ds:[edi+ecx*4-14],eax
mov eax,dword ptr ds:[esi+ecx*4-10]
mov dword ptr ds:[edi+ecx*4-10],eax
mov eax,dword ptr ds:[esi+ecx*4-C]
mov dword ptr ds:[edi+ecx*4-C],eax
mov eax,dword ptr ds:[esi+ecx*4-8]
mov dword ptr ds:[edi+ecx*4-8],eax
mov eax,dword ptr ds:[esi+ecx*4-4]
mov dword ptr ds:[edi+ecx*4-4],eax
lea eax,dword ptr ds:[ecx*4]
add esi,eax
add edi,eax
jmp dword ptr ds:[edx*4+405DBC]
mov edi,edi
int3 
pop ebp
inc eax
add ah,dl
pop ebp
inc eax
add al,ah
pop ebp
inc eax
add ah,dh
pop ebp
inc eax
add byte ptr ds:[ebx+5F5E0845],cl
leave 
ret 
nop 
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
nop 
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
mov al,byte ptr ds:[esi+1]
mov byte ptr ds:[edi+1],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
lea ecx,dword ptr ds:[ecx]
mov al,byte ptr ds:[esi]
mov byte ptr ds:[edi],al
mov al,byte ptr ds:[esi+1]
mov byte ptr ds:[edi+1],al
mov al,byte ptr ds:[esi+2]
mov byte ptr ds:[edi+2],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
nop 
lea esi,dword ptr ds:[ecx+esi-4]
lea edi,dword ptr ds:[ecx+edi-4]
test edi,3
jne oglmdi2_vs7.405E40
shr ecx,2
and edx,3
cmp ecx,8
jb oglmdi2_vs7.405E34
std 
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
cld 
jmp dword ptr ds:[edx*4+405F58]
mov edi,edi
neg ecx
jmp dword ptr ds:[ecx*4+405F08]
lea ecx,dword ptr ds:[ecx]
mov eax,edi
mov edx,3
cmp ecx,4
jb oglmdi2_vs7.405E58
and eax,3
sub ecx,eax
jmp dword ptr ds:[eax*4+405E5C]
jmp dword ptr ds:[ecx*4+405F58]
nop 
insb byte ptr es:[edi],dx
pop esi
inc eax
add byte ptr ds:[eax-47FFBFA2],dl
pop esi
inc eax
add byte ptr ds:[edx-2EDCFCBA],cl
mov byte ptr ds:[edi+3],al
sub esi,1
shr ecx,2
sub edi,1
cmp ecx,8
jb oglmdi2_vs7.405E34
std 
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
cld 
jmp dword ptr ds:[edx*4+405F58]
lea ecx,dword ptr ds:[ecx]
mov al,byte ptr ds:[esi+3]
and edx,ecx
mov byte ptr ds:[edi+3],al
mov al,byte ptr ds:[esi+2]
shr ecx,2
mov byte ptr ds:[edi+2],al
sub esi,2
sub edi,2
cmp ecx,8
jb oglmdi2_vs7.405E34
std 
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
cld 
jmp dword ptr ds:[edx*4+405F58]
nop 
mov al,byte ptr ds:[esi+3]
and edx,ecx
mov byte ptr ds:[edi+3],al
mov al,byte ptr ds:[esi+2]
mov byte ptr ds:[edi+2],al
mov al,byte ptr ds:[esi+1]
shr ecx,2
mov byte ptr ds:[edi+1],al
sub esi,3
sub edi,3
cmp ecx,8
jb oglmdi2_vs7.405E34
std 
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
cld 
jmp dword ptr ds:[edx*4+405F58]
lea ecx,dword ptr ds:[ecx]
or al,5F
inc eax
add byte ptr ds:[edi+ebx*2],dl
inc eax
add byte ptr ds:[edi+ebx*2],bl
inc eax
add byte ptr ds:[edi+ebx*2],ah
inc eax
add byte ptr ds:[edi+ebx*2],ch
inc eax
add byte ptr ds:[edi+ebx*2],dh
inc eax
add byte ptr ds:[edi+ebx*2],bh
inc eax
add byte ptr ds:[edi+5F],cl
inc eax
add byte ptr ds:[ebx-76E371BC],cl
inc esp
???
sbb al,8B
inc esp
mov ds,word ptr ds:[eax]
mov dword ptr ds:[edi+ecx*4+18],eax
mov eax,dword ptr ds:[esi+ecx*4+14]
mov dword ptr ds:[edi+ecx*4+14],eax
mov eax,dword ptr ds:[esi+ecx*4+10]
mov dword ptr ds:[edi+ecx*4+10],eax
mov eax,dword ptr ds:[esi+ecx*4+C]
mov dword ptr ds:[edi+ecx*4+C],eax
mov eax,dword ptr ds:[esi+ecx*4+8]
mov dword ptr ds:[edi+ecx*4+8],eax
mov eax,dword ptr ds:[esi+ecx*4+4]
mov dword ptr ds:[edi+ecx*4+4],eax
lea eax,dword ptr ds:[ecx*4]
add esi,eax
add edi,eax
jmp dword ptr ds:[edx*4+405F58]
mov edi,edi
push 7000405F
pop edi
inc eax
add byte ptr ds:[eax-6BFFBFA1],al
pop edi
inc eax
add byte ptr ds:[ebx+5F5E0845],cl
leave 
ret 
nop 
mov al,byte ptr ds:[esi+3]
mov byte ptr ds:[edi+3],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
lea ecx,dword ptr ds:[ecx]
mov al,byte ptr ds:[esi+3]
mov byte ptr ds:[edi+3],al
mov al,byte ptr ds:[esi+2]
mov byte ptr ds:[edi+2],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
nop 
mov al,byte ptr ds:[esi+3]
mov byte ptr ds:[edi+3],al
mov al,byte ptr ds:[esi+2]
mov byte ptr ds:[edi+2],al
mov al,byte ptr ds:[esi+1]
mov byte ptr ds:[edi+1],al
mov eax,dword ptr ss:[ebp+8]
pop esi
pop edi
leave 
ret 
int3 
int3 
int3 
push FFFFFFFF
push eax
mov eax,dword ptr fs:[0]
push eax
mov eax,dword ptr ss:[esp+C]
mov dword ptr fs:[0],esp
mov dword ptr ss:[esp+C],ebp
lea ebp,dword ptr ss:[esp+C]
push eax
ret 
mov dword ptr ds:[ecx],oglmdi2_vs7.40E548
mov ecx,dword ptr ds:[ecx+4]
test ecx,ecx
je oglmdi2_vs7.405FE3
push ecx
call oglmdi2_vs7.4051DA
pop ecx
ret 
push esi
mov esi,ecx
call oglmdi2_vs7.405FCF
test byte ptr ss:[esp+8],1
je oglmdi2_vs7.405FFA
push esi
call oglmdi2_vs7.404B2B
pop ecx
mov eax,esi
pop esi
ret 4
push ebp
mov ebp,esp
sub esp,20
mov eax,dword ptr ss:[ebp+8]
push esi
push edi
push 8
pop ecx
mov esi,oglmdi2_vs7.40E54C
lea edi,dword ptr ss:[ebp-20]
rep movsd dword ptr es:[edi],dword ptr ds:[esi]
mov dword ptr ss:[ebp-8],eax
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-4],eax
lea eax,dword ptr ss:[ebp-C]
push eax
push dword ptr ss:[ebp-10]
push dword ptr ss:[ebp-1C]
push dword ptr ss:[ebp-20]
call dword ptr ds:[<&RaiseException>]
pop edi
pop esi
leave 
ret 8
push esi
push edi
mov edi,dword ptr ss:[esp+C]
mov esi,ecx
mov dword ptr ds:[esi],oglmdi2_vs7.40E570
push dword ptr ds:[edi]
call oglmdi2_vs7.4058A0
inc eax
push eax
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
pop ecx
mov dword ptr ds:[esi+4],eax
je oglmdi2_vs7.406069
push dword ptr ds:[edi]
push eax
call oglmdi2_vs7.409AE0
pop ecx
pop ecx
pop edi
mov dword ptr ds:[esi+8],1
mov eax,esi
pop esi
ret 4
push esi
mov esi,ecx
push edi
mov edi,dword ptr ss:[esp+C]
mov dword ptr ds:[esi],oglmdi2_vs7.40E570
mov eax,dword ptr ds:[edi+8]
test eax,eax
mov dword ptr ds:[esi+8],eax
je oglmdi2_vs7.4060B4
push dword ptr ds:[edi+4]
call oglmdi2_vs7.4058A0
inc eax
push eax
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
pop ecx
mov dword ptr ds:[esi+4],eax
je oglmdi2_vs7.4060BA
push dword ptr ds:[edi+4]
push eax
call oglmdi2_vs7.409AE0
pop ecx
pop ecx
jmp oglmdi2_vs7.4060BA
mov eax,dword ptr ds:[edi+4]
mov dword ptr ds:[esi+4],eax
pop edi
mov eax,esi
pop esi
ret 4
cmp dword ptr ds:[ecx+8],0
mov dword ptr ds:[ecx],oglmdi2_vs7.40E570
je oglmdi2_vs7.4060D6
push dword ptr ds:[ecx+4]
call oglmdi2_vs7.4051DA
pop ecx
ret 
mov eax,dword ptr ds:[ecx+4]
test eax,eax
jne oglmdi2_vs7.4060E3
mov eax,oglmdi2_vs7.40E578
ret 
push esi
mov esi,ecx
call oglmdi2_vs7.4060C1
test byte ptr ss:[esp+8],1
je oglmdi2_vs7.4060FA
push esi
call oglmdi2_vs7.404B2B
pop ecx
mov eax,esi
pop esi
ret 4
mov eax,dword ptr ds:[4121EC]
test eax,eax
je oglmdi2_vs7.406118
push dword ptr ss:[esp+4]
call eax
test eax,eax
pop ecx
je oglmdi2_vs7.406118
xor eax,eax
inc eax
ret 
xor eax,eax
ret 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr ss:[esp+C]
test eax,eax
je oglmdi2_vs7.406172
mov edx,dword ptr ss:[esp+4]
push esi
push edi
mov esi,edx
mov edi,dword ptr ss:[esp+10]
or edx,edi
and edx,3
je oglmdi2_vs7.406173
test eax,1
je oglmdi2_vs7.406153
mov cl,byte ptr ds:[esi]
cmp cl,byte ptr ds:[edi]
jne oglmdi2_vs7.4061A0
add esi,1
add edi,1
sub eax,1
je oglmdi2_vs7.406170
mov cl,byte ptr ds:[esi]
mov dl,byte ptr ds:[edi]
cmp cl,dl
jne oglmdi2_vs7.4061A0
mov cl,byte ptr ds:[esi+1]
mov dl,byte ptr ds:[edi+1]
cmp cl,dl
jne oglmdi2_vs7.4061A0
add edi,2
add esi,2
sub eax,2
jne oglmdi2_vs7.406153
pop edi
pop esi
ret 
mov ecx,eax
and eax,3
shr ecx,2
je oglmdi2_vs7.4061A8
repe cmpsd dword ptr ds:[esi],dword ptr es:[edi]
je oglmdi2_vs7.4061A8
mov ecx,dword ptr ds:[esi-4]
mov edx,dword ptr ds:[edi-4]
cmp cl,dl
jne oglmdi2_vs7.40619B
cmp ch,dh
jne oglmdi2_vs7.40619B
shr ecx,10
shr edx,10
cmp cl,dl
jne oglmdi2_vs7.40619B
cmp ch,dh
mov eax,0
sbb eax,eax
pop edi
sbb eax,FFFFFFFF
pop esi
ret 
test eax,eax
je oglmdi2_vs7.406170
mov edx,dword ptr ds:[esi]
mov ecx,dword ptr ds:[edi]
cmp dl,cl
jne oglmdi2_vs7.40619B
sub eax,1
je oglmdi2_vs7.4061D5
cmp dh,ch
jne oglmdi2_vs7.40619B
sub eax,1
je oglmdi2_vs7.4061D5
and ecx,FF0000
and edx,FF0000
cmp edx,ecx
jne oglmdi2_vs7.40619B
sub eax,1
pop edi
pop esi
ret 
push esi
push dword ptr ds:[4128A8]
call oglmdi2_vs7.40A162
pop ecx
mov ecx,dword ptr ds:[4128A4]
mov esi,eax
mov eax,dword ptr ds:[4128A8]
mov edx,ecx
sub edx,eax
add edx,4
cmp esi,edx
jae oglmdi2_vs7.40624B
mov ecx,800
cmp esi,ecx
jae oglmdi2_vs7.406208
mov ecx,esi
add ecx,esi
push ecx
push eax
call oglmdi2_vs7.40A000
test eax,eax
pop ecx
pop ecx
jne oglmdi2_vs7.40622E
add esi,10
push esi
push dword ptr ds:[4128A8]
call oglmdi2_vs7.40A000
test eax,eax
pop ecx
pop ecx
jne oglmdi2_vs7.40622E
pop esi
ret 
mov ecx,dword ptr ds:[4128A4]
sub ecx,dword ptr ds:[4128A8]
mov dword ptr ds:[4128A8],eax
sar ecx,2
lea ecx,dword ptr ds:[eax+ecx*4]
mov dword ptr ds:[4128A4],ecx
mov eax,dword ptr ss:[esp+8]
mov dword ptr ds:[ecx],eax
add dword ptr ds:[4128A4],4
pop esi
ret 
push dword ptr ss:[esp+4]
call oglmdi2_vs7.4061D8
neg eax
sbb eax,eax
neg eax
pop ecx
dec eax
ret 
push 80
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
mov dword ptr ds:[4128A8],eax
jne oglmdi2_vs7.406284
push 18
pop eax
ret 
and dword ptr ds:[eax],0
mov eax,dword ptr ds:[4128A8]
mov dword ptr ds:[4128A4],eax
xor eax,eax
ret 
push A
call oglmdi2_vs7.4091A2
push 16
call oglmdi2_vs7.40A1D3
pop ecx
pop ecx
push 3
call oglmdi2_vs7.408E24
int3 
push 8
push oglmdi2_vs7.40E710
call oglmdi2_vs7.406308
mov eax,dword ptr ds:[412200]
test eax,eax
je oglmdi2_vs7.4062D4
and dword ptr ss:[ebp-4],0
call eax
jmp oglmdi2_vs7.4062D0
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
or dword ptr ss:[ebp-4],FFFFFFFF
jmp oglmdi2_vs7.406294
push 8
push oglmdi2_vs7.40E720
call oglmdi2_vs7.406308
mov eax,dword ptr ds:[411550]
test eax,eax
je oglmdi2_vs7.406301
and dword ptr ss:[ebp-4],0
call eax
jmp oglmdi2_vs7.4062FD
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
or dword ptr ss:[ebp-4],FFFFFFFF
jmp oglmdi2_vs7.4062AC
int3 
int3 
push oglmdi2_vs7.40A304
mov eax,dword ptr fs:[0]
push eax
mov eax,dword ptr ss:[esp+10]
mov dword ptr ss:[esp+10],ebp
lea ebp,dword ptr ss:[esp+10]
sub esp,eax
push ebx
push esi
push edi
mov eax,dword ptr ss:[ebp-8]
mov dword ptr ss:[ebp-18],esp
push eax
mov eax,dword ptr ss:[ebp-4]
mov dword ptr ss:[ebp-4],FFFFFFFF
mov dword ptr ss:[ebp-8],eax
lea eax,dword ptr ss:[ebp-10]
mov dword ptr fs:[0],eax
ret 
mov ecx,dword ptr ss:[ebp-10]
mov dword ptr fs:[0],ecx
pop ecx
pop edi
pop esi
pop ebx
leave 
push ecx
ret 
push esi
mov esi,dword ptr ss:[esp+8]
movsx eax,byte ptr ds:[esi]
push eax
call oglmdi2_vs7.40A45A
cmp eax,65
pop ecx
je oglmdi2_vs7.406392
inc esi
cmp dword ptr ds:[411820],1
movsx eax,byte ptr ds:[esi]
jle oglmdi2_vs7.406381
push 4
push eax
call oglmdi2_vs7.40A3DC
pop ecx
pop ecx
jmp oglmdi2_vs7.40638E
mov ecx,dword ptr ds:[41182C]
movzx eax,byte ptr ds:[ecx+eax*2]
and eax,4
test eax,eax
jne oglmdi2_vs7.406368
mov al,byte ptr ds:[esi]
mov cl,byte ptr ds:[411824]
mov byte ptr ds:[esi],cl
inc esi
mov cl,byte ptr ds:[esi]
mov byte ptr ds:[esi],al
mov al,cl
mov cl,byte ptr ds:[esi]
inc esi
test cl,cl
jne oglmdi2_vs7.40639D
pop esi
ret 
mov eax,dword ptr ss:[esp+4]
push ebx
mov bl,byte ptr ds:[411824]
jmp oglmdi2_vs7.4063BE
cmp cl,bl
je oglmdi2_vs7.4063C4
inc eax
mov cl,byte ptr ds:[eax]
test cl,cl
jne oglmdi2_vs7.4063B9
mov cl,byte ptr ds:[eax]
inc eax
test cl,cl
je oglmdi2_vs7.4063F5
jmp oglmdi2_vs7.4063D8
cmp cl,65
je oglmdi2_vs7.4063DE
cmp cl,45
je oglmdi2_vs7.4063DE
inc eax
mov cl,byte ptr ds:[eax]
test cl,cl
jne oglmdi2_vs7.4063CD
mov edx,eax
dec eax
cmp byte ptr ds:[eax],30
je oglmdi2_vs7.4063E0
cmp byte ptr ds:[eax],bl
jne oglmdi2_vs7.4063EB
dec eax
mov cl,byte ptr ds:[edx]
inc eax
inc edx
test cl,cl
mov byte ptr ds:[eax],cl
jne oglmdi2_vs7.4063EB
pop ebx
ret 
mov eax,dword ptr ss:[esp+4]
fld qword ptr ds:[eax]
fcomp qword ptr ds:[40E730]
fnstsw ax
test ah,1
jne oglmdi2_vs7.40640E
xor eax,eax
inc eax
ret 
xor eax,eax
ret 
push ebp
mov ebp,esp
push ecx
push ecx
cmp dword ptr ss:[ebp+8],0
push dword ptr ss:[ebp+10]
je oglmdi2_vs7.40643A
lea eax,dword ptr ss:[ebp-8]
push eax
call oglmdi2_vs7.40A853
mov eax,dword ptr ss:[ebp+C]
pop ecx
pop ecx
mov ecx,dword ptr ss:[ebp-8]
mov dword ptr ds:[eax],ecx
mov ecx,dword ptr ss:[ebp-4]
mov dword ptr ds:[eax+4],ecx
leave 
ret 
lea eax,dword ptr ss:[ebp+8]
push eax
call oglmdi2_vs7.40A896
mov eax,dword ptr ss:[ebp+C]
pop ecx
pop ecx
mov ecx,dword ptr ss:[ebp+8]
mov dword ptr ds:[eax],ecx
leave 
ret 
test edi,edi
push esi
mov esi,eax
je oglmdi2_vs7.40646A
push esi
call oglmdi2_vs7.4058A0
inc eax
push eax
push esi
add esi,edi
push esi
call oglmdi2_vs7.405C70
add esp,10
pop esi
ret 
push ebp
mov ebp,esp
cmp byte ptr ds:[412208],0
push ebx
push esi
push edi
je oglmdi2_vs7.4064A2
mov ebx,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[412204]
xor ecx,ecx
test ebx,ebx
setg cl
xor edx,edx
cmp dword ptr ds:[eax],2D
mov esi,eax
sete dl
mov edi,ecx
add edx,dword ptr ss:[ebp+C]
mov eax,edx
call oglmdi2_vs7.40644F
jmp oglmdi2_vs7.4064D8
mov eax,dword ptr ss:[ebp+8]
push dword ptr ds:[eax+4]
push dword ptr ds:[eax]
call oglmdi2_vs7.40AA0A
mov ebx,dword ptr ss:[ebp+10]
mov edx,dword ptr ss:[ebp+C]
mov esi,eax
push esi
lea eax,dword ptr ds:[ebx+1]
push eax
xor eax,eax
cmp dword ptr ds:[esi],2D
sete al
xor ecx,ecx
test ebx,ebx
setg cl
add edx,eax
add ecx,edx
push ecx
call oglmdi2_vs7.40A8D9
add esp,14
cmp dword ptr ds:[esi],2D
mov eax,dword ptr ss:[ebp+C]
jne oglmdi2_vs7.4064E4
mov byte ptr ds:[eax],2D
inc eax
test ebx,ebx
jle oglmdi2_vs7.4064F9
lea edi,dword ptr ds:[eax+1]
mov cl,byte ptr ds:[edi]
mov byte ptr ds:[eax],cl
mov cl,byte ptr ds:[411824]
mov eax,edi
mov byte ptr ds:[eax],cl
xor ecx,ecx
cmp byte ptr ds:[412208],cl
push oglmdi2_vs7.40E738
sete cl
add ecx,eax
add ecx,ebx
push ecx
call oglmdi2_vs7.409AE0
cmp dword ptr ss:[ebp+14],0
pop ecx
pop ecx
mov ecx,eax
je oglmdi2_vs7.406520
mov byte ptr ds:[ecx],45
mov eax,dword ptr ds:[esi+C]
inc ecx
cmp byte ptr ds:[eax],30
je oglmdi2_vs7.406557
mov eax,dword ptr ds:[esi+4]
dec eax
jns oglmdi2_vs7.406534
neg eax
mov byte ptr ds:[ecx],2D
inc ecx
cmp eax,64
jl oglmdi2_vs7.406544
cdq 
push 64
pop esi
idiv esi
add byte ptr ds:[ecx],al
mov eax,edx
inc ecx
cmp eax,A
jl oglmdi2_vs7.406554
cdq 
push A
pop esi
idiv esi
add byte ptr ds:[ecx],al
mov eax,edx
add byte ptr ds:[ecx+1],al
mov eax,dword ptr ss:[ebp+C]
pop edi
pop esi
pop ebx
pop ebp
ret 
cmp byte ptr ds:[412208],0
push ebx
mov ebx,dword ptr ss:[esp+C]
push ebp
push esi
push edi
je oglmdi2_vs7.406598
mov eax,dword ptr ds:[41220C]
cmp eax,dword ptr ss:[esp+1C]
mov esi,dword ptr ds:[412204]
jne oglmdi2_vs7.4065C4
xor ecx,ecx
cmp dword ptr ds:[esi],2D
sete cl
add ecx,eax
add ecx,ebx
mov eax,ecx
mov byte ptr ds:[eax],30
and byte ptr ds:[eax+1],0
jmp oglmdi2_vs7.4065C4
mov eax,dword ptr ss:[esp+14]
push dword ptr ds:[eax+4]
push dword ptr ds:[eax]
call oglmdi2_vs7.40AA0A
mov esi,eax
mov eax,dword ptr ds:[esi+4]
add eax,dword ptr ss:[esp+24]
push esi
push eax
xor eax,eax
cmp dword ptr ds:[esi],2D
sete al
add eax,ebx
push eax
call oglmdi2_vs7.40A8D9
add esp,14
cmp dword ptr ds:[esi],2D
mov ebp,ebx
jne oglmdi2_vs7.4065D1
mov byte ptr ds:[ebx],2D
lea ebp,dword ptr ds:[ebx+1]
mov eax,dword ptr ds:[esi+4]
xor edi,edi
inc edi
test eax,eax
jg oglmdi2_vs7.4065E9
mov eax,ebp
call oglmdi2_vs7.40644F
mov byte ptr ss:[ebp],30
inc ebp
jmp oglmdi2_vs7.4065EB
add ebp,eax
cmp dword ptr ss:[esp+1C],0
jle oglmdi2_vs7.406635
mov eax,ebp
call oglmdi2_vs7.40644F
mov al,byte ptr ds:[411824]
mov byte ptr ss:[ebp],al
mov esi,dword ptr ds:[esi+4]
inc ebp
test esi,esi
jge oglmdi2_vs7.406635
neg esi
cmp byte ptr ds:[412208],0
jne oglmdi2_vs7.40661A
cmp dword ptr ss:[esp+1C],esi
jl oglmdi2_vs7.40661E
mov dword ptr ss:[esp+1C],esi
mov edi,dword ptr ss:[esp+1C]
mov eax,ebp
call oglmdi2_vs7.40644F
push edi
push 30
push ebp
call oglmdi2_vs7.409D60
add esp,C
pop edi
pop esi
pop ebp
mov eax,ebx
pop ebx
ret 
push ebp
mov ebp,esp
push ebx
push esi
mov esi,dword ptr ss:[ebp+8]
push edi
push dword ptr ds:[esi+4]
push dword ptr ds:[esi]
call oglmdi2_vs7.40AA0A
mov ecx,dword ptr ds:[eax+4]
mov ebx,dword ptr ss:[ebp+10]
dec ecx
mov dword ptr ds:[41220C],ecx
xor ecx,ecx
cmp dword ptr ds:[eax],2D
push eax
sete cl
push ebx
mov dword ptr ds:[412204],eax
add ecx,dword ptr ss:[ebp+C]
mov edi,ecx
push edi
call oglmdi2_vs7.40A8D9
mov eax,dword ptr ds:[412204]
mov eax,dword ptr ds:[eax+4]
add esp,14
dec eax
cmp dword ptr ds:[41220C],eax
mov dword ptr ds:[41220C],eax
setl cl
cmp eax,FFFFFFFC
mov byte ptr ds:[412210],cl
jl oglmdi2_vs7.4066C3
cmp eax,ebx
jge oglmdi2_vs7.4066C3
test cl,cl
je oglmdi2_vs7.4066AD
mov al,byte ptr ds:[edi]
inc edi
test al,al
jne oglmdi2_vs7.4066A3
and byte ptr ds:[edi-2],al
push ebx
push dword ptr ss:[ebp+C]
mov byte ptr ds:[412208],1
push esi
call oglmdi2_vs7.40655F
add esp,C
jmp oglmdi2_vs7.4066DA
push dword ptr ss:[ebp+14]
mov byte ptr ds:[412208],1
push ebx
push dword ptr ss:[ebp+C]
push esi
call oglmdi2_vs7.40646C
add esp,10
and byte ptr ds:[412208],0
pop edi
pop esi
pop ebx
pop ebp
ret 
push ebp
mov ebp,esp
cmp dword ptr ss:[ebp+10],65
je oglmdi2_vs7.406721
cmp dword ptr ss:[ebp+10],45
je oglmdi2_vs7.406721
cmp dword ptr ss:[ebp+10],66
jne oglmdi2_vs7.40670E
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.40655F
add esp,C
pop ebp
ret 
push dword ptr ss:[ebp+18]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.40663C
jmp oglmdi2_vs7.406732
push dword ptr ss:[ebp+18]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.40646C
add esp,10
pop ebp
ret 
push 30000
push 10000
call oglmdi2_vs7.40ABDF
pop ecx
pop ecx
ret 
push ebp
mov ebp,esp
sub esp,18
fld qword ptr ds:[40E748]
fstp qword ptr ss:[ebp-8]
fld qword ptr ds:[40E740]
fstp qword ptr ss:[ebp-10]
fld qword ptr ss:[ebp-10]
fdiv qword ptr ss:[ebp-8]
fmul qword ptr ss:[ebp-8]
fsubr qword ptr ss:[ebp-10]
fstp qword ptr ss:[ebp-18]
fld qword ptr ss:[ebp-18]
fcomp qword ptr ds:[40E4D0]
fnstsw ax
test ah,41
jne oglmdi2_vs7.406785
xor eax,eax
inc eax
leave 
ret 
xor eax,eax
leave 
ret 
push oglmdi2_vs7.40E76C
call dword ptr ds:[<&GetModuleHandleA>]
test eax,eax
je oglmdi2_vs7.4067AD
push oglmdi2_vs7.40E750
push eax
call dword ptr ds:[<&GetProcAddress>]
test eax,eax
je oglmdi2_vs7.4067AD
push 0
call eax
ret 
jmp oglmdi2_vs7.406749
push ebp
mov ebp,esp
push ebx
push esi
mov esi,dword ptr ss:[ebp+C]
mov eax,dword ptr ds:[esi+C]
test al,82
mov ebx,dword ptr ds:[esi+10]
je oglmdi2_vs7.4068BB
test al,40
jne oglmdi2_vs7.4068BB
test al,1
je oglmdi2_vs7.4067EB
and dword ptr ds:[esi+4],0
test al,10
je oglmdi2_vs7.4068BB
mov ecx,dword ptr ds:[esi+8]
and eax,FFFFFFFE
mov dword ptr ds:[esi],ecx
mov dword ptr ds:[esi+C],eax
mov eax,dword ptr ds:[esi+C]
and dword ptr ds:[esi+4],0
and dword ptr ss:[ebp+C],0
and eax,FFFFFFEF
or eax,2
test ax,10C
mov dword ptr ds:[esi+C],eax
jne oglmdi2_vs7.406827
cmp esi,oglmdi2_vs7.411188
je oglmdi2_vs7.406815
cmp esi,oglmdi2_vs7.4111A8
jne oglmdi2_vs7.406820
push ebx
call oglmdi2_vs7.40AE79
test eax,eax
pop ecx
jne oglmdi2_vs7.406827
push esi
call oglmdi2_vs7.40AE35
pop ecx
test word ptr ds:[esi+C],108
push edi
je oglmdi2_vs7.406891
mov eax,dword ptr ds:[esi+8]
mov edi,dword ptr ds:[esi]
lea ecx,dword ptr ds:[eax+1]
mov dword ptr ds:[esi],ecx
mov ecx,dword ptr ds:[esi+18]
sub edi,eax
dec ecx
test edi,edi
mov dword ptr ds:[esi+4],ecx
jle oglmdi2_vs7.406854
push edi
push eax
push ebx
call oglmdi2_vs7.40AC81
mov dword ptr ss:[ebp+C],eax
jmp oglmdi2_vs7.406884
cmp ebx,FFFFFFFF
je oglmdi2_vs7.40686F
mov eax,ebx
sar eax,5
mov eax,dword ptr ds:[eax*4+4127A0]
mov ecx,ebx
and ecx,1F
lea eax,dword ptr ds:[eax+ecx*8]
jmp oglmdi2_vs7.406874
mov eax,oglmdi2_vs7.411584
test byte ptr ds:[eax+4],20
je oglmdi2_vs7.406887
push 2
push 0
push ebx
call oglmdi2_vs7.40ABF5
add esp,C
mov eax,dword ptr ds:[esi+8]
mov cl,byte ptr ss:[ebp+8]
mov byte ptr ds:[eax],cl
jmp oglmdi2_vs7.4068A5
xor edi,edi
inc edi
push edi
lea eax,dword ptr ss:[ebp+8]
push eax
push ebx
call oglmdi2_vs7.40AC81
add esp,C
mov dword ptr ss:[ebp+C],eax
cmp dword ptr ss:[ebp+C],edi
pop edi
je oglmdi2_vs7.4068B1
or dword ptr ds:[esi+C],20
jmp oglmdi2_vs7.4068C1
mov eax,dword ptr ss:[ebp+8]
and eax,FF
jmp oglmdi2_vs7.4068C4
or eax,20
mov dword ptr ds:[esi+C],eax
or eax,FFFFFFFF
pop esi
pop ebx
pop ebp
ret 
test byte ptr ds:[ecx+C],40
je oglmdi2_vs7.4068D4
cmp dword ptr ds:[ecx+8],0
je oglmdi2_vs7.4068F8
dec dword ptr ds:[ecx+4]
js oglmdi2_vs7.4068E4
mov edx,dword ptr ds:[ecx]
mov byte ptr ds:[edx],al
inc dword ptr ds:[ecx]
movzx eax,al
jmp oglmdi2_vs7.4068F0
movsx eax,al
push ecx
push eax
call oglmdi2_vs7.4067B2
pop ecx
pop ecx
cmp eax,FFFFFFFF
jne oglmdi2_vs7.4068F8
or dword ptr ds:[esi],eax
ret 
inc dword ptr ds:[esi]
ret 
push ebp
mov ebp,esp
push esi
mov esi,eax
jmp oglmdi2_vs7.406916
mov ecx,dword ptr ss:[ebp+10]
mov al,byte ptr ss:[ebp+8]
dec dword ptr ss:[ebp+C]
call oglmdi2_vs7.4068C8
cmp dword ptr ds:[esi],FFFFFFFF
je oglmdi2_vs7.40691C
cmp dword ptr ss:[ebp+C],0
jg oglmdi2_vs7.406903
pop esi
pop ebp
ret 
test byte ptr ds:[edi+C],40
push ebx
push esi
mov esi,eax
mov ebx,ecx
je oglmdi2_vs7.40694C
cmp dword ptr ds:[edi+8],0
jne oglmdi2_vs7.40694C
mov eax,dword ptr ss:[esp+C]
add dword ptr ds:[esi],eax
jmp oglmdi2_vs7.406953
mov al,byte ptr ds:[ebx]
dec dword ptr ss:[esp+C]
mov ecx,edi
call oglmdi2_vs7.4068C8
inc ebx
cmp dword ptr ds:[esi],FFFFFFFF
je oglmdi2_vs7.406953
cmp dword ptr ss:[esp+C],0
jg oglmdi2_vs7.406939
pop esi
pop ebx
ret 
push ebp
mov ebp,esp
sub esp,254
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push ebx
mov dword ptr ss:[ebp-4],eax
xor eax,eax
mov dword ptr ss:[ebp-14],eax
mov dword ptr ss:[ebp-18],eax
mov dword ptr ss:[ebp-2C],eax
mov eax,dword ptr ss:[ebp+C]
mov bl,byte ptr ds:[eax]
xor ecx,ecx
test bl,bl
je oglmdi2_vs7.4070BA
push esi
push edi
mov edi,eax
jmp oglmdi2_vs7.40698E
mov ecx,dword ptr ss:[ebp-38]
inc edi
cmp dword ptr ss:[ebp-18],0
mov dword ptr ss:[ebp+C],edi
jl oglmdi2_vs7.4070B8
cmp bl,20
jl oglmdi2_vs7.4069B5
cmp bl,78
jg oglmdi2_vs7.4069B5
movsx eax,bl
movsx eax,byte ptr ds:[eax+40E758]
and eax,F
jmp oglmdi2_vs7.4069B7
xor eax,eax
movsx eax,byte ptr ds:[ecx+eax*8+40E778]
push 7
sar eax,4
pop ecx
cmp eax,ecx
mov dword ptr ss:[ebp-38],eax
ja oglmdi2_vs7.4070AB
jmp dword ptr ds:[eax*4+4070CB]
xor eax,eax
or dword ptr ss:[ebp-C],FFFFFFFF
mov dword ptr ss:[ebp-3C],eax
mov dword ptr ss:[ebp-34],eax
mov dword ptr ss:[ebp-24],eax
mov dword ptr ss:[ebp-20],eax
mov dword ptr ss:[ebp-8],eax
mov dword ptr ss:[ebp-28],eax
jmp oglmdi2_vs7.4070AB
movsx eax,bl
sub eax,20
je oglmdi2_vs7.406A37
sub eax,3
je oglmdi2_vs7.406A2E
sub eax,8
je oglmdi2_vs7.406A25
dec eax
dec eax
je oglmdi2_vs7.406A1C
sub eax,3
jne oglmdi2_vs7.4070AB
or dword ptr ss:[ebp-8],8
jmp oglmdi2_vs7.4070AB
or dword ptr ss:[ebp-8],4
jmp oglmdi2_vs7.4070AB
or dword ptr ss:[ebp-8],1
jmp oglmdi2_vs7.4070AB
or byte ptr ss:[ebp-8],80
jmp oglmdi2_vs7.4070AB
or dword ptr ss:[ebp-8],2
jmp oglmdi2_vs7.4070AB
cmp bl,2A
jne oglmdi2_vs7.406A66
add dword ptr ss:[ebp+10],4
mov eax,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[eax-4]
test eax,eax
mov dword ptr ss:[ebp-24],eax
jge oglmdi2_vs7.4070AB
or dword ptr ss:[ebp-8],4
neg dword ptr ss:[ebp-24]
jmp oglmdi2_vs7.4070AB
mov eax,dword ptr ss:[ebp-24]
movsx ecx,bl
lea eax,dword ptr ds:[eax+eax*4]
lea eax,dword ptr ds:[ecx+eax*2-30]
mov dword ptr ss:[ebp-24],eax
jmp oglmdi2_vs7.4070AB
and dword ptr ss:[ebp-C],0
jmp oglmdi2_vs7.4070AB
cmp bl,2A
jne oglmdi2_vs7.406AA7
add dword ptr ss:[ebp+10],4
mov eax,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[eax-4]
test eax,eax
mov dword ptr ss:[ebp-C],eax
jge oglmdi2_vs7.4070AB
or dword ptr ss:[ebp-C],FFFFFFFF
jmp oglmdi2_vs7.4070AB
mov eax,dword ptr ss:[ebp-C]
movsx ecx,bl
lea eax,dword ptr ds:[eax+eax*4]
lea eax,dword ptr ds:[ecx+eax*2-30]
mov dword ptr ss:[ebp-C],eax
jmp oglmdi2_vs7.4070AB
cmp bl,49
je oglmdi2_vs7.406AEF
cmp bl,68
je oglmdi2_vs7.406AE6
cmp bl,6C
je oglmdi2_vs7.406ADD
cmp bl,77
jne oglmdi2_vs7.4070AB
or byte ptr ss:[ebp-7],8
jmp oglmdi2_vs7.4070AB
or dword ptr ss:[ebp-8],10
jmp oglmdi2_vs7.4070AB
or dword ptr ss:[ebp-8],20
jmp oglmdi2_vs7.4070AB
mov al,byte ptr ds:[edi]
cmp al,36
jne oglmdi2_vs7.406B09
cmp byte ptr ds:[edi+1],34
jne oglmdi2_vs7.406B09
inc edi
inc edi
or byte ptr ss:[ebp-7],80
mov dword ptr ss:[ebp+C],edi
jmp oglmdi2_vs7.4070AB
cmp al,33
jne oglmdi2_vs7.406B21
cmp byte ptr ds:[edi+1],32
jne oglmdi2_vs7.406B21
inc edi
inc edi
and byte ptr ss:[ebp-7],7F
mov dword ptr ss:[ebp+C],edi
jmp oglmdi2_vs7.4070AB
cmp al,64
je oglmdi2_vs7.4070AB
cmp al,69
je oglmdi2_vs7.4070AB
cmp al,6F
je oglmdi2_vs7.4070AB
cmp al,75
je oglmdi2_vs7.4070AB
cmp al,78
je oglmdi2_vs7.4070AB
cmp al,58
je oglmdi2_vs7.4070AB
and dword ptr ss:[ebp-38],0
mov ecx,dword ptr ds:[41182C]
and dword ptr ss:[ebp-28],0
movzx eax,bl
test byte ptr ds:[ecx+eax*2+1],80
je oglmdi2_vs7.406B7C
mov ecx,dword ptr ss:[ebp+8]
lea esi,dword ptr ss:[ebp-18]
mov al,bl
call oglmdi2_vs7.4068C8
mov bl,byte ptr ds:[edi]
inc edi
mov dword ptr ss:[ebp+C],edi
mov ecx,dword ptr ss:[ebp+8]
lea esi,dword ptr ss:[ebp-18]
mov al,bl
call oglmdi2_vs7.4068C8
jmp oglmdi2_vs7.4070AB
movsx eax,bl
cmp eax,67
jg oglmdi2_vs7.406DE0
cmp eax,65
jge oglmdi2_vs7.406C23
cmp eax,58
jg oglmdi2_vs7.406C84
je oglmdi2_vs7.406E61
sub eax,43
je oglmdi2_vs7.406C46
dec eax
dec eax
je oglmdi2_vs7.406C19
dec eax
dec eax
je oglmdi2_vs7.406C19
sub eax,C
jne oglmdi2_vs7.406FA9
test word ptr ss:[ebp-8],830
jne oglmdi2_vs7.406BD8
or byte ptr ss:[ebp-7],8
mov ecx,dword ptr ss:[ebp-C]
cmp ecx,FFFFFFFF
jne oglmdi2_vs7.406BE5
mov ecx,7FFFFFFF
add dword ptr ss:[ebp+10],4
test word ptr ss:[ebp-8],810
mov eax,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[eax-4]
mov dword ptr ss:[ebp-10],eax
je oglmdi2_vs7.406E36
test eax,eax
jne oglmdi2_vs7.406C0A
mov eax,dword ptr ds:[411570]
mov dword ptr ss:[ebp-10],eax
mov eax,dword ptr ss:[ebp-10]
mov dword ptr ss:[ebp-28],1
jmp oglmdi2_vs7.406E28
mov dword ptr ss:[ebp-3C],1
add bl,20
or dword ptr ss:[ebp-8],40
cmp dword ptr ss:[ebp-C],0
lea esi,dword ptr ss:[ebp-254]
mov dword ptr ss:[ebp-10],esi
jge oglmdi2_vs7.406D2A
mov dword ptr ss:[ebp-C],6
jmp oglmdi2_vs7.406D71
test word ptr ss:[ebp-8],830
jne oglmdi2_vs7.406C52
or byte ptr ss:[ebp-7],8
add dword ptr ss:[ebp+10],4
test word ptr ss:[ebp-8],810
mov eax,dword ptr ss:[ebp+10]
je oglmdi2_vs7.406CC3
movsx eax,word ptr ds:[eax-4]
push eax
lea eax,dword ptr ss:[ebp-254]
push eax
call oglmdi2_vs7.40AEA0
test eax,eax
pop ecx
pop ecx
mov dword ptr ss:[ebp-14],eax
jge oglmdi2_vs7.406CD3
mov dword ptr ss:[ebp-34],1
jmp oglmdi2_vs7.406CD3
sub eax,5A
je oglmdi2_vs7.406CE1
sub eax,9
je oglmdi2_vs7.406C52
dec eax
jne oglmdi2_vs7.406FA9
or dword ptr ss:[ebp-8],40
mov dword ptr ss:[ebp-14],A
mov ebx,dword ptr ss:[ebp-8]
mov esi,8000
test esi,ebx
je oglmdi2_vs7.406ED1
mov ecx,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[ecx]
mov edx,dword ptr ds:[ecx+4]
add ecx,8
mov dword ptr ss:[ebp+10],ecx
jmp oglmdi2_vs7.406EF9
mov al,byte ptr ds:[eax-4]
mov byte ptr ss:[ebp-254],al
mov dword ptr ss:[ebp-14],1
lea eax,dword ptr ss:[ebp-254]
mov dword ptr ss:[ebp-10],eax
jmp oglmdi2_vs7.406FA9
add dword ptr ss:[ebp+10],4
mov eax,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[eax-4]
test eax,eax
je oglmdi2_vs7.406D1C
mov ecx,dword ptr ds:[eax+4]
test ecx,ecx
je oglmdi2_vs7.406D1C
test byte ptr ss:[ebp-7],8
movsx eax,word ptr ds:[eax]
mov dword ptr ss:[ebp-10],ecx
je oglmdi2_vs7.406D13
cdq 
sub eax,edx
sar eax,1
mov dword ptr ss:[ebp-28],1
jmp oglmdi2_vs7.406FA6
and dword ptr ss:[ebp-28],0
jmp oglmdi2_vs7.406FA6
mov eax,dword ptr ds:[41156C]
mov dword ptr ss:[ebp-10],eax
push eax
jmp oglmdi2_vs7.406DD5
jne oglmdi2_vs7.406D3A
cmp bl,67
jne oglmdi2_vs7.406D71
mov dword ptr ss:[ebp-C],1
jmp oglmdi2_vs7.406D71
mov eax,200
cmp dword ptr ss:[ebp-C],eax
jle oglmdi2_vs7.406D47
mov dword ptr ss:[ebp-C],eax
mov edi,A3
cmp dword ptr ss:[ebp-C],edi
jle oglmdi2_vs7.406D71
mov eax,dword ptr ss:[ebp-C]
add eax,15D
push eax
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
mov dword ptr ss:[ebp-2C],eax
je oglmdi2_vs7.406D6E
mov dword ptr ss:[ebp-10],eax
mov esi,eax
jmp oglmdi2_vs7.406D71
mov dword ptr ss:[ebp-C],edi
mov eax,dword ptr ss:[ebp+10]
mov ecx,dword ptr ds:[eax]
push dword ptr ss:[ebp-3C]
add eax,8
push dword ptr ss:[ebp-C]
mov dword ptr ss:[ebp+10],eax
mov eax,dword ptr ds:[eax-4]
mov dword ptr ss:[ebp-48],eax
movsx eax,bl
push eax
lea eax,dword ptr ss:[ebp-4C]
push esi
push eax
mov dword ptr ss:[ebp-4C],ecx
call dword ptr ds:[411554]
mov edi,dword ptr ss:[ebp-8]
add esp,14
and edi,80
je oglmdi2_vs7.406DB6
cmp dword ptr ss:[ebp-C],0
jne oglmdi2_vs7.406DB6
push esi
call dword ptr ds:[411560]
pop ecx
cmp bl,67
jne oglmdi2_vs7.406DC7
test edi,edi
jne oglmdi2_vs7.406DC7
push esi
call dword ptr ds:[411558]
pop ecx
cmp byte ptr ds:[esi],2D
jne oglmdi2_vs7.406DD4
or byte ptr ss:[ebp-7],1
inc esi
mov dword ptr ss:[ebp-10],esi
push esi
call oglmdi2_vs7.4058A0
pop ecx
jmp oglmdi2_vs7.406FA6
sub eax,69
je oglmdi2_vs7.406C95
sub eax,5
je oglmdi2_vs7.406EA7
dec eax
je oglmdi2_vs7.406E8D
dec eax
je oglmdi2_vs7.406E5A
sub eax,3
je oglmdi2_vs7.406BD8
dec eax
dec eax
je oglmdi2_vs7.406C99
sub eax,3
jne oglmdi2_vs7.406FA9
mov dword ptr ss:[ebp-30],27
jmp oglmdi2_vs7.406E64
dec ecx
cmp word ptr ds:[eax],0
je oglmdi2_vs7.406E2C
inc eax
inc eax
test ecx,ecx
jne oglmdi2_vs7.406E1F
sub eax,dword ptr ss:[ebp-10]
sar eax,1
jmp oglmdi2_vs7.406FA6
test eax,eax
jne oglmdi2_vs7.406E42
mov eax,dword ptr ds:[41156C]
mov dword ptr ss:[ebp-10],eax
mov eax,dword ptr ss:[ebp-10]
jmp oglmdi2_vs7.406E4E
dec ecx
cmp byte ptr ds:[eax],0
je oglmdi2_vs7.406E52
inc eax
test ecx,ecx
jne oglmdi2_vs7.406E47
sub eax,dword ptr ss:[ebp-10]
jmp oglmdi2_vs7.406FA6
mov dword ptr ss:[ebp-C],8
mov dword ptr ss:[ebp-30],ecx
test byte ptr ss:[ebp-8],80
mov dword ptr ss:[ebp-14],10
je oglmdi2_vs7.406CA0
mov al,byte ptr ss:[ebp-30]
add al,51
mov byte ptr ss:[ebp-1C],30
mov byte ptr ss:[ebp-1B],al
mov dword ptr ss:[ebp-20],2
jmp oglmdi2_vs7.406CA0
test byte ptr ss:[ebp-8],80
mov dword ptr ss:[ebp-14],8
je oglmdi2_vs7.406CA0
or byte ptr ss:[ebp-7],2
jmp oglmdi2_vs7.406CA0
add dword ptr ss:[ebp+10],4
test byte ptr ss:[ebp-8],20
mov eax,dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[eax-4]
je oglmdi2_vs7.406EC0
mov cx,word ptr ss:[ebp-18]
mov word ptr ds:[eax],cx
jmp oglmdi2_vs7.406EC5
mov ecx,dword ptr ss:[ebp-18]
mov dword ptr ds:[eax],ecx
mov dword ptr ss:[ebp-34],1
jmp oglmdi2_vs7.407098
add dword ptr ss:[ebp+10],4
test bl,20
mov eax,dword ptr ss:[ebp+10]
je oglmdi2_vs7.406EEF
test bl,40
je oglmdi2_vs7.406EE9
movsx eax,word ptr ds:[eax-4]
cdq 
jmp oglmdi2_vs7.406EF9
movzx eax,word ptr ds:[eax-4]
jmp oglmdi2_vs7.406EE6
test bl,40
mov eax,dword ptr ds:[eax-4]
jne oglmdi2_vs7.406EE6
xor edx,edx
test bl,40
je oglmdi2_vs7.406F13
test edx,edx
jg oglmdi2_vs7.406F13
jl oglmdi2_vs7.406F08
test eax,eax
jae oglmdi2_vs7.406F13
neg eax
adc edx,0
neg edx
or byte ptr ss:[ebp-7],1
test dword ptr ss:[ebp-8],esi
mov ebx,eax
mov edi,edx
jne oglmdi2_vs7.406F1E
xor edi,edi
cmp dword ptr ss:[ebp-C],0
jge oglmdi2_vs7.406F2D
mov dword ptr ss:[ebp-C],1
jmp oglmdi2_vs7.406F3E
and dword ptr ss:[ebp-8],FFFFFFF7
mov eax,200
cmp dword ptr ss:[ebp-C],eax
jle oglmdi2_vs7.406F3E
mov dword ptr ss:[ebp-C],eax
mov eax,ebx
or eax,edi
jne oglmdi2_vs7.406F48
and dword ptr ss:[ebp-20],0
lea esi,dword ptr ss:[ebp-55]
mov eax,dword ptr ss:[ebp-C]
dec dword ptr ss:[ebp-C]
test eax,eax
jg oglmdi2_vs7.406F5B
mov eax,ebx
or eax,edi
je oglmdi2_vs7.406F7F
mov eax,dword ptr ss:[ebp-14]
cdq 
push edx
push eax
push edi
push ebx
call oglmdi2_vs7.40AF10
add ecx,30
cmp ecx,39
mov dword ptr ss:[ebp-40],ebx
mov ebx,eax
mov edi,edx
jle oglmdi2_vs7.406F7A
add ecx,dword ptr ss:[ebp-30]
mov byte ptr ds:[esi],cl
dec esi
jmp oglmdi2_vs7.406F4B
lea eax,dword ptr ss:[ebp-55]
sub eax,esi
inc esi
test byte ptr ss:[ebp-7],2
mov dword ptr ss:[ebp-14],eax
mov dword ptr ss:[ebp-10],esi
je oglmdi2_vs7.406FA9
mov ecx,esi
cmp byte ptr ds:[ecx],30
jne oglmdi2_vs7.406F9C
test eax,eax
jne oglmdi2_vs7.406FA9
dec dword ptr ss:[ebp-10]
mov ecx,dword ptr ss:[ebp-10]
mov byte ptr ds:[ecx],30
inc eax
mov dword ptr ss:[ebp-14],eax
cmp dword ptr ss:[ebp-34],0
jne oglmdi2_vs7.407098
mov ebx,dword ptr ss:[ebp-8]
test bl,40
je oglmdi2_vs7.406FE1
test bh,1
je oglmdi2_vs7.406FC6
mov byte ptr ss:[ebp-1C],2D
jmp oglmdi2_vs7.406FDA
test bl,1
je oglmdi2_vs7.406FD1
mov byte ptr ss:[ebp-1C],2B
jmp oglmdi2_vs7.406FDA
test bl,2
je oglmdi2_vs7.406FE1
mov byte ptr ss:[ebp-1C],20
mov dword ptr ss:[ebp-20],1
mov esi,dword ptr ss:[ebp-24]
sub esi,dword ptr ss:[ebp-20]
sub esi,dword ptr ss:[ebp-14]
test bl,C
jne oglmdi2_vs7.407000
push dword ptr ss:[ebp+8]
lea eax,dword ptr ss:[ebp-18]
push esi
push 20
call oglmdi2_vs7.4068FB
add esp,C
push dword ptr ss:[ebp-20]
mov edi,dword ptr ss:[ebp+8]
lea eax,dword ptr ss:[ebp-18]
lea ecx,dword ptr ss:[ebp-1C]
call oglmdi2_vs7.40691F
test bl,8
pop ecx
je oglmdi2_vs7.40702B
test bl,4
jne oglmdi2_vs7.40702B
push edi
push esi
push 30
lea eax,dword ptr ss:[ebp-18]
call oglmdi2_vs7.4068FB
add esp,C
cmp dword ptr ss:[ebp-28],0
je oglmdi2_vs7.407072
cmp dword ptr ss:[ebp-14],0
jle oglmdi2_vs7.407072
mov eax,dword ptr ss:[ebp-14]
mov ebx,dword ptr ss:[ebp-10]
mov dword ptr ss:[ebp-40],eax
dec dword ptr ss:[ebp-40]
xor eax,eax
mov ax,word ptr ds:[ebx]
push eax
lea eax,dword ptr ss:[ebp-54]
push eax
call oglmdi2_vs7.40AEA0
inc ebx
pop ecx
inc ebx
test eax,eax
pop ecx
jle oglmdi2_vs7.407081
mov edi,dword ptr ss:[ebp+8]
push eax
lea eax,dword ptr ss:[ebp-18]
lea ecx,dword ptr ss:[ebp-54]
call oglmdi2_vs7.40691F
cmp dword ptr ss:[ebp-40],0
pop ecx
jne oglmdi2_vs7.407040
jmp oglmdi2_vs7.407081
push dword ptr ss:[ebp-14]
mov ecx,dword ptr ss:[ebp-10]
lea eax,dword ptr ss:[ebp-18]
call oglmdi2_vs7.40691F
pop ecx
test byte ptr ss:[ebp-8],4
je oglmdi2_vs7.407098
push dword ptr ss:[ebp+8]
lea eax,dword ptr ss:[ebp-18]
push esi
push 20
call oglmdi2_vs7.4068FB
add esp,C
cmp dword ptr ss:[ebp-2C],0
je oglmdi2_vs7.4070AB
push dword ptr ss:[ebp-2C]
call oglmdi2_vs7.4051DA
and dword ptr ss:[ebp-2C],0
pop ecx
mov edi,dword ptr ss:[ebp+C]
mov bl,byte ptr ds:[edi]
test bl,bl
jne oglmdi2_vs7.40698B
pop edi
pop esi
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
mov eax,dword ptr ss:[ebp-18]
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
push ebp
imul eax,dword ptr ds:[eax],FFFFFFD7
imul eax,dword ptr ds:[eax],oglmdi2_vs7.4069F4
inc eax
push 40
add byte ptr ds:[ebx+6A],bh
inc eax
add byte ptr ds:[edx+ebp*2+6ABC0040],al
inc eax
add byte ptr ds:[esi+5500406B],cl
mov ebp,esp
sub esp,10
push esi
lea eax,dword ptr ss:[ebp-8]
push eax
call dword ptr ds:[<&GetSystemTimeAsFileTime>]
mov esi,dword ptr ss:[ebp-4]
xor esi,dword ptr ss:[ebp-8]
call dword ptr ds:[<&GetCurrentProcessId>]
xor esi,eax
call dword ptr ds:[<&GetCurrentThreadId>]
xor esi,eax
call dword ptr ds:[<&GetTickCount>]
xor esi,eax
lea eax,dword ptr ss:[ebp-10]
push eax
call dword ptr ds:[<&QueryPerformanceCounter>]
mov eax,dword ptr ss:[ebp-C]
xor eax,dword ptr ss:[ebp-10]
xor esi,eax
mov dword ptr ds:[411150],esi
jne oglmdi2_vs7.40713E
mov dword ptr ds:[411150],BB40E64E
pop esi
leave 
ret 
push 118
push oglmdi2_vs7.40E9D8
call oglmdi2_vs7.406308
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
mov dword ptr ss:[ebp-1C],eax
mov eax,dword ptr ds:[412214]
xor ecx,ecx
cmp eax,ecx
je oglmdi2_vs7.407185
mov dword ptr ss:[ebp-4],ecx
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call eax
pop ecx
pop ecx
or dword ptr ss:[ebp-4],FFFFFFFF
jmp oglmdi2_vs7.407283
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
jmp oglmdi2_vs7.407173
mov eax,dword ptr ss:[ebp+8]
dec eax
je oglmdi2_vs7.40719E
mov edi,oglmdi2_vs7.40E9B4
mov dword ptr ss:[ebp-20],oglmdi2_vs7.40E900
mov esi,D4
jmp oglmdi2_vs7.4071AF
mov edi,oglmdi2_vs7.40E8E0
mov dword ptr ss:[ebp-20],oglmdi2_vs7.40E840
mov esi,B9
mov byte ptr ss:[ebp-24],cl
push 104
lea eax,dword ptr ss:[ebp-128]
push eax
push ecx
call dword ptr ds:[<&GetModuleFileNameA>]
test eax,eax
jne oglmdi2_vs7.4071DC
push oglmdi2_vs7.40E828
lea eax,dword ptr ss:[ebp-128]
push eax
call oglmdi2_vs7.409AE0
pop ecx
pop ecx
lea ebx,dword ptr ss:[ebp-128]
lea eax,dword ptr ss:[ebp-128]
push eax
call oglmdi2_vs7.4058A0
pop ecx
add eax,B
cmp eax,3C
jbe oglmdi2_vs7.407220
lea eax,dword ptr ss:[ebp-128]
push eax
call oglmdi2_vs7.4058A0
mov ebx,eax
lea eax,dword ptr ss:[ebp-128]
sub eax,31
add ebx,eax
push 3
push oglmdi2_vs7.40E824
push ebx
call oglmdi2_vs7.409C30
add esp,10
push ebx
call oglmdi2_vs7.4058A0
pop ecx
lea eax,dword ptr ds:[eax+esi+C]
add eax,3
and eax,FFFFFFFC
call oglmdi2_vs7.4099B0
mov dword ptr ss:[ebp-18],esp
mov esi,esp
push edi
push esi
call oglmdi2_vs7.409AE0
mov edi,oglmdi2_vs7.40E820
push edi
push esi
call oglmdi2_vs7.409AF0
push oglmdi2_vs7.40E814
push esi
call oglmdi2_vs7.409AF0
push ebx
push esi
call oglmdi2_vs7.409AF0
push edi
push esi
call oglmdi2_vs7.409AF0
push dword ptr ss:[ebp-20]
push esi
call oglmdi2_vs7.409AF0
push 12010
push oglmdi2_vs7.40E7EC
push esi
call oglmdi2_vs7.40AFA5
add esp,3C
push 3
call oglmdi2_vs7.408E24
int3 
mov eax,dword ptr ds:[esi+4]
test eax,eax
je oglmdi2_vs7.4072D6
lea edx,dword ptr ds:[eax+8]
cmp byte ptr ds:[edx],0
je oglmdi2_vs7.4072D6
mov ecx,dword ptr ds:[edi+4]
cmp eax,ecx
je oglmdi2_vs7.4072B1
add ecx,8
push ecx
push edx
call oglmdi2_vs7.4099F0
test eax,eax
pop ecx
pop ecx
jne oglmdi2_vs7.4072D3
test byte ptr ds:[edi],2
je oglmdi2_vs7.4072BB
test byte ptr ds:[esi],8
je oglmdi2_vs7.4072D3
mov eax,dword ptr ss:[esp+4]
mov eax,dword ptr ds:[eax]
test al,1
je oglmdi2_vs7.4072CA
test byte ptr ds:[esi],1
je oglmdi2_vs7.4072D3
test al,2
je oglmdi2_vs7.4072D6
test byte ptr ds:[esi],2
jne oglmdi2_vs7.4072D6
xor eax,eax
ret 
xor eax,eax
inc eax
ret 
mov eax,dword ptr ds:[eax]
cmp dword ptr ds:[eax],E06D7363
je oglmdi2_vs7.4072E7
xor eax,eax
ret 
and dword ptr ds:[412220],0
jmp oglmdi2_vs7.4062AC
push 10
push oglmdi2_vs7.40E9E8
call oglmdi2_vs7.406308
mov ebx,dword ptr ss:[ebp+8]
mov esi,dword ptr ds:[ebx+8]
mov dword ptr ss:[ebp-1C],esi
inc dword ptr ds:[412220]
and dword ptr ss:[ebp-4],0
mov edi,dword ptr ss:[ebp+10]
cmp esi,dword ptr ss:[ebp+14]
je oglmdi2_vs7.40737E
cmp esi,FFFFFFFF
jle oglmdi2_vs7.407324
cmp esi,dword ptr ds:[edi+4]
jl oglmdi2_vs7.407329
call oglmdi2_vs7.4062D9
mov eax,esi
shl eax,3
mov ecx,dword ptr ds:[edi+8]
add ecx,eax
mov esi,dword ptr ds:[ecx]
mov dword ptr ss:[ebp-20],esi
mov dword ptr ss:[ebp-4],1
cmp dword ptr ds:[ecx+4],0
je oglmdi2_vs7.40735A
mov dword ptr ds:[ebx+8],esi
push 103
push ebx
mov ecx,dword ptr ds:[edi+8]
push dword ptr ds:[ecx+eax+4]
call oglmdi2_vs7.407AD0
and dword ptr ss:[ebp-4],0
jmp oglmdi2_vs7.407379
mov eax,dword ptr ss:[ebp-14]
call oglmdi2_vs7.4072DA
ret 
mov esp,dword ptr ss:[ebp-18]
and dword ptr ss:[ebp-4],0
mov edi,dword ptr ss:[ebp+10]
mov ebx,dword ptr ss:[ebp+8]
mov esi,dword ptr ss:[ebp-20]
mov dword ptr ss:[ebp-1C],esi
jmp oglmdi2_vs7.407315
or dword ptr ss:[ebp-4],FFFFFFFF
call oglmdi2_vs7.4073A0
cmp esi,dword ptr ss:[ebp+14]
je oglmdi2_vs7.407391
call oglmdi2_vs7.4062D9
mov dword ptr ds:[ebx+8],esi
call oglmdi2_vs7.406343
ret 
mov ebx,dword ptr ss:[ebp+8]
mov esi,dword ptr ss:[ebp-1C]
cmp dword ptr ds:[412220],0
jle oglmdi2_vs7.4073AF
dec dword ptr ds:[412220]
ret 
push 8
push oglmdi2_vs7.40EA00
call oglmdi2_vs7.406308
mov eax,dword ptr ss:[ebp+8]
test eax,eax
je oglmdi2_vs7.4073DE
mov ecx,dword ptr ds:[eax+1C]
mov ecx,dword ptr ds:[ecx+4]
test ecx,ecx
je oglmdi2_vs7.4073DE
and dword ptr ss:[ebp-4],0
push ecx
push dword ptr ds:[eax+18]
call oglmdi2_vs7.404DE3
or dword ptr ss:[ebp-4],FFFFFFFF
call oglmdi2_vs7.406343
ret 
xor eax,eax
cmp byte ptr ss:[ebp+C],al
setne al
ret 
mov esp,dword ptr ss:[ebp-18]
jmp oglmdi2_vs7.4062AC
mov edx,dword ptr ds:[ecx+4]
push esi
mov esi,eax
mov eax,dword ptr ds:[ecx]
add eax,esi
test edx,edx
jl oglmdi2_vs7.407410
mov ecx,dword ptr ds:[ecx+8]
mov esi,dword ptr ds:[edx+esi]
mov ecx,dword ptr ds:[esi+ecx]
add ecx,edx
add eax,ecx
pop esi
ret 
push 40
push oglmdi2_vs7.40EA10
call oglmdi2_vs7.406308
mov ebx,ecx
mov edi,dword ptr ss:[ebp+C]
mov esi,dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-1C],ebx
and dword ptr ss:[ebp-20],0
mov eax,dword ptr ds:[edi-4]
mov dword ptr ss:[ebp-24],eax
push dword ptr ds:[esi+18]
lea eax,dword ptr ss:[ebp-2C]
push eax
call oglmdi2_vs7.404F81
pop ecx
pop ecx
mov dword ptr ss:[ebp-30],eax
mov eax,dword ptr ds:[412218]
mov dword ptr ss:[ebp-34],eax
mov eax,dword ptr ds:[41221C]
mov dword ptr ss:[ebp-38],eax
mov dword ptr ds:[412218],esi
mov eax,dword ptr ss:[ebp+10]
mov dword ptr ds:[41221C],eax
and dword ptr ss:[ebp-4],0
mov dword ptr ss:[ebp-4],1
push dword ptr ss:[ebp+1C]
push dword ptr ss:[ebp+18]
push ebx
push dword ptr ss:[ebp+14]
push edi
call oglmdi2_vs7.404FEE
add esp,14
mov dword ptr ss:[ebp-1C],eax
and dword ptr ss:[ebp-4],0
jmp oglmdi2_vs7.40752F
mov eax,dword ptr ss:[ebp-14]
mov eax,dword ptr ds:[eax]
mov dword ptr ss:[ebp-3C],eax
mov eax,dword ptr ss:[ebp-3C]
cmp dword ptr ds:[eax],E06D7363
jne oglmdi2_vs7.4074C4
mov eax,dword ptr ss:[ebp-3C]
cmp dword ptr ds:[eax+10],3
jne oglmdi2_vs7.4074C4
mov eax,dword ptr ss:[ebp-3C]
cmp dword ptr ds:[eax+14],19930520
jne oglmdi2_vs7.4074C4
mov eax,dword ptr ss:[ebp-3C]
cmp dword ptr ds:[eax+1C],0
mov dword ptr ss:[ebp-40],1
je oglmdi2_vs7.4074CB
mov dword ptr ss:[ebp-40],0
mov eax,dword ptr ss:[ebp-40]
ret 
mov esp,dword ptr ss:[ebp-18]
mov ecx,dword ptr ss:[ebp+14]
mov eax,dword ptr ds:[ecx+8]
mov dword ptr ss:[ebp-44],eax
mov edi,dword ptr ss:[ebp+C]
mov eax,dword ptr ds:[edi+8]
mov dword ptr ss:[ebp-48],eax
mov edx,dword ptr ds:[ecx+10]
mov dword ptr ss:[ebp-4C],edx
xor edx,edx
mov dword ptr ss:[ebp-50],edx
cmp edx,dword ptr ds:[ecx+C]
jae oglmdi2_vs7.407518
lea esi,dword ptr ds:[edx+edx*4]
mov ebx,dword ptr ss:[ebp-4C]
lea esi,dword ptr ds:[ebx+esi*4]
mov ebx,dword ptr ds:[esi+4]
cmp eax,ebx
jle oglmdi2_vs7.407541
cmp eax,dword ptr ds:[esi+8]
jg oglmdi2_vs7.407541
lea eax,dword ptr ds:[ebx+1]
mov dword ptr ss:[ebp-48],eax
mov edx,dword ptr ss:[ebp-44]
mov eax,dword ptr ds:[edx+eax*8]
mov dword ptr ss:[ebp-48],eax
push eax
push ecx
xor esi,esi
push esi
push edi
call oglmdi2_vs7.4072F3
add esp,10
mov dword ptr ss:[ebp-1C],esi
mov dword ptr ss:[ebp-4],esi
mov esi,dword ptr ss:[ebp+8]
or dword ptr ss:[ebp-4],FFFFFFFF
call oglmdi2_vs7.40754A
mov eax,dword ptr ss:[ebp-1C]
call oglmdi2_vs7.406343
ret 
inc edx
jmp oglmdi2_vs7.4074EC
mov edi,dword ptr ss:[ebp+C]
mov esi,dword ptr ss:[ebp+8]
mov eax,dword ptr ss:[ebp-24]
mov dword ptr ds:[edi-4],eax
push dword ptr ss:[ebp-30]
call oglmdi2_vs7.404FB5
pop ecx
mov eax,dword ptr ss:[ebp-34]
mov dword ptr ds:[412218],eax
mov eax,dword ptr ss:[ebp-38]
mov dword ptr ds:[41221C],eax
cmp dword ptr ds:[esi],E06D7363
jne oglmdi2_vs7.4075A7
cmp dword ptr ds:[esi+10],3
jne oglmdi2_vs7.4075A7
cmp dword ptr ds:[esi+14],19930520
jne oglmdi2_vs7.4075A7
cmp dword ptr ss:[ebp-20],0
jne oglmdi2_vs7.4075A7
cmp dword ptr ss:[ebp-1C],0
je oglmdi2_vs7.4075A7
push dword ptr ds:[esi+18]
call oglmdi2_vs7.404F9A
pop ecx
test eax,eax
je oglmdi2_vs7.4075A7
call oglmdi2_vs7.405196
push eax
push esi
call oglmdi2_vs7.4073B0
pop ecx
pop ecx
ret 
push 8
push oglmdi2_vs7.40EA28
call oglmdi2_vs7.406308
mov esi,ecx
mov eax,dword ptr ss:[ebp+C]
mov edi,edx
mov ebx,dword ptr ss:[ebp+8]
mov ecx,dword ptr ds:[eax+4]
test ecx,ecx
je oglmdi2_vs7.407712
cmp byte ptr ds:[ecx+8],0
je oglmdi2_vs7.407712
mov ecx,dword ptr ds:[eax+8]
test ecx,ecx
jne oglmdi2_vs7.4075E4
test byte ptr ds:[eax+3],80
je oglmdi2_vs7.407712
mov eax,dword ptr ds:[eax]
test eax,eax
js oglmdi2_vs7.4075EE
lea edi,dword ptr ds:[ecx+edi+C]
and dword ptr ss:[ebp-4],0
push 1
push dword ptr ds:[ebx+18]
test al,8
je oglmdi2_vs7.407630
call oglmdi2_vs7.40B09E
pop ecx
pop ecx
test eax,eax
je oglmdi2_vs7.407709
push 1
push edi
call oglmdi2_vs7.40B0BA
pop ecx
pop ecx
test eax,eax
je oglmdi2_vs7.407709
mov eax,dword ptr ds:[ebx+18]
mov dword ptr ds:[edi],eax
lea ecx,dword ptr ds:[esi+8]
call oglmdi2_vs7.4073F5
mov dword ptr ds:[edi],eax
jmp oglmdi2_vs7.40770E
test byte ptr ds:[esi],1
je oglmdi2_vs7.40767B
call oglmdi2_vs7.40B09E
pop ecx
pop ecx
test eax,eax
je oglmdi2_vs7.407709
push 1
push edi
call oglmdi2_vs7.40B0BA
pop ecx
pop ecx
test eax,eax
je oglmdi2_vs7.407709
push dword ptr ds:[esi+14]
push dword ptr ds:[ebx+18]
push edi
call oglmdi2_vs7.405C70
add esp,C
cmp dword ptr ds:[esi+14],4
jne oglmdi2_vs7.40770E
mov eax,dword ptr ds:[edi]
test eax,eax
je oglmdi2_vs7.40770E
jmp oglmdi2_vs7.407621
cmp dword ptr ds:[esi+18],0
jne oglmdi2_vs7.4076B4
call oglmdi2_vs7.40B09E
pop ecx
pop ecx
test eax,eax
je oglmdi2_vs7.407709
push 1
push edi
call oglmdi2_vs7.40B0BA
pop ecx
pop ecx
test eax,eax
je oglmdi2_vs7.407709
push dword ptr ds:[esi+14]
lea ecx,dword ptr ds:[esi+8]
mov eax,dword ptr ds:[ebx+18]
call oglmdi2_vs7.4073F5
push eax
push edi
call oglmdi2_vs7.405C70
add esp,C
jmp oglmdi2_vs7.40770E
call oglmdi2_vs7.40B09E
pop ecx
pop ecx
test eax,eax
je oglmdi2_vs7.407709
push 1
push edi
call oglmdi2_vs7.40B0BA
pop ecx
pop ecx
test eax,eax
je oglmdi2_vs7.407709
push dword ptr ds:[esi+18]
call oglmdi2_vs7.40B0D6
pop ecx
test eax,eax
je oglmdi2_vs7.407709
mov eax,dword ptr ds:[ebx+18]
lea ecx,dword ptr ds:[esi+8]
test byte ptr ds:[esi],4
je oglmdi2_vs7.4076F8
push 1
call oglmdi2_vs7.4073F5
push eax
push dword ptr ds:[esi+18]
push edi
call oglmdi2_vs7.404DE3
jmp oglmdi2_vs7.40770E
call oglmdi2_vs7.4073F5
push eax
push dword ptr ds:[esi+18]
push edi
call oglmdi2_vs7.404DE3
jmp oglmdi2_vs7.40770E
call oglmdi2_vs7.4062D9
or dword ptr ss:[ebp-4],FFFFFFFF
call oglmdi2_vs7.406343
ret 
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
jmp oglmdi2_vs7.4062AC
push ebp
mov ebp,esp
test ecx,ecx
je oglmdi2_vs7.407738
push ebx
push dword ptr ss:[ebp+8]
mov edx,esi
call oglmdi2_vs7.4075A8
pop ecx
pop ecx
cmp dword ptr ss:[ebp+1C],0
push dword ptr ss:[ebp+8]
jne oglmdi2_vs7.407744
push esi
jmp oglmdi2_vs7.407747
push dword ptr ss:[ebp+1C]
call oglmdi2_vs7.404DEA
push dword ptr ds:[edi]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push esi
call oglmdi2_vs7.4072F3
mov eax,dword ptr ds:[edi+4]
push 100
push dword ptr ss:[ebp+18]
inc eax
push dword ptr ss:[ebp+14]
mov dword ptr ds:[esi+8],eax
push dword ptr ss:[ebp+C]
mov ecx,dword ptr ds:[ebx+C]
push esi
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.407412
add esp,28
test eax,eax
je oglmdi2_vs7.407789
push esi
push eax
call oglmdi2_vs7.404DB3
pop ebp
ret 
push ebp
mov ebp,esp
push ecx
push ecx
mov eax,dword ptr ss:[ebp+8]
cmp dword ptr ds:[eax],80000003
je oglmdi2_vs7.40784B
cmp dword ptr ds:[4121FC],0
je oglmdi2_vs7.4077CB
push dword ptr ss:[ebp+24]
push dword ptr ss:[ebp+20]
push dword ptr ss:[ebp+18]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push eax
call oglmdi2_vs7.40503F
add esp,1C
test eax,eax
jne oglmdi2_vs7.40784B
push esi
mov esi,dword ptr ss:[ebp+1C]
push edi
lea eax,dword ptr ss:[ebp-8]
push eax
lea eax,dword ptr ss:[ebp-4]
push eax
push esi
push dword ptr ss:[ebp+20]
push dword ptr ss:[ebp+18]
call oglmdi2_vs7.404F07
mov edi,eax
mov eax,dword ptr ss:[ebp-4]
add esp,14
cmp eax,dword ptr ss:[ebp-8]
jae oglmdi2_vs7.407849
push ebx
cmp esi,dword ptr ds:[edi]
jl oglmdi2_vs7.40783A
cmp esi,dword ptr ds:[edi+4]
jg oglmdi2_vs7.40783A
mov eax,dword ptr ds:[edi+C]
mov ecx,dword ptr ds:[edi+10]
shl eax,4
add eax,ecx
mov ecx,dword ptr ds:[eax-C]
test ecx,ecx
je oglmdi2_vs7.407813
cmp byte ptr ds:[ecx+8],0
jne oglmdi2_vs7.40783A
mov esi,dword ptr ss:[ebp+C]
push 1
push dword ptr ss:[ebp+24]
lea ebx,dword ptr ds:[eax-10]
push dword ptr ss:[ebp+20]
xor ecx,ecx
push dword ptr ss:[ebp+18]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.407724
mov esi,dword ptr ss:[ebp+1C]
add esp,1C
inc dword ptr ss:[ebp-4]
mov eax,dword ptr ss:[ebp-4]
add edi,14
cmp eax,dword ptr ss:[ebp-8]
jb oglmdi2_vs7.4077F2
pop ebx
pop edi
pop esi
leave 
ret 
push ebp
mov ebp,esp
sub esp,24
mov eax,dword ptr ss:[ebp+C]
mov eax,dword ptr ds:[eax+8]
and byte ptr ss:[ebp-1C],0
cmp eax,FFFFFFFF
mov dword ptr ss:[ebp-18],eax
jl oglmdi2_vs7.40786D
mov ecx,dword ptr ss:[ebp+18]
cmp eax,dword ptr ds:[ecx+4]
jl oglmdi2_vs7.407872
call oglmdi2_vs7.4062D9
push ebx
mov ebx,dword ptr ss:[ebp+8]
cmp dword ptr ds:[ebx],E06D7363
push esi
push edi
jne oglmdi2_vs7.4079F9
cmp dword ptr ds:[ebx+10],3
mov edi,19930520
jne oglmdi2_vs7.4078F3
cmp dword ptr ds:[ebx+14],edi
jne oglmdi2_vs7.4078F3
cmp dword ptr ds:[ebx+1C],0
jne oglmdi2_vs7.4078F3
mov eax,dword ptr ds:[412218]
test eax,eax
je oglmdi2_vs7.4079F1
mov esi,eax
mov eax,dword ptr ds:[41221C]
push 1
push esi
mov dword ptr ss:[ebp+8],esi
mov dword ptr ss:[ebp+10],eax
mov byte ptr ss:[ebp-1C],1
call oglmdi2_vs7.40B09E
test eax,eax
pop ecx
pop ecx
jne oglmdi2_vs7.4078CB
call oglmdi2_vs7.4062D9
cmp dword ptr ds:[esi],E06D7363
jne oglmdi2_vs7.4079F6
mov eax,dword ptr ss:[ebp+8]
cmp dword ptr ds:[eax+10],3
jne oglmdi2_vs7.4078F0
cmp dword ptr ds:[eax+14],edi
jne oglmdi2_vs7.4078F0
cmp dword ptr ds:[eax+1C],0
jne oglmdi2_vs7.4078F0
call oglmdi2_vs7.4062D9
mov ebx,dword ptr ss:[ebp+8]
cmp dword ptr ds:[ebx],E06D7363
jne oglmdi2_vs7.4079F9
cmp dword ptr ds:[ebx+10],3
jne oglmdi2_vs7.4079F9
cmp dword ptr ds:[ebx+14],edi
jne oglmdi2_vs7.4079F9
mov esi,dword ptr ss:[ebp-18]
lea eax,dword ptr ss:[ebp-20]
push eax
lea eax,dword ptr ss:[ebp-8]
push eax
push esi
push dword ptr ss:[ebp+20]
push dword ptr ss:[ebp+18]
call oglmdi2_vs7.404F07
mov ecx,dword ptr ss:[ebp-8]
add esp,14
cmp ecx,dword ptr ss:[ebp-20]
mov dword ptr ss:[ebp-4],eax
jae oglmdi2_vs7.4079E1
jmp oglmdi2_vs7.407940
mov esi,dword ptr ss:[ebp-18]
cmp dword ptr ds:[eax],esi
jg oglmdi2_vs7.4079CC
cmp esi,dword ptr ds:[eax+4]
jg oglmdi2_vs7.4079CC
mov ecx,dword ptr ds:[eax+C]
test ecx,ecx
mov esi,dword ptr ds:[eax+10]
mov dword ptr ss:[ebp-14],ecx
jle oglmdi2_vs7.4079CC
mov ecx,dword ptr ds:[ebx+1C]
mov ecx,dword ptr ds:[ecx+C]
lea edx,dword ptr ds:[ecx+4]
mov ecx,dword ptr ds:[ecx]
test ecx,ecx
mov dword ptr ss:[ebp-C],edx
mov dword ptr ss:[ebp-10],ecx
jle oglmdi2_vs7.407993
mov eax,dword ptr ss:[ebp-C]
mov edi,dword ptr ds:[eax]
push dword ptr ds:[ebx+1C]
mov dword ptr ss:[ebp-24],edi
call oglmdi2_vs7.40728B
test eax,eax
pop ecx
jne oglmdi2_vs7.4079A1
dec dword ptr ss:[ebp-10]
add dword ptr ss:[ebp-C],4
cmp dword ptr ss:[ebp-10],eax
jg oglmdi2_vs7.40796F
mov eax,dword ptr ss:[ebp-4]
dec dword ptr ss:[ebp-14]
add esi,10
cmp dword ptr ss:[ebp-14],0
jg oglmdi2_vs7.40795A
jmp oglmdi2_vs7.4079CC
push dword ptr ss:[ebp-1C]
mov edi,dword ptr ss:[ebp-4]
push dword ptr ss:[ebp+24]
mov ecx,dword ptr ss:[ebp-24]
push dword ptr ss:[ebp+20]
push dword ptr ss:[ebp+18]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push ebx
mov ebx,esi
mov esi,dword ptr ss:[ebp+C]
call oglmdi2_vs7.407724
mov ebx,dword ptr ss:[ebp+8]
add esp,1C
mov eax,edi
inc dword ptr ss:[ebp-8]
mov ecx,dword ptr ss:[ebp-8]
add eax,14
cmp ecx,dword ptr ss:[ebp-20]
mov dword ptr ss:[ebp-4],eax
jb oglmdi2_vs7.40793D
cmp byte ptr ss:[ebp+1C],0
je oglmdi2_vs7.4079F1
push 1
push ebx
call oglmdi2_vs7.4073B0
pop ecx
pop ecx
pop edi
pop esi
pop ebx
leave 
ret 
mov ebx,dword ptr ss:[ebp+8]
cmp byte ptr ss:[ebp+1C],0
jne oglmdi2_vs7.407A1F
push dword ptr ss:[ebp+24]
push dword ptr ss:[ebp+20]
push dword ptr ss:[ebp-18]
push dword ptr ss:[ebp+18]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push ebx
call oglmdi2_vs7.40778B
add esp,20
jmp oglmdi2_vs7.4079F1
jmp oglmdi2_vs7.4062AC
push ebp
mov ebp,esp
push esi
mov esi,dword ptr ss:[ebp+18]
mov eax,dword ptr ds:[esi]
push edi
and eax,1FFFFFFF
mov edi,19930520
cmp eax,edi
je oglmdi2_vs7.407A41
call oglmdi2_vs7.4062D9
mov eax,dword ptr ss:[ebp+8]
test byte ptr ds:[eax+4],66
je oglmdi2_vs7.407A69
cmp dword ptr ds:[esi+4],0
je oglmdi2_vs7.407ABF
cmp dword ptr ss:[ebp+1C],0
jne oglmdi2_vs7.407ABF
push FFFFFFFF
push esi
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+C]
call oglmdi2_vs7.4072F3
add esp,10
jmp oglmdi2_vs7.407ABF
cmp dword ptr ds:[esi+C],0
je oglmdi2_vs7.407ABF
cmp dword ptr ds:[eax],E06D7363
jne oglmdi2_vs7.407AA3
cmp dword ptr ds:[eax+14],edi
jbe oglmdi2_vs7.407AA3
mov ecx,dword ptr ds:[eax+1C]
mov ecx,dword ptr ds:[ecx+8]
test ecx,ecx
je oglmdi2_vs7.407AA3
movzx edx,byte ptr ss:[ebp+24]
push edx
push dword ptr ss:[ebp+20]
push dword ptr ss:[ebp+1C]
push esi
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push eax
call ecx
add esp,20
jmp oglmdi2_vs7.407AC2
push dword ptr ss:[ebp+20]
push dword ptr ss:[ebp+1C]
push dword ptr ss:[ebp+24]
push esi
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push eax
call oglmdi2_vs7.40784D
add esp,20
xor eax,eax
inc eax
pop edi
pop esi
pop ebp
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
sub esp,4
push ebx
push ecx
mov eax,dword ptr ss:[ebp+C]
add eax,C
mov dword ptr ss:[ebp-4],eax
mov eax,dword ptr ss:[ebp+8]
push ebp
push dword ptr ss:[ebp+10]
mov ecx,dword ptr ss:[ebp+10]
mov ebp,dword ptr ss:[ebp-4]
call oglmdi2_vs7.4051B9
push esi
push edi
call eax
pop edi
pop esi
mov ebx,ebp
pop ebp
mov ecx,dword ptr ss:[ebp+10]
push ebp
mov ebp,ebx
cmp ecx,100
jne oglmdi2_vs7.407B0F
mov ecx,2
push ecx
call oglmdi2_vs7.4051B9
pop ebp
pop ecx
pop ebx
leave 
ret C
cmp dword ptr ds:[412234],2
jne oglmdi2_vs7.407B32
cmp dword ptr ds:[412240],5
jb oglmdi2_vs7.407B32
xor eax,eax
inc eax
ret 
push 3
pop eax
ret 
xor eax,eax
cmp dword ptr ss:[esp+4],eax
push 0
sete al
push 1000
push eax
call dword ptr ds:[<&HeapCreate>]
test eax,eax
mov dword ptr ds:[4128CC],eax
je oglmdi2_vs7.407B80
call oglmdi2_vs7.407B1C
cmp eax,3
mov dword ptr ds:[4128D0],eax
jne oglmdi2_vs7.407B83
push 3F8
call oglmdi2_vs7.407B87
test eax,eax
pop ecx
jne oglmdi2_vs7.407B83
push dword ptr ds:[4128CC]
call dword ptr ds:[<&HeapDestroy>]
xor eax,eax
ret 
xor eax,eax
inc eax
ret 
push 140
push 0
push dword ptr ds:[4128CC]
call dword ptr ds:[<&RtlAllocateHeap>]
test eax,eax
mov dword ptr ds:[4128B8],eax
jne oglmdi2_vs7.407BA4
ret 
mov ecx,dword ptr ss:[esp+4]
and dword ptr ds:[4128B0],0
and dword ptr ds:[4128B4],0
mov dword ptr ds:[4128C0],eax
xor eax,eax
mov dword ptr ds:[4128BC],ecx
mov dword ptr ds:[4128C4],10
inc eax
ret 
mov eax,dword ptr ds:[4128B4]
lea ecx,dword ptr ds:[eax+eax*4]
mov eax,dword ptr ds:[4128B8]
lea ecx,dword ptr ds:[eax+ecx*4]
jmp oglmdi2_vs7.407BF3
mov edx,dword ptr ss:[esp+4]
sub edx,dword ptr ds:[eax+C]
cmp edx,100000
jb oglmdi2_vs7.407BF9
add eax,14
cmp eax,ecx
jb oglmdi2_vs7.407BE1
xor eax,eax
ret 
push ebp
mov ebp,esp
sub esp,10
mov ecx,dword ptr ss:[ebp+8]
mov eax,dword ptr ds:[ecx+10]
push esi
mov esi,dword ptr ss:[ebp+C]
push edi
mov edi,esi
sub edi,dword ptr ds:[ecx+C]
add esi,FFFFFFFC
shr edi,F
mov ecx,edi
imul ecx,ecx,204
lea ecx,dword ptr ds:[ecx+eax+144]
mov dword ptr ss:[ebp-10],ecx
mov ecx,dword ptr ds:[esi]
dec ecx
test cl,1
mov dword ptr ss:[ebp-4],ecx
jne oglmdi2_vs7.407F0E
push ebx
lea ebx,dword ptr ds:[ecx+esi]
mov edx,dword ptr ds:[ebx]
mov dword ptr ss:[ebp-C],edx
mov edx,dword ptr ds:[esi-4]
mov dword ptr ss:[ebp-8],edx
mov edx,dword ptr ss:[ebp-C]
test dl,1
mov dword ptr ss:[ebp+C],ebx
jne oglmdi2_vs7.407CC5
sar edx,4
dec edx
cmp edx,3F
jbe oglmdi2_vs7.407C5D
push 3F
pop edx
mov ecx,dword ptr ds:[ebx+4]
cmp ecx,dword ptr ds:[ebx+8]
jne oglmdi2_vs7.407CA7
cmp edx,20
mov ebx,80000000
jae oglmdi2_vs7.407C88
mov ecx,edx
shr ebx,cl
lea ecx,dword ptr ds:[edx+eax+4]
not ebx
and dword ptr ds:[eax+edi*4+44],ebx
dec byte ptr ds:[ecx]
jne oglmdi2_vs7.407CA4
mov ecx,dword ptr ss:[ebp+8]
and dword ptr ds:[ecx],ebx
jmp oglmdi2_vs7.407CA4
lea ecx,dword ptr ds:[edx-20]
shr ebx,cl
lea ecx,dword ptr ds:[edx+eax+4]
not ebx
and dword ptr ds:[eax+edi*4+C4],ebx
dec byte ptr ds:[ecx]
jne oglmdi2_vs7.407CA4
mov ecx,dword ptr ss:[ebp+8]
and dword ptr ds:[ecx+4],ebx
mov ebx,dword ptr ss:[ebp+C]
mov edx,dword ptr ds:[ebx+8]
mov ebx,dword ptr ds:[ebx+4]
mov ecx,dword ptr ss:[ebp-4]
add ecx,dword ptr ss:[ebp-C]
mov dword ptr ds:[edx+4],ebx
mov edx,dword ptr ss:[ebp+C]
mov ebx,dword ptr ds:[edx+4]
mov edx,dword ptr ds:[edx+8]
mov dword ptr ds:[ebx+8],edx
mov dword ptr ss:[ebp-4],ecx
mov edx,ecx
sar edx,4
dec edx
cmp edx,3F
jbe oglmdi2_vs7.407CD3
push 3F
pop edx
mov ebx,dword ptr ss:[ebp-8]
and ebx,1
mov dword ptr ss:[ebp-C],ebx
jne oglmdi2_vs7.407D71
sub esi,dword ptr ss:[ebp-8]
mov ebx,dword ptr ss:[ebp-8]
sar ebx,4
push 3F
mov dword ptr ss:[ebp+C],esi
dec ebx
pop esi
cmp ebx,esi
jbe oglmdi2_vs7.407CF8
mov ebx,esi
add ecx,dword ptr ss:[ebp-8]
mov edx,ecx
sar edx,4
dec edx
cmp edx,esi
mov dword ptr ss:[ebp-4],ecx
jbe oglmdi2_vs7.407D0A
mov edx,esi
cmp ebx,edx
je oglmdi2_vs7.407D6C
mov ecx,dword ptr ss:[ebp+C]
mov esi,dword ptr ds:[ecx+4]
cmp esi,dword ptr ds:[ecx+8]
jne oglmdi2_vs7.407D54
cmp ebx,20
mov esi,80000000
jae oglmdi2_vs7.407D3A
mov ecx,ebx
shr esi,cl
not esi
and dword ptr ds:[eax+edi*4+44],esi
dec byte ptr ds:[ebx+eax+4]
jne oglmdi2_vs7.407D54
mov ecx,dword ptr ss:[ebp+8]
and dword ptr ds:[ecx],esi
jmp oglmdi2_vs7.407D54
lea ecx,dword ptr ds:[ebx-20]
shr esi,cl
not esi
and dword ptr ds:[eax+edi*4+C4],esi
dec byte ptr ds:[ebx+eax+4]
jne oglmdi2_vs7.407D54
mov ecx,dword ptr ss:[ebp+8]
and dword ptr ds:[ecx+4],esi
mov ecx,dword ptr ss:[ebp+C]
mov esi,dword ptr ds:[ecx+8]
mov ecx,dword ptr ds:[ecx+4]
mov dword ptr ds:[esi+4],ecx
mov ecx,dword ptr ss:[ebp+C]
mov esi,dword ptr ds:[ecx+4]
mov ecx,dword ptr ds:[ecx+8]
mov dword ptr ds:[esi+8],ecx
mov esi,dword ptr ss:[ebp+C]
jmp oglmdi2_vs7.407D74
mov ebx,dword ptr ss:[ebp+8]
cmp dword ptr ss:[ebp-C],0
jne oglmdi2_vs7.407D82
cmp ebx,edx
je oglmdi2_vs7.407E02
mov ecx,dword ptr ss:[ebp-10]
lea ecx,dword ptr ds:[ecx+edx*8]
mov ebx,dword ptr ds:[ecx+4]
mov dword ptr ds:[esi+8],ecx
mov dword ptr ds:[esi+4],ebx
mov dword ptr ds:[ecx+4],esi
mov ecx,dword ptr ds:[esi+4]
mov dword ptr ds:[ecx+8],esi
mov ecx,dword ptr ds:[esi+4]
cmp ecx,dword ptr ds:[esi+8]
jne oglmdi2_vs7.407E02
mov cl,byte ptr ds:[edx+eax+4]
mov byte ptr ss:[ebp+F],cl
inc cl
cmp edx,20
mov byte ptr ds:[edx+eax+4],cl
jae oglmdi2_vs7.407DD9
cmp byte ptr ss:[ebp+F],0
jne oglmdi2_vs7.407DC8
mov ecx,edx
mov ebx,80000000
shr ebx,cl
mov ecx,dword ptr ss:[ebp+8]
or dword ptr ds:[ecx],ebx
mov ebx,80000000
mov ecx,edx
shr ebx,cl
lea eax,dword ptr ds:[eax+edi*4+44]
or dword ptr ds:[eax],ebx
jmp oglmdi2_vs7.407E02
cmp byte ptr ss:[ebp+F],0
jne oglmdi2_vs7.407DEF
lea ecx,dword ptr ds:[edx-20]
mov ebx,80000000
shr ebx,cl
mov ecx,dword ptr ss:[ebp+8]
or dword ptr ds:[ecx+4],ebx
lea ecx,dword ptr ds:[edx-20]
mov edx,80000000
shr edx,cl
lea eax,dword ptr ds:[eax+edi*4+C4]
or dword ptr ds:[eax],edx
mov eax,dword ptr ss:[ebp-4]
mov dword ptr ds:[esi],eax
mov dword ptr ds:[eax+esi-4],eax
mov eax,dword ptr ss:[ebp-10]
dec dword ptr ds:[eax]
jne oglmdi2_vs7.407F0D
mov eax,dword ptr ds:[4128B0]
test eax,eax
je oglmdi2_vs7.407EFF
mov ecx,dword ptr ds:[4128C8]
mov esi,dword ptr ds:[<&VirtualFree>]
push 4000
shl ecx,F
add ecx,dword ptr ds:[eax+C]
mov ebx,8000
push ebx
push ecx
call esi
mov ecx,dword ptr ds:[4128C8]
mov eax,dword ptr ds:[4128B0]
mov edx,80000000
shr edx,cl
or dword ptr ds:[eax+8],edx
mov eax,dword ptr ds:[4128B0]
mov eax,dword ptr ds:[eax+10]
mov ecx,dword ptr ds:[4128C8]
and dword ptr ds:[eax+ecx*4+C4],0
mov eax,dword ptr ds:[4128B0]
mov eax,dword ptr ds:[eax+10]
dec byte ptr ds:[eax+43]
mov eax,dword ptr ds:[4128B0]
mov ecx,dword ptr ds:[eax+10]
cmp byte ptr ds:[ecx+43],0
jne oglmdi2_vs7.407E90
and dword ptr ds:[eax+4],FFFFFFFE
mov eax,dword ptr ds:[4128B0]
cmp dword ptr ds:[eax+8],FFFFFFFF
jne oglmdi2_vs7.407EFF
push ebx
push 0
push dword ptr ds:[eax+C]
call esi
mov eax,dword ptr ds:[4128B0]
push dword ptr ds:[eax+10]
push 0
push dword ptr ds:[4128CC]
call dword ptr ds:[<&HeapFree>]
mov eax,dword ptr ds:[4128B4]
mov edx,dword ptr ds:[4128B8]
lea eax,dword ptr ds:[eax+eax*4]
shl eax,2
mov ecx,eax
mov eax,dword ptr ds:[4128B0]
sub ecx,eax
lea ecx,dword ptr ds:[ecx+edx-14]
push ecx
lea ecx,dword ptr ds:[eax+14]
push ecx
push eax
call oglmdi2_vs7.405C70
mov eax,dword ptr ss:[ebp+8]
add esp,C
dec dword ptr ds:[4128B4]
cmp eax,dword ptr ds:[4128B0]
jbe oglmdi2_vs7.407EF5
sub dword ptr ss:[ebp+8],14
mov eax,dword ptr ds:[4128B8]
mov dword ptr ds:[4128C0],eax
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ds:[4128B0],eax
mov dword ptr ds:[4128C8],edi
pop ebx
pop edi
pop esi
leave 
ret 
mov eax,dword ptr ds:[4128B4]
mov ecx,dword ptr ds:[4128C4]
push edi
xor edi,edi
cmp eax,ecx
jne oglmdi2_vs7.407F58
lea eax,dword ptr ds:[ecx+ecx*4+50]
shl eax,2
push eax
push dword ptr ds:[4128B8]
push edi
push dword ptr ds:[4128CC]
call dword ptr ds:[<&RtlReAllocateHeap>]
cmp eax,edi
jne oglmdi2_vs7.407F47
xor eax,eax
pop edi
ret 
add dword ptr ds:[4128C4],10
mov dword ptr ds:[4128B8],eax
mov eax,dword ptr ds:[4128B4]
mov ecx,dword ptr ds:[4128B8]
push esi
push 41C4
push 8
push dword ptr ds:[4128CC]
lea eax,dword ptr ds:[eax+eax*4]
lea esi,dword ptr ds:[ecx+eax*4]
call dword ptr ds:[<&RtlAllocateHeap>]
cmp eax,edi
mov dword ptr ds:[esi+10],eax
jne oglmdi2_vs7.407F83
xor eax,eax
jmp oglmdi2_vs7.407FC6
push 4
push 2000
push 100000
push edi
call dword ptr ds:[<&VirtualAlloc>]
cmp eax,edi
mov dword ptr ds:[esi+C],eax
jne oglmdi2_vs7.407FAF
push dword ptr ds:[esi+10]
push edi
push dword ptr ds:[4128CC]
call dword ptr ds:[<&HeapFree>]
jmp oglmdi2_vs7.407F7F
or dword ptr ds:[esi+8],FFFFFFFF
mov dword ptr ds:[esi],edi
mov dword ptr ds:[esi+4],edi
inc dword ptr ds:[4128B4]
mov eax,dword ptr ds:[esi+10]
or dword ptr ds:[eax],FFFFFFFF
mov eax,esi
pop esi
pop edi
ret 
push ebp
mov ebp,esp
push ecx
push ecx
mov ecx,dword ptr ss:[ebp+8]
mov eax,dword ptr ds:[ecx+8]
push ebx
push esi
mov esi,dword ptr ds:[ecx+10]
push edi
xor ebx,ebx
jmp oglmdi2_vs7.407FE1
shl eax,1
inc ebx
test eax,eax
jge oglmdi2_vs7.407FDE
mov eax,ebx
imul eax,eax,204
lea eax,dword ptr ds:[eax+esi+144]
push 3F
mov dword ptr ss:[ebp-8],eax
pop edx
mov dword ptr ds:[eax+8],eax
mov dword ptr ds:[eax+4],eax
add eax,8
dec edx
jne oglmdi2_vs7.407FFA
push 4
mov edi,ebx
push 1000
shl edi,F
add edi,dword ptr ds:[ecx+C]
push 8000
push edi
call dword ptr ds:[<&VirtualAlloc>]
test eax,eax
jne oglmdi2_vs7.40802D
or eax,FFFFFFFF
jmp oglmdi2_vs7.4080CA
lea edx,dword ptr ds:[edi+7000]
cmp edi,edx
mov dword ptr ss:[ebp-4],edx
ja oglmdi2_vs7.40807D
mov ecx,edx
sub ecx,edi
shr ecx,C
lea eax,dword ptr ds:[edi+10]
inc ecx
or dword ptr ds:[eax-8],FFFFFFFF
or dword ptr ds:[eax+FEC],FFFFFFFF
lea edx,dword ptr ds:[eax+FFC]
mov dword ptr ds:[eax],edx
lea edx,dword ptr ds:[eax-1004]
mov dword ptr ds:[eax-4],FF0
mov dword ptr ds:[eax+4],edx
mov dword ptr ds:[eax+FE8],FF0
add eax,1000
dec ecx
jne oglmdi2_vs7.408045
mov edx,dword ptr ss:[ebp-4]
mov eax,dword ptr ss:[ebp-8]
add eax,1F8
lea ecx,dword ptr ds:[edi+C]
mov dword ptr ds:[eax+4],ecx
mov dword ptr ds:[ecx+8],eax
lea ecx,dword ptr ds:[edx+C]
mov dword ptr ds:[eax+8],ecx
mov dword ptr ds:[ecx+4],eax
and dword ptr ds:[esi+ebx*4+44],0
xor edi,edi
inc edi
mov dword ptr ds:[esi+ebx*4+C4],edi
mov al,byte ptr ds:[esi+43]
mov cl,al
inc cl
test al,al
mov eax,dword ptr ss:[ebp+8]
mov byte ptr ds:[esi+43],cl
jne oglmdi2_vs7.4080BA
or dword ptr ds:[eax+4],edi
mov edx,80000000
mov ecx,ebx
shr edx,cl
not edx
and dword ptr ds:[eax+8],edx
mov eax,ebx
pop edi
pop esi
pop ebx
leave 
ret 
push ebp
mov ebp,esp
sub esp,C
mov ecx,dword ptr ss:[ebp+8]
mov eax,dword ptr ds:[ecx+10]
push ebx
push esi
mov esi,dword ptr ss:[ebp+10]
push edi
mov edi,dword ptr ss:[ebp+C]
mov edx,edi
sub edx,dword ptr ds:[ecx+C]
add esi,17
shr edx,F
mov ecx,edx
imul ecx,ecx,204
lea ecx,dword ptr ds:[ecx+eax+144]
mov dword ptr ss:[ebp-C],ecx
mov ecx,dword ptr ds:[edi-4]
and esi,FFFFFFF0
dec ecx
cmp esi,ecx
lea edi,dword ptr ds:[ecx+edi-4]
mov ebx,dword ptr ds:[edi]
mov dword ptr ss:[ebp+10],ecx
mov dword ptr ss:[ebp-4],ebx
jle oglmdi2_vs7.408271
test bl,1
jne oglmdi2_vs7.40826A
add ebx,ecx
cmp esi,ebx
jg oglmdi2_vs7.40826A
mov ecx,dword ptr ss:[ebp-4]
sar ecx,4
dec ecx
cmp ecx,3F
mov dword ptr ss:[ebp-8],ecx
jbe oglmdi2_vs7.408144
push 3F
pop ecx
mov dword ptr ss:[ebp-8],ecx
mov ebx,dword ptr ds:[edi+4]
cmp ebx,dword ptr ds:[edi+8]
jne oglmdi2_vs7.40818F
cmp ecx,20
mov ebx,80000000
jae oglmdi2_vs7.408170
shr ebx,cl
mov ecx,dword ptr ss:[ebp-8]
lea ecx,dword ptr ds:[ecx+eax+4]
not ebx
and dword ptr ds:[eax+edx*4+44],ebx
dec byte ptr ds:[ecx]
jne oglmdi2_vs7.40818F
mov ecx,dword ptr ss:[ebp+8]
and dword ptr ds:[ecx],ebx
jmp oglmdi2_vs7.40818F
add ecx,FFFFFFE0
shr ebx,cl
mov ecx,dword ptr ss:[ebp-8]
lea ecx,dword ptr ds:[ecx+eax+4]
not ebx
and dword ptr ds:[eax+edx*4+C4],ebx
dec byte ptr ds:[ecx]
jne oglmdi2_vs7.40818F
mov ecx,dword ptr ss:[ebp+8]
and dword ptr ds:[ecx+4],ebx
mov ecx,dword ptr ds:[edi+8]
mov ebx,dword ptr ds:[edi+4]
mov dword ptr ds:[ecx+4],ebx
mov ecx,dword ptr ds:[edi+4]
mov edi,dword ptr ds:[edi+8]
mov dword ptr ds:[ecx+8],edi
mov ecx,dword ptr ss:[ebp+10]
sub ecx,esi
add dword ptr ss:[ebp-4],ecx
cmp dword ptr ss:[ebp-4],0
jle oglmdi2_vs7.408258
mov edi,dword ptr ss:[ebp-4]
mov ecx,dword ptr ss:[ebp+C]
sar edi,4
dec edi
cmp edi,3F
lea ecx,dword ptr ds:[ecx+esi-4]
jbe oglmdi2_vs7.4081C9
push 3F
pop edi
mov ebx,dword ptr ss:[ebp-C]
lea ebx,dword ptr ds:[ebx+edi*8]
mov dword ptr ss:[ebp+10],ebx
mov ebx,dword ptr ds:[ebx+4]
mov dword ptr ds:[ecx+4],ebx
mov ebx,dword ptr ss:[ebp+10]
mov dword ptr ds:[ecx+8],ebx
mov dword ptr ds:[ebx+4],ecx
mov ebx,dword ptr ds:[ecx+4]
mov dword ptr ds:[ebx+8],ecx
mov ebx,dword ptr ds:[ecx+4]
cmp ebx,dword ptr ds:[ecx+8]
jne oglmdi2_vs7.408246
mov cl,byte ptr ds:[edi+eax+4]
mov byte ptr ss:[ebp+13],cl
inc cl
cmp edi,20
mov byte ptr ds:[edi+eax+4],cl
jae oglmdi2_vs7.40821D
cmp byte ptr ss:[ebp+13],0
jne oglmdi2_vs7.408215
mov ecx,edi
mov ebx,80000000
shr ebx,cl
mov ecx,dword ptr ss:[ebp+8]
or dword ptr ds:[ecx],ebx
lea eax,dword ptr ds:[eax+edx*4+44]
mov ecx,edi
jmp oglmdi2_vs7.40823D
cmp byte ptr ss:[ebp+13],0
jne oglmdi2_vs7.408233
lea ecx,dword ptr ds:[edi-20]
mov ebx,80000000
shr ebx,cl
mov ecx,dword ptr ss:[ebp+8]
or dword ptr ds:[ecx+4],ebx
lea eax,dword ptr ds:[eax+edx*4+C4]
lea ecx,dword ptr ds:[edi-20]
mov edx,80000000
shr edx,cl
or dword ptr ds:[eax],edx
mov edx,dword ptr ss:[ebp+C]
mov ecx,dword ptr ss:[ebp-4]
lea eax,dword ptr ds:[edx+esi-4]
mov dword ptr ds:[eax],ecx
mov dword ptr ds:[ecx+eax-4],ecx
jmp oglmdi2_vs7.40825B
mov edx,dword ptr ss:[ebp+C]
lea eax,dword ptr ds:[esi+1]
mov dword ptr ds:[edx-4],eax
mov dword ptr ds:[edx+esi-8],eax
jmp oglmdi2_vs7.4083A6
xor eax,eax
jmp oglmdi2_vs7.4083A9
jge oglmdi2_vs7.4083A6
mov ebx,dword ptr ss:[ebp+C]
sub dword ptr ss:[ebp+10],esi
lea ecx,dword ptr ds:[esi+1]
mov dword ptr ds:[ebx-4],ecx
lea ebx,dword ptr ds:[ebx+esi-4]
mov esi,dword ptr ss:[ebp+10]
sar esi,4
dec esi
cmp esi,3F
mov dword ptr ss:[ebp+C],ebx
mov dword ptr ds:[ebx-4],ecx
jbe oglmdi2_vs7.40829C
push 3F
pop esi
test byte ptr ss:[ebp-4],1
jne oglmdi2_vs7.408326
mov esi,dword ptr ss:[ebp-4]
sar esi,4
dec esi
cmp esi,3F
jbe oglmdi2_vs7.4082B5
push 3F
pop esi
mov ecx,dword ptr ds:[edi+4]
cmp ecx,dword ptr ds:[edi+8]
jne oglmdi2_vs7.4082FF
cmp esi,20
mov ebx,80000000
jae oglmdi2_vs7.4082E0
mov ecx,esi
shr ebx,cl
lea esi,dword ptr ds:[esi+eax+4]
not ebx
and dword ptr ds:[eax+edx*4+44],ebx
dec byte ptr ds:[esi]
jne oglmdi2_vs7.4082FC
mov ecx,dword ptr ss:[ebp+8]
and dword ptr ds:[ecx],ebx
jmp oglmdi2_vs7.4082FC
lea ecx,dword ptr ds:[esi-20]
shr ebx,cl
lea ecx,dword ptr ds:[esi+eax+4]
not ebx
and dword ptr ds:[eax+edx*4+C4],ebx
dec byte ptr ds:[ecx]
jne oglmdi2_vs7.4082FC
mov ecx,dword ptr ss:[ebp+8]
and dword ptr ds:[ecx+4],ebx
mov ebx,dword ptr ss:[ebp+C]
mov ecx,dword ptr ds:[edi+8]
mov esi,dword ptr ds:[edi+4]
mov dword ptr ds:[ecx+4],esi
mov esi,dword ptr ds:[edi+8]
mov ecx,dword ptr ds:[edi+4]
mov dword ptr ds:[ecx+8],esi
mov esi,dword ptr ss:[ebp+10]
add esi,dword ptr ss:[ebp-4]
mov dword ptr ss:[ebp+10],esi
sar esi,4
dec esi
cmp esi,3F
jbe oglmdi2_vs7.408326
push 3F
pop esi
mov ecx,dword ptr ss:[ebp-C]
lea ecx,dword ptr ds:[ecx+esi*8]
mov edi,dword ptr ds:[ecx+4]
mov dword ptr ds:[ebx+8],ecx
mov dword ptr ds:[ebx+4],edi
mov dword ptr ds:[ecx+4],ebx
mov ecx,dword ptr ds:[ebx+4]
mov dword ptr ds:[ecx+8],ebx
mov ecx,dword ptr ds:[ebx+4]
cmp ecx,dword ptr ds:[ebx+8]
jne oglmdi2_vs7.40839D
mov cl,byte ptr ds:[esi+eax+4]
mov byte ptr ss:[ebp+F],cl
inc cl
cmp esi,20
mov byte ptr ds:[esi+eax+4],cl
jae oglmdi2_vs7.408374
cmp byte ptr ss:[ebp+F],0
jne oglmdi2_vs7.40836C
mov ecx,esi
mov edi,80000000
shr edi,cl
mov ecx,dword ptr ss:[ebp+8]
or dword ptr ds:[ecx],edi
lea eax,dword ptr ds:[eax+edx*4+44]
mov ecx,esi
jmp oglmdi2_vs7.408394
cmp byte ptr ss:[ebp+F],0
jne oglmdi2_vs7.40838A
lea ecx,dword ptr ds:[esi-20]
mov edi,80000000
shr edi,cl
mov ecx,dword ptr ss:[ebp+8]
or dword ptr ds:[ecx+4],edi
lea eax,dword ptr ds:[eax+edx*4+C4]
lea ecx,dword ptr ds:[esi-20]
mov edx,80000000
shr edx,cl
or dword ptr ds:[eax],edx
mov eax,dword ptr ss:[ebp+10]
mov dword ptr ds:[ebx],eax
mov dword ptr ds:[eax+ebx-4],eax
xor eax,eax
inc eax
pop edi
pop esi
pop ebx
leave 
ret 
push ebp
mov ebp,esp
sub esp,14
mov ecx,dword ptr ss:[ebp+8]
mov eax,dword ptr ds:[4128B4]
mov edx,dword ptr ds:[4128B8]
add ecx,17
and ecx,FFFFFFF0
push ebx
mov dword ptr ss:[ebp-10],ecx
sar ecx,4
push esi
lea eax,dword ptr ds:[eax+eax*4]
push edi
dec ecx
cmp ecx,20
lea edi,dword ptr ds:[edx+eax*4]
mov dword ptr ss:[ebp-4],edi
jge oglmdi2_vs7.4083EB
or esi,FFFFFFFF
shr esi,cl
or dword ptr ss:[ebp-8],FFFFFFFF
jmp oglmdi2_vs7.4083F8
add ecx,FFFFFFE0
or eax,FFFFFFFF
xor esi,esi
shr eax,cl
mov dword ptr ss:[ebp-8],eax
mov eax,dword ptr ds:[4128C0]
mov ebx,eax
mov dword ptr ss:[ebp-C],esi
cmp ebx,edi
jmp oglmdi2_vs7.40841A
mov ecx,dword ptr ds:[ebx+4]
mov edi,dword ptr ds:[ebx]
and ecx,dword ptr ss:[ebp-8]
and edi,esi
or ecx,edi
jne oglmdi2_vs7.40841F
add ebx,14
cmp ebx,dword ptr ss:[ebp-4]
mov dword ptr ss:[ebp+8],ebx
jb oglmdi2_vs7.408406
cmp ebx,dword ptr ss:[ebp-4]
jne oglmdi2_vs7.408448
mov ebx,edx
jmp oglmdi2_vs7.408439
mov ecx,dword ptr ds:[ebx+4]
mov edi,dword ptr ds:[ebx]
and ecx,dword ptr ss:[ebp-8]
and edi,esi
or ecx,edi
jne oglmdi2_vs7.408440
add ebx,14
cmp ebx,eax
mov dword ptr ss:[ebp+8],ebx
jb oglmdi2_vs7.408428
cmp ebx,eax
je oglmdi2_vs7.4084DC
mov dword ptr ds:[4128C0],ebx
mov eax,dword ptr ds:[ebx+10]
mov edx,dword ptr ds:[eax]
cmp edx,FFFFFFFF
mov dword ptr ss:[ebp-4],edx
je oglmdi2_vs7.40846F
mov ecx,dword ptr ds:[eax+edx*4+C4]
mov edi,dword ptr ds:[eax+edx*4+44]
and ecx,dword ptr ss:[ebp-8]
and edi,esi
or ecx,edi
jne oglmdi2_vs7.4084A5
mov edx,dword ptr ds:[eax+C4]
and edx,dword ptr ss:[ebp-8]
and dword ptr ss:[ebp-4],0
lea ecx,dword ptr ds:[eax+44]
mov esi,dword ptr ds:[ecx]
and esi,dword ptr ss:[ebp-C]
or edx,esi
mov esi,dword ptr ss:[ebp-C]
jne oglmdi2_vs7.4084A2
mov edx,dword ptr ds:[ecx+84]
and edx,dword ptr ss:[ebp-8]
inc dword ptr ss:[ebp-4]
add ecx,4
mov edi,dword ptr ds:[ecx]
and edi,esi
or edx,edi
je oglmdi2_vs7.40848B
mov edx,dword ptr ss:[ebp-4]
mov ecx,edx
imul ecx,ecx,204
lea ecx,dword ptr ds:[ecx+eax+144]
mov dword ptr ss:[ebp-C],ecx
mov ecx,dword ptr ds:[eax+edx*4+44]
xor edi,edi
and ecx,esi
jne oglmdi2_vs7.40852E
mov ecx,dword ptr ds:[eax+edx*4+C4]
and ecx,dword ptr ss:[ebp-8]
push 20
pop edi
jmp oglmdi2_vs7.40852E
cmp dword ptr ds:[ebx+8],0
jne oglmdi2_vs7.4084E1
add ebx,14
mov dword ptr ss:[ebp+8],ebx
cmp ebx,dword ptr ss:[ebp-4]
jb oglmdi2_vs7.4084D0
cmp ebx,dword ptr ss:[ebp-4]
jne oglmdi2_vs7.40850C
mov ebx,edx
jmp oglmdi2_vs7.4084F3
cmp dword ptr ds:[ebx+8],0
jne oglmdi2_vs7.4084FA
add ebx,14
cmp ebx,eax
mov dword ptr ss:[ebp+8],ebx
jb oglmdi2_vs7.4084EA
cmp ebx,eax
jne oglmdi2_vs7.40850C
call oglmdi2_vs7.407F12
mov ebx,eax
test ebx,ebx
mov dword ptr ss:[ebp+8],ebx
je oglmdi2_vs7.408524
push ebx
call oglmdi2_vs7.407FC9
pop ecx
mov ecx,dword ptr ds:[ebx+10]
mov dword ptr ds:[ecx],eax
mov eax,dword ptr ds:[ebx+10]
cmp dword ptr ds:[eax],FFFFFFFF
jne oglmdi2_vs7.408448
xor eax,eax
jmp oglmdi2_vs7.4086A5
shl ecx,1
inc edi
test ecx,ecx
jge oglmdi2_vs7.40852B
mov ecx,dword ptr ss:[ebp-C]
mov edx,dword ptr ds:[ecx+edi*8+4]
mov ecx,dword ptr ds:[edx]
sub ecx,dword ptr ss:[ebp-10]
mov esi,ecx
sar esi,4
dec esi
cmp esi,3F
mov dword ptr ss:[ebp-8],ecx
jle oglmdi2_vs7.40854F
push 3F
pop esi
cmp esi,edi
je oglmdi2_vs7.408658
mov ecx,dword ptr ds:[edx+4]
cmp ecx,dword ptr ds:[edx+8]
jne oglmdi2_vs7.4085BB
cmp edi,20
mov ebx,80000000
jge oglmdi2_vs7.40858F
mov ecx,edi
shr ebx,cl
mov ecx,dword ptr ss:[ebp-4]
lea edi,dword ptr ds:[eax+edi+4]
not ebx
mov dword ptr ss:[ebp-14],ebx
and ebx,dword ptr ds:[eax+ecx*4+44]
mov dword ptr ds:[eax+ecx*4+44],ebx
dec byte ptr ds:[edi]
jne oglmdi2_vs7.4085B8
mov ecx,dword ptr ss:[ebp-14]
mov ebx,dword ptr ss:[ebp+8]
and dword ptr ds:[ebx],ecx
jmp oglmdi2_vs7.4085BB
lea ecx,dword ptr ds:[edi-20]
shr ebx,cl
mov ecx,dword ptr ss:[ebp-4]
lea ecx,dword ptr ds:[eax+ecx*4+C4]
lea edi,dword ptr ds:[eax+edi+4]
not ebx
and dword ptr ds:[ecx],ebx
dec byte ptr ds:[edi]
mov dword ptr ss:[ebp-14],ebx
jne oglmdi2_vs7.4085B8
mov ebx,dword ptr ss:[ebp+8]
mov ecx,dword ptr ss:[ebp-14]
and dword ptr ds:[ebx+4],ecx
jmp oglmdi2_vs7.4085BB
mov ebx,dword ptr ss:[ebp+8]
cmp dword ptr ss:[ebp-8],0
mov ecx,dword ptr ds:[edx+8]
mov edi,dword ptr ds:[edx+4]
mov dword ptr ds:[ecx+4],edi
mov ecx,dword ptr ds:[edx+4]
mov edi,dword ptr ds:[edx+8]
mov dword ptr ds:[ecx+8],edi
je oglmdi2_vs7.408664
mov ecx,dword ptr ss:[ebp-C]
lea ecx,dword ptr ds:[ecx+esi*8]
mov edi,dword ptr ds:[ecx+4]
mov dword ptr ds:[edx+8],ecx
mov dword ptr ds:[edx+4],edi
mov dword ptr ds:[ecx+4],edx
mov ecx,dword ptr ds:[edx+4]
mov dword ptr ds:[ecx+8],edx
mov ecx,dword ptr ds:[edx+4]
cmp ecx,dword ptr ds:[edx+8]
jne oglmdi2_vs7.408655
mov cl,byte ptr ds:[esi+eax+4]
mov byte ptr ss:[ebp+B],cl
inc cl
cmp esi,20
mov byte ptr ds:[esi+eax+4],cl
jge oglmdi2_vs7.40862C
cmp byte ptr ss:[ebp+B],0
jne oglmdi2_vs7.40861A
mov edi,80000000
mov ecx,esi
shr edi,cl
or dword ptr ds:[ebx],edi
mov ecx,esi
mov edi,80000000
shr edi,cl
mov ecx,dword ptr ss:[ebp-4]
or dword ptr ds:[eax+ecx*4+44],edi
jmp oglmdi2_vs7.408655
cmp byte ptr ss:[ebp+B],0
jne oglmdi2_vs7.40863F
lea ecx,dword ptr ds:[esi-20]
mov edi,80000000
shr edi,cl
or dword ptr ds:[ebx+4],edi
mov ecx,dword ptr ss:[ebp-4]
lea edi,dword ptr ds:[eax+ecx*4+C4]
lea ecx,dword ptr ds:[esi-20]
mov esi,80000000
shr esi,cl
or dword ptr ds:[edi],esi
mov ecx,dword ptr ss:[ebp-8]
test ecx,ecx
je oglmdi2_vs7.408667
mov dword ptr ds:[edx],ecx
mov dword ptr ds:[ecx+edx-4],ecx
jmp oglmdi2_vs7.408667
mov ecx,dword ptr ss:[ebp-8]
mov esi,dword ptr ss:[ebp-10]
add edx,ecx
lea ecx,dword ptr ds:[esi+1]
mov dword ptr ds:[edx],ecx
mov dword ptr ds:[edx+esi-4],ecx
mov esi,dword ptr ss:[ebp-C]
mov ecx,dword ptr ds:[esi]
test ecx,ecx
lea edi,dword ptr ds:[ecx+1]
mov dword ptr ds:[esi],edi
jne oglmdi2_vs7.40869D
cmp ebx,dword ptr ds:[4128B0]
jne oglmdi2_vs7.40869D
mov ecx,dword ptr ss:[ebp-4]
cmp ecx,dword ptr ds:[4128C8]
jne oglmdi2_vs7.40869D
and dword ptr ds:[4128B0],0
mov ecx,dword ptr ss:[ebp-4]
mov dword ptr ds:[eax],ecx
lea eax,dword ptr ds:[edx+4]
pop edi
pop esi
pop ebx
leave 
ret 
push ebx
push ebp
push esi
push edi
mov edi,dword ptr ss:[esp+14]
cmp edi,dword ptr ds:[412780]
jae oglmdi2_vs7.408744
mov eax,edi
sar eax,5
mov esi,edi
and esi,1F
lea ebx,dword ptr ds:[eax*4+4127A0]
mov eax,dword ptr ds:[ebx]
shl esi,3
test byte ptr ds:[eax+esi+4],1
je oglmdi2_vs7.408744
push edi
call oglmdi2_vs7.40565A
cmp eax,FFFFFFFF
pop ecx
je oglmdi2_vs7.408723
cmp edi,1
je oglmdi2_vs7.4086F1
cmp edi,2
jne oglmdi2_vs7.408707
push 2
call oglmdi2_vs7.40565A
push 1
mov ebp,eax
call oglmdi2_vs7.40565A
cmp eax,ebp
pop ecx
pop ecx
je oglmdi2_vs7.408723
push edi
call oglmdi2_vs7.40565A
pop ecx
push eax
call dword ptr ds:[<&CloseHandle>]
test eax,eax
jne oglmdi2_vs7.408723
call dword ptr ds:[<&GetLastError>]
mov ebp,eax
jmp oglmdi2_vs7.408725
xor ebp,ebp
push edi
call oglmdi2_vs7.4055E0
mov eax,dword ptr ds:[ebx]
and byte ptr ds:[eax+esi+4],0
test ebp,ebp
pop ecx
je oglmdi2_vs7.408740
push ebp
call oglmdi2_vs7.409143
pop ecx
jmp oglmdi2_vs7.408755
xor eax,eax
jmp oglmdi2_vs7.408758
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
pop edi
pop esi
pop ebp
pop ebx
ret 
push esi
mov esi,dword ptr ss:[esp+8]
mov eax,dword ptr ds:[esi+C]
test al,83
je oglmdi2_vs7.408786
test al,8
je oglmdi2_vs7.408786
push dword ptr ds:[esi+8]
call oglmdi2_vs7.4051DA
and word ptr ds:[esi+C],FBF7
xor eax,eax
pop ecx
mov dword ptr ds:[esi],eax
mov dword ptr ds:[esi+8],eax
mov dword ptr ds:[esi+4],eax
pop esi
ret 
push ebx
push esi
mov esi,dword ptr ss:[esp+C]
mov eax,dword ptr ds:[esi+C]
mov ecx,eax
and cl,3
xor ebx,ebx
cmp cl,2
jne oglmdi2_vs7.4087D7
test ax,108
je oglmdi2_vs7.4087D7
mov eax,dword ptr ds:[esi+8]
push edi
mov edi,dword ptr ds:[esi]
sub edi,eax
test edi,edi
jle oglmdi2_vs7.4087D6
push edi
push eax
push dword ptr ds:[esi+10]
call oglmdi2_vs7.40AC81
add esp,C
cmp eax,edi
jne oglmdi2_vs7.4087CF
mov eax,dword ptr ds:[esi+C]
test al,al
jns oglmdi2_vs7.4087D6
and eax,FFFFFFFD
mov dword ptr ds:[esi+C],eax
jmp oglmdi2_vs7.4087D6
or dword ptr ds:[esi+C],20
or ebx,FFFFFFFF
pop edi
mov eax,dword ptr ds:[esi+8]
and dword ptr ds:[esi+4],0
mov dword ptr ds:[esi],eax
pop esi
mov eax,ebx
pop ebx
ret 
push esi
mov esi,dword ptr ss:[esp+8]
test esi,esi
jne oglmdi2_vs7.4087F7
push esi
call oglmdi2_vs7.408820
pop ecx
pop esi
ret 
push esi
call oglmdi2_vs7.408788
test eax,eax
pop ecx
je oglmdi2_vs7.408807
or eax,FFFFFFFF
pop esi
ret 
test byte ptr ds:[esi+D],40
je oglmdi2_vs7.40881C
push dword ptr ds:[esi+10]
call oglmdi2_vs7.40B0EE
pop ecx
neg eax
sbb eax,eax
pop esi
ret 
xor eax,eax
pop esi
ret 
push ebx
push esi
push edi
xor esi,esi
xor ebx,ebx
xor edi,edi
cmp dword ptr ds:[4138E0],esi
jle oglmdi2_vs7.40887E
mov eax,dword ptr ds:[4128D8]
mov eax,dword ptr ds:[eax+esi*4]
test eax,eax
je oglmdi2_vs7.408875
mov ecx,dword ptr ds:[eax+C]
test cl,83
je oglmdi2_vs7.408875
cmp dword ptr ss:[esp+10],1
jne oglmdi2_vs7.40885B
push eax
call oglmdi2_vs7.4087E5
cmp eax,FFFFFFFF
pop ecx
je oglmdi2_vs7.408875
inc ebx
jmp oglmdi2_vs7.408875
cmp dword ptr ss:[esp+10],0
jne oglmdi2_vs7.408875
test cl,2
je oglmdi2_vs7.408875
push eax
call oglmdi2_vs7.4087E5
cmp eax,FFFFFFFF
pop ecx
jne oglmdi2_vs7.408875
or edi,eax
inc esi
cmp esi,dword ptr ds:[4138E0]
jl oglmdi2_vs7.408831
cmp dword ptr ss:[esp+10],1
mov eax,ebx
je oglmdi2_vs7.408889
mov eax,edi
pop edi
pop esi
pop ebx
ret 
push 1
call oglmdi2_vs7.408820
pop ecx
ret 
push esi
mov esi,dword ptr ss:[esp+8]
mov eax,dword ptr ds:[esi+C]
test al,83
je oglmdi2_vs7.40896F
test al,40
jne oglmdi2_vs7.40896F
test al,2
je oglmdi2_vs7.4088BD
or eax,20
mov dword ptr ds:[esi+C],eax
jmp oglmdi2_vs7.40896F
or eax,1
test ax,10C
mov dword ptr ds:[esi+C],eax
jne oglmdi2_vs7.4088D2
push esi
call oglmdi2_vs7.40AE35
pop ecx
jmp oglmdi2_vs7.4088D7
mov eax,dword ptr ds:[esi+8]
mov dword ptr ds:[esi],eax
push dword ptr ds:[esi+18]
push dword ptr ds:[esi+8]
push dword ptr ds:[esi+10]
call oglmdi2_vs7.408974
add esp,C
test eax,eax
mov dword ptr ds:[esi+4],eax
je oglmdi2_vs7.40895E
cmp eax,FFFFFFFF
je oglmdi2_vs7.40895E
mov edx,dword ptr ds:[esi+C]
test dl,82
jne oglmdi2_vs7.408933
mov ecx,dword ptr ds:[esi+10]
cmp ecx,FFFFFFFF
push edi
je oglmdi2_vs7.408919
mov edi,ecx
sar edi,5
mov edi,dword ptr ds:[edi*4+4127A0]
and ecx,1F
lea edi,dword ptr ds:[edi+ecx*8]
jmp oglmdi2_vs7.40891E
mov edi,oglmdi2_vs7.411584
mov cl,byte ptr ds:[edi+4]
and cl,82
cmp cl,82
pop edi
jne oglmdi2_vs7.408933
or edx,2000
mov dword ptr ds:[esi+C],edx
cmp dword ptr ds:[esi+18],200
jne oglmdi2_vs7.408950
mov ecx,dword ptr ds:[esi+C]
test cl,8
je oglmdi2_vs7.408950
test ch,4
jne oglmdi2_vs7.408950
mov dword ptr ds:[esi+18],1000
mov ecx,dword ptr ds:[esi]
dec eax
mov dword ptr ds:[esi+4],eax
movzx eax,byte ptr ds:[ecx]
inc ecx
mov dword ptr ds:[esi],ecx
pop esi
ret 
neg eax
sbb eax,eax
and eax,10
add eax,10
or dword ptr ds:[esi+C],eax
and dword ptr ds:[esi+4],0
or eax,FFFFFFFF
pop esi
ret 
push ebp
mov ebp,esp
sub esp,10
push ebx
push esi
mov esi,dword ptr ss:[ebp+8]
cmp esi,dword ptr ds:[412780]
push edi
jae oglmdi2_vs7.408B3B
mov eax,esi
sar eax,5
lea ebx,dword ptr ds:[eax*4+4127A0]
mov eax,dword ptr ds:[ebx]
and esi,1F
shl esi,3
add eax,esi
mov dl,byte ptr ds:[eax+4]
test dl,1
je oglmdi2_vs7.408B3B
and dword ptr ss:[ebp-C],0
cmp dword ptr ss:[ebp+10],0
mov edi,dword ptr ss:[ebp+C]
mov ecx,edi
je oglmdi2_vs7.408A1A
test dl,2
jne oglmdi2_vs7.408A1A
test dl,48
je oglmdi2_vs7.4089E4
mov al,byte ptr ds:[eax+5]
cmp al,A
je oglmdi2_vs7.4089E4
dec dword ptr ss:[ebp+10]
mov byte ptr ds:[edi],al
mov eax,dword ptr ds:[ebx]
lea ecx,dword ptr ds:[edi+1]
mov dword ptr ss:[ebp-C],1
mov byte ptr ds:[eax+esi+5],A
push 0
lea eax,dword ptr ss:[ebp-10]
push eax
push dword ptr ss:[ebp+10]
mov eax,dword ptr ds:[ebx]
push ecx
push dword ptr ds:[eax+esi]
call dword ptr ds:[<&ReadFile>]
test eax,eax
jne oglmdi2_vs7.408A2D
call dword ptr ds:[<&GetLastError>]
push 5
pop ecx
cmp eax,ecx
jne oglmdi2_vs7.408A15
mov dword ptr ds:[41222C],ecx
jmp oglmdi2_vs7.408B42
cmp eax,6D
jne oglmdi2_vs7.408A21
xor eax,eax
jmp oglmdi2_vs7.408B4F
push eax
call oglmdi2_vs7.409143
pop ecx
jmp oglmdi2_vs7.408B4C
mov eax,dword ptr ds:[ebx]
mov edx,dword ptr ss:[ebp-10]
add dword ptr ss:[ebp-C],edx
lea ecx,dword ptr ds:[eax+esi+4]
mov al,byte ptr ds:[ecx]
test al,al
jns oglmdi2_vs7.408B36
test edx,edx
je oglmdi2_vs7.408A50
cmp byte ptr ds:[edi],A
jne oglmdi2_vs7.408A50
or al,4
jmp oglmdi2_vs7.408A52
and al,FB
mov byte ptr ds:[ecx],al
mov eax,dword ptr ss:[ebp+C]
mov ecx,dword ptr ss:[ebp-C]
add ecx,eax
cmp eax,ecx
mov dword ptr ss:[ebp-8],eax
mov dword ptr ss:[ebp-C],ecx
jae oglmdi2_vs7.408B30
mov eax,dword ptr ss:[ebp-8]
mov al,byte ptr ds:[eax]
cmp al,1A
je oglmdi2_vs7.408B20
cmp al,D
je oglmdi2_vs7.408A86
mov byte ptr ds:[edi],al
inc edi
inc dword ptr ss:[ebp-8]
jmp oglmdi2_vs7.408B12
dec ecx
cmp dword ptr ss:[ebp-8],ecx
jae oglmdi2_vs7.408AA0
mov eax,dword ptr ss:[ebp-8]
inc eax
cmp byte ptr ds:[eax],A
jne oglmdi2_vs7.408A9B
add dword ptr ss:[ebp-8],2
jmp oglmdi2_vs7.408AF4
mov dword ptr ss:[ebp-8],eax
jmp oglmdi2_vs7.408B0E
inc dword ptr ss:[ebp-8]
push 0
lea eax,dword ptr ss:[ebp-10]
push eax
push 1
lea eax,dword ptr ss:[ebp-1]
push eax
mov eax,dword ptr ds:[ebx]
push dword ptr ds:[eax+esi]
call dword ptr ds:[<&ReadFile>]
test eax,eax
jne oglmdi2_vs7.408AC8
call dword ptr ds:[<&GetLastError>]
test eax,eax
jne oglmdi2_vs7.408B0E
cmp dword ptr ss:[ebp-10],0
je oglmdi2_vs7.408B0E
mov eax,dword ptr ds:[ebx]
test byte ptr ds:[eax+esi+4],48
je oglmdi2_vs7.408AE9
mov al,byte ptr ss:[ebp-1]
cmp al,A
je oglmdi2_vs7.408AF4
mov byte ptr ds:[edi],D
mov ecx,dword ptr ds:[ebx]
mov byte ptr ds:[ecx+esi+5],al
jmp oglmdi2_vs7.408B11
cmp edi,dword ptr ss:[ebp+C]
jne oglmdi2_vs7.408AF9
cmp byte ptr ss:[ebp-1],A
jne oglmdi2_vs7.408AF9
mov byte ptr ds:[edi],A
jmp oglmdi2_vs7.408B11
push 1
push FFFFFFFF
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.40ABF5
add esp,C
cmp byte ptr ss:[ebp-1],A
je oglmdi2_vs7.408B12
mov byte ptr ds:[edi],D
inc edi
mov ecx,dword ptr ss:[ebp-C]
cmp dword ptr ss:[ebp-8],ecx
jb oglmdi2_vs7.408A6A
jmp oglmdi2_vs7.408B30
mov eax,dword ptr ds:[ebx]
lea esi,dword ptr ds:[eax+esi+4]
mov al,byte ptr ds:[esi]
test al,40
jne oglmdi2_vs7.408B30
or al,2
mov byte ptr ds:[esi],al
sub edi,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-C],edi
mov eax,dword ptr ss:[ebp-C]
jmp oglmdi2_vs7.408B4F
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
pop edi
pop esi
pop ebx
leave 
ret 
push ebp
mov ebp,esp
push ecx
push ecx
push ebx
push esi
mov esi,dword ptr ds:[412278]
push edi
mov edi,dword ptr ss:[ebp+C]
mov al,byte ptr ds:[edi]
xor ebx,ebx
cmp al,61
mov dword ptr ss:[ebp-8],ebx
mov dword ptr ss:[ebp-4],ebx
je oglmdi2_vs7.408B8D
cmp al,72
je oglmdi2_vs7.408B86
cmp al,77
jne oglmdi2_vs7.408C99
mov ecx,301
jmp oglmdi2_vs7.408B92
xor ecx,ecx
or esi,1
jmp oglmdi2_vs7.408B95
mov ecx,109
or esi,2
xor edx,edx
inc edx
jmp oglmdi2_vs7.408C74
cmp edx,ebx
je oglmdi2_vs7.408C7F
movsx eax,al
cmp eax,54
jg oglmdi2_vs7.408C1E
je oglmdi2_vs7.408C11
sub eax,2B
je oglmdi2_vs7.408BFB
sub eax,19
je oglmdi2_vs7.408BF1
sub eax,E
je oglmdi2_vs7.408BDD
dec eax
jne oglmdi2_vs7.408C56
cmp dword ptr ss:[ebp-4],ebx
jne oglmdi2_vs7.408C56
mov dword ptr ss:[ebp-4],1
or ecx,20
jmp oglmdi2_vs7.408C74
cmp dword ptr ss:[ebp-4],ebx
jne oglmdi2_vs7.408C56
mov dword ptr ss:[ebp-4],1
or ecx,10
jmp oglmdi2_vs7.408C74
test cl,40
jne oglmdi2_vs7.408C56
or ecx,40
jmp oglmdi2_vs7.408C74
test cl,2
jne oglmdi2_vs7.408C56
and ecx,FFFFFFFE
and esi,FFFFFFFC
or ecx,2
or esi,80
jmp oglmdi2_vs7.408C74
mov eax,1000
test eax,ecx
jne oglmdi2_vs7.408C56
or ecx,eax
jmp oglmdi2_vs7.408C74
sub eax,62
je oglmdi2_vs7.408C69
dec eax
je oglmdi2_vs7.408C51
sub eax,B
je oglmdi2_vs7.408C3D
sub eax,6
jne oglmdi2_vs7.408C56
test ch,C0
jne oglmdi2_vs7.408C56
or ecx,4000
jmp oglmdi2_vs7.408C74
cmp dword ptr ss:[ebp-8],ebx
jne oglmdi2_vs7.408C56
mov dword ptr ss:[ebp-8],1
and esi,FFFFBFFF
jmp oglmdi2_vs7.408C74
cmp dword ptr ss:[ebp-8],ebx
je oglmdi2_vs7.408C5A
xor edx,edx
jmp oglmdi2_vs7.408C74
mov dword ptr ss:[ebp-8],1
or esi,4000
jmp oglmdi2_vs7.408C74
test ch,C0
jne oglmdi2_vs7.408C56
or ecx,8000
inc edi
mov al,byte ptr ds:[edi]
cmp al,bl
jne oglmdi2_vs7.408B9D
push 1A4
push dword ptr ss:[ebp+10]
push ecx
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.40B145
mov ecx,eax
add esp,10
cmp ecx,ebx
jge oglmdi2_vs7.408C9D
xor eax,eax
jmp oglmdi2_vs7.408CB7
mov eax,dword ptr ss:[ebp+14]
inc dword ptr ds:[4121DC]
mov dword ptr ds:[eax+C],esi
mov dword ptr ds:[eax+4],ebx
mov dword ptr ds:[eax],ebx
mov dword ptr ds:[eax+8],ebx
mov dword ptr ds:[eax+1C],ebx
mov dword ptr ds:[eax+10],ecx
pop edi
pop esi
pop ebx
leave 
ret 
push oglmdi2_vs7.40EA44
call dword ptr ds:[<&GetModuleHandleA>]
test eax,eax
je oglmdi2_vs7.408CE1
push oglmdi2_vs7.40EA34
push eax
call dword ptr ds:[<&GetProcAddress>]
test eax,eax
je oglmdi2_vs7.408CE1
push dword ptr ss:[esp+4]
call eax
push dword ptr ss:[esp+4]
call dword ptr ds:[<&ExitProcess>]
int3 
mov eax,dword ptr ds:[411144]
test eax,eax
je oglmdi2_vs7.408CF7
call eax
push esi
push edi
mov ecx,oglmdi2_vs7.411030
mov edi,oglmdi2_vs7.411044
xor eax,eax
cmp ecx,edi
mov esi,ecx
jae oglmdi2_vs7.408D22
test eax,eax
jne oglmdi2_vs7.408D4E
mov ecx,dword ptr ds:[esi]
test ecx,ecx
je oglmdi2_vs7.408D17
call ecx
add esi,4
cmp esi,edi
jb oglmdi2_vs7.408D0B
test eax,eax
jne oglmdi2_vs7.408D4E
push oglmdi2_vs7.409967
call oglmdi2_vs7.40625A
mov esi,oglmdi2_vs7.411000
mov eax,esi
mov edi,oglmdi2_vs7.41102C
cmp eax,edi
pop ecx
jae oglmdi2_vs7.408D4C
mov eax,dword ptr ds:[esi]
test eax,eax
je oglmdi2_vs7.408D45
call eax
add esi,4
cmp esi,edi
jb oglmdi2_vs7.408D3D
xor eax,eax
pop edi
pop esi
ret 
push ebp
mov ebp,esp
push esi
xor esi,esi
inc esi
cmp dword ptr ds:[412274],esi
push edi
jne oglmdi2_vs7.408D71
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&GetCurrentProcess>]
push eax
call dword ptr ds:[<&TerminateProcess>]
cmp dword ptr ss:[ebp+C],0
mov al,byte ptr ss:[ebp+10]
mov dword ptr ds:[412270],esi
mov byte ptr ds:[41226C],al
jne oglmdi2_vs7.408DD7
mov ecx,dword ptr ds:[4128A8]
test ecx,ecx
je oglmdi2_vs7.408DB8
mov eax,dword ptr ds:[4128A4]
sub eax,4
cmp eax,ecx
jmp oglmdi2_vs7.408DB1
mov eax,dword ptr ds:[eax]
test eax,eax
je oglmdi2_vs7.408DA3
call eax
mov eax,dword ptr ds:[4128A4]
sub eax,4
cmp eax,dword ptr ds:[4128A8]
mov dword ptr ds:[4128A4],eax
jae oglmdi2_vs7.408D9B
mov eax,oglmdi2_vs7.411048
mov esi,oglmdi2_vs7.411050
cmp eax,esi
mov edi,eax
jae oglmdi2_vs7.408DD7
mov eax,dword ptr ds:[edi]
test eax,eax
je oglmdi2_vs7.408DD0
call eax
add edi,4
cmp edi,esi
jb oglmdi2_vs7.408DC8
mov eax,oglmdi2_vs7.411054
mov esi,oglmdi2_vs7.41105C
cmp eax,esi
mov edi,eax
jae oglmdi2_vs7.408DF6
mov eax,dword ptr ds:[edi]
test eax,eax
je oglmdi2_vs7.408DEF
call eax
add edi,4
cmp edi,esi
jb oglmdi2_vs7.408DE7
cmp dword ptr ss:[ebp+10],0
pop edi
pop esi
jne oglmdi2_vs7.408E11
push dword ptr ss:[ebp+8]
mov dword ptr ds:[412274],1
call oglmdi2_vs7.408CBC
pop ecx
pop ebp
ret 
push 0
push 0
push dword ptr ss:[esp+C]
call oglmdi2_vs7.408D51
add esp,C
ret 
push 0
push 1
push dword ptr ss:[esp+C]
call oglmdi2_vs7.408D51
add esp,C
ret 
push 1
push 0
push 0
call oglmdi2_vs7.408D51
add esp,C
ret 
push 1
push 1
push 0
call oglmdi2_vs7.408D51
add esp,C
ret 
push ebx
push esi
push edi
mov edi,dword ptr ds:[4138E0]
xor ebx,ebx
xor esi,esi
xor eax,eax
cmp edi,ebx
jle oglmdi2_vs7.408EBF
mov ecx,dword ptr ds:[4128D8]
mov edx,dword ptr ds:[ecx+eax*4]
cmp edx,ebx
je oglmdi2_vs7.408E85
test byte ptr ds:[edx+C],83
je oglmdi2_vs7.408E80
inc eax
cmp eax,edi
jl oglmdi2_vs7.408E6C
jmp oglmdi2_vs7.408EBF
mov esi,dword ptr ds:[ecx+eax*4]
jmp oglmdi2_vs7.408EA9
mov edi,eax
push 20
shl edi,2
call oglmdi2_vs7.4052DA
pop ecx
mov ecx,dword ptr ds:[4128D8]
mov dword ptr ds:[edi+ecx],eax
mov eax,dword ptr ds:[4128D8]
mov edi,dword ptr ds:[edi+eax]
cmp edi,ebx
je oglmdi2_vs7.408EBF
mov esi,edi
cmp esi,ebx
je oglmdi2_vs7.408EBF
or dword ptr ds:[esi+10],FFFFFFFF
mov dword ptr ds:[esi+4],ebx
mov dword ptr ds:[esi+C],ebx
mov dword ptr ds:[esi+8],ebx
mov dword ptr ds:[esi],ebx
mov dword ptr ds:[esi+1C],ebx
pop edi
mov eax,esi
pop esi
pop ebx
ret 
sub esp,44
push 100
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
jne oglmdi2_vs7.408EDF
or eax,FFFFFFFF
jmp oglmdi2_vs7.40906C
mov dword ptr ds:[4127A0],eax
mov dword ptr ds:[412780],20
lea ecx,dword ptr ds:[eax+100]
jmp oglmdi2_vs7.408F10
and byte ptr ds:[eax+4],0
or dword ptr ds:[eax],FFFFFFFF
mov byte ptr ds:[eax+5],A
mov ecx,dword ptr ds:[4127A0]
add eax,8
add ecx,100
cmp eax,ecx
jb oglmdi2_vs7.408EF6
push ebx
push esi
push edi
lea eax,dword ptr ss:[esp+C]
push eax
call dword ptr ds:[<&GetStartupInfoA>]
cmp word ptr ss:[esp+3E],0
je oglmdi2_vs7.408FF5
mov eax,dword ptr ss:[esp+40]
test eax,eax
je oglmdi2_vs7.408FF5
mov esi,dword ptr ds:[eax]
push ebp
lea ebp,dword ptr ds:[eax+4]
mov eax,800
cmp esi,eax
lea ebx,dword ptr ds:[esi+ebp]
jl oglmdi2_vs7.408F4E
mov esi,eax
cmp dword ptr ds:[412780],esi
jge oglmdi2_vs7.408FA8
mov edi,oglmdi2_vs7.4127A4
push 100
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
je oglmdi2_vs7.408FA2
add dword ptr ds:[412780],20
mov dword ptr ds:[edi],eax
lea ecx,dword ptr ds:[eax+100]
jmp oglmdi2_vs7.408F91
and byte ptr ds:[eax+4],0
or dword ptr ds:[eax],FFFFFFFF
mov byte ptr ds:[eax+5],A
mov ecx,dword ptr ds:[edi]
add eax,8
add ecx,100
cmp eax,ecx
jb oglmdi2_vs7.408F7B
add edi,4
cmp dword ptr ds:[412780],esi
jl oglmdi2_vs7.408F5B
jmp oglmdi2_vs7.408FA8
mov esi,dword ptr ds:[412780]
xor edi,edi
test esi,esi
jle oglmdi2_vs7.408FF4
mov eax,dword ptr ds:[ebx]
cmp eax,FFFFFFFF
je oglmdi2_vs7.408FEB
mov cl,byte ptr ss:[ebp]
test cl,1
je oglmdi2_vs7.408FEB
test cl,8
jne oglmdi2_vs7.408FCD
push eax
call dword ptr ds:[<&GetFileType>]
test eax,eax
je oglmdi2_vs7.408FEB
mov eax,edi
sar eax,5
mov eax,dword ptr ds:[eax*4+4127A0]
mov ecx,edi
and ecx,1F
lea eax,dword ptr ds:[eax+ecx*8]
mov ecx,dword ptr ds:[ebx]
mov dword ptr ds:[eax],ecx
mov cl,byte ptr ss:[ebp]
mov byte ptr ds:[eax+4],cl
inc edi
inc ebp
add ebx,4
cmp edi,esi
jl oglmdi2_vs7.408FAE
pop ebp
xor ebx,ebx
mov eax,dword ptr ds:[4127A0]
lea esi,dword ptr ds:[eax+ebx*8]
cmp dword ptr ds:[esi],FFFFFFFF
jne oglmdi2_vs7.409051
test ebx,ebx
mov byte ptr ds:[esi+4],81
jne oglmdi2_vs7.409011
push FFFFFFF6
pop eax
jmp oglmdi2_vs7.40901B
mov eax,ebx
dec eax
neg eax
sbb eax,eax
add eax,FFFFFFF5
push eax
call dword ptr ds:[<&GetStdHandle>]
mov edi,eax
cmp edi,FFFFFFFF
je oglmdi2_vs7.409040
push edi
call dword ptr ds:[<&GetFileType>]
test eax,eax
je oglmdi2_vs7.409040
and eax,FF
cmp eax,2
mov dword ptr ds:[esi],edi
jne oglmdi2_vs7.409046
or byte ptr ds:[esi+4],40
jmp oglmdi2_vs7.409055
cmp eax,3
jne oglmdi2_vs7.409055
or byte ptr ds:[esi+4],8
jmp oglmdi2_vs7.409055
or byte ptr ds:[esi+4],80
inc ebx
cmp ebx,3
jl oglmdi2_vs7.408FF7
push dword ptr ds:[412780]
call dword ptr ds:[<&SetHandleCount>]
pop edi
pop esi
xor eax,eax
pop ebx
add esp,44
ret 
push ebx
push esi
mov esi,dword ptr ss:[esp+C]
imul esi,dword ptr ss:[esp+10]
test esi,esi
push edi
mov ebx,esi
jne oglmdi2_vs7.409083
inc esi
xor edi,edi
cmp esi,FFFFFFE0
ja oglmdi2_vs7.4090C3
cmp dword ptr ds:[4128D0],3
jne oglmdi2_vs7.4090AE
add esi,F
and esi,FFFFFFF0
cmp ebx,dword ptr ds:[4128BC]
ja oglmdi2_vs7.4090AE
push ebx
call oglmdi2_vs7.4083AE
mov edi,eax
test edi,edi
pop ecx
jne oglmdi2_vs7.4090D9
push esi
push 8
push dword ptr ds:[4128CC]
call dword ptr ds:[<&RtlAllocateHeap>]
mov edi,eax
test edi,edi
jne oglmdi2_vs7.4090E5
cmp dword ptr ds:[412224],0
je oglmdi2_vs7.4090E5
push esi
call oglmdi2_vs7.406100
test eax,eax
pop ecx
jne oglmdi2_vs7.409083
jmp oglmdi2_vs7.4090E7
push ebx
push 0
push edi
call oglmdi2_vs7.409D60
add esp,C
mov eax,edi
pop edi
pop esi
pop ebx
ret 
push esi
push edi
push 3
pop esi
xor edi,edi
cmp dword ptr ds:[4138E0],esi
jle oglmdi2_vs7.40913E
mov eax,dword ptr ds:[4128D8]
mov eax,dword ptr ds:[eax+esi*4]
test eax,eax
je oglmdi2_vs7.409135
test byte ptr ds:[eax+C],83
je oglmdi2_vs7.409119
push eax
call oglmdi2_vs7.405212
cmp eax,FFFFFFFF
pop ecx
je oglmdi2_vs7.409119
inc edi
cmp esi,14
jl oglmdi2_vs7.409135
mov eax,dword ptr ds:[4128D8]
push dword ptr ds:[eax+esi*4]
call oglmdi2_vs7.4051DA
mov eax,dword ptr ds:[4128D8]
and dword ptr ds:[eax+esi*4],0
pop ecx
inc esi
cmp esi,dword ptr ds:[4138E0]
jl oglmdi2_vs7.4090FA
mov eax,edi
pop edi
pop esi
ret 
mov eax,dword ptr ss:[esp+4]
mov dword ptr ds:[41222C],eax
xor ecx,ecx
cmp eax,dword ptr ds:[ecx*8+411590]
je oglmdi2_vs7.409172
inc ecx
cmp ecx,2D
jb oglmdi2_vs7.40914E
cmp eax,13
jb oglmdi2_vs7.40917F
cmp eax,24
ja oglmdi2_vs7.40917F
mov dword ptr ds:[412228],D
ret 
mov eax,dword ptr ds:[ecx*8+411594]
mov dword ptr ds:[412228],eax
ret 
cmp eax,BC
jb oglmdi2_vs7.409197
cmp eax,CA
mov dword ptr ds:[412228],8
jbe oglmdi2_vs7.4091A1
mov dword ptr ds:[412228],16
ret 
push ebp
mov ebp,esp
sub esp,10C
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
mov ecx,dword ptr ss:[ebp+8]
push ebx
push esi
mov dword ptr ss:[ebp-4],eax
xor edx,edx
push edi
xor eax,eax
cmp ecx,dword ptr ds:[eax*8+4116F8]
je oglmdi2_vs7.4091CF
inc eax
cmp eax,12
jb oglmdi2_vs7.4091C0
mov esi,eax
shl esi,3
cmp ecx,dword ptr ds:[esi+4116F8]
jne oglmdi2_vs7.409303
mov eax,dword ptr ds:[4121E8]
cmp eax,1
je oglmdi2_vs7.4092DE
cmp eax,edx
jne oglmdi2_vs7.4091FF
cmp dword ptr ds:[4113EC],1
je oglmdi2_vs7.4092DE
cmp ecx,FC
je oglmdi2_vs7.409303
push 104
lea eax,dword ptr ss:[ebp-10C]
push eax
push edx
mov byte ptr ss:[ebp-8],dl
call dword ptr ds:[<&GetModuleFileNameA>]
test eax,eax
jne oglmdi2_vs7.409238
lea eax,dword ptr ss:[ebp-10C]
push oglmdi2_vs7.40E828
push eax
call oglmdi2_vs7.409AE0
pop ecx
pop ecx
lea eax,dword ptr ss:[ebp-10C]
push eax
lea edi,dword ptr ss:[ebp-10C]
call oglmdi2_vs7.4058A0
inc eax
cmp eax,3C
pop ecx
jbe oglmdi2_vs7.40927A
lea eax,dword ptr ss:[ebp-10C]
push eax
call oglmdi2_vs7.4058A0
mov edi,eax
lea eax,dword ptr ss:[ebp-10C]
sub eax,3B
push 3
add edi,eax
push oglmdi2_vs7.40E824
push edi
call oglmdi2_vs7.409C30
add esp,10
push edi
call oglmdi2_vs7.4058A0
push dword ptr ds:[esi+4116FC]
mov ebx,eax
call oglmdi2_vs7.4058A0
lea eax,dword ptr ds:[ebx+eax+1C]
pop ecx
add eax,3
pop ecx
and eax,FFFFFFFC
call oglmdi2_vs7.4099B0
mov ebx,esp
push oglmdi2_vs7.40ED50
push ebx
call oglmdi2_vs7.409AE0
push edi
push ebx
call oglmdi2_vs7.409AF0
push oglmdi2_vs7.40E820
push ebx
call oglmdi2_vs7.409AF0
push dword ptr ds:[esi+4116FC]
push ebx
call oglmdi2_vs7.409AF0
push 12010
push oglmdi2_vs7.40E7EC
push ebx
call oglmdi2_vs7.40AFA5
add esp,2C
jmp oglmdi2_vs7.409303
push edx
lea eax,dword ptr ss:[ebp+8]
push eax
lea esi,dword ptr ds:[esi+4116FC]
push dword ptr ds:[esi]
call oglmdi2_vs7.4058A0
pop ecx
push eax
push dword ptr ds:[esi]
push FFFFFFF4
call dword ptr ds:[<&GetStdHandle>]
push eax
call dword ptr ds:[<&WriteFile>]
lea esp,dword ptr ss:[ebp-118]
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
call oglmdi2_vs7.404CCC
pop edi
pop esi
pop ebx
leave 
ret 
mov eax,dword ptr ds:[4121E8]
cmp eax,1
je oglmdi2_vs7.409330
test eax,eax
jne oglmdi2_vs7.409351
cmp dword ptr ds:[4113EC],1
jne oglmdi2_vs7.409351
push FC
call oglmdi2_vs7.4091A2
mov eax,dword ptr ds:[412284]
test eax,eax
pop ecx
je oglmdi2_vs7.409346
call eax
push FF
call oglmdi2_vs7.4091A2
pop ecx
ret 
push ebp
mov ebp,esp
mov edx,dword ptr ss:[ebp+8]
mov eax,dword ptr ds:[411808]
push ebx
mov ecx,oglmdi2_vs7.411788
push esi
cmp dword ptr ds:[ecx],edx
je oglmdi2_vs7.409379
lea esi,dword ptr ds:[eax+eax*2]
add ecx,C
lea esi,dword ptr ds:[esi*4+411788]
cmp ecx,esi
jb oglmdi2_vs7.409364
lea eax,dword ptr ds:[eax+eax*2]
lea eax,dword ptr ds:[eax*4+411788]
cmp ecx,eax
jae oglmdi2_vs7.40938B
cmp dword ptr ds:[ecx],edx
je oglmdi2_vs7.40938D
xor ecx,ecx
test ecx,ecx
je oglmdi2_vs7.4094B6
mov ebx,dword ptr ds:[ecx+8]
test ebx,ebx
je oglmdi2_vs7.4094B6
cmp ebx,5
jne oglmdi2_vs7.4093B1
and dword ptr ds:[ecx+8],0
xor eax,eax
inc eax
jmp oglmdi2_vs7.4094BF
cmp ebx,1
je oglmdi2_vs7.4094B1
mov eax,dword ptr ds:[412288]
mov dword ptr ss:[ebp+8],eax
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ds:[412288],eax
mov eax,dword ptr ds:[ecx+4]
cmp eax,8
jne oglmdi2_vs7.4094A1
mov eax,dword ptr ds:[411800]
mov edx,dword ptr ds:[411804]
add edx,eax
cmp eax,edx
jge oglmdi2_vs7.4093FC
lea esi,dword ptr ds:[eax+eax*2]
lea esi,dword ptr ds:[esi*4+411790]
sub edx,eax
and dword ptr ds:[esi],0
add esi,C
dec edx
jne oglmdi2_vs7.4093F3
mov ecx,dword ptr ds:[ecx]
cmp ecx,C000008E
mov esi,dword ptr ds:[41180C]
jne oglmdi2_vs7.409418
mov dword ptr ds:[41180C],83
jmp oglmdi2_vs7.40948E
cmp ecx,C0000090
jne oglmdi2_vs7.40942C
mov dword ptr ds:[41180C],81
jmp oglmdi2_vs7.40948E
cmp ecx,C0000091
jne oglmdi2_vs7.409440
mov dword ptr ds:[41180C],84
jmp oglmdi2_vs7.40948E
cmp ecx,C0000093
jne oglmdi2_vs7.409454
mov dword ptr ds:[41180C],85
jmp oglmdi2_vs7.40948E
cmp ecx,C000008D
jne oglmdi2_vs7.409468
mov dword ptr ds:[41180C],82
jmp oglmdi2_vs7.40948E
cmp ecx,C000008F
jne oglmdi2_vs7.40947C
mov dword ptr ds:[41180C],86
jmp oglmdi2_vs7.40948E
cmp ecx,C0000092
jne oglmdi2_vs7.40948E
mov dword ptr ds:[41180C],8A
push dword ptr ds:[41180C]
push 8
call ebx
pop ecx
mov dword ptr ds:[41180C],esi
jmp oglmdi2_vs7.4094A8
and dword ptr ds:[ecx+8],0
push eax
call ebx
mov eax,dword ptr ss:[ebp+8]
pop ecx
mov dword ptr ds:[412288],eax
or eax,FFFFFFFF
jmp oglmdi2_vs7.4094BF
push dword ptr ss:[ebp+C]
call dword ptr ds:[<&UnhandledExceptionFilter>]
pop esi
pop ebx
pop ebp
ret 
cmp dword ptr ds:[4128AC],0
jne oglmdi2_vs7.4094D1
call oglmdi2_vs7.40B82D
push esi
mov esi,dword ptr ds:[4128D4]
test esi,esi
jne oglmdi2_vs7.4094E3
mov esi,oglmdi2_vs7.40ED6A
jmp oglmdi2_vs7.409528
mov al,byte ptr ds:[esi]
cmp al,22
jne oglmdi2_vs7.409511
inc esi
mov al,byte ptr ds:[esi]
cmp al,22
je oglmdi2_vs7.409521
test al,al
je oglmdi2_vs7.40950A
movzx eax,al
push eax
call oglmdi2_vs7.40B446
test eax,eax
pop ecx
je oglmdi2_vs7.409503
inc esi
inc esi
mov al,byte ptr ds:[esi]
cmp al,22
jne oglmdi2_vs7.4094F0
cmp byte ptr ds:[esi],22
jne oglmdi2_vs7.409522
jmp oglmdi2_vs7.409521
cmp al,20
jbe oglmdi2_vs7.409522
inc esi
cmp byte ptr ds:[esi],20
ja oglmdi2_vs7.409515
jmp oglmdi2_vs7.409522
cmp al,20
ja oglmdi2_vs7.409528
inc esi
mov al,byte ptr ds:[esi]
test al,al
jne oglmdi2_vs7.40951D
mov eax,esi
pop esi
ret 
push ebx
xor ebx,ebx
cmp dword ptr ds:[4128AC],ebx
push esi
push edi
jne oglmdi2_vs7.40953E
call oglmdi2_vs7.40B82D
mov esi,dword ptr ds:[4121E0]
xor edi,edi
cmp esi,ebx
jne oglmdi2_vs7.40955C
jmp oglmdi2_vs7.40957C
cmp al,3D
je oglmdi2_vs7.409551
inc edi
push esi
call oglmdi2_vs7.4058A0
pop ecx
lea esi,dword ptr ds:[esi+eax+1]
mov al,byte ptr ds:[esi]
cmp al,bl
jne oglmdi2_vs7.40954C
lea eax,dword ptr ds:[edi*4+4]
push eax
call oglmdi2_vs7.4052DA
mov edi,eax
cmp edi,ebx
pop ecx
mov dword ptr ds:[412254],edi
jne oglmdi2_vs7.409581
or eax,FFFFFFFF
jmp oglmdi2_vs7.4095D9
mov esi,dword ptr ds:[4121E0]
push ebp
jmp oglmdi2_vs7.4095B4
push esi
call oglmdi2_vs7.4058A0
mov ebp,eax
inc ebp
cmp byte ptr ds:[esi],3D
pop ecx
je oglmdi2_vs7.4095B2
push ebp
call oglmdi2_vs7.4052DA
cmp eax,ebx
pop ecx
mov dword ptr ds:[edi],eax
je oglmdi2_vs7.4095DD
push esi
push eax
call oglmdi2_vs7.409AE0
pop ecx
pop ecx
add edi,4
add esi,ebp
cmp byte ptr ds:[esi],bl
jne oglmdi2_vs7.40958A
push dword ptr ds:[4121E0]
call oglmdi2_vs7.4051DA
mov dword ptr ds:[4121E0],ebx
mov dword ptr ds:[edi],ebx
mov dword ptr ds:[4128A0],1
xor eax,eax
pop ecx
pop ebp
pop edi
pop esi
pop ebx
ret 
push dword ptr ds:[412254]
call oglmdi2_vs7.4051DA
mov dword ptr ds:[412254],ebx
or eax,FFFFFFFF
jmp oglmdi2_vs7.4095D7
push ebp
mov ebp,esp
push ecx
push ebx
mov ebx,dword ptr ss:[ebp+C]
xor edx,edx
cmp dword ptr ss:[ebp+8],edx
push edi
mov dword ptr ds:[esi],edx
mov edi,ecx
mov dword ptr ds:[ebx],1
je oglmdi2_vs7.409616
mov ecx,dword ptr ss:[ebp+8]
add dword ptr ss:[ebp+8],4
mov dword ptr ds:[ecx],edi
cmp byte ptr ds:[eax],22
jne oglmdi2_vs7.409629
xor ecx,ecx
test edx,edx
sete cl
inc eax
mov edx,ecx
mov cl,22
jmp oglmdi2_vs7.409656
inc dword ptr ds:[esi]
test edi,edi
je oglmdi2_vs7.409634
mov cl,byte ptr ds:[eax]
mov byte ptr ds:[edi],cl
inc edi
mov cl,byte ptr ds:[eax]
movzx ebx,cl
inc eax
test byte ptr ds:[ebx+412561],4
je oglmdi2_vs7.40964F
inc dword ptr ds:[esi]
test edi,edi
je oglmdi2_vs7.40964E
mov bl,byte ptr ds:[eax]
mov byte ptr ds:[edi],bl
inc edi
inc eax
test cl,cl
mov ebx,dword ptr ss:[ebp+C]
je oglmdi2_vs7.409688
test edx,edx
jne oglmdi2_vs7.409616
cmp cl,20
je oglmdi2_vs7.409664
cmp cl,9
jne oglmdi2_vs7.409616
test edi,edi
je oglmdi2_vs7.40966C
and byte ptr ds:[edi-1],0
and dword ptr ss:[ebp-4],0
cmp byte ptr ds:[eax],0
je oglmdi2_vs7.40974F
mov cl,byte ptr ds:[eax]
cmp cl,20
je oglmdi2_vs7.409685
cmp cl,9
jne oglmdi2_vs7.40968B
inc eax
jmp oglmdi2_vs7.409679
dec eax
jmp oglmdi2_vs7.40966C
cmp byte ptr ds:[eax],0
je oglmdi2_vs7.40974F
cmp dword ptr ss:[ebp+8],0
je oglmdi2_vs7.4096A3
mov ecx,dword ptr ss:[ebp+8]
add dword ptr ss:[ebp+8],4
mov dword ptr ds:[ecx],edi
inc dword ptr ds:[ebx]
xor ebx,ebx
inc ebx
xor edx,edx
jmp oglmdi2_vs7.4096AE
inc eax
inc edx
cmp byte ptr ds:[eax],5C
je oglmdi2_vs7.4096AC
cmp byte ptr ds:[eax],22
jne oglmdi2_vs7.4096DE
test dl,1
jne oglmdi2_vs7.4096DC
cmp dword ptr ss:[ebp-4],0
je oglmdi2_vs7.4096CF
lea ecx,dword ptr ds:[eax+1]
cmp byte ptr ds:[ecx],22
jne oglmdi2_vs7.4096CF
mov eax,ecx
jmp oglmdi2_vs7.4096D1
xor ebx,ebx
xor ecx,ecx
cmp dword ptr ss:[ebp-4],ecx
sete cl
mov dword ptr ss:[ebp-4],ecx
shr edx,1
test edx,edx
je oglmdi2_vs7.4096EF
test edi,edi
je oglmdi2_vs7.4096EA
mov byte ptr ds:[edi],5C
inc edi
inc dword ptr ds:[esi]
dec edx
jne oglmdi2_vs7.4096E2
mov cl,byte ptr ds:[eax]
test cl,cl
je oglmdi2_vs7.40973D
cmp dword ptr ss:[ebp-4],0
jne oglmdi2_vs7.409705
cmp cl,20
je oglmdi2_vs7.40973D
cmp cl,9
je oglmdi2_vs7.40973D
test ebx,ebx
je oglmdi2_vs7.409737
test edi,edi
je oglmdi2_vs7.409726
movzx edx,cl
test byte ptr ds:[edx+412561],4
je oglmdi2_vs7.40971F
mov byte ptr ds:[edi],cl
inc edi
inc eax
inc dword ptr ds:[esi]
mov cl,byte ptr ds:[eax]
mov byte ptr ds:[edi],cl
inc edi
jmp oglmdi2_vs7.409735
movzx ecx,cl
test byte ptr ds:[ecx+412561],4
je oglmdi2_vs7.409735
inc eax
inc dword ptr ds:[esi]
inc dword ptr ds:[esi]
inc eax
jmp oglmdi2_vs7.4096A5
test edi,edi
je oglmdi2_vs7.409745
and byte ptr ds:[edi],0
inc edi
inc dword ptr ds:[esi]
mov ebx,dword ptr ss:[ebp+C]
jmp oglmdi2_vs7.409670
mov eax,dword ptr ss:[ebp+8]
test eax,eax
je oglmdi2_vs7.409759
and dword ptr ds:[eax],0
inc dword ptr ds:[ebx]
pop edi
pop ebx
leave 
ret 
push ebp
mov ebp,esp
push ecx
push ecx
push ebx
push esi
push edi
xor edi,edi
cmp dword ptr ds:[4128AC],edi
jne oglmdi2_vs7.409776
call oglmdi2_vs7.40B82D
and byte ptr ds:[412394],0
push 104
mov esi,oglmdi2_vs7.412290
push esi
push edi
call dword ptr ds:[<&GetModuleFileNameA>]
mov eax,dword ptr ds:[4128D4]
cmp eax,edi
mov dword ptr ds:[412264],esi
je oglmdi2_vs7.4097A5
cmp byte ptr ds:[eax],0
mov ebx,eax
jne oglmdi2_vs7.4097A7
mov ebx,esi
lea eax,dword ptr ss:[ebp-4]
push eax
push edi
lea esi,dword ptr ss:[ebp-8]
xor ecx,ecx
mov eax,ebx
call oglmdi2_vs7.4095F3
mov esi,dword ptr ss:[ebp-4]
mov eax,dword ptr ss:[ebp-8]
shl esi,2
add eax,esi
push eax
call oglmdi2_vs7.4052DA
mov edi,eax
add esp,C
test edi,edi
jne oglmdi2_vs7.4097D7
or eax,FFFFFFFF
jmp oglmdi2_vs7.4097FC
lea eax,dword ptr ss:[ebp-4]
push eax
lea ecx,dword ptr ds:[esi+edi]
push edi
lea esi,dword ptr ss:[ebp-8]
mov eax,ebx
call oglmdi2_vs7.4095F3
mov eax,dword ptr ss:[ebp-4]
dec eax
pop ecx
mov dword ptr ds:[412248],eax
pop ecx
mov dword ptr ds:[41224C],edi
xor eax,eax
pop edi
pop esi
pop ebx
leave 
ret 
push ecx
push ecx
mov eax,dword ptr ds:[412398]
push ebx
push ebp
push esi
push edi
mov edi,dword ptr ds:[<&GetEnvironmentStringsW>]
xor ebx,ebx
xor esi,esi
cmp eax,ebx
push 2
pop ebp
jne oglmdi2_vs7.40984A
call edi
mov esi,eax
cmp esi,ebx
je oglmdi2_vs7.409831
mov dword ptr ds:[412398],1
jmp oglmdi2_vs7.40984F
call dword ptr ds:[<&GetLastError>]
cmp eax,78
jne oglmdi2_vs7.409845
mov eax,ebp
mov dword ptr ds:[412398],eax
jmp oglmdi2_vs7.40984A
mov eax,dword ptr ds:[412398]
cmp eax,1
jne oglmdi2_vs7.4098CC
cmp esi,ebx
jne oglmdi2_vs7.40985B
call edi
mov esi,eax
cmp esi,ebx
je oglmdi2_vs7.4098D4
cmp word ptr ds:[esi],bx
mov eax,esi
je oglmdi2_vs7.409870
add eax,ebp
cmp word ptr ds:[eax],bx
jne oglmdi2_vs7.409862
add eax,ebp
cmp word ptr ds:[eax],bx
jne oglmdi2_vs7.409862
mov edi,dword ptr ds:[<&WideCharToMultiByte>]
push ebx
push ebx
push ebx
sub eax,esi
push ebx
sar eax,1
inc eax
push eax
push esi
push ebx
push ebx
mov dword ptr ss:[esp+34],eax
call edi
mov ebp,eax
cmp ebp,ebx
je oglmdi2_vs7.4098C1
push ebp
call oglmdi2_vs7.4052DA
cmp eax,ebx
pop ecx
mov dword ptr ss:[esp+10],eax
je oglmdi2_vs7.4098C1
push ebx
push ebx
push ebp
push eax
push dword ptr ss:[esp+24]
push esi
push ebx
push ebx
call edi
test eax,eax
jne oglmdi2_vs7.4098BD
push dword ptr ss:[esp+10]
call oglmdi2_vs7.4051DA
pop ecx
mov dword ptr ss:[esp+10],ebx
mov ebx,dword ptr ss:[esp+10]
push esi
call dword ptr ds:[<&FreeEnvironmentStringsW>]
mov eax,ebx
jmp oglmdi2_vs7.40991C
cmp eax,ebp
je oglmdi2_vs7.4098D8
cmp eax,ebx
je oglmdi2_vs7.4098D8
xor eax,eax
jmp oglmdi2_vs7.40991C
call dword ptr ds:[<&GetEnvironmentStrings>]
mov esi,eax
cmp esi,ebx
je oglmdi2_vs7.4098D4
cmp byte ptr ds:[esi],bl
je oglmdi2_vs7.4098F2
inc eax
cmp byte ptr ds:[eax],bl
jne oglmdi2_vs7.4098E8
inc eax
cmp byte ptr ds:[eax],bl
jne oglmdi2_vs7.4098E8
sub eax,esi
inc eax
mov ebp,eax
push ebp
call oglmdi2_vs7.4052DA
mov edi,eax
cmp edi,ebx
pop ecx
jne oglmdi2_vs7.409908
xor edi,edi
jmp oglmdi2_vs7.409913
push ebp
push esi
push edi
call oglmdi2_vs7.405930
add esp,C
push esi
call dword ptr ds:[<&FreeEnvironmentStringsA>]
mov eax,edi
pop edi
pop esi
pop ebp
pop ebx
pop ecx
pop ecx
ret 
push C
push oglmdi2_vs7.40ED70
call oglmdi2_vs7.406308
mov dword ptr ss:[ebp-1C],oglmdi2_vs7.40F4B0
cmp dword ptr ss:[ebp-1C],oglmdi2_vs7.40F4B0
jae oglmdi2_vs7.409961
and dword ptr ss:[ebp-4],0
mov eax,dword ptr ss:[ebp-1C]
mov eax,dword ptr ds:[eax]
test eax,eax
je oglmdi2_vs7.409957
call eax
jmp oglmdi2_vs7.409957
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
or dword ptr ss:[ebp-4],FFFFFFFF
add dword ptr ss:[ebp-1C],4
jmp oglmdi2_vs7.409936
call oglmdi2_vs7.406343
ret 
push C
push oglmdi2_vs7.40ED80
call oglmdi2_vs7.406308
mov dword ptr ss:[ebp-1C],oglmdi2_vs7.40F4B8
cmp dword ptr ss:[ebp-1C],oglmdi2_vs7.40F4B8
jae oglmdi2_vs7.4099A5
and dword ptr ss:[ebp-4],0
mov eax,dword ptr ss:[ebp-1C]
mov eax,dword ptr ds:[eax]
test eax,eax
je oglmdi2_vs7.40999B
call eax
jmp oglmdi2_vs7.40999B
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
or dword ptr ss:[ebp-4],FFFFFFFF
add dword ptr ss:[ebp-1C],4
jmp oglmdi2_vs7.40997A
call oglmdi2_vs7.406343
ret 
int3 
int3 
int3 
int3 
int3 
cmp eax,1000
jae oglmdi2_vs7.4099C5
neg eax
add eax,esp
add eax,4
test dword ptr ds:[eax],eax
xchg eax,esp
mov eax,dword ptr ds:[eax]
push eax
ret 
push ecx
lea ecx,dword ptr ss:[esp+8]
sub ecx,1000
sub eax,1000
test dword ptr ds:[ecx],eax
cmp eax,1000
jae oglmdi2_vs7.4099CA
sub ecx,eax
mov eax,esp
test dword ptr ds:[ecx],eax
mov esp,ecx
mov ecx,dword ptr ds:[eax]
mov eax,dword ptr ds:[eax+4]
push eax
ret 
int3 
int3 
int3 
mov edx,dword ptr ss:[esp+4]
mov ecx,dword ptr ss:[esp+8]
test edx,3
jne oglmdi2_vs7.409A3C
mov eax,dword ptr ds:[edx]
cmp al,byte ptr ds:[ecx]
jne oglmdi2_vs7.409A34
or al,al
je oglmdi2_vs7.409A30
cmp ah,byte ptr ds:[ecx+1]
jne oglmdi2_vs7.409A34
or ah,ah
je oglmdi2_vs7.409A30
shr eax,10
cmp al,byte ptr ds:[ecx+2]
jne oglmdi2_vs7.409A34
or al,al
je oglmdi2_vs7.409A30
cmp ah,byte ptr ds:[ecx+3]
jne oglmdi2_vs7.409A34
add ecx,4
add edx,4
or ah,ah
jne oglmdi2_vs7.409A00
mov edi,edi
xor eax,eax
ret 
nop 
sbb eax,eax
shl eax,1
add eax,1
ret 
test edx,1
je oglmdi2_vs7.409A5C
mov al,byte ptr ds:[edx]
add edx,1
cmp al,byte ptr ds:[ecx]
jne oglmdi2_vs7.409A34
add ecx,1
or al,al
je oglmdi2_vs7.409A30
test edx,2
je oglmdi2_vs7.409A00
mov ax,word ptr ds:[edx]
add edx,2
cmp al,byte ptr ds:[ecx]
jne oglmdi2_vs7.409A34
or al,al
je oglmdi2_vs7.409A30
cmp ah,byte ptr ds:[ecx+1]
jne oglmdi2_vs7.409A34
or ah,ah
je oglmdi2_vs7.409A30
add ecx,2
jmp oglmdi2_vs7.409A00
push esi
mov esi,dword ptr ss:[esp+8]
mov eax,dword ptr ds:[esi]
cmp dword ptr ds:[eax],E06D7363
jne oglmdi2_vs7.409A9B
cmp dword ptr ds:[eax+10],3
jne oglmdi2_vs7.409A9B
cmp dword ptr ds:[eax+14],19930520
jne oglmdi2_vs7.409A9B
call oglmdi2_vs7.4062AC
mov eax,dword ptr ds:[41239C]
test eax,eax
je oglmdi2_vs7.409AB8
push eax
call oglmdi2_vs7.40B0D6
test eax,eax
pop ecx
je oglmdi2_vs7.409AB8
push esi
call dword ptr ds:[41239C]
jmp oglmdi2_vs7.409ABA
xor eax,eax
pop esi
ret 4
push oglmdi2_vs7.409A78
call dword ptr ds:[<&SetUnhandledExceptionFilter>]
mov dword ptr ds:[41239C],eax
xor eax,eax
ret 
push dword ptr ds:[41239C]
call dword ptr ds:[<&SetUnhandledExceptionFilter>]
ret 
int3 
int3 
push edi
mov edi,dword ptr ss:[esp+8]
jmp oglmdi2_vs7.409B55
lea esp,dword ptr ss:[esp]
mov edi,edi
mov ecx,dword ptr ss:[esp+4]
push edi
test ecx,3
je oglmdi2_vs7.409B10
mov al,byte ptr ds:[ecx]
add ecx,1
test al,al
je oglmdi2_vs7.409B43
test ecx,3
jne oglmdi2_vs7.409AFD
mov edi,edi
mov eax,dword ptr ds:[ecx]
mov edx,7EFEFEFF
add edx,eax
xor eax,FFFFFFFF
xor eax,edx
add ecx,4
test eax,81010100
je oglmdi2_vs7.409B10
mov eax,dword ptr ds:[ecx-4]
test al,al
je oglmdi2_vs7.409B52
test ah,ah
je oglmdi2_vs7.409B4D
test eax,FF0000
je oglmdi2_vs7.409B48
test eax,FF000000
je oglmdi2_vs7.409B43
jmp oglmdi2_vs7.409B10
lea edi,dword ptr ds:[ecx-1]
jmp oglmdi2_vs7.409B55
lea edi,dword ptr ds:[ecx-2]
jmp oglmdi2_vs7.409B55
lea edi,dword ptr ds:[ecx-3]
jmp oglmdi2_vs7.409B55
lea edi,dword ptr ds:[ecx-4]
mov ecx,dword ptr ss:[esp+C]
test ecx,3
je oglmdi2_vs7.409B7E
mov dl,byte ptr ds:[ecx]
add ecx,1
test dl,dl
je oglmdi2_vs7.409BD0
mov byte ptr ds:[edi],dl
add edi,1
test ecx,3
jne oglmdi2_vs7.409B61
jmp oglmdi2_vs7.409B7E
mov dword ptr ds:[edi],edx
add edi,4
mov edx,7EFEFEFF
mov eax,dword ptr ds:[ecx]
add edx,eax
xor eax,FFFFFFFF
xor eax,edx
mov edx,dword ptr ds:[ecx]
add ecx,4
test eax,81010100
je oglmdi2_vs7.409B79
test dl,dl
je oglmdi2_vs7.409BD0
test dh,dh
je oglmdi2_vs7.409BC7
test edx,FF0000
je oglmdi2_vs7.409BBA
test edx,FF000000
je oglmdi2_vs7.409BB2
jmp oglmdi2_vs7.409B79
mov dword ptr ds:[edi],edx
mov eax,dword ptr ss:[esp+8]
pop edi
ret 
mov word ptr ds:[edi],dx
mov eax,dword ptr ss:[esp+8]
mov byte ptr ds:[edi+2],0
pop edi
ret 
mov word ptr ds:[edi],dx
mov eax,dword ptr ss:[esp+8]
pop edi
ret 
mov byte ptr ds:[edi],dl
mov eax,dword ptr ss:[esp+8]
pop edi
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
push esi
xor eax,eax
push eax
push eax
push eax
push eax
push eax
push eax
push eax
push eax
mov edx,dword ptr ss:[ebp+C]
lea ecx,dword ptr ds:[ecx]
mov al,byte ptr ds:[edx]
or al,al
je oglmdi2_vs7.409C03
add edx,1
bts dword ptr ss:[esp],eax
jmp oglmdi2_vs7.409BF4
mov esi,dword ptr ss:[ebp+8]
or ecx,FFFFFFFF
lea ecx,dword ptr ds:[ecx]
add ecx,1
mov al,byte ptr ds:[esi]
or al,al
je oglmdi2_vs7.409C1E
add esi,1
bt dword ptr ss:[esp],eax
jae oglmdi2_vs7.409C0C
mov eax,ecx
add esp,20
pop esi
leave 
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov ecx,dword ptr ss:[esp+C]
push edi
test ecx,ecx
je oglmdi2_vs7.409CCF
push esi
push ebx
mov ebx,ecx
mov esi,dword ptr ss:[esp+14]
test esi,3
mov edi,dword ptr ss:[esp+10]
jne oglmdi2_vs7.409C5C
shr ecx,2
jne oglmdi2_vs7.409CDF
jmp oglmdi2_vs7.409C83
mov al,byte ptr ds:[esi]
add esi,1
mov byte ptr ds:[edi],al
add edi,1
sub ecx,1
je oglmdi2_vs7.409C96
test al,al
je oglmdi2_vs7.409C9E
test esi,3
jne oglmdi2_vs7.409C5C
mov ebx,ecx
shr ecx,2
jne oglmdi2_vs7.409CDF
and ebx,3
je oglmdi2_vs7.409C96
mov al,byte ptr ds:[esi]
add esi,1
mov byte ptr ds:[edi],al
add edi,1
test al,al
je oglmdi2_vs7.409CC8
sub ebx,1
jne oglmdi2_vs7.409C83
mov eax,dword ptr ss:[esp+10]
pop ebx
pop esi
pop edi
ret 
test edi,3
je oglmdi2_vs7.409CBC
mov byte ptr ds:[edi],al
add edi,1
sub ecx,1
je oglmdi2_vs7.409D4C
test edi,3
jne oglmdi2_vs7.409CA6
mov ebx,ecx
shr ecx,2
jne oglmdi2_vs7.409D37
mov byte ptr ds:[edi],al
add edi,1
sub ebx,1
jne oglmdi2_vs7.409CC3
pop ebx
pop esi
mov eax,dword ptr ss:[esp+8]
pop edi
ret 
mov dword ptr ds:[edi],edx
add edi,4
sub ecx,1
je oglmdi2_vs7.409C7E
mov edx,7EFEFEFF
mov eax,dword ptr ds:[esi]
add edx,eax
xor eax,FFFFFFFF
xor eax,edx
mov edx,dword ptr ds:[esi]
add esi,4
test eax,81010100
je oglmdi2_vs7.409CD5
test dl,dl
je oglmdi2_vs7.409D29
test dh,dh
je oglmdi2_vs7.409D1F
test edx,FF0000
je oglmdi2_vs7.409D15
test edx,FF000000
jne oglmdi2_vs7.409CD5
mov dword ptr ds:[edi],edx
jmp oglmdi2_vs7.409D2D
and edx,FFFF
mov dword ptr ds:[edi],edx
jmp oglmdi2_vs7.409D2D
and edx,FF
mov dword ptr ds:[edi],edx
jmp oglmdi2_vs7.409D2D
xor edx,edx
mov dword ptr ds:[edi],edx
add edi,4
xor eax,eax
sub ecx,1
je oglmdi2_vs7.409D43
xor eax,eax
mov dword ptr ds:[edi],eax
add edi,4
sub ecx,1
jne oglmdi2_vs7.409D39
and ebx,3
jne oglmdi2_vs7.409CC3
mov eax,dword ptr ss:[esp+10]
pop ebx
pop esi
pop edi
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov edx,dword ptr ss:[esp+C]
mov ecx,dword ptr ss:[esp+4]
test edx,edx
je oglmdi2_vs7.409DBB
xor eax,eax
mov al,byte ptr ss:[esp+8]
push edi
mov edi,ecx
cmp edx,4
jb oglmdi2_vs7.409DAB
neg ecx
and ecx,3
je oglmdi2_vs7.409D8D
sub edx,ecx
mov byte ptr ds:[edi],al
add edi,1
sub ecx,1
jne oglmdi2_vs7.409D83
mov ecx,eax
shl eax,8
add eax,ecx
mov ecx,eax
shl eax,10
add eax,ecx
mov ecx,edx
and edx,3
shr ecx,2
je oglmdi2_vs7.409DAB
rep stosd dword ptr es:[edi],eax
test edx,edx
je oglmdi2_vs7.409DB5
mov byte ptr ds:[edi],al
add edi,1
sub edx,1
jne oglmdi2_vs7.409DAB
mov eax,dword ptr ss:[esp+8]
pop edi
ret 
mov eax,dword ptr ss:[esp+4]
ret 
push 1C
push oglmdi2_vs7.40ED90
call oglmdi2_vs7.406308
xor esi,esi
cmp dword ptr ds:[4123EC],esi
jne oglmdi2_vs7.409E0B
lea eax,dword ptr ss:[ebp-1C]
push eax
xor edi,edi
inc edi
push edi
push oglmdi2_vs7.40E2B0
push edi
call dword ptr ds:[<&GetStringTypeW>]
test eax,eax
je oglmdi2_vs7.409DF6
mov dword ptr ds:[4123EC],edi
jmp oglmdi2_vs7.409E0B
call dword ptr ds:[<&GetLastError>]
cmp eax,78
jne oglmdi2_vs7.409E0B
mov dword ptr ds:[4123EC],2
mov eax,dword ptr ds:[4123EC]
cmp eax,2
je oglmdi2_vs7.409F03
cmp eax,esi
je oglmdi2_vs7.409F03
cmp eax,1
jne oglmdi2_vs7.409F29
mov dword ptr ss:[ebp-20],esi
mov dword ptr ss:[ebp-24],esi
cmp dword ptr ss:[ebp+18],esi
jne oglmdi2_vs7.409E3D
mov eax,dword ptr ds:[4123E4]
mov dword ptr ss:[ebp+18],eax
push esi
push esi
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
xor eax,eax
cmp dword ptr ss:[ebp+20],esi
setne al
lea eax,dword ptr ds:[eax*8+1]
push eax
push dword ptr ss:[ebp+18]
call dword ptr ds:[<&MultiByteToWideChar>]
mov edi,eax
mov dword ptr ss:[ebp-28],edi
test edi,edi
je oglmdi2_vs7.409F29
and dword ptr ss:[ebp-4],0
lea ebx,dword ptr ds:[edi+edi]
mov eax,ebx
add eax,3
and eax,FFFFFFFC
call oglmdi2_vs7.4099B0
mov dword ptr ss:[ebp-18],esp
mov esi,esp
mov dword ptr ss:[ebp-2C],esi
push ebx
push 0
push esi
call oglmdi2_vs7.409D60
add esp,C
or dword ptr ss:[ebp-4],FFFFFFFF
jmp oglmdi2_vs7.409EAE
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
call oglmdi2_vs7.40BABB
xor esi,esi
or dword ptr ss:[ebp-4],FFFFFFFF
mov edi,dword ptr ss:[ebp-28]
test esi,esi
jne oglmdi2_vs7.409EC9
push edi
push 2
call oglmdi2_vs7.409070
pop ecx
pop ecx
mov esi,eax
test esi,esi
je oglmdi2_vs7.409F29
mov dword ptr ss:[ebp-24],1
push edi
push esi
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push 1
push dword ptr ss:[ebp+18]
call dword ptr ds:[<&MultiByteToWideChar>]
test eax,eax
je oglmdi2_vs7.409EF1
push dword ptr ss:[ebp+14]
push eax
push esi
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&GetStringTypeW>]
mov dword ptr ss:[ebp-20],eax
cmp dword ptr ss:[ebp-24],0
je oglmdi2_vs7.409EFE
push esi
call oglmdi2_vs7.4051DA
pop ecx
mov eax,dword ptr ss:[ebp-20]
jmp oglmdi2_vs7.409F71
mov ebx,dword ptr ss:[ebp+1C]
cmp ebx,esi
jne oglmdi2_vs7.409F10
mov ebx,dword ptr ds:[4123D4]
mov edi,dword ptr ss:[ebp+18]
test edi,edi
jne oglmdi2_vs7.409F1D
mov edi,dword ptr ds:[4123E4]
push ebx
call oglmdi2_vs7.40B8A3
pop ecx
cmp eax,FFFFFFFF
jne oglmdi2_vs7.409F2D
xor eax,eax
jmp oglmdi2_vs7.409F71
cmp eax,edi
je oglmdi2_vs7.409F4F
push 0
push 0
lea ecx,dword ptr ss:[ebp+10]
push ecx
push dword ptr ss:[ebp+C]
push eax
push edi
call oglmdi2_vs7.40B8EC
add esp,18
mov esi,eax
test esi,esi
je oglmdi2_vs7.409F29
mov dword ptr ss:[ebp+C],esi
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
push ebx
call dword ptr ds:[<&GetStringTypeExA>]
mov edi,eax
test esi,esi
je oglmdi2_vs7.409F6F
push esi
call oglmdi2_vs7.4051DA
pop ecx
mov eax,edi
lea esp,dword ptr ss:[ebp-38]
call oglmdi2_vs7.406343
ret 
int3 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
push edi
push esi
push ebx
mov ecx,dword ptr ss:[ebp+10]
jecxz oglmdi2_vs7.409FB2
mov ebx,ecx
mov edi,dword ptr ss:[ebp+8]
mov esi,edi
xor eax,eax
repne scasb al,byte ptr es:[edi]
neg ecx
add ecx,ebx
mov edi,esi
mov esi,dword ptr ss:[ebp+C]
repe cmpsb byte ptr ds:[esi],byte ptr es:[edi]
mov al,byte ptr ds:[esi-1]
xor ecx,ecx
cmp al,byte ptr ds:[edi-1]
ja oglmdi2_vs7.409FB0
je oglmdi2_vs7.409FB2
sub ecx,2
not ecx
mov eax,ecx
pop ebx
pop esi
pop edi
leave 
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
push esi
xor eax,eax
push eax
push eax
push eax
push eax
push eax
push eax
push eax
push eax
mov edx,dword ptr ss:[ebp+C]
lea ecx,dword ptr ds:[ecx]
mov al,byte ptr ds:[edx]
or al,al
je oglmdi2_vs7.409FE3
add edx,1
bts dword ptr ss:[esp],eax
jmp oglmdi2_vs7.409FD4
mov esi,dword ptr ss:[ebp+8]
mov edi,edi
mov al,byte ptr ds:[esi]
or al,al
je oglmdi2_vs7.409FFA
add esi,1
bt dword ptr ss:[esp],eax
jae oglmdi2_vs7.409FE8
lea eax,dword ptr ds:[esi-1]
add esp,20
pop esi
leave 
ret 
push ebx
mov ebx,dword ptr ss:[esp+8]
test ebx,ebx
push ebp
push edi
jne oglmdi2_vs7.40A01A
push dword ptr ss:[esp+14]
call oglmdi2_vs7.4052DA
pop ecx
jmp oglmdi2_vs7.40A15E
push esi
mov esi,dword ptr ss:[esp+18]
test esi,esi
jne oglmdi2_vs7.40A02F
push ebx
call oglmdi2_vs7.4051DA
pop ecx
jmp oglmdi2_vs7.40A15B
cmp dword ptr ds:[4128D0],3
jne oglmdi2_vs7.40A127
xor edi,edi
cmp esi,FFFFFFE0
ja oglmdi2_vs7.40A109
push ebx
call oglmdi2_vs7.407BCF
mov ebp,eax
test ebp,ebp
pop ecx
je oglmdi2_vs7.40A0E8
cmp esi,dword ptr ds:[4128BC]
ja oglmdi2_vs7.40A0A8
push esi
push ebx
push ebp
call oglmdi2_vs7.4080CF
add esp,C
test eax,eax
je oglmdi2_vs7.40A073
mov edi,ebx
jmp oglmdi2_vs7.40A0A4
push esi
call oglmdi2_vs7.4083AE
mov edi,eax
test edi,edi
pop ecx
je oglmdi2_vs7.40A0A8
mov eax,dword ptr ds:[ebx-4]
dec eax
cmp eax,esi
jb oglmdi2_vs7.40A08A
mov eax,esi
push eax
push ebx
push edi
call oglmdi2_vs7.405930
push ebx
call oglmdi2_vs7.407BCF
mov ebp,eax
push ebx
push ebp
call oglmdi2_vs7.407BFA
add esp,18
test edi,edi
jne oglmdi2_vs7.40A0E4
test esi,esi
jne oglmdi2_vs7.40A0AD
inc esi
add esi,F
and esi,FFFFFFF0
push esi
push 0
push dword ptr ds:[4128CC]
call dword ptr ds:[<&RtlAllocateHeap>]
mov edi,eax
test edi,edi
je oglmdi2_vs7.40A0E4
mov eax,dword ptr ds:[ebx-4]
dec eax
cmp eax,esi
jb oglmdi2_vs7.40A0D2
mov eax,esi
push eax
push ebx
push edi
call oglmdi2_vs7.405930
push ebx
push ebp
call oglmdi2_vs7.407BFA
add esp,14
test ebp,ebp
jne oglmdi2_vs7.40A105
test esi,esi
jne oglmdi2_vs7.40A0ED
inc esi
add esi,F
and esi,FFFFFFF0
push esi
push ebx
push 0
push dword ptr ds:[4128CC]
call dword ptr ds:[<&RtlReAllocateHeap>]
mov edi,eax
test edi,edi
jne oglmdi2_vs7.40A123
cmp dword ptr ds:[412224],0
je oglmdi2_vs7.40A123
push esi
call oglmdi2_vs7.406100
test eax,eax
pop ecx
jne oglmdi2_vs7.40A03C
jmp oglmdi2_vs7.40A15B
mov eax,edi
jmp oglmdi2_vs7.40A15D
xor eax,eax
cmp esi,FFFFFFE0
ja oglmdi2_vs7.40A147
test esi,esi
jne oglmdi2_vs7.40A133
inc esi
push esi
push ebx
push 0
push dword ptr ds:[4128CC]
call dword ptr ds:[<&RtlReAllocateHeap>]
test eax,eax
jne oglmdi2_vs7.40A15D
cmp dword ptr ds:[412224],0
je oglmdi2_vs7.40A15D
push esi
call oglmdi2_vs7.406100
test eax,eax
pop ecx
jne oglmdi2_vs7.40A127
xor eax,eax
pop esi
pop edi
pop ebp
pop ebx
ret 
cmp dword ptr ds:[4128D0],3
push esi
jne oglmdi2_vs7.40A186
mov esi,dword ptr ss:[esp+8]
push esi
call oglmdi2_vs7.407BCF
test eax,eax
pop ecx
je oglmdi2_vs7.40A183
mov eax,dword ptr ds:[esi-4]
sub eax,9
pop esi
ret 
push esi
jmp oglmdi2_vs7.40A18A
push dword ptr ss:[esp+8]
push 0
push dword ptr ds:[4128CC]
call dword ptr ds:[<&RtlSizeHeap>]
pop esi
ret 
mov ecx,dword ptr ds:[411808]
mov eax,oglmdi2_vs7.411788
push esi
cmp dword ptr ds:[eax+4],edx
je oglmdi2_vs7.40A1BC
lea esi,dword ptr ds:[ecx+ecx*2]
add eax,C
lea esi,dword ptr ds:[esi*4+411788]
cmp eax,esi
jb oglmdi2_vs7.40A1A6
lea ecx,dword ptr ds:[ecx+ecx*2]
lea ecx,dword ptr ds:[ecx*4+411788]
cmp eax,ecx
pop esi
jae oglmdi2_vs7.40A1D0
cmp dword ptr ds:[eax+4],edx
je oglmdi2_vs7.40A1D2
xor eax,eax
ret 
push ebp
mov ebp,esp
push esi
push edi
mov edi,dword ptr ss:[ebp+8]
mov eax,edi
dec eax
dec eax
je oglmdi2_vs7.40A239
dec eax
dec eax
je oglmdi2_vs7.40A22B
sub eax,4
je oglmdi2_vs7.40A22B
sub eax,3
je oglmdi2_vs7.40A22B
sub eax,4
je oglmdi2_vs7.40A21E
sub eax,6
je oglmdi2_vs7.40A211
dec eax
je oglmdi2_vs7.40A204
or eax,FFFFFFFF
jmp oglmdi2_vs7.40A2F8
mov esi,dword ptr ds:[41241C]
mov eax,oglmdi2_vs7.41241C
jmp oglmdi2_vs7.40A244
mov esi,dword ptr ds:[412418]
mov eax,oglmdi2_vs7.412418
jmp oglmdi2_vs7.40A244
mov esi,dword ptr ds:[412420]
mov eax,oglmdi2_vs7.412420
jmp oglmdi2_vs7.40A244
mov edx,edi
call oglmdi2_vs7.40A19A
add eax,8
mov esi,dword ptr ds:[eax]
jmp oglmdi2_vs7.40A244
mov esi,dword ptr ds:[412414]
mov eax,oglmdi2_vs7.412414
cmp esi,1
je oglmdi2_vs7.40A2F6
test esi,esi
jne oglmdi2_vs7.40A258
push 3
call oglmdi2_vs7.408E24
push ebx
push 8
pop ecx
cmp edi,ecx
je oglmdi2_vs7.40A26A
cmp edi,B
je oglmdi2_vs7.40A26A
cmp edi,4
jne oglmdi2_vs7.40A290
mov ebx,dword ptr ds:[412288]
and dword ptr ds:[412288],0
cmp edi,ecx
jne oglmdi2_vs7.40A2BF
mov edx,dword ptr ds:[41180C]
mov dword ptr ss:[ebp+8],edx
mov dword ptr ds:[41180C],8C
jmp oglmdi2_vs7.40A293
mov ebx,dword ptr ss:[ebp+8]
cmp edi,ecx
jne oglmdi2_vs7.40A2BF
mov eax,dword ptr ds:[411800]
mov ecx,dword ptr ds:[411804]
add ecx,eax
cmp eax,ecx
jge oglmdi2_vs7.40A2C6
lea edx,dword ptr ds:[eax+eax*2]
lea edx,dword ptr ds:[edx*4+411790]
sub ecx,eax
and dword ptr ds:[edx],0
add edx,C
dec ecx
jne oglmdi2_vs7.40A2B4
jmp oglmdi2_vs7.40A2C6
and dword ptr ds:[eax],0
cmp edi,ecx
jne oglmdi2_vs7.40A2D4
push dword ptr ds:[41180C]
push 8
call esi
pop ecx
pop ecx
jmp oglmdi2_vs7.40A2E2
push edi
call esi
cmp edi,B
pop ecx
je oglmdi2_vs7.40A2E2
cmp edi,4
jne oglmdi2_vs7.40A2F5
cmp edi,8
mov dword ptr ds:[412288],ebx
jne oglmdi2_vs7.40A2F5
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ds:[41180C],eax
pop ebx
xor eax,eax
pop edi
pop esi
pop ebp
ret 
push esi
inc ebx
xor dh,byte ptr ds:[eax]
pop eax
inc ebx
xor byte ptr ds:[eax],dh
push ebp
mov ebp,esp
sub esp,8
push ebx
push esi
push edi
push ebp
cld 
mov ebx,dword ptr ss:[ebp+C]
mov eax,dword ptr ss:[ebp+8]
test dword ptr ds:[eax+4],6
jne oglmdi2_vs7.40A3A4
mov dword ptr ss:[ebp-8],eax
mov eax,dword ptr ss:[ebp+10]
mov dword ptr ss:[ebp-4],eax
lea eax,dword ptr ss:[ebp-8]
mov dword ptr ds:[ebx-4],eax
mov esi,dword ptr ds:[ebx+C]
mov edi,dword ptr ds:[ebx+8]
cmp esi,FFFFFFFF
je oglmdi2_vs7.40A39D
lea ecx,dword ptr ds:[esi+esi*2]
cmp dword ptr ds:[edi+ecx*4+4],0
je oglmdi2_vs7.40A38B
push esi
push ebp
lea ebp,dword ptr ds:[ebx+10]
call dword ptr ds:[edi+ecx*4+4]
pop ebp
pop esi
mov ebx,dword ptr ss:[ebp+C]
or eax,eax
je oglmdi2_vs7.40A38B
js oglmdi2_vs7.40A396
mov edi,dword ptr ds:[ebx+8]
push ebx
call oglmdi2_vs7.4050EC
add esp,4
lea ebp,dword ptr ds:[ebx+10]
push esi
push ebx
call oglmdi2_vs7.40512E
add esp,8
lea ecx,dword ptr ds:[esi+esi*2]
push 1
mov eax,dword ptr ds:[edi+ecx*4+8]
call oglmdi2_vs7.4051C2
mov eax,dword ptr ds:[edi+ecx*4]
mov dword ptr ds:[ebx+C],eax
call dword ptr ds:[edi+ecx*4+8]
mov edi,dword ptr ds:[ebx+8]
lea ecx,dword ptr ds:[esi+esi*2]
mov esi,dword ptr ds:[edi+ecx*4]
jmp oglmdi2_vs7.40A337
mov eax,0
jmp oglmdi2_vs7.40A3B9
mov eax,1
jmp oglmdi2_vs7.40A3B9
push ebp
lea ebp,dword ptr ds:[ebx+10]
push FFFFFFFF
push ebx
call oglmdi2_vs7.40512E
add esp,8
pop ebp
mov eax,1
pop ebp
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret 
push ebp
mov ecx,dword ptr ss:[esp+8]
mov ebp,dword ptr ds:[ecx]
mov eax,dword ptr ds:[ecx+1C]
push eax
mov eax,dword ptr ds:[ecx+18]
push eax
call oglmdi2_vs7.40512E
add esp,8
pop ebp
ret 4
push ebp
mov ebp,esp
push ecx
mov eax,dword ptr ss:[ebp+8]
lea ecx,dword ptr ds:[eax+1]
cmp ecx,100
ja oglmdi2_vs7.40A3FA
mov ecx,dword ptr ds:[41182C]
movzx eax,word ptr ds:[ecx+eax*2]
jmp oglmdi2_vs7.40A455
mov ecx,eax
sar ecx,8
push esi
mov esi,dword ptr ds:[41182C]
movzx edx,cl
test byte ptr ds:[esi+edx*2+1],80
pop esi
je oglmdi2_vs7.40A420
and byte ptr ss:[ebp-2],0
push 2
mov byte ptr ss:[ebp-3],al
mov byte ptr ss:[ebp-4],cl
pop eax
jmp oglmdi2_vs7.40A42A
and byte ptr ss:[ebp-3],0
mov byte ptr ss:[ebp-4],al
xor eax,eax
inc eax
push 1
push dword ptr ds:[4123D4]
lea ecx,dword ptr ss:[ebp+A]
push dword ptr ds:[4123E4]
push ecx
push eax
lea eax,dword ptr ss:[ebp-4]
push eax
push 1
call oglmdi2_vs7.409DC0
add esp,1C
test eax,eax
jne oglmdi2_vs7.40A451
leave 
ret 
movzx eax,word ptr ss:[ebp+A]
and eax,dword ptr ss:[ebp+C]
leave 
ret 
push ebp
mov ebp,esp
push ecx
push ecx
cmp dword ptr ds:[4123D4],0
push ebx
mov ebx,dword ptr ss:[ebp+8]
push esi
push edi
je oglmdi2_vs7.40A51B
cmp dword ptr ds:[411810],0
je oglmdi2_vs7.40A484
cmp ebx,7F
jbe oglmdi2_vs7.40A51B
xor esi,esi
mov edi,100
inc esi
cmp ebx,edi
jae oglmdi2_vs7.40A4B2
cmp dword ptr ds:[411820],esi
jle oglmdi2_vs7.40A4A3
push esi
push ebx
call oglmdi2_vs7.40A3DC
pop ecx
pop ecx
jmp oglmdi2_vs7.40A4AE
mov eax,dword ptr ds:[41182C]
movzx eax,byte ptr ds:[eax+ebx*2]
and eax,esi
test eax,eax
je oglmdi2_vs7.40A528
mov edx,dword ptr ds:[41182C]
mov eax,ebx
sar eax,8
movzx ecx,al
test byte ptr ds:[edx+ecx*2+1],80
je oglmdi2_vs7.40A4D6
and byte ptr ss:[ebp-2],0
push 2
mov byte ptr ss:[ebp-4],al
mov byte ptr ss:[ebp-3],bl
pop eax
jmp oglmdi2_vs7.40A4DF
and byte ptr ss:[ebp-3],0
mov byte ptr ss:[ebp-4],bl
mov eax,esi
push esi
push dword ptr ds:[4123E4]
lea ecx,dword ptr ss:[ebp-8]
push 3
push ecx
push eax
lea eax,dword ptr ss:[ebp-4]
push eax
push edi
push dword ptr ds:[4123D4]
call oglmdi2_vs7.40BB8C
add esp,20
test eax,eax
je oglmdi2_vs7.40A528
cmp eax,esi
jne oglmdi2_vs7.40A50E
movzx eax,byte ptr ss:[ebp-8]
jmp oglmdi2_vs7.40A52A
movzx ecx,byte ptr ss:[ebp-7]
xor eax,eax
mov ah,byte ptr ss:[ebp-8]
or eax,ecx
jmp oglmdi2_vs7.40A52A
cmp ebx,41
jl oglmdi2_vs7.40A528
cmp ebx,5A
lea eax,dword ptr ds:[ebx+20]
jle oglmdi2_vs7.40A52A
mov eax,ebx
pop edi
pop esi
pop ebx
leave 
ret 
mov eax,dword ptr ss:[esp+8]
push 20
pop ecx
cdq 
idiv ecx
push 1F
pop ecx
sub ecx,edx
or edx,FFFFFFFF
shl edx,cl
mov ecx,dword ptr ss:[esp+4]
not edx
test dword ptr ds:[ecx+eax*4],edx
je oglmdi2_vs7.40A557
xor eax,eax
ret 
cmp dword ptr ds:[ecx+eax*4],0
jne oglmdi2_vs7.40A54E
inc eax
cmp eax,3
jl oglmdi2_vs7.40A551
xor eax,eax
inc eax
ret 
mov eax,dword ptr ss:[esp+8]
push esi
push edi
push 20
pop ecx
cdq 
idiv ecx
mov edi,dword ptr ss:[esp+C]
mov esi,eax
lea eax,dword ptr ds:[edi+esi*4]
push eax
push 1F
pop ecx
sub ecx,edx
xor edx,edx
inc edx
shl edx,cl
push edx
push dword ptr ds:[eax]
call oglmdi2_vs7.40BF48
add esp,C
dec esi
js oglmdi2_vs7.40A5AB
lea edi,dword ptr ds:[edi+esi*4]
test eax,eax
je oglmdi2_vs7.40A5AB
push edi
push 1
push dword ptr ds:[edi]
call oglmdi2_vs7.40BF48
add esp,C
dec esi
sub edi,4
test esi,esi
jge oglmdi2_vs7.40A592
pop edi
pop esi
ret 
push ebp
mov ebp,esp
push ecx
and dword ptr ss:[ebp-4],0
push ebx
push esi
push edi
mov edi,dword ptr ss:[ebp+C]
dec edi
push 20
lea eax,dword ptr ds:[edi+1]
pop ecx
cdq 
idiv ecx
push 1F
pop esi
sub esi,edx
xor edx,edx
inc edx
mov ecx,esi
shl edx,cl
mov ebx,eax
mov eax,dword ptr ss:[ebp+8]
test dword ptr ds:[eax+ebx*4],edx
je oglmdi2_vs7.40A5FD
lea ecx,dword ptr ds:[edi+1]
push ecx
push eax
call oglmdi2_vs7.40A52F
test eax,eax
pop ecx
pop ecx
jne oglmdi2_vs7.40A5FA
push edi
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.40A561
pop ecx
pop ecx
mov dword ptr ss:[ebp-4],eax
mov eax,dword ptr ss:[ebp+8]
or edx,FFFFFFFF
mov ecx,esi
shl edx,cl
push 3
pop ecx
and dword ptr ds:[eax+ebx*4],edx
inc ebx
cmp ebx,ecx
jge oglmdi2_vs7.40A618
lea edi,dword ptr ds:[eax+ebx*4]
sub ecx,ebx
xor eax,eax
rep stosd dword ptr es:[edi],eax
mov eax,dword ptr ss:[ebp-4]
pop edi
pop esi
pop ebx
leave 
ret 
mov eax,dword ptr ss:[esp+8]
mov ecx,dword ptr ss:[esp+4]
push 3
pop edx
sub ecx,eax
push esi
mov esi,dword ptr ds:[eax]
mov dword ptr ds:[ecx+eax],esi
add eax,4
dec edx
jne oglmdi2_vs7.40A62E
pop esi
ret 
xor eax,eax
mov ecx,dword ptr ss:[esp+4]
cmp dword ptr ds:[ecx+eax*4],0
jne oglmdi2_vs7.40A651
inc eax
cmp eax,3
jl oglmdi2_vs7.40A63D
xor eax,eax
inc eax
ret 
xor eax,eax
ret 
push ebp
mov ebp,esp
sub esp,C
mov eax,dword ptr ss:[ebp+C]
push ebx
push esi
push edi
push 20
pop esi
cdq 
mov ecx,esi
idiv ecx
mov ebx,dword ptr ss:[ebp+8]
or edi,FFFFFFFF
mov dword ptr ss:[ebp+C],esi
mov ecx,edx
shl edi,cl
mov dword ptr ss:[ebp-8],eax
xor eax,eax
sub dword ptr ss:[ebp+C],edx
not edi
mov dword ptr ss:[ebp-4],eax
mov esi,dword ptr ds:[ebx+eax*4]
mov ecx,esi
and ecx,edi
mov dword ptr ss:[ebp-C],ecx
mov ecx,edx
shr esi,cl
mov ecx,dword ptr ss:[ebp+C]
or esi,dword ptr ss:[ebp-4]
mov dword ptr ds:[ebx+eax*4],esi
mov esi,dword ptr ss:[ebp-C]
shl esi,cl
inc eax
cmp eax,3
mov dword ptr ss:[ebp-4],esi
jl oglmdi2_vs7.40A682
push 2
pop eax
mov ecx,eax
sub ecx,dword ptr ss:[ebp-8]
lea ecx,dword ptr ds:[ebx+ecx*4]
cmp eax,dword ptr ss:[ebp-8]
jl oglmdi2_vs7.40A6BE
mov edx,dword ptr ds:[ecx]
mov dword ptr ds:[ebx+eax*4],edx
jmp oglmdi2_vs7.40A6C2
and dword ptr ds:[ebx+eax*4],0
dec eax
sub ecx,4
test eax,eax
jge oglmdi2_vs7.40A6B2
pop edi
pop esi
pop ebx
leave 
ret 
push ebp
mov ebp,esp
sub esp,18
mov eax,dword ptr ss:[ebp+8]
movzx ecx,word ptr ds:[eax+A]
push ebx
push esi
mov esi,dword ptr ss:[ebp+10]
push edi
mov edi,ecx
and ecx,8000
mov dword ptr ss:[ebp+8],ecx
mov ecx,dword ptr ds:[eax+6]
mov dword ptr ss:[ebp-C],ecx
mov ecx,dword ptr ds:[eax+2]
movzx eax,word ptr ds:[eax]
shl eax,10
and edi,7FFF
sub edi,3FFF
cmp edi,FFFFC001
mov dword ptr ss:[ebp-4],eax
lea eax,dword ptr ss:[ebp-C]
mov dword ptr ss:[ebp-8],ecx
push eax
jne oglmdi2_vs7.40A738
xor ebx,ebx
call oglmdi2_vs7.40A63B
test eax,eax
pop ecx
jne oglmdi2_vs7.40A7E7
lea edi,dword ptr ss:[ebp-C]
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
push 2
pop eax
jmp oglmdi2_vs7.40A7E9
lea eax,dword ptr ss:[ebp-18]
push eax
call oglmdi2_vs7.40A620
push dword ptr ds:[esi+8]
lea eax,dword ptr ss:[ebp-C]
push eax
call oglmdi2_vs7.40A5AE
add esp,10
test eax,eax
je oglmdi2_vs7.40A755
inc edi
mov eax,dword ptr ds:[esi+4]
mov ecx,eax
sub ecx,dword ptr ds:[esi+8]
cmp edi,ecx
jge oglmdi2_vs7.40A76B
xor eax,eax
lea edi,dword ptr ss:[ebp-C]
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
jmp oglmdi2_vs7.40A7A7
cmp edi,eax
jg oglmdi2_vs7.40A7AB
sub eax,edi
mov edi,eax
lea eax,dword ptr ss:[ebp-18]
push eax
lea eax,dword ptr ss:[ebp-C]
push eax
call oglmdi2_vs7.40A620
lea eax,dword ptr ss:[ebp-C]
push edi
push eax
call oglmdi2_vs7.40A654
push dword ptr ds:[esi+8]
lea eax,dword ptr ss:[ebp-C]
push eax
call oglmdi2_vs7.40A5AE
mov eax,dword ptr ds:[esi+C]
inc eax
push eax
lea eax,dword ptr ss:[ebp-C]
push eax
call oglmdi2_vs7.40A654
add esp,20
xor ebx,ebx
jmp oglmdi2_vs7.40A730
cmp edi,dword ptr ds:[esi]
push dword ptr ds:[esi+C]
jl oglmdi2_vs7.40A7D3
xor eax,eax
lea edi,dword ptr ss:[ebp-C]
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
or byte ptr ss:[ebp-9],80
lea eax,dword ptr ss:[ebp-C]
push eax
call oglmdi2_vs7.40A654
mov ebx,dword ptr ds:[esi+14]
add ebx,dword ptr ds:[esi]
pop ecx
xor eax,eax
pop ecx
inc eax
jmp oglmdi2_vs7.40A7E9
mov ebx,dword ptr ds:[esi+14]
and byte ptr ss:[ebp-9],7F
lea eax,dword ptr ss:[ebp-C]
push eax
add ebx,edi
call oglmdi2_vs7.40A654
pop ecx
pop ecx
xor eax,eax
push 1F
pop ecx
sub ecx,dword ptr ds:[esi+C]
mov esi,dword ptr ds:[esi+10]
shl ebx,cl
mov ecx,dword ptr ss:[ebp+8]
neg ecx
sbb ecx,ecx
and ecx,80000000
or ebx,ecx
or ebx,dword ptr ss:[ebp-C]
cmp esi,40
jne oglmdi2_vs7.40A818
mov ecx,dword ptr ss:[ebp+C]
mov edx,dword ptr ss:[ebp-8]
mov dword ptr ds:[ecx+4],ebx
mov dword ptr ds:[ecx],edx
jmp oglmdi2_vs7.40A822
cmp esi,20
jne oglmdi2_vs7.40A822
mov ecx,dword ptr ss:[ebp+C]
mov dword ptr ds:[ecx],ebx
pop edi
pop esi
pop ebx
leave 
ret 
push oglmdi2_vs7.411834
push dword ptr ss:[esp+C]
push dword ptr ss:[esp+C]
call oglmdi2_vs7.40A6CF
add esp,C
ret 
push oglmdi2_vs7.41184C
push dword ptr ss:[esp+C]
push dword ptr ss:[esp+C]
call oglmdi2_vs7.40A6CF
add esp,C
ret 
push ebp
mov ebp,esp
sub esp,14
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
mov dword ptr ss:[ebp-4],eax
xor eax,eax
push eax
push eax
push eax
push eax
push dword ptr ss:[ebp+C]
lea eax,dword ptr ss:[ebp-8]
push eax
lea eax,dword ptr ss:[ebp-14]
push eax
call oglmdi2_vs7.40C106
push dword ptr ss:[ebp+8]
lea eax,dword ptr ss:[ebp-14]
push eax
call oglmdi2_vs7.40A827
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
add esp,24
call oglmdi2_vs7.404CCC
leave 
ret 
push ebp
mov ebp,esp
sub esp,14
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
mov dword ptr ss:[ebp-4],eax
xor eax,eax
push eax
push eax
push eax
push eax
push dword ptr ss:[ebp+C]
lea eax,dword ptr ss:[ebp-8]
push eax
lea eax,dword ptr ss:[ebp-14]
push eax
call oglmdi2_vs7.40C106
push dword ptr ss:[ebp+8]
lea eax,dword ptr ss:[ebp-14]
push eax
call oglmdi2_vs7.40A83D
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
add esp,24
call oglmdi2_vs7.404CCC
leave 
ret 
push ebp
mov ebp,esp
mov edx,dword ptr ss:[ebp+10]
mov ecx,dword ptr ds:[edx+C]
push ebx
mov ebx,dword ptr ss:[ebp+C]
test ebx,ebx
push esi
mov esi,dword ptr ss:[ebp+8]
push edi
lea edi,dword ptr ds:[esi+1]
mov byte ptr ds:[esi],30
mov eax,edi
jle oglmdi2_vs7.40A916
mov dword ptr ss:[ebp+8],ebx
xor ebx,ebx
mov dl,byte ptr ds:[ecx]
test dl,dl
je oglmdi2_vs7.40A908
movsx edx,dl
inc ecx
jmp oglmdi2_vs7.40A90B
push 30
pop edx
mov byte ptr ds:[eax],dl
inc eax
dec dword ptr ss:[ebp+8]
jne oglmdi2_vs7.40A8FC
mov edx,dword ptr ss:[ebp+10]
and byte ptr ds:[eax],0
test ebx,ebx
jl oglmdi2_vs7.40A92F
cmp byte ptr ds:[ecx],35
jl oglmdi2_vs7.40A92F
jmp oglmdi2_vs7.40A927
mov byte ptr ds:[eax],30
dec eax
cmp byte ptr ds:[eax],39
je oglmdi2_vs7.40A924
inc byte ptr ds:[eax]
cmp byte ptr ds:[esi],31
jne oglmdi2_vs7.40A939
inc dword ptr ds:[edx+4]
jmp oglmdi2_vs7.40A94B
push edi
call oglmdi2_vs7.4058A0
inc eax
push eax
push edi
push esi
call oglmdi2_vs7.405C70
add esp,10
pop edi
pop esi
pop ebx
pop ebp
ret 
push ebp
mov ebp,esp
push ecx
mov edx,dword ptr ss:[ebp+C]
xor eax,eax
mov ax,word ptr ds:[edx+6]
push ebx
push esi
push edi
mov edi,7FF
mov esi,80000000
mov dword ptr ss:[ebp-4],esi
mov ecx,eax
shr ecx,4
and eax,8000
and ecx,edi
mov dword ptr ss:[ebp+C],eax
mov eax,dword ptr ds:[edx+4]
mov edx,dword ptr ds:[edx]
movzx ebx,cx
and eax,FFFFF
test ebx,ebx
je oglmdi2_vs7.40A9A0
cmp ebx,edi
je oglmdi2_vs7.40A999
lea edi,dword ptr ds:[ecx+3C00]
jmp oglmdi2_vs7.40A9C1
mov edi,7FFF
jmp oglmdi2_vs7.40A9C1
xor ebx,ebx
cmp eax,ebx
jne oglmdi2_vs7.40A9B8
cmp edx,ebx
jne oglmdi2_vs7.40A9B8
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ds:[eax+4],ebx
mov dword ptr ds:[eax],ebx
mov word ptr ds:[eax+8],bx
jmp oglmdi2_vs7.40AA05
lea edi,dword ptr ds:[ecx+3C01]
mov dword ptr ss:[ebp-4],ebx
mov ecx,edx
shr ecx,15
shl eax,B
or ecx,eax
or ecx,dword ptr ss:[ebp-4]
mov eax,dword ptr ss:[ebp+8]
shl edx,B
test esi,ecx
mov dword ptr ds:[eax+4],ecx
mov dword ptr ds:[eax],edx
jne oglmdi2_vs7.40A9FC
mov ecx,dword ptr ds:[eax]
mov edx,dword ptr ds:[eax+4]
mov ebx,ecx
shl edx,1
shr ebx,1F
or edx,ebx
add ecx,ecx
add edi,FFFF
test esi,edx
mov dword ptr ds:[eax+4],edx
mov dword ptr ds:[eax],ecx
je oglmdi2_vs7.40A9DD
mov ecx,dword ptr ss:[ebp+C]
or ecx,edi
mov word ptr ds:[eax+8],cx
pop edi
pop esi
pop ebx
leave 
ret 
push ebp
mov ebp,esp
sub esp,10
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push esi
mov dword ptr ss:[ebp-4],eax
push edi
lea eax,dword ptr ss:[ebp+8]
push eax
lea eax,dword ptr ss:[ebp-10]
push eax
call oglmdi2_vs7.40A950
pop ecx
pop ecx
push oglmdi2_vs7.412428
push 0
push 11
sub esp,C
lea esi,dword ptr ss:[ebp-10]
mov edi,esp
movsd dword ptr es:[edi],dword ptr ds:[esi]
movsd dword ptr es:[edi],dword ptr ds:[esi]
movsw word ptr es:[edi],word ptr ds:[esi]
call oglmdi2_vs7.40C593
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
mov dword ptr ds:[41244C],eax
movsx eax,byte ptr ds:[41242A]
mov dword ptr ds:[412444],eax
movsx eax,word ptr ds:[412428]
mov dword ptr ds:[412448],eax
add esp,18
mov dword ptr ds:[412450],oglmdi2_vs7.41242C
mov eax,oglmdi2_vs7.412444
call oglmdi2_vs7.404CCC
pop edi
pop esi
leave 
ret 
push 2
call oglmdi2_vs7.405696
pop ecx
ret 
xor eax,eax
test bl,1
je oglmdi2_vs7.40AA97
push 10
pop eax
test bl,4
je oglmdi2_vs7.40AA9F
or eax,8
test bl,8
je oglmdi2_vs7.40AAA7
or eax,4
test bl,10
je oglmdi2_vs7.40AAAF
or eax,2
test bl,20
je oglmdi2_vs7.40AAB7
or eax,1
test bl,2
je oglmdi2_vs7.40AAC1
or eax,80000
push ebp
movzx edx,bx
push esi
mov ecx,edx
mov esi,C00
and ecx,esi
push edi
mov edi,300
mov ebp,200
je oglmdi2_vs7.40AAFD
cmp ecx,400
je oglmdi2_vs7.40AAF8
cmp ecx,800
je oglmdi2_vs7.40AAF4
cmp ecx,esi
jne oglmdi2_vs7.40AAFD
or eax,edi
jmp oglmdi2_vs7.40AAFD
or eax,ebp
jmp oglmdi2_vs7.40AAFD
or eax,100
and edx,edi
je oglmdi2_vs7.40AB0C
cmp edx,ebp
jne oglmdi2_vs7.40AB11
or eax,10000
jmp oglmdi2_vs7.40AB11
or eax,20000
test bh,10
pop edi
pop esi
pop ebp
je oglmdi2_vs7.40AB1E
or eax,40000
ret 
xor eax,eax
test bl,10
je oglmdi2_vs7.40AB27
inc eax
test bl,8
je oglmdi2_vs7.40AB2F
or eax,4
test bl,4
je oglmdi2_vs7.40AB37
or eax,8
test bl,2
je oglmdi2_vs7.40AB3F
or eax,10
test bl,1
je oglmdi2_vs7.40AB47
or eax,20
test ebx,80000
je oglmdi2_vs7.40AB52
or eax,2
mov ecx,ebx
mov edx,300
and ecx,edx
push esi
mov esi,200
je oglmdi2_vs7.40AB86
cmp ecx,100
je oglmdi2_vs7.40AB81
cmp ecx,esi
je oglmdi2_vs7.40AB7A
cmp ecx,edx
jne oglmdi2_vs7.40AB86
or eax,C00
jmp oglmdi2_vs7.40AB86
or eax,800
jmp oglmdi2_vs7.40AB86
or eax,400
mov ecx,ebx
and ecx,30000
je oglmdi2_vs7.40AB9C
cmp ecx,10000
jne oglmdi2_vs7.40AB9E
or eax,esi
jmp oglmdi2_vs7.40AB9E
or eax,edx
test ebx,40000
pop esi
je oglmdi2_vs7.40ABAC
or eax,1000
ret 
push ebp
mov ebp,esp
push ecx
push ebx
wait 
fnstcw word ptr ss:[ebp-4]
mov ebx,dword ptr ss:[ebp-4]
call oglmdi2_vs7.40AA8D
mov ebx,eax
mov eax,dword ptr ss:[ebp+C]
not eax
and ebx,eax
mov eax,dword ptr ss:[ebp+8]
and eax,dword ptr ss:[ebp+C]
or ebx,eax
call oglmdi2_vs7.40AB1F
mov dword ptr ss:[ebp+C],eax
fldcw word ptr ss:[ebp+C]
mov eax,ebx
pop ebx
leave 
ret 
mov eax,dword ptr ss:[esp+8]
and eax,FFF7FFFF
push eax
push dword ptr ss:[esp+8]
call oglmdi2_vs7.40ABAD
pop ecx
pop ecx
ret 
mov eax,dword ptr ss:[esp+4]
cmp eax,dword ptr ds:[412780]
push ebx
push esi
push edi
jae oglmdi2_vs7.40AC69
mov ecx,eax
sar ecx,5
mov esi,eax
and esi,1F
lea edi,dword ptr ds:[ecx*4+4127A0]
mov ecx,dword ptr ds:[edi]
shl esi,3
test byte ptr ds:[ecx+esi+4],1
je oglmdi2_vs7.40AC69
push eax
call oglmdi2_vs7.40565A
cmp eax,FFFFFFFF
pop ecx
je oglmdi2_vs7.40AC70
push dword ptr ss:[esp+18]
push 0
push dword ptr ss:[esp+1C]
push eax
call dword ptr ds:[<&SetFilePointer>]
mov ebx,eax
cmp ebx,FFFFFFFF
jne oglmdi2_vs7.40AC4D
call dword ptr ds:[<&GetLastError>]
jmp oglmdi2_vs7.40AC4F
xor eax,eax
test eax,eax
je oglmdi2_vs7.40AC5C
push eax
call oglmdi2_vs7.409143
pop ecx
jmp oglmdi2_vs7.40AC7A
mov eax,dword ptr ds:[edi]
lea eax,dword ptr ds:[eax+esi+4]
and byte ptr ds:[eax],FD
mov eax,ebx
jmp oglmdi2_vs7.40AC7D
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
pop edi
pop esi
pop ebx
ret 
push ebp
mov ebp,esp
sub esp,41C
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
mov ecx,dword ptr ss:[ebp+8]
cmp ecx,dword ptr ds:[412780]
push ebx
push esi
mov dword ptr ss:[ebp-4],eax
push edi
jae oglmdi2_vs7.40AE11
mov eax,ecx
sar eax,5
lea ebx,dword ptr ds:[eax*4+4127A0]
mov eax,dword ptr ds:[ebx]
mov esi,ecx
and esi,1F
shl esi,3
mov al,byte ptr ds:[eax+esi+4]
test al,1
mov dword ptr ss:[ebp-18],ebx
je oglmdi2_vs7.40AE11
xor edi,edi
cmp dword ptr ss:[ebp+10],edi
mov dword ptr ss:[ebp-C],edi
mov dword ptr ss:[ebp-14],edi
jne oglmdi2_vs7.40ACE0
xor eax,eax
jmp oglmdi2_vs7.40AE25
test al,20
je oglmdi2_vs7.40ACF1
push 2
push edi
push edi
push ecx
call oglmdi2_vs7.40C827
add esp,10
mov eax,dword ptr ds:[ebx]
add eax,esi
test byte ptr ds:[eax+4],80
je oglmdi2_vs7.40ADAD
cmp dword ptr ss:[ebp+10],edi
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-8],eax
mov dword ptr ss:[ebp+8],edi
jbe oglmdi2_vs7.40ADE5
mov ecx,dword ptr ss:[ebp-8]
sub ecx,dword ptr ss:[ebp+C]
lea eax,dword ptr ss:[ebp-41C]
cmp ecx,dword ptr ss:[ebp+10]
jae oglmdi2_vs7.40AD47
mov edx,dword ptr ss:[ebp-8]
inc dword ptr ss:[ebp-8]
mov dl,byte ptr ds:[edx]
inc ecx
cmp dl,A
jne oglmdi2_vs7.40AD38
inc dword ptr ss:[ebp-14]
mov byte ptr ds:[eax],D
inc eax
inc edi
mov ebx,dword ptr ss:[ebp-18]
mov byte ptr ds:[eax],dl
inc eax
inc edi
cmp edi,400
jl oglmdi2_vs7.40AD1D
mov edi,eax
lea eax,dword ptr ss:[ebp-41C]
sub edi,eax
push 0
lea eax,dword ptr ss:[ebp-10]
push eax
push edi
lea eax,dword ptr ss:[ebp-41C]
push eax
mov eax,dword ptr ds:[ebx]
push dword ptr ds:[eax+esi]
call dword ptr ds:[<&WriteFile>]
test eax,eax
je oglmdi2_vs7.40AD87
mov eax,dword ptr ss:[ebp-10]
add dword ptr ss:[ebp-C],eax
cmp eax,edi
jl oglmdi2_vs7.40AD90
mov eax,dword ptr ss:[ebp-8]
sub eax,dword ptr ss:[ebp+C]
xor edi,edi
cmp eax,dword ptr ss:[ebp+10]
jb oglmdi2_vs7.40AD11
jmp oglmdi2_vs7.40AD92
call dword ptr ds:[<&GetLastError>]
mov dword ptr ss:[ebp+8],eax
xor edi,edi
mov eax,dword ptr ss:[ebp-C]
cmp eax,edi
jne oglmdi2_vs7.40AE0C
cmp dword ptr ss:[ebp+8],edi
je oglmdi2_vs7.40ADE5
push 5
pop eax
cmp dword ptr ss:[ebp+8],eax
jne oglmdi2_vs7.40ADDA
mov dword ptr ds:[41222C],eax
jmp oglmdi2_vs7.40AE18
push edi
lea ecx,dword ptr ss:[ebp-10]
push ecx
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push dword ptr ds:[eax]
call dword ptr ds:[<&WriteFile>]
test eax,eax
je oglmdi2_vs7.40ADCF
mov eax,dword ptr ss:[ebp-10]
mov dword ptr ss:[ebp+8],edi
mov dword ptr ss:[ebp-C],eax
jmp oglmdi2_vs7.40AD92
call dword ptr ds:[<&GetLastError>]
mov dword ptr ss:[ebp+8],eax
jmp oglmdi2_vs7.40AD92
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.409143
pop ecx
jmp oglmdi2_vs7.40AE22
mov eax,dword ptr ds:[ebx]
test byte ptr ds:[eax+esi+4],40
je oglmdi2_vs7.40ADFA
mov eax,dword ptr ss:[ebp+C]
cmp byte ptr ds:[eax],1A
je oglmdi2_vs7.40ACD9
mov dword ptr ds:[412228],1C
mov dword ptr ds:[41222C],edi
jmp oglmdi2_vs7.40AE22
sub eax,dword ptr ss:[ebp-14]
jmp oglmdi2_vs7.40AE25
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
pop edi
pop esi
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
inc dword ptr ds:[4121DC]
push 1000
call oglmdi2_vs7.4052DA
test eax,eax
pop ecx
mov ecx,dword ptr ss:[esp+4]
mov dword ptr ds:[ecx+8],eax
je oglmdi2_vs7.40AE5E
or dword ptr ds:[ecx+C],8
mov dword ptr ds:[ecx+18],1000
jmp oglmdi2_vs7.40AE6F
or dword ptr ds:[ecx+C],4
lea eax,dword ptr ds:[ecx+14]
mov dword ptr ds:[ecx+8],eax
mov dword ptr ds:[ecx+18],2
mov eax,dword ptr ds:[ecx+8]
and dword ptr ds:[ecx+4],0
mov dword ptr ds:[ecx],eax
ret 
mov eax,dword ptr ss:[esp+4]
cmp eax,dword ptr ds:[412780]
jb oglmdi2_vs7.40AE88
xor eax,eax
ret 
mov ecx,eax
sar ecx,5
mov ecx,dword ptr ds:[ecx*4+4127A0]
and eax,1F
movsx eax,byte ptr ds:[ecx+eax*8+4]
and eax,40
ret 
push ebp
mov ebp,esp
mov eax,dword ptr ss:[ebp+8]
push esi
xor esi,esi
cmp eax,esi
jne oglmdi2_vs7.40AEB1
xor eax,eax
jmp oglmdi2_vs7.40AF03
cmp dword ptr ds:[4123D4],esi
jne oglmdi2_vs7.40AECB
mov cx,word ptr ss:[ebp+C]
cmp cx,FF
ja oglmdi2_vs7.40AEF6
mov byte ptr ds:[eax],cl
xor eax,eax
inc eax
jmp oglmdi2_vs7.40AF03
lea ecx,dword ptr ss:[ebp+8]
push ecx
push esi
push dword ptr ds:[411820]
mov dword ptr ss:[ebp+8],esi
push eax
push 1
lea eax,dword ptr ss:[ebp+C]
push eax
push esi
push dword ptr ds:[4123E4]
call dword ptr ds:[<&WideCharToMultiByte>]
cmp eax,esi
je oglmdi2_vs7.40AEF6
cmp dword ptr ss:[ebp+8],esi
je oglmdi2_vs7.40AF03
mov dword ptr ds:[412228],2A
or eax,FFFFFFFF
pop esi
pop ebp
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push esi
mov eax,dword ptr ss:[esp+14]
or eax,eax
jne oglmdi2_vs7.40AF41
mov ecx,dword ptr ss:[esp+10]
mov eax,dword ptr ss:[esp+C]
xor edx,edx
div ecx
mov ebx,eax
mov eax,dword ptr ss:[esp+8]
div ecx
mov esi,eax
mov eax,ebx
mul dword ptr ss:[esp+10]
mov ecx,eax
mov eax,esi
mul dword ptr ss:[esp+10]
add edx,ecx
jmp oglmdi2_vs7.40AF88
mov ecx,eax
mov ebx,dword ptr ss:[esp+10]
mov edx,dword ptr ss:[esp+C]
mov eax,dword ptr ss:[esp+8]
shr ecx,1
rcr ebx,1
shr edx,1
rcr eax,1
or ecx,ecx
jne oglmdi2_vs7.40AF4F
div ebx
mov esi,eax
mul dword ptr ss:[esp+14]
mov ecx,eax
mov eax,dword ptr ss:[esp+10]
mul esi
add edx,ecx
jb oglmdi2_vs7.40AF7D
cmp edx,dword ptr ss:[esp+C]
ja oglmdi2_vs7.40AF7D
jb oglmdi2_vs7.40AF86
cmp eax,dword ptr ss:[esp+8]
jbe oglmdi2_vs7.40AF86
dec esi
sub eax,dword ptr ss:[esp+10]
sbb edx,dword ptr ss:[esp+14]
xor ebx,ebx
sub eax,dword ptr ss:[esp+8]
sbb edx,dword ptr ss:[esp+C]
neg edx
neg eax
sbb edx,0
mov ecx,edx
mov edx,ebx
mov ebx,ecx
mov ecx,eax
mov eax,esi
pop esi
ret 10
push ebp
mov ebp,esp
sub esp,10
push ebx
xor ebx,ebx
cmp dword ptr ds:[412454],ebx
push esi
push edi
jne oglmdi2_vs7.40B025
push oglmdi2_vs7.40F210
call dword ptr ds:[<&LoadLibraryA>]
mov edi,eax
cmp edi,ebx
je oglmdi2_vs7.40B060
mov esi,dword ptr ds:[<&GetProcAddress>]
push oglmdi2_vs7.40F204
push edi
call esi
test eax,eax
mov dword ptr ds:[412454],eax
je oglmdi2_vs7.40B060
push oglmdi2_vs7.40F1F4
push edi
call esi
push oglmdi2_vs7.40F1E0
push edi
mov dword ptr ds:[412458],eax
call esi
cmp dword ptr ds:[412234],2
mov dword ptr ds:[41245C],eax
jne oglmdi2_vs7.40B025
push oglmdi2_vs7.40F1C4
push edi
call esi
test eax,eax
mov dword ptr ds:[412464],eax
je oglmdi2_vs7.40B025
push oglmdi2_vs7.40F1AC
push edi
call esi
mov dword ptr ds:[412460],eax
mov eax,dword ptr ds:[412460]
test eax,eax
je oglmdi2_vs7.40B06A
call eax
test eax,eax
je oglmdi2_vs7.40B051
lea ecx,dword ptr ss:[ebp-4]
push ecx
push C
lea ecx,dword ptr ss:[ebp-10]
push ecx
push 1
push eax
call dword ptr ds:[412464]
test eax,eax
je oglmdi2_vs7.40B051
test byte ptr ss:[ebp-8],1
jne oglmdi2_vs7.40B06A
cmp dword ptr ds:[412240],4
jb oglmdi2_vs7.40B064
or byte ptr ss:[ebp+12],20
jmp oglmdi2_vs7.40B089
xor eax,eax
jmp oglmdi2_vs7.40B099
or byte ptr ss:[ebp+12],4
jmp oglmdi2_vs7.40B089
mov eax,dword ptr ds:[412458]
test eax,eax
je oglmdi2_vs7.40B089
call eax
mov ebx,eax
test ebx,ebx
je oglmdi2_vs7.40B089
mov eax,dword ptr ds:[41245C]
test eax,eax
je oglmdi2_vs7.40B089
push ebx
call eax
mov ebx,eax
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
push ebx
call dword ptr ds:[412454]
pop edi
pop esi
pop ebx
leave 
ret 
push esi
push dword ptr ss:[esp+C]
xor esi,esi
push dword ptr ss:[esp+C]
inc esi
call dword ptr ds:[<&IsBadReadPtr>]
test eax,eax
je oglmdi2_vs7.40B0B6
xor esi,esi
mov eax,esi
pop esi
ret 
push esi
push dword ptr ss:[esp+C]
xor esi,esi
push dword ptr ss:[esp+C]
inc esi
call dword ptr ds:[<&IsBadWritePtr>]
test eax,eax
je oglmdi2_vs7.40B0D2
xor esi,esi
mov eax,esi
pop esi
ret 
push esi
push dword ptr ss:[esp+8]
xor esi,esi
inc esi
call dword ptr ds:[<&IsBadCodePtr>]
test eax,eax
je oglmdi2_vs7.40B0EA
xor esi,esi
mov eax,esi
pop esi
ret 
mov eax,dword ptr ss:[esp+4]
cmp eax,dword ptr ds:[412780]
jae oglmdi2_vs7.40B137
mov ecx,eax
sar ecx,5
mov ecx,dword ptr ds:[ecx*4+4127A0]
mov edx,eax
and edx,1F
test byte ptr ds:[ecx+edx*8+4],1
je oglmdi2_vs7.40B137
push eax
call oglmdi2_vs7.40565A
pop ecx
push eax
call dword ptr ds:[<&FlushFileBuffers>]
test eax,eax
jne oglmdi2_vs7.40B12C
call dword ptr ds:[<&GetLastError>]
jmp oglmdi2_vs7.40B12E
xor eax,eax
test eax,eax
je oglmdi2_vs7.40B144
mov dword ptr ds:[41222C],eax
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
ret 
push ebp
mov ebp,esp
sub esp,1C
mov ecx,dword ptr ss:[ebp+C]
push ebx
xor ebx,ebx
test cl,cl
push esi
mov dword ptr ss:[ebp-1C],C
mov dword ptr ss:[ebp-18],ebx
jns oglmdi2_vs7.40B169
mov dword ptr ss:[ebp-14],ebx
mov byte ptr ss:[ebp-1],10
jmp oglmdi2_vs7.40B174
and byte ptr ss:[ebp-1],0
mov dword ptr ss:[ebp-14],1
mov eax,8000
test eax,ecx
jne oglmdi2_vs7.40B18E
test ch,40
jne oglmdi2_vs7.40B18A
cmp dword ptr ds:[41247C],eax
je oglmdi2_vs7.40B18E
or byte ptr ss:[ebp-1],80
push 3
mov eax,ecx
pop esi
and eax,esi
sub eax,ebx
je oglmdi2_vs7.40B1B1
dec eax
je oglmdi2_vs7.40B1A8
dec eax
jne oglmdi2_vs7.40B1CF
mov dword ptr ss:[ebp-10],C0000000
jmp oglmdi2_vs7.40B1B8
mov dword ptr ss:[ebp-10],40000000
jmp oglmdi2_vs7.40B1B8
mov dword ptr ss:[ebp-10],80000000
mov eax,dword ptr ss:[ebp+10]
cmp eax,10
je oglmdi2_vs7.40B1FE
cmp eax,20
je oglmdi2_vs7.40B1F5
cmp eax,30
je oglmdi2_vs7.40B1EC
cmp eax,40
je oglmdi2_vs7.40B1E7
mov dword ptr ds:[412228],16
mov dword ptr ds:[41222C],ebx
or eax,FFFFFFFF
jmp oglmdi2_vs7.40B3C6
mov dword ptr ss:[ebp-8],esi
jmp oglmdi2_vs7.40B201
mov dword ptr ss:[ebp-8],2
jmp oglmdi2_vs7.40B201
mov dword ptr ss:[ebp-8],1
jmp oglmdi2_vs7.40B201
mov dword ptr ss:[ebp-8],ebx
mov eax,ecx
mov edx,700
and eax,edx
mov ecx,400
cmp eax,ecx
push edi
mov edi,100
jg oglmdi2_vs7.40B248
je oglmdi2_vs7.40B243
cmp eax,ebx
je oglmdi2_vs7.40B243
cmp eax,edi
je oglmdi2_vs7.40B23A
cmp eax,200
je oglmdi2_vs7.40B272
cmp eax,300
jne oglmdi2_vs7.40B25A
mov dword ptr ss:[ebp-C],2
jmp oglmdi2_vs7.40B282
mov dword ptr ss:[ebp-C],4
jmp oglmdi2_vs7.40B282
mov dword ptr ss:[ebp-C],esi
jmp oglmdi2_vs7.40B282
cmp eax,500
je oglmdi2_vs7.40B27B
cmp eax,600
je oglmdi2_vs7.40B272
cmp eax,edx
je oglmdi2_vs7.40B27B
mov dword ptr ds:[412228],16
mov dword ptr ds:[41222C],ebx
or eax,FFFFFFFF
jmp oglmdi2_vs7.40B3C5
mov dword ptr ss:[ebp-C],5
jmp oglmdi2_vs7.40B282
mov dword ptr ss:[ebp-C],1
mov eax,dword ptr ss:[ebp+C]
test edi,eax
mov esi,80
je oglmdi2_vs7.40B2A0
mov ecx,dword ptr ds:[412230]
not ecx
and ecx,dword ptr ss:[ebp+14]
test cl,cl
js oglmdi2_vs7.40B2A0
xor esi,esi
inc esi
test al,40
je oglmdi2_vs7.40B2BB
or byte ptr ss:[ebp-E],1
or esi,4000000
cmp dword ptr ds:[412234],2
jne oglmdi2_vs7.40B2BB
or dword ptr ss:[ebp-8],4
test ah,10
je oglmdi2_vs7.40B2C2
or esi,edi
test al,20
je oglmdi2_vs7.40B2CE
or esi,8000000
jmp oglmdi2_vs7.40B2D8
test al,10
je oglmdi2_vs7.40B2D8
or esi,10000000
call oglmdi2_vs7.4054CC
mov ebx,eax
or edi,FFFFFFFF
cmp ebx,edi
jne oglmdi2_vs7.40B2FE
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],18
mov eax,edi
jmp oglmdi2_vs7.40B3C5
push 0
push esi
push dword ptr ss:[ebp-C]
lea eax,dword ptr ss:[ebp-1C]
push eax
push dword ptr ss:[ebp-8]
push dword ptr ss:[ebp-10]
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&CreateFileA>]
mov esi,eax
cmp esi,edi
je oglmdi2_vs7.40B32F
push esi
call dword ptr ds:[<&GetFileType>]
test eax,eax
jne oglmdi2_vs7.40B33E
push esi
call dword ptr ds:[<&CloseHandle>]
call dword ptr ds:[<&GetLastError>]
push eax
call oglmdi2_vs7.409143
pop ecx
jmp oglmdi2_vs7.40B2F7
cmp eax,2
jne oglmdi2_vs7.40B349
or byte ptr ss:[ebp-1],40
jmp oglmdi2_vs7.40B352
cmp eax,3
jne oglmdi2_vs7.40B352
or byte ptr ss:[ebp-1],8
push esi
push ebx
call oglmdi2_vs7.405569
mov al,byte ptr ss:[ebp-1]
pop ecx
pop ecx
mov ecx,ebx
sar ecx,5
or al,1
mov esi,ebx
and esi,1F
lea edi,dword ptr ds:[ecx*4+4127A0]
mov ecx,dword ptr ds:[edi]
shl esi,3
mov byte ptr ss:[ebp-1],al
and byte ptr ss:[ebp-1],48
mov byte ptr ds:[ecx+esi+4],al
jne oglmdi2_vs7.40B3AE
test al,al
jns oglmdi2_vs7.40B3AE
test byte ptr ss:[ebp+C],2
je oglmdi2_vs7.40B3AE
push 2
push FFFFFFFF
push ebx
call oglmdi2_vs7.40ABF5
add esp,C
cmp eax,FFFFFFFF
mov dword ptr ss:[ebp-10],eax
jne oglmdi2_vs7.40B3CA
cmp dword ptr ds:[41222C],83
jne oglmdi2_vs7.40B409
cmp byte ptr ss:[ebp-1],0
jne oglmdi2_vs7.40B3C3
test byte ptr ss:[ebp+C],8
je oglmdi2_vs7.40B3C3
mov eax,dword ptr ds:[edi]
lea eax,dword ptr ds:[eax+esi+4]
or byte ptr ds:[eax],20
mov eax,ebx
pop edi
pop esi
pop ebx
leave 
ret 
and byte ptr ss:[ebp-2],0
push 1
lea eax,dword ptr ss:[ebp-2]
push eax
push ebx
call oglmdi2_vs7.408974
add esp,C
test eax,eax
jne oglmdi2_vs7.40B3F7
cmp byte ptr ss:[ebp-2],1A
jne oglmdi2_vs7.40B3F7
push dword ptr ss:[ebp-10]
push ebx
call oglmdi2_vs7.40C8C6
cmp eax,FFFFFFFF
pop ecx
pop ecx
je oglmdi2_vs7.40B409
push 0
push 0
push ebx
call oglmdi2_vs7.40ABF5
add esp,C
cmp eax,FFFFFFFF
jne oglmdi2_vs7.40B3AE
push ebx
call oglmdi2_vs7.4086AA
pop ecx
jmp oglmdi2_vs7.40B26A
movzx eax,byte ptr ss:[esp+4]
mov cl,byte ptr ss:[esp+C]
test byte ptr ds:[eax+412561],cl
jne oglmdi2_vs7.40B442
cmp dword ptr ss:[esp+8],0
je oglmdi2_vs7.40B43B
movzx eax,word ptr ds:[eax*2+40EDA2]
and eax,dword ptr ss:[esp+8]
jmp oglmdi2_vs7.40B43D
xor eax,eax
test eax,eax
jne oglmdi2_vs7.40B442
ret 
xor eax,eax
inc eax
ret 
push 4
push 0
push dword ptr ss:[esp+C]
call oglmdi2_vs7.40B415
add esp,C
ret 
sub eax,3A4
je oglmdi2_vs7.40B480
sub eax,4
je oglmdi2_vs7.40B47A
sub eax,D
je oglmdi2_vs7.40B474
dec eax
je oglmdi2_vs7.40B46E
xor eax,eax
ret 
mov eax,404
ret 
mov eax,412
ret 
mov eax,804
ret 
mov eax,411
ret 
push edi
push 40
xor eax,eax
pop ecx
mov edi,oglmdi2_vs7.412560
rep stosd dword ptr es:[edi],eax
stosb byte ptr es:[edi],al
xor eax,eax
mov dword ptr ds:[412664],eax
mov dword ptr ds:[412548],eax
mov dword ptr ds:[412544],eax
mov edi,oglmdi2_vs7.412670
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
pop edi
ret 
push ebp
mov ebp,esp
sub esp,518
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push esi
mov dword ptr ss:[ebp-4],eax
lea eax,dword ptr ss:[ebp-18]
push eax
push dword ptr ds:[412664]
call dword ptr ds:[<&GetCPInfo>]
cmp eax,1
mov esi,100
jne oglmdi2_vs7.40B5EF
xor eax,eax
mov byte ptr ss:[ebp+eax-118],al
inc eax
cmp eax,esi
jb oglmdi2_vs7.40B4E4
mov al,byte ptr ss:[ebp-12]
test al,al
mov byte ptr ss:[ebp-118],20
je oglmdi2_vs7.40B534
push ebx
lea edx,dword ptr ss:[ebp-11]
push edi
movzx ecx,byte ptr ds:[edx]
movzx eax,al
cmp eax,ecx
ja oglmdi2_vs7.40B52A
sub ecx,eax
inc ecx
mov ebx,ecx
shr ecx,2
lea edi,dword ptr ss:[ebp+eax-118]
mov eax,20202020
rep stosd dword ptr es:[edi],eax
mov ecx,ebx
and ecx,3
rep stosb byte ptr es:[edi],al
inc edx
mov al,byte ptr ds:[edx]
inc edx
test al,al
jne oglmdi2_vs7.40B503
pop edi
pop ebx
push 0
push dword ptr ds:[412544]
lea eax,dword ptr ss:[ebp-518]
push dword ptr ds:[412664]
push eax
push esi
lea eax,dword ptr ss:[ebp-118]
push eax
push 1
call oglmdi2_vs7.409DC0
push 0
push dword ptr ds:[412664]
lea eax,dword ptr ss:[ebp-218]
push esi
push eax
push esi
lea eax,dword ptr ss:[ebp-118]
push eax
push esi
push dword ptr ds:[412544]
call oglmdi2_vs7.40BB8C
push 0
push dword ptr ds:[412664]
lea eax,dword ptr ss:[ebp-318]
push esi
push eax
push esi
lea eax,dword ptr ss:[ebp-118]
push eax
push 200
push dword ptr ds:[412544]
call oglmdi2_vs7.40BB8C
add esp,5C
xor eax,eax
mov cx,word ptr ss:[ebp+eax*2-518]
test cl,1
je oglmdi2_vs7.40B5CC
or byte ptr ds:[eax+412561],10
mov cl,byte ptr ss:[ebp+eax-218]
mov byte ptr ds:[eax+412680],cl
jmp oglmdi2_vs7.40B5E8
test cl,2
je oglmdi2_vs7.40B5E1
or byte ptr ds:[eax+412561],20
mov cl,byte ptr ss:[ebp+eax-318]
jmp oglmdi2_vs7.40B5C4
and byte ptr ds:[eax+412680],0
inc eax
cmp eax,esi
jb oglmdi2_vs7.40B5A9
jmp oglmdi2_vs7.40B633
xor eax,eax
cmp eax,41
jb oglmdi2_vs7.40B60F
cmp eax,5A
ja oglmdi2_vs7.40B60F
or byte ptr ds:[eax+412561],10
mov cl,al
add cl,20
mov byte ptr ds:[eax+412680],cl
jmp oglmdi2_vs7.40B62E
cmp eax,61
jb oglmdi2_vs7.40B627
cmp eax,7A
ja oglmdi2_vs7.40B627
or byte ptr ds:[eax+412561],20
mov cl,al
sub cl,20
jmp oglmdi2_vs7.40B607
and byte ptr ds:[eax+412680],0
inc eax
cmp eax,esi
jb oglmdi2_vs7.40B5F1
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
pop esi
call oglmdi2_vs7.404CCC
leave 
ret 
push ebp
mov ebp,esp
sub esp,1C
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push ebx
push esi
mov esi,dword ptr ss:[ebp+8]
xor ebx,ebx
cmp esi,FFFFFFFE
mov dword ptr ss:[ebp-4],eax
push edi
mov dword ptr ds:[412468],ebx
jne oglmdi2_vs7.40B677
mov dword ptr ds:[412468],1
call dword ptr ds:[<&GetOEMCP>]
jmp oglmdi2_vs7.40B6A2
cmp esi,FFFFFFFD
jne oglmdi2_vs7.40B68E
mov dword ptr ds:[412468],1
call dword ptr ds:[<&GetACP>]
jmp oglmdi2_vs7.40B6A2
cmp esi,FFFFFFFC
jne oglmdi2_vs7.40B6A7
mov eax,dword ptr ds:[4123E4]
mov dword ptr ds:[412468],1
mov dword ptr ss:[ebp+8],eax
mov esi,eax
cmp esi,dword ptr ds:[412664]
je oglmdi2_vs7.40B816
cmp esi,ebx
je oglmdi2_vs7.40B80C
xor edx,edx
xor eax,eax
cmp dword ptr ds:[eax+411878],esi
je oglmdi2_vs7.40B72E
add eax,30
inc edx
cmp eax,F0
jb oglmdi2_vs7.40B6BF
lea eax,dword ptr ss:[ebp-1C]
push eax
push esi
call dword ptr ds:[<&GetCPInfo>]
cmp eax,1
jne oglmdi2_vs7.40B804
push 40
xor eax,eax
pop ecx
mov edi,oglmdi2_vs7.412560
rep stosd dword ptr es:[edi],eax
stosb byte ptr es:[edi],al
xor edi,edi
inc edi
cmp dword ptr ss:[ebp-1C],edi
mov dword ptr ds:[412664],esi
mov dword ptr ds:[412544],ebx
jbe oglmdi2_vs7.40B7F2
cmp byte ptr ss:[ebp-16],0
je oglmdi2_vs7.40B7CD
lea ecx,dword ptr ss:[ebp-15]
mov dl,byte ptr ds:[ecx]
test dl,dl
je oglmdi2_vs7.40B7CD
movzx eax,byte ptr ds:[ecx-1]
movzx edx,dl
jmp oglmdi2_vs7.40B7BD
push 40
xor eax,eax
pop ecx
mov edi,oglmdi2_vs7.412560
rep stosd dword ptr es:[edi],eax
lea ecx,dword ptr ds:[edx+edx*2]
shl ecx,4
mov dword ptr ss:[ebp-8],ebx
stosb byte ptr es:[edi],al
lea ebx,dword ptr ds:[ecx+411888]
mov al,byte ptr ds:[ebx]
mov esi,ebx
jmp oglmdi2_vs7.40B779
mov dl,byte ptr ds:[esi+1]
test dl,dl
je oglmdi2_vs7.40B77D
movzx eax,al
movzx edi,dl
cmp eax,edi
ja oglmdi2_vs7.40B775
mov edx,dword ptr ss:[ebp-8]
mov dl,byte ptr ds:[edx+411870]
or byte ptr ds:[eax+412561],dl
inc eax
cmp eax,edi
jbe oglmdi2_vs7.40B76A
inc esi
inc esi
mov al,byte ptr ds:[esi]
test al,al
jne oglmdi2_vs7.40B750
inc dword ptr ss:[ebp-8]
add ebx,8
cmp dword ptr ss:[ebp-8],4
jb oglmdi2_vs7.40B74A
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ds:[412664],eax
mov dword ptr ds:[412548],1
call oglmdi2_vs7.40B457
lea esi,dword ptr ds:[ecx+41187C]
mov edi,oglmdi2_vs7.412670
movsd dword ptr es:[edi],dword ptr ds:[esi]
movsd dword ptr es:[edi],dword ptr ds:[esi]
mov dword ptr ds:[412544],eax
movsd dword ptr es:[edi],dword ptr ds:[esi]
jmp oglmdi2_vs7.40B811
or byte ptr ds:[eax+412561],4
inc eax
cmp eax,edx
jbe oglmdi2_vs7.40B7B5
inc ecx
inc ecx
cmp byte ptr ds:[ecx-1],0
jne oglmdi2_vs7.40B718
mov eax,edi
or byte ptr ds:[eax+412561],8
inc eax
cmp eax,FF
jb oglmdi2_vs7.40B7CF
mov eax,esi
call oglmdi2_vs7.40B457
mov dword ptr ds:[412544],eax
mov dword ptr ds:[412548],edi
jmp oglmdi2_vs7.40B7F8
mov dword ptr ds:[412548],ebx
xor eax,eax
mov edi,oglmdi2_vs7.412670
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
stosd dword ptr es:[edi],eax
jmp oglmdi2_vs7.40B811
cmp dword ptr ds:[412468],ebx
je oglmdi2_vs7.40B81A
call oglmdi2_vs7.40B486
call oglmdi2_vs7.40B4AF
xor eax,eax
jmp oglmdi2_vs7.40B81D
or eax,FFFFFFFF
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
pop edi
pop esi
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
cmp dword ptr ds:[4128AC],0
jne oglmdi2_vs7.40B848
push FFFFFFFD
call oglmdi2_vs7.40B641
pop ecx
mov dword ptr ds:[4128AC],1
xor eax,eax
ret 
push esi
mov esi,dword ptr ss:[esp+8]
jmp oglmdi2_vs7.40B853
inc esi
movzx eax,byte ptr ds:[esi]
push eax
call oglmdi2_vs7.40CA7E
test eax,eax
pop ecx
jne oglmdi2_vs7.40B852
movzx ecx,byte ptr ds:[esi]
inc esi
cmp ecx,2D
mov edx,ecx
je oglmdi2_vs7.40B871
cmp ecx,2B
jne oglmdi2_vs7.40B875
movzx ecx,byte ptr ds:[esi]
inc esi
xor eax,eax
cmp ecx,30
jl oglmdi2_vs7.40B886
cmp ecx,39
jg oglmdi2_vs7.40B886
sub ecx,30
jmp oglmdi2_vs7.40B889
or ecx,FFFFFFFF
cmp ecx,FFFFFFFF
je oglmdi2_vs7.40B89A
lea eax,dword ptr ds:[eax+eax*4]
lea eax,dword ptr ds:[ecx+eax*2]
movzx ecx,byte ptr ds:[esi]
inc esi
jmp oglmdi2_vs7.40B877
cmp edx,2D
pop esi
jne oglmdi2_vs7.40B8A2
neg eax
ret 
push ebp
mov ebp,esp
sub esp,C
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
and byte ptr ss:[ebp-6],0
push 6
mov dword ptr ss:[ebp-4],eax
lea eax,dword ptr ss:[ebp-C]
push eax
push 1004
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&GetLocaleInfoA>]
test eax,eax
jne oglmdi2_vs7.40B8D5
or eax,FFFFFFFF
jmp oglmdi2_vs7.40B8DF
lea eax,dword ptr ss:[ebp-C]
push eax
call oglmdi2_vs7.40B84B
pop ecx
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
call oglmdi2_vs7.404CCC
leave 
ret 
push 38
push oglmdi2_vs7.40F348
call oglmdi2_vs7.406308
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
mov dword ptr ss:[ebp-1C],eax
xor edi,edi
mov dword ptr ss:[ebp-20],edi
mov dword ptr ss:[ebp-24],edi
mov eax,dword ptr ss:[ebp+14]
mov ebx,dword ptr ds:[eax]
mov dword ptr ss:[ebp-28],ebx
mov dword ptr ss:[ebp-2C],edi
mov eax,dword ptr ss:[ebp+8]
cmp eax,dword ptr ss:[ebp+C]
je oglmdi2_vs7.40BA95
lea ecx,dword ptr ss:[ebp-40]
push ecx
push eax
mov esi,dword ptr ds:[<&GetCPInfo>]
call esi
test eax,eax
je oglmdi2_vs7.40B953
cmp dword ptr ss:[ebp-40],1
jne oglmdi2_vs7.40B953
lea eax,dword ptr ss:[ebp-40]
push eax
push dword ptr ss:[ebp+C]
call esi
test eax,eax
je oglmdi2_vs7.40B953
cmp dword ptr ss:[ebp-40],1
jne oglmdi2_vs7.40B953
mov dword ptr ss:[ebp-2C],1
cmp dword ptr ss:[ebp-2C],edi
je oglmdi2_vs7.40B972
cmp ebx,FFFFFFFF
je oglmdi2_vs7.40B961
mov esi,ebx
jmp oglmdi2_vs7.40B96D
push dword ptr ss:[ebp+10]
call oglmdi2_vs7.4058A0
pop ecx
mov esi,eax
inc esi
mov dword ptr ss:[ebp-44],esi
jmp oglmdi2_vs7.40B975
mov esi,dword ptr ss:[ebp-44]
cmp dword ptr ss:[ebp-2C],edi
jne oglmdi2_vs7.40B994
push edi
push edi
push ebx
push dword ptr ss:[ebp+10]
push 1
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&MultiByteToWideChar>]
mov esi,eax
mov dword ptr ss:[ebp-44],esi
cmp esi,edi
je oglmdi2_vs7.40B9EC
mov dword ptr ss:[ebp-4],edi
lea eax,dword ptr ds:[esi+esi]
add eax,3
and eax,FFFFFFFC
call oglmdi2_vs7.4099B0
mov dword ptr ss:[ebp-18],esp
mov ebx,esp
mov dword ptr ss:[ebp-48],ebx
lea eax,dword ptr ds:[esi+esi]
push eax
push edi
push ebx
call oglmdi2_vs7.409D60
add esp,C
or dword ptr ss:[ebp-4],FFFFFFFF
jmp oglmdi2_vs7.40B9D8
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
call oglmdi2_vs7.40BABB
xor edi,edi
xor ebx,ebx
or dword ptr ss:[ebp-4],FFFFFFFF
mov esi,dword ptr ss:[ebp-44]
cmp ebx,edi
jne oglmdi2_vs7.40B9FA
push esi
push 2
call oglmdi2_vs7.409070
pop ecx
pop ecx
mov ebx,eax
cmp ebx,edi
jne oglmdi2_vs7.40B9F3
xor eax,eax
jmp oglmdi2_vs7.40BAA7
mov dword ptr ss:[ebp-24],1
push esi
push ebx
push dword ptr ss:[ebp-28]
push dword ptr ss:[ebp+10]
push 1
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&MultiByteToWideChar>]
test eax,eax
je oglmdi2_vs7.40BA98
cmp dword ptr ss:[ebp+18],edi
je oglmdi2_vs7.40BA3A
push edi
push edi
push dword ptr ss:[ebp+1C]
push dword ptr ss:[ebp+18]
push esi
push ebx
push edi
push dword ptr ss:[ebp+C]
call dword ptr ds:[<&WideCharToMultiByte>]
test eax,eax
je oglmdi2_vs7.40BA98
mov eax,dword ptr ss:[ebp+18]
mov dword ptr ss:[ebp-20],eax
jmp oglmdi2_vs7.40BA98
cmp dword ptr ss:[ebp-2C],edi
jne oglmdi2_vs7.40BA55
push edi
push edi
push edi
push edi
push esi
push ebx
push edi
push dword ptr ss:[ebp+C]
call dword ptr ds:[<&WideCharToMultiByte>]
mov esi,eax
cmp esi,edi
je oglmdi2_vs7.40BA98
push esi
push 1
call oglmdi2_vs7.409070
pop ecx
pop ecx
mov dword ptr ss:[ebp-20],eax
cmp eax,edi
je oglmdi2_vs7.40BA98
push edi
push edi
push esi
push eax
push esi
push ebx
push edi
push dword ptr ss:[ebp+C]
call dword ptr ds:[<&WideCharToMultiByte>]
cmp eax,edi
jne oglmdi2_vs7.40BA88
push dword ptr ss:[ebp-20]
call oglmdi2_vs7.4051DA
pop ecx
mov dword ptr ss:[ebp-20],edi
jmp oglmdi2_vs7.40BA98
cmp dword ptr ss:[ebp-28],FFFFFFFF
je oglmdi2_vs7.40BA98
mov ecx,dword ptr ss:[ebp+14]
mov dword ptr ds:[ecx],eax
jmp oglmdi2_vs7.40BA98
mov ebx,dword ptr ss:[ebp-48]
cmp dword ptr ss:[ebp-24],edi
je oglmdi2_vs7.40BAA4
push ebx
call oglmdi2_vs7.4051DA
pop ecx
mov eax,dword ptr ss:[ebp-20]
lea esp,dword ptr ss:[ebp-54]
mov ecx,dword ptr ss:[ebp-1C]
xor ecx,dword ptr ss:[ebp+4]
call oglmdi2_vs7.404CCC
call oglmdi2_vs7.406343
ret 
push ebp
mov ebp,esp
sub esp,48
push ebx
push esi
push edi
push 4
pop eax
call oglmdi2_vs7.4099B0
mov ebx,esp
push 1C
lea eax,dword ptr ss:[ebp-24]
push eax
push ebx
call dword ptr ds:[<&VirtualQuery>]
test eax,eax
je oglmdi2_vs7.40BB50
mov edi,dword ptr ss:[ebp-20]
lea eax,dword ptr ss:[ebp-48]
push eax
call dword ptr ds:[<&GetSystemInfo>]
mov eax,dword ptr ss:[ebp-44]
lea esi,dword ptr ds:[eax-1]
not esi
and esi,ebx
sub esi,eax
mov dword ptr ss:[ebp-4],eax
mov eax,dword ptr ds:[412234]
mov ecx,eax
dec ecx
neg ecx
sbb ecx,ecx
and ecx,FFFF1000
add ecx,11000
add ecx,edi
cmp esi,ecx
jb oglmdi2_vs7.40BB50
cmp eax,1
je oglmdi2_vs7.40BB68
mov ebx,edi
mov edi,1000
push 1C
lea eax,dword ptr ss:[ebp-24]
push eax
push ebx
call dword ptr ds:[<&VirtualQuery>]
test eax,eax
je oglmdi2_vs7.40BB50
add ebx,dword ptr ss:[ebp-18]
test dword ptr ss:[ebp-14],edi
je oglmdi2_vs7.40BB25
test byte ptr ss:[ebp-F],1
mov ebx,dword ptr ss:[ebp-24]
je oglmdi2_vs7.40BB4C
xor eax,eax
inc eax
jmp oglmdi2_vs7.40BB84
cmp esi,ebx
jae oglmdi2_vs7.40BB54
xor eax,eax
jmp oglmdi2_vs7.40BB84
push 4
push edi
push dword ptr ss:[ebp-4]
push ebx
call dword ptr ds:[<&VirtualAlloc>]
mov eax,dword ptr ds:[412234]
jmp oglmdi2_vs7.40BB6A
mov ebx,esi
dec eax
neg eax
sbb eax,eax
and eax,103
lea ecx,dword ptr ss:[ebp-8]
push ecx
inc eax
push eax
push dword ptr ss:[ebp-4]
push ebx
call dword ptr ds:[<&VirtualProtect>]
lea esp,dword ptr ss:[ebp-54]
pop edi
pop esi
pop ebx
leave 
ret 
push 38
push oglmdi2_vs7.40F358
call oglmdi2_vs7.406308
xor ebx,ebx
cmp dword ptr ds:[412478],ebx
jne oglmdi2_vs7.40BBDA
push ebx
push ebx
xor esi,esi
inc esi
push esi
push oglmdi2_vs7.40E2B0
push 100
push ebx
call dword ptr ds:[<&LCMapStringW>]
test eax,eax
je oglmdi2_vs7.40BBC5
mov dword ptr ds:[412478],esi
jmp oglmdi2_vs7.40BBDA
call dword ptr ds:[<&GetLastError>]
cmp eax,78
jne oglmdi2_vs7.40BBDA
mov dword ptr ds:[412478],2
cmp dword ptr ss:[ebp+14],ebx
jle oglmdi2_vs7.40BBFA
mov ecx,dword ptr ss:[ebp+14]
mov eax,dword ptr ss:[ebp+10]
dec ecx
cmp byte ptr ds:[eax],bl
je oglmdi2_vs7.40BBF2
inc eax
cmp ecx,ebx
jne oglmdi2_vs7.40BBE5
or ecx,FFFFFFFF
or eax,FFFFFFFF
sub eax,ecx
add dword ptr ss:[ebp+14],eax
mov eax,dword ptr ds:[412478]
cmp eax,2
je oglmdi2_vs7.40BDE4
cmp eax,ebx
je oglmdi2_vs7.40BDE4
cmp eax,1
jne oglmdi2_vs7.40BE17
xor edi,edi
mov dword ptr ss:[ebp-1C],edi
mov dword ptr ss:[ebp-20],ebx
mov dword ptr ss:[ebp-24],ebx
cmp dword ptr ss:[ebp+20],ebx
jne oglmdi2_vs7.40BC31
mov eax,dword ptr ds:[4123E4]
mov dword ptr ss:[ebp+20],eax
push ebx
push ebx
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
xor eax,eax
cmp dword ptr ss:[ebp+24],ebx
setne al
lea eax,dword ptr ds:[eax*8+1]
push eax
push dword ptr ss:[ebp+20]
call dword ptr ds:[<&MultiByteToWideChar>]
mov esi,eax
mov dword ptr ss:[ebp-28],esi
cmp esi,ebx
je oglmdi2_vs7.40BE17
mov dword ptr ss:[ebp-4],1
lea eax,dword ptr ds:[esi+esi]
add eax,3
and eax,FFFFFFFC
call oglmdi2_vs7.4099B0
mov dword ptr ss:[ebp-18],esp
mov eax,esp
mov dword ptr ss:[ebp-2C],eax
or dword ptr ss:[ebp-4],FFFFFFFF
jmp oglmdi2_vs7.40BC9D
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
call oglmdi2_vs7.40BABB
xor ebx,ebx
mov dword ptr ss:[ebp-2C],ebx
or dword ptr ss:[ebp-4],FFFFFFFF
mov edi,dword ptr ss:[ebp-1C]
mov esi,dword ptr ss:[ebp-28]
cmp dword ptr ss:[ebp-2C],ebx
jne oglmdi2_vs7.40BCBE
lea eax,dword ptr ds:[esi+esi]
push eax
call oglmdi2_vs7.4052DA
pop ecx
mov dword ptr ss:[ebp-2C],eax
cmp eax,ebx
je oglmdi2_vs7.40BE17
mov dword ptr ss:[ebp-20],1
push esi
push dword ptr ss:[ebp-2C]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push 1
push dword ptr ss:[ebp+20]
call dword ptr ds:[<&MultiByteToWideChar>]
test eax,eax
je oglmdi2_vs7.40BDC1
push ebx
push ebx
push esi
push dword ptr ss:[ebp-2C]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&LCMapStringW>]
mov edi,eax
mov dword ptr ss:[ebp-1C],edi
cmp edi,ebx
je oglmdi2_vs7.40BDC1
test byte ptr ss:[ebp+D],4
je oglmdi2_vs7.40BD2D
cmp dword ptr ss:[ebp+1C],ebx
je oglmdi2_vs7.40BDC1
cmp edi,dword ptr ss:[ebp+1C]
jg oglmdi2_vs7.40BDC1
push dword ptr ss:[ebp+1C]
push dword ptr ss:[ebp+18]
push esi
push dword ptr ss:[ebp-2C]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&LCMapStringW>]
jmp oglmdi2_vs7.40BDC1
mov dword ptr ss:[ebp-4],2
lea eax,dword ptr ds:[edi+edi]
add eax,3
and eax,FFFFFFFC
call oglmdi2_vs7.4099B0
mov dword ptr ss:[ebp-18],esp
mov eax,esp
mov dword ptr ss:[ebp-30],eax
or dword ptr ss:[ebp-4],FFFFFFFF
jmp oglmdi2_vs7.40BD6B
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
call oglmdi2_vs7.40BABB
xor ebx,ebx
mov dword ptr ss:[ebp-30],ebx
or dword ptr ss:[ebp-4],FFFFFFFF
mov edi,dword ptr ss:[ebp-1C]
mov esi,dword ptr ss:[ebp-28]
cmp dword ptr ss:[ebp-30],ebx
jne oglmdi2_vs7.40BD88
lea eax,dword ptr ds:[edi+edi]
push eax
call oglmdi2_vs7.4052DA
pop ecx
mov dword ptr ss:[ebp-30],eax
cmp eax,ebx
je oglmdi2_vs7.40BDC1
mov dword ptr ss:[ebp-24],1
push edi
push dword ptr ss:[ebp-30]
push esi
push dword ptr ss:[ebp-2C]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&LCMapStringW>]
test eax,eax
je oglmdi2_vs7.40BDC1
push ebx
push ebx
cmp dword ptr ss:[ebp+1C],ebx
jne oglmdi2_vs7.40BDAB
push ebx
push ebx
jmp oglmdi2_vs7.40BDB1
push dword ptr ss:[ebp+1C]
push dword ptr ss:[ebp+18]
push edi
push dword ptr ss:[ebp-30]
push ebx
push dword ptr ss:[ebp+20]
call dword ptr ds:[<&WideCharToMultiByte>]
mov edi,eax
cmp dword ptr ss:[ebp-24],ebx
je oglmdi2_vs7.40BDCF
push dword ptr ss:[ebp-30]
call oglmdi2_vs7.4051DA
pop ecx
cmp dword ptr ss:[ebp-20],ebx
je oglmdi2_vs7.40BDDD
push dword ptr ss:[ebp-2C]
call oglmdi2_vs7.4051DA
pop ecx
mov eax,edi
jmp oglmdi2_vs7.40BF3F
mov dword ptr ss:[ebp-34],ebx
xor edi,edi
mov dword ptr ss:[ebp-38],ebx
cmp dword ptr ss:[ebp+8],ebx
jne oglmdi2_vs7.40BDF9
mov eax,dword ptr ds:[4123D4]
mov dword ptr ss:[ebp+8],eax
cmp dword ptr ss:[ebp+20],ebx
jne oglmdi2_vs7.40BE06
mov eax,dword ptr ds:[4123E4]
mov dword ptr ss:[ebp+20],eax
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.40B8A3
pop ecx
mov dword ptr ss:[ebp-3C],eax
cmp eax,FFFFFFFF
jne oglmdi2_vs7.40BE1E
xor eax,eax
jmp oglmdi2_vs7.40BF3F
cmp eax,dword ptr ss:[ebp+20]
je oglmdi2_vs7.40BF15
push ebx
push ebx
lea ecx,dword ptr ss:[ebp+14]
push ecx
push dword ptr ss:[ebp+10]
push eax
push dword ptr ss:[ebp+20]
call oglmdi2_vs7.40B8EC
add esp,18
mov dword ptr ss:[ebp-34],eax
cmp eax,ebx
je oglmdi2_vs7.40BE17
push ebx
push ebx
push dword ptr ss:[ebp+14]
push eax
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&LCMapStringA>]
mov esi,eax
mov dword ptr ss:[ebp-40],esi
cmp esi,ebx
je oglmdi2_vs7.40BF04
mov dword ptr ss:[ebp-4],ebx
add eax,3
and eax,FFFFFFFC
call oglmdi2_vs7.4099B0
mov dword ptr ss:[ebp-18],esp
mov edi,esp
mov dword ptr ss:[ebp-44],edi
push esi
push ebx
push edi
call oglmdi2_vs7.409D60
add esp,C
jmp oglmdi2_vs7.40BE95
xor eax,eax
inc eax
ret 
mov esp,dword ptr ss:[ebp-18]
call oglmdi2_vs7.40BABB
xor ebx,ebx
xor edi,edi
or dword ptr ss:[ebp-4],FFFFFFFF
cmp edi,ebx
jne oglmdi2_vs7.40BEC0
push dword ptr ss:[ebp-40]
call oglmdi2_vs7.4052DA
pop ecx
mov edi,eax
cmp edi,ebx
je oglmdi2_vs7.40BEDD
push dword ptr ss:[ebp-40]
push ebx
push edi
call oglmdi2_vs7.409D60
add esp,C
mov dword ptr ss:[ebp-38],1
push dword ptr ss:[ebp-40]
push edi
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp-34]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&LCMapStringA>]
mov dword ptr ss:[ebp-40],eax
cmp eax,ebx
jne oglmdi2_vs7.40BEE1
xor esi,esi
jmp oglmdi2_vs7.40BF07
push dword ptr ss:[ebp+1C]
push dword ptr ss:[ebp+18]
lea eax,dword ptr ss:[ebp-40]
push eax
push edi
push dword ptr ss:[ebp+20]
push dword ptr ss:[ebp-3C]
call oglmdi2_vs7.40B8EC
add esp,18
mov esi,eax
neg esi
sbb esi,esi
neg esi
jmp oglmdi2_vs7.40BF07
mov esi,dword ptr ss:[ebp-48]
cmp dword ptr ss:[ebp-38],ebx
je oglmdi2_vs7.40BF2F
push edi
call oglmdi2_vs7.4051DA
pop ecx
jmp oglmdi2_vs7.40BF2F
push dword ptr ss:[ebp+1C]
push dword ptr ss:[ebp+18]
push dword ptr ss:[ebp+14]
push dword ptr ss:[ebp+10]
push dword ptr ss:[ebp+C]
push dword ptr ss:[ebp+8]
call dword ptr ds:[<&LCMapStringA>]
mov esi,eax
cmp dword ptr ss:[ebp-34],ebx
je oglmdi2_vs7.40BF3D
push dword ptr ss:[ebp-34]
call oglmdi2_vs7.4051DA
pop ecx
mov eax,esi
lea esp,dword ptr ss:[ebp-54]
call oglmdi2_vs7.406343
ret 
mov edx,dword ptr ss:[esp+4]
push esi
mov esi,dword ptr ss:[esp+C]
lea ecx,dword ptr ds:[edx+esi]
xor eax,eax
cmp ecx,edx
jb oglmdi2_vs7.40BF5E
cmp ecx,esi
jae oglmdi2_vs7.40BF61
xor eax,eax
inc eax
mov edx,dword ptr ss:[esp+10]
mov dword ptr ds:[edx],ecx
pop esi
ret 
push esi
mov esi,dword ptr ss:[esp+8]
push edi
mov edi,dword ptr ss:[esp+10]
push esi
push dword ptr ds:[edi]
push dword ptr ds:[esi]
call oglmdi2_vs7.40BF48
add esp,C
test eax,eax
je oglmdi2_vs7.40BF9B
lea eax,dword ptr ds:[esi+4]
push eax
push 1
push dword ptr ds:[eax]
call oglmdi2_vs7.40BF48
add esp,C
test eax,eax
je oglmdi2_vs7.40BF9B
inc dword ptr ds:[esi+8]
lea eax,dword ptr ds:[esi+4]
push eax
push dword ptr ds:[edi+4]
push dword ptr ds:[eax]
call oglmdi2_vs7.40BF48
add esp,C
test eax,eax
je oglmdi2_vs7.40BFB3
inc dword ptr ds:[esi+8]
lea eax,dword ptr ds:[esi+8]
push eax
push dword ptr ds:[edi+8]
push dword ptr ds:[eax]
call oglmdi2_vs7.40BF48
add esp,C
pop edi
pop esi
ret 
mov eax,dword ptr ss:[esp+4]
push esi
mov esi,dword ptr ds:[eax]
mov ecx,esi
add esi,esi
push edi
mov edi,dword ptr ds:[eax+4]
shr ecx,1F
mov dword ptr ds:[eax],esi
lea esi,dword ptr ds:[edi+edi]
or esi,ecx
mov ecx,dword ptr ds:[eax+8]
mov edx,edi
shr edx,1F
shl ecx,1
or ecx,edx
pop edi
mov dword ptr ds:[eax+4],esi
mov dword ptr ds:[eax+8],ecx
pop esi
ret 
mov eax,dword ptr ss:[esp+4]
mov edx,dword ptr ds:[eax+8]
mov ecx,dword ptr ds:[eax+4]
push esi
push edi
mov edi,ecx
mov esi,edx
shr ecx,1
shl esi,1F
or ecx,esi
mov dword ptr ds:[eax+4],ecx
mov ecx,dword ptr ds:[eax]
shl edi,1F
shr ecx,1
or ecx,edi
shr edx,1
pop edi
mov dword ptr ds:[eax+8],edx
mov dword ptr ds:[eax],ecx
pop esi
ret 
push ebp
mov ebp,esp
sub esp,14
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push ebx
mov ebx,dword ptr ss:[ebp+10]
xor edx,edx
mov dword ptr ss:[ebp-4],eax
mov eax,dword ptr ss:[ebp+C]
cmp eax,edx
push esi
push edi
mov dword ptr ss:[ebp-8],404E
mov dword ptr ds:[ebx],edx
mov dword ptr ds:[ebx+4],edx
mov dword ptr ds:[ebx+8],edx
jbe oglmdi2_vs7.40C0A0
mov dword ptr ss:[ebp+10],eax
mov esi,ebx
lea edi,dword ptr ss:[ebp-14]
movsd dword ptr es:[edi],dword ptr ds:[esi]
movsd dword ptr es:[edi],dword ptr ds:[esi]
push ebx
movsd dword ptr es:[edi],dword ptr ds:[esi]
call oglmdi2_vs7.40BFC7
push ebx
call oglmdi2_vs7.40BFC7
lea eax,dword ptr ss:[ebp-14]
push eax
push ebx
call oglmdi2_vs7.40BF69
push ebx
call oglmdi2_vs7.40BFC7
mov eax,dword ptr ss:[ebp+8]
movsx eax,byte ptr ds:[eax]
and dword ptr ss:[ebp-10],0
and dword ptr ss:[ebp-C],0
mov dword ptr ss:[ebp-14],eax
lea eax,dword ptr ss:[ebp-14]
push eax
push ebx
call oglmdi2_vs7.40BF69
add esp,1C
inc dword ptr ss:[ebp+8]
dec dword ptr ss:[ebp+10]
jne oglmdi2_vs7.40C054
xor edx,edx
cmp dword ptr ds:[ebx+8],edx
jne oglmdi2_vs7.40C0D4
mov edi,dword ptr ds:[ebx+8]
mov ecx,dword ptr ds:[ebx+4]
add dword ptr ss:[ebp-8],FFF0
mov eax,ecx
shr eax,10
mov edi,eax
mov eax,dword ptr ds:[ebx]
mov esi,eax
shr esi,10
shl ecx,10
or esi,ecx
shl eax,10
cmp edi,edx
mov dword ptr ds:[ebx+4],esi
mov dword ptr ds:[ebx],eax
je oglmdi2_vs7.40C0A8
mov dword ptr ds:[ebx+8],edi
mov esi,8000
jmp oglmdi2_vs7.40C0E9
push ebx
call oglmdi2_vs7.40BFC7
add dword ptr ss:[ebp-8],FFFF
pop ecx
test dword ptr ds:[ebx+8],esi
je oglmdi2_vs7.40C0DB
mov ecx,dword ptr ss:[ebp-4]
mov ax,word ptr ss:[ebp-8]
xor ecx,dword ptr ss:[ebp+4]
pop edi
pop esi
mov word ptr ds:[ebx+A],ax
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
push ebp
mov ebp,esp
sub esp,58
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push ebx
mov dword ptr ss:[ebp-4],eax
lea eax,dword ptr ss:[ebp-58]
push esi
mov dword ptr ss:[ebp-10],eax
xor eax,eax
xor edx,edx
push edi
mov edi,dword ptr ss:[ebp+10]
inc edx
mov dword ptr ss:[ebp-2C],eax
mov dword ptr ss:[ebp-1C],edx
mov dword ptr ss:[ebp-8],eax
mov dword ptr ss:[ebp-14],eax
mov dword ptr ss:[ebp-28],eax
mov dword ptr ss:[ebp-24],eax
mov dword ptr ss:[ebp-20],eax
mov dword ptr ss:[ebp-C],eax
mov dword ptr ss:[ebp-18],eax
mov dword ptr ss:[ebp+10],edi
mov cl,byte ptr ds:[edi]
cmp cl,20
je oglmdi2_vs7.40C15C
cmp cl,9
je oglmdi2_vs7.40C15C
cmp cl,A
je oglmdi2_vs7.40C15C
cmp cl,D
jne oglmdi2_vs7.40C15F
inc edi
jmp oglmdi2_vs7.40C146
push 4
pop esi
mov bl,byte ptr ds:[edi]
inc edi
cmp eax,B
ja oglmdi2_vs7.40C3D6
jmp dword ptr ds:[eax*4+40C563]
cmp bl,31
jl oglmdi2_vs7.40C186
cmp bl,39
jg oglmdi2_vs7.40C186
push 3
jmp oglmdi2_vs7.40C38E
cmp bl,byte ptr ds:[411824]
jne oglmdi2_vs7.40C195
push 5
jmp oglmdi2_vs7.40C3CC
movsx eax,bl
sub eax,2B
je oglmdi2_vs7.40C1BC
dec eax
dec eax
je oglmdi2_vs7.40C1B0
sub eax,3
je oglmdi2_vs7.40C233
dec edi
jmp oglmdi2_vs7.40C469
push 2
pop eax
mov dword ptr ss:[ebp-2C],8000
jmp oglmdi2_vs7.40C162
and dword ptr ss:[ebp-2C],0
push 2
pop eax
jmp oglmdi2_vs7.40C162
cmp bl,31
mov dword ptr ss:[ebp-14],edx
jl oglmdi2_vs7.40C1D2
cmp bl,39
jle oglmdi2_vs7.40C17F
cmp bl,byte ptr ds:[411824]
je oglmdi2_vs7.40C28C
cmp bl,2B
je oglmdi2_vs7.40C208
cmp bl,2D
je oglmdi2_vs7.40C208
cmp bl,30
je oglmdi2_vs7.40C233
cmp bl,43
jle oglmdi2_vs7.40C1AA
cmp bl,45
jle oglmdi2_vs7.40C201
cmp bl,63
jle oglmdi2_vs7.40C1AA
cmp bl,65
jg oglmdi2_vs7.40C1AA
push 6
jmp oglmdi2_vs7.40C3CC
dec edi
push B
jmp oglmdi2_vs7.40C3CC
cmp bl,31
jl oglmdi2_vs7.40C21E
cmp bl,39
jle oglmdi2_vs7.40C17F
cmp bl,byte ptr ds:[411824]
je oglmdi2_vs7.40C18E
cmp bl,30
jne oglmdi2_vs7.40C39A
mov eax,edx
jmp oglmdi2_vs7.40C162
mov dword ptr ss:[ebp-14],edx
cmp dword ptr ds:[411820],edx
movzx eax,bl
jle oglmdi2_vs7.40C256
push esi
push eax
call oglmdi2_vs7.40A3DC
pop ecx
xor edx,edx
pop ecx
inc edx
jmp oglmdi2_vs7.40C262
mov ecx,dword ptr ds:[41182C]
movzx eax,byte ptr ds:[ecx+eax*2]
and eax,esi
test eax,eax
je oglmdi2_vs7.40C284
cmp dword ptr ss:[ebp-8],19
jae oglmdi2_vs7.40C27C
mov eax,dword ptr ss:[ebp-10]
inc dword ptr ss:[ebp-8]
sub bl,30
inc dword ptr ss:[ebp-10]
mov byte ptr ds:[eax],bl
jmp oglmdi2_vs7.40C27F
inc dword ptr ss:[ebp-C]
mov bl,byte ptr ds:[edi]
inc edi
jmp oglmdi2_vs7.40C23D
cmp bl,byte ptr ds:[411824]
jne oglmdi2_vs7.40C2F1
mov eax,esi
jmp oglmdi2_vs7.40C162
cmp dword ptr ss:[ebp-8],0
mov dword ptr ss:[ebp-14],edx
mov dword ptr ss:[ebp-28],edx
jne oglmdi2_vs7.40C2AC
jmp oglmdi2_vs7.40C2A7
dec dword ptr ss:[ebp-C]
mov bl,byte ptr ds:[edi]
inc edi
cmp bl,30
je oglmdi2_vs7.40C2A1
cmp dword ptr ds:[411820],edx
movzx eax,bl
jle oglmdi2_vs7.40C2C5
push esi
push eax
call oglmdi2_vs7.40A3DC
pop ecx
xor edx,edx
pop ecx
inc edx
jmp oglmdi2_vs7.40C2D1
mov ecx,dword ptr ds:[41182C]
movzx eax,byte ptr ds:[ecx+eax*2]
and eax,esi
test eax,eax
je oglmdi2_vs7.40C2F1
cmp dword ptr ss:[ebp-8],19
jae oglmdi2_vs7.40C2EC
inc dword ptr ss:[ebp-8]
mov eax,dword ptr ss:[ebp-10]
sub bl,30
inc dword ptr ss:[ebp-10]
dec dword ptr ss:[ebp-C]
mov byte ptr ds:[eax],bl
mov bl,byte ptr ds:[edi]
inc edi
jmp oglmdi2_vs7.40C2AC
cmp bl,2B
je oglmdi2_vs7.40C208
cmp bl,2D
je oglmdi2_vs7.40C208
jmp oglmdi2_vs7.40C1ED
cmp dword ptr ds:[411820],edx
mov dword ptr ss:[ebp-28],edx
movzx eax,bl
jle oglmdi2_vs7.40C324
push esi
push eax
call oglmdi2_vs7.40A3DC
pop ecx
xor edx,edx
pop ecx
inc edx
jmp oglmdi2_vs7.40C330
mov ecx,dword ptr ds:[41182C]
movzx eax,byte ptr ds:[ecx+eax*2]
and eax,esi
test eax,eax
je oglmdi2_vs7.40C39A
mov eax,esi
jmp oglmdi2_vs7.40C38F
cmp bl,31
lea ecx,dword ptr ds:[edi-2]
mov dword ptr ss:[ebp+10],ecx
jl oglmdi2_vs7.40C348
cmp bl,39
jle oglmdi2_vs7.40C38C
movsx eax,bl
sub eax,2B
je oglmdi2_vs7.40C3CA
dec eax
dec eax
je oglmdi2_vs7.40C3BE
sub eax,3
jne oglmdi2_vs7.40C467
push 8
jmp oglmdi2_vs7.40C3CC
mov dword ptr ss:[ebp-24],edx
jmp oglmdi2_vs7.40C369
mov bl,byte ptr ds:[edi]
inc edi
cmp bl,30
je oglmdi2_vs7.40C366
cmp bl,31
jl oglmdi2_vs7.40C1AA
cmp bl,39
jg oglmdi2_vs7.40C1AA
jmp oglmdi2_vs7.40C38C
cmp bl,31
jl oglmdi2_vs7.40C395
cmp bl,39
jg oglmdi2_vs7.40C395
push 9
pop eax
dec edi
jmp oglmdi2_vs7.40C162
cmp bl,30
je oglmdi2_vs7.40C35D
mov edi,dword ptr ss:[ebp+10]
jmp oglmdi2_vs7.40C469
cmp dword ptr ss:[ebp+20],0
je oglmdi2_vs7.40C3D2
movsx eax,bl
sub eax,2B
lea ecx,dword ptr ds:[edi-1]
mov dword ptr ss:[ebp+10],ecx
je oglmdi2_vs7.40C3CA
dec eax
dec eax
jne oglmdi2_vs7.40C467
or dword ptr ss:[ebp-1C],FFFFFFFF
push 7
pop eax
jmp oglmdi2_vs7.40C162
push 7
pop eax
jmp oglmdi2_vs7.40C162
push A
pop eax
dec edi
cmp eax,A
jne oglmdi2_vs7.40C162
jmp oglmdi2_vs7.40C469
mov dword ptr ss:[ebp-24],1
xor esi,esi
cmp dword ptr ds:[411820],1
movzx eax,bl
jle oglmdi2_vs7.40C405
push 4
push eax
call oglmdi2_vs7.40A3DC
pop ecx
pop ecx
jmp oglmdi2_vs7.40C412
mov ecx,dword ptr ds:[41182C]
movzx eax,byte ptr ds:[ecx+eax*2]
and eax,4
test eax,eax
je oglmdi2_vs7.40C432
movsx ecx,bl
lea eax,dword ptr ds:[esi+esi*4]
lea esi,dword ptr ds:[ecx+eax*2-30]
cmp esi,1450
jg oglmdi2_vs7.40C42D
mov bl,byte ptr ds:[edi]
inc edi
jmp oglmdi2_vs7.40C3ED
mov esi,1451
mov dword ptr ss:[ebp-20],esi
cmp dword ptr ds:[411820],1
movzx eax,bl
jle oglmdi2_vs7.40C44D
push 4
push eax
call oglmdi2_vs7.40A3DC
pop ecx
pop ecx
jmp oglmdi2_vs7.40C45A
mov ecx,dword ptr ds:[41182C]
movzx eax,byte ptr ds:[ecx+eax*2]
and eax,4
test eax,eax
je oglmdi2_vs7.40C1AA
mov bl,byte ptr ds:[edi]
inc edi
jmp oglmdi2_vs7.40C435
mov edi,ecx
cmp dword ptr ss:[ebp-14],0
mov eax,dword ptr ss:[ebp+C]
mov dword ptr ds:[eax],edi
je oglmdi2_vs7.40C50E
push 18
pop eax
cmp dword ptr ss:[ebp-8],eax
jbe oglmdi2_vs7.40C495
cmp byte ptr ss:[ebp-41],5
jl oglmdi2_vs7.40C489
inc byte ptr ss:[ebp-41]
mov dword ptr ss:[ebp-8],eax
mov eax,dword ptr ss:[ebp-10]
dec eax
inc dword ptr ss:[ebp-C]
jmp oglmdi2_vs7.40C498
mov eax,dword ptr ss:[ebp-10]
cmp dword ptr ss:[ebp-8],0
jbe oglmdi2_vs7.40C535
jmp oglmdi2_vs7.40C4AA
dec dword ptr ss:[ebp-8]
inc dword ptr ss:[ebp-C]
dec eax
cmp byte ptr ds:[eax],0
je oglmdi2_vs7.40C4A4
lea eax,dword ptr ss:[ebp-3C]
push eax
push dword ptr ss:[ebp-8]
lea eax,dword ptr ss:[ebp-58]
push eax
call oglmdi2_vs7.40C022
mov eax,dword ptr ss:[ebp-20]
xor ecx,ecx
add esp,C
cmp dword ptr ss:[ebp-1C],ecx
jge oglmdi2_vs7.40C4CF
neg eax
add eax,dword ptr ss:[ebp-C]
cmp dword ptr ss:[ebp-24],ecx
jne oglmdi2_vs7.40C4DA
add eax,dword ptr ss:[ebp+18]
cmp dword ptr ss:[ebp-28],ecx
jne oglmdi2_vs7.40C4E2
sub eax,dword ptr ss:[ebp+1C]
cmp eax,1450
jg oglmdi2_vs7.40C517
cmp eax,FFFFEBB0
jl oglmdi2_vs7.40C52E
push dword ptr ss:[ebp+14]
push eax
lea eax,dword ptr ss:[ebp-3C]
push eax
call oglmdi2_vs7.40CDE9
mov edx,dword ptr ss:[ebp-3C]
mov ebx,dword ptr ss:[ebp-3A]
mov esi,dword ptr ss:[ebp-36]
mov eax,dword ptr ss:[ebp-32]
add esp,C
jmp oglmdi2_vs7.40C53D
mov dword ptr ss:[ebp-18],4
jmp oglmdi2_vs7.40C535
xor ebx,ebx
mov eax,7FFF
mov esi,80000000
xor edx,edx
mov dword ptr ss:[ebp-18],2
jmp oglmdi2_vs7.40C53D
mov dword ptr ss:[ebp-18],1
xor edx,edx
xor eax,eax
xor esi,esi
xor ebx,ebx
mov ecx,dword ptr ss:[ebp+8]
or eax,dword ptr ss:[ebp-2C]
mov dword ptr ds:[ecx+2],ebx
mov dword ptr ds:[ecx+6],esi
mov word ptr ds:[ecx+A],ax
mov eax,dword ptr ss:[ebp-18]
mov word ptr ds:[ecx],dx
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
pop edi
pop esi
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
jne oglmdi2_vs7.40C526
inc eax
add ch,al
rol dword ptr ds:[eax],10
ret 40
cmp al,dl
inc eax
add byte ptr ds:[ebx+80040C2],dl
ret 
inc eax
add byte ptr ds:[eax],bh
ret 
inc eax
add byte ptr ds:[edx+610040C3],al
ret 
inc eax
add ah,ah
ret 
inc eax
add dh,dl
ret 
inc eax
add byte ptr ds:[edx+550040C3],ah
mov ebp,esp
sub esp,30
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push ebx
mov ebx,dword ptr ss:[ebp+1C]
mov dword ptr ss:[ebp-4],eax
mov eax,dword ptr ss:[ebp+10]
push esi
mov ecx,eax
mov esi,7FFF
and ecx,8000
and eax,esi
test cx,cx
push edi
mov byte ptr ss:[ebp-24],CC
mov byte ptr ss:[ebp-23],CC
mov byte ptr ss:[ebp-22],CC
mov byte ptr ss:[ebp-21],CC
mov byte ptr ss:[ebp-20],CC
mov byte ptr ss:[ebp-1F],CC
mov byte ptr ss:[ebp-1E],CC
mov byte ptr ss:[ebp-1D],CC
mov byte ptr ss:[ebp-1C],CC
mov byte ptr ss:[ebp-1B],CC
mov byte ptr ss:[ebp-1A],FB
mov byte ptr ss:[ebp-19],3F
mov dword ptr ss:[ebp-8],1
mov edx,eax
je oglmdi2_vs7.40C600
mov byte ptr ds:[ebx+2],2D
jmp oglmdi2_vs7.40C604
mov byte ptr ds:[ebx+2],20
test dx,dx
mov edi,dword ptr ss:[ebp+C]
jne oglmdi2_vs7.40C619
test edi,edi
jne oglmdi2_vs7.40C619
cmp dword ptr ss:[ebp+8],edi
je oglmdi2_vs7.40C70C
cmp dx,si
jne oglmdi2_vs7.40C696
mov eax,80000000
cmp edi,eax
mov word ptr ds:[ebx],1
jne oglmdi2_vs7.40C632
cmp dword ptr ss:[ebp+8],0
je oglmdi2_vs7.40C641
test edi,40000000
jne oglmdi2_vs7.40C641
push oglmdi2_vs7.40F394
jmp oglmdi2_vs7.40C687
test cx,cx
je oglmdi2_vs7.40C65B
cmp edi,C0000000
jne oglmdi2_vs7.40C65B
cmp dword ptr ss:[ebp+8],0
jne oglmdi2_vs7.40C682
push oglmdi2_vs7.40F38C
jmp oglmdi2_vs7.40C66A
cmp edi,eax
jne oglmdi2_vs7.40C682
cmp dword ptr ss:[ebp+8],0
jne oglmdi2_vs7.40C682
push oglmdi2_vs7.40F384
lea eax,dword ptr ds:[ebx+4]
push eax
call oglmdi2_vs7.409AE0
mov byte ptr ds:[ebx+3],5
and dword ptr ss:[ebp-8],0
pop ecx
pop ecx
jmp oglmdi2_vs7.40C7EE
push oglmdi2_vs7.40F37C
lea eax,dword ptr ds:[ebx+4]
push eax
call oglmdi2_vs7.409AE0
mov byte ptr ds:[ebx+3],6
jmp oglmdi2_vs7.40C677
movzx eax,dx
mov esi,eax
imul eax,eax,4D10
and word ptr ss:[ebp-18],0
mov ecx,edi
shr ecx,18
shr esi,8
lea ecx,dword ptr ds:[esi+ecx*2]
imul ecx,ecx,4D
lea esi,dword ptr ds:[ecx+eax-134312F4]
mov eax,dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-16],eax
sar esi,10
movsx eax,si
neg eax
push 1
push eax
lea eax,dword ptr ss:[ebp-18]
push eax
mov word ptr ss:[ebp-E],dx
mov dword ptr ss:[ebp-12],edi
call oglmdi2_vs7.40CDE9
add esp,C
cmp word ptr ss:[ebp-E],3FFF
jb oglmdi2_vs7.40C6F7
lea eax,dword ptr ss:[ebp-24]
push eax
lea eax,dword ptr ss:[ebp-18]
push eax
inc esi
call oglmdi2_vs7.40CBB1
pop ecx
pop ecx
test byte ptr ss:[ebp+18],1
mov edi,dword ptr ss:[ebp+14]
mov word ptr ds:[ebx],si
je oglmdi2_vs7.40C715
movsx eax,si
add edi,eax
test edi,edi
jg oglmdi2_vs7.40C715
mov byte ptr ds:[ebx+4],30
jmp oglmdi2_vs7.40C812
cmp edi,15
jle oglmdi2_vs7.40C71D
push 15
pop edi
movzx esi,word ptr ss:[ebp-E]
sub esi,3FFE
and word ptr ss:[ebp-E],0
mov dword ptr ss:[ebp+10],8
lea eax,dword ptr ss:[ebp-18]
push eax
call oglmdi2_vs7.40BFC7
dec dword ptr ss:[ebp+10]
pop ecx
jne oglmdi2_vs7.40C733
test esi,esi
jge oglmdi2_vs7.40C75D
neg esi
and esi,FF
jle oglmdi2_vs7.40C75D
lea eax,dword ptr ss:[ebp-18]
push eax
call oglmdi2_vs7.40BFF5
dec esi
pop ecx
jne oglmdi2_vs7.40C750
lea ecx,dword ptr ds:[edi+1]
test ecx,ecx
lea eax,dword ptr ds:[ebx+4]
mov dword ptr ss:[ebp+10],eax
jle oglmdi2_vs7.40C7BA
mov dword ptr ss:[ebp-C],ecx
lea esi,dword ptr ss:[ebp-18]
lea edi,dword ptr ss:[ebp-30]
movsd dword ptr es:[edi],dword ptr ds:[esi]
movsd dword ptr es:[edi],dword ptr ds:[esi]
lea eax,dword ptr ss:[ebp-18]
push eax
movsd dword ptr es:[edi],dword ptr ds:[esi]
call oglmdi2_vs7.40BFC7
lea eax,dword ptr ss:[ebp-18]
push eax
call oglmdi2_vs7.40BFC7
lea eax,dword ptr ss:[ebp-30]
push eax
lea eax,dword ptr ss:[ebp-18]
push eax
call oglmdi2_vs7.40BF69
lea eax,dword ptr ss:[ebp-18]
push eax
call oglmdi2_vs7.40BFC7
mov al,byte ptr ss:[ebp-D]
mov ecx,dword ptr ss:[ebp+10]
and byte ptr ss:[ebp-D],0
add al,30
add esp,14
inc dword ptr ss:[ebp+10]
dec dword ptr ss:[ebp-C]
mov byte ptr ds:[ecx],al
jne oglmdi2_vs7.40C76D
mov eax,dword ptr ss:[ebp+10]
dec eax
mov cl,byte ptr ds:[eax]
dec eax
cmp cl,35
lea ecx,dword ptr ds:[ebx+4]
jl oglmdi2_vs7.40C807
jmp oglmdi2_vs7.40C7D1
cmp byte ptr ds:[eax],39
jne oglmdi2_vs7.40C7D5
mov byte ptr ds:[eax],30
dec eax
cmp eax,ecx
jae oglmdi2_vs7.40C7C8
cmp eax,ecx
jae oglmdi2_vs7.40C7DD
inc eax
inc word ptr ds:[ebx]
inc byte ptr ds:[eax]
sub al,bl
sub al,3
mov byte ptr ds:[ebx+3],al
movsx eax,al
and byte ptr ds:[eax+ebx+4],0
mov eax,dword ptr ss:[ebp-8]
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
pop edi
pop esi
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
cmp byte ptr ds:[eax],30
jne oglmdi2_vs7.40C80B
dec eax
cmp eax,ecx
jae oglmdi2_vs7.40C801
cmp eax,ecx
jae oglmdi2_vs7.40C7DF
mov byte ptr ds:[ecx],30
and word ptr ds:[ebx],0
and byte ptr ds:[ebx+5],0
xor eax,eax
mov byte ptr ds:[ebx+2],20
mov byte ptr ds:[ebx+3],1
inc eax
jmp oglmdi2_vs7.40C7F1
push ebp
mov ebp,esp
push ecx
push ecx
mov eax,dword ptr ss:[ebp+8]
cmp eax,dword ptr ds:[412780]
push esi
push edi
jae oglmdi2_vs7.40C8AB
mov ecx,eax
sar ecx,5
mov esi,eax
and esi,1F
lea edi,dword ptr ds:[ecx*4+4127A0]
mov ecx,dword ptr ds:[edi]
shl esi,3
test byte ptr ds:[ecx+esi+4],1
je oglmdi2_vs7.40C8AB
mov ecx,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-8],ecx
mov ecx,dword ptr ss:[ebp+10]
push eax
mov dword ptr ss:[ebp-4],ecx
call oglmdi2_vs7.40565A
cmp eax,FFFFFFFF
pop ecx
je oglmdi2_vs7.40C8B2
push dword ptr ss:[ebp+14]
lea ecx,dword ptr ss:[ebp-4]
push ecx
push dword ptr ss:[ebp-8]
push eax
call dword ptr ds:[<&SetFilePointer>]
cmp eax,FFFFFFFF
mov dword ptr ss:[ebp-8],eax
jne oglmdi2_vs7.40C89A
call dword ptr ds:[<&GetLastError>]
test eax,eax
je oglmdi2_vs7.40C89A
push eax
call oglmdi2_vs7.409143
pop ecx
jmp oglmdi2_vs7.40C8BC
mov eax,dword ptr ds:[edi]
lea eax,dword ptr ds:[eax+esi+4]
and byte ptr ds:[eax],FD
mov eax,dword ptr ss:[ebp-8]
mov edx,dword ptr ss:[ebp-4]
jmp oglmdi2_vs7.40C8C2
and dword ptr ds:[41222C],0
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
or edx,FFFFFFFF
pop edi
pop esi
leave 
ret 
push ebp
mov ebp,esp
mov eax,1008
call oglmdi2_vs7.4099B0
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push ebx
mov ebx,dword ptr ss:[ebp+8]
push esi
xor esi,esi
cmp ebx,dword ptr ds:[412780]
mov dword ptr ss:[ebp-4],eax
jae oglmdi2_vs7.40CA06
mov eax,ebx
sar eax,5
mov eax,dword ptr ds:[eax*4+4127A0]
mov ecx,ebx
and ecx,1F
test byte ptr ds:[eax+ecx*8+4],1
je oglmdi2_vs7.40CA06
push 1
push esi
push ebx
call oglmdi2_vs7.40ABF5
add esp,C
cmp eax,FFFFFFFF
mov dword ptr ss:[ebp-8],eax
je oglmdi2_vs7.40CA10
push 2
push esi
push ebx
call oglmdi2_vs7.40ABF5
add esp,C
cmp eax,FFFFFFFF
je oglmdi2_vs7.40CA10
push edi
mov edi,dword ptr ss:[ebp+C]
sub edi,eax
test edi,edi
jle oglmdi2_vs7.40C9B3
push 1000
lea eax,dword ptr ss:[ebp-1008]
push esi
push eax
call oglmdi2_vs7.409D60
push 8000
push ebx
call oglmdi2_vs7.40CE75
add esp,14
mov dword ptr ss:[ebp+8],eax
mov eax,1000
cmp edi,eax
jge oglmdi2_vs7.40C972
mov eax,edi
push eax
lea eax,dword ptr ss:[ebp-1008]
push eax
push ebx
call oglmdi2_vs7.40AC81
add esp,C
cmp eax,FFFFFFFF
je oglmdi2_vs7.40C990
sub edi,eax
test edi,edi
jg oglmdi2_vs7.40C967
jmp oglmdi2_vs7.40C9A6
cmp dword ptr ds:[41222C],5
jne oglmdi2_vs7.40C9A3
mov dword ptr ds:[412228],D
or esi,FFFFFFFF
push dword ptr ss:[ebp+8]
push ebx
call oglmdi2_vs7.40CE75
pop ecx
pop ecx
jmp oglmdi2_vs7.40C9F3
jge oglmdi2_vs7.40C9F3
push 0
push dword ptr ss:[ebp+C]
push ebx
call oglmdi2_vs7.40ABF5
push ebx
call oglmdi2_vs7.40565A
add esp,10
push eax
call dword ptr ds:[<&SetEndOfFile>]
mov esi,eax
neg esi
sbb esi,esi
neg esi
dec esi
cmp esi,FFFFFFFF
jne oglmdi2_vs7.40C9F3
mov dword ptr ds:[412228],D
call dword ptr ds:[<&GetLastError>]
mov dword ptr ds:[41222C],eax
push 0
push dword ptr ss:[ebp-8]
push ebx
call oglmdi2_vs7.40ABF5
add esp,C
mov eax,esi
pop edi
jmp oglmdi2_vs7.40CA13
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
pop esi
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
push edi
push esi
push ebx
mov esi,dword ptr ss:[ebp+C]
mov edi,dword ptr ss:[ebp+8]
mov al,FF
mov edi,edi
or al,al
je oglmdi2_vs7.40CA76
mov al,byte ptr ds:[esi]
add esi,1
mov ah,byte ptr ds:[edi]
add edi,1
cmp ah,al
je oglmdi2_vs7.40CA40
sub al,41
cmp al,1A
sbb cl,cl
and cl,20
add al,cl
add al,41
xchg al,ah
sub al,41
cmp al,1A
sbb cl,cl
and cl,20
add al,cl
add al,41
cmp al,ah
je oglmdi2_vs7.40CA40
sbb al,al
sbb al,FF
movsx eax,al
pop ebx
pop esi
pop edi
leave 
ret 
push ebp
mov ebp,esp
push ecx
mov ecx,dword ptr ss:[ebp+8]
cmp ecx,FF
jbe oglmdi2_vs7.40CAEB
and word ptr ss:[ebp-4],0
push edi
xor eax,eax
lea edi,dword ptr ss:[ebp-2]
stosw word ptr es:[edi],ax
mov eax,ecx
shr eax,8
cmp dword ptr ds:[412548],0
mov byte ptr ss:[ebp+A],al
mov byte ptr ss:[ebp+B],cl
pop edi
jne oglmdi2_vs7.40CAB3
xor eax,eax
leave 
ret 
push 1
push dword ptr ds:[412544]
lea eax,dword ptr ss:[ebp-4]
push dword ptr ds:[412664]
push eax
push 2
lea eax,dword ptr ss:[ebp+A]
push eax
push 1
call oglmdi2_vs7.409DC0
add esp,1C
test eax,eax
je oglmdi2_vs7.40CAAF
cmp word ptr ss:[ebp-2],0
jne oglmdi2_vs7.40CAAF
test byte ptr ss:[ebp-4],8
je oglmdi2_vs7.40CAAF
xor eax,eax
inc eax
leave 
ret 
cmp dword ptr ds:[411820],1
jle oglmdi2_vs7.40CB00
push 8
push ecx
call oglmdi2_vs7.40A3DC
pop ecx
pop ecx
leave 
ret 
mov eax,dword ptr ds:[41182C]
movzx eax,byte ptr ds:[eax+ecx*2]
and eax,8
leave 
ret 
int3 
int3 
mov eax,dword ptr ss:[esp+8]
mov ecx,dword ptr ss:[esp+10]
or ecx,eax
mov ecx,dword ptr ss:[esp+C]
jne oglmdi2_vs7.40CB29
mov eax,dword ptr ss:[esp+4]
mul ecx
ret 10
push ebx
mul ecx
mov ebx,eax
mov eax,dword ptr ss:[esp+8]
mul dword ptr ss:[esp+14]
add ebx,eax
mov eax,dword ptr ss:[esp+8]
mul ecx
add edx,ebx
pop ebx
ret 10
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
push ebp
mov ebp,esp
push edi
push esi
push ebx
mov ecx,dword ptr ss:[ebp+10]
or ecx,ecx
je oglmdi2_vs7.40CBAA
mov esi,dword ptr ss:[ebp+8]
mov edi,dword ptr ss:[ebp+C]
mov bh,41
mov bl,5A
mov dh,20
lea ecx,dword ptr ds:[ecx]
mov ah,byte ptr ds:[esi]
or ah,ah
mov al,byte ptr ds:[edi]
je oglmdi2_vs7.40CB9B
or al,al
je oglmdi2_vs7.40CB9B
add esi,1
add edi,1
cmp ah,bh
jb oglmdi2_vs7.40CB88
cmp ah,bl
ja oglmdi2_vs7.40CB88
add ah,dh
cmp al,bh
jb oglmdi2_vs7.40CB92
cmp al,bl
ja oglmdi2_vs7.40CB92
add al,dh
cmp ah,al
jne oglmdi2_vs7.40CBA1
sub ecx,1
jne oglmdi2_vs7.40CB6C
xor ecx,ecx
cmp ah,al
je oglmdi2_vs7.40CBAA
mov ecx,FFFFFFFF
jb oglmdi2_vs7.40CBAA
neg ecx
mov eax,ecx
pop ebx
pop esi
pop edi
leave 
ret 
push ebp
mov ebp,esp
sub esp,28
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push ebx
mov ebx,dword ptr ss:[ebp+C]
mov dword ptr ss:[ebp-4],eax
xor eax,eax
xor ecx,ecx
mov cx,word ptr ds:[ebx+A]
push esi
mov esi,dword ptr ss:[ebp+8]
mov dword ptr ss:[ebp-18],eax
mov dword ptr ss:[ebp-28],eax
mov dword ptr ss:[ebp-24],eax
mov dword ptr ss:[ebp-20],eax
mov ax,word ptr ds:[esi+A]
push edi
mov edi,ecx
mov edx,7FFF
and ecx,edx
xor edi,eax
and eax,edx
and edi,8000
cmp ax,7FFF
lea edx,dword ptr ds:[ecx+eax]
mov dword ptr ss:[ebp+8],edx
jae oglmdi2_vs7.40CDBE
cmp cx,7FFF
jae oglmdi2_vs7.40CDBE
cmp dx,BFFD
ja oglmdi2_vs7.40CDBE
cmp dx,3FBF
ja oglmdi2_vs7.40CC27
xor eax,eax
jmp oglmdi2_vs7.40CC61
test ax,ax
mov edx,7FFFFFFF
jne oglmdi2_vs7.40CC49
inc dword ptr ss:[ebp+8]
xor eax,eax
test dword ptr ds:[esi+8],edx
jne oglmdi2_vs7.40CC4B
cmp dword ptr ds:[esi+4],eax
jne oglmdi2_vs7.40CC4B
cmp dword ptr ds:[esi],eax
jne oglmdi2_vs7.40CC4B
jmp oglmdi2_vs7.40CDB8
xor eax,eax
cmp cx,ax
jne oglmdi2_vs7.40CC6E
inc dword ptr ss:[ebp+8]
test dword ptr ds:[ebx+8],edx
jne oglmdi2_vs7.40CC6E
cmp dword ptr ds:[ebx+4],eax
jne oglmdi2_vs7.40CC6E
cmp dword ptr ds:[ebx],eax
jne oglmdi2_vs7.40CC6E
mov dword ptr ds:[esi+8],eax
mov dword ptr ds:[esi+4],eax
mov dword ptr ds:[esi],eax
jmp oglmdi2_vs7.40CDD9
mov dword ptr ss:[ebp-14],eax
lea eax,dword ptr ss:[ebp-24]
mov dword ptr ss:[ebp-8],eax
mov dword ptr ss:[ebp+C],5
mov eax,dword ptr ss:[ebp-14]
add eax,eax
cmp dword ptr ss:[ebp+C],0
jle oglmdi2_vs7.40CCD2
add eax,esi
mov dword ptr ss:[ebp-C],eax
mov eax,dword ptr ss:[ebp+C]
lea ecx,dword ptr ds:[ebx+8]
mov dword ptr ss:[ebp-10],ecx
mov dword ptr ss:[ebp-1C],eax
mov eax,dword ptr ss:[ebp-10]
mov ecx,dword ptr ss:[ebp-C]
movzx ecx,word ptr ds:[ecx]
movzx eax,word ptr ds:[eax]
imul eax,ecx
mov ecx,dword ptr ss:[ebp-8]
add ecx,FFFFFFFC
push ecx
push eax
push dword ptr ds:[ecx]
call oglmdi2_vs7.40BF48
add esp,C
test eax,eax
je oglmdi2_vs7.40CCC5
mov eax,dword ptr ss:[ebp-8]
inc word ptr ds:[eax]
add dword ptr ss:[ebp-C],2
sub dword ptr ss:[ebp-10],2
dec dword ptr ss:[ebp-1C]
jne oglmdi2_vs7.40CC9A
add dword ptr ss:[ebp-8],2
inc dword ptr ss:[ebp-14]
dec dword ptr ss:[ebp+C]
cmp dword ptr ss:[ebp+C],0
jg oglmdi2_vs7.40CC7E
add dword ptr ss:[ebp+8],C002
cmp word ptr ss:[ebp+8],0
jle oglmdi2_vs7.40CD15
test byte ptr ss:[ebp-1D],80
jne oglmdi2_vs7.40CD0E
lea eax,dword ptr ss:[ebp-28]
push eax
call oglmdi2_vs7.40BFC7
add dword ptr ss:[ebp+8],FFFF
cmp word ptr ss:[ebp+8],0
pop ecx
jg oglmdi2_vs7.40CCF0
cmp word ptr ss:[ebp+8],0
jg oglmdi2_vs7.40CD4E
add dword ptr ss:[ebp+8],FFFF
cmp word ptr ss:[ebp+8],0
jge oglmdi2_vs7.40CD4E
mov eax,dword ptr ss:[ebp+8]
neg eax
movzx ebx,ax
add dword ptr ss:[ebp+8],ebx
test byte ptr ss:[ebp-28],1
je oglmdi2_vs7.40CD37
inc dword ptr ss:[ebp-18]
lea eax,dword ptr ss:[ebp-28]
push eax
call oglmdi2_vs7.40BFF5
dec ebx
pop ecx
jne oglmdi2_vs7.40CD2E
cmp dword ptr ss:[ebp-18],0
je oglmdi2_vs7.40CD4E
or byte ptr ss:[ebp-28],1
cmp word ptr ss:[ebp-28],8000
ja oglmdi2_vs7.40CD65
mov eax,dword ptr ss:[ebp-28]
and eax,1FFFF
cmp eax,18000
jne oglmdi2_vs7.40CD9A
cmp dword ptr ss:[ebp-26],FFFFFFFF
jne oglmdi2_vs7.40CD97
and dword ptr ss:[ebp-26],0
cmp dword ptr ss:[ebp-22],FFFFFFFF
jne oglmdi2_vs7.40CD92
and dword ptr ss:[ebp-22],0
cmp word ptr ss:[ebp-1E],FFFF
jne oglmdi2_vs7.40CD8C
inc dword ptr ss:[ebp+8]
mov word ptr ss:[ebp-1E],8000
jmp oglmdi2_vs7.40CD9A
inc word ptr ss:[ebp-1E]
jmp oglmdi2_vs7.40CD9A
inc dword ptr ss:[ebp-22]
jmp oglmdi2_vs7.40CD9A
inc dword ptr ss:[ebp-26]
mov eax,dword ptr ss:[ebp+8]
cmp ax,7FFF
jae oglmdi2_vs7.40CDBE
mov cx,word ptr ss:[ebp-26]
mov word ptr ds:[esi],cx
mov ecx,dword ptr ss:[ebp-24]
mov dword ptr ds:[esi+2],ecx
mov ecx,dword ptr ss:[ebp-20]
mov dword ptr ds:[esi+6],ecx
or eax,edi
mov word ptr ds:[esi+A],ax
jmp oglmdi2_vs7.40CDD9
neg di
sbb edi,edi
and dword ptr ds:[esi+4],0
and edi,80000000
add edi,7FFF8000
and dword ptr ds:[esi],0
mov dword ptr ds:[esi+8],edi
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
pop edi
pop esi
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
push ebp
mov ebp,esp
sub esp,10
mov eax,dword ptr ds:[411150]
xor eax,dword ptr ss:[ebp+4]
push ebx
mov ebx,oglmdi2_vs7.411B78
xor ecx,ecx
sub ebx,60
cmp dword ptr ss:[ebp+C],ecx
mov dword ptr ss:[ebp-4],eax
je oglmdi2_vs7.40CE67
jge oglmdi2_vs7.40CE17
neg dword ptr ss:[ebp+C]
mov ebx,oglmdi2_vs7.411CD8
sub ebx,60
cmp dword ptr ss:[ebp+10],ecx
jne oglmdi2_vs7.40CE22
mov eax,dword ptr ss:[ebp+8]
mov word ptr ds:[eax],cx
cmp dword ptr ss:[ebp+C],ecx
je oglmdi2_vs7.40CE67
push esi
push edi
mov eax,dword ptr ss:[ebp+C]
sar dword ptr ss:[ebp+C],3
and eax,7
add ebx,54
cmp eax,ecx
je oglmdi2_vs7.40CE60
lea eax,dword ptr ds:[eax+eax*2]
lea esi,dword ptr ds:[ebx+eax*4]
cmp word ptr ds:[esi],8000
jb oglmdi2_vs7.40CE53
lea edi,dword ptr ss:[ebp-10]
movsd dword ptr es:[edi],dword ptr ds:[esi]
movsd dword ptr es:[edi],dword ptr ds:[esi]
movsd dword ptr es:[edi],dword ptr ds:[esi]
dec dword ptr ss:[ebp-E]
lea esi,dword ptr ss:[ebp-10]
push esi
push dword ptr ss:[ebp+8]
call oglmdi2_vs7.40CBB1
pop ecx
pop ecx
xor ecx,ecx
cmp dword ptr ss:[ebp+C],ecx
jne oglmdi2_vs7.40CE29
pop edi
pop esi
mov ecx,dword ptr ss:[ebp-4]
xor ecx,dword ptr ss:[ebp+4]
pop ebx
call oglmdi2_vs7.404CCC
leave 
ret 
mov eax,dword ptr ss:[esp+4]
cmp eax,dword ptr ds:[412780]
push esi
jae oglmdi2_vs7.40CEDD
mov ecx,eax
sar ecx,5
mov ecx,dword ptr ds:[ecx*4+4127A0]
and eax,1F
lea edx,dword ptr ds:[ecx+eax*8+4]
mov cl,byte ptr ds:[edx]
test cl,1
je oglmdi2_vs7.40CEDD
xor eax,eax
mov al,cl
mov esi,8000
and eax,80
cmp dword ptr ss:[esp+C],esi
jne oglmdi2_vs7.40CEB5
and cl,7F
jmp oglmdi2_vs7.40CEC2
cmp dword ptr ss:[esp+C],4000
jne oglmdi2_vs7.40CED1
or cl,80
neg eax
sbb eax,eax
and eax,FFFFC000
add eax,esi
mov byte ptr ds:[edx],cl
pop esi
ret 
mov dword ptr ds:[412228],16
jmp oglmdi2_vs7.40CEE7
mov dword ptr ds:[412228],9
or eax,FFFFFFFF
pop esi
ret 
int3 
int3 
int3 
int3 
lea eax,dword ptr ds:[edx-1]
pop ebx
ret 
lea esp,dword ptr ss:[esp]
lea esp,dword ptr ss:[esp]
xor eax,eax
mov al,byte ptr ss:[esp+8]
push ebx
mov ebx,eax
shl eax,8
mov edx,dword ptr ss:[esp+8]
test edx,3
je oglmdi2_vs7.40CF2D
mov cl,byte ptr ds:[edx]
add edx,1
cmp cl,bl
je oglmdi2_vs7.40CEF0
test cl,cl
je oglmdi2_vs7.40CF76
test edx,3
jne oglmdi2_vs7.40CF18
or ebx,eax
push edi
mov eax,ebx
shl ebx,10
push esi
or ebx,eax
mov ecx,dword ptr ds:[edx]
mov edi,7EFEFEFF
mov eax,ecx
mov esi,edi
xor ecx,ebx
add esi,eax
add edi,ecx
xor ecx,FFFFFFFF
xor eax,FFFFFFFF
xor ecx,edi
xor eax,esi
add edx,4
and ecx,81010100
jne oglmdi2_vs7.40CF7A
and eax,81010100
je oglmdi2_vs7.40CF38
and eax,1010100
jne oglmdi2_vs7.40CF74
and esi,80000000
jne oglmdi2_vs7.40CF38
pop esi
pop edi
pop ebx
xor eax,eax
ret 
mov eax,dword ptr ds:[edx-4]
cmp al,bl
je oglmdi2_vs7.40CFB7
test al,al
je oglmdi2_vs7.40CF74
cmp ah,bl
je oglmdi2_vs7.40CFB0
test ah,ah
je oglmdi2_vs7.40CF74
shr eax,10
cmp al,bl
je oglmdi2_vs7.40CFA9
test al,al
je oglmdi2_vs7.40CF74
cmp ah,bl
je oglmdi2_vs7.40CFA2
test ah,ah
je oglmdi2_vs7.40CF74
jmp oglmdi2_vs7.40CF38
pop esi
pop edi
lea eax,dword ptr ds:[edx-1]
pop ebx
ret 
lea eax,dword ptr ds:[edx-2]
pop esi
pop edi
pop ebx
ret 
lea eax,dword ptr ds:[edx-3]
pop esi
pop edi
pop ebx
ret 
lea eax,dword ptr ds:[edx-4]
pop esi
pop edi
pop ebx
ret 
jmp dword ptr ds:[<&RtlUnwind>]
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov eax,dword ptr ss:[ebp-10]
push eax
call oglmdi2_vs7.404B30
pop ecx
ret 
mov eax,oglmdi2_vs7.40F4C4
jmp oglmdi2_vs7.404E3C
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
mov ecx,dword ptr ss:[ebp-10]
jmp oglmdi2_vs7.404620
mov eax,oglmdi2_vs7.40F4E8
jmp oglmdi2_vs7.404E3C
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
int3 
fld dword ptr ds:[411060]
fmul dword ptr ds:[40E354]
fstp dword ptr ds:[412110]
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
push FFFFFFFF
push oglmdi2_vs7.40CFDB
mov eax,dword ptr fs:[0]
push eax
mov dword ptr fs:[0],esp
push ecx
push 44
call oglmdi2_vs7.404A0E
add esp,4
mov dword ptr ss:[esp],eax
test eax,eax
mov dword ptr ss:[esp+C],0
je oglmdi2_vs7.40D094
push esi
push oglmdi2_vs7.404620
push oglmdi2_vs7.404610
push 1
lea esi,dword ptr ds:[eax+4]
push 40
push esi
mov dword ptr ds:[eax],1
call oglmdi2_vs7.404D51
mov dword ptr ds:[4120FC],esi
pop esi
mov ecx,dword ptr ss:[esp+4]
mov dword ptr fs:[0],ecx
add esp,10
ret 
mov ecx,dword ptr ss:[esp+4]
xor eax,eax
mov dword ptr ds:[4120FC],eax
mov dword ptr fs:[0],ecx
add esp,10
ret 
nop 
nop 
nop 
nop 
nop 
nop 
push FFFFFFFF
push oglmdi2_vs7.40CFDB
mov eax,dword ptr fs:[0]
push eax
mov dword ptr fs:[0],esp
push ecx
push 124
call oglmdi2_vs7.404A0E
add esp,4
mov dword ptr ss:[esp],eax
test eax,eax
mov dword ptr ss:[esp+C],0
je oglmdi2_vs7.40D117
push esi
push oglmdi2_vs7.404620
push oglmdi2_vs7.401000
push 8
lea esi,dword ptr ds:[eax+4]
push 24
push esi
mov dword ptr ds:[eax],8
call oglmdi2_vs7.404D51
mov dword ptr ds:[412108],esi
pop esi
mov ecx,dword ptr ss:[esp+4]
mov dword ptr fs:[0],ecx
add esp,10
ret 
mov ecx,dword ptr ss:[esp+4]
xor eax,eax
mov dword ptr ds:[412108],eax
mov dword ptr fs:[0],ecx
add esp,10
ret 
nop 
nop 
nop 
push FFFFFFFF
push oglmdi2_vs7.40CFDB
mov eax,dword ptr fs:[0]
push eax
mov dword ptr fs:[0],esp
push ecx
push 814
call oglmdi2_vs7.404A0E
add esp,4
mov dword ptr ss:[esp],eax
test eax,eax
mov dword ptr ss:[esp+C],0
je oglmdi2_vs7.40D19A
push esi
push oglmdi2_vs7.4044A0
push oglmdi2_vs7.4045B0
push C
lea esi,dword ptr ds:[eax+4]
push AC
push esi
mov dword ptr ds:[eax],C
call oglmdi2_vs7.404D51
mov dword ptr ds:[412104],esi
pop esi
mov ecx,dword ptr ss:[esp+4]
mov dword ptr fs:[0],ecx
add esp,10
ret 
mov ecx,dword ptr ss:[esp+4]
xor eax,eax
mov dword ptr ds:[412104],eax
mov dword ptr fs:[0],ecx
add esp,10
ret 
call <oglmdi2_vs7.gluNewQuadric>
mov dword ptr ds:[41210C],eax
ret 
nop 
nop 
nop 
nop 
nop 
mov eax,dword ptr ds:[41109C]
shl eax,4
push eax
call oglmdi2_vs7.404A0E
add esp,4
mov dword ptr ds:[412100],eax
ret 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
nop 
push oglmdi2_vs7.40D204
call oglmdi2_vs7.40625A
pop ecx
ret 
push oglmdi2_vs7.40D218
call oglmdi2_vs7.40625A
pop ecx
ret 
push oglmdi2_vs7.40D219
call oglmdi2_vs7.40625A
pop ecx
ret 
mov ecx,oglmdi2_vs7.412170
jmp oglmdi2_vs7.404A2F
mov ecx,oglmdi2_vs7.412174
jmp oglmdi2_vs7.404A6B
ret 
mov ecx,oglmdi2_vs7.4121CD
jmp oglmdi2_vs7.404B0B

