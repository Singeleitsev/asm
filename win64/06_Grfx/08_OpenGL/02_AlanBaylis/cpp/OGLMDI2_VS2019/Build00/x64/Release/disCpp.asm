sub     rsp,38
movsxd  rax,dword ptr ds:[13F14C040]
mov     qword ptr ss:[rsp+20],rax
mov     eax,20
mov     rcx,qword ptr ss:[rsp+20]
mul     rcx
mov     rcx,FFFFFFFFFFFFFFFF
cmovo   rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F129A7C
mov     qword ptr ss:[rsp+28],rax
mov     rax,qword ptr ss:[rsp+28]
mov     g_child ;qword ptr ds:[13F14CE80],rax
add     rsp,38
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
sub     rsp,58
mov     ecx,8A8
call    oglmdi2_vs2019.13F129A7C
mov     qword ptr ss:[rsp+30],rax
cmp     qword ptr ss:[rsp+30],0
je      oglmdi2_vs2019.13F1210B6
mov     rax,qword ptr ss:[rsp+30]
mov     qword ptr ds:[rax],C
mov     rax,qword ptr ss:[rsp+30]
add     rax,8
lea     rcx,qword ptr ds:[13F128A20]
mov     qword ptr ss:[rsp+20],rcx
lea     r9,qword ptr ds:[13F1289C0]
mov     r8d,C
mov     edx,B8
mov     rcx,rax
call    oglmdi2_vs2019.13F129934
mov     rax,qword ptr ss:[rsp+30]
add     rax,8
mov     qword ptr ss:[rsp+38],rax
jmp     oglmdi2_vs2019.13F1210BF
mov     qword ptr ss:[rsp+38],0
mov     rax,qword ptr ss:[rsp+38]
mov     qword ptr ss:[rsp+40],rax
mov     rax,qword ptr ss:[rsp+40]
mov     qword ptr ds:[13F14CE70],rax
add     rsp,58
ret     
int3    
int3    
int3    
int3    
int3    
int3    
movss   xmm0,dword ptr ds:[13F14C000]
divss   xmm0,dword ptr ds:[13F1407B0]
movss   dword ptr ds:[13F14CE5C],xmm0
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3    
sub     rsp,28
call    <oglmdi2_vs2019.gluNewQuadric>
mov     qword ptr ds:[13F14CE78],rax
add     rsp,28
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
sub     rsp,58
mov     ecx,50
call    oglmdi2_vs2019.13F129A7C
mov     qword ptr ss:[rsp+30],rax
cmp     qword ptr ss:[rsp+30],0
je      oglmdi2_vs2019.13F121186
mov     rax,qword ptr ss:[rsp+30]
mov     qword ptr ds:[rax],1
mov     rax,qword ptr ss:[rsp+30]
add     rax,8
lea     rcx,qword ptr ds:[13F128D20]
mov     qword ptr ss:[rsp+20],rcx
lea     r9,qword ptr ds:[13F128D10]
mov     r8d,1
mov     edx,48
mov     rcx,rax
call    oglmdi2_vs2019.13F129934
mov     rax,qword ptr ss:[rsp+30]
add     rax,8
mov     qword ptr ss:[rsp+38],rax
jmp     oglmdi2_vs2019.13F12118F
mov     qword ptr ss:[rsp+38],0
mov     rax,qword ptr ss:[rsp+38]
mov     qword ptr ss:[rsp+40],rax
mov     rax,qword ptr ss:[rsp+40]
mov     qword ptr ds:[13F14CE60],rax
add     rsp,58
ret     
int3    
int3    
int3    
int3    
int3    
int3    
sub     rsp,58
mov     ecx,128
call    oglmdi2_vs2019.13F129A7C
mov     qword ptr ss:[rsp+30],rax
cmp     qword ptr ss:[rsp+30],0
je      oglmdi2_vs2019.13F121216
mov     rax,qword ptr ss:[rsp+30]
mov     qword ptr ds:[rax],8
mov     rax,qword ptr ss:[rsp+30]
add     rax,8
lea     rcx,qword ptr ds:[13F128D20]
mov     qword ptr ss:[rsp+20],rcx
lea     r9,qword ptr ds:[13F121500]
mov     r8d,8
mov     edx,24
mov     rcx,rax
call    oglmdi2_vs2019.13F129934
mov     rax,qword ptr ss:[rsp+30]
add     rax,8
mov     qword ptr ss:[rsp+38],rax
jmp     oglmdi2_vs2019.13F12121F
mov     qword ptr ss:[rsp+38],0
mov     rax,qword ptr ss:[rsp+38]
mov     qword ptr ss:[rsp+40],rax
mov     rax,qword ptr ss:[rsp+40]
mov     qword ptr ds:[13F14CE68],rax
add     rsp,58
ret     
int3    
int3    
sub     rsp,28
lea     rcx,qword ptr ds:[13F14CE90]
call    oglmdi2_vs2019.13F1293F8
lea     rcx,qword ptr ds:[13F13FBB0]
add     rsp,28
jmp     oglmdi2_vs2019.13F12A1CC
int3    
int3    
int3    
int3    
lea     rax,qword ptr ds:[13F14CB80]
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+20],r9
mov     qword ptr ss:[rsp+18],r8
mov     qword ptr ss:[rsp+10],rdx
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,48
call    oglmdi2_vs2019.13F121260
mov     rax,qword ptr ds:[rax]
or      rax,1
mov     rcx,qword ptr ss:[rsp+70]
mov     qword ptr ss:[rsp+28],rcx
mov     rcx,qword ptr ss:[rsp+68]
mov     qword ptr ss:[rsp+20],rcx
mov     r9,qword ptr ss:[rsp+60]
mov     r8,qword ptr ss:[rsp+58]
mov     rdx,qword ptr ss:[rsp+50]
mov     rcx,rax
call    oglmdi2_vs2019.13F13125C
mov     dword ptr ss:[rsp+30],eax
cmp     dword ptr ss:[rsp+30],0
jge     oglmdi2_vs2019.13F1212D4
mov     dword ptr ss:[rsp+34],FFFFFFFF
jmp     oglmdi2_vs2019.13F1212DC
mov     eax,dword ptr ss:[rsp+30]
mov     dword ptr ss:[rsp+34],eax
mov     eax,dword ptr ss:[rsp+34]
add     rsp,48
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
mov     dword ptr ss:[rsp+8],ecx
sub     rsp,28
cvtsi2sd xmm0,dword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F131264
add     rsp,28
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3    
int3    
mov     dword ptr ss:[rsp+10],edx
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,28
mov     eax,dword ptr ss:[rsp+38]
and     eax,2
test    eax,eax
je      oglmdi2_vs2019.13F121381
lea     r9,qword ptr ds:[13F128A20]
mov     rax,qword ptr ss:[rsp+30]
mov     r8,qword ptr ds:[rax-8]
mov     edx,B8
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F1299A4
nop     
mov     eax,dword ptr ss:[rsp+38]
and     eax,1
test    eax,eax
je      oglmdi2_vs2019.13F121376
mov     rax,qword ptr ss:[rsp+30]
imul    rax,qword ptr ds:[rax-8],B8
add     rax,8
mov     rcx,qword ptr ss:[rsp+30]
sub     rcx,8
mov     rdx,rax
call    oglmdi2_vs2019.13F129A84
nop     
mov     rax,qword ptr ss:[rsp+30]
sub     rax,8
jmp     oglmdi2_vs2019.13F1213AC
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F128A20
nop     
mov     eax,dword ptr ss:[rsp+38]
and     eax,1
test    eax,eax
je      oglmdi2_vs2019.13F1213A7
mov     edx,B8
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F129A74
nop     
mov     rax,qword ptr ss:[rsp+30]
add     rsp,28
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
int3    
mov     dword ptr ss:[rsp+10],edx
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,28
mov     eax,dword ptr ss:[rsp+38]
and     eax,2
test    eax,eax
je      oglmdi2_vs2019.13F12142E
lea     r9,qword ptr ds:[13F128D20]
mov     rax,qword ptr ss:[rsp+30]
mov     r8,qword ptr ds:[rax-8]
mov     edx,48
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F1299A4
nop     
mov     eax,dword ptr ss:[rsp+38]
and     eax,1
test    eax,eax
je      oglmdi2_vs2019.13F121423
mov     rax,qword ptr ss:[rsp+30]
imul    rax,qword ptr ds:[rax-8],48
add     rax,8
mov     rcx,qword ptr ss:[rsp+30]
sub     rcx,8
mov     rdx,rax
call    oglmdi2_vs2019.13F129A84
nop     
mov     rax,qword ptr ss:[rsp+30]
sub     rax,8
jmp     oglmdi2_vs2019.13F121459
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F128D20
nop     
mov     eax,dword ptr ss:[rsp+38]
and     eax,1
test    eax,eax
je      oglmdi2_vs2019.13F121454
mov     edx,48
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F129A74
nop     
mov     rax,qword ptr ss:[rsp+30]
add     rsp,28
ret     
int3    
int3    
mov     dword ptr ss:[rsp+10],edx
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,28
mov     eax,dword ptr ss:[rsp+38]
and     eax,2
test    eax,eax
je      oglmdi2_vs2019.13F1214CE
lea     r9,qword ptr ds:[13F128D20]
mov     rax,qword ptr ss:[rsp+30]
mov     r8,qword ptr ds:[rax-8]
mov     edx,24
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F1299A4
nop     
mov     eax,dword ptr ss:[rsp+38]
and     eax,1
test    eax,eax
je      oglmdi2_vs2019.13F1214C3
mov     rax,qword ptr ss:[rsp+30]
imul    rax,qword ptr ds:[rax-8],24
add     rax,8
mov     rcx,qword ptr ss:[rsp+30]
sub     rcx,8
mov     rdx,rax
call    oglmdi2_vs2019.13F129A84
nop     
mov     rax,qword ptr ss:[rsp+30]
sub     rax,8
jmp     oglmdi2_vs2019.13F1214F9
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F128D20
nop     
mov     eax,dword ptr ss:[rsp+38]
and     eax,1
test    eax,eax
je      oglmdi2_vs2019.13F1214F4
mov     edx,24
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F129A74
nop     
mov     rax,qword ptr ss:[rsp+30]
add     rsp,28
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,48
xorps   xmm0,xmm0
movss   dword ptr ss:[rsp+30],xmm0
xorps   xmm0,xmm0
movss   dword ptr ss:[rsp+28],xmm0
xorps   xmm0,xmm0
movss   dword ptr ss:[rsp+20],xmm0
xorps   xmm3,xmm3
xorps   xmm2,xmm2
xorps   xmm1,xmm1
mov     rcx,qword ptr ss:[rsp+50]
call    oglmdi2_vs2019.13F129350
add     rsp,48
ret     
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+20],r9
mov     qword ptr ss:[rsp+18],r8
mov     dword ptr ss:[rsp+10],edx
mov     qword ptr ss:[rsp+8],rcx
push    rsi
push    rdi
sub     rsp,B8
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+A0],rax
mov     eax,dword ptr ss:[rsp+D8]
mov     dword ptr ss:[rsp+20],eax
cmp     dword ptr ss:[rsp+20],111
ja      oglmdi2_vs2019.13F1215C4
cmp     dword ptr ss:[rsp+20],111
je      oglmdi2_vs2019.13F122037
cmp     dword ptr ss:[rsp+20],5
je      oglmdi2_vs2019.13F121601
cmp     dword ptr ss:[rsp+20],10
je      oglmdi2_vs2019.13F121E05
cmp     dword ptr ss:[rsp+20],100
je      oglmdi2_vs2019.13F121789
cmp     dword ptr ss:[rsp+20],101
je      oglmdi2_vs2019.13F1217A1
jmp     oglmdi2_vs2019.13F122050
cmp     dword ptr ss:[rsp+20],200
je      oglmdi2_vs2019.13F121833
cmp     dword ptr ss:[rsp+20],201
je      oglmdi2_vs2019.13F1217D5
cmp     dword ptr ss:[rsp+20],202
je      oglmdi2_vs2019.13F121821
cmp     dword ptr ss:[rsp+20],222
je      oglmdi2_vs2019.13F121F80
jmp     oglmdi2_vs2019.13F122050
cmp     qword ptr ss:[rsp+E0],1
je      oglmdi2_vs2019.13F121784
lea     rdx,qword ptr ss:[rsp+78]
mov     rcx,qword ptr ss:[rsp+D0]
call    qword ptr ds:[<&GetClientRect>]
mov     rcx,qword ptr ss:[rsp+D0]
call    qword ptr ds:[<&GetDlgCtrlID>]
sub     eax,C350
mov     dword ptr ss:[rsp+40],eax
movsxd  rax,dword ptr ss:[rsp+40]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],2
jne     oglmdi2_vs2019.13F1216A8
cvtsi2sd xmm0,dword ptr ss:[rsp+84]
movsd   xmm1,qword ptr ds:[13F1409A8]
mulsd   xmm1,xmm0
movaps  xmm0,xmm1
addsd   xmm0,qword ptr ds:[13F140980]
cvtsd2ss xmm0,xmm0
movss   dword ptr ds:[13F14C038],xmm0
cvtsi2sd xmm0,dword ptr ss:[rsp+80]
movsd   xmm1,qword ptr ds:[13F1409A8]
mulsd   xmm1,xmm0
movaps  xmm0,xmm1
addsd   xmm0,qword ptr ds:[13F140980]
cvtsd2ss xmm0,xmm0
movss   dword ptr ds:[13F14C03C],xmm0
movsxd  rax,dword ptr ss:[rsp+40]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],3
jne     oglmdi2_vs2019.13F121716
cvtsi2sd xmm0,dword ptr ss:[rsp+84]
movsd   xmm1,qword ptr ds:[13F140778]
mulsd   xmm1,xmm0
movaps  xmm0,xmm1
subsd   xmm0,qword ptr ds:[13F140980]
cvtsd2ss xmm0,xmm0
movss   dword ptr ds:[13F14C034],xmm0
cvtsi2sd xmm0,dword ptr ss:[rsp+80]
movsd   xmm1,qword ptr ds:[13F1409A8]
mulsd   xmm1,xmm0
movaps  xmm0,xmm1
addsd   xmm0,qword ptr ds:[13F140980]
cvtsd2ss xmm0,xmm0
movss   dword ptr ds:[13F14C03C],xmm0
movsxd  rax,dword ptr ss:[rsp+40]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],4
jne     oglmdi2_vs2019.13F121784
cvtsi2sd xmm0,dword ptr ss:[rsp+80]
movsd   xmm1,qword ptr ds:[13F1409A8]
mulsd   xmm1,xmm0
movaps  xmm0,xmm1
addsd   xmm0,qword ptr ds:[13F140980]
cvtsd2ss xmm0,xmm0
movss   dword ptr ds:[13F14C034],xmm0
cvtsi2sd xmm0,dword ptr ss:[rsp+84]
movsd   xmm1,qword ptr ds:[13F1409A8]
mulsd   xmm1,xmm0
movaps  xmm0,xmm1
addsd   xmm0,qword ptr ds:[13F140980]
cvtsd2ss xmm0,xmm0
movss   dword ptr ds:[13F14C038],xmm0
jmp     oglmdi2_vs2019.13F122050
lea     rax,key ;qword ptr ds:[13F14CC20]
mov     rcx,qword ptr ss:[rsp+E0]
mov     byte ptr ds:[rax+rcx],1
jmp     oglmdi2_vs2019.13F122050
mov     rax,qword ptr ss:[rsp+E0]
mov     qword ptr ss:[rsp+50],rax
cmp     qword ptr ss:[rsp+50],100
jae     oglmdi2_vs2019.13F1217BB
jmp     oglmdi2_vs2019.13F1217C0
call    oglmdi2_vs2019.13F129B94
lea     rax,key ;qword ptr ds:[13F14CC20]
mov     rcx,qword ptr ss:[rsp+50]
mov     byte ptr ds:[rax+rcx],0
jmp     oglmdi2_vs2019.13F122050
mov     byte ptr ds:[13F14CE29],1
mov     rax,qword ptr ss:[rsp+E8]
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ds:[13F14CE48],eax
mov     rax,qword ptr ss:[rsp+E8]
shr     rax,10
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ds:[13F14CE4C],eax
mov     rcx,qword ptr ss:[rsp+D0]
call    qword ptr ds:[<&SetCapture>]
jmp     oglmdi2_vs2019.13F122050
mov     byte ptr ds:[13F14CE29],0
call    qword ptr ds:[<&ReleaseCapture>]
jmp     oglmdi2_vs2019.13F122050
lea     rdx,qword ptr ss:[rsp+68]
mov     rcx,qword ptr ss:[rsp+D0]
call    qword ptr ds:[<&GetClientRect>]
mov     rax,qword ptr ss:[rsp+E8]
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ds:[13F14CE40],eax
mov     rax,qword ptr ss:[rsp+E8]
shr     rax,10
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ds:[13F14CE44],eax
mov     rcx,qword ptr ss:[rsp+D0]
call    qword ptr ds:[<&GetDlgCtrlID>]
sub     eax,C350
mov     dword ptr ss:[rsp+28],eax
movzx   eax,byte ptr ds:[13F14CE29]
test    eax,eax
je      oglmdi2_vs2019.13F121B57
mov     eax,dword ptr ss:[rsp+68]
cmp     dword ptr ds:[13F14CE40],eax
jl      oglmdi2_vs2019.13F1218B6
mov     eax,dword ptr ss:[rsp+70]
cmp     dword ptr ds:[13F14CE40],eax
jle     oglmdi2_vs2019.13F1218C2
mov     eax,dword ptr ds:[13F14CE48]
mov     dword ptr ds:[13F14CE40],eax
mov     eax,dword ptr ss:[rsp+6C]
cmp     dword ptr ds:[13F14CE44],eax
jl      oglmdi2_vs2019.13F1218DA
mov     eax,dword ptr ss:[rsp+74]
cmp     dword ptr ds:[13F14CE44],eax
jle     oglmdi2_vs2019.13F1218E6
mov     eax,dword ptr ds:[13F14CE4C]
mov     dword ptr ds:[13F14CE44],eax
mov     eax,dword ptr ds:[13F14CE48]
mov     ecx,dword ptr ds:[13F14CE40]
sub     ecx,eax
mov     eax,ecx
mov     dword ptr ds:[13F14CE50],eax
mov     eax,dword ptr ds:[13F14CE4C]
mov     ecx,dword ptr ds:[13F14CE44]
sub     ecx,eax
mov     eax,ecx
mov     dword ptr ds:[13F14CE54],eax
mov     eax,dword ptr ds:[13F14CE40]
mov     dword ptr ds:[13F14CE48],eax
mov     eax,dword ptr ds:[13F14CE44]
mov     dword ptr ds:[13F14CE4C],eax
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],2
jne     oglmdi2_vs2019.13F1219E2
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsi2ss xmm0,dword ptr ds:[13F14CE50]
cvtss2sd xmm0,xmm0
mulsd   xmm0,qword ptr ds:[13F140750]
mov     rcx,qword ptr ds:[13F14CE68]
cvtss2sd xmm1,dword ptr ds:[rcx+rax+4]
addsd   xmm1,xmm0
movaps  xmm0,xmm1
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsd2ss xmm0,xmm0
mov     rcx,qword ptr ds:[13F14CE68]
movss   dword ptr ds:[rcx+rax+4],xmm0
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsi2ss xmm0,dword ptr ds:[13F14CE54]
cvtss2sd xmm0,xmm0
mulsd   xmm0,qword ptr ds:[13F140750]
mov     rcx,qword ptr ds:[13F14CE68]
cvtss2sd xmm1,dword ptr ds:[rcx+rax+8]
subsd   xmm1,xmm0
movaps  xmm0,xmm1
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsd2ss xmm0,xmm0
mov     rcx,qword ptr ds:[13F14CE68]
movss   dword ptr ds:[rcx+rax+8],xmm0
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],3
jne     oglmdi2_vs2019.13F121A9A
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsi2ss xmm0,dword ptr ds:[13F14CE50]
cvtss2sd xmm0,xmm0
mulsd   xmm0,qword ptr ds:[13F140750]
mov     rcx,qword ptr ds:[13F14CE68]
cvtss2sd xmm1,dword ptr ds:[rcx+rax+4]
addsd   xmm1,xmm0
movaps  xmm0,xmm1
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsd2ss xmm0,xmm0
mov     rcx,qword ptr ds:[13F14CE68]
movss   dword ptr ds:[rcx+rax+4],xmm0
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsi2ss xmm0,dword ptr ds:[13F14CE54]
cvtss2sd xmm0,xmm0
mulsd   xmm0,qword ptr ds:[13F140750]
mov     rcx,qword ptr ds:[13F14CE68]
cvtss2sd xmm1,dword ptr ds:[rcx+rax+C]
addsd   xmm1,xmm0
movaps  xmm0,xmm1
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsd2ss xmm0,xmm0
mov     rcx,qword ptr ds:[13F14CE68]
movss   dword ptr ds:[rcx+rax+C],xmm0
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],4
jne     oglmdi2_vs2019.13F121B52
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsi2ss xmm0,dword ptr ds:[13F14CE50]
cvtss2sd xmm0,xmm0
mulsd   xmm0,qword ptr ds:[13F140750]
mov     rcx,qword ptr ds:[13F14CE68]
cvtss2sd xmm1,dword ptr ds:[rcx+rax+C]
addsd   xmm1,xmm0
movaps  xmm0,xmm1
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsd2ss xmm0,xmm0
mov     rcx,qword ptr ds:[13F14CE68]
movss   dword ptr ds:[rcx+rax+C],xmm0
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsi2ss xmm0,dword ptr ds:[13F14CE54]
cvtss2sd xmm0,xmm0
mulsd   xmm0,qword ptr ds:[13F140750]
mov     rcx,qword ptr ds:[13F14CE68]
cvtss2sd xmm1,dword ptr ds:[rcx+rax+8]
subsd   xmm1,xmm0
movaps  xmm0,xmm1
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
cvtsd2ss xmm0,xmm0
mov     rcx,qword ptr ds:[13F14CE68]
movss   dword ptr ds:[rcx+rax+8],xmm0
call    SetPolygons ;oglmdi2_vs2019.13F126410
movzx   eax,byte ptr ds:[13F14CE29]
test    eax,eax
jne     oglmdi2_vs2019.13F121E00
mov     rax,qword ptr ss:[rsp+E8]
and     rax,FFFF
movzx   eax,ax
cvtsi2sd xmm0,eax
cvtsi2sd xmm1,dword ptr ss:[rsp+70]
movsd   xmm2,qword ptr ds:[13F1409A8]
mulsd   xmm2,xmm1
movaps  xmm1,xmm2
addsd   xmm0,xmm1
cvttsd2si eax,xmm0
mov     dword ptr ds:[13F14CE40],eax
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],3
jne     oglmdi2_vs2019.13F121BF2
mov     rax,qword ptr ss:[rsp+E8]
shr     rax,10
and     rax,FFFF
movzx   eax,ax
cvtsi2sd xmm0,eax
cvtsi2sd xmm1,dword ptr ss:[rsp+74]
movsd   xmm2,qword ptr ds:[13F1409A8]
mulsd   xmm2,xmm1
movaps  xmm1,xmm2
addsd   xmm0,xmm1
cvttsd2si eax,xmm0
mov     dword ptr ds:[13F14CE44],eax
jmp     oglmdi2_vs2019.13F121C3D
mov     rax,qword ptr ss:[rsp+E8]
shr     rax,10
and     rax,FFFF
movzx   eax,ax
cvtsi2sd xmm0,eax
cvtsi2sd xmm1,dword ptr ss:[rsp+74]
movsd   xmm2,qword ptr ds:[13F1409A8]
mulsd   xmm2,xmm1
movaps  xmm1,xmm2
addsd   xmm0,xmm1
movsd   xmm1,qword ptr ds:[13F1409B0]
mulsd   xmm1,xmm0
movaps  xmm0,xmm1
cvttsd2si eax,xmm0
mov     dword ptr ds:[13F14CE44],eax
mov     dword ptr ds:[13F14C024],2710
mov     dword ptr ss:[rsp+24],0
jmp     oglmdi2_vs2019.13F121C5B
mov     eax,dword ptr ss:[rsp+24]
inc     eax
mov     dword ptr ss:[rsp+24],eax
cmp     dword ptr ss:[rsp+24],8
jge     oglmdi2_vs2019.13F121E00
mov     rcx,qword ptr ss:[rsp+D0]
call    qword ptr ds:[<&GetDlgCtrlID>]
sub     eax,C350
mov     dword ptr ss:[rsp+28],eax
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],2
jne     oglmdi2_vs2019.13F121CDF
cvtsi2ss xmm0,dword ptr ds:[13F14CE40]
movsxd  rax,dword ptr ss:[rsp+24]
imul    rax,rax,24
mov     rcx,qword ptr ds:[13F14CE68]
subss   xmm0,dword ptr ds:[rcx+rax+4]
cvttss2si eax,xmm0
mov     dword ptr ss:[rsp+30],eax
cvtsi2ss xmm0,dword ptr ds:[13F14CE44]
movsxd  rax,dword ptr ss:[rsp+24]
imul    rax,rax,24
mov     rcx,qword ptr ds:[13F14CE68]
subss   xmm0,dword ptr ds:[rcx+rax+8]
cvttss2si eax,xmm0
mov     dword ptr ss:[rsp+34],eax
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],3
jne     oglmdi2_vs2019.13F121D41
cvtsi2ss xmm0,dword ptr ds:[13F14CE40]
movsxd  rax,dword ptr ss:[rsp+24]
imul    rax,rax,24
mov     rcx,qword ptr ds:[13F14CE68]
subss   xmm0,dword ptr ds:[rcx+rax+4]
cvttss2si eax,xmm0
mov     dword ptr ss:[rsp+30],eax
cvtsi2ss xmm0,dword ptr ds:[13F14CE44]
movsxd  rax,dword ptr ss:[rsp+24]
imul    rax,rax,24
mov     rcx,qword ptr ds:[13F14CE68]
subss   xmm0,dword ptr ds:[rcx+rax+C]
cvttss2si eax,xmm0
mov     dword ptr ss:[rsp+34],eax
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],4
jne     oglmdi2_vs2019.13F121DA3
cvtsi2ss xmm0,dword ptr ds:[13F14CE40]
movsxd  rax,dword ptr ss:[rsp+24]
imul    rax,rax,24
mov     rcx,qword ptr ds:[13F14CE68]
subss   xmm0,dword ptr ds:[rcx+rax+C]
cvttss2si eax,xmm0
mov     dword ptr ss:[rsp+30],eax
cvtsi2ss xmm0,dword ptr ds:[13F14CE44]
movsxd  rax,dword ptr ss:[rsp+24]
imul    rax,rax,24
mov     rcx,qword ptr ds:[13F14CE68]
subss   xmm0,dword ptr ds:[rcx+rax+8]
cvttss2si eax,xmm0
mov     dword ptr ss:[rsp+34],eax
mov     eax,dword ptr ss:[rsp+30]
imul    eax,dword ptr ss:[rsp+30]
mov     ecx,dword ptr ss:[rsp+34]
imul    ecx,dword ptr ss:[rsp+34]
add     eax,ecx
mov     ecx,eax
call    oglmdi2_vs2019.13F1212F0
cvtsi2sd xmm1,dword ptr ds:[13F14C024]
comisd  xmm1,xmm0
jbe     oglmdi2_vs2019.13F121DFB
mov     eax,dword ptr ss:[rsp+30]
imul    eax,dword ptr ss:[rsp+30]
mov     ecx,dword ptr ss:[rsp+34]
imul    ecx,dword ptr ss:[rsp+34]
add     eax,ecx
mov     ecx,eax
call    oglmdi2_vs2019.13F1212F0
cvttsd2si eax,xmm0
mov     dword ptr ds:[13F14C024],eax
mov     eax,dword ptr ss:[rsp+24]
mov     dword ptr ds:[13F14CE3C],eax
jmp     oglmdi2_vs2019.13F121C51
jmp     oglmdi2_vs2019.13F122050
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
mov     g_iNumChild ;dword ptr ds:[13F14CE58],eax
cmp     g_iNumChild ;dword ptr ds:[13F14CE58],0
jne     oglmdi2_vs2019.13F121E76
xor     edx,edx
xor     ecx,ecx
call    qword ptr ds:[<&wglMakeCurrent>]
mov     eax,20
imul    rax,rax,0
mov     ecx,20
imul    rcx,rcx,0
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+8]
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+18]
call    qword ptr ds:[<&ReleaseDC>]
mov     eax,20
imul    rax,rax,0
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+10]
call    qword ptr ds:[<&wglDeleteContext>]
jmp     oglmdi2_vs2019.13F121F7B
mov     rcx,qword ptr ss:[rsp+D0]
call    qword ptr ds:[<&GetDlgCtrlID>]
sub     eax,C350
mov     dword ptr ss:[rsp+38],eax
movsxd  rax,dword ptr ss:[rsp+38]
imul    rax,rax,20
movsxd  rcx,dword ptr ss:[rsp+38]
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+8]
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+18]
call    qword ptr ds:[<&ReleaseDC>]
movsxd  rax,dword ptr ss:[rsp+38]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+10]
call    qword ptr ds:[<&wglDeleteContext>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
cmp     dword ptr ss:[rsp+38],eax
je      oglmdi2_vs2019.13F121F7B
mov     eax,dword ptr ss:[rsp+38]
mov     dword ptr ss:[rsp+2C],eax
jmp     oglmdi2_vs2019.13F121EFC
mov     eax,dword ptr ss:[rsp+2C]
inc     eax
mov     dword ptr ss:[rsp+2C],eax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
cmp     dword ptr ss:[rsp+2C],eax
jge     oglmdi2_vs2019.13F121F7B
mov     eax,dword ptr ss:[rsp+2C]
inc     eax
cdqe    
imul    rax,rax,20
movsxd  rcx,dword ptr ss:[rsp+2C]
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     r8,g_child ;qword ptr ds:[13F14CE80]
lea     rdi,qword ptr ds:[rdx+rcx]
lea     rsi,qword ptr ds:[r8+rax]
mov     ecx,20
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     r8d,dword ptr ss:[rsp+2C]
lea     rdx,qword ptr ds:[13F140890]
lea     rcx,qword ptr ss:[rsp+88]
call    oglmdi2_vs2019.13F128970
movsxd  rax,dword ptr ss:[rsp+2C]
imul    rax,rax,20
lea     rdx,qword ptr ss:[rsp+88]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+18]
call    qword ptr ds:[<&SetWindowTextA>]
jmp     oglmdi2_vs2019.13F121EF2
jmp     oglmdi2_vs2019.13F122050
mov     rcx,qword ptr ds:[13F14CC08]
call    qword ptr ds:[<&GetMenu>]
mov     qword ptr ss:[rsp+48],rax
mov     rax,qword ptr ss:[rsp+E8]
cmp     qword ptr ss:[rsp+D0],rax
jne     oglmdi2_vs2019.13F121FAE
mov     dword ptr ss:[rsp+3C],0
jmp     oglmdi2_vs2019.13F121FB6
mov     dword ptr ss:[rsp+3C],1
mov     eax,dword ptr ss:[rsp+3C]
bts     eax,A
mov     r8d,eax
mov     edx,1
mov     rcx,qword ptr ss:[rsp+48]
call    qword ptr ds:[<&EnableMenuItem>]
mov     eax,dword ptr ss:[rsp+3C]
bts     eax,A
mov     r8d,eax
mov     edx,2
mov     rcx,qword ptr ss:[rsp+48]
call    qword ptr ds:[<&EnableMenuItem>]
xor     edx,edx
mov     rcx,qword ptr ss:[rsp+48]
call    qword ptr ds:[<&GetSubMenu>]
mov     qword ptr ss:[rsp+58],rax
mov     r8d,dword ptr ss:[rsp+3C]
mov     edx,2371
mov     rcx,qword ptr ss:[rsp+58]
call    qword ptr ds:[<&EnableMenuItem>]
mov     r8d,dword ptr ss:[rsp+3C]
mov     edx,2372
mov     rcx,qword ptr ss:[rsp+58]
call    qword ptr ds:[<&EnableMenuItem>]
mov     rcx,qword ptr ds:[13F14CC08]
call    qword ptr ds:[<&DrawMenuBar>]
jmp     oglmdi2_vs2019.13F122050
mov     rax,qword ptr ss:[rsp+E0]
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ss:[rsp+60],eax
xor     eax,eax
jmp     oglmdi2_vs2019.13F122075
mov     r9,qword ptr ss:[rsp+E8]
mov     r8,qword ptr ss:[rsp+E0]
mov     edx,dword ptr ss:[rsp+D8]
mov     rcx,qword ptr ss:[rsp+D0]
call    qword ptr ds:[<&DefMDIChildProcA>]
mov     rcx,qword ptr ss:[rsp+A0]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,B8
pop     rdi
pop     rsi
ret     
int3    
mov     qword ptr ss:[rsp+20],r9
mov     qword ptr ss:[rsp+18],r8
mov     dword ptr ss:[rsp+10],edx
mov     qword ptr ss:[rsp+8],rcx
push    rsi
push    rdi
sub     rsp,78
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+68],rax
mov     eax,dword ptr ss:[rsp+98]
mov     dword ptr ss:[rsp+20],eax
cmp     dword ptr ss:[rsp+20],200
ja      oglmdi2_vs2019.13F12210D
cmp     dword ptr ss:[rsp+20],200
je      oglmdi2_vs2019.13F1221D0
cmp     dword ptr ss:[rsp+20],10
je      oglmdi2_vs2019.13F122262
cmp     dword ptr ss:[rsp+20],100
je      oglmdi2_vs2019.13F122138
cmp     dword ptr ss:[rsp+20],101
je      oglmdi2_vs2019.13F122150
cmp     dword ptr ss:[rsp+20],111
je      oglmdi2_vs2019.13F12248B
jmp     oglmdi2_vs2019.13F1224A4
cmp     dword ptr ss:[rsp+20],201
je      oglmdi2_vs2019.13F122184
cmp     dword ptr ss:[rsp+20],202
je      oglmdi2_vs2019.13F122250
cmp     dword ptr ss:[rsp+20],222
je      oglmdi2_vs2019.13F1223D4
jmp     oglmdi2_vs2019.13F1224A4
lea     rax,key ;qword ptr ds:[13F14CC20]
mov     rcx,qword ptr ss:[rsp+A0]
mov     byte ptr ds:[rax+rcx],1
jmp     oglmdi2_vs2019.13F1224A4
mov     rax,qword ptr ss:[rsp+A0]
mov     qword ptr ss:[rsp+38],rax
cmp     qword ptr ss:[rsp+38],100
jae     oglmdi2_vs2019.13F12216A
jmp     oglmdi2_vs2019.13F12216F
call    oglmdi2_vs2019.13F129B94
lea     rax,key ;qword ptr ds:[13F14CC20]
mov     rcx,qword ptr ss:[rsp+38]
mov     byte ptr ds:[rax+rcx],0
jmp     oglmdi2_vs2019.13F1224A4
mov     byte ptr ds:[13F14CE28],1
mov     rax,qword ptr ss:[rsp+A8]
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ds:[13F14CE2C],eax
mov     rax,qword ptr ss:[rsp+A8]
shr     rax,10
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ds:[13F14CE30],eax
mov     rcx,qword ptr ss:[rsp+90]
call    qword ptr ds:[<&SetCapture>]
jmp     oglmdi2_vs2019.13F1224A4
movzx   eax,byte ptr ds:[13F14CE28]
test    eax,eax
je      oglmdi2_vs2019.13F12224B
mov     rax,qword ptr ss:[rsp+A8]
and     rax,FFFF
movzx   eax,ax
sub     eax,dword ptr ds:[13F14CE2C]
mov     dword ptr ds:[13F14CE34],eax
mov     rax,qword ptr ss:[rsp+A8]
shr     rax,10
and     rax,FFFF
movzx   eax,ax
sub     eax,dword ptr ds:[13F14CE30]
mov     dword ptr ds:[13F14CE38],eax
mov     rax,qword ptr ss:[rsp+A8]
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ds:[13F14CE2C],eax
mov     rax,qword ptr ss:[rsp+A8]
shr     rax,10
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ds:[13F14CE30],eax
jmp     oglmdi2_vs2019.13F1224A4
mov     byte ptr ds:[13F14CE28],0
call    qword ptr ds:[<&ReleaseCapture>]
jmp     oglmdi2_vs2019.13F1224A4
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
mov     g_iNumChild ;dword ptr ds:[13F14CE58],eax
cmp     g_iNumChild ;dword ptr ds:[13F14CE58],0
jne     oglmdi2_vs2019.13F1222D3
xor     edx,edx
xor     ecx,ecx
call    qword ptr ds:[<&wglMakeCurrent>]
mov     eax,20
imul    rax,rax,0
mov     ecx,20
imul    rcx,rcx,0
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+8]
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+18]
call    qword ptr ds:[<&ReleaseDC>]
mov     eax,20
imul    rax,rax,0
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+10]
call    qword ptr ds:[<&wglDeleteContext>]
jmp     oglmdi2_vs2019.13F1223CF
mov     rcx,qword ptr ss:[rsp+90]
call    qword ptr ds:[<&GetDlgCtrlID>]
sub     eax,C350
mov     dword ptr ss:[rsp+28],eax
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
movsxd  rcx,dword ptr ss:[rsp+28]
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+8]
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+18]
call    qword ptr ds:[<&ReleaseDC>]
movsxd  rax,dword ptr ss:[rsp+28]
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+10]
call    qword ptr ds:[<&wglDeleteContext>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
cmp     dword ptr ss:[rsp+28],eax
je      oglmdi2_vs2019.13F1223CF
mov     eax,dword ptr ss:[rsp+28]
mov     dword ptr ss:[rsp+24],eax
jmp     oglmdi2_vs2019.13F122359
mov     eax,dword ptr ss:[rsp+24]
inc     eax
mov     dword ptr ss:[rsp+24],eax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
cmp     dword ptr ss:[rsp+24],eax
jge     oglmdi2_vs2019.13F1223CF
mov     eax,dword ptr ss:[rsp+24]
inc     eax
cdqe    
imul    rax,rax,20
movsxd  rcx,dword ptr ss:[rsp+24]
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     r8,g_child ;qword ptr ds:[13F14CE80]
lea     rdi,qword ptr ds:[rdx+rcx]
lea     rsi,qword ptr ds:[r8+rax]
mov     ecx,20
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     r8d,dword ptr ss:[rsp+24]
lea     rdx,qword ptr ds:[13F140834]
lea     rcx,qword ptr ss:[rsp+50]
call    oglmdi2_vs2019.13F128970
movsxd  rax,dword ptr ss:[rsp+24]
imul    rax,rax,20
lea     rdx,qword ptr ss:[rsp+50]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+18]
call    qword ptr ds:[<&SetWindowTextA>]
jmp     oglmdi2_vs2019.13F12234F
jmp     oglmdi2_vs2019.13F1224A4
mov     rcx,qword ptr ds:[13F14CC08]
call    qword ptr ds:[<&GetMenu>]
mov     qword ptr ss:[rsp+30],rax
mov     rax,qword ptr ss:[rsp+A8]
cmp     qword ptr ss:[rsp+90],rax
jne     oglmdi2_vs2019.13F122402
mov     dword ptr ss:[rsp+2C],0
jmp     oglmdi2_vs2019.13F12240A
mov     dword ptr ss:[rsp+2C],1
mov     eax,dword ptr ss:[rsp+2C]
bts     eax,A
mov     r8d,eax
mov     edx,1
mov     rcx,qword ptr ss:[rsp+30]
call    qword ptr ds:[<&EnableMenuItem>]
mov     eax,dword ptr ss:[rsp+2C]
bts     eax,A
mov     r8d,eax
mov     edx,2
mov     rcx,qword ptr ss:[rsp+30]
call    qword ptr ds:[<&EnableMenuItem>]
xor     edx,edx
mov     rcx,qword ptr ss:[rsp+30]
call    qword ptr ds:[<&GetSubMenu>]
mov     qword ptr ss:[rsp+40],rax
mov     r8d,dword ptr ss:[rsp+2C]
mov     edx,2371
mov     rcx,qword ptr ss:[rsp+40]
call    qword ptr ds:[<&EnableMenuItem>]
mov     r8d,dword ptr ss:[rsp+2C]
mov     edx,2372
mov     rcx,qword ptr ss:[rsp+40]
call    qword ptr ds:[<&EnableMenuItem>]
mov     rcx,qword ptr ds:[13F14CC08]
call    qword ptr ds:[<&DrawMenuBar>]
jmp     oglmdi2_vs2019.13F1224A4
mov     rax,qword ptr ss:[rsp+A0]
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ss:[rsp+48],eax
xor     eax,eax
jmp     oglmdi2_vs2019.13F1224C9
mov     r9,qword ptr ss:[rsp+A8]
mov     r8,qword ptr ss:[rsp+A0]
mov     edx,dword ptr ss:[rsp+98]
mov     rcx,qword ptr ss:[rsp+90]
call    qword ptr ds:[<&DefMDIChildProcA>]
mov     rcx,qword ptr ss:[rsp+68]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,78
pop     rdi
pop     rsi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,68
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+50],rax
mov     ecx,4100
call    qword ptr ds:[<&glClear>]
mov     ecx,1700
call    qword ptr ds:[<&glMatrixMode>]
call    qword ptr ds:[<&glLoadIdentity>]
lea     rdx,qword ptr ss:[rsp+20]
mov     rcx,qword ptr ss:[rsp+70]
call    qword ptr ds:[<&GetClientRect>]
mov     ecx,DE1
call    qword ptr ds:[<&glDisable>]
mov     ecx,B50
call    qword ptr ds:[<&glDisable>]
movss   xmm3,dword ptr ds:[13F140748]
xorps   xmm2,xmm2
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glColor4f>]
call    qword ptr ds:[<&glPushMatrix>]
mov     ecx,1
call    qword ptr ds:[<&glBegin>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
call    qword ptr ds:[<&glEnd>]
call    qword ptr ds:[<&glPopMatrix>]
mov     ecx,B50
call    qword ptr ds:[<&glEnable>]
mov     ecx,DE1
call    qword ptr ds:[<&glEnable>]
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+30],xmm0
movss   xmm0,dword ptr ds:[13F140974]
movss   dword ptr ss:[rsp+34],xmm0
movss   xmm0,dword ptr ds:[13F14096C]
movss   dword ptr ss:[rsp+38],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+3C],xmm0
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+40],xmm0
movss   xmm0,dword ptr ds:[13F140974]
movss   dword ptr ss:[rsp+44],xmm0
movss   xmm0,dword ptr ds:[13F14096C]
movss   dword ptr ss:[rsp+48],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+4C],xmm0
lea     r8,qword ptr ss:[rsp+30]
mov     edx,1200
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
lea     r8,qword ptr ss:[rsp+40]
mov     edx,1201
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
mov     ecx,DE1
call    qword ptr ds:[<&glDisable>]
call    qword ptr ds:[<&glPushMatrix>]
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
movsxd  rcx,dword ptr ds:[13F14CE3C]
imul    rcx,rcx,24
movsxd  rdx,dword ptr ds:[13F14CE3C]
imul    rdx,rdx,24
mov     r8,qword ptr ds:[13F14CE68]
movss   xmm2,dword ptr ds:[r8+rax+C]
mov     rax,qword ptr ds:[13F14CE68]
movss   xmm1,dword ptr ds:[rax+rcx+8]
mov     rax,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[rax+rdx+4]
call    qword ptr ds:[<&glTranslatef>]
mov     edx,186B4
mov     rcx,qword ptr ds:[13F14CE78]
call    <oglmdi2_vs2019.gluQuadricOrientation>
mov     r9d,14
mov     r8d,14
movsd   xmm1,qword ptr ds:[13F140980]
mov     rcx,qword ptr ds:[13F14CE78]
call    <oglmdi2_vs2019.gluSphere>
call    qword ptr ds:[<&glPopMatrix>]
mov     ecx,DE1
call    qword ptr ds:[<&glEnable>]
mov     rcx,qword ptr ss:[rsp+50]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,68
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,68
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+50],rax
mov     ecx,4100
call    qword ptr ds:[<&glClear>]
mov     ecx,1700
call    qword ptr ds:[<&glMatrixMode>]
call    qword ptr ds:[<&glLoadIdentity>]
xorps   xmm3,xmm3
movss   xmm2,dword ptr ds:[13F140748]
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F140998]
call    qword ptr ds:[<&glRotatef>]
lea     rdx,qword ptr ss:[rsp+20]
mov     rcx,qword ptr ss:[rsp+70]
call    qword ptr ds:[<&GetClientRect>]
mov     ecx,DE1
call    qword ptr ds:[<&glDisable>]
mov     ecx,B50
call    qword ptr ds:[<&glDisable>]
movss   xmm3,dword ptr ds:[13F140748]
movss   xmm2,dword ptr ds:[13F140748]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glColor4f>]
call    qword ptr ds:[<&glPushMatrix>]
mov     ecx,1
call    qword ptr ds:[<&glBegin>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
call    qword ptr ds:[<&glEnd>]
call    qword ptr ds:[<&glPopMatrix>]
mov     ecx,B50
call    qword ptr ds:[<&glEnable>]
mov     ecx,DE1
call    qword ptr ds:[<&glEnable>]
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+30],xmm0
movss   xmm0,dword ptr ds:[13F140974]
movss   dword ptr ss:[rsp+34],xmm0
movss   xmm0,dword ptr ds:[13F14096C]
movss   dword ptr ss:[rsp+38],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+3C],xmm0
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+40],xmm0
movss   xmm0,dword ptr ds:[13F140974]
movss   dword ptr ss:[rsp+44],xmm0
movss   xmm0,dword ptr ds:[13F14096C]
movss   dword ptr ss:[rsp+48],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+4C],xmm0
lea     r8,qword ptr ss:[rsp+30]
mov     edx,1200
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
lea     r8,qword ptr ss:[rsp+40]
mov     edx,1201
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
mov     ecx,DE1
call    qword ptr ds:[<&glDisable>]
call    qword ptr ds:[<&glPushMatrix>]
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
movsxd  rcx,dword ptr ds:[13F14CE3C]
imul    rcx,rcx,24
movsxd  rdx,dword ptr ds:[13F14CE3C]
imul    rdx,rdx,24
mov     r8,qword ptr ds:[13F14CE68]
movss   xmm2,dword ptr ds:[r8+rax+C]
mov     rax,qword ptr ds:[13F14CE68]
movss   xmm1,dword ptr ds:[rax+rcx+8]
mov     rax,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[rax+rdx+4]
call    qword ptr ds:[<&glTranslatef>]
mov     edx,186B4
mov     rcx,qword ptr ds:[13F14CE78]
call    <oglmdi2_vs2019.gluQuadricOrientation>
mov     r9d,14
mov     r8d,14
movsd   xmm1,qword ptr ds:[13F140980]
mov     rcx,qword ptr ds:[13F14CE78]
call    <oglmdi2_vs2019.gluSphere>
call    qword ptr ds:[<&glPopMatrix>]
mov     ecx,DE1
call    qword ptr ds:[<&glEnable>]
mov     rcx,qword ptr ss:[rsp+50]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,68
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,68
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+50],rax
mov     ecx,4100
call    qword ptr ds:[<&glClear>]
mov     ecx,1700
call    qword ptr ds:[<&glMatrixMode>]
call    qword ptr ds:[<&glLoadIdentity>]
xorps   xmm3,xmm3
xorps   xmm2,xmm2
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140998]
call    qword ptr ds:[<&glRotatef>]
lea     rdx,qword ptr ss:[rsp+20]
mov     rcx,qword ptr ss:[rsp+70]
call    qword ptr ds:[<&GetClientRect>]
mov     ecx,DE1
call    qword ptr ds:[<&glDisable>]
mov     ecx,B50
call    qword ptr ds:[<&glDisable>]
movss   xmm3,dword ptr ds:[13F140748]
xorps   xmm2,xmm2
movss   xmm1,dword ptr ds:[13F140748]
xorps   xmm0,xmm0
call    qword ptr ds:[<&glColor4f>]
call    qword ptr ds:[<&glPushMatrix>]
mov     ecx,1
call    qword ptr ds:[<&glBegin>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
call    qword ptr ds:[<&glEnd>]
call    qword ptr ds:[<&glPopMatrix>]
mov     ecx,B50
call    qword ptr ds:[<&glEnable>]
mov     ecx,DE1
call    qword ptr ds:[<&glEnable>]
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+30],xmm0
movss   xmm0,dword ptr ds:[13F140974]
movss   dword ptr ss:[rsp+34],xmm0
movss   xmm0,dword ptr ds:[13F14096C]
movss   dword ptr ss:[rsp+38],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+3C],xmm0
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+40],xmm0
movss   xmm0,dword ptr ds:[13F140974]
movss   dword ptr ss:[rsp+44],xmm0
movss   xmm0,dword ptr ds:[13F14096C]
movss   dword ptr ss:[rsp+48],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+4C],xmm0
lea     r8,qword ptr ss:[rsp+30]
mov     edx,1200
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
lea     r8,qword ptr ss:[rsp+40]
mov     edx,1201
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
mov     ecx,DE1
call    qword ptr ds:[<&glDisable>]
call    qword ptr ds:[<&glPushMatrix>]
movsxd  rax,dword ptr ds:[13F14CE3C]
imul    rax,rax,24
movsxd  rcx,dword ptr ds:[13F14CE3C]
imul    rcx,rcx,24
movsxd  rdx,dword ptr ds:[13F14CE3C]
imul    rdx,rdx,24
mov     r8,qword ptr ds:[13F14CE68]
movss   xmm2,dword ptr ds:[r8+rax+C]
mov     rax,qword ptr ds:[13F14CE68]
movss   xmm1,dword ptr ds:[rax+rcx+8]
mov     rax,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[rax+rdx+4]
call    qword ptr ds:[<&glTranslatef>]
mov     edx,186B4
mov     rcx,qword ptr ds:[13F14CE78]
call    <oglmdi2_vs2019.gluQuadricOrientation>
mov     r9d,14
mov     r8d,14
movsd   xmm1,qword ptr ds:[13F140980]
mov     rcx,qword ptr ds:[13F14CE78]
call    <oglmdi2_vs2019.gluSphere>
call    qword ptr ds:[<&glPopMatrix>]
mov     ecx,DE1
call    qword ptr ds:[<&glEnable>]
mov     rcx,qword ptr ss:[rsp+50]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,68
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3    
sub     rsp,28
mov     ecx,4100
call    qword ptr ds:[<&glClear>]
mov     ecx,1700
call    qword ptr ds:[<&glMatrixMode>]
call    qword ptr ds:[<&glLoadIdentity>]
movzx   eax,byte ptr ds:[13F14CE28]
test    eax,eax
je      oglmdi2_vs2019.13F1254B9
cvtsi2ss xmm0,dword ptr ds:[13F14CE38]
cvtss2sd xmm0,xmm0
mulsd   xmm0,qword ptr ds:[13F140778]
cvtss2sd xmm1,dword ptr ds:[13F14CB94]
addsd   xmm1,xmm0
movaps  xmm0,xmm1
cvtsd2ss xmm0,xmm0
movss   dword ptr ds:[13F14CB94],xmm0
cvtsi2ss xmm0,dword ptr ds:[13F14CE34]
cvtss2sd xmm0,xmm0
mulsd   xmm0,qword ptr ds:[13F140778]
cvtss2sd xmm1,dword ptr ds:[13F14CBE4]
addsd   xmm1,xmm0
movaps  xmm0,xmm1
cvtsd2ss xmm0,xmm0
movss   dword ptr ds:[13F14CBE4],xmm0
movss   xmm2,dword ptr ds:[13F1409C4]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTranslatef>]
xorps   xmm3,xmm3
xorps   xmm2,xmm2
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F14CB94]
call    qword ptr ds:[<&glRotatef>]
xorps   xmm3,xmm3
movss   xmm2,dword ptr ds:[13F140748]
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F14CBE4]
call    qword ptr ds:[<&glRotatef>]
mov     eax,48
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE60]
mov     edx,dword ptr ds:[rcx+rax+2C]
mov     ecx,DE1
call    qword ptr ds:[<&glBindTexture>]
call    qword ptr ds:[<&glPushMatrix>]
mov     ecx,4
call    qword ptr ds:[<&glBegin>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
xorps   xmm1,xmm1
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+58]
mov     rcx,rax
call    qword ptr ds:[<&glNormal3fv>]
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,0
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
movss   xmm0,dword ptr ds:[13F140748]
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,1
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
movss   xmm1,dword ptr ds:[13F140748]
xorps   xmm0,xmm0
call    qword ptr ds:[<&glTexCoord2f>]
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     ecx,24
imul    rcx,rcx,2
lea     rax,qword ptr ds:[rax+rcx+4C]
mov     rcx,rax
call    qword ptr ds:[<&glVertex3fv>]
call    qword ptr ds:[<&glEnd>]
call    qword ptr ds:[<&glPopMatrix>]
add     rsp,28
ret     
int3    
int3    
int3    
int3    
int3    
int3    
sub     rsp,98
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+88],rax
mov     ecx,405
call    qword ptr ds:[<&glCullFace>]
mov     ecx,B44
call    qword ptr ds:[<&glEnable>]
xorps   xmm3,xmm3
xorps   xmm2,xmm2
xorps   xmm1,xmm1
xorps   xmm0,xmm0
call    qword ptr ds:[<&glClearColor>]
movsd   xmm0,qword ptr ds:[13F140750]
call    qword ptr ds:[<&glClearDepth>]
mov     ecx,201
call    qword ptr ds:[<&glDepthFunc>]
mov     ecx,B71
call    qword ptr ds:[<&glEnable>]
mov     ecx,1D01
call    qword ptr ds:[<&glShadeModel>]
mov     ecx,BA1
call    qword ptr ds:[<&glEnable>]
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+28],xmm0
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+2C],xmm0
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+30],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+34],xmm0
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+38],xmm0
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+3C],xmm0
movss   xmm0,dword ptr ds:[13F140740]
movss   dword ptr ss:[rsp+40],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+44],xmm0
movss   xmm0,dword ptr ds:[13F140744]
movss   dword ptr ss:[rsp+48],xmm0
movss   xmm0,dword ptr ds:[13F140744]
movss   dword ptr ss:[rsp+4C],xmm0
movss   xmm0,dword ptr ds:[13F140744]
movss   dword ptr ss:[rsp+50],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+54],xmm0
xorps   xmm0,xmm0
movss   dword ptr ss:[rsp+58],xmm0
xorps   xmm0,xmm0
movss   dword ptr ss:[rsp+5C],xmm0
xorps   xmm0,xmm0
movss   dword ptr ss:[rsp+60],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+64],xmm0
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ss:[rsp+20],xmm0
lea     r8,qword ptr ss:[rsp+28]
mov     edx,1200
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
lea     r8,qword ptr ss:[rsp+38]
mov     edx,1201
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
lea     r8,qword ptr ss:[rsp+48]
mov     edx,1202
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
lea     r8,qword ptr ss:[rsp+58]
mov     edx,1600
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
lea     r8,qword ptr ss:[rsp+20]
mov     edx,1601
mov     ecx,404
call    qword ptr ds:[<&glMaterialfv>]
movss   xmm0,dword ptr ds:[13F140970]
movss   dword ptr ss:[rsp+68],xmm0
movss   xmm0,dword ptr ds:[13F140970]
movss   dword ptr ss:[rsp+6C],xmm0
movss   xmm0,dword ptr ds:[13F140970]
movss   dword ptr ss:[rsp+70],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+74],xmm0
lea     r8,qword ptr ss:[rsp+68]
mov     edx,1200
mov     ecx,4000
call    qword ptr ds:[<&glLightfv>]
movss   xmm0,dword ptr ds:[13F1409A0]
movss   dword ptr ss:[rsp+78],xmm0
xorps   xmm0,xmm0
movss   dword ptr ss:[rsp+7C],xmm0
xorps   xmm0,xmm0
movss   dword ptr ss:[rsp+80],xmm0
movss   xmm0,dword ptr ds:[13F140748]
movss   dword ptr ss:[rsp+84],xmm0
lea     r8,qword ptr ss:[rsp+78]
mov     edx,1203
mov     ecx,4000
call    qword ptr ds:[<&glLightfv>]
mov     ecx,B50
call    qword ptr ds:[<&glEnable>]
mov     ecx,4000
call    qword ptr ds:[<&glEnable>]
call    oglmdi2_vs2019.13F127050
mov     ecx,DE1
call    qword ptr ds:[<&glEnable>]
mov     rcx,qword ptr ss:[rsp+88]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,98
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
mov     dword ptr ss:[rsp+10],edx
mov     dword ptr ss:[rsp+8],ecx
sub     rsp,48
cmp     dword ptr ss:[rsp+58],0
jne     oglmdi2_vs2019.13F1262DB
mov     dword ptr ss:[rsp+58],1
mov     r9d,dword ptr ss:[rsp+58]
mov     r8d,dword ptr ss:[rsp+50]
xor     edx,edx
xor     ecx,ecx
call    qword ptr ds:[<&glViewport>]
mov     ecx,1701
call    qword ptr ds:[<&glMatrixMode>]
call    qword ptr ds:[<&glLoadIdentity>]
cvtsi2sd xmm0,dword ptr ss:[rsp+58]
mulsd   xmm0,qword ptr ds:[13F140778]
mov     eax,dword ptr ss:[rsp+58]
neg     eax
cvtsi2sd xmm1,eax
mulsd   xmm1,qword ptr ds:[13F140778]
cvtsi2sd xmm2,dword ptr ss:[rsp+50]
mulsd   xmm2,qword ptr ds:[13F140778]
movsd   qword ptr ss:[rsp+30],xmm2
mov     eax,dword ptr ss:[rsp+50]
neg     eax
cvtsi2sd xmm3,eax
mulsd   xmm3,qword ptr ds:[13F140778]
movsd   qword ptr ss:[rsp+38],xmm3
movsd   xmm4,qword ptr ds:[13F140990]
movsd   qword ptr ss:[rsp+28],xmm4
movsd   xmm4,qword ptr ds:[13F1409B8]
movsd   qword ptr ss:[rsp+20],xmm4
movaps  xmm3,xmm0
movaps  xmm2,xmm1
movsd   xmm0,qword ptr ss:[rsp+30]
movaps  xmm1,xmm0
movsd   xmm0,qword ptr ss:[rsp+38]
call    qword ptr ds:[<&glOrtho>]
add     rsp,48
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3    
int3    
mov     dword ptr ss:[rsp+10],edx
mov     dword ptr ss:[rsp+8],ecx
sub     rsp,28
cmp     dword ptr ss:[rsp+38],0
jne     oglmdi2_vs2019.13F1263AB
mov     dword ptr ss:[rsp+38],1
mov     r9d,dword ptr ss:[rsp+38]
mov     r8d,dword ptr ss:[rsp+30]
xor     edx,edx
xor     ecx,ecx
call    qword ptr ds:[<&glViewport>]
mov     ecx,1701
call    qword ptr ds:[<&glMatrixMode>]
call    qword ptr ds:[<&glLoadIdentity>]
cvtsi2ss xmm0,dword ptr ss:[rsp+30]
cvtsi2ss xmm1,dword ptr ss:[rsp+38]
divss   xmm0,xmm1
cvtss2sd xmm0,xmm0
movsd   xmm3,qword ptr ds:[13F140988]
movsd   xmm2,qword ptr ds:[13F140750]
movaps  xmm1,xmm0
movsd   xmm0,qword ptr ds:[13F140758]
call    <oglmdi2_vs2019.gluPerspective>
add     rsp,28
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3











;--------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------
;--------------------------------------    SET POLYGONS     ---------------------------------------
;--------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------










;000000013F126410:
push    rsi
push    rdi
sub     rsp,148
mov     eax,24
imul    rax,rax,0
mov     ecx,B8
imul    rcx,rcx,0
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     r8,qword ptr ds:[13F14CE68]
lea     rdi,qword ptr ds:[rcx+rdx+48]
lea     rsi,qword ptr ds:[r8+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,1
mov     ecx,B8
imul    rcx,rcx,0
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+20],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+20]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,2
mov     ecx,B8
imul    rcx,rcx,0
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+28],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+28]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,0
mov     ecx,B8
imul    rcx,rcx,1
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+30],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+30]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,2
mov     ecx,B8
imul    rcx,rcx,1
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+38],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+38]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,3
mov     ecx,B8
imul    rcx,rcx,1
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+40],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+40]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,5
mov     ecx,B8
imul    rcx,rcx,2
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+48],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+48]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,4
mov     ecx,B8
imul    rcx,rcx,2
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+50],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+50]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,7
mov     ecx,B8
imul    rcx,rcx,2
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+58],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+58]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,5
mov     ecx,B8
imul    rcx,rcx,3
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+60],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+60]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,7
mov     ecx,B8
imul    rcx,rcx,3
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+68],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+68]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,6
mov     ecx,B8
imul    rcx,rcx,3
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+70],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+70]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,4
mov     ecx,B8
imul    rcx,rcx,4
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+78],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+78]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,0
mov     ecx,B8
imul    rcx,rcx,4
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+80],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+80]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,3
mov     ecx,B8
imul    rcx,rcx,4
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+88],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+88]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,4
mov     ecx,B8
imul    rcx,rcx,5
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+90],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+90]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,3
mov     ecx,B8
imul    rcx,rcx,5
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+98],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+98]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,7
mov     ecx,B8
imul    rcx,rcx,5
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+A0],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+A0]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,1
mov     ecx,B8
imul    rcx,rcx,6
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+A8],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+A8]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,5
mov     ecx,B8
imul    rcx,rcx,6
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+B0],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+B0]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,6
mov     ecx,B8
imul    rcx,rcx,6
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+B8],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+B8]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,1
mov     ecx,B8
imul    rcx,rcx,7
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+C0],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+C0]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,6
mov     ecx,B8
imul    rcx,rcx,7
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+C8],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+C8]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,2
mov     ecx,B8
imul    rcx,rcx,7
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+D0],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+D0]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,3
mov     ecx,B8
imul    rcx,rcx,8
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+D8],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+D8]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,2
mov     ecx,B8
imul    rcx,rcx,8
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+E0],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+E0]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,6
mov     ecx,B8
imul    rcx,rcx,8
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+E8],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+E8]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,3
mov     ecx,B8
imul    rcx,rcx,9
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+F0],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+F0]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,6
mov     ecx,B8
imul    rcx,rcx,9
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+F8],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+F8]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,7
mov     ecx,B8
imul    rcx,rcx,9
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+100],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+100]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,5
mov     ecx,B8
imul    rcx,rcx,A
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+108],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+108]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,1
mov     ecx,B8
imul    rcx,rcx,A
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+110],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+110]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,0
mov     ecx,B8
imul    rcx,rcx,A
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+118],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+118]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,5
mov     ecx,B8
imul    rcx,rcx,B
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,0
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+120],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+120]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,0
mov     ecx,B8
imul    rcx,rcx,B
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,1
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+128],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+128]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,24
imul    rax,rax,4
mov     ecx,B8
imul    rcx,rcx,B
mov     rdx,qword ptr ds:[13F14CE70]
add     rdx,rcx
mov     rcx,rdx
mov     edx,24
imul    rdx,rdx,2
mov     rdi,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+130],rdi
lea     rdi,qword ptr ds:[rcx+rdx+48]
mov     rcx,qword ptr ss:[rsp+130]
lea     rsi,qword ptr ds:[rcx+rax]
mov     ecx,24
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     eax,B8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,8
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,9
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,A
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
mov     eax,B8
imul    rax,rax,B
mov     rcx,qword ptr ds:[13F14CE70]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128A60
add     rsp,148
pop     rdi
pop     rsi
ret     
sub     rsp,28
mov     eax,48
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE60]
add     rcx,rax
mov     rax,rcx
lea     r8,qword ptr ds:[13F1407B8]
lea     rdx,qword ptr ds:[13F1407C4]
mov     rcx,rax
call    oglmdi2_vs2019.13F128970
mov     eax,48
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE60]
add     rcx,rax
mov     rax,rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F128D30
add     rsp,28
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











;--------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------
;--------------------------------------    SET VERTICES     ---------------------------------------
;--------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------










;000000013F1270B0:
mov     eax,24
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+4],xmm0
mov     eax,24
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+8],xmm0
mov     eax,24
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+C],xmm0
mov     eax,24
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+4],xmm0
mov     eax,24
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+8],xmm0
mov     eax,24
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+C],xmm0
mov     eax,24
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+4],xmm0
mov     eax,24
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+8],xmm0
mov     eax,24
imul    rax,rax,2
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+C],xmm0
mov     eax,24
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+4],xmm0
mov     eax,24
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+8],xmm0
mov     eax,24
imul    rax,rax,3
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+C],xmm0
mov     eax,24
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+4],xmm0
mov     eax,24
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+8],xmm0
mov     eax,24
imul    rax,rax,4
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+C],xmm0
mov     eax,24
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+4],xmm0
mov     eax,24
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+8],xmm0
mov     eax,24
imul    rax,rax,5
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+C],xmm0
mov     eax,24
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+4],xmm0
mov     eax,24
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+8],xmm0
mov     eax,24
imul    rax,rax,6
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+C],xmm0
mov     eax,24
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+4],xmm0
mov     eax,24
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F14099C]
movss   dword ptr ds:[rcx+rax+8],xmm0
mov     eax,24
imul    rax,rax,7
mov     rcx,qword ptr ds:[13F14CE68]
movss   xmm0,dword ptr ds:[13F1409C0]
movss   dword ptr ds:[rcx+rax+C],xmm0
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
int3    
mov     qword ptr ss:[rsp+20],r9
mov     qword ptr ss:[rsp+18],r8
mov     dword ptr ss:[rsp+10],edx
mov     qword ptr ss:[rsp+8],rcx
push    rsi
push    rdi
sub     rsp,308
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+2F0],rax
mov     eax,dword ptr ss:[rsp+328]
mov     dword ptr ss:[rsp+60],eax
cmp     dword ptr ss:[rsp+60],1
je      oglmdi2_vs2019.13F1273F9
cmp     dword ptr ss:[rsp+60],2
je      oglmdi2_vs2019.13F128169
cmp     dword ptr ss:[rsp+60],10
je      oglmdi2_vs2019.13F128026
cmp     dword ptr ss:[rsp+60],111
je      oglmdi2_vs2019.13F12749A
jmp     oglmdi2_vs2019.13F128173
mov     qword ptr ss:[rsp+E8],0
mov     dword ptr ss:[rsp+F0],C350
lea     rax,qword ptr ss:[rsp+E8]
mov     qword ptr ss:[rsp+58],rax
mov     rax,qword ptr ds:[13F14CBF8]
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+48],1387
mov     rax,qword ptr ss:[rsp+320]
mov     qword ptr ss:[rsp+40],rax
mov     dword ptr ss:[rsp+38],80000000
mov     dword ptr ss:[rsp+30],80000000
mov     dword ptr ss:[rsp+28],80000000
mov     dword ptr ss:[rsp+20],80000000
mov     r9d,46000000
xor     r8d,r8d
lea     rdx,qword ptr ds:[13F1407C8]
mov     ecx,200
call    qword ptr ds:[<&CreateWindowExA>]
mov     g_hMDIClient ;qword ptr ds:[13F14CC00],rax
mov     edx,5
mov     rcx,g_hMDIClient ;qword ptr ds:[13F14CC00]
call    qword ptr ds:[<&ShowWindow>]
xor     eax,eax
jmp     oglmdi2_vs2019.13F1281A9
mov     rax,qword ptr ss:[rsp+330]
and     rax,FFFF
movzx   eax,ax
mov     dword ptr ss:[rsp+64],eax
mov     eax,dword ptr ss:[rsp+64]
sub     eax,236B
mov     dword ptr ss:[rsp+64],eax
cmp     dword ptr ss:[rsp+64],F
ja      oglmdi2_vs2019.13F127F87
movsxd  rax,dword ptr ss:[rsp+64]
lea     rcx,qword ptr ds:[13F120000]
mov     eax,dword ptr ds:[rcx+rax*4+81C4]
add     rax,rcx
jmp     rax
xor     r9d,r9d
xor     r8d,r8d
mov     edx,10
mov     rcx,qword ptr ss:[rsp+320]
call    qword ptr ds:[<&PostMessageA>]
jmp     oglmdi2_vs2019.13F128021
mov     eax,dword ptr ds:[13F14C040]
cmp     g_iNumChild ;dword ptr ds:[13F14CE58],eax
jge     oglmdi2_vs2019.13F12751B
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
inc     eax
mov     g_iNumChild ;dword ptr ds:[13F14CE58],eax
jmp     oglmdi2_vs2019.13F127520
jmp     oglmdi2_vs2019.13F128021
lea     rax,qword ptr ss:[rsp+6C]
lea     rcx,qword ptr ds:[13F1407D4]
mov     rdi,rax
mov     rsi,rcx
mov     ecx,3
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     r8d,50
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+100]
call    oglmdi2_vs2019.13F12B280
lea     rax,qword ptr ss:[rsp+100]
mov     qword ptr ss:[rsp+58],rax
mov     rax,qword ptr ds:[13F14CBF8]
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+48],0
mov     rax,g_hMDIClient ;qword ptr ds:[13F14CC00]
mov     qword ptr ss:[rsp+40],rax
mov     dword ptr ss:[rsp+38],80000000
mov     dword ptr ss:[rsp+30],80000000
mov     dword ptr ss:[rsp+28],80000000
mov     dword ptr ss:[rsp+20],80000000
mov     r9d,50CF0000
lea     r8,qword ptr ss:[rsp+6C]
lea     rdx,qword ptr ds:[13F14C018]
mov     ecx,40
call    qword ptr ds:[<&CreateWindowExA>]
mov     qword ptr ss:[rsp+88],rax
cmp     qword ptr ss:[rsp+88],0
jne     oglmdi2_vs2019.13F1275E8
mov     r9d,30
lea     r8,qword ptr ds:[13F1407D8]
lea     rdx,qword ptr ds:[13F1407E0]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     dword ptr ds:[rcx+rax],1
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ss:[rsp+88]
mov     qword ptr ds:[rcx+rax+18],rdx
mov     rcx,qword ptr ss:[rsp+88]
call    qword ptr ds:[<&GetDC>]
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ds:[rdx+rcx+8],rax
mov     r8d,28
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+240]
call    oglmdi2_vs2019.13F12B280
mov     eax,28
mov     word ptr ss:[rsp+240],ax
mov     eax,1
mov     word ptr ss:[rsp+242],ax
mov     dword ptr ss:[rsp+244],25
mov     byte ptr ss:[rsp+248],0
mov     byte ptr ss:[rsp+249],18
mov     byte ptr ss:[rsp+257],10
mov     byte ptr ss:[rsp+25A],0
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
lea     rdx,qword ptr ss:[rsp+240]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&ChoosePixelFormat>]
mov     dword ptr ss:[rsp+70],eax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
lea     r8,qword ptr ss:[rsp+240]
mov     edx,dword ptr ss:[rsp+70]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&SetPixelFormat>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&wglCreateContext>]
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ds:[rdx+rcx+10],rax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+10]
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+8]
call    qword ptr ds:[<&wglMakeCurrent>]
call    oglmdi2_vs2019.13F126020
jmp     oglmdi2_vs2019.13F128021
mov     eax,dword ptr ds:[13F14C040]
cmp     g_iNumChild ;dword ptr ds:[13F14CE58],eax
jge     oglmdi2_vs2019.13F12779F
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
inc     eax
mov     g_iNumChild ;dword ptr ds:[13F14CE58],eax
jmp     oglmdi2_vs2019.13F1277A4
jmp     oglmdi2_vs2019.13F128021
lea     rax,qword ptr ss:[rsp+2E8]
lea     rcx,qword ptr ds:[13F1407FC]
mov     rdi,rax
mov     rsi,rcx
mov     ecx,6
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     r8d,50
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+150]
call    oglmdi2_vs2019.13F12B280
lea     rax,qword ptr ss:[rsp+150]
mov     qword ptr ss:[rsp+58],rax
mov     rax,qword ptr ds:[13F14CBF8]
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+48],0
mov     rax,g_hMDIClient ;qword ptr ds:[13F14CC00]
mov     qword ptr ss:[rsp+40],rax
mov     dword ptr ss:[rsp+38],80000000
mov     dword ptr ss:[rsp+30],80000000
mov     dword ptr ss:[rsp+28],80000000
mov     dword ptr ss:[rsp+20],80000000
mov     r9d,50CF0000
lea     r8,qword ptr ss:[rsp+2E8]
lea     rdx,qword ptr ds:[13F14C028]
mov     ecx,40
call    qword ptr ds:[<&CreateWindowExA>]
mov     qword ptr ss:[rsp+90],rax
cmp     qword ptr ss:[rsp+90],0
jne     oglmdi2_vs2019.13F127872
mov     r9d,30
lea     r8,qword ptr ds:[13F140804]
lea     rdx,qword ptr ds:[13F140810]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     dword ptr ds:[rcx+rax],2
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ss:[rsp+90]
mov     qword ptr ds:[rcx+rax+18],rdx
mov     rcx,qword ptr ss:[rsp+90]
call    qword ptr ds:[<&GetDC>]
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ds:[rdx+rcx+8],rax
mov     r8d,28
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+268]
call    oglmdi2_vs2019.13F12B280
mov     eax,28
mov     word ptr ss:[rsp+268],ax
mov     eax,1
mov     word ptr ss:[rsp+26A],ax
mov     dword ptr ss:[rsp+26C],25
mov     byte ptr ss:[rsp+270],0
mov     byte ptr ss:[rsp+271],18
mov     byte ptr ss:[rsp+27F],10
mov     byte ptr ss:[rsp+282],0
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
lea     rdx,qword ptr ss:[rsp+268]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&ChoosePixelFormat>]
mov     dword ptr ss:[rsp+74],eax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
lea     r8,qword ptr ss:[rsp+268]
mov     edx,dword ptr ss:[rsp+74]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&SetPixelFormat>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&wglCreateContext>]
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ds:[rdx+rcx+10],rax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+10]
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+8]
call    qword ptr ds:[<&wglMakeCurrent>]
call    oglmdi2_vs2019.13F126020
jmp     oglmdi2_vs2019.13F128021
mov     eax,dword ptr ds:[13F14C040]
cmp     g_iNumChild ;dword ptr ds:[13F14CE58],eax
jge     oglmdi2_vs2019.13F127A29
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
inc     eax
mov     g_iNumChild ;dword ptr ds:[13F14CE58],eax
jmp     oglmdi2_vs2019.13F127A2E
jmp     oglmdi2_vs2019.13F128021
mov     eax,dword ptr ds:[13F14080C]
mov     dword ptr ss:[rsp+78],eax
mov     r8d,50
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+1A0]
call    oglmdi2_vs2019.13F12B280
lea     rax,qword ptr ss:[rsp+1A0]
mov     qword ptr ss:[rsp+58],rax
mov     rax,qword ptr ds:[13F14CBF8]
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+48],0
mov     rax,g_hMDIClient ;qword ptr ds:[13F14CC00]
mov     qword ptr ss:[rsp+40],rax
mov     dword ptr ss:[rsp+38],80000000
mov     dword ptr ss:[rsp+30],80000000
mov     dword ptr ss:[rsp+28],80000000
mov     dword ptr ss:[rsp+20],80000000
mov     r9d,50CF0000
lea     r8,qword ptr ss:[rsp+78]
lea     rdx,qword ptr ds:[13F14C028]
mov     ecx,40
call    qword ptr ds:[<&CreateWindowExA>]
mov     qword ptr ss:[rsp+98],rax
cmp     qword ptr ss:[rsp+98],0
jne     oglmdi2_vs2019.13F127AE7
mov     r9d,30
lea     r8,qword ptr ds:[13F14082C]
lea     rdx,qword ptr ds:[13F140838]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     dword ptr ds:[rcx+rax],3
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ss:[rsp+98]
mov     qword ptr ds:[rcx+rax+18],rdx
mov     rcx,qword ptr ss:[rsp+98]
call    qword ptr ds:[<&GetDC>]
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ds:[rdx+rcx+8],rax
mov     r8d,28
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+290]
call    oglmdi2_vs2019.13F12B280
mov     eax,28
mov     word ptr ss:[rsp+290],ax
mov     eax,1
mov     word ptr ss:[rsp+292],ax
mov     dword ptr ss:[rsp+294],25
mov     byte ptr ss:[rsp+298],0
mov     byte ptr ss:[rsp+299],18
mov     byte ptr ss:[rsp+2A7],10
mov     byte ptr ss:[rsp+2AA],0
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
lea     rdx,qword ptr ss:[rsp+290]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&ChoosePixelFormat>]
mov     dword ptr ss:[rsp+7C],eax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
lea     r8,qword ptr ss:[rsp+290]
mov     edx,dword ptr ss:[rsp+7C]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&SetPixelFormat>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&wglCreateContext>]
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ds:[rdx+rcx+10],rax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+10]
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+8]
call    qword ptr ds:[<&wglMakeCurrent>]
call    oglmdi2_vs2019.13F126020
jmp     oglmdi2_vs2019.13F128021
mov     eax,dword ptr ds:[13F14C040]
cmp     g_iNumChild ;dword ptr ds:[13F14CE58],eax
jge     oglmdi2_vs2019.13F127C9E
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
inc     eax
mov     g_iNumChild ;dword ptr ds:[13F14CE58],eax
jmp     oglmdi2_vs2019.13F127CA3
jmp     oglmdi2_vs2019.13F128021
lea     rax,qword ptr ss:[rsp+2E0]
lea     rcx,qword ptr ds:[13F140854]
mov     rdi,rax
mov     rsi,rcx
mov     ecx,5
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
mov     r8d,50
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+1F0]
call    oglmdi2_vs2019.13F12B280
lea     rax,qword ptr ss:[rsp+1F0]
mov     qword ptr ss:[rsp+58],rax
mov     rax,qword ptr ds:[13F14CBF8]
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+48],0
mov     rax,g_hMDIClient ;qword ptr ds:[13F14CC00]
mov     qword ptr ss:[rsp+40],rax
mov     dword ptr ss:[rsp+38],80000000
mov     dword ptr ss:[rsp+30],80000000
mov     dword ptr ss:[rsp+28],80000000
mov     dword ptr ss:[rsp+20],80000000
mov     r9d,50CF0000
lea     r8,qword ptr ss:[rsp+2E0]
lea     rdx,qword ptr ds:[13F14C028]
mov     ecx,40
call    qword ptr ds:[<&CreateWindowExA>]
mov     qword ptr ss:[rsp+A0],rax
cmp     qword ptr ss:[rsp+A0],0
jne     oglmdi2_vs2019.13F127D71
mov     r9d,30
lea     r8,qword ptr ds:[13F14085C]
lea     rdx,qword ptr ds:[13F140868]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     dword ptr ds:[rcx+rax],4
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ss:[rsp+A0]
mov     qword ptr ds:[rcx+rax+18],rdx
mov     rcx,qword ptr ss:[rsp+A0]
call    qword ptr ds:[<&GetDC>]
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ds:[rdx+rcx+8],rax
mov     r8d,28
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+2B8]
call    oglmdi2_vs2019.13F12B280
mov     eax,28
mov     word ptr ss:[rsp+2B8],ax
mov     eax,1
mov     word ptr ss:[rsp+2BA],ax
mov     dword ptr ss:[rsp+2BC],25
mov     byte ptr ss:[rsp+2C0],0
mov     byte ptr ss:[rsp+2C1],18
mov     byte ptr ss:[rsp+2CF],10
mov     byte ptr ss:[rsp+2D2],0
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
lea     rdx,qword ptr ss:[rsp+2B8]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&ChoosePixelFormat>]
mov     dword ptr ss:[rsp+80],eax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
lea     r8,qword ptr ss:[rsp+2B8]
mov     edx,dword ptr ss:[rsp+80]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&SetPixelFormat>]
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8]
call    qword ptr ds:[<&wglCreateContext>]
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ds:[rdx+rcx+10],rax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     eax
cdqe    
imul    rax,rax,20
mov     ecx,g_iNumChild ;dword ptr ds:[13F14CE58]
dec     ecx
movsxd  rcx,ecx
imul    rcx,rcx,20
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+10]
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+8]
call    qword ptr ds:[<&wglMakeCurrent>]
call    oglmdi2_vs2019.13F126020
jmp     oglmdi2_vs2019.13F128021
xor     r9d,r9d
mov     r8d,1
mov     edx,226
mov     rcx,g_hMDIClient ;qword ptr ds:[13F14CC00]
call    qword ptr ds:[<&PostMessageA>]
jmp     oglmdi2_vs2019.13F128021
xor     r9d,r9d
xor     r8d,r8d
mov     edx,226
mov     rcx,g_hMDIClient ;qword ptr ds:[13F14CC00]
call    qword ptr ds:[<&PostMessageA>]
jmp     oglmdi2_vs2019.13F128021
xor     r9d,r9d
xor     r8d,r8d
mov     edx,227
mov     rcx,g_hMDIClient ;qword ptr ds:[13F14CC00]
call    qword ptr ds:[<&PostMessageA>]
jmp     oglmdi2_vs2019.13F128021
xor     r9d,r9d
xor     r8d,r8d
mov     edx,228
mov     rcx,g_hMDIClient ;qword ptr ds:[13F14CC00]
call    qword ptr ds:[<&PostMessageA>]
jmp     oglmdi2_vs2019.13F128021
mov     rax,qword ptr ss:[rsp+330]
and     rax,FFFF
movzx   eax,ax
cmp     eax,C350
jl      oglmdi2_vs2019.13F127FD3
mov     rax,qword ptr ss:[rsp+338]
mov     qword ptr ss:[rsp+20],rax
mov     r9,qword ptr ss:[rsp+330]
mov     r8d,dword ptr ss:[rsp+328]
mov     rdx,g_hMDIClient ;qword ptr ds:[13F14CC00]
mov     rcx,qword ptr ss:[rsp+320]
call    qword ptr ds:[<&DefFrameProcA>]
jmp     oglmdi2_vs2019.13F128021
xor     r9d,r9d
xor     r8d,r8d
mov     edx,229
mov     rcx,g_hMDIClient ;qword ptr ds:[13F14CC00]
call    qword ptr ds:[<&SendMessageA>]
mov     qword ptr ss:[rsp+A8],rax
cmp     qword ptr ss:[rsp+A8],0
je      oglmdi2_vs2019.13F128021
mov     r9,qword ptr ss:[rsp+338]
mov     r8,qword ptr ss:[rsp+330]
mov     edx,111
mov     rcx,qword ptr ss:[rsp+A8]
call    qword ptr ds:[<&SendMessageA>]
jmp     oglmdi2_vs2019.13F1281A7
cmp     g_iNumChild ;dword ptr ds:[13F14CE58],0
je      oglmdi2_vs2019.13F128077
mov     dword ptr ss:[rsp+68],0
jmp     oglmdi2_vs2019.13F128043
mov     eax,dword ptr ss:[rsp+68]
inc     eax
mov     dword ptr ss:[rsp+68],eax
mov     eax,g_iNumChild ;dword ptr ds:[13F14CE58]
cmp     dword ptr ss:[rsp+68],eax
jge     oglmdi2_vs2019.13F128077
movsxd  rax,dword ptr ss:[rsp+68]
imul    rax,rax,20
xor     r9d,r9d
xor     r8d,r8d
mov     edx,10
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+18]
call    qword ptr ds:[<&SendMessageA>]
jmp     oglmdi2_vs2019.13F128039
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     qword ptr ss:[rsp+C8],rax
mov     rcx,qword ptr ss:[rsp+C8]
call    oglmdi2_vs2019.13F129A74
mov     rax,qword ptr ds:[13F14CE60]
mov     qword ptr ss:[rsp+B0],rax
cmp     qword ptr ss:[rsp+B0],0
je      oglmdi2_vs2019.13F1280C9
mov     edx,3
mov     rcx,qword ptr ss:[rsp+B0]
call    oglmdi2_vs2019.13F1213C0
mov     qword ptr ss:[rsp+D0],rax
jmp     oglmdi2_vs2019.13F1280D5
mov     qword ptr ss:[rsp+D0],0
mov     rax,qword ptr ds:[13F14CE68]
mov     qword ptr ss:[rsp+B8],rax
cmp     qword ptr ss:[rsp+B8],0
je      oglmdi2_vs2019.13F12810B
mov     edx,3
mov     rcx,qword ptr ss:[rsp+B8]
call    oglmdi2_vs2019.13F121460
mov     qword ptr ss:[rsp+D8],rax
jmp     oglmdi2_vs2019.13F128117
mov     qword ptr ss:[rsp+D8],0
mov     rax,qword ptr ds:[13F14CE70]
mov     qword ptr ss:[rsp+C0],rax
cmp     qword ptr ss:[rsp+C0],0
je      oglmdi2_vs2019.13F12814D
mov     edx,3
mov     rcx,qword ptr ss:[rsp+C0]
call    oglmdi2_vs2019.13F121310
mov     qword ptr ss:[rsp+E0],rax
jmp     oglmdi2_vs2019.13F128159
mov     qword ptr ss:[rsp+E0],0
mov     rcx,qword ptr ss:[rsp+320]
call    qword ptr ds:[<&DestroyWindow>]
jmp     oglmdi2_vs2019.13F1281A7
xor     ecx,ecx
call    qword ptr ds:[<&PostQuitMessage>]
jmp     oglmdi2_vs2019.13F1281A7
mov     rax,qword ptr ss:[rsp+338]
mov     qword ptr ss:[rsp+20],rax
mov     r9,qword ptr ss:[rsp+330]
mov     r8d,dword ptr ss:[rsp+328]
mov     rdx,g_hMDIClient ;qword ptr ds:[13F14CC00]
mov     rcx,qword ptr ss:[rsp+320]
call    qword ptr ds:[<&DefFrameProcA>]
jmp     oglmdi2_vs2019.13F1281A9
xor     eax,eax
mov     rcx,qword ptr ss:[rsp+2F0]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,308
pop     rdi
pop     rsi
ret     
nop     
std     
je      oglmdi2_vs2019.13F1281C7
add     byte ptr ds:[rcx+B000077],al
jp      oglmdi2_vs2019.13F1281CF
add     byte ptr ds:[rax-20FFFF84],al
je      oglmdi2_vs2019.13F1281D7
add     byte ptr ds:[rdi-78FFFF81],al
jg      oglmdi2_vs2019.13F1281DF
add     byte ptr ds:[rdi-78FFFF81],al
jg      oglmdi2_vs2019.13F1281E7
add     byte ptr ds:[rdi-78FFFF81],al
jg      oglmdi2_vs2019.13F1281EF
add     byte ptr ds:[rdi+4D00007F],al
jg      oglmdi2_vs2019.13F1281F7
add     byte ptr ds:[rdx+7F],ch
add     byte ptr ds:[rax],al
xor     byte ptr ds:[rdi],bh
add     byte ptr ds:[rax],dl
jg      oglmdi2_vs2019.13F128203
add     ah,cl




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







;--------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------
;int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int nCmdShow)---------------------------
;--------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------

mov     qword ptr ss:[rsp+8],rcx
mov     qword ptr ss:[rsp+10],rdx ;rdx:EntryPoint
mov     qword ptr ss:[rsp+18],r8
mov     dword ptr ss:[rsp+20],r9d

sub     rsp,F8

mov     rax,hInstance ;qword ptr ss:[rsp+100] ;[rsp+8+0F8h]
mov     g_hInst,rax ;qword ptr ds:[13F14CBF8]


mov     dword ptr ss:[rsp+70],50h
mov     dword ptr ss:[rsp+74],2Bh
lea     rax,Child3DWndProc ;qword ptr ds:[13F122090]
mov     qword ptr ss:[rsp+78],rax
mov     dword ptr ss:[rsp+80],0
mov     dword ptr ss:[rsp+84],0
mov     rax,hInstance
mov     qword ptr ss:[rsp+88],rax

mov     rcx,hInstance
mov     edx,69h
call    qword ptr ds:[<&LoadIconA>]
mov     qword ptr ss:[rsp+90],rax

xor     ecx,ecx
mov     edx,7F00h
call    qword ptr ds:[<&LoadCursorA>]
mov     qword ptr ss:[rsp+98],rax

mov     qword ptr ss:[rsp+A0],11h
mov     qword ptr ss:[rsp+A8],0
lea     rax,qword ptr ds:[13F14C018]
mov     qword ptr ss:[rsp+B0],rax

mov     rcx,hInstance
mov     edx,69h
call    qword ptr ds:[<&LoadIconA>]
mov     qword ptr ss:[rsp+B8],rax

lea     rcx,wc ;qword ptr ss:[rsp+70]
call    qword ptr ds:[<&RegisterClassExA>]
movzx   eax,ax
test    eax,eax
jne     oglmdi2_vs2019.13F128323

xor     ecx,ecx
lea     rdx,qword ptr ds:[13F1408A0]
lea     r8,qword ptr ds:[13F140894]
mov     r9d,30h
call    qword ptr ds:[<&MessageBoxA>]
xor     eax,eax
jmp     oglmdi2_vs2019.13F12890C


mov     dword ptr ss:[rsp+70],50
mov     dword ptr ss:[rsp+74],2B
lea     rax,Child2DWndProc ;qword ptr ds:[13F121540]
mov     qword ptr ss:[rsp+78],rax
mov     dword ptr ss:[rsp+80],0
mov     dword ptr ss:[rsp+84],0
mov     rax,hInstance
mov     qword ptr ss:[rsp+88],rax

mov     edx,69
mov     rcx,hInstance
call    qword ptr ds:[<&LoadIconA>]
mov     qword ptr ss:[rsp+90],rax

mov     edx,7F00
xor     ecx,ecx
call    qword ptr ds:[<&LoadCursorA>]
mov     qword ptr ss:[rsp+98],rax
mov     qword ptr ss:[rsp+A0],11
mov     qword ptr ss:[rsp+A8],0
lea     rax,g_szChild2DClassName ;qword ptr ds:[13F14C028]
mov     qword ptr ss:[rsp+B0],rax

mov     edx,69
mov     rcx,hInstance
call    qword ptr ds:[<&LoadIconA>]
mov     qword ptr ss:[rsp+B8],rax

lea     rcx,wc ;qword ptr ss:[rsp+70]
call    qword ptr ds:[<&RegisterClassExA>]
movzx   eax,ax
test    eax,eax
jne     oglmdi2_vs2019.13F12840C

mov     r9d,30
lea     r8,qword ptr ds:[13F1408C8]
lea     rdx,qword ptr ds:[13F1408D0]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
xor     eax,eax
jmp     oglmdi2_vs2019.13F12890C



mov     dword ptr ss:[rsp+70],50
mov     dword ptr ss:[rsp+74],3
lea     rax,WndProc ;qword ptr ds:[13F127390]
mov     qword ptr ss:[rsp+78],rax
mov     dword ptr ss:[rsp+80],0
mov     dword ptr ss:[rsp+84],0
mov     rax,hInstance
mov     qword ptr ss:[rsp+88],rax

mov     edx,68
mov     rcx,hInstance
call    qword ptr ds:[<&LoadIconA>]
mov     qword ptr ss:[rsp+90],rax

mov     edx,7F00
xor     ecx,ecx
call    qword ptr ds:[<&LoadCursorA>]
mov     qword ptr ss:[rsp+98],rax

mov     qword ptr ss:[rsp+A0],11

lea     rax,szMainMenuName ;qword ptr ds:[13F1408F8]
mov     qword ptr ss:[rsp+A8],rax

lea     rax,g_szMainClassName ;qword ptr ds:[13F14C008]
mov     qword ptr ss:[rsp+B0],rax

mov     edx,68
mov     rcx,hInstance
call    qword ptr ds:[<&LoadIconA>]
mov     qword ptr ss:[rsp+B8],rax
lea     rcx,qword ptr ss:[rsp+70]
call    qword ptr ds:[<&RegisterClassExA>]
movzx   eax,ax
test    eax,eax
jne     oglmdi2_vs2019.13F1284FB
mov     r9d,30
lea     r8,qword ptr ds:[13F140900]
lea     rdx,qword ptr ds:[13F140908]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F12890C





mov     qword ptr ss:[rsp+58],0
mov     rax,hInstance
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+48],0
mov     qword ptr ss:[rsp+40],0
mov     dword ptr ss:[rsp+38],80000000
mov     dword ptr ss:[rsp+30],80000000
mov     dword ptr ss:[rsp+28],80000000
mov     dword ptr ss:[rsp+20],80000000
mov     r9d,2CF0000
lea     r8,qword ptr ds:[13F140930]
lea     rdx,qword ptr ds:[13F14C008]
xor     ecx,ecx
call    qword ptr ds:[<&CreateWindowExA>]
mov     qword ptr ds:[13F14CC08],rax





cmp     qword ptr ds:[13F14CC08],0
jne     oglmdi2_vs2019.13F128596
mov     r9d,30
lea     r8,qword ptr ds:[13F140948]
lea     rdx,qword ptr ds:[13F140950]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F12890C



mov     edx,nCmdShow ;dword ptr ss:[rsp+118]
mov     rcx,qword ptr ds:[13F14CC08]
call    qword ptr ds:[<&ShowWindow>]

mov     rcx,qword ptr ds:[13F14CC08]
call    qword ptr ds:[<&UpdateWindow>]



call    SetVertices ;oglmdi2_vs2019.13F1270B0 ;SetVertices
call    SetPolygons ;oglmdi2_vs2019.13F126410 ;SetPolygons











;--------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------
;--------------------------------------    MAIN LOOP     ------------------------------------------
;--------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------

lblMainLoop: ;13F1285C1
xor     r9d,r9d
xor     r8d,r8d
xor     edx,edx
lea     rcx,Msg
call    qword ptr ds:[<&GetMessageA>]
test    eax,eax
je      endLoop ;oglmdi2_vs2019.13F128905

lea     rdx,Msg
mov     rcx,g_hMDIClient ;qword ptr ds:[13F14CC00]
call    qword ptr ds:[<&TranslateMDISysAccel>]
test    eax,eax
jne     lblCheckChildren ;oglmdi2_vs2019.13F128614

lea     rcx,Msg
call    qword ptr ds:[<&TranslateMessage>]
lea     rcx,Msg
call    qword ptr ds:[<&DispatchMessageA>]



lblCheckChildren: ;13F128614
cmp     g_iNumChild,0 ;dword ptr ds:[13F14CE58]
je      lblMainLoop ;oglmdi2_vs2019.13F128900

lblResetChildNum: ;13F128621
mov     iLoop,0
jmp     lblCheckChildNum ;oglmdi2_vs2019.13F128635

lblIncChildNum: ;13F12862B
mov     rax,iLoop
inc     rax
mov     iLoop,rax

lblCheckChildNum: ;13F128635
mov     rax,g_iNumChild ;dword ptr ds:[13F14CE58]
cmp     iLoop,rax
jge     lblMainLoop ;oglmdi2_vs2019.13F128900

lblCheckMinimized: ;13F128645
movsxd  rax,iLoop
imul    rax,rax,20h
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+18] ;hWnd
call    qword ptr ds:[<&IsIconic>]
test    eax,eax
jne     lblIncChildNum ;oglmdi2_vs2019.13F1288FB

movsxd  rax,iLoop
imul    rax,rax,20h
movsxd  rcx,iLoop
imul    rcx,rcx,20h
mov     rdx,g_child ;qword ptr ds:[13F14CE80]
mov     rdx,qword ptr ds:[rdx+rax+10] ;hRC
mov     rax,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rax+rcx+8] ;hDC
call    qword ptr ds:[<&wglMakeCurrent>]

movsxd  rax,iLoop
imul    rax,rax,20h
lea     rdx,g_rectChild ;qword ptr ds:[13F14CC10]
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+18]
call    qword ptr ds:[<&GetClientRect>]

cmp     g_rectChild.right,0 ;dword ptr ds:[13F14CC18]
jle     lblFlush ;oglmdi2_vs2019.13F128796

cmp     g_rectChild.bottom,0 ;dword ptr ds:[13F14CC1C]
jle     lblFlush ;oglmdi2_vs2019.13F128796

movsxd  rax,iLoop
imul    rax,rax,20h
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
cmp     dword ptr ds:[rcx+rax],1
jne     oglmdi2_vs2019.13F128705

mov     edx,g_rectChild.bottom ;dword ptr ds:[13F14CC1C]
mov     ecx,g_rectChild.right ;dword ptr ds:[13F14CC18]
call    Set3DProjection ;oglmdi2_vs2019.13F126390

call    Draw3DScene ;oglmdi2_vs2019.13F125430

jmp     lblFlush ;oglmdi2_vs2019.13F128796



mov     edx,g_rectChild.bottom ;dword ptr ds:[13F14CC1C]
mov     ecx,g_rectChild.right ;dword ptr ds:[13F14CC18]
call    Set2DProjection ;oglmdi2_vs2019.13F12877C



movsxd  rax,iLoop
imul    rax,rax,20h
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     eax,dword ptr ds:[rcx+rax] ;g_child[iLoop]
mov     dword ptr ss:[rsp+64],eax ;g_child[iLoop].iType

cmp     dword ptr ss:[rsp+64],2
je      lblCaseFront ;oglmdi2_vs2019.13F128744

cmp     dword ptr ss:[rsp+64],3
je      lblCaseTop ;oglmdi2_vs2019.13F128760

cmp     dword ptr ss:[rsp+64],4
je      lblCaseLeft ;oglmdi2_vs2019.13F12877C

jmp     lblFlush ;oglmdi2_vs2019.13F128796

lblCaseFront: ;13F128744
movsxd  rax,iLoop
imul    rax,rax,20h
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+18] ;g_child[iLoop].hWnd
call    Draw2DSceneFront ;oglmdi2_vs2019.13F1224E0
jmp     lblFlush ;oglmdi2_vs2019.13F128796

lblCaseTop: ;13F128760
movsxd  rax,iLoop
imul    rax,rax,20h
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+18] ;g_child[iLoop].hWnd
call    Draw2DSceneTop ;oglmdi2_vs2019.13F124460
jmp     lblFlush ;oglmdi2_vs2019.13F128796

lblCaseLeft: ;13F12877C
movsxd  rax,iLoop
imul    rax,rax,20h
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+18] ;g_child[iLoop].hWnd
call    Draw2DSceneLeft ;oglmdi2_vs2019.13F123490


lblFlush: ;13F128796
call    qword ptr ds:[<&glFlush>]

movsxd  rax,iLoop
imul    rax,rax,20h
mov     rcx,g_child ;qword ptr ds:[13F14CE80]
mov     rcx,qword ptr ds:[rcx+rax+8] ;g_child[iLoop].hDC
call    qword ptr ds:[<&SwapBuffers>]


lblKey1: ;13F1287B7
mov     eax,1
imul    rax,rax,31h ;key[49] ;1 key
lea     rcx,key ;qword ptr ds:[13F14CC20]
movzx   eax,byte ptr ds:[rcx+rax] ;key[49]
test    eax,eax
je      lblKey2 ;oglmdi2_vs2019.13F1287FC

movss   xmm0,1.0f ;dword ptr ds:[13F140748]
comiss  xmm0,Zoom ;xmmword ptr ds:[13F14C004]
jbe     lblKey2 ;oglmdi2_vs2019.13F1287FC

cvtss2sd xmm0,Zoom ;xmmword ptr ds:[13F14C004]
addsd   xmm0,0.001f ;qword ptr ds:[13F140978]
cvtsd2ss xmm0,xmm0
movss   Zoom,xmm0 ;xmmword ptr ds:[13F14C004]


lblKey2: ;13F1287FC
mov     eax,1
imul    rax,rax,32h ;key[50] ;2 key
lea     rcx,key ;qword ptr ds:[13F14CC20]
movzx   eax,byte ptr ds:[rcx+rax] ;key[50]
test    eax,eax
je      lblKey3 ;oglmdi2_vs2019.13F128841

movss   xmm0,Zoom ;xmmword ptr ds:[13F14C004]
comiss  xmm0,0.0f ;qword ptr ds:[13F140978]
jbe     lblKey3 ;oglmdi2_vs2019.13F128841

cvtss2sd xmm0,Zoom ;xmmword ptr ds:[13F14C004]
subsd   xmm0,0.001f ;qword ptr ds:[13F140978]
cvtsd2ss xmm0,xmm0
movss   Zoom,xmm0 ;xmmword ptr ds:[13F14C004]


lblKey3: ;13F128841
mov     eax,1
imul    rax,rax,33h ;key[51] ;3 key
lea     rcx,key ;qword ptr ds:[13F14CC20]
movzx   eax,byte ptr ds:[rcx+rax] ;key[51]
test    eax,eax
je      lblKey4 ;oglmdi2_vs2019.13F128867

mov     eax,VerticalShift ;dword ptr ds:[13F14CE20]
inc     eax
mov     VerticalShift,eax ;dword ptr ds:[13F14CE20]


lblKey4: ;13F128867
mov     eax,1
imul    rax,rax,34h ;key[52] ;4 key
lea     rcx,key ;qword ptr ds:[13F14CC20]
movzx   eax,byte ptr ds:[rcx+rax] ;key[52]
test    eax,eax
je      lblKey5 ;oglmdi2_vs2019.13F12888D

mov     eax,VerticalShift ;dword ptr ds:[13F14CE20]
dec     eax
mov     VerticalShift,eax ;dword ptr ds:[13F14CE20]


lblKey5: ;13F128892
mov     eax,1
imul    rax,rax,35h ;key[53] ;5 key
lea     rcx,key ;qword ptr ds:[13F14CC20]
movzx   eax,byte ptr ds:[rcx+rax] ;key[53]
test    eax,eax
je      lblKey6 ;oglmdi2_vs2019.13F1288B3

mov     eax,HorizontalShift ;dword ptr ds:[13F14CE24]
inc     eax
mov     HorizontalShift,eax ;dword ptr ds:[13F14CE24]


lblKey6: ;13F1288B3
mov     eax,1
imul    rax,rax,36h ;key[54] ;6 key
lea     rcx,key ;qword ptr ds:[13F14CC20]
movzx   eax,byte ptr ds:[rcx+rax]; key[54]
test    eax,eax
je      lblKeySpace ;oglmdi2_vs2019.13F1288D9

mov     eax,HorizontalShift ;dword ptr ds:[13F14CE24]
dec     eax
mov     HorizontalShift,eax ;dword ptr ds:[13F14CE24]


lblKeySpace: ;13F1288D9
mov     eax,1
imul    rax,rax,20h ;key[VK_SPACE]
lea     rcx,key ;qword ptr ds:[13F14CC20]
movzx   eax,byte ptr ds:[rcx+rax] ;key[VK_SPACE]
test    eax,eax
je      lblIncChildNum ;oglmdi2_vs2019.13F1288FB

call    SetVertices ;oglmdi2_vs2019.13F1270B0

call    SetPolygons ;oglmdi2_vs2019.13F126410

jmp     lblIncChildNum ;oglmdi2_vs2019.13F12862B

;jmp     lblMainLoop ;oglmdi2_vs2019.13F1285C1


endLoop:
mov     rax,Msg.wParam
add     rsp,F8
ret ;WinMain









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






;Some Proc
mov     qword ptr ss:[rsp+20],r9
mov     qword ptr ss:[rsp+18],r8
mov     qword ptr ss:[rsp+10],rdx
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,38
mov     rax,qword ptr ss:[rsp+58]
mov     qword ptr ss:[rsp+20],rax
mov     r9,qword ptr ss:[rsp+50]
mov     r8,qword ptr ss:[rsp+48]
mov     rdx,FFFFFFFFFFFFFFFF
mov     rcx,qword ptr ss:[rsp+40]
call    oglmdi2_vs2019.13F121270
add     rsp,38
ret
;Some Endp




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
mov     qword ptr ss:[rsp+10],rdx
mov     qword ptr ss:[rsp+8],rcx
mov     qword ptr ss:[rsp+18],r8
mov     qword ptr ss:[rsp+20],r9
sub     rsp,38
lea     rax,qword ptr ss:[rsp+50]
mov     qword ptr ss:[rsp+28],rax
mov     r9,qword ptr ss:[rsp+28]
xor     r8d,r8d
mov     rdx,qword ptr ss:[rsp+48]
mov     rcx,qword ptr ss:[rsp+40]
call    oglmdi2_vs2019.13F128920
mov     dword ptr ss:[rsp+20],eax
mov     qword ptr ss:[rsp+28],0
mov     eax,dword ptr ss:[rsp+20]
add     rsp,38
ret     
int3    
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,38
mov     rax,qword ptr ss:[rsp+40]
mov     rcx,rax
call    oglmdi2_vs2019.13F128D10
nop     
mov     rax,qword ptr ss:[rsp+40]
add     rax,48
lea     rcx,qword ptr ds:[13F128D20]
mov     qword ptr ss:[rsp+20],rcx
lea     r9,qword ptr ds:[13F121500]
mov     r8d,3
mov     edx,24
mov     rcx,rax
call    oglmdi2_vs2019.13F129934
nop     
mov     rax,qword ptr ss:[rsp+40]
add     rsp,38
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
int3    
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,28
mov     rax,qword ptr ss:[rsp+30]
add     rax,48
lea     r9,qword ptr ds:[13F128D20]
mov     r8d,3
mov     edx,24
mov     rcx,rax
call    oglmdi2_vs2019.13F1299A4
nop     
mov     rax,qword ptr ss:[rsp+30]
mov     rcx,rax
call    oglmdi2_vs2019.13F128D20
nop     
add     rsp,28
ret


 
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,28
mov     eax,24
imul    rax,rax,1
mov     ecx,24
imul    rcx,rcx,0
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[rdx+rax+4C]
subss   xmm0,dword ptr ds:[r8+rcx+4C]
movss   dword ptr ss:[rsp+8],xmm0
mov     eax,24
imul    rax,rax,1
mov     ecx,24
imul    rcx,rcx,0
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[rdx+rax+50]
subss   xmm0,dword ptr ds:[r8+rcx+50]
movss   dword ptr ss:[rsp+14],xmm0
mov     eax,24
imul    rax,rax,1
mov     ecx,24
imul    rcx,rcx,0
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[rdx+rax+54]
subss   xmm0,dword ptr ds:[r8+rcx+54]
movss   dword ptr ss:[rsp],xmm0
mov     eax,24
imul    rax,rax,2
mov     ecx,24
imul    rcx,rcx,0
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[rdx+rax+4C]
subss   xmm0,dword ptr ds:[r8+rcx+4C]
movss   dword ptr ss:[rsp+10],xmm0
mov     eax,24
imul    rax,rax,2
mov     ecx,24
imul    rcx,rcx,0
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[rdx+rax+50]
subss   xmm0,dword ptr ds:[r8+rcx+50]
movss   dword ptr ss:[rsp+C],xmm0
mov     eax,24
imul    rax,rax,2
mov     ecx,24
imul    rcx,rcx,0
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[rdx+rax+54]
subss   xmm0,dword ptr ds:[r8+rcx+54]
movss   dword ptr ss:[rsp+4],xmm0
movss   xmm0,dword ptr ss:[rsp+14]
mulss   xmm0,dword ptr ss:[rsp+4]
movss   xmm1,dword ptr ss:[rsp+C]
mulss   xmm1,dword ptr ss:[rsp]
subss   xmm0,xmm1
mov     eax,24
imul    rax,rax,0
mov     rcx,qword ptr ss:[rsp+30]
movss   dword ptr ds:[rcx+rax+58],xmm0
movss   xmm0,dword ptr ss:[rsp]
mulss   xmm0,dword ptr ss:[rsp+10]
movss   xmm1,dword ptr ss:[rsp+4]
mulss   xmm1,dword ptr ss:[rsp+8]
subss   xmm0,xmm1
mov     eax,24
imul    rax,rax,0
mov     rcx,qword ptr ss:[rsp+30]
movss   dword ptr ds:[rcx+rax+5C],xmm0
movss   xmm0,dword ptr ss:[rsp+8]
mulss   xmm0,dword ptr ss:[rsp+C]
movss   xmm1,dword ptr ss:[rsp+10]
mulss   xmm1,dword ptr ss:[rsp+14]
subss   xmm0,xmm1
mov     eax,24
imul    rax,rax,0
mov     rcx,qword ptr ss:[rsp+30]
movss   dword ptr ds:[rcx+rax+60],xmm0
mov     eax,24
imul    rax,rax,0
mov     ecx,24
imul    rcx,rcx,1
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[r8+rax+58]
movss   dword ptr ds:[rdx+rcx+58],xmm0
mov     eax,24
imul    rax,rax,0
mov     ecx,24
imul    rcx,rcx,1
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[r8+rax+5C]
movss   dword ptr ds:[rdx+rcx+5C],xmm0
mov     eax,24
imul    rax,rax,0
mov     ecx,24
imul    rcx,rcx,1
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[r8+rax+60]
movss   dword ptr ds:[rdx+rcx+60],xmm0
mov     eax,24
imul    rax,rax,0
mov     ecx,24
imul    rcx,rcx,2
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[r8+rax+58]
movss   dword ptr ds:[rdx+rcx+58],xmm0
mov     eax,24
imul    rax,rax,0
mov     ecx,24
imul    rcx,rcx,2
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[r8+rax+5C]
movss   dword ptr ds:[rdx+rcx+5C],xmm0
mov     eax,24
imul    rax,rax,0
mov     ecx,24
imul    rcx,rcx,2
mov     rdx,qword ptr ss:[rsp+30]
mov     r8,qword ptr ss:[rsp+30]
movss   xmm0,dword ptr ds:[r8+rax+60]
movss   dword ptr ds:[rdx+rcx+60],xmm0
add     rsp,28
ret





int3    
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rcx
mov     rax,qword ptr ss:[rsp+8]
ret     
int3    
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rcx
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
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,A8
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+98],rax
mov     byte ptr ss:[rsp+78],0
mov     byte ptr ss:[rsp+79],0
mov     byte ptr ss:[rsp+7A],2
mov     byte ptr ss:[rsp+7B],0
mov     byte ptr ss:[rsp+7C],0
mov     byte ptr ss:[rsp+7D],0
mov     byte ptr ss:[rsp+7E],0
mov     byte ptr ss:[rsp+7F],0
mov     byte ptr ss:[rsp+80],0
mov     byte ptr ss:[rsp+81],0
mov     byte ptr ss:[rsp+82],0
mov     byte ptr ss:[rsp+83],0
mov     dword ptr ss:[rsp+54],1908
mov     rax,qword ptr ss:[rsp+B0]
lea     rdx,qword ptr ds:[13F1409D0]
mov     rcx,rax
call    oglmdi2_vs2019.13F12ED80
mov     qword ptr ss:[rsp+60],rax
cmp     qword ptr ss:[rsp+60],0
je      oglmdi2_vs2019.13F128E25
mov     r9,qword ptr ss:[rsp+60]
mov     r8d,C
mov     edx,1
lea     rcx,qword ptr ss:[rsp+88]
call    oglmdi2_vs2019.13F12F01C
cmp     rax,C
jne     oglmdi2_vs2019.13F128E25
mov     r8d,C
lea     rdx,qword ptr ss:[rsp+88]
lea     rcx,qword ptr ss:[rsp+78]
call    oglmdi2_vs2019.13F12B180
test    eax,eax
jne     oglmdi2_vs2019.13F128E25
mov     r9,qword ptr ss:[rsp+60]
mov     r8d,6
mov     edx,1
lea     rcx,qword ptr ss:[rsp+70]
call    oglmdi2_vs2019.13F12F01C
cmp     rax,6
je      oglmdi2_vs2019.13F128F0D
cmp     qword ptr ss:[rsp+60],0
jne     oglmdi2_vs2019.13F128E50
mov     r9d,10
lea     r8,qword ptr ds:[13F1409D4]
lea     rdx,qword ptr ds:[13F1409E0]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
xor     al,al
jmp     oglmdi2_vs2019.13F12932F
mov     eax,1
imul    rax,rax,2
movzx   eax,byte ptr ss:[rsp+rax+88]
cmp     eax,1
jne     oglmdi2_vs2019.13F128E82
mov     r9d,10
lea     r8,qword ptr ds:[13F1409FC]
lea     rdx,qword ptr ds:[13F140A10]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,1
imul    rax,rax,2
movzx   eax,byte ptr ss:[rsp+rax+88]
cmp     eax,3
jne     oglmdi2_vs2019.13F128EB4
mov     r9d,10
lea     r8,qword ptr ds:[13F140A04]
lea     rdx,qword ptr ds:[13F140A60]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,1
imul    rax,rax,2
movzx   eax,byte ptr ss:[rsp+rax+88]
cmp     eax,9
je      oglmdi2_vs2019.13F128EE0
mov     eax,1
imul    rax,rax,2
movzx   eax,byte ptr ss:[rsp+rax+88]
cmp     eax,A
jne     oglmdi2_vs2019.13F128EFC
mov     r9d,10
lea     r8,qword ptr ds:[13F140A54]
lea     rdx,qword ptr ds:[13F140AB0]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     rcx,qword ptr ss:[rsp+60]
call    oglmdi2_vs2019.13F12E460
xor     al,al
jmp     oglmdi2_vs2019.13F12932F
mov     eax,1
imul    rax,rax,1
movzx   eax,byte ptr ss:[rsp+rax+70]
imul    eax,eax,100
mov     ecx,1
imul    rcx,rcx,0
movzx   ecx,byte ptr ss:[rsp+rcx+70]
add     eax,ecx
mov     rcx,qword ptr ss:[rsp+B0]
mov     dword ptr ds:[rcx+24],eax
mov     eax,1
imul    rax,rax,3
movzx   eax,byte ptr ss:[rsp+rax+70]
imul    eax,eax,100
mov     ecx,1
imul    rcx,rcx,2
movzx   ecx,byte ptr ss:[rsp+rcx+70]
add     eax,ecx
mov     rcx,qword ptr ss:[rsp+B0]
mov     dword ptr ds:[rcx+28],eax
mov     rax,qword ptr ss:[rsp+B0]
cmp     dword ptr ds:[rax+24],0
jbe     oglmdi2_vs2019.13F128FB5
mov     rax,qword ptr ss:[rsp+B0]
cmp     dword ptr ds:[rax+28],0
jbe     oglmdi2_vs2019.13F128FB5
mov     eax,1
imul    rax,rax,4
movzx   eax,byte ptr ss:[rsp+rax+70]
cmp     eax,18
je      oglmdi2_vs2019.13F129040
mov     eax,1
imul    rax,rax,4
movzx   eax,byte ptr ss:[rsp+rax+70]
cmp     eax,20
je      oglmdi2_vs2019.13F129040
mov     rcx,qword ptr ss:[rsp+60]
call    oglmdi2_vs2019.13F12E460
mov     rax,qword ptr ss:[rsp+B0]
cmp     dword ptr ds:[rax+24],0
jbe     oglmdi2_vs2019.13F128FDB
mov     rax,qword ptr ss:[rsp+B0]
cmp     dword ptr ds:[rax+28],0
ja      oglmdi2_vs2019.13F128FF7
mov     r9d,10
lea     r8,qword ptr ds:[13F140AA8]
lea     rdx,qword ptr ds:[13F140B00]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     eax,1
imul    rax,rax,4
movzx   eax,byte ptr ss:[rsp+rax+70]
cmp     eax,18
je      oglmdi2_vs2019.13F129039
mov     eax,1
imul    rax,rax,4
movzx   eax,byte ptr ss:[rsp+rax+70]
cmp     eax,20
je      oglmdi2_vs2019.13F129039
mov     r9d,10
lea     r8,qword ptr ds:[13F140B34]
lea     rdx,qword ptr ds:[13F140B40]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
xor     al,al
jmp     oglmdi2_vs2019.13F12932F
mov     eax,1
imul    rax,rax,4
movzx   eax,byte ptr ss:[rsp+rax+70]
mov     rcx,qword ptr ss:[rsp+B0]
mov     dword ptr ds:[rcx+20],eax
xor     edx,edx
mov     rax,qword ptr ss:[rsp+B0]
mov     eax,dword ptr ds:[rax+20]
mov     ecx,8
div     ecx
mov     dword ptr ss:[rsp+68],eax
mov     rax,qword ptr ss:[rsp+B0]
mov     rcx,qword ptr ss:[rsp+B0]
mov     eax,dword ptr ds:[rax+24]
imul    eax,dword ptr ds:[rcx+28]
imul    eax,dword ptr ss:[rsp+68]
mov     dword ptr ss:[rsp+58],eax
mov     eax,dword ptr ss:[rsp+58]
mov     ecx,eax
call    oglmdi2_vs2019.13F12ECBC
mov     rcx,qword ptr ss:[rsp+B0]
mov     qword ptr ds:[rcx+18],rax
mov     rax,qword ptr ss:[rsp+B0]
cmp     qword ptr ds:[rax+18],0
je      oglmdi2_vs2019.13F1290E2
mov     eax,dword ptr ss:[rsp+58]
mov     r9,qword ptr ss:[rsp+60]
mov     r8d,eax
mov     edx,1
mov     rax,qword ptr ss:[rsp+B0]
mov     rcx,qword ptr ds:[rax+18]
call    oglmdi2_vs2019.13F12F01C
mov     ecx,dword ptr ss:[rsp+58]
cmp     rax,rcx
je      oglmdi2_vs2019.13F12912F
mov     rax,qword ptr ss:[rsp+B0]
cmp     qword ptr ds:[rax+18],0
je      oglmdi2_vs2019.13F129102
mov     rax,qword ptr ss:[rsp+B0]
mov     rcx,qword ptr ds:[rax+18]
call    oglmdi2_vs2019.13F12ECA8
mov     r9d,10
lea     r8,qword ptr ds:[13F140B5C]
lea     rdx,qword ptr ds:[13F140B68]
xor     ecx,ecx
call    qword ptr ds:[<&MessageBoxA>]
mov     rcx,qword ptr ss:[rsp+60]
call    oglmdi2_vs2019.13F12E460
xor     al,al
jmp     oglmdi2_vs2019.13F12932F
mov     dword ptr ss:[rsp+50],0
jmp     oglmdi2_vs2019.13F129149
mov     eax,dword ptr ss:[rsp+68]
mov     ecx,dword ptr ss:[rsp+50]
add     ecx,eax
mov     eax,ecx
mov     dword ptr ss:[rsp+50],eax
mov     eax,dword ptr ss:[rsp+58]
cmp     dword ptr ss:[rsp+50],eax
jae     oglmdi2_vs2019.13F1291B7
mov     eax,dword ptr ss:[rsp+50]
mov     rcx,qword ptr ss:[rsp+B0]
mov     rcx,qword ptr ds:[rcx+18]
movzx   eax,byte ptr ds:[rcx+rax]
mov     dword ptr ss:[rsp+6C],eax
mov     eax,dword ptr ss:[rsp+50]
add     eax,2
mov     eax,eax
mov     rcx,qword ptr ss:[rsp+B0]
mov     rcx,qword ptr ds:[rcx+18]
mov     edx,dword ptr ss:[rsp+50]
mov     r8,qword ptr ss:[rsp+B0]
mov     r8,qword ptr ds:[r8+18]
movzx   eax,byte ptr ds:[rcx+rax]
mov     byte ptr ds:[r8+rdx],al
mov     eax,dword ptr ss:[rsp+50]
add     eax,2
mov     eax,eax
mov     rcx,qword ptr ss:[rsp+B0]
mov     rcx,qword ptr ds:[rcx+18]
movzx   edx,byte ptr ss:[rsp+6C]
mov     byte ptr ds:[rcx+rax],dl
jmp     oglmdi2_vs2019.13F129139
mov     rcx,qword ptr ss:[rsp+60]
call    oglmdi2_vs2019.13F12E460
mov     rax,qword ptr ss:[rsp+B0]
add     rax,2C
mov     rdx,rax
mov     ecx,1
call    qword ptr ds:[<&glGenTextures>]
mov     rax,qword ptr ss:[rsp+B0]
mov     edx,dword ptr ds:[rax+2C]
mov     ecx,DE1
call    qword ptr ds:[<&glBindTexture>]
movss   xmm2,dword ptr ds:[13F140770]
mov     edx,2802
mov     ecx,DE1
call    qword ptr ds:[<&glTexParameterf>]
movss   xmm2,dword ptr ds:[13F140770]
mov     edx,2803
mov     ecx,DE1
call    qword ptr ds:[<&glTexParameterf>]
movss   xmm2,dword ptr ds:[13F140764]
mov     edx,2800
mov     ecx,DE1
call    qword ptr ds:[<&glTexParameterf>]
movss   xmm2,dword ptr ds:[13F140768]
mov     edx,2801
mov     ecx,DE1
call    qword ptr ds:[<&glTexParameterf>]
mov     rax,qword ptr ss:[rsp+B0]
cmp     dword ptr ds:[rax+20],18
jne     oglmdi2_vs2019.13F129267
mov     dword ptr ss:[rsp+54],1907
movss   xmm2,dword ptr ds:[13F140760]
mov     edx,2200
mov     ecx,2300
call    qword ptr ds:[<&glTexEnvf>]
mov     rax,qword ptr ss:[rsp+B0]
mov     rax,qword ptr ds:[rax+18]
mov     qword ptr ss:[rsp+40],rax
mov     dword ptr ss:[rsp+38],1401
mov     eax,dword ptr ss:[rsp+54]
mov     dword ptr ss:[rsp+30],eax
mov     dword ptr ss:[rsp+28],0
mov     rax,qword ptr ss:[rsp+B0]
mov     eax,dword ptr ds:[rax+28]
mov     dword ptr ss:[rsp+20],eax
mov     rax,qword ptr ss:[rsp+B0]
mov     r9d,dword ptr ds:[rax+24]
mov     r8d,dword ptr ss:[rsp+54]
xor     edx,edx
mov     ecx,DE1
call    qword ptr ds:[<&glTexImage2D>]
mov     rax,qword ptr ss:[rsp+B0]
mov     rax,qword ptr ds:[rax+18]
mov     qword ptr ss:[rsp+30],rax
mov     dword ptr ss:[rsp+28],1401
mov     eax,dword ptr ss:[rsp+54]
mov     dword ptr ss:[rsp+20],eax
mov     rax,qword ptr ss:[rsp+B0]
mov     r9d,dword ptr ds:[rax+28]
mov     rax,qword ptr ss:[rsp+B0]
mov     r8d,dword ptr ds:[rax+24]
mov     edx,dword ptr ss:[rsp+54]
mov     ecx,DE1
call    <oglmdi2_vs2019.gluBuild2DMipmaps>
mov     rax,qword ptr ss:[rsp+B0]
mov     rcx,qword ptr ds:[rax+18]
call    oglmdi2_vs2019.13F12ECA8
mov     al,1
mov     rcx,qword ptr ss:[rsp+98]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,A8
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
movss   dword ptr ss:[rsp+20],xmm3
movss   dword ptr ss:[rsp+18],xmm2
movss   dword ptr ss:[rsp+10],xmm1
mov     qword ptr ss:[rsp+8],rcx
mov     rax,qword ptr ss:[rsp+8]
mov     dword ptr ds:[rax],3
mov     rax,qword ptr ss:[rsp+8]
movss   xmm0,dword ptr ss:[rsp+10]
movss   dword ptr ds:[rax+4],xmm0
mov     rax,qword ptr ss:[rsp+8]
movss   xmm0,dword ptr ss:[rsp+18]
movss   dword ptr ds:[rax+8],xmm0
mov     rax,qword ptr ss:[rsp+8]
movss   xmm0,dword ptr ss:[rsp+20]
movss   dword ptr ds:[rax+C],xmm0
mov     rax,qword ptr ss:[rsp+8]
movss   xmm0,dword ptr ss:[rsp+28]
movss   dword ptr ds:[rax+10],xmm0
mov     rax,qword ptr ss:[rsp+8]
movss   xmm0,dword ptr ss:[rsp+30]
movss   dword ptr ds:[rax+14],xmm0
mov     rax,qword ptr ss:[rsp+8]
movss   xmm0,dword ptr ss:[rsp+38]
movss   dword ptr ds:[rax+18],xmm0
mov     rax,qword ptr ss:[rsp+8]
ret     
jmp     qword ptr ds:[<&gluPerspective>]
jmp     qword ptr ds:[<&gluBuild2DMipmaps>]
jmp     qword ptr ds:[<&gluNewQuadric>]
jmp     qword ptr ds:[<&gluQuadricOrientation>]
jmp     qword ptr ds:[<&gluSphere>]
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     rsi,rcx
lock inc dword ptr ds:[13F14C044]
jne     oglmdi2_vs2019.13F129431
lea     rbx,qword ptr ds:[13F14CEA0]
mov     edi,8
mov     rcx,rbx
call    oglmdi2_vs2019.13F129490
add     rbx,28
sub     rdi,1
jne     oglmdi2_vs2019.13F12941F
mov     rbx,qword ptr ss:[rsp+30]
mov     rax,rsi
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
or      eax,FFFFFFFF
lock xadd dword ptr ds:[13F14C044],eax
cmp     eax,1
jns     oglmdi2_vs2019.13F12947C
lea     rbx,qword ptr ds:[13F14CEA0]
mov     edi,8
mov     rcx,rbx
call    <oglmdi2_vs2019.RtlDeleteCriticalSection>
add     rbx,28
sub     rdi,1
jne     oglmdi2_vs2019.13F12946A
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
jmp     qword ptr ds:[<&RtlDeleteCriticalSection>]
int3    
xor     r8d,r8d
mov     edx,FA0
jmp     oglmdi2_vs2019.13F129858
int3    
int3    
int3    
push    rbx
sub     rsp,20
lea     rcx,qword ptr ds:[13F140B98]
call    qword ptr ds:[<&GetModuleHandleW>]
mov     rcx,rax
lea     rdx,qword ptr ds:[13F140BB8]
mov     rbx,rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140BC8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D050],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140BD0]
mov     rcx,rbx
mov     qword ptr ds:[13F14D058],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140BE0]
mov     rcx,rbx
mov     qword ptr ds:[13F14D060],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140BF0]
mov     rcx,rbx
mov     qword ptr ds:[13F14D068],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140C10]
mov     rcx,rbx
mov     qword ptr ds:[13F14D070],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140C28]
mov     rcx,rbx
mov     qword ptr ds:[13F14D078],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140C38]
mov     rcx,rbx
mov     qword ptr ds:[13F14D080],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140C50]
mov     rcx,rbx
mov     qword ptr ds:[13F14D088],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140C68]
mov     rcx,rbx
mov     qword ptr ds:[13F14D090],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140C80]
mov     rcx,rbx
mov     qword ptr ds:[13F14D098],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140C98]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0A0],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140CB8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0A8],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140CD0]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0B0],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140CE8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0B8],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140D00]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0C0],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140D18]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0C8],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140D38]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0D0],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140D58]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0D8],rax
call    qword ptr ds:[<&GetProcAddress>]
mov     qword ptr ds:[13F14D0E0],rax
lea     rdx,qword ptr ds:[13F140D78]
mov     rcx,rbx
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140D90]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0E8],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140DA8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0F0],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140DB8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D0F8],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140DD8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D100],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140DF8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D108],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140E18]
mov     rcx,rbx
mov     qword ptr ds:[13F14D110],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140E38]
mov     rcx,rbx
mov     qword ptr ds:[13F14D118],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140E50]
mov     rcx,rbx
mov     qword ptr ds:[13F14D120],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140E70]
mov     rcx,rbx
mov     qword ptr ds:[13F14D128],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140E90]
mov     rcx,rbx
mov     qword ptr ds:[13F14D130],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140EA8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D138],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140EC0]
mov     rcx,rbx
mov     qword ptr ds:[13F14D140],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140EE0]
mov     rcx,rbx
mov     qword ptr ds:[13F14D148],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140EF8]
mov     rcx,rbx
mov     qword ptr ds:[13F14D150],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140F18]
mov     rcx,rbx
mov     qword ptr ds:[13F14D158],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140F30]
mov     rcx,rbx
mov     qword ptr ds:[13F14D160],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140F48]
mov     rcx,rbx
mov     qword ptr ds:[13F14D168],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140F60]
mov     rcx,rbx
mov     qword ptr ds:[13F14D170],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140F70]
mov     rcx,rbx
mov     qword ptr ds:[13F14D178],rax
call    qword ptr ds:[<&GetProcAddress>]
lea     rdx,qword ptr ds:[13F140F80]
mov     rcx,rbx
mov     qword ptr ds:[13F14D180],rax
call    qword ptr ds:[<&GetProcAddress>]
mov     qword ptr ds:[13F14D188],rax
xor     eax,eax
add     rsp,20
pop     rbx
ret     
int3    
int3    
sub     rsp,28
mov     rax,qword ptr ds:[13F14D070]
test    rax,rax
je      oglmdi2_vs2019.13F129873
add     rsp,28
jmp     qword ptr ds:[13F140490]
call    qword ptr ds:[<&InitializeCriticalSectionAndSpinCount>]
mov     eax,1
add     rsp,28
ret     
int3    
sub     rsp,28
mov     r8,qword ptr ds:[r9+38]
mov     rcx,rdx
mov     rdx,r9
call    oglmdi2_vs2019.13F1298A4
mov     eax,1
add     rsp,28
ret     
int3    
int3    
int3    
push    rbx
mov     r11d,dword ptr ds:[r8]
mov     rbx,rdx
and     r11d,FFFFFFF8
mov     r9,rcx
test    byte ptr ds:[r8],4
mov     r10,rcx
je      oglmdi2_vs2019.13F1298CF
mov     eax,dword ptr ds:[r8+8]
movsxd  r10,dword ptr ds:[r8+4]
neg     eax
add     r10,rcx
movsxd  rcx,eax
and     r10,rcx
movsxd  rax,r11d
mov     rdx,qword ptr ds:[rax+r10]
mov     rax,qword ptr ds:[rbx+10]
mov     ecx,dword ptr ds:[rax+8]
mov     rax,qword ptr ds:[rbx+8]
test    byte ptr ds:[rcx+rax+3],F
je      oglmdi2_vs2019.13F1298F3
movzx   eax,byte ptr ds:[rcx+rax+3]
and     eax,FFFFFFF0
add     r9,rax
xor     r9,rdx
mov     rcx,r9
pop     rbx
jmp     oglmdi2_vs2019.13F129910
int3    
int3    
int3    
int3    
int3    
int3    
int3    
nop     word ptr ds:[rax+rax]
cmp     rcx,qword ptr ds:[13F14C058]
jne     oglmdi2_vs2019.13F12992C
rol     rcx,10
test    cx,FFFF
jne     oglmdi2_vs2019.13F129928
ret     
ror     rcx,10
jmp     oglmdi2_vs2019.13F129AC0
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+18],rbx
mov     qword ptr ds:[rax+20],rsi
mov     qword ptr ds:[rax+10],rdx
mov     qword ptr ds:[rax+8],rcx
push    rdi
push    r14
push    r15
sub     rsp,30
mov     r15,r9
mov     r14,r8
mov     rsi,rdx
mov     rdi,rcx
xor     ebx,ebx
mov     qword ptr ds:[rax-20],rbx
mov     byte ptr ds:[rax-28],bl
cmp     rbx,r14
je      oglmdi2_vs2019.13F12998B
mov     rcx,rdi
mov     rax,r15
mov     rdx,qword ptr ds:[13F140490]
call    rdx
add     rdi,rsi
mov     qword ptr ss:[rsp+50],rdi
inc     rbx
mov     qword ptr ss:[rsp+28],rbx
jmp     oglmdi2_vs2019.13F129965
mov     byte ptr ss:[rsp+20],1
mov     rbx,qword ptr ss:[rsp+60]
mov     rsi,qword ptr ss:[rsp+68]
add     rsp,30
pop     r15
pop     r14
pop     rdi
ret     
mov     rax,rsp
mov     qword ptr ds:[rax+20],r9
mov     qword ptr ds:[rax+18],r8
mov     qword ptr ds:[rax+10],rdx
push    rbx
push    rsi
push    rdi
push    r14
sub     rsp,38
mov     r14,r9
mov     rbx,r8
mov     rsi,rdx
mov     byte ptr ds:[rax-38],0
mov     rdi,rdx
imul    rdi,r8
add     rdi,rcx
mov     qword ptr ds:[rax+8],rdi
mov     rax,rbx
dec     rbx
mov     qword ptr ss:[rsp+70],rbx
test    rax,rax
je      oglmdi2_vs2019.13F129A00
sub     rdi,rsi
mov     qword ptr ss:[rsp+60],rdi
mov     rcx,rdi
mov     rax,r14
mov     rdx,qword ptr ds:[13F140490]
call    rdx
jmp     oglmdi2_vs2019.13F1299D7
mov     byte ptr ss:[rsp+20],1
add     rsp,38
pop     r14
pop     rdi
pop     rsi
pop     rbx
ret     
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
mov     qword ptr ss:[rsp+8],rcx
push    rdi
push    r14
push    r15
sub     rsp,50
mov     r14,r9
mov     rsi,r8
mov     r15,rdx
mov     rdi,rcx
xor     ebx,ebx
mov     qword ptr ss:[rsp+38],rbx
cmp     rbx,rsi
je      oglmdi2_vs2019.13F129A59
sub     rdi,r15
mov     qword ptr ss:[rsp+70],rdi
mov     rcx,rdi
mov     rax,r14
call    qword ptr ds:[13F140490]
inc     rbx
jmp     oglmdi2_vs2019.13F129A36
jmp     oglmdi2_vs2019.13F129A5B
lea     r11,qword ptr ss:[rsp+50]
mov     rbx,qword ptr ds:[r11+28]
mov     rsi,qword ptr ds:[r11+30]
mov     rsp,r11
pop     r15
pop     r14
pop     rdi
ret     
int3    
int3    
int3    
jmp     oglmdi2_vs2019.13F12A1E8
int3    
int3    
int3    
jmp     oglmdi2_vs2019.13F12A1F0
int3    
int3    
int3    
jmp     oglmdi2_vs2019.13F129A74
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
xor     ecx,ecx
call    qword ptr ds:[<&SetUnhandledExceptionFilter>]
mov     rcx,rbx
call    qword ptr ds:[<&UnhandledExceptionFilter>]
call    qword ptr ds:[<&GetCurrentProcess>]
mov     rcx,rax
mov     edx,C0000409
add     rsp,20
pop     rbx
jmp     qword ptr ds:[<&TerminateProcess>]
mov     qword ptr ss:[rsp+8],rcx
sub     rsp,38
mov     ecx,17
call    <oglmdi2_vs2019.IsProcessorFeaturePresent>
test    eax,eax
je      oglmdi2_vs2019.13F129ADE
mov     ecx,2
int     29
lea     rcx,qword ptr ds:[13F14D230]
call    oglmdi2_vs2019.13F129CB4
mov     rax,qword ptr ss:[rsp+38]
mov     qword ptr ds:[13F14D328],rax
lea     rax,qword ptr ss:[rsp+38]
add     rax,8
mov     qword ptr ds:[13F14D2C8],rax
mov     rax,qword ptr ds:[13F14D328]
mov     qword ptr ds:[13F14D1A0],rax
mov     rax,qword ptr ss:[rsp+40]
mov     qword ptr ds:[13F14D2B0],rax
mov     dword ptr ds:[13F14D190],C0000409
mov     dword ptr ds:[13F14D194],1
mov     dword ptr ds:[13F14D1A8],1
mov     eax,8
imul    rax,rax,0
lea     rcx,qword ptr ds:[13F14D1B0]
mov     qword ptr ds:[rcx+rax],2
mov     eax,8
imul    rax,rax,0
mov     rcx,qword ptr ds:[13F14C058]
mov     qword ptr ss:[rsp+rax+20],rcx
mov     eax,8
imul    rax,rax,1
mov     rcx,qword ptr ds:[13F14C050]
mov     qword ptr ss:[rsp+rax+20],rcx
lea     rcx,qword ptr ds:[13F140F90]
call    oglmdi2_vs2019.13F129A8C
add     rsp,38
ret     
int3    
int3    
int3    
sub     rsp,28
mov     ecx,8
call    oglmdi2_vs2019.13F129BA8
add     rsp,28
ret     
int3    
mov     dword ptr ss:[rsp+8],ecx
sub     rsp,28
mov     ecx,17
call    <oglmdi2_vs2019.IsProcessorFeaturePresent>
test    eax,eax
je      oglmdi2_vs2019.13F129BC6
mov     eax,dword ptr ss:[rsp+30]
mov     ecx,eax
int     29
lea     rcx,qword ptr ds:[13F14D230]
call    oglmdi2_vs2019.13F129C44
mov     rax,qword ptr ss:[rsp+28]
mov     qword ptr ds:[13F14D328],rax
lea     rax,qword ptr ss:[rsp+28]
add     rax,8
mov     qword ptr ds:[13F14D2C8],rax
mov     rax,qword ptr ds:[13F14D328]
mov     qword ptr ds:[13F14D1A0],rax
mov     dword ptr ds:[13F14D190],C0000409
mov     dword ptr ds:[13F14D194],1
mov     dword ptr ds:[13F14D1A8],1
mov     eax,8
imul    rax,rax,0
lea     rcx,qword ptr ds:[13F14D1B0]
mov     edx,dword ptr ss:[rsp+30]
mov     qword ptr ds:[rcx+rax],rdx
lea     rcx,qword ptr ds:[13F140F90]
call    oglmdi2_vs2019.13F129A8C
add     rsp,28
ret     
int3    
mov     qword ptr ss:[rsp+20],rbx
push    rdi
sub     rsp,40
mov     rbx,rcx
call    qword ptr ds:[<&RtlCaptureContext>]
mov     rdi,qword ptr ds:[rbx+F8]
lea     rdx,qword ptr ss:[rsp+50]
mov     rcx,rdi
xor     r8d,r8d
call    qword ptr ds:[<&RtlLookupFunctionEntry>]
test    rax,rax
je      oglmdi2_vs2019.13F129CA6
and     qword ptr ss:[rsp+38],0
lea     rcx,qword ptr ss:[rsp+58]
mov     rdx,qword ptr ss:[rsp+50]
mov     r9,rax
mov     qword ptr ss:[rsp+30],rcx
mov     r8,rdi
lea     rcx,qword ptr ss:[rsp+60]
mov     qword ptr ss:[rsp+28],rcx
xor     ecx,ecx
mov     qword ptr ss:[rsp+20],rbx
call    qword ptr ds:[<&RtlVirtualUnwind>]
mov     rbx,qword ptr ss:[rsp+68]
add     rsp,40
pop     rdi
ret     
int3    
int3    
int3    
push    rbx
push    rsi
push    rdi
sub     rsp,40
mov     rbx,rcx
call    qword ptr ds:[<&RtlCaptureContext>]
mov     rsi,qword ptr ds:[rbx+F8]
xor     edi,edi
xor     r8d,r8d
lea     rdx,qword ptr ss:[rsp+60]
mov     rcx,rsi
call    qword ptr ds:[<&RtlLookupFunctionEntry>]
test    rax,rax
je      oglmdi2_vs2019.13F129D1D
and     qword ptr ss:[rsp+38],0
lea     rcx,qword ptr ss:[rsp+68]
mov     rdx,qword ptr ss:[rsp+60]
mov     r9,rax
mov     qword ptr ss:[rsp+30],rcx
mov     r8,rsi
lea     rcx,qword ptr ss:[rsp+70]
mov     qword ptr ss:[rsp+28],rcx
xor     ecx,ecx
mov     qword ptr ss:[rsp+20],rbx
call    qword ptr ds:[<&RtlVirtualUnwind>]
inc     edi
cmp     edi,2
jl      oglmdi2_vs2019.13F129CCE
add     rsp,40
pop     rdi
pop     rsi
pop     rbx
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     ecx,2
call    oglmdi2_vs2019.13F131594
call    oglmdi2_vs2019.13F12A2E4
mov     ecx,eax
call    oglmdi2_vs2019.13F132024
call    oglmdi2_vs2019.13F12A2D8
mov     ebx,eax
call    oglmdi2_vs2019.13F132290
mov     ecx,1
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F12A01C
test    al,al
je      oglmdi2_vs2019.13F129DD3
call    oglmdi2_vs2019.13F12A598
lea     rcx,qword ptr ds:[13F12A5D4]
call    oglmdi2_vs2019.13F12A1CC
call    oglmdi2_vs2019.13F12A2DC
mov     ecx,eax
call    oglmdi2_vs2019.13F131840
test    eax,eax
jne     oglmdi2_vs2019.13F129DD3
call    oglmdi2_vs2019.13F12A2EC
call    oglmdi2_vs2019.13F12A324
test    eax,eax
je      oglmdi2_vs2019.13F129D9B
lea     rcx,qword ptr ds:[13F12A2D8]
call    oglmdi2_vs2019.13F1315F4
call    oglmdi2_vs2019.13F12A1E4
call    oglmdi2_vs2019.13F12A1E4
call    oglmdi2_vs2019.13F12A2D8
mov     ecx,eax
call    oglmdi2_vs2019.13F1321F0
call    oglmdi2_vs2019.13F12A2FC
test    al,al
je      oglmdi2_vs2019.13F129DBF
call    oglmdi2_vs2019.13F131BF0
call    oglmdi2_vs2019.13F12A2D8
call    oglmdi2_vs2019.13F12A4D0
test    eax,eax
jne     oglmdi2_vs2019.13F129DD3
add     rsp,20
pop     rbx
ret     
mov     ecx,7
call    oglmdi2_vs2019.13F12A348
int3    
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12A308
xor     eax,eax
add     rsp,28
ret     
sub     rsp,28
call    oglmdi2_vs2019.13F12A52C
call    oglmdi2_vs2019.13F12A2D8
mov     ecx,eax
add     rsp,28
jmp     oglmdi2_vs2019.13F132264
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,30
mov     ecx,1
call    oglmdi2_vs2019.13F129FD0
test    al,al
je      oglmdi2_vs2019.13F129F58
xor     dil,dil
mov     byte ptr ss:[rsp+20],dil
call    oglmdi2_vs2019.13F129F94
mov     bl,al
mov     ecx,dword ptr ds:[13F14D700]
cmp     ecx,1
je      oglmdi2_vs2019.13F129F63
test    ecx,ecx
jne     oglmdi2_vs2019.13F129E94
mov     dword ptr ds:[13F14D700],1
lea     rdx,qword ptr ds:[13F140520]
lea     rcx,qword ptr ds:[13F1404E8]
call    oglmdi2_vs2019.13F131CCC
test    eax,eax
je      oglmdi2_vs2019.13F129E75
mov     eax,FF
jmp     oglmdi2_vs2019.13F129F4D
lea     rdx,qword ptr ds:[13F1404E0]
lea     rcx,qword ptr ds:[13F140498]
call    oglmdi2_vs2019.13F131C68
mov     dword ptr ds:[13F14D700],2
jmp     oglmdi2_vs2019.13F129E9C
mov     dil,1
mov     byte ptr ss:[rsp+20],dil
mov     cl,bl
call    oglmdi2_vs2019.13F12A140
call    oglmdi2_vs2019.13F12A330
mov     rbx,rax
cmp     qword ptr ds:[rax],0
je      oglmdi2_vs2019.13F129ECF
mov     rcx,rax
call    oglmdi2_vs2019.13F12A0A8
test    al,al
je      oglmdi2_vs2019.13F129ECF
xor     r8d,r8d
lea     edx,dword ptr ds:[r8+2]
xor     ecx,ecx
mov     rax,qword ptr ds:[rbx]
call    qword ptr ds:[13F140490]
call    oglmdi2_vs2019.13F12A338
mov     rbx,rax
cmp     qword ptr ds:[rax],0
je      oglmdi2_vs2019.13F129EF1
mov     rcx,rax
call    oglmdi2_vs2019.13F12A0A8
test    al,al
je      oglmdi2_vs2019.13F129EF1
mov     rcx,qword ptr ds:[rbx]
call    oglmdi2_vs2019.13F131FAC
call    oglmdi2_vs2019.13F12A494
movzx   ebx,ax
call    oglmdi2_vs2019.13F131BF8
mov     r9d,ebx
mov     r8,rax
xor     edx,edx
lea     rcx,qword ptr ds:[13F120000]
call    oglmdi2_vs2019.13F128210
mov     ebx,eax
call    oglmdi2_vs2019.13F12A4D8
test    al,al
je      oglmdi2_vs2019.13F129F6D
test    dil,dil
jne     oglmdi2_vs2019.13F129F27
call    oglmdi2_vs2019.13F131F90
xor     edx,edx
mov     cl,1
call    oglmdi2_vs2019.13F12A164
mov     eax,ebx
jmp     oglmdi2_vs2019.13F129F4D
mov     ebx,eax
call    oglmdi2_vs2019.13F12A4D8
test    al,al
je      oglmdi2_vs2019.13F129F75
cmp     byte ptr ss:[rsp+20],0
jne     oglmdi2_vs2019.13F129F4B
call    oglmdi2_vs2019.13F131F80
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+40]
add     rsp,30
pop     rdi
ret     
mov     ecx,7
call    oglmdi2_vs2019.13F12A348
nop     
mov     ecx,7
call    oglmdi2_vs2019.13F12A348
mov     ecx,ebx
call    oglmdi2_vs2019.13F131FE8
nop     
mov     ecx,ebx
call    oglmdi2_vs2019.13F131FA0
nop     
int3    
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12A22C
add     rsp,28
jmp     oglmdi2_vs2019.13F129E0C
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12A7A8
test    eax,eax
je      oglmdi2_vs2019.13F129FC2
mov     rax,qword ptr gs:[30]
mov     rcx,qword ptr ds:[rax+8]
jmp     oglmdi2_vs2019.13F129FB5
cmp     rcx,rax
je      oglmdi2_vs2019.13F129FC9
xor     eax,eax
lock cmpxchg qword ptr ds:[13F14D708],rcx
jne     oglmdi2_vs2019.13F129FB0
xor     al,al
add     rsp,28
ret     
mov     al,1
jmp     oglmdi2_vs2019.13F129FC4
int3    
int3    
int3    
push    rbx
sub     rsp,20
movzx   eax,byte ptr ds:[13F14D710]
test    ecx,ecx
mov     ebx,1
cmove   eax,ebx
mov     byte ptr ds:[13F14D710],al
call    oglmdi2_vs2019.13F12A610
call    oglmdi2_vs2019.13F12B774
test    al,al
jne     oglmdi2_vs2019.13F129FFF
xor     al,al
jmp     oglmdi2_vs2019.13F12A013
call    oglmdi2_vs2019.13F1327C0
test    al,al
jne     oglmdi2_vs2019.13F12A011
xor     ecx,ecx
call    oglmdi2_vs2019.13F12B79C
jmp     oglmdi2_vs2019.13F129FFB
mov     al,bl
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
cmp     byte ptr ds:[13F14D711],0
mov     ebx,ecx
jne     oglmdi2_vs2019.13F12A094
cmp     ecx,1
ja      oglmdi2_vs2019.13F12A09C
call    oglmdi2_vs2019.13F12A7A8
test    eax,eax
je      oglmdi2_vs2019.13F12A063
test    ebx,ebx
jne     oglmdi2_vs2019.13F12A063
lea     rcx,qword ptr ds:[13F14D718]
call    oglmdi2_vs2019.13F132624
test    eax,eax
jne     oglmdi2_vs2019.13F12A05F
lea     rcx,qword ptr ds:[13F14D730]
call    oglmdi2_vs2019.13F132624
test    eax,eax
je      oglmdi2_vs2019.13F12A08D
xor     al,al
jmp     oglmdi2_vs2019.13F12A096
movdqa  xmm0,xmmword ptr ds:[13F140FA0]
or      rax,FFFFFFFFFFFFFFFF
movdqu  xmmword ptr ds:[13F14D718],xmm0
mov     qword ptr ds:[13F14D728],rax
movdqu  xmmword ptr ds:[13F14D730],xmm0
mov     qword ptr ds:[13F14D740],rax
mov     byte ptr ds:[13F14D711],1
mov     al,1
add     rsp,20
pop     rbx
ret     
mov     ecx,5
call    oglmdi2_vs2019.13F12A348
int3    
int3    
sub     rsp,18
mov     r8,rcx
mov     eax,5A4D
cmp     word ptr ds:[13F120000],ax
jne     oglmdi2_vs2019.13F12A135
movsxd  rcx,dword ptr ds:[13F12003C]
lea     rdx,qword ptr ds:[13F120000]
add     rcx,rdx
cmp     dword ptr ds:[rcx],4550
jne     oglmdi2_vs2019.13F12A135
mov     eax,20B
cmp     word ptr ds:[rcx+18],ax
jne     oglmdi2_vs2019.13F12A135
sub     r8,rdx
movzx   eax,word ptr ds:[rcx+14]
lea     rdx,qword ptr ds:[rcx+18]
add     rdx,rax
movzx   eax,word ptr ds:[rcx+6]
lea     rcx,qword ptr ds:[rax+rax*4]
lea     r9,qword ptr ds:[rdx+rcx*8]
mov     qword ptr ss:[rsp],rdx
cmp     rdx,r9
je      oglmdi2_vs2019.13F12A11C
mov     ecx,dword ptr ds:[rdx+C]
cmp     r8,rcx
jb      oglmdi2_vs2019.13F12A116
mov     eax,dword ptr ds:[rdx+8]
add     eax,ecx
cmp     r8,rax
jb      oglmdi2_vs2019.13F12A11E
add     rdx,28
jmp     oglmdi2_vs2019.13F12A0FB
xor     edx,edx
test    rdx,rdx
jne     oglmdi2_vs2019.13F12A127
xor     al,al
jmp     oglmdi2_vs2019.13F12A13B
cmp     dword ptr ds:[rdx+24],0
jge     oglmdi2_vs2019.13F12A131
xor     al,al
jmp     oglmdi2_vs2019.13F12A13B
mov     al,1
jmp     oglmdi2_vs2019.13F12A13B
xor     al,al
jmp     oglmdi2_vs2019.13F12A13B
xor     al,al
add     rsp,18
ret     
push    rbx
sub     rsp,20
mov     bl,cl
call    oglmdi2_vs2019.13F12A7A8
xor     edx,edx
test    eax,eax
je      oglmdi2_vs2019.13F12A15E
test    bl,bl
jne     oglmdi2_vs2019.13F12A15E
xchg    qword ptr ds:[13F14D708],rdx
add     rsp,20
pop     rbx
ret     
push    rbx
sub     rsp,20
cmp     byte ptr ds:[13F14D710],0
mov     bl,cl
je      oglmdi2_vs2019.13F12A179
test    dl,dl
jne     oglmdi2_vs2019.13F12A185
call    oglmdi2_vs2019.13F1327D4
mov     cl,bl
call    oglmdi2_vs2019.13F12B79C
mov     al,1
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
cmp     qword ptr ds:[13F14D718],FFFFFFFFFFFFFFFF
mov     rbx,rcx
jne     oglmdi2_vs2019.13F12A1AA
call    oglmdi2_vs2019.13F1325D8
jmp     oglmdi2_vs2019.13F12A1B9
mov     rdx,rbx
lea     rcx,qword ptr ds:[13F14D718]
call    oglmdi2_vs2019.13F13264C
xor     edx,edx
test    eax,eax
cmove   rdx,rbx
mov     rax,rdx
add     rsp,20
pop     rbx
ret     
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12A190
neg     rax
sbb     eax,eax
neg     eax
dec     eax
add     rsp,28
ret     
int3    
ret     0
int3    
jmp     oglmdi2_vs2019.13F12ECA8
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
jmp     oglmdi2_vs2019.13F12A20A
mov     rcx,rbx
call    oglmdi2_vs2019.13F132814
test    eax,eax
je      oglmdi2_vs2019.13F12A21A
mov     rcx,rbx
call    oglmdi2_vs2019.13F12ECBC
test    rax,rax
je      oglmdi2_vs2019.13F12A1FB
add     rsp,20
pop     rbx
ret     
cmp     rbx,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F12A226
call    oglmdi2_vs2019.13F12A904
int3    
call    oglmdi2_vs2019.13F12A924
int3    
mov     qword ptr ss:[rsp+20],rbx
push    rbp
mov     rbp,rsp
sub     rsp,20
mov     rax,qword ptr ds:[13F14C058]
movabs  rbx,2B992DDFA232
cmp     rax,rbx
jne     oglmdi2_vs2019.13F12A2C3
and     qword ptr ss:[rbp+18],0
lea     rcx,qword ptr ss:[rbp+18]
call    qword ptr ds:[<&GetSystemTimeAsFileTime>]
mov     rax,qword ptr ss:[rbp+18]
mov     qword ptr ss:[rbp+10],rax
call    qword ptr ds:[<&GetCurrentThreadId>]
mov     eax,eax
xor     qword ptr ss:[rbp+10],rax
call    qword ptr ds:[<&GetCurrentProcessId>]
mov     eax,eax
lea     rcx,qword ptr ss:[rbp+20]
xor     qword ptr ss:[rbp+10],rax
call    qword ptr ds:[<&QueryPerformanceCounter>]
mov     eax,dword ptr ss:[rbp+20]
lea     rcx,qword ptr ss:[rbp+10]
shl     rax,20
xor     rax,qword ptr ss:[rbp+20]
xor     rax,qword ptr ss:[rbp+10]
xor     rax,rcx
movabs  rcx,FFFFFFFFFFFF
and     rax,rcx
movabs  rcx,2B992DDFA233
cmp     rax,rbx
cmove   rax,rcx
mov     qword ptr ds:[13F14C058],rax
mov     rbx,qword ptr ss:[rsp+48]
not     rax
mov     qword ptr ds:[13F14C050],rax
add     rsp,20
pop     rbp
ret     
xor     eax,eax
ret     
int3    
mov     eax,1
ret     
int3    
int3    
mov     eax,4000
ret     
int3    
int3    
lea     rcx,qword ptr ds:[13F14D750]
jmp     qword ptr ds:[<&RtlInitializeSListHead>]
int3    
int3    
mov     al,1
ret     
int3    
lea     rax,qword ptr ds:[13F14D760]
ret     
sub     rsp,28
call    oglmdi2_vs2019.13F121260
or      qword ptr ds:[rax],24
call    oglmdi2_vs2019.13F12A300
or      qword ptr ds:[rax],2
add     rsp,28
ret     
int3    
xor     eax,eax
cmp     dword ptr ds:[13F14C064],eax
sete    al
ret     
lea     rax,qword ptr ds:[13F14E360]
ret     
lea     rax,qword ptr ds:[13F14E358]
ret     
and     dword ptr ds:[13F14D768],0
ret     
mov     qword ptr ss:[rsp+8],rbx
push    rbp
lea     rbp,qword ptr ss:[rsp-4C0]
sub     rsp,5C0
mov     ebx,ecx
mov     ecx,17
call    <oglmdi2_vs2019.IsProcessorFeaturePresent>
test    eax,eax
je      oglmdi2_vs2019.13F12A371
mov     ecx,ebx
int     29
mov     ecx,3
call    oglmdi2_vs2019.13F12A340
xor     edx,edx
lea     rcx,qword ptr ss:[rbp-10]
mov     r8d,4D0
call    oglmdi2_vs2019.13F12B280
lea     rcx,qword ptr ss:[rbp-10]
call    qword ptr ds:[<&RtlCaptureContext>]
mov     rbx,qword ptr ss:[rbp+E8]
lea     rdx,qword ptr ss:[rbp+4D8]
mov     rcx,rbx
xor     r8d,r8d
call    qword ptr ds:[<&RtlLookupFunctionEntry>]
test    rax,rax
je      oglmdi2_vs2019.13F12A3F1
and     qword ptr ss:[rsp+38],0
lea     rcx,qword ptr ss:[rbp+4E0]
mov     rdx,qword ptr ss:[rbp+4D8]
mov     r9,rax
mov     qword ptr ss:[rsp+30],rcx
mov     r8,rbx
lea     rcx,qword ptr ss:[rbp+4E8]
mov     qword ptr ss:[rsp+28],rcx
lea     rcx,qword ptr ss:[rbp-10]
mov     qword ptr ss:[rsp+20],rcx
xor     ecx,ecx
call    qword ptr ds:[<&RtlVirtualUnwind>]
mov     rax,qword ptr ss:[rbp+4C8]
lea     rcx,qword ptr ss:[rsp+50]
mov     qword ptr ss:[rbp+E8],rax
xor     edx,edx
lea     rax,qword ptr ss:[rbp+4C8]
mov     r8d,98
add     rax,8
mov     qword ptr ss:[rbp+88],rax
call    oglmdi2_vs2019.13F12B280
mov     rax,qword ptr ss:[rbp+4C8]
mov     qword ptr ss:[rsp+60],rax
mov     dword ptr ss:[rsp+50],40000015
mov     dword ptr ss:[rsp+54],1
call    qword ptr ds:[<&IsDebuggerPresent>]
cmp     eax,1
lea     rax,qword ptr ss:[rsp+50]
mov     qword ptr ss:[rsp+40],rax
lea     rax,qword ptr ss:[rbp-10]
sete    bl
mov     qword ptr ss:[rsp+48],rax
xor     ecx,ecx
call    qword ptr ds:[<&SetUnhandledExceptionFilter>]
lea     rcx,qword ptr ss:[rsp+40]
call    qword ptr ds:[<&UnhandledExceptionFilter>]
test    eax,eax
jne     oglmdi2_vs2019.13F12A481
test    bl,bl
jne     oglmdi2_vs2019.13F12A481
lea     ecx,dword ptr ds:[rax+3]
call    oglmdi2_vs2019.13F12A340
mov     rbx,qword ptr ss:[rsp+5D0]
add     rsp,5C0
pop     rbp
ret     
int3    
int3    
sub     rsp,98
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+20]
lea     r8d,dword ptr ds:[rdx+68]
call    oglmdi2_vs2019.13F12B280
lea     rcx,qword ptr ss:[rsp+20]
call    qword ptr ds:[<&GetStartupInfoW>]
test    byte ptr ss:[rsp+5C],1
mov     eax,A
cmovne  ax,word ptr ss:[rsp+60]
add     rsp,98
ret     
int3    
int3    
jmp     oglmdi2_vs2019.13F12A2D8
int3    
int3    
int3    
sub     rsp,28
xor     ecx,ecx
call    qword ptr ds:[<&GetModuleHandleW>]
test    rax,rax
je      oglmdi2_vs2019.13F12A523
mov     ecx,5A4D
cmp     word ptr ds:[rax],cx
jne     oglmdi2_vs2019.13F12A523
movsxd  rcx,dword ptr ds:[rax+3C]
add     rcx,rax
cmp     dword ptr ds:[rcx],4550
jne     oglmdi2_vs2019.13F12A523
mov     eax,20B
cmp     word ptr ds:[rcx+18],ax
jne     oglmdi2_vs2019.13F12A523
cmp     dword ptr ds:[rcx+84],E
jbe     oglmdi2_vs2019.13F12A523
cmp     dword ptr ds:[rcx+F8],0
je      oglmdi2_vs2019.13F12A523
mov     al,1
jmp     oglmdi2_vs2019.13F12A525
xor     al,al
add     rsp,28
ret     
int3    
int3    
lea     rcx,qword ptr ds:[13F12A53C]
jmp     qword ptr ds:[<&SetUnhandledExceptionFilter>]
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rbx,qword ptr ds:[rcx]
mov     rdi,rcx
cmp     dword ptr ds:[rbx],E06D7363
jne     oglmdi2_vs2019.13F12A570
cmp     dword ptr ds:[rbx+18],4
jne     oglmdi2_vs2019.13F12A570
mov     edx,dword ptr ds:[rbx+20]
lea     eax,dword ptr ds:[rdx-19930520]
cmp     eax,2
jbe     oglmdi2_vs2019.13F12A57D
cmp     edx,1994000
je      oglmdi2_vs2019.13F12A57D
mov     rbx,qword ptr ss:[rsp+30]
xor     eax,eax
add     rsp,20
pop     rdi
ret     
call    oglmdi2_vs2019.13F12B74C
mov     qword ptr ds:[rax],rbx
mov     rbx,qword ptr ds:[rdi+8]
call    oglmdi2_vs2019.13F12B760
mov     qword ptr ds:[rax],rbx
call    oglmdi2_vs2019.13F1313E8
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
lea     rbx,qword ptr ds:[13F149B58]
lea     rdi,qword ptr ds:[13F149B58]
jmp     oglmdi2_vs2019.13F12A5C4
mov     rax,qword ptr ds:[rbx]
test    rax,rax
je      oglmdi2_vs2019.13F12A5C0
call    qword ptr ds:[13F140490]
add     rbx,8
cmp     rbx,rdi
jb      oglmdi2_vs2019.13F12A5B2
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
lea     rbx,qword ptr ds:[13F149B68]
lea     rdi,qword ptr ds:[13F149B68]
jmp     oglmdi2_vs2019.13F12A600
mov     rax,qword ptr ds:[rbx]
test    rax,rax
je      oglmdi2_vs2019.13F12A5FC
call    qword ptr ds:[13F140490]
add     rbx,8
cmp     rbx,rdi
jb      oglmdi2_vs2019.13F12A5EE
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,10
xor     eax,eax
xor     ecx,ecx
cpuid   
mov     r8d,ecx
xor     r11d,r11d
mov     r9d,ebx
xor     r8d,6C65746E
xor     r9d,756E6547
mov     r10d,edx
mov     esi,eax
xor     ecx,ecx
lea     eax,dword ptr ds:[r11+1]
or      r9d,r8d
cpuid   
xor     r10d,49656E69
mov     dword ptr ss:[rsp],eax
or      r9d,r10d
mov     dword ptr ss:[rsp+4],ebx
mov     edi,ecx
mov     dword ptr ss:[rsp+8],ecx
mov     dword ptr ss:[rsp+C],edx
jne     oglmdi2_vs2019.13F12A6B9
or      qword ptr ds:[13F14C070],FFFFFFFFFFFFFFFF
and     eax,FFF3FF0
cmp     eax,106C0
je      oglmdi2_vs2019.13F12A6A5
cmp     eax,20660
je      oglmdi2_vs2019.13F12A6A5
cmp     eax,20670
je      oglmdi2_vs2019.13F12A6A5
add     eax,FFFCF9B0
cmp     eax,20
ja      oglmdi2_vs2019.13F12A6B9
movabs  rcx,100010001
bt      rcx,rax
jae     oglmdi2_vs2019.13F12A6B9
mov     r8d,dword ptr ds:[13F14D76C]
or      r8d,1
mov     dword ptr ds:[13F14D76C],r8d
jmp     oglmdi2_vs2019.13F12A6C0
mov     r8d,dword ptr ds:[13F14D76C]
mov     eax,7
lea     r9d,dword ptr ds:[rax-5]
cmp     esi,eax
jl      oglmdi2_vs2019.13F12A6F3
xor     ecx,ecx
cpuid   
mov     dword ptr ss:[rsp],eax
mov     r11d,ebx
mov     dword ptr ss:[rsp+4],ebx
mov     dword ptr ss:[rsp+8],ecx
mov     dword ptr ss:[rsp+C],edx
bt      ebx,9
jae     oglmdi2_vs2019.13F12A6F3
or      r8d,r9d
mov     dword ptr ds:[13F14D76C],r8d
mov     dword ptr ds:[13F14C068],1
mov     dword ptr ds:[13F14C06C],r9d
bt      edi,14
jae     oglmdi2_vs2019.13F12A796
mov     dword ptr ds:[13F14C068],r9d
mov     ebx,6
mov     dword ptr ds:[13F14C06C],ebx
bt      edi,1B
jae     oglmdi2_vs2019.13F12A796
bt      edi,1C
jae     oglmdi2_vs2019.13F12A796
xor     ecx,ecx
xgetbv  
shl     rdx,20
or      rdx,rax
mov     qword ptr ss:[rsp+20],rdx
mov     rax,qword ptr ss:[rsp+20]
and     al,bl
cmp     al,bl
jne     oglmdi2_vs2019.13F12A796
mov     eax,dword ptr ds:[13F14C06C]
or      eax,8
mov     dword ptr ds:[13F14C068],3
mov     dword ptr ds:[13F14C06C],eax
test    r11b,20
je      oglmdi2_vs2019.13F12A796
mov     ecx,D0030000
mov     dword ptr ds:[13F14C068],5
or      eax,20
and     r11d,ecx
mov     dword ptr ds:[13F14C06C],eax
cmp     r11d,ecx
jne     oglmdi2_vs2019.13F12A796
or      eax,40
mov     dword ptr ds:[13F14C068],ebx
mov     dword ptr ds:[13F14C06C],eax
mov     rbx,qword ptr ss:[rsp+28]
xor     eax,eax
mov     rsi,qword ptr ss:[rsp+30]
add     rsp,10
pop     rdi
ret     
xor     eax,eax
cmp     dword ptr ds:[13F14E350],eax
setne   al
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
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     rax,rdx
lea     rcx,qword ptr ds:[13F140FB8]
xorps   xmm0,xmm0
mov     qword ptr ds:[rbx],rcx
lea     rdx,qword ptr ds:[rbx+8]
lea     rcx,qword ptr ds:[rax+8]
movups  xmmword ptr ds:[rdx],xmm0
call    oglmdi2_vs2019.13F12B7E0
lea     rax,qword ptr ds:[13F140FE8]
mov     qword ptr ds:[rbx],rax
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
and     qword ptr ds:[rcx+10],0
lea     rax,qword ptr ds:[13F140FF8]
mov     qword ptr ds:[rcx+8],rax
lea     rax,qword ptr ds:[13F140FE8]
mov     qword ptr ds:[rcx],rax
mov     rax,rcx
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     rax,rdx
lea     rcx,qword ptr ds:[13F140FB8]
xorps   xmm0,xmm0
mov     qword ptr ds:[rbx],rcx
lea     rdx,qword ptr ds:[rbx+8]
lea     rcx,qword ptr ds:[rax+8]
movups  xmmword ptr ds:[rdx],xmm0
call    oglmdi2_vs2019.13F12B7E0
lea     rax,qword ptr ds:[13F141010]
mov     qword ptr ds:[rbx],rax
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
and     qword ptr ds:[rcx+10],0
lea     rax,qword ptr ds:[13F141020]
mov     qword ptr ds:[rcx+8],rax
lea     rax,qword ptr ds:[13F141010]
mov     qword ptr ds:[rcx],rax
mov     rax,rcx
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     rax,rdx
lea     rcx,qword ptr ds:[13F140FB8]
xorps   xmm0,xmm0
mov     qword ptr ds:[rbx],rcx
lea     rdx,qword ptr ds:[rbx+8]
lea     rcx,qword ptr ds:[rax+8]
movups  xmmword ptr ds:[rdx],xmm0
call    oglmdi2_vs2019.13F12B7E0
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
int3    
int3    
lea     rax,qword ptr ds:[13F140FB8]
mov     qword ptr ds:[rcx],rax
add     rcx,8
jmp     oglmdi2_vs2019.13F12B870
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
lea     rax,qword ptr ds:[13F140FB8]
mov     rdi,rcx
mov     qword ptr ds:[rcx],rax
mov     ebx,edx
add     rcx,8
call    oglmdi2_vs2019.13F12B870
test    bl,1
je      oglmdi2_vs2019.13F12A8F4
mov     edx,18
mov     rcx,rdi
call    oglmdi2_vs2019.13F129A74
mov     rbx,qword ptr ss:[rsp+30]
mov     rax,rdi
add     rsp,20
pop     rdi
ret     
int3    
int3    
sub     rsp,48
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F12A7FC
lea     rdx,qword ptr ds:[13F14AE60]
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F12B898
int3    
sub     rsp,48
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F12A858
lea     rdx,qword ptr ds:[13F14AEE8]
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F12B898
int3    
cmp     qword ptr ds:[rcx+8],0
lea     rax,qword ptr ds:[13F140FC8]
cmovne  rax,qword ptr ds:[rcx+8]
ret     
int3    
int3    
push    rbx
sub     rsp,20
lea     rax,qword ptr ds:[13F141040]
mov     rbx,rcx
mov     qword ptr ds:[rcx],rax
test    dl,1
je      oglmdi2_vs2019.13F12A97A
mov     edx,18
call    oglmdi2_vs2019.13F129A74
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+20],r9
mov     qword ptr ds:[rax+18],r8
mov     qword ptr ds:[rax+10],rdx
mov     qword ptr ds:[rax+8],rcx
push    rbx
sub     rsp,70
mov     rbx,rcx
and     dword ptr ds:[rax-38],0
mov     qword ptr ds:[rax-20],rcx
mov     qword ptr ds:[rax-18],r8
call    oglmdi2_vs2019.13F12B958
lea     rdx,qword ptr ss:[rsp+58]
mov     ecx,dword ptr ds:[rbx]
mov     rax,qword ptr ds:[rax+10]
call    qword ptr ds:[13F140490]
mov     dword ptr ss:[rsp+40],0
jmp     oglmdi2_vs2019.13F12A9CB
mov     eax,dword ptr ss:[rsp+40]
add     rsp,70
pop     rbx
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
mov     bl,byte ptr ds:[rcx]
lea     r10,qword ptr ds:[rcx+1]
mov     byte ptr ds:[rdx],bl
mov     esi,r9d
lea     r14,qword ptr ds:[13F120000]
mov     rbp,r8
mov     r11,rdx
mov     rdi,rcx
test    bl,4
je      oglmdi2_vs2019.13F12AA31
movzx   ecx,byte ptr ds:[r10]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r14+21048]
mov     cl,byte ptr ds:[rcx+r14+21058]
sub     r10,rax
mov     eax,dword ptr ds:[r10-4]
shr     eax,cl
mov     dword ptr ds:[rdx+4],eax
test    bl,8
je      oglmdi2_vs2019.13F12AA40
mov     eax,dword ptr ds:[r10]
add     r10,4
mov     dword ptr ds:[rdx+8],eax
test    bl,10
je      oglmdi2_vs2019.13F12AA4F
mov     eax,dword ptr ds:[r10]
add     r10,4
mov     dword ptr ds:[rdx+C],eax
movsxd  rax,dword ptr ds:[r10]
lea     r8,qword ptr ds:[r10+4]
xor     r9d,r9d
cmp     byte ptr ss:[rsp+30],r9b
jne     oglmdi2_vs2019.13F12AAB0
test    bl,2
je      oglmdi2_vs2019.13F12AAB0
lea     rdx,qword ptr ds:[rax+rbp]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r14+21048]
mov     cl,byte ptr ds:[rcx+r14+21058]
sub     rdx,rax
mov     r10d,dword ptr ds:[rdx-4]
shr     r10d,cl
mov     dword ptr ds:[r11+10],r9d
test    r10d,r10d
je      oglmdi2_vs2019.13F12AAB3
mov     eax,dword ptr ds:[rdx]
mov     ecx,dword ptr ds:[rdx+4]
lea     rdx,qword ptr ds:[rdx+8]
cmp     eax,esi
je      oglmdi2_vs2019.13F12AAAA
inc     r9d
cmp     r9d,r10d
jb      oglmdi2_vs2019.13F12AA93
jmp     oglmdi2_vs2019.13F12AAB3
mov     dword ptr ds:[r11+10],ecx
jmp     oglmdi2_vs2019.13F12AAB3
mov     dword ptr ds:[rdx+10],eax
test    bl,1
je      oglmdi2_vs2019.13F12AADD
movzx   ecx,byte ptr ds:[r8]
and     ecx,F
movsx   rdx,byte ptr ds:[rcx+r14+21048]
mov     cl,byte ptr ds:[rcx+r14+21058]
sub     r8,rdx
mov     edx,dword ptr ds:[r8-4]
shr     edx,cl
mov     dword ptr ds:[r11+14],edx
mov     rbx,qword ptr ss:[rsp+10]
sub     r8,rdi
mov     rbp,qword ptr ss:[rsp+18]
mov     rax,r8
mov     rsi,qword ptr ss:[rsp+20]
mov     rdi,qword ptr ss:[rsp+28]
pop     r14
ret     
int3    
int3    
mov     al,byte ptr ds:[rdx]
and     al,1
ret     
int3    
int3    
int3    
sub     rsp,28
test    byte ptr ds:[r8],1
mov     rcx,qword ptr ds:[rcx]
mov     qword ptr ss:[rsp+30],rcx
je      oglmdi2_vs2019.13F12AB23
mov     eax,dword ptr ds:[r8+14]
mov     rcx,qword ptr ds:[rax+rcx]
mov     qword ptr ss:[rsp+30],rcx
or      r9d,FFFFFFFF
lea     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F12D2A8
add     rsp,28
ret     
int3    
int3    
mov     rax,qword ptr ds:[rcx]
mov     rdx,rcx
mov     qword ptr ds:[r9],rax
test    byte ptr ds:[r8],1
je      oglmdi2_vs2019.13F12AB55
mov     ecx,dword ptr ds:[r8+14]
mov     rax,qword ptr ds:[rdx]
mov     rcx,qword ptr ds:[rcx+rax]
mov     qword ptr ds:[r9],rcx
mov     rax,r9
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rsi
mov     qword ptr ds:[rax+18],rdi
push    rbp
push    r14
push    r15
mov     rbp,rsp
sub     rsp,60
mov     rbx,rdx
mov     qword ptr ss:[rbp-40],rdx
movaps  xmmword ptr ds:[rax-28],xmm6
mov     r14,rcx
mov     qword ptr ss:[rbp-30],rdx
xor     edi,edi
mov     dword ptr ss:[rbp-38],edi
lea     rdx,qword ptr ss:[rbp-20]
movaps  xmm6,xmmword ptr ss:[rbp-40]
mov     rcx,rbx
movdqa  xmmword ptr ss:[rbp-20],xmm6
mov     r15d,r8d
xor     esi,esi
call    oglmdi2_vs2019.13F12ADF4
xor     r8d,r8d
cmp     dword ptr ds:[rbx],esi
je      oglmdi2_vs2019.13F12AC6B
lea     r9,qword ptr ds:[13F120000]
mov     rax,qword ptr ds:[rbx+18]
cmp     r15d,eax
jl      oglmdi2_vs2019.13F12ABD8
shr     rax,20
cmp     r15d,eax
jg      oglmdi2_vs2019.13F12ABD8
test    edi,edi
mov     esi,r8d
cmovne  edi,r8d
mov     dword ptr ss:[rbp-38],edi
mov     rdx,qword ptr ds:[rbx+8]
inc     r8d
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r9+21048]
mov     cl,byte ptr ds:[rcx+r9+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[rbx+8],rdx
mov     dword ptr ds:[rbx+18],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r9+21048]
mov     cl,byte ptr ds:[rcx+r9+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[rbx+8],rdx
mov     dword ptr ds:[rbx+1C],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r9+21048]
mov     cl,byte ptr ds:[rcx+r9+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     dword ptr ds:[rbx+20],eax
lea     rax,qword ptr ds:[rdx+4]
mov     qword ptr ds:[rbx+8],rdx
mov     ecx,dword ptr ds:[rdx]
mov     qword ptr ds:[rbx+8],rax
mov     dword ptr ds:[rbx+24],ecx
cmp     r8d,dword ptr ds:[rbx]
jne     oglmdi2_vs2019.13F12ABBA
movaps  xmm6,xmmword ptr ss:[rbp-40]
inc     esi
movdqa  xmmword ptr ss:[rbp-20],xmm6
lea     rdx,qword ptr ss:[rbp-20]
mov     dword ptr ss:[rbp-28],esi
mov     rcx,rbx
call    oglmdi2_vs2019.13F12ADF4
movups  xmm0,xmmword ptr ss:[rbp-30]
lea     r11,qword ptr ss:[rsp+60]
mov     rax,r14
mov     rbx,qword ptr ds:[r11+20]
mov     rsi,qword ptr ds:[r11+28]
mov     rdi,qword ptr ds:[r11+30]
movdqu  xmmword ptr ds:[r14],xmm6
movaps  xmm6,xmmword ptr ss:[rsp+50]
movdqu  xmmword ptr ds:[r14+10],xmm0
mov     rsp,r11
pop     r15
pop     r14
pop     rbp
ret     
int3    
int3    
push    rbp
lea     rbp,qword ptr ss:[rsp-4B0]
sub     rsp,5B0
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+4A0],rax
mov     r10,qword ptr ss:[rbp+508]
lea     rax,qword ptr ds:[13F141070]
movups  xmm0,xmmword ptr ds:[rax]
mov     r11,rcx
lea     rcx,qword ptr ss:[rsp+30]
movups  xmm1,xmmword ptr ds:[rax+10]
movups  xmmword ptr ds:[rcx],xmm0
movups  xmm0,xmmword ptr ds:[rax+20]
movups  xmmword ptr ds:[rcx+10],xmm1
movups  xmm1,xmmword ptr ds:[rax+30]
movups  xmmword ptr ds:[rcx+20],xmm0
movups  xmm0,xmmword ptr ds:[rax+40]
movups  xmmword ptr ds:[rcx+30],xmm1
movups  xmm1,xmmword ptr ds:[rax+50]
movups  xmmword ptr ds:[rcx+40],xmm0
movups  xmm0,xmmword ptr ds:[rax+60]
movups  xmmword ptr ds:[rcx+50],xmm1
movups  xmm1,xmmword ptr ds:[rax+80]
movups  xmmword ptr ds:[rcx+60],xmm0
movups  xmm0,xmmword ptr ds:[rax+70]
mov     rax,qword ptr ds:[rax+90]
movups  xmmword ptr ds:[rcx+70],xmm0
movups  xmmword ptr ds:[rcx+80],xmm1
mov     qword ptr ds:[rcx+90],rax
lea     rax,qword ptr ds:[13F12CE10]
mov     qword ptr ss:[rsp+50],rax
mov     rax,qword ptr ss:[rbp+4E0]
mov     qword ptr ss:[rsp+60],rax
movsxd  rax,dword ptr ss:[rbp+4F0]
mov     qword ptr ss:[rsp+70],r8
mov     r8,qword ptr ss:[rbp+500]
mov     qword ptr ss:[rsp+68],rax
movzx   eax,byte ptr ss:[rbp+510]
mov     qword ptr ss:[rbp-78],rax
mov     rcx,qword ptr ds:[r8+18]
mov     r8,qword ptr ds:[r8+20]
add     rcx,qword ptr ds:[r10+8]
add     r8,qword ptr ds:[r10+8]
movsxd  rax,dword ptr ss:[rbp+4F8]
mov     qword ptr ss:[rbp-58],rax
mov     rax,qword ptr ds:[r10+40]
mov     qword ptr ss:[rsp+28],rax
lea     rax,qword ptr ss:[rbp-30]
mov     qword ptr ss:[rsp+58],r9
xor     r9d,r9d
mov     qword ptr ss:[rsp+78],rcx
mov     rcx,qword ptr ds:[r11]
mov     qword ptr ss:[rbp-80],rdx
mov     rdx,qword ptr ds:[r10]
mov     qword ptr ss:[rbp-68],r8
lea     r8,qword ptr ss:[rsp+30]
mov     qword ptr ss:[rsp+20],rax
mov     qword ptr ss:[rbp-70],19930520
call    qword ptr ds:[<&RtlUnwindEx>]
mov     rcx,qword ptr ss:[rbp+4A0]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,5B0
pop     rbp
ret     
mov     r8,qword ptr ds:[rcx+10]
lea     r11,qword ptr ds:[13F120000]
mov     qword ptr ds:[rcx+8],r8
mov     r9,rcx
mov     r10,rdx
movzx   ecx,byte ptr ds:[r8]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     r8,rax
mov     eax,dword ptr ds:[r8-4]
mov     qword ptr ds:[r9+8],r8
xor     r8d,r8d
shr     eax,cl
mov     dword ptr ds:[r9+18],eax
mov     rdx,qword ptr ds:[r9+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
mov     qword ptr ds:[r9+8],rdx
shr     eax,cl
mov     dword ptr ds:[r9+1C],eax
mov     rdx,qword ptr ds:[r9+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
mov     qword ptr ds:[r9+8],rdx
shr     eax,cl
mov     dword ptr ds:[r9+20],eax
mov     rax,qword ptr ds:[r9+8]
mov     ecx,dword ptr ds:[rax]
add     rax,4
mov     qword ptr ds:[r9+8],rax
mov     dword ptr ds:[r9+24],ecx
cmp     dword ptr ds:[r10+8],r8d
je      oglmdi2_vs2019.13F12AFBE
mov     rdx,qword ptr ds:[r9+8]
inc     r8d
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
mov     qword ptr ds:[r9+8],rdx
shr     eax,cl
mov     dword ptr ds:[r9+18],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
mov     qword ptr ds:[r9+8],rdx
shr     eax,cl
mov     dword ptr ds:[r9+1C],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
mov     qword ptr ds:[r9+8],rdx
shr     eax,cl
mov     dword ptr ds:[r9+20],eax
mov     eax,dword ptr ds:[rdx]
add     rdx,4
mov     dword ptr ds:[r9+24],eax
mov     qword ptr ds:[r9+8],rdx
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r9+8],rdx
mov     dword ptr ds:[r9+18],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r9+8],rdx
mov     dword ptr ds:[r9+1C],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     dword ptr ds:[r9+20],eax
lea     rax,qword ptr ds:[rdx+4]
mov     qword ptr ds:[r9+8],rdx
mov     ecx,dword ptr ds:[rdx]
mov     qword ptr ds:[r9+8],rax
mov     dword ptr ds:[r9+24],ecx
cmp     r8d,dword ptr ds:[r10+8]
jne     oglmdi2_vs2019.13F12AEA7
ret     
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     qword ptr ds:[rcx],rdx
call    oglmdi2_vs2019.13F12B958
cmp     rbx,qword ptr ds:[rax+58]
jae     oglmdi2_vs2019.13F12AFE2
call    oglmdi2_vs2019.13F12B958
mov     rcx,qword ptr ds:[rax+58]
jmp     oglmdi2_vs2019.13F12AFE4
xor     ecx,ecx
mov     qword ptr ds:[rbx+8],rcx
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+58],rbx
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rdi,rcx
call    oglmdi2_vs2019.13F12B958
cmp     rdi,qword ptr ds:[rax+58]
jne     oglmdi2_vs2019.13F12B049
call    oglmdi2_vs2019.13F12B958
mov     rdx,qword ptr ds:[rax+58]
test    rdx,rdx
je      oglmdi2_vs2019.13F12B049
mov     rbx,qword ptr ds:[rdx+8]
cmp     rdi,rdx
je      oglmdi2_vs2019.13F12B035
mov     rdx,rbx
test    rbx,rbx
je      oglmdi2_vs2019.13F12B049
jmp     oglmdi2_vs2019.13F12B022
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+58],rbx
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
call    oglmdi2_vs2019.13F132878
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12B958
mov     rax,qword ptr ds:[rax+60]
add     rsp,28
ret     
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12B958
mov     rax,qword ptr ds:[rax+68]
add     rsp,28
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+60],rbx
add     rsp,20
pop     rbx
ret     
push    rbx
sub     rsp,20
mov     rbx,rcx
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+68],rbx
add     rsp,20
pop     rbx
ret     
mov     rax,rsp
mov     qword ptr ds:[rax+10],rbx
mov     qword ptr ds:[rax+18],rbp
mov     qword ptr ds:[rax+20],rsi
push    rdi
sub     rsp,60
and     dword ptr ds:[rax-24],0
mov     rdi,r9
and     dword ptr ds:[rax-20],0
mov     rsi,r8
and     dword ptr ds:[rax-1C],0
mov     rbp,rcx
and     dword ptr ds:[rax-18],0
and     dword ptr ds:[rax-14],0
mov     rbx,qword ptr ds:[r9+8]
mov     byte ptr ds:[rax-28],0
mov     qword ptr ds:[rax+8],rdx
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+60],rbx
mov     rbx,qword ptr ss:[rbp+38]
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+68],rbx
call    oglmdi2_vs2019.13F12B958
mov     rcx,qword ptr ds:[rdi+38]
lea     rdx,qword ptr ss:[rsp+40]
mov     r8,qword ptr ds:[rdi+8]
mov     byte ptr ss:[rsp+20],0
mov     ecx,dword ptr ds:[rcx]
add     rcx,qword ptr ds:[rax+60]
mov     rax,qword ptr ds:[rdi+10]
mov     r9d,dword ptr ds:[rax]
call    oglmdi2_vs2019.13F12A9D8
mov     byte ptr ss:[rsp+38],0
lea     rax,qword ptr ss:[rsp+40]
and     qword ptr ss:[rsp+30],0
lea     rdx,qword ptr ss:[rsp+70]
and     dword ptr ss:[rsp+28],0
mov     r9,rdi
mov     r8,rsi
mov     qword ptr ss:[rsp+20],rax
mov     rcx,rbp
call    oglmdi2_vs2019.13F12C9C0
lea     r11,qword ptr ss:[rsp+60]
mov     rbx,qword ptr ds:[r11+18]
mov     rbp,qword ptr ds:[r11+20]
mov     rsi,qword ptr ds:[r11+28]
mov     rsp,r11
pop     rdi
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
int3    
nop     word ptr ds:[rax+rax]
sub     rdx,rcx
cmp     r8,8
jb      oglmdi2_vs2019.13F12B1AB
test    cl,7
je      oglmdi2_vs2019.13F12B1A2
nop     
mov     al,byte ptr ds:[rcx]
cmp     al,byte ptr ds:[rcx+rdx]
jne     oglmdi2_vs2019.13F12B1C3
inc     rcx
dec     r8
test    cl,7
jne     oglmdi2_vs2019.13F12B190
mov     r9,r8
shr     r9,3
jne     oglmdi2_vs2019.13F12B1CA
test    r8,r8
je      oglmdi2_vs2019.13F12B1BF
mov     al,byte ptr ds:[rcx]
cmp     al,byte ptr ds:[rcx+rdx]
jne     oglmdi2_vs2019.13F12B1C3
inc     rcx
dec     r8
jne     oglmdi2_vs2019.13F12B1B0
xor     rax,rax
ret     
sbb     eax,eax
sbb     eax,FFFFFFFF
ret     
nop     
shr     r9,2
je      oglmdi2_vs2019.13F12B207
mov     rax,qword ptr ds:[rcx]
cmp     rax,qword ptr ds:[rcx+rdx]
jne     oglmdi2_vs2019.13F12B234
mov     rax,qword ptr ds:[rcx+8]
cmp     rax,qword ptr ds:[rcx+rdx+8]
jne     oglmdi2_vs2019.13F12B230
mov     rax,qword ptr ds:[rcx+10]
cmp     rax,qword ptr ds:[rcx+rdx+10]
jne     oglmdi2_vs2019.13F12B22C
mov     rax,qword ptr ds:[rcx+18]
cmp     rax,qword ptr ds:[rcx+rdx+18]
jne     oglmdi2_vs2019.13F12B228
add     rcx,20
dec     r9
jne     oglmdi2_vs2019.13F12B1D0
and     r8,1F
mov     r9,r8
shr     r9,3
je      oglmdi2_vs2019.13F12B1AB
mov     rax,qword ptr ds:[rcx]
cmp     rax,qword ptr ds:[rcx+rdx]
jne     oglmdi2_vs2019.13F12B234
add     rcx,8
dec     r9
jne     oglmdi2_vs2019.13F12B210
and     r8,7
jmp     oglmdi2_vs2019.13F12B1AB
add     rcx,8
add     rcx,8
add     rcx,8
mov     rcx,qword ptr ds:[rdx+rcx]
bswap   rax
bswap   rcx
cmp     rax,rcx
sbb     eax,eax
sbb     eax,FFFFFFFF
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
int3    
nop     word ptr ds:[rax+rax]
push    rdi
mov     eax,edx
mov     rdi,rcx
mov     rcx,r8
rep stosb byte ptr ds:[rdi],al
mov     rax,r11
pop     rdi
ret     
int3    
int3    
int3    
int3    
int3    
int3    
nop     word ptr ds:[rax+rax]
mov     r11,rcx
movzx   edx,dl
movabs  r9,101010101010101
imul    r9,rdx
cmp     r8,10
jbe     oglmdi2_vs2019.13F12B390
movq    xmm0,r9
punpcklbw xmm0,xmm0
cmp     r8,80
ja      oglmdi2_vs2019.13F12B2C0
jmp     oglmdi2_vs2019.13F12B320
nop     word ptr ds:[rax+rax]
test    byte ptr ds:[13F14D76C],2
jne     oglmdi2_vs2019.13F12B260
movups  xmmword ptr ds:[rcx],xmm0
add     r8,rcx
add     rcx,10
and     rcx,FFFFFFFFFFFFFFF0
sub     r8,rcx
mov     r9,r8
shr     r9,7
je      oglmdi2_vs2019.13F12B320
cmp     r9,qword ptr ds:[13F14C078]
ja      oglmdi2_vs2019.13F12B350
movaps  xmmword ptr ds:[rcx],xmm0
movaps  xmmword ptr ds:[rcx+10],xmm0
add     rcx,80
movaps  xmmword ptr ds:[rcx-60],xmm0
movaps  xmmword ptr ds:[rcx-50],xmm0
dec     r9
movaps  xmmword ptr ds:[rcx-40],xmm0
movaps  xmmword ptr ds:[rcx-30],xmm0
movaps  xmmword ptr ds:[rcx-20],xmm0
movapd  xmmword ptr ds:[rcx-10],xmm0
jne     oglmdi2_vs2019.13F12B2F0
and     r8,7F
mov     r9,r8
shr     r9,4
je      oglmdi2_vs2019.13F12B33C
nop     dword ptr ds:[rax]
movups  xmmword ptr ds:[rcx],xmm0
add     rcx,10
dec     r9
jne     oglmdi2_vs2019.13F12B330
and     r8,F
je      oglmdi2_vs2019.13F12B348
movups  xmmword ptr ds:[rcx+r8-10],xmm0
mov     rax,r11
ret     
nop     dword ptr ds:[rax]
movntps xmmword ptr ds:[rcx],xmm0
movntps xmmword ptr ds:[rcx+10],xmm0
add     rcx,80
movntps xmmword ptr ds:[rcx-60],xmm0
movntps xmmword ptr ds:[rcx-50],xmm0
dec     r9
movntps xmmword ptr ds:[rcx-40],xmm0
movntps xmmword ptr ds:[rcx-30],xmm0
movntps xmmword ptr ds:[rcx-20],xmm0
movntps xmmword ptr ds:[rcx-10],xmm0
jne     oglmdi2_vs2019.13F12B350
sfence  
and     r8,7F
jmp     oglmdi2_vs2019.13F12B320
nop     word ptr ds:[rax+rax]
mov     rdx,r9
lea     r9,qword ptr ds:[13F120000]
mov     eax,dword ptr ds:[r9+r8*4+31000]
add     r9,rax
add     rcx,r8
mov     rax,r11
jmp     r9
nop     
mov     qword ptr ds:[rcx-F],rdx
mov     dword ptr ds:[rcx-7],edx
mov     word ptr ds:[rcx-3],dx
mov     byte ptr ds:[rcx-1],dl
ret     
nop     
mov     qword ptr ds:[rcx-C],rdx
mov     dword ptr ds:[rcx-4],edx
ret     
mov     qword ptr ds:[rcx-9],rdx
mov     byte ptr ds:[rcx-1],dl
ret     
mov     qword ptr ds:[rcx-D],rdx
mov     dword ptr ds:[rcx-5],edx
mov     byte ptr ds:[rcx-1],dl
ret     
nop     dword ptr ds:[rax+rax]
mov     qword ptr ds:[rcx-E],rdx
mov     dword ptr ds:[rcx-6],edx
mov     word ptr ds:[rcx-2],dx
ret     
mov     qword ptr ds:[rax],rdx
ret     
mov     qword ptr ds:[rax],rdx
mov     word ptr ds:[rax+8],dx
mov     byte ptr ds:[rax+A],dl
ret     
nop     dword ptr ds:[rax+rax]
mov     qword ptr ds:[rax],rdx
mov     word ptr ds:[rax+8],dx
ret     
mov     qword ptr ds:[rax],rdx
mov     qword ptr ds:[rax+8],rdx
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,40
mov     rbp,rcx
mov     r15,r9
mov     rcx,r8
mov     rdi,r8
mov     r13,rdx
call    oglmdi2_vs2019.13F12D994
mov     r12,qword ptr ds:[r15+8]
mov     r14,qword ptr ds:[r15]
mov     rbx,qword ptr ds:[r15+38]
sub     r14,r12
test    byte ptr ss:[rbp+4],66
mov     esi,dword ptr ds:[r15+48]
jne     oglmdi2_vs2019.13F12B538
mov     qword ptr ss:[rsp+30],rbp
mov     qword ptr ss:[rsp+38],rdi
cmp     esi,dword ptr ds:[rbx]
jae     oglmdi2_vs2019.13F12B5F8
mov     edi,esi
add     rdi,rdi
mov     eax,dword ptr ds:[rbx+rdi*8+4]
cmp     r14,rax
jb      oglmdi2_vs2019.13F12B52A
mov     eax,dword ptr ds:[rbx+rdi*8+8]
cmp     r14,rax
jae     oglmdi2_vs2019.13F12B52A
cmp     dword ptr ds:[rbx+rdi*8+10],0
je      oglmdi2_vs2019.13F12B52A
cmp     dword ptr ds:[rbx+rdi*8+C],1
je      oglmdi2_vs2019.13F12B4B6
mov     eax,dword ptr ds:[rbx+rdi*8+C]
lea     rcx,qword ptr ss:[rsp+30]
add     rax,r12
mov     rdx,r13
call    rax
test    eax,eax
js      oglmdi2_vs2019.13F12B531
jle     oglmdi2_vs2019.13F12B52A
cmp     dword ptr ss:[rbp],E06D7363
jne     oglmdi2_vs2019.13F12B4E7
cmp     qword ptr ds:[13F141108],0
je      oglmdi2_vs2019.13F12B4E7
lea     rcx,qword ptr ds:[13F141108]
call    oglmdi2_vs2019.13F13F300
test    eax,eax
je      oglmdi2_vs2019.13F12B4E7
mov     edx,1
mov     rcx,rbp
call    qword ptr ds:[13F141108]
mov     ecx,dword ptr ds:[rbx+rdi*8+10]
mov     r8d,1
add     rcx,r12
mov     rdx,r13
call    oglmdi2_vs2019.13F12D960
mov     rax,qword ptr ds:[r15+40]
mov     r8,rbp
mov     edx,dword ptr ds:[rbx+rdi*8+10]
mov     rcx,r13
mov     r9d,dword ptr ss:[rbp]
add     rdx,r12
mov     qword ptr ss:[rsp+28],rax
mov     rax,qword ptr ds:[r15+28]
mov     qword ptr ss:[rsp+20],rax
call    qword ptr ds:[<&RtlUnwindEx>]
call    oglmdi2_vs2019.13F12D990
inc     esi
jmp     oglmdi2_vs2019.13F12B466
xor     eax,eax
jmp     oglmdi2_vs2019.13F12B5FD
mov     rdi,qword ptr ds:[r15+20]
mov     r9d,dword ptr ds:[rbx]
sub     rdi,r12
cmp     esi,r9d
jae     oglmdi2_vs2019.13F12B5F8
mov     r8d,r9d
mov     edx,esi
mov     ecx,r8d
add     rdx,rdx
mov     eax,dword ptr ds:[rbx+rdx*8+4]
cmp     r14,rax
jb      oglmdi2_vs2019.13F12B5EB
mov     eax,dword ptr ds:[rbx+rdx*8+8]
cmp     r14,rax
jae     oglmdi2_vs2019.13F12B5EB
mov     r11d,dword ptr ss:[rbp+4]
and     r11d,20
je      oglmdi2_vs2019.13F12B5BA
xor     r10d,r10d
test    r8d,r8d
je      oglmdi2_vs2019.13F12B5B2
mov     ecx,r10d
add     rcx,rcx
mov     eax,dword ptr ds:[rbx+rcx*8+4]
cmp     rdi,rax
jb      oglmdi2_vs2019.13F12B5AA
mov     eax,dword ptr ds:[rbx+rcx*8+8]
cmp     rdi,rax
jae     oglmdi2_vs2019.13F12B5AA
mov     eax,dword ptr ds:[rbx+rdx*8+10]
cmp     dword ptr ds:[rbx+rcx*8+10],eax
jne     oglmdi2_vs2019.13F12B5AA
mov     eax,dword ptr ds:[rbx+rdx*8+C]
cmp     dword ptr ds:[rbx+rcx*8+C],eax
je      oglmdi2_vs2019.13F12B5B2
inc     r10d
cmp     r10d,r8d
jb      oglmdi2_vs2019.13F12B57E
mov     ecx,r9d
cmp     r10d,r9d
jne     oglmdi2_vs2019.13F12B5F8
mov     eax,dword ptr ds:[rbx+rdx*8+10]
test    eax,eax
je      oglmdi2_vs2019.13F12B5CE
cmp     rdi,rax
jne     oglmdi2_vs2019.13F12B5EB
test    r11d,r11d
jne     oglmdi2_vs2019.13F12B5F8
jmp     oglmdi2_vs2019.13F12B5EB
lea     eax,dword ptr ds:[rsi+1]
mov     cl,1
mov     dword ptr ds:[r15+48],eax
mov     r8d,dword ptr ds:[rbx+rdx*8+C]
mov     rdx,r13
add     r8,r12
call    r8
mov     r9d,dword ptr ds:[rbx]
mov     ecx,r9d
inc     esi
mov     r8d,ecx
cmp     esi,ecx
jb      oglmdi2_vs2019.13F12B54E
mov     eax,1
lea     r11,qword ptr ss:[rsp+40]
mov     rbx,qword ptr ds:[r11+30]
mov     rbp,qword ptr ds:[r11+38]
mov     rsi,qword ptr ds:[r11+40]
mov     rsp,r11
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
ret     
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F12B688
mov     byte ptr ss:[rsp+10],dl
sub     rsp,48
cmp     dword ptr ds:[rcx],E06D7363
jne     oglmdi2_vs2019.13F12B684
cmp     dword ptr ds:[rcx+18],4
jne     oglmdi2_vs2019.13F12B684
mov     eax,dword ptr ds:[rcx+20]
sub     eax,19930520
cmp     eax,2
ja      oglmdi2_vs2019.13F12B684
mov     rax,qword ptr ds:[rcx+30]
test    rax,rax
je      oglmdi2_vs2019.13F12B684
movsxd  rdx,dword ptr ds:[rax+4]
test    edx,edx
je      oglmdi2_vs2019.13F12B666
add     rdx,qword ptr ds:[rcx+38]
mov     rcx,qword ptr ds:[rcx+28]
call    oglmdi2_vs2019.13F12B68C
jmp     oglmdi2_vs2019.13F12B684
jmp     oglmdi2_vs2019.13F12B684
test    byte ptr ds:[rax],10
je      oglmdi2_vs2019.13F12B684
mov     rax,qword ptr ds:[rcx+28]
mov     rcx,qword ptr ds:[rax]
test    rcx,rcx
je      oglmdi2_vs2019.13F12B684
mov     rax,qword ptr ds:[rcx]
mov     rax,qword ptr ds:[rax+10]
call    qword ptr ds:[13F140490]
add     rsp,48
ret     
int3    
int3    
int3    
jmp     rdx
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
call    oglmdi2_vs2019.13F12B958
mov     rdx,qword ptr ds:[rax+58]
jmp     oglmdi2_vs2019.13F12B6AD
cmp     qword ptr ds:[rdx],rbx
je      oglmdi2_vs2019.13F12B6BB
mov     rdx,qword ptr ds:[rdx+8]
test    rdx,rdx
jne     oglmdi2_vs2019.13F12B6A4
lea     eax,dword ptr ds:[rdx+1]
add     rsp,20
pop     rbx
ret     
xor     eax,eax
jmp     oglmdi2_vs2019.13F12B6B5
int3    
movsxd  rax,dword ptr ds:[rdx]
add     rax,rcx
cmp     dword ptr ds:[rdx+4],0
jl      oglmdi2_vs2019.13F12B6E2
movsxd  r9,dword ptr ds:[rdx+4]
movsxd  rdx,dword ptr ds:[rdx+8]
mov     rcx,qword ptr ds:[r9+rcx]
movsxd  r8,dword ptr ds:[rdx+rcx]
add     r8,r9
add     rax,r8
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rdi,qword ptr ds:[rcx]
mov     rbx,rcx
cmp     dword ptr ds:[rdi],E0434352
je      oglmdi2_vs2019.13F12B70E
cmp     dword ptr ds:[rdi],E0434F4D
je      oglmdi2_vs2019.13F12B70E
cmp     dword ptr ds:[rdi],E06D7363
je      oglmdi2_vs2019.13F12B72E
jmp     oglmdi2_vs2019.13F12B721
call    oglmdi2_vs2019.13F12B958
cmp     dword ptr ds:[rax+30],0
jle     oglmdi2_vs2019.13F12B721
call    oglmdi2_vs2019.13F12B958
dec     dword ptr ds:[rax+30]
mov     rbx,qword ptr ss:[rsp+30]
xor     eax,eax
add     rsp,20
pop     rdi
ret     
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+20],rdi
mov     rbx,qword ptr ds:[rbx+8]
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+28],rbx
call    oglmdi2_vs2019.13F1313E8
int3    
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12B958
add     rax,20
add     rsp,28
ret     
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12B958
add     rax,28
add     rsp,28
ret     
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12D9CC
test    al,al
jne     oglmdi2_vs2019.13F12B785
xor     al,al
jmp     oglmdi2_vs2019.13F12B797
call    oglmdi2_vs2019.13F12BA34
test    al,al
jne     oglmdi2_vs2019.13F12B795
call    oglmdi2_vs2019.13F12DA00
jmp     oglmdi2_vs2019.13F12B781
mov     al,1
add     rsp,28
ret     
sub     rsp,28
test    cl,cl
jne     oglmdi2_vs2019.13F12B7AE
call    oglmdi2_vs2019.13F12BA7C
call    oglmdi2_vs2019.13F12DA00
mov     al,1
add     rsp,28
ret     
int3    
int3    
int3    
cmp     rcx,rdx
je      oglmdi2_vs2019.13F12B7D6
add     rdx,9
lea     rax,qword ptr ds:[rcx+9]
sub     rdx,rax
mov     cl,byte ptr ds:[rax]
cmp     cl,byte ptr ds:[rax+rdx]
jne     oglmdi2_vs2019.13F12B7D9
inc     rax
test    cl,cl
jne     oglmdi2_vs2019.13F12B7C8
xor     eax,eax
ret     
sbb     eax,eax
or      eax,1
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+18],rdi
push    r14
sub     rsp,20
cmp     byte ptr ds:[rcx+8],0
mov     r14,rdx
mov     rsi,rcx
je      oglmdi2_vs2019.13F12B84D
mov     rax,qword ptr ds:[rcx]
test    rax,rax
je      oglmdi2_vs2019.13F12B84D
or      rdi,FFFFFFFFFFFFFFFF
inc     rdi
cmp     byte ptr ds:[rax+rdi],0
jne     oglmdi2_vs2019.13F12B80D
lea     rcx,qword ptr ds:[rdi+1]
call    oglmdi2_vs2019.13F12ECBC
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F12B843
mov     r8,qword ptr ds:[rsi]
lea     rdx,qword ptr ds:[rdi+1]
mov     rcx,rax
call    oglmdi2_vs2019.13F1328D0
mov     rax,rbx
mov     byte ptr ds:[r14+8],1
mov     qword ptr ds:[r14],rax
xor     ebx,ebx
mov     rcx,rbx
call    oglmdi2_vs2019.13F12ECA8
jmp     oglmdi2_vs2019.13F12B857
mov     rax,qword ptr ds:[rcx]
mov     qword ptr ds:[rdx],rax
mov     byte ptr ds:[rdx+8],0
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
mov     rdi,qword ptr ss:[rsp+40]
add     rsp,20
pop     r14
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
cmp     byte ptr ds:[rcx+8],0
mov     rbx,rcx
je      oglmdi2_vs2019.13F12B887
mov     rcx,qword ptr ds:[rcx]
call    oglmdi2_vs2019.13F12ECA8
and     qword ptr ds:[rbx],0
mov     byte ptr ds:[rbx+8],0
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+18],rbx
mov     qword ptr ss:[rsp+20],rsi
push    rdi
sub     rsp,50
mov     rbx,rdx
mov     rsi,rcx
mov     edi,19930520
test    rdx,rdx
je      oglmdi2_vs2019.13F12B8D4
test    byte ptr ds:[rdx],10
je      oglmdi2_vs2019.13F12B8D4
mov     rcx,qword ptr ds:[rcx]
sub     rcx,8
mov     rax,qword ptr ds:[rcx]
mov     rbx,qword ptr ds:[rax+30]
mov     rax,qword ptr ds:[rax+40]
call    qword ptr ds:[13F140490]
lea     rdx,qword ptr ss:[rsp+20]
mov     rcx,rbx
call    qword ptr ds:[<&RtlPcToFileHeader>]
mov     qword ptr ss:[rsp+20],rax
test    rbx,rbx
je      oglmdi2_vs2019.13F12B8FB
test    byte ptr ds:[rbx],8
jne     oglmdi2_vs2019.13F12B8F6
test    rax,rax
jne     oglmdi2_vs2019.13F12B8FB
mov     edi,1994000
mov     edx,1
mov     qword ptr ss:[rsp+28],rdi
lea     r9,qword ptr ss:[rsp+28]
mov     qword ptr ss:[rsp+30],rsi
mov     ecx,E06D7363
mov     qword ptr ss:[rsp+38],rbx
mov     qword ptr ss:[rsp+40],rax
lea     r8d,dword ptr ds:[rdx+3]
call    qword ptr ds:[<&RaiseException>]
mov     rbx,qword ptr ss:[rsp+70]
mov     rsi,qword ptr ss:[rsp+78]
add     rsp,50
pop     rdi
ret     
sub     rsp,28
test    rcx,rcx
je      oglmdi2_vs2019.13F12B952
lea     rax,qword ptr ds:[13F14D780]
cmp     rcx,rax
je      oglmdi2_vs2019.13F12B952
call    oglmdi2_vs2019.13F12ECA8
add     rsp,28
ret     
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F12B974
test    rax,rax
je      oglmdi2_vs2019.13F12B96B
add     rsp,28
ret     
call    oglmdi2_vs2019.13F132878
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
cmp     dword ptr ds:[13F14C080],FFFFFFFF
jne     oglmdi2_vs2019.13F12B993
xor     eax,eax
jmp     oglmdi2_vs2019.13F12BA23
call    qword ptr ds:[<&GetLastError>]
mov     ecx,dword ptr ds:[13F14C080]
mov     edi,eax
call    oglmdi2_vs2019.13F12DC24
or      rdx,FFFFFFFFFFFFFFFF
xor     esi,esi
cmp     rax,rdx
je      oglmdi2_vs2019.13F12BA18
test    rax,rax
je      oglmdi2_vs2019.13F12B9BB
mov     rsi,rax
jmp     oglmdi2_vs2019.13F12BA18
mov     ecx,dword ptr ds:[13F14C080]
call    oglmdi2_vs2019.13F12DC6C
test    eax,eax
je      oglmdi2_vs2019.13F12BA18
mov     edx,80
lea     ecx,dword ptr ds:[rdx-7F]
call    oglmdi2_vs2019.13F132930
mov     ecx,dword ptr ds:[13F14C080]
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F12BA09
mov     rdx,rax
call    oglmdi2_vs2019.13F12DC6C
test    eax,eax
je      oglmdi2_vs2019.13F12BA03
mov     rax,rbx
mov     dword ptr ds:[rbx+78],FFFFFFFE
mov     rbx,rsi
mov     rsi,rax
jmp     oglmdi2_vs2019.13F12BA10
mov     ecx,dword ptr ds:[13F14C080]
xor     edx,edx
call    oglmdi2_vs2019.13F12DC6C
mov     rcx,rbx
call    oglmdi2_vs2019.13F12ECA8
mov     ecx,edi
call    qword ptr ds:[<&SetLastError>]
mov     rax,rsi
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
int3    
sub     rsp,28
lea     rcx,qword ptr ds:[13F12B938]
call    oglmdi2_vs2019.13F12DB94
mov     dword ptr ds:[13F14C080],eax
cmp     eax,FFFFFFFF
je      oglmdi2_vs2019.13F12BA74
lea     rdx,qword ptr ds:[13F14D780]
mov     ecx,eax
call    oglmdi2_vs2019.13F12DC6C
test    eax,eax
je      oglmdi2_vs2019.13F12BA6F
mov     dword ptr ds:[13F14D7F8],FFFFFFFE
mov     al,1
jmp     oglmdi2_vs2019.13F12BA76
call    oglmdi2_vs2019.13F12BA7C
xor     al,al
add     rsp,28
ret     
int3    
sub     rsp,28
mov     ecx,dword ptr ds:[13F14C080]
cmp     ecx,FFFFFFFF
je      oglmdi2_vs2019.13F12BA97
call    oglmdi2_vs2019.13F12DBDC
or      dword ptr ds:[13F14C080],FFFFFFFF
mov     al,1
add     rsp,28
ret     
int3    
int3    
mov     r8,qword ptr ds:[rdx]
jmp     oglmdi2_vs2019.13F12BAA8
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rsi
mov     qword ptr ds:[rax+18],rdi
mov     qword ptr ds:[rax+20],r14
cmp     dword ptr ds:[rcx+10],0
mov     rbx,r8
mov     r10,rdx
je      oglmdi2_vs2019.13F12BB77
movsxd  r9,dword ptr ds:[rcx+10]
lea     r14,qword ptr ds:[13F120000]
mov     rdi,qword ptr ds:[rdx+8]
xor     esi,esi
add     r9,rdi
or      edx,FFFFFFFF
xor     r8d,r8d
movzx   ecx,byte ptr ds:[r9]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r14+21048]
mov     cl,byte ptr ds:[rcx+r14+21058]
sub     r9,rax
mov     r11d,dword ptr ds:[r9-4]
shr     r11d,cl
test    r11d,r11d
je      oglmdi2_vs2019.13F12BB77
mov     rax,qword ptr ds:[r10+10]
mov     r10d,dword ptr ds:[rax]
movzx   ecx,byte ptr ds:[r9]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r14+21048]
mov     cl,byte ptr ds:[rcx+r14+21058]
sub     r9,rax
mov     eax,dword ptr ds:[r9-4]
shr     eax,cl
add     esi,eax
mov     eax,esi
add     rax,r10
add     rax,rdi
cmp     rbx,rax
jb      oglmdi2_vs2019.13F12BB6E
movzx   ecx,byte ptr ds:[r9]
inc     r8d
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r14+21048]
mov     cl,byte ptr ds:[rcx+r14+21058]
sub     r9,rax
mov     edx,dword ptr ds:[r9-4]
shr     edx,cl
dec     edx
cmp     r8d,r11d
jb      oglmdi2_vs2019.13F12BB13
test    r8d,r8d
je      oglmdi2_vs2019.13F12BB77
mov     eax,edx
jmp     oglmdi2_vs2019.13F12BB7A
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+8]
mov     rsi,qword ptr ss:[rsp+10]
mov     rdi,qword ptr ss:[rsp+18]
mov     r14,qword ptr ss:[rsp+20]
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+18],rdi
push    r13
push    r14
push    r15
sub     rsp,30
mov     r14,r9
mov     rbx,r8
mov     rsi,rdx
mov     r13,rcx
xor     edi,edi
cmp     dword ptr ds:[r8+8],edi
je      oglmdi2_vs2019.13F12BBCC
movsxd  r15,dword ptr ds:[r8+8]
call    oglmdi2_vs2019.13F12B050
lea     rdx,qword ptr ds:[r15+rax]
jmp     oglmdi2_vs2019.13F12BBD2
mov     rdx,rdi
mov     r15d,edi
test    rdx,rdx
je      oglmdi2_vs2019.13F12BD55
test    r15d,r15d
je      oglmdi2_vs2019.13F12BBF1
call    oglmdi2_vs2019.13F12B050
mov     rcx,rax
movsxd  rax,dword ptr ds:[rbx+8]
add     rcx,rax
jmp     oglmdi2_vs2019.13F12BBF4
mov     rcx,rdi
cmp     byte ptr ds:[rcx+10],dil
je      oglmdi2_vs2019.13F12BD55
cmp     dword ptr ds:[rbx+C],edi
jne     oglmdi2_vs2019.13F12BC0C
cmp     dword ptr ds:[rbx+4],edi
jge     oglmdi2_vs2019.13F12BD55
cmp     dword ptr ds:[rbx+4],edi
jl      oglmdi2_vs2019.13F12BC1A
mov     eax,dword ptr ds:[rbx+C]
add     rax,qword ptr ds:[rsi]
mov     rsi,rax
test    byte ptr ds:[rbx+4],80
je      oglmdi2_vs2019.13F12BC52
test    byte ptr ds:[r14],10
je      oglmdi2_vs2019.13F12BC52
mov     rax,qword ptr ds:[13F14D770]
test    rax,rax
je      oglmdi2_vs2019.13F12BC52
call    qword ptr ds:[13F140490]
test    rax,rax
je      oglmdi2_vs2019.13F12BD71
test    rsi,rsi
je      oglmdi2_vs2019.13F12BD71
mov     qword ptr ds:[rsi],rax
mov     rcx,rax
jmp     oglmdi2_vs2019.13F12BCB2
test    byte ptr ds:[rbx+4],8
je      oglmdi2_vs2019.13F12BC73
mov     rcx,qword ptr ds:[r13+28]
test    rcx,rcx
je      oglmdi2_vs2019.13F12BD76
test    rsi,rsi
je      oglmdi2_vs2019.13F12BD76
mov     qword ptr ds:[rsi],rcx
jmp     oglmdi2_vs2019.13F12BCB2
test    byte ptr ds:[r14],1
je      oglmdi2_vs2019.13F12BCC3
mov     rdx,qword ptr ds:[r13+28]
test    rdx,rdx
je      oglmdi2_vs2019.13F12BD7B
test    rsi,rsi
je      oglmdi2_vs2019.13F12BD7B
movsxd  r8,dword ptr ds:[r14+14]
mov     rcx,rsi
call    oglmdi2_vs2019.13F12DE70
cmp     dword ptr ds:[r14+14],8
jne     oglmdi2_vs2019.13F12BD51
cmp     qword ptr ds:[rsi],rdi
je      oglmdi2_vs2019.13F12BD51
mov     rcx,qword ptr ds:[rsi]
lea     rdx,qword ptr ds:[r14+8]
call    oglmdi2_vs2019.13F12B6C0
mov     qword ptr ds:[rsi],rax
jmp     oglmdi2_vs2019.13F12BD51
cmp     dword ptr ds:[r14+18],edi
je      oglmdi2_vs2019.13F12BCD8
movsxd  rbx,dword ptr ds:[r14+18]
call    oglmdi2_vs2019.13F12B064
lea     rcx,qword ptr ds:[rbx+rax]
jmp     oglmdi2_vs2019.13F12BCDD
mov     rcx,rdi
mov     ebx,edi
test    rcx,rcx
jne     oglmdi2_vs2019.13F12BD16
cmp     qword ptr ds:[r13+28],rdi
je      oglmdi2_vs2019.13F12BD80
test    rsi,rsi
je      oglmdi2_vs2019.13F12BD80
movsxd  rbx,dword ptr ds:[r14+14]
lea     rdx,qword ptr ds:[r14+8]
mov     rcx,qword ptr ds:[r13+28]
call    oglmdi2_vs2019.13F12B6C0
mov     rdx,rax
mov     r8,rbx
mov     rcx,rsi
call    oglmdi2_vs2019.13F12DE70
jmp     oglmdi2_vs2019.13F12BD51
cmp     qword ptr ds:[r13+28],rdi
je      oglmdi2_vs2019.13F12BD85
test    rsi,rsi
je      oglmdi2_vs2019.13F12BD85
test    ebx,ebx
je      oglmdi2_vs2019.13F12BD36
call    oglmdi2_vs2019.13F12B064
mov     rcx,rax
movsxd  rax,dword ptr ds:[r14+18]
add     rcx,rax
jmp     oglmdi2_vs2019.13F12BD39
mov     rcx,rdi
test    rcx,rcx
je      oglmdi2_vs2019.13F12BD85
mov     al,byte ptr ds:[r14]
and     al,4
neg     al
sbb     ecx,ecx
neg     ecx
inc     ecx
mov     edi,ecx
mov     dword ptr ss:[rsp+20],ecx
mov     eax,edi
jmp     oglmdi2_vs2019.13F12BD57
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+50]
mov     rsi,qword ptr ss:[rsp+58]
mov     rdi,qword ptr ss:[rsp+60]
add     rsp,30
pop     r15
pop     r14
pop     r13
ret     
call    oglmdi2_vs2019.13F132878
call    oglmdi2_vs2019.13F132878
call    oglmdi2_vs2019.13F132878
call    oglmdi2_vs2019.13F132878
call    oglmdi2_vs2019.13F132878
nop     
call    oglmdi2_vs2019.13F132878
nop     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+18],rdi
push    r14
sub     rsp,20
mov     rdi,r9
mov     r14,rcx
xor     ebx,ebx
cmp     dword ptr ds:[r8+4],ebx
jge     oglmdi2_vs2019.13F12BDBC
mov     rsi,rdx
jmp     oglmdi2_vs2019.13F12BDC3
mov     esi,dword ptr ds:[r8+C]
add     rsi,qword ptr ds:[rdx]
call    oglmdi2_vs2019.13F12BB90
sub     eax,1
je      oglmdi2_vs2019.13F12BE09
cmp     eax,1
jne     oglmdi2_vs2019.13F12BE39
lea     rdx,qword ptr ds:[rdi+8]
mov     rcx,qword ptr ds:[r14+28]
call    oglmdi2_vs2019.13F12B6C0
mov     r14,rax
cmp     dword ptr ds:[rdi+18],ebx
je      oglmdi2_vs2019.13F12BDF3
call    oglmdi2_vs2019.13F12B064
movsxd  rbx,dword ptr ds:[rdi+18]
add     rbx,rax
mov     r9d,1
mov     r8,r14
mov     rdx,rbx
mov     rcx,rsi
call    oglmdi2_vs2019.13F12D7A0
jmp     oglmdi2_vs2019.13F12BE39
lea     rdx,qword ptr ds:[rdi+8]
mov     rcx,qword ptr ds:[r14+28]
call    oglmdi2_vs2019.13F12B6C0
mov     r14,rax
cmp     dword ptr ds:[rdi+18],ebx
je      oglmdi2_vs2019.13F12BE2A
call    oglmdi2_vs2019.13F12B064
movsxd  rbx,dword ptr ds:[rdi+18]
add     rbx,rax
mov     r8,r14
mov     rdx,rbx
mov     rcx,rsi
call    oglmdi2_vs2019.13F12D794
nop     
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
mov     rdi,qword ptr ss:[rsp+40]
add     rsp,20
pop     r14
ret     
call    oglmdi2_vs2019.13F132878
nop     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+18],r8
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,60
mov     r13,qword ptr ss:[rsp+C0]
mov     r15,r9
mov     r12,rdx
lea     r9,qword ptr ds:[rax+10]
mov     rbp,rcx
mov     r8,r13
mov     rdx,r15
mov     rcx,r12
call    oglmdi2_vs2019.13F12AB38
mov     r9,qword ptr ss:[rsp+D0]
mov     r14,rax
mov     rsi,qword ptr ss:[rsp+C8]
test    r9,r9
je      oglmdi2_vs2019.13F12BEBB
mov     r8,rsi
mov     rdx,rax
mov     rcx,rbp
call    oglmdi2_vs2019.13F12BD94
mov     rcx,qword ptr ss:[rsp+D8]
mov     ebx,dword ptr ds:[rcx+8]
mov     edi,dword ptr ds:[rcx]
call    oglmdi2_vs2019.13F12B050
movsxd  rcx,dword ptr ds:[rsi+10]
mov     r9,r14
mov     r8,qword ptr ss:[rsp+B0]
add     rax,rcx
mov     cl,byte ptr ss:[rsp+F8]
mov     rdx,rbp
mov     byte ptr ss:[rsp+50],cl
mov     rcx,r12
mov     qword ptr ss:[rsp+48],r15
mov     qword ptr ss:[rsp+40],rsi
mov     dword ptr ss:[rsp+38],ebx
mov     dword ptr ss:[rsp+30],edi
mov     qword ptr ss:[rsp+28],r13
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F12ACB4
mov     rbx,qword ptr ss:[rsp+A0]
add     rsp,60
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
int3    
int3    
int3    
push    rbp
push    rbx
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
lea     rbp,qword ptr ss:[rsp-88]
sub     rsp,188
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+70],rax
mov     r14,qword ptr ss:[rbp+F0]
mov     r15,rdx
mov     r12,qword ptr ss:[rbp+108]
mov     rbx,rcx
mov     qword ptr ss:[rsp+78],rdx
mov     rcx,r14
mov     rdx,r9
mov     qword ptr ss:[rbp-60],r12
mov     rsi,r9
mov     byte ptr ss:[rsp+60],0
mov     r13,r8
mov     byte ptr ss:[rsp+61],0
call    oglmdi2_vs2019.13F12BAA0
cmp     dword ptr ds:[rsi+48],0
mov     edi,eax
je      oglmdi2_vs2019.13F12BFAD
call    oglmdi2_vs2019.13F12B958
cmp     dword ptr ds:[rax+78],FFFFFFFE
jne     oglmdi2_vs2019.13F12C435
mov     edi,dword ptr ds:[rsi+48]
sub     edi,2
jmp     oglmdi2_vs2019.13F12BFCC
call    oglmdi2_vs2019.13F12B958
cmp     dword ptr ds:[rax+78],FFFFFFFE
je      oglmdi2_vs2019.13F12BFCC
call    oglmdi2_vs2019.13F12B958
mov     edi,dword ptr ds:[rax+78]
call    oglmdi2_vs2019.13F12B958
mov     dword ptr ds:[rax+78],FFFFFFFE
cmp     edi,FFFFFFFF
jl      oglmdi2_vs2019.13F12C435
cmp     dword ptr ds:[r14+8],0
lea     r8,qword ptr ds:[13F120000]
je      oglmdi2_vs2019.13F12C00C
movsxd  rdx,dword ptr ds:[r14+8]
add     rdx,qword ptr ds:[rsi+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
jmp     oglmdi2_vs2019.13F12C00E
xor     eax,eax
cmp     edi,eax
jge     oglmdi2_vs2019.13F12C435
cmp     dword ptr ds:[rbx],E06D7363
jne     oglmdi2_vs2019.13F12C0E6
cmp     dword ptr ds:[rbx+18],4
jne     oglmdi2_vs2019.13F12C0E6
mov     eax,dword ptr ds:[rbx+20]
sub     eax,19930520
cmp     eax,2
ja      oglmdi2_vs2019.13F12C0E6
cmp     qword ptr ds:[rbx+30],0
jne     oglmdi2_vs2019.13F12C0E6
call    oglmdi2_vs2019.13F12B958
cmp     qword ptr ds:[rax+20],0
je      oglmdi2_vs2019.13F12C3D3
call    oglmdi2_vs2019.13F12B958
mov     rbx,qword ptr ds:[rax+20]
call    oglmdi2_vs2019.13F12B958
mov     rcx,qword ptr ds:[rbx+38]
mov     byte ptr ss:[rsp+60],1
mov     r13,qword ptr ds:[rax+28]
call    oglmdi2_vs2019.13F12B090
cmp     dword ptr ds:[rbx],E06D7363
jne     oglmdi2_vs2019.13F12C09E
cmp     dword ptr ds:[rbx+18],4
jne     oglmdi2_vs2019.13F12C09E
mov     eax,dword ptr ds:[rbx+20]
sub     eax,19930520
cmp     eax,2
ja      oglmdi2_vs2019.13F12C09E
cmp     qword ptr ds:[rbx+30],0
je      oglmdi2_vs2019.13F12C435
call    oglmdi2_vs2019.13F12B958
cmp     qword ptr ds:[rax+38],0
je      oglmdi2_vs2019.13F12C0E6
call    oglmdi2_vs2019.13F12B958
mov     r15,qword ptr ds:[rax+38]
call    oglmdi2_vs2019.13F12B958
mov     rdx,r15
mov     rcx,rbx
and     qword ptr ds:[rax+38],0
call    oglmdi2_vs2019.13F12D57C
test    al,al
jne     oglmdi2_vs2019.13F12C0E1
mov     rcx,r15
call    oglmdi2_vs2019.13F12D66C
test    al,al
je      oglmdi2_vs2019.13F12C417
jmp     oglmdi2_vs2019.13F12C3F3
mov     r15,qword ptr ss:[rsp+78]
mov     r8,qword ptr ds:[rsi+8]
lea     rcx,qword ptr ss:[rbp-10]
mov     rdx,r14
call    oglmdi2_vs2019.13F12CCDC
cmp     dword ptr ds:[rbx],E06D7363
jne     oglmdi2_vs2019.13F12C38B
cmp     dword ptr ds:[rbx+18],4
jne     oglmdi2_vs2019.13F12C38B
mov     eax,dword ptr ds:[rbx+20]
sub     eax,19930520
cmp     eax,2
ja      oglmdi2_vs2019.13F12C38B
cmp     dword ptr ss:[rbp-10],0
jbe     oglmdi2_vs2019.13F12C370
mov     eax,dword ptr ss:[rbp+100]
lea     rdx,qword ptr ss:[rbp-10]
mov     dword ptr ss:[rsp+28],eax
lea     rcx,qword ptr ss:[rbp-58]
mov     r9,rsi
mov     qword ptr ss:[rsp+20],r14
mov     r8d,edi
call    oglmdi2_vs2019.13F12AB5C
movups  xmm0,xmmword ptr ss:[rbp-58]
movdqu  xmmword ptr ss:[rbp-78],xmm0
psrldq  xmm0,8
movd    eax,xmm0
cmp     eax,dword ptr ss:[rbp-40]
jae     oglmdi2_vs2019.13F12C370
mov     r15,qword ptr ss:[rbp-58]
lea     r8,qword ptr ds:[13F120000]
mov     eax,dword ptr ss:[rbp-70]
mov     qword ptr ss:[rbp-80],r15
mov     dword ptr ss:[rsp+68],eax
movups  xmm0,xmmword ptr ds:[r15+18]
movq    rax,xmm0
movups  xmmword ptr ss:[rbp-78],xmm0
cmp     eax,edi
jg      oglmdi2_vs2019.13F12C2CF
shr     rax,20
cmp     edi,eax
jg      oglmdi2_vs2019.13F12C2CF
mov     rax,qword ptr ds:[rsi+10]
lea     rdx,qword ptr ss:[rbp-78]
mov     r8,qword ptr ds:[rsi+8]
lea     rcx,qword ptr ss:[rbp+20]
mov     r9d,dword ptr ds:[rax]
call    oglmdi2_vs2019.13F12CC60
mov     eax,dword ptr ss:[rbp+20]
xor     r12d,r12d
mov     dword ptr ss:[rsp+64],r12d
mov     dword ptr ss:[rsp+6C],eax
test    eax,eax
je      oglmdi2_vs2019.13F12C2C8
movups  xmm0,xmmword ptr ss:[rbp+38]
movups  xmm1,xmmword ptr ss:[rbp+48]
movups  xmmword ptr ss:[rbp-38],xmm0
movsd   xmm0,qword ptr ss:[rbp+58]
movsd   qword ptr ss:[rbp-18],xmm0
movups  xmmword ptr ss:[rbp-28],xmm1
call    oglmdi2_vs2019.13F12B064
mov     rcx,qword ptr ds:[rbx+30]
add     rax,4
movsxd  rdx,dword ptr ds:[rcx+C]
add     rax,rdx
mov     qword ptr ss:[rsp+70],rax
call    oglmdi2_vs2019.13F12B064
mov     rcx,qword ptr ds:[rbx+30]
movsxd  rdx,dword ptr ds:[rcx+C]
mov     r15d,dword ptr ds:[rax+rdx]
test    r15d,r15d
jle     oglmdi2_vs2019.13F12C24E
call    oglmdi2_vs2019.13F12B064
mov     r8,qword ptr ds:[rbx+30]
mov     r12,rax
mov     rax,qword ptr ss:[rsp+70]
movsxd  rcx,dword ptr ds:[rax]
add     r12,rcx
lea     rcx,qword ptr ss:[rbp-38]
mov     rdx,r12
call    oglmdi2_vs2019.13F12C878
test    eax,eax
jne     oglmdi2_vs2019.13F12C26B
add     qword ptr ss:[rsp+70],4
dec     r15d
test    r15d,r15d
jg      oglmdi2_vs2019.13F12C214
mov     r12d,dword ptr ss:[rsp+64]
lea     rcx,qword ptr ss:[rbp+20]
call    oglmdi2_vs2019.13F12D060
inc     r12d
mov     dword ptr ss:[rsp+64],r12d
cmp     r12d,dword ptr ss:[rsp+6C]
je      oglmdi2_vs2019.13F12C2C4
jmp     oglmdi2_vs2019.13F12C1CB
mov     al,byte ptr ss:[rbp+F8]
mov     r9,rsi
mov     rdx,qword ptr ss:[rsp+78]
mov     r8,r13
mov     byte ptr ss:[rsp+58],al
mov     rcx,rbx
mov     al,byte ptr ss:[rsp+60]
mov     byte ptr ss:[rsp+50],al
mov     rax,qword ptr ss:[rbp-60]
mov     qword ptr ss:[rsp+48],rax
mov     eax,dword ptr ss:[rbp+100]
mov     dword ptr ss:[rsp+40],eax
lea     rax,qword ptr ss:[rbp-78]
mov     qword ptr ss:[rsp+38],rax
lea     rax,qword ptr ss:[rbp-38]
mov     qword ptr ss:[rsp+30],r12
mov     qword ptr ss:[rsp+28],rax
mov     qword ptr ss:[rsp+20],r14
mov     byte ptr ss:[rsp+61],1
call    oglmdi2_vs2019.13F12BE58
mov     r15,qword ptr ss:[rbp-80]
lea     r8,qword ptr ds:[13F120000]
mov     rdx,qword ptr ds:[r15+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r15+8],rdx
mov     dword ptr ds:[r15+18],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r15+8],rdx
mov     dword ptr ds:[r15+1C],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     dword ptr ds:[r15+20],eax
lea     rax,qword ptr ds:[rdx+4]
mov     qword ptr ds:[r15+8],rdx
mov     ecx,dword ptr ds:[rdx]
mov     dword ptr ds:[r15+24],ecx
mov     ecx,dword ptr ss:[rsp+68]
inc     ecx
mov     qword ptr ds:[r15+8],rax
mov     dword ptr ss:[rsp+68],ecx
cmp     ecx,dword ptr ss:[rbp-40]
jb      oglmdi2_vs2019.13F12C17A
cmp     byte ptr ss:[rsp+61],0
jne     oglmdi2_vs2019.13F12C3C7
test    byte ptr ds:[r14],40
je      oglmdi2_vs2019.13F12C3C7
mov     rdx,r14
mov     rcx,rsi
call    oglmdi2_vs2019.13F12AAFC
test    al,al
je      oglmdi2_vs2019.13F12C41D
jmp     oglmdi2_vs2019.13F12C3C7
cmp     dword ptr ss:[rbp-10],0
jbe     oglmdi2_vs2019.13F12C3C7
cmp     byte ptr ss:[rbp+F8],0
jne     oglmdi2_vs2019.13F12C435
mov     eax,dword ptr ss:[rbp+100]
mov     r9,rsi
mov     qword ptr ss:[rsp+38],r12
mov     r8,r13
mov     dword ptr ss:[rsp+30],eax
mov     rdx,r15
mov     dword ptr ss:[rsp+28],edi
mov     rcx,rbx
mov     qword ptr ss:[rsp+20],r14
call    oglmdi2_vs2019.13F12C43C
call    oglmdi2_vs2019.13F12B958
cmp     qword ptr ds:[rax+38],0
jne     oglmdi2_vs2019.13F12C435
mov     rcx,qword ptr ss:[rbp+70]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,188
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbx
pop     rbp
ret     
mov     dl,1
mov     rcx,rbx
call    oglmdi2_vs2019.13F12B61C
lea     rcx,qword ptr ss:[rbp-78]
call    oglmdi2_vs2019.13F12CDF0
lea     rdx,qword ptr ds:[13F14AF50]
lea     rcx,qword ptr ss:[rbp-78]
call    oglmdi2_vs2019.13F12B898
int3    
call    oglmdi2_vs2019.13F1313E8
int3    
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+20],rbx
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+28],r13
call    oglmdi2_vs2019.13F1313E8
int3    
call    oglmdi2_vs2019.13F132878
int3    
int3    
push    rbp
push    rbx
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
lea     rbp,qword ptr ss:[rsp-38]
sub     rsp,138
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+28],rax
cmp     dword ptr ds:[rcx],80000003
mov     rdi,r9
mov     rax,qword ptr ss:[rbp+B8]
mov     r12,r8
mov     r14,qword ptr ss:[rbp+A0]
mov     r13,rdx
mov     qword ptr ss:[rsp+70],rax
mov     rsi,rcx
mov     qword ptr ss:[rbp-78],r8
je      oglmdi2_vs2019.13F12C70E
call    oglmdi2_vs2019.13F12B958
mov     r15d,dword ptr ss:[rbp+B0]
cmp     qword ptr ds:[rax+10],0
je      oglmdi2_vs2019.13F12C4F8
xor     ecx,ecx
call    qword ptr ds:[<&RtlEncodePointer>]
mov     rbx,rax
call    oglmdi2_vs2019.13F12B958
cmp     qword ptr ds:[rax+10],rbx
je      oglmdi2_vs2019.13F12C4F8
cmp     dword ptr ds:[rsi],E0434F4D
je      oglmdi2_vs2019.13F12C4F8
cmp     dword ptr ds:[rsi],E0434352
je      oglmdi2_vs2019.13F12C4F8
mov     rax,qword ptr ss:[rsp+70]
mov     r9,rdi
mov     qword ptr ss:[rsp+30],rax
mov     r8,r12
mov     dword ptr ss:[rsp+28],r15d
mov     rdx,r13
mov     rcx,rsi
mov     qword ptr ss:[rsp+20],r14
call    oglmdi2_vs2019.13F12A984
test    eax,eax
jne     oglmdi2_vs2019.13F12C70E
mov     r8,qword ptr ds:[rdi+8]
lea     rcx,qword ptr ss:[rbp]
mov     rdx,r14
call    oglmdi2_vs2019.13F12CCDC
cmp     dword ptr ss:[rbp],0
jbe     oglmdi2_vs2019.13F12C72E
mov     r12d,dword ptr ss:[rbp+A8]
lea     rdx,qword ptr ss:[rbp]
mov     r8d,r12d
mov     dword ptr ss:[rsp+28],r15d
mov     r9,rdi
mov     qword ptr ss:[rsp+20],r14
lea     rcx,qword ptr ss:[rbp-70]
call    oglmdi2_vs2019.13F12AB5C
movups  xmm0,xmmword ptr ss:[rbp-70]
movdqu  xmmword ptr ss:[rsp+78],xmm0
psrldq  xmm0,8
movd    eax,xmm0
cmp     eax,dword ptr ss:[rbp-58]
jae     oglmdi2_vs2019.13F12C70E
mov     r8,qword ptr ss:[rbp-70]
lea     r9,qword ptr ds:[13F120000]
mov     eax,dword ptr ss:[rbp-80]
mov     qword ptr ss:[rsp+68],r8
mov     dword ptr ss:[rsp+60],eax
movups  xmm0,xmmword ptr ds:[r8+18]
movq    rax,xmm0
movups  xmmword ptr ss:[rsp+78],xmm0
cmp     eax,r12d
jg      oglmdi2_vs2019.13F12C674
shr     rax,20
cmp     r12d,eax
jg      oglmdi2_vs2019.13F12C674
mov     rax,qword ptr ds:[rdi+10]
lea     rdx,qword ptr ss:[rsp+78]
mov     r8,qword ptr ds:[rdi+8]
lea     rcx,qword ptr ss:[rbp-50]
mov     r9d,dword ptr ds:[rax]
call    oglmdi2_vs2019.13F12CC60
mov     rax,qword ptr ss:[rbp-40]
lea     rcx,qword ptr ss:[rbp-50]
mov     qword ptr ss:[rbp-48],rax
call    oglmdi2_vs2019.13F12D060
mov     rax,qword ptr ss:[rbp-40]
lea     rcx,qword ptr ss:[rbp-50]
mov     ebx,dword ptr ss:[rbp-50]
mov     qword ptr ss:[rbp-48],rax
call    oglmdi2_vs2019.13F12D060
sub     ebx,1
je      oglmdi2_vs2019.13F12C5E0
lea     rcx,qword ptr ss:[rbp-50]
call    oglmdi2_vs2019.13F12D060
sub     rbx,1
jne     oglmdi2_vs2019.13F12C5D1
mov     eax,dword ptr ss:[rbp-30]
test    eax,eax
je      oglmdi2_vs2019.13F12C5F8
call    oglmdi2_vs2019.13F12B050
mov     rdx,rax
movsxd  rax,dword ptr ss:[rbp-30]
add     rdx,rax
jmp     oglmdi2_vs2019.13F12C5FA
xor     edx,edx
test    rdx,rdx
je      oglmdi2_vs2019.13F12C619
test    eax,eax
je      oglmdi2_vs2019.13F12C611
call    oglmdi2_vs2019.13F12B050
movsxd  rcx,dword ptr ss:[rbp-30]
add     rax,rcx
jmp     oglmdi2_vs2019.13F12C613
xor     eax,eax
cmp     byte ptr ds:[rax+10],0
jne     oglmdi2_vs2019.13F12C668
test    byte ptr ss:[rbp-34],40
jne     oglmdi2_vs2019.13F12C668
mov     rax,qword ptr ss:[rsp+70]
mov     r9,rdi
mov     r8,qword ptr ss:[rbp-78]
mov     rdx,r13
mov     byte ptr ss:[rsp+58],0
mov     rcx,rsi
mov     byte ptr ss:[rsp+50],1
mov     qword ptr ss:[rsp+48],rax
lea     rax,qword ptr ss:[rsp+78]
mov     dword ptr ss:[rsp+40],r15d
mov     qword ptr ss:[rsp+38],rax
lea     rax,qword ptr ss:[rbp-38]
and     qword ptr ss:[rsp+30],0
mov     qword ptr ss:[rsp+28],rax
mov     qword ptr ss:[rsp+20],r14
call    oglmdi2_vs2019.13F12BE58
mov     r8,qword ptr ss:[rsp+68]
lea     r9,qword ptr ds:[13F120000]
mov     rdx,qword ptr ds:[r8+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r9+21048]
mov     cl,byte ptr ds:[rcx+r9+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r8+8],rdx
mov     dword ptr ds:[r8+18],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r9+21048]
mov     cl,byte ptr ds:[rcx+r9+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r8+8],rdx
mov     dword ptr ds:[r8+1C],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r9+21048]
mov     cl,byte ptr ds:[rcx+r9+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     dword ptr ds:[r8+20],eax
lea     rax,qword ptr ds:[rdx+4]
mov     qword ptr ds:[r8+8],rdx
mov     ecx,dword ptr ds:[rdx]
mov     dword ptr ds:[r8+24],ecx
mov     ecx,dword ptr ss:[rsp+60]
inc     ecx
mov     qword ptr ds:[r8+8],rax
mov     dword ptr ss:[rsp+60],ecx
cmp     ecx,dword ptr ss:[rbp-58]
jb      oglmdi2_vs2019.13F12C569
mov     rcx,qword ptr ss:[rbp+28]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,138
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbx
pop     rbp
ret     
call    oglmdi2_vs2019.13F132878
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,20
xor     ebx,ebx
mov     r14,r8
mov     rbp,rdx
mov     rdi,rcx
cmp     dword ptr ds:[rcx+4],ebx
je      oglmdi2_vs2019.13F12C76C
movsxd  rsi,dword ptr ds:[rcx+4]
call    oglmdi2_vs2019.13F12B050
lea     rcx,qword ptr ds:[rsi+rax]
jmp     oglmdi2_vs2019.13F12C771
mov     rcx,rbx
mov     esi,ebx
test    rcx,rcx
je      oglmdi2_vs2019.13F12C855
test    esi,esi
je      oglmdi2_vs2019.13F12C78D
movsxd  rsi,dword ptr ds:[rdi+4]
call    oglmdi2_vs2019.13F12B050
lea     rcx,qword ptr ds:[rsi+rax]
jmp     oglmdi2_vs2019.13F12C792
mov     rcx,rbx
mov     esi,ebx
cmp     byte ptr ds:[rcx+10],bl
je      oglmdi2_vs2019.13F12C855
test    byte ptr ds:[rdi],80
je      oglmdi2_vs2019.13F12C7AA
test    byte ptr ss:[rbp],10
jne     oglmdi2_vs2019.13F12C855
test    esi,esi
je      oglmdi2_vs2019.13F12C7BF
call    oglmdi2_vs2019.13F12B050
mov     rsi,rax
movsxd  rax,dword ptr ds:[rdi+4]
add     rsi,rax
jmp     oglmdi2_vs2019.13F12C7C2
mov     rsi,rbx
call    oglmdi2_vs2019.13F12B064
mov     rcx,rax
movsxd  rax,dword ptr ss:[rbp+4]
add     rcx,rax
cmp     rsi,rcx
je      oglmdi2_vs2019.13F12C821
cmp     dword ptr ds:[rdi+4],ebx
je      oglmdi2_vs2019.13F12C7EC
call    oglmdi2_vs2019.13F12B050
mov     rsi,rax
movsxd  rax,dword ptr ds:[rdi+4]
add     rsi,rax
jmp     oglmdi2_vs2019.13F12C7EF
mov     rsi,rbx
call    oglmdi2_vs2019.13F12B064
movsxd  r8,dword ptr ss:[rbp+4]
add     r8,10
add     r8,rax
lea     rax,qword ptr ds:[rsi+10]
sub     r8,rax
movzx   ecx,byte ptr ds:[rax]
movzx   edx,byte ptr ds:[rax+r8]
sub     ecx,edx
jne     oglmdi2_vs2019.13F12C819
inc     rax
test    edx,edx
jne     oglmdi2_vs2019.13F12C806
test    ecx,ecx
je      oglmdi2_vs2019.13F12C821
xor     eax,eax
jmp     oglmdi2_vs2019.13F12C85A
mov     al,2
test    byte ptr ss:[rbp],al
je      oglmdi2_vs2019.13F12C82D
test    byte ptr ds:[rdi],8
je      oglmdi2_vs2019.13F12C851
test    byte ptr ds:[r14],1
je      oglmdi2_vs2019.13F12C838
test    byte ptr ds:[rdi],1
je      oglmdi2_vs2019.13F12C851
test    byte ptr ds:[r14],4
je      oglmdi2_vs2019.13F12C843
test    byte ptr ds:[rdi],4
je      oglmdi2_vs2019.13F12C851
test    byte ptr ds:[r14],al
je      oglmdi2_vs2019.13F12C84C
test    byte ptr ds:[rdi],al
je      oglmdi2_vs2019.13F12C851
mov     ebx,1
mov     eax,ebx
jmp     oglmdi2_vs2019.13F12C85A
mov     eax,1
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
mov     rdi,qword ptr ss:[rsp+48]
add     rsp,20
pop     r14
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,20
xor     ebx,ebx
mov     r14,r8
mov     rbp,rdx
mov     rdi,rcx
cmp     dword ptr ds:[rcx+8],ebx
je      oglmdi2_vs2019.13F12C8B0
movsxd  rsi,dword ptr ds:[rcx+8]
call    oglmdi2_vs2019.13F12B050
lea     rcx,qword ptr ds:[rsi+rax]
jmp     oglmdi2_vs2019.13F12C8B5
mov     rcx,rbx
mov     esi,ebx
test    rcx,rcx
je      oglmdi2_vs2019.13F12C99E
test    esi,esi
je      oglmdi2_vs2019.13F12C8D1
movsxd  rsi,dword ptr ds:[rdi+8]
call    oglmdi2_vs2019.13F12B050
lea     rcx,qword ptr ds:[rsi+rax]
jmp     oglmdi2_vs2019.13F12C8D6
mov     rcx,rbx
mov     esi,ebx
cmp     byte ptr ds:[rcx+10],bl
je      oglmdi2_vs2019.13F12C99E
test    byte ptr ds:[rdi+4],80
je      oglmdi2_vs2019.13F12C8EF
test    byte ptr ss:[rbp],10
jne     oglmdi2_vs2019.13F12C99E
test    esi,esi
je      oglmdi2_vs2019.13F12C904
call    oglmdi2_vs2019.13F12B050
mov     rsi,rax
movsxd  rax,dword ptr ds:[rdi+8]
add     rsi,rax
jmp     oglmdi2_vs2019.13F12C907
mov     rsi,rbx
call    oglmdi2_vs2019.13F12B064
mov     rcx,rax
movsxd  rax,dword ptr ss:[rbp+4]
add     rcx,rax
cmp     rsi,rcx
je      oglmdi2_vs2019.13F12C966
cmp     dword ptr ds:[rdi+8],ebx
je      oglmdi2_vs2019.13F12C931
call    oglmdi2_vs2019.13F12B050
mov     rsi,rax
movsxd  rax,dword ptr ds:[rdi+8]
add     rsi,rax
jmp     oglmdi2_vs2019.13F12C934
mov     rsi,rbx
call    oglmdi2_vs2019.13F12B064
movsxd  r8,dword ptr ss:[rbp+4]
add     r8,10
add     r8,rax
lea     rax,qword ptr ds:[rsi+10]
sub     r8,rax
movzx   ecx,byte ptr ds:[rax]
movzx   edx,byte ptr ds:[rax+r8]
sub     ecx,edx
jne     oglmdi2_vs2019.13F12C95E
inc     rax
test    edx,edx
jne     oglmdi2_vs2019.13F12C94B
test    ecx,ecx
je      oglmdi2_vs2019.13F12C966
xor     eax,eax
jmp     oglmdi2_vs2019.13F12C9A3
mov     al,2
test    byte ptr ss:[rbp],al
je      oglmdi2_vs2019.13F12C973
test    byte ptr ds:[rdi+4],8
je      oglmdi2_vs2019.13F12C99A
test    byte ptr ds:[r14],1
je      oglmdi2_vs2019.13F12C97F
test    byte ptr ds:[rdi+4],1
je      oglmdi2_vs2019.13F12C99A
test    byte ptr ds:[r14],4
je      oglmdi2_vs2019.13F12C98B
test    byte ptr ds:[rdi+4],4
je      oglmdi2_vs2019.13F12C99A
test    byte ptr ds:[r14],al
je      oglmdi2_vs2019.13F12C995
test    byte ptr ds:[rdi+4],al
je      oglmdi2_vs2019.13F12C99A
mov     ebx,1
mov     eax,ebx
jmp     oglmdi2_vs2019.13F12C9A3
mov     eax,1
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
mov     rdi,qword ptr ss:[rsp+48]
add     rsp,20
pop     r14
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r14
push    r15
sub     rsp,80
mov     rdi,rcx
mov     rbp,r9
mov     rcx,r8
mov     r15,r8
mov     r14,rdx
call    oglmdi2_vs2019.13F12D994
call    oglmdi2_vs2019.13F12B958
mov     rsi,qword ptr ss:[rsp+C0]
xor     ebx,ebx
mov     r9d,80000029
mov     r10d,80000026
cmp     dword ptr ds:[rax+40],ebx
jne     oglmdi2_vs2019.13F12CA3A
cmp     dword ptr ds:[rdi],E06D7363
je      oglmdi2_vs2019.13F12CA3A
cmp     dword ptr ds:[rdi],r9d
jne     oglmdi2_vs2019.13F12CA2C
cmp     dword ptr ds:[rdi+18],F
jne     oglmdi2_vs2019.13F12CA31
cmp     qword ptr ds:[rdi+60],19930520
je      oglmdi2_vs2019.13F12CA3A
cmp     dword ptr ds:[rdi],r10d
je      oglmdi2_vs2019.13F12CA3A
test    byte ptr ds:[rsi],20
jne     oglmdi2_vs2019.13F12CC38
test    byte ptr ds:[rdi+4],66
je      oglmdi2_vs2019.13F12CB65
movsxd  r8,dword ptr ds:[rsi+8]
lea     r15,qword ptr ds:[13F120000]
test    r8d,r8d
je      oglmdi2_vs2019.13F12CA7C
mov     rdx,r8
add     rdx,qword ptr ss:[rbp+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r15+21048]
mov     cl,byte ptr ds:[rcx+r15+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
jmp     oglmdi2_vs2019.13F12CA7E
mov     eax,ebx
test    eax,eax
je      oglmdi2_vs2019.13F12CC38
cmp     dword ptr ss:[rsp+C8],ebx
jne     oglmdi2_vs2019.13F12CC38
test    byte ptr ds:[rdi+4],20
je      oglmdi2_vs2019.13F12CB52
cmp     dword ptr ds:[rdi],r10d
jne     oglmdi2_vs2019.13F12CB05
mov     r8,qword ptr ss:[rbp+20]
mov     rdx,rbp
mov     rcx,rsi
call    oglmdi2_vs2019.13F12BAA8
mov     r9d,eax
cmp     eax,FFFFFFFF
jl      oglmdi2_vs2019.13F12CC5A
cmp     dword ptr ds:[rsi+8],ebx
je      oglmdi2_vs2019.13F12CAE9
movsxd  rdx,dword ptr ds:[rsi+8]
add     rdx,qword ptr ss:[rbp+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r15+21048]
mov     cl,byte ptr ds:[rcx+r15+21058]
sub     rdx,rax
mov     ebx,dword ptr ds:[rdx-4]
shr     ebx,cl
cmp     r9d,ebx
jge     oglmdi2_vs2019.13F12CC5A
mov     rcx,r14
mov     rdx,rbp
mov     r8,rsi
call    oglmdi2_vs2019.13F12D2A8
jmp     oglmdi2_vs2019.13F12CC38
cmp     dword ptr ds:[rdi],r9d
jne     oglmdi2_vs2019.13F12CB52
mov     r9d,dword ptr ds:[rdi+38]
cmp     r9d,FFFFFFFF
jl      oglmdi2_vs2019.13F12CC5A
test    r8d,r8d
je      oglmdi2_vs2019.13F12CB43
mov     rdx,r8
add     rdx,qword ptr ss:[rbp+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r15+21048]
mov     cl,byte ptr ds:[rcx+r15+21058]
sub     rdx,rax
mov     ebx,dword ptr ds:[rdx-4]
shr     ebx,cl
cmp     r9d,ebx
jge     oglmdi2_vs2019.13F12CC5A
mov     rcx,qword ptr ds:[rdi+28]
jmp     oglmdi2_vs2019.13F12CAF5
mov     r8,rsi
mov     rdx,rbp
mov     rcx,r14
call    oglmdi2_vs2019.13F12AB04
jmp     oglmdi2_vs2019.13F12CC38
mov     r8,qword ptr ss:[rbp+8]
lea     rcx,qword ptr ss:[rsp+50]
mov     rdx,rsi
call    oglmdi2_vs2019.13F12CCDC
cmp     dword ptr ss:[rsp+50],ebx
jne     oglmdi2_vs2019.13F12CB85
test    byte ptr ds:[rsi],40
je      oglmdi2_vs2019.13F12CC38
cmp     dword ptr ds:[rdi],E06D7363
jne     oglmdi2_vs2019.13F12CBFF
cmp     dword ptr ds:[rdi+18],3
jb      oglmdi2_vs2019.13F12CBFF
cmp     dword ptr ds:[rdi+20],19930522
jbe     oglmdi2_vs2019.13F12CBFF
mov     rax,qword ptr ds:[rdi+30]
cmp     dword ptr ds:[rax+8],ebx
je      oglmdi2_vs2019.13F12CBB7
call    oglmdi2_vs2019.13F12B064
mov     rcx,qword ptr ds:[rdi+30]
movsxd  r10,dword ptr ds:[rcx+8]
add     r10,rax
jmp     oglmdi2_vs2019.13F12CBBA
mov     r10,rbx
test    r10,r10
je      oglmdi2_vs2019.13F12CBFF
movzx   eax,byte ptr ss:[rsp+D8]
mov     r9,rbp
mov     dword ptr ss:[rsp+38],eax
mov     r8,r15
mov     rax,qword ptr ss:[rsp+D0]
mov     rdx,r14
mov     qword ptr ss:[rsp+30],rax
mov     rcx,rdi
mov     eax,dword ptr ss:[rsp+C8]
mov     dword ptr ss:[rsp+28],eax
mov     rax,r10
mov     qword ptr ss:[rsp+20],rsi
call    qword ptr ds:[13F140490]
jmp     oglmdi2_vs2019.13F12CC3D
mov     rax,qword ptr ss:[rsp+D0]
mov     r9,rbp
mov     qword ptr ss:[rsp+38],rax
mov     r8,r15
mov     eax,dword ptr ss:[rsp+C8]
mov     rdx,r14
mov     dword ptr ss:[rsp+30],eax
mov     rcx,rdi
mov     al,byte ptr ss:[rsp+D8]
mov     byte ptr ss:[rsp+28],al
mov     qword ptr ss:[rsp+20],rsi
call    oglmdi2_vs2019.13F12BF2C
mov     eax,1
lea     r11,qword ptr ss:[rsp+80]
mov     rbx,qword ptr ds:[r11+20]
mov     rbp,qword ptr ds:[r11+28]
mov     rsi,qword ptr ds:[r11+30]
mov     rsp,r11
pop     r15
pop     r14
pop     rdi
ret     
call    oglmdi2_vs2019.13F132878
int3    
push    rbx
sub     rsp,20
xor     eax,eax
xorps   xmm0,xmm0
mov     byte ptr ds:[rcx+18],al
mov     rbx,rcx
mov     qword ptr ds:[rcx+1C],rax
mov     qword ptr ds:[rcx+24],rax
movups  xmmword ptr ds:[rcx+30],xmm0
mov     qword ptr ds:[rcx+40],r8
mov     dword ptr ds:[rcx+48],r9d
cmp     dword ptr ds:[rdx+C],eax
je      oglmdi2_vs2019.13F12CCCF
movsxd  rdx,dword ptr ds:[rdx+C]
add     rdx,r8
lea     r8,qword ptr ds:[13F120000]
mov     qword ptr ds:[rcx+8],rdx
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     rcx,rbx
mov     qword ptr ds:[rbx+8],rdx
mov     dword ptr ds:[rbx],eax
mov     qword ptr ds:[rbx+10],rdx
call    oglmdi2_vs2019.13F12D060
jmp     oglmdi2_vs2019.13F12CCD1
mov     dword ptr ds:[rcx],eax
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
int3    
int3    
cmp     dword ptr ds:[rdx+C],0
mov     r9,rcx
je      oglmdi2_vs2019.13F12CDAA
movsxd  rdx,dword ptr ds:[rdx+C]
add     rdx,r8
lea     r8,qword ptr ds:[13F120000]
mov     qword ptr ds:[rcx+8],rdx
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r9+8],rdx
mov     dword ptr ds:[r9],eax
mov     qword ptr ds:[r9+10],rdx
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r9+8],rdx
mov     dword ptr ds:[r9+18],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r9+8],rdx
mov     dword ptr ds:[r9+1C],eax
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r8+21048]
mov     cl,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     dword ptr ds:[r9+20],eax
lea     rax,qword ptr ds:[rdx+4]
mov     qword ptr ds:[r9+8],rdx
mov     ecx,dword ptr ds:[rdx]
mov     qword ptr ds:[r9+8],rax
mov     dword ptr ds:[r9+24],ecx
jmp     oglmdi2_vs2019.13F12CDAD
and     dword ptr ds:[rcx],0
mov     rax,r9
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     rax,rdx
lea     rcx,qword ptr ds:[13F140FB8]
xorps   xmm0,xmm0
mov     qword ptr ds:[rbx],rcx
lea     rdx,qword ptr ds:[rbx+8]
lea     rcx,qword ptr ds:[rax+8]
movups  xmmword ptr ds:[rdx],xmm0
call    oglmdi2_vs2019.13F12B7E0
lea     rax,qword ptr ds:[13F141118]
mov     qword ptr ds:[rbx],rax
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
and     qword ptr ds:[rcx+10],0
lea     rax,qword ptr ds:[13F141128]
mov     qword ptr ds:[rcx+8],rax
lea     rax,qword ptr ds:[13F141118]
mov     qword ptr ds:[rcx],rax
mov     rax,rcx
ret     
int3    
int3    
mov     rax,rsp
push    rbx
push    rsi
push    rdi
push    r12
push    r13
push    r15
sub     rsp,A8
mov     rdi,rcx
xor     r12d,r12d
mov     dword ptr ss:[rsp+20],r12d
and     dword ptr ss:[rsp+F0],r12d
and     qword ptr ss:[rsp+28],r12
and     qword ptr ss:[rsp+40],r12
mov     byte ptr ds:[rax-80],r12b
and     dword ptr ds:[rax-7C],r12d
and     dword ptr ds:[rax-78],r12d
and     dword ptr ds:[rax-74],r12d
and     dword ptr ds:[rax-70],r12d
and     dword ptr ds:[rax-6C],r12d
call    oglmdi2_vs2019.13F12B958
mov     rax,qword ptr ds:[rax+28]
mov     qword ptr ss:[rsp+38],rax
call    oglmdi2_vs2019.13F12B958
mov     rax,qword ptr ds:[rax+20]
mov     qword ptr ss:[rsp+30],rax
mov     rsi,qword ptr ds:[rdi+50]
mov     qword ptr ss:[rsp+F8],rsi
mov     rbx,qword ptr ds:[rdi+40]
mov     rax,qword ptr ds:[rdi+30]
mov     qword ptr ss:[rsp+50],rax
mov     r15,qword ptr ds:[rdi+28]
mov     rax,qword ptr ds:[rdi+48]
mov     qword ptr ss:[rsp+70],rax
mov     rax,qword ptr ds:[rdi+68]
mov     qword ptr ss:[rsp+78],rax
mov     eax,dword ptr ds:[rdi+78]
mov     dword ptr ss:[rsp+E8],eax
mov     eax,dword ptr ds:[rdi+38]
mov     dword ptr ss:[rsp+E0],eax
mov     rcx,rbx
call    oglmdi2_vs2019.13F12D994
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+20],rsi
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+28],rbx
call    oglmdi2_vs2019.13F12B958
mov     rdx,qword ptr ds:[rax+20]
mov     rdx,qword ptr ds:[rdx+28]
lea     rcx,qword ptr ss:[rsp+88]
call    oglmdi2_vs2019.13F12AFC0
mov     r13,rax
mov     qword ptr ss:[rsp+48],rax
cmp     qword ptr ds:[rdi+58],r12
je      oglmdi2_vs2019.13F12CF12
mov     dword ptr ss:[rsp+F0],1
call    oglmdi2_vs2019.13F12B958
mov     rcx,qword ptr ds:[rax+70]
mov     qword ptr ss:[rsp+40],rcx
mov     r8d,100
mov     rdx,r15
mov     rcx,qword ptr ss:[rsp+50]
call    oglmdi2_vs2019.13F12DD90
mov     rbx,rax
mov     qword ptr ss:[rsp+28],rax
cmp     rax,2
jge     oglmdi2_vs2019.13F12CF46
mov     rbx,qword ptr ss:[rsp+rax*8+70]
test    rbx,rbx
je      oglmdi2_vs2019.13F12D059
mov     qword ptr ss:[rsp+28],rbx
mov     rdx,r15
mov     rcx,rbx
call    oglmdi2_vs2019.13F12DDC0
mov     rdi,qword ptr ss:[rsp+38]
mov     r15,qword ptr ss:[rsp+30]
jmp     oglmdi2_vs2019.13F12CFD9
mov     dword ptr ss:[rsp+20],1
call    oglmdi2_vs2019.13F12B958
and     dword ptr ds:[rax+40],0
call    oglmdi2_vs2019.13F12B958
mov     ecx,dword ptr ss:[rsp+E8]
mov     dword ptr ds:[rax+78],ecx
mov     rsi,qword ptr ss:[rsp+F8]
cmp     dword ptr ss:[rsp+F0],0
je      oglmdi2_vs2019.13F12CFAD
mov     dl,1
mov     rcx,rsi
call    oglmdi2_vs2019.13F12B61C
mov     rax,qword ptr ss:[rsp+40]
lea     r9,qword ptr ds:[rax+20]
mov     r8d,dword ptr ds:[rax+18]
mov     edx,dword ptr ds:[rax+4]
mov     ecx,dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F12CFBA
lea     r9,qword ptr ds:[rsi+20]
mov     r8d,dword ptr ds:[rsi+18]
mov     edx,dword ptr ds:[rsi+4]
mov     ecx,dword ptr ds:[rsi]
call    qword ptr ds:[<&RaiseException>]
mov     r12d,dword ptr ss:[rsp+20]
mov     rbx,qword ptr ss:[rsp+28]
mov     rdi,qword ptr ss:[rsp+38]
mov     r15,qword ptr ss:[rsp+30]
mov     r13,qword ptr ss:[rsp+48]
mov     rcx,r13
call    oglmdi2_vs2019.13F12AFFC
test    r12d,r12d
jne     oglmdi2_vs2019.13F12D018
cmp     dword ptr ds:[rsi],E06D7363
jne     oglmdi2_vs2019.13F12D018
cmp     dword ptr ds:[rsi+18],4
jne     oglmdi2_vs2019.13F12D018
mov     eax,dword ptr ds:[rsi+20]
sub     eax,19930520
cmp     eax,2
ja      oglmdi2_vs2019.13F12D018
mov     rcx,qword ptr ds:[rsi+28]
call    oglmdi2_vs2019.13F12B690
test    eax,eax
je      oglmdi2_vs2019.13F12D018
mov     dl,1
mov     rcx,rsi
call    oglmdi2_vs2019.13F12B61C
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+20],r15
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+28],rdi
call    oglmdi2_vs2019.13F12B958
mov     ecx,dword ptr ss:[rsp+E0]
mov     dword ptr ds:[rax+78],ecx
call    oglmdi2_vs2019.13F12B958
mov     dword ptr ds:[rax+78],FFFFFFFE
mov     rax,rbx
add     rsp,A8
pop     r15
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbx
ret     
call    oglmdi2_vs2019.13F132878
nop     
int3    
xor     eax,eax
lea     r11,qword ptr ds:[13F120000]
mov     byte ptr ds:[rcx+18],al
xorps   xmm0,xmm0
mov     qword ptr ds:[rcx+1C],rax
mov     r9,rcx
mov     qword ptr ds:[rcx+24],rax
movups  xmmword ptr ds:[rcx+30],xmm0
mov     rax,qword ptr ds:[rcx+8]
mov     r8b,byte ptr ds:[rax]
lea     rdx,qword ptr ds:[rax+1]
mov     byte ptr ds:[rcx+18],r8b
mov     qword ptr ds:[rcx+8],rdx
test    r8b,1
je      oglmdi2_vs2019.13F12D0BE
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     dword ptr ds:[r9+1C],eax
mov     qword ptr ds:[r9+8],rdx
test    r8b,2
je      oglmdi2_vs2019.13F12D0D2
mov     eax,dword ptr ds:[rdx]
add     rdx,4
mov     qword ptr ds:[r9+8],rdx
mov     dword ptr ds:[r9+20],eax
test    r8b,4
je      oglmdi2_vs2019.13F12D0FF
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     dword ptr ds:[r9+24],eax
mov     qword ptr ds:[r9+8],rdx
mov     eax,dword ptr ds:[rdx]
lea     r10,qword ptr ds:[rdx+4]
mov     dword ptr ds:[r9+28],eax
mov     al,r8b
and     al,30
mov     qword ptr ds:[r9+8],r10
test    r8b,8
je      oglmdi2_vs2019.13F12D157
cmp     al,10
jne     oglmdi2_vs2019.13F12D12C
movsxd  rcx,dword ptr ds:[r10]
lea     rax,qword ptr ds:[r10+4]
mov     qword ptr ds:[r9+8],rax
mov     qword ptr ds:[r9+30],rcx
ret     
cmp     al,20
jne     oglmdi2_vs2019.13F12D1EF
movsxd  rcx,dword ptr ds:[r10]
lea     rax,qword ptr ds:[r10+4]
mov     qword ptr ds:[r9+8],rax
mov     qword ptr ds:[r9+30],rcx
mov     rax,qword ptr ds:[r9+8]
movsxd  rcx,dword ptr ds:[rax]
add     rax,4
mov     qword ptr ds:[r9+8],rax
jmp     oglmdi2_vs2019.13F12D1EB
cmp     al,10
jne     oglmdi2_vs2019.13F12D18B
movzx   ecx,byte ptr ds:[r10]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     r10,rax
mov     eax,dword ptr ds:[r9+48]
mov     edx,dword ptr ds:[r10-4]
shr     edx,cl
add     eax,edx
mov     qword ptr ds:[r9+8],r10
mov     qword ptr ds:[r9+30],rax
ret     
cmp     al,20
jne     oglmdi2_vs2019.13F12D1EF
movzx   ecx,byte ptr ds:[r10]
mov     r8d,dword ptr ds:[r9+48]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     r10,rax
mov     rdx,r10
mov     eax,dword ptr ds:[r10-4]
shr     eax,cl
mov     qword ptr ds:[r9+8],r10
lea     ecx,dword ptr ds:[r8+rax]
mov     qword ptr ds:[r9+30],rcx
movzx   ecx,byte ptr ds:[r10]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r9+8],rdx
lea     ecx,dword ptr ds:[r8+rax]
mov     qword ptr ds:[r9+38],rcx
ret     
push    rbx
sub     rsp,20
mov     r9,qword ptr ds:[rcx]
mov     rbx,r8
and     dword ptr ds:[r8],0
mov     ecx,E06D7363
mov     r8d,19930520
mov     eax,dword ptr ds:[r9]
cmp     eax,ecx
jne     oglmdi2_vs2019.13F12D26F
cmp     dword ptr ds:[r9+18],4
jne     oglmdi2_vs2019.13F12D26F
mov     eax,dword ptr ds:[r9+20]
sub     eax,r8d
cmp     eax,2
ja      oglmdi2_vs2019.13F12D23C
mov     rax,qword ptr ds:[rdx+28]
cmp     qword ptr ds:[r9+28],rax
jne     oglmdi2_vs2019.13F12D23C
mov     dword ptr ds:[rbx],1
mov     eax,dword ptr ds:[r9]
cmp     eax,ecx
jne     oglmdi2_vs2019.13F12D26F
cmp     dword ptr ds:[r9+18],4
jne     oglmdi2_vs2019.13F12D26F
mov     ecx,dword ptr ds:[r9+20]
sub     ecx,r8d
cmp     ecx,2
ja      oglmdi2_vs2019.13F12D26F
cmp     qword ptr ds:[r9+30],0
jne     oglmdi2_vs2019.13F12D26F
call    oglmdi2_vs2019.13F12B958
mov     dword ptr ds:[rax+40],1
mov     eax,1
mov     dword ptr ds:[rbx],1
jmp     oglmdi2_vs2019.13F12D271
xor     eax,eax
add     rsp,20
pop     rbx
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     edi,r8d
mov     r8,r9
call    oglmdi2_vs2019.13F12D1F0
mov     ebx,eax
test    eax,eax
jne     oglmdi2_vs2019.13F12D29B
call    oglmdi2_vs2019.13F12B958
mov     dword ptr ds:[rax+78],edi
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
mov     rax,rsp
push    rbx
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,F0
movaps  xmmword ptr ds:[rax-48],xmm6
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+D0],rax
mov     r12d,r9d
mov     rbx,r8
mov     rdi,rdx
mov     r15,rcx
mov     qword ptr ss:[rsp+70],rcx
mov     qword ptr ss:[rsp+60],rcx
mov     qword ptr ss:[rsp+78],rdx
mov     dword ptr ss:[rsp+48],r9d
call    oglmdi2_vs2019.13F12B050
mov     r13,rax
mov     qword ptr ss:[rsp+68],rax
mov     esi,dword ptr ds:[rdi+48]
test    esi,esi
je      oglmdi2_vs2019.13F12D30C
add     esi,FFFFFFFE
jmp     oglmdi2_vs2019.13F12D33A
call    oglmdi2_vs2019.13F12B958
cmp     dword ptr ds:[rax+78],FFFFFFFE
je      oglmdi2_vs2019.13F12D32D
call    oglmdi2_vs2019.13F12B958
mov     esi,dword ptr ds:[rax+78]
call    oglmdi2_vs2019.13F12B958
mov     dword ptr ds:[rax+78],FFFFFFFE
jmp     oglmdi2_vs2019.13F12D33A
mov     rdx,rdi
mov     rcx,rbx
call    oglmdi2_vs2019.13F12BAA0
mov     esi,eax
call    oglmdi2_vs2019.13F12B958
inc     dword ptr ds:[rax+30]
cmp     dword ptr ds:[rbx+8],0
je      oglmdi2_vs2019.13F12D388
movsxd  rdx,dword ptr ds:[rbx+8]
add     rdx,qword ptr ds:[rdi+8]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
lea     r8,qword ptr ds:[13F120000]
movsx   rax,byte ptr ds:[rcx+r8+21048]
movzx   ecx,byte ptr ds:[rcx+r8+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     dword ptr ss:[rsp+B0],eax
mov     qword ptr ss:[rsp+B8],rdx
jmp     oglmdi2_vs2019.13F12D398
and     dword ptr ss:[rsp+B0],0
mov     rdx,qword ptr ss:[rsp+B8]
lea     rax,qword ptr ss:[rsp+B0]
mov     qword ptr ss:[rsp+30],rax
mov     qword ptr ss:[rsp+38],rdx
lea     rax,qword ptr ss:[rsp+B0]
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+58],rdx
lea     rax,qword ptr ss:[rsp+50]
mov     qword ptr ss:[rsp+20],rax
lea     r9,qword ptr ss:[rsp+30]
mov     r8d,r12d
mov     edx,esi
lea     rcx,qword ptr ss:[rsp+B0]
call    oglmdi2_vs2019.13F12D7B0
nop     
lea     rax,qword ptr ss:[rsp+B0]
mov     qword ptr ss:[rsp+90],rax
mov     rax,qword ptr ss:[rsp+B8]
mov     qword ptr ss:[rsp+98],rax
mov     r14,qword ptr ss:[rsp+38]
cmp     r14,rax
jb      oglmdi2_vs2019.13F12D53B
cmp     r14,qword ptr ss:[rsp+58]
jbe     oglmdi2_vs2019.13F12D53B
lea     rdx,qword ptr ss:[rsp+38]
mov     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F12D6F4
mov     qword ptr ss:[rsp+38],r14
mov     rbx,qword ptr ss:[rsp+30]
movups  xmm6,xmmword ptr ds:[rbx+10]
movups  xmmword ptr ss:[rsp+80],xmm6
movaps  xmm0,xmmword ptr ss:[rsp+30]
movdqa  xmmword ptr ss:[rsp+A0],xmm0
lea     rdx,qword ptr ss:[rsp+38]
mov     rcx,rbx
call    oglmdi2_vs2019.13F12D6F4
mov     eax,dword ptr ds:[rbx+10]
sub     r14,rax
mov     qword ptr ss:[rsp+38],r14
lea     rax,qword ptr ss:[rsp+30]
mov     qword ptr ss:[rsp+20],rax
mov     r9d,esi
lea     r8,qword ptr ss:[rsp+A0]
mov     edx,r12d
lea     rcx,qword ptr ss:[rsp+50]
call    oglmdi2_vs2019.13F12D880
mov     esi,eax
mov     dword ptr ss:[rsp+44],eax
and     dword ptr ss:[rsp+40],0
xor     r9d,r9d
movdqa  xmm0,xmm6
psrldq  xmm0,8
movd    eax,xmm0
psrldq  xmm6,4
movd    ecx,xmm6
test    ecx,ecx
cmovne  r9d,eax
mov     dword ptr ss:[rsp+40],r9d
test    r9d,r9d
je      oglmdi2_vs2019.13F12D536
lea     eax,dword ptr ds:[rsi+2]
mov     dword ptr ds:[rdi+48],eax
lea     eax,dword ptr ds:[rcx-1]
cmp     eax,1
jbe     oglmdi2_vs2019.13F12D4DD
movsxd  rcx,r9d
add     rcx,qword ptr ds:[rdi+8]
mov     r8d,103
mov     rdx,r15
call    oglmdi2_vs2019.13F12DD40
jmp     oglmdi2_vs2019.13F12D514
mov     rax,qword ptr ss:[rsp+60]
mov     rdx,qword ptr ds:[rax]
cmp     ecx,2
jne     oglmdi2_vs2019.13F12D4F7
mov     eax,dword ptr ss:[rsp+8C]
mov     r8,qword ptr ds:[rax+rdx]
jmp     oglmdi2_vs2019.13F12D502
mov     r8d,dword ptr ss:[rsp+8C]
add     r8,rdx
movsxd  rcx,r9d
add     rcx,qword ptr ds:[rdi+8]
mov     r9d,103
call    oglmdi2_vs2019.13F12DDF0
mov     rcx,r13
call    oglmdi2_vs2019.13F12B078
jmp     oglmdi2_vs2019.13F12D536
mov     r13,qword ptr ss:[rsp+68]
mov     esi,dword ptr ss:[rsp+44]
mov     r15,qword ptr ss:[rsp+70]
mov     rdi,qword ptr ss:[rsp+78]
mov     r12d,dword ptr ss:[rsp+48]
jmp     oglmdi2_vs2019.13F12D3DE
call    oglmdi2_vs2019.13F12B958
cmp     dword ptr ds:[rax+30],0
jle     oglmdi2_vs2019.13F12D54E
call    oglmdi2_vs2019.13F12B958
dec     dword ptr ds:[rax+30]
mov     rcx,qword ptr ss:[rsp+D0]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
movaps  xmm6,xmmword ptr ss:[rsp+E0]
add     rsp,F0
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+18],rbp
mov     qword ptr ss:[rsp+20],rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,20
mov     rbp,rdx
mov     r13,rcx
test    rdx,rdx
je      oglmdi2_vs2019.13F12D663
xor     r15b,r15b
xor     esi,esi
cmp     dword ptr ds:[rdx],esi
jle     oglmdi2_vs2019.13F12D643
call    oglmdi2_vs2019.13F12B064
mov     rdx,rax
mov     rax,qword ptr ds:[r13+30]
movsxd  r12,dword ptr ds:[rax+C]
add     r12,4
add     r12,rdx
call    oglmdi2_vs2019.13F12B064
mov     rdx,rax
mov     rax,qword ptr ds:[r13+30]
movsxd  rcx,dword ptr ds:[rax+C]
mov     r14d,dword ptr ds:[rdx+rcx]
test    r14d,r14d
jle     oglmdi2_vs2019.13F12D638
movsxd  rax,esi
lea     rax,qword ptr ds:[rax+rax*4]
mov     qword ptr ss:[rsp+58],rax
call    oglmdi2_vs2019.13F12B064
mov     rbx,qword ptr ds:[r13+30]
mov     rdi,rax
movsxd  rax,dword ptr ds:[r12]
add     rdi,rax
call    oglmdi2_vs2019.13F12B050
mov     rdx,qword ptr ss:[rsp+58]
mov     r8,rbx
movsxd  rcx,dword ptr ss:[rbp+4]
lea     rax,qword ptr ds:[rax+rdx*4]
mov     rdx,rdi
add     rcx,rax
call    oglmdi2_vs2019.13F12C734
test    eax,eax
jne     oglmdi2_vs2019.13F12D635
dec     r14d
add     r12,4
test    r14d,r14d
jg      oglmdi2_vs2019.13F12D5F0
jmp     oglmdi2_vs2019.13F12D638
mov     r15b,1
inc     esi
cmp     esi,dword ptr ss:[rbp]
jl      oglmdi2_vs2019.13F12D5B4
mov     rbx,qword ptr ss:[rsp+50]
mov     al,r15b
mov     rbp,qword ptr ss:[rsp+60]
mov     rsi,qword ptr ss:[rsp+68]
add     rsp,20
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
ret     
call    oglmdi2_vs2019.13F132878
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
xor     ebp,ebp
mov     rdi,rcx
cmp     dword ptr ds:[rcx],ebp
jle     oglmdi2_vs2019.13F12D6D9
xor     esi,esi
call    oglmdi2_vs2019.13F12B050
movsxd  rcx,dword ptr ds:[rdi+4]
add     rax,rsi
cmp     dword ptr ds:[rcx+rax+4],0
je      oglmdi2_vs2019.13F12D6B9
call    oglmdi2_vs2019.13F12B050
movsxd  rcx,dword ptr ds:[rdi+4]
add     rax,rsi
movsxd  rbx,dword ptr ds:[rcx+rax+4]
call    oglmdi2_vs2019.13F12B050
add     rax,rbx
jmp     oglmdi2_vs2019.13F12D6BB
xor     eax,eax
lea     rcx,qword ptr ds:[rax+8]
lea     rdx,qword ptr ds:[13F14CB48]
call    oglmdi2_vs2019.13F12B7B8
test    eax,eax
je      oglmdi2_vs2019.13F12D6F0
inc     ebp
add     rsi,14
cmp     ebp,dword ptr ds:[rdi]
jl      oglmdi2_vs2019.13F12D68B
xor     al,al
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
mov     al,1
jmp     oglmdi2_vs2019.13F12D6DB
mov     r8,qword ptr ds:[rdx]
lea     r11,qword ptr ds:[13F120000]
mov     r10,rcx
mov     r9,rdx
movzx   ecx,byte ptr ds:[r8]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     r8,rax
mov     eax,dword ptr ds:[r8-4]
shr     eax,cl
mov     ecx,eax
mov     qword ptr ds:[rdx],r8
and     ecx,3
shr     eax,2
mov     dword ptr ds:[r10+14],ecx
mov     dword ptr ds:[r10+10],eax
cmp     ecx,1
je      oglmdi2_vs2019.13F12D758
cmp     ecx,2
je      oglmdi2_vs2019.13F12D758
cmp     ecx,3
jne     oglmdi2_vs2019.13F12D791
mov     rax,qword ptr ds:[rdx]
mov     ecx,dword ptr ds:[rax]
add     rax,4
mov     qword ptr ds:[rdx],rax
mov     dword ptr ds:[r10+18],ecx
ret     
mov     rax,qword ptr ds:[rdx]
mov     ecx,dword ptr ds:[rax]
add     rax,4
mov     qword ptr ds:[rdx],rax
mov     dword ptr ds:[r10+18],ecx
mov     rdx,qword ptr ds:[rdx]
movzx   ecx,byte ptr ds:[rdx]
and     ecx,F
movsx   rax,byte ptr ds:[rcx+r11+21048]
mov     cl,byte ptr ds:[rcx+r11+21058]
sub     rdx,rax
mov     eax,dword ptr ds:[rdx-4]
shr     eax,cl
mov     qword ptr ds:[r9],rdx
mov     dword ptr ds:[r10+1C],eax
ret     
int3    
int3    
mov     rax,rdx
mov     rdx,r8
jmp     rax
int3    
int3    
int3    
mov     rax,r8
mov     r10,rdx
mov     rdx,rax
mov     r8d,r9d
jmp     r10
int3    
mov     r11,rsp
mov     qword ptr ds:[r11+18],rbx
mov     qword ptr ds:[r11+20],r9
mov     dword ptr ss:[rsp+10],edx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,20
mov     rax,qword ptr ds:[rcx+8]
xor     bpl,bpl
xor     r14b,r14b
mov     qword ptr ds:[r11+8],rax
xor     edi,edi
mov     r12,r9
mov     r13d,r8d
mov     rbx,rcx
lea     rsi,qword ptr ds:[rax-1]
mov     r15,rsi
cmp     dword ptr ds:[rcx],edi
jle     oglmdi2_vs2019.13F12D835
mov     r12d,dword ptr ds:[r11+10]
cmp     edi,r12d
jne     oglmdi2_vs2019.13F12D801
mov     rsi,rax
mov     bpl,1
cmp     edi,r13d
jne     oglmdi2_vs2019.13F12D80C
mov     r15,rax
mov     r14b,1
test    bpl,bpl
je      oglmdi2_vs2019.13F12D816
test    r14b,r14b
jne     oglmdi2_vs2019.13F12D830
lea     rdx,qword ptr ss:[rsp+60]
mov     rcx,rbx
call    oglmdi2_vs2019.13F12D6F4
inc     edi
cmp     edi,dword ptr ds:[rbx]
jge     oglmdi2_vs2019.13F12D830
mov     rax,qword ptr ss:[rsp+60]
jmp     oglmdi2_vs2019.13F12D7F6
mov     r12,qword ptr ss:[rsp+78]
mov     rax,qword ptr ds:[r12]
mov     qword ptr ds:[r12+8],rsi
movups  xmm0,xmmword ptr ds:[rbx]
movups  xmmword ptr ds:[rax],xmm0
movups  xmm1,xmmword ptr ds:[rbx+10]
movups  xmmword ptr ds:[rax+10],xmm1
mov     rax,qword ptr ss:[rsp+80]
mov     rcx,qword ptr ds:[rax]
mov     qword ptr ds:[rax+8],r15
movups  xmm0,xmmword ptr ds:[rbx]
movups  xmmword ptr ds:[rcx],xmm0
movups  xmm1,xmmword ptr ds:[rbx+10]
mov     rbx,qword ptr ss:[rsp+70]
movups  xmmword ptr ds:[rcx+10],xmm1
add     rsp,20
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,30
mov     rdi,qword ptr ss:[rsp+60]
mov     rsi,r8
mov     ebx,edx
mov     r10,qword ptr ds:[rdi+8]
cmp     r10,qword ptr ds:[r8+8]
ja      oglmdi2_vs2019.13F12D934
cmp     qword ptr ds:[rcx+8],r10
ja      oglmdi2_vs2019.13F12D934
mov     rax,qword ptr ds:[r8+8]
mov     rdx,r10
sub     rdx,qword ptr ds:[rcx+8]
sub     rax,r10
cmp     rdx,rax
jge     oglmdi2_vs2019.13F12D8F9
movups  xmm0,xmmword ptr ds:[rcx]
movups  xmmword ptr ss:[rsp+20],xmm0
psrldq  xmm0,8
movq    rax,xmm0
cmp     r10,rax
jbe     oglmdi2_vs2019.13F12D930
mov     rcx,qword ptr ss:[rsp+20]
lea     rdx,qword ptr ss:[rsp+28]
call    oglmdi2_vs2019.13F12D6F4
mov     rax,qword ptr ss:[rsp+28]
inc     ebx
cmp     qword ptr ds:[rdi+8],rax
ja      oglmdi2_vs2019.13F12D8DB
jmp     oglmdi2_vs2019.13F12D930
movups  xmm0,xmmword ptr ds:[rdi]
mov     ebx,r9d
movups  xmmword ptr ss:[rsp+20],xmm0
psrldq  xmm0,8
movq    rax,xmm0
cmp     qword ptr ds:[r8+8],rax
jbe     oglmdi2_vs2019.13F12D930
mov     rcx,qword ptr ss:[rsp+20]
lea     rdx,qword ptr ss:[rsp+28]
call    oglmdi2_vs2019.13F12D6F4
mov     rcx,qword ptr ss:[rsp+28]
dec     ebx
cmp     qword ptr ds:[rsi+8],rcx
ja      oglmdi2_vs2019.13F12D914
mov     eax,ebx
jmp     oglmdi2_vs2019.13F12D937
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+48]
add     rsp,30
pop     rdi
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
int3    
nop     word ptr ds:[rax+rax]
mov     qword ptr ss:[rsp+8],rcx
mov     qword ptr ss:[rsp+18],rdx
mov     dword ptr ss:[rsp+10],r8d
mov     r9,19930520
jmp     oglmdi2_vs2019.13F12D980
int3    
int3    
int3    
int3    
int3    
int3    
nop     
ret     
int3    
int3    
int3    
int3    
int3    
int3    
nop     word ptr ds:[rax+rax]
ret     
int3    
int3    
int3    
mov     rax,qword ptr ds:[13F140488]
lea     rdx,qword ptr ds:[13F12A1E4]
cmp     rax,rdx
je      oglmdi2_vs2019.13F12D9CA
mov     rax,qword ptr gs:[30]
mov     rcx,qword ptr ds:[rcx+98]
cmp     rcx,qword ptr ds:[rax+10]
jb      oglmdi2_vs2019.13F12D9C3
cmp     rcx,qword ptr ds:[rax+8]
jbe     oglmdi2_vs2019.13F12D9CA
mov     ecx,D
int     29
ret     
int3    
sub     rsp,28
xor     r8d,r8d
lea     rcx,qword ptr ds:[13F14D800]
mov     edx,FA0
call    oglmdi2_vs2019.13F12DCC0
test    eax,eax
je      oglmdi2_vs2019.13F12D9F2
inc     dword ptr ds:[13F14D828]
mov     al,1
jmp     oglmdi2_vs2019.13F12D9F9
call    oglmdi2_vs2019.13F12DA00
xor     al,al
add     rsp,28
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     ebx,dword ptr ds:[13F14D828]
jmp     oglmdi2_vs2019.13F12DA2B
lea     rax,qword ptr ds:[13F14D800]
dec     ebx
lea     rcx,qword ptr ds:[rbx+rbx*4]
lea     rcx,qword ptr ds:[rax+rcx*8]
call    qword ptr ds:[<&RtlDeleteCriticalSection>]
dec     dword ptr ds:[13F14D828]
test    ebx,ebx
jne     oglmdi2_vs2019.13F12DA0E
mov     al,1
add     rsp,20
pop     rbx
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,20
mov     edi,ecx
lea     r15,qword ptr ds:[13F120000]
mov     r12,r9
mov     rbp,r8
mov     r13,rdx
mov     rax,qword ptr ds:[r15+rdi*8+2D8B0]
or      r14,FFFFFFFFFFFFFFFF
cmp     rax,r14
je      oglmdi2_vs2019.13F12DB74
test    rax,rax
jne     oglmdi2_vs2019.13F12DB76
cmp     r8,r9
je      oglmdi2_vs2019.13F12DB47
mov     esi,dword ptr ss:[rbp]
mov     rbx,qword ptr ds:[r15+rsi*8+2D898]
test    rbx,rbx
je      oglmdi2_vs2019.13F12DAAB
cmp     rbx,r14
je      oglmdi2_vs2019.13F12DB3A
jmp     oglmdi2_vs2019.13F12DB35
mov     r15,qword ptr ds:[r15+rsi*8+21EF8]
xor     edx,edx
mov     rcx,r15
mov     r8d,800
call    qword ptr ds:[<&LoadLibraryExW>]
mov     rbx,rax
test    rax,rax
jne     oglmdi2_vs2019.13F12DB03
call    qword ptr ds:[<&GetLastError>]
cmp     eax,57
jne     oglmdi2_vs2019.13F12DB01
lea     r8d,dword ptr ds:[rbx+7]
mov     rcx,r15
lea     rdx,qword ptr ds:[13F141FA8]
call    oglmdi2_vs2019.13F132D50
test    eax,eax
je      oglmdi2_vs2019.13F12DB01
xor     r8d,r8d
xor     edx,edx
mov     rcx,r15
call    qword ptr ds:[<&LoadLibraryExW>]
mov     rbx,rax
jmp     oglmdi2_vs2019.13F12DB03
xor     ebx,ebx
lea     r15,qword ptr ds:[13F120000]
test    rbx,rbx
jne     oglmdi2_vs2019.13F12DB1C
mov     rax,r14
xchg    qword ptr ds:[r15+rsi*8+2D898],rax
jmp     oglmdi2_vs2019.13F12DB3A
mov     rax,rbx
xchg    qword ptr ds:[r15+rsi*8+2D898],rax
test    rax,rax
je      oglmdi2_vs2019.13F12DB35
mov     rcx,rbx
call    qword ptr ds:[<&FreeLibrary>]
test    rbx,rbx
jne     oglmdi2_vs2019.13F12DB4E
add     rbp,4
cmp     rbp,r12
jne     oglmdi2_vs2019.13F12DA8D
xor     ebx,ebx
test    rbx,rbx
je      oglmdi2_vs2019.13F12DB6C
mov     rdx,r13
mov     rcx,rbx
call    qword ptr ds:[<&GetProcAddress>]
test    rax,rax
je      oglmdi2_vs2019.13F12DB6C
mov     rcx,rax
xchg    qword ptr ds:[r15+rdi*8+2D8B0],rcx
jmp     oglmdi2_vs2019.13F12DB76
xchg    qword ptr ds:[r15+rdi*8+2D8B0],r14
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+50]
mov     rbp,qword ptr ss:[rsp+58]
mov     rsi,qword ptr ss:[rsp+60]
add     rsp,20
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
ret     
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
lea     r9,qword ptr ds:[13F141FC0]
xor     ecx,ecx
lea     r8,qword ptr ds:[13F141FB8]
lea     rdx,qword ptr ds:[13F140BB8]
call    oglmdi2_vs2019.13F12DA38
test    rax,rax
je      oglmdi2_vs2019.13F12DBCD
mov     rcx,rbx
add     rsp,20
pop     rbx
jmp     qword ptr ds:[13F140490]
add     rsp,20
pop     rbx
jmp     qword ptr ds:[<&TlsAlloc>]
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     ebx,ecx
lea     r9,qword ptr ds:[13F141FC8]
mov     ecx,1
lea     r8,qword ptr ds:[13F141FC0]
lea     rdx,qword ptr ds:[13F140BC8]
call    oglmdi2_vs2019.13F12DA38
mov     ecx,ebx
test    rax,rax
je      oglmdi2_vs2019.13F12DC16
add     rsp,20
pop     rbx
jmp     qword ptr ds:[13F140490]
add     rsp,20
pop     rbx
jmp     qword ptr ds:[<&TlsFree>]
int3    
int3    
push    rbx
sub     rsp,20
mov     ebx,ecx
lea     r9,qword ptr ds:[13F141FD0]
mov     ecx,2
lea     r8,qword ptr ds:[13F141FC8]
lea     rdx,qword ptr ds:[13F140BD0]
call    oglmdi2_vs2019.13F12DA38
mov     ecx,ebx
test    rax,rax
je      oglmdi2_vs2019.13F12DC5E
add     rsp,20
pop     rbx
jmp     qword ptr ds:[13F140490]
add     rsp,20
pop     rbx
jmp     qword ptr ds:[<&TlsGetValue>]
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rbx,rdx
lea     r9,qword ptr ds:[13F141FD8]
mov     edi,ecx
lea     rdx,qword ptr ds:[13F140BE0]
mov     ecx,3
lea     r8,qword ptr ds:[13F141FD0]
call    oglmdi2_vs2019.13F12DA38
mov     rdx,rbx
mov     ecx,edi
test    rax,rax
je      oglmdi2_vs2019.13F12DCAC
call    qword ptr ds:[13F140490]
jmp     oglmdi2_vs2019.13F12DCB2
call    qword ptr ds:[<&TlsSetValue>]
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     esi,r8d
lea     r9,qword ptr ds:[13F141FE0]
mov     ebx,edx
lea     r8,qword ptr ds:[13F141FD8]
mov     rdi,rcx
lea     rdx,qword ptr ds:[13F140BF0]
mov     ecx,4
call    oglmdi2_vs2019.13F12DA38
mov     edx,ebx
mov     rcx,rdi
test    rax,rax
je      oglmdi2_vs2019.13F12DD0B
mov     r8d,esi
call    qword ptr ds:[13F140490]
jmp     oglmdi2_vs2019.13F12DD11
call    qword ptr ds:[<&InitializeCriticalSectionAndSpinCount>]
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
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
int3    
int3    
int3    
int3    
int3    
int3    
int3    
nop     word ptr ds:[rax+rax]
sub     rsp,28
mov     qword ptr ss:[rsp+30],rcx
mov     qword ptr ss:[rsp+38],rdx
mov     dword ptr ss:[rsp+40],r8d
mov     rdx,qword ptr ds:[rdx]
mov     rax,rcx
call    oglmdi2_vs2019.13F12D960
call    rax
call    oglmdi2_vs2019.13F12D990
mov     rcx,rax
mov     rdx,qword ptr ss:[rsp+38]
mov     rdx,qword ptr ds:[rdx]
mov     r8d,2
call    oglmdi2_vs2019.13F12D960
add     rsp,28
ret     
int3    
int3    
int3    
int3    
int3    
int3    
nop     word ptr ds:[rax+rax]
sub     rsp,28
mov     qword ptr ss:[rsp+30],rcx
mov     qword ptr ss:[rsp+38],rdx
mov     dword ptr ss:[rsp+40],r8d
mov     rdx,qword ptr ds:[rdx]
mov     rax,rcx
call    oglmdi2_vs2019.13F12D960
call    rax
call    oglmdi2_vs2019.13F12D990
add     rsp,28
ret     
int3    
int3    
int3    
int3    
int3    
int3    
sub     rsp,28
mov     qword ptr ss:[rsp+30],rcx
mov     qword ptr ss:[rsp+38],rdx
mov     rdx,qword ptr ss:[rsp+38]
mov     rdx,qword ptr ds:[rdx]
mov     r8d,2
call    oglmdi2_vs2019.13F12D960
add     rsp,28
ret     
int3    
int3    
int3    
int3    
int3    
int3    
nop     dword ptr ds:[rax]
sub     rsp,28
mov     qword ptr ss:[rsp+30],rcx
mov     qword ptr ss:[rsp+38],rdx
mov     qword ptr ss:[rsp+40],r8
mov     dword ptr ss:[rsp+48],r9d
mov     r8d,r9d
mov     rax,rcx
call    oglmdi2_vs2019.13F12D960
mov     rcx,qword ptr ss:[rsp+40]
call    rax
call    oglmdi2_vs2019.13F12D990
mov     rcx,rax
mov     rdx,qword ptr ss:[rsp+38]
mov     r8d,2
call    oglmdi2_vs2019.13F12D960
add     rsp,28
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
int3    
nop     word ptr ds:[rax+rax]
push    rdi
push    rsi
mov     rax,r11
mov     rdi,rcx
mov     rcx,r8
mov     rsi,r10
rep movsb byte ptr ds:[rdi],byte ptr ds:[rsi]
pop     rsi
pop     rdi
ret     
int3    
int3    
int3    
int3    
int3    
int3    
nop     dword ptr ds:[rax]
mov     r11,rcx
mov     r10,rdx
cmp     r8,10
jbe     oglmdi2_vs2019.13F12DED0
cmp     r8,20
jbe     oglmdi2_vs2019.13F12DEB0
sub     rdx,rcx
jae     oglmdi2_vs2019.13F12DE94
lea     rax,qword ptr ds:[r8+r10]
cmp     rcx,rax
jb      oglmdi2_vs2019.13F12E170
cmp     r8,80
jbe     oglmdi2_vs2019.13F12E0B0
test    byte ptr ds:[13F14D76C],2
je      oglmdi2_vs2019.13F12E000
jmp     oglmdi2_vs2019.13F12DE50
movups  xmm0,xmmword ptr ds:[rdx]
movups  xmm1,xmmword ptr ds:[rdx+r8-10]
movups  xmmword ptr ds:[rcx],xmm0
movups  xmmword ptr ds:[rcx+r8-10],xmm1
mov     rax,rcx
ret     
nop     word ptr ds:[rax+rax]
mov     rax,rcx
lea     r9,qword ptr ds:[13F120000]
mov     ecx,dword ptr ds:[r9+r8*4+31050]
add     rcx,r9
jmp     rcx
nop     word ptr ds:[rax+rax]
ret     
movzx   ecx,word ptr ds:[rdx]
mov     word ptr ds:[rax],cx
ret     
mov     rcx,qword ptr ds:[rdx]
mov     qword ptr ds:[rax],rcx
ret     
movzx   ecx,word ptr ds:[rdx]
movzx   r8d,byte ptr ds:[rdx+2]
mov     word ptr ds:[rax],cx
mov     byte ptr ds:[rax+2],r8b
ret     
movzx   ecx,byte ptr ds:[rdx]
mov     byte ptr ds:[rax],cl
ret     
movdqu  xmm0,xmmword ptr ds:[rdx]
movdqu  xmmword ptr ds:[rax],xmm0
ret     
nop     
mov     r8,qword ptr ds:[rdx]
movzx   ecx,word ptr ds:[rdx+8]
movzx   r9d,byte ptr ds:[rdx+A]
mov     qword ptr ds:[rax],r8
mov     word ptr ds:[rax+8],cx
mov     byte ptr ds:[rax+A],r9b
ret     
mov     ecx,dword ptr ds:[rdx]
mov     dword ptr ds:[rax],ecx
ret     
nop     dword ptr ds:[rax]
mov     ecx,dword ptr ds:[rdx]
movzx   r8d,byte ptr ds:[rdx+4]
mov     dword ptr ds:[rax],ecx
mov     byte ptr ds:[rax+4],r8b
ret     
nop     
mov     ecx,dword ptr ds:[rdx]
movzx   r8d,word ptr ds:[rdx+4]
mov     dword ptr ds:[rax],ecx
mov     word ptr ds:[rax+4],r8w
ret     
nop     
mov     ecx,dword ptr ds:[rdx]
movzx   r8d,word ptr ds:[rdx+4]
movzx   r9d,byte ptr ds:[rdx+6]
mov     dword ptr ds:[rax],ecx
mov     word ptr ds:[rax+4],r8w
mov     byte ptr ds:[rax+6],r9b
ret     
mov     r8,qword ptr ds:[rdx]
mov     ecx,dword ptr ds:[rdx+8]
movzx   r9d,byte ptr ds:[rdx+C]
mov     qword ptr ds:[rax],r8
mov     dword ptr ds:[rax+8],ecx
mov     byte ptr ds:[rax+C],r9b
ret     
nop     
mov     r8,qword ptr ds:[rdx]
movzx   ecx,byte ptr ds:[rdx+8]
mov     qword ptr ds:[rax],r8
mov     byte ptr ds:[rax+8],cl
ret     
nop     
mov     r8,qword ptr ds:[rdx]
movzx   ecx,word ptr ds:[rdx+8]
mov     qword ptr ds:[rax],r8
mov     word ptr ds:[rax+8],cx
ret     
nop     
mov     r8,qword ptr ds:[rdx]
mov     ecx,dword ptr ds:[rdx+8]
mov     qword ptr ds:[rax],r8
mov     dword ptr ds:[rax+8],ecx
ret     
nop     dword ptr ds:[rax]
mov     r8,qword ptr ds:[rdx]
mov     ecx,dword ptr ds:[rdx+8]
movzx   r9d,word ptr ds:[rdx+C]
mov     qword ptr ds:[rax],r8
mov     dword ptr ds:[rax+8],ecx
mov     word ptr ds:[rax+C],r9w
ret     
nop     word ptr ds:[rax+rax]
mov     r8,qword ptr ds:[rdx]
mov     ecx,dword ptr ds:[rdx+8]
movzx   r9d,word ptr ds:[rdx+C]
movzx   r10d,byte ptr ds:[rdx+E]
mov     qword ptr ds:[rax],r8
mov     dword ptr ds:[rax+8],ecx
mov     word ptr ds:[rax+C],r9w
mov     byte ptr ds:[rax+E],r10b
ret     
movups  xmm0,xmmword ptr ds:[rcx+rdx]
add     r8,rcx
add     rcx,10
test    r11b,F
je      oglmdi2_vs2019.13F12E024
movaps  xmm1,xmm0
and     rcx,FFFFFFFFFFFFFFF0
movups  xmm0,xmmword ptr ds:[rcx+rdx]
add     rcx,10
movups  xmmword ptr ds:[r11],xmm1
sub     r8,rcx
mov     r9,r8
shr     r9,7
je      oglmdi2_vs2019.13F12E0BC
movaps  xmmword ptr ds:[rcx-10],xmm0
cmp     r9,qword ptr ds:[13F14C070]
jbe     oglmdi2_vs2019.13F12E058
jmp     oglmdi2_vs2019.13F12E108
nop     word ptr ds:[rax+rax]
movaps  xmmword ptr ds:[rcx-20],xmm0
movaps  xmmword ptr ds:[rcx-10],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx]
movups  xmm1,xmmword ptr ds:[rcx+rdx+10]
add     rcx,80
movaps  xmmword ptr ds:[rcx-80],xmm0
movaps  xmmword ptr ds:[rcx-70],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx-60]
movups  xmm1,xmmword ptr ds:[rcx+rdx-50]
dec     r9
movaps  xmmword ptr ds:[rcx-60],xmm0
movaps  xmmword ptr ds:[rcx-50],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx-40]
movups  xmm1,xmmword ptr ds:[rcx+rdx-30]
movaps  xmmword ptr ds:[rcx-40],xmm0
movaps  xmmword ptr ds:[rcx-30],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx-20]
movups  xmm1,xmmword ptr ds:[rcx+rdx-10]
jne     oglmdi2_vs2019.13F12E050
movaps  xmmword ptr ds:[rcx-20],xmm0
and     r8,7F
movaps  xmm0,xmm1
jmp     oglmdi2_vs2019.13F12E0BC
movups  xmm0,xmmword ptr ds:[rcx+rdx]
add     rcx,10
sub     r8,10
mov     r9,r8
shr     r9,4
je      oglmdi2_vs2019.13F12E0E1
nop     word ptr ds:[rax+rax]
movups  xmmword ptr ds:[rcx-10],xmm0
movups  xmm0,xmmword ptr ds:[rcx+rdx]
add     rcx,10
dec     r9
jne     oglmdi2_vs2019.13F12E0D0
and     r8,F
je      oglmdi2_vs2019.13F12E0F4
lea     rax,qword ptr ds:[rcx+r8]
movups  xmm1,xmmword ptr ds:[rax+rdx-10]
movups  xmmword ptr ds:[rax-10],xmm1
movups  xmmword ptr ds:[rcx-10],xmm0
mov     rax,r11
ret     
nop     dword ptr ds:[rax]
movntps xmmword ptr ds:[rcx-20],xmm0
movntps xmmword ptr ds:[rcx-10],xmm1
prefetchnta byte ptr ds:[rcx+rdx+200]
movups  xmm0,xmmword ptr ds:[rcx+rdx]
movups  xmm1,xmmword ptr ds:[rcx+rdx+10]
add     rcx,80
movntps xmmword ptr ds:[rcx-80],xmm0
movntps xmmword ptr ds:[rcx-70],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx-60]
movups  xmm1,xmmword ptr ds:[rcx+rdx-50]
dec     r9
movntps xmmword ptr ds:[rcx-60],xmm0
movntps xmmword ptr ds:[rcx-50],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx-40]
movups  xmm1,xmmword ptr ds:[rcx+rdx-30]
prefetchnta byte ptr ds:[rcx+rdx+240]
movntps xmmword ptr ds:[rcx-40],xmm0
movntps xmmword ptr ds:[rcx-30],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx-20]
movups  xmm1,xmmword ptr ds:[rcx+rdx-10]
jne     oglmdi2_vs2019.13F12E100
sfence  
jmp     oglmdi2_vs2019.13F12E0A3
nop     dword ptr ds:[rax+rax]
add     rcx,r8
movups  xmm0,xmmword ptr ds:[rcx+rdx-10]
sub     rcx,10
sub     r8,10
test    cl,F
je      oglmdi2_vs2019.13F12E19C
mov     rax,rcx
and     rcx,FFFFFFFFFFFFFFF0
movups  xmm1,xmm0
movups  xmm0,xmmword ptr ds:[rcx+rdx]
movups  xmmword ptr ds:[rax],xmm1
mov     r8,rcx
sub     r8,r11
mov     r9,r8
shr     r9,7
je      oglmdi2_vs2019.13F12E20D
movaps  xmmword ptr ds:[rcx],xmm0
jmp     oglmdi2_vs2019.13F12E1B7
nop     word ptr ds:[rax+rax]
movaps  xmmword ptr ds:[rcx+10],xmm0
movaps  xmmword ptr ds:[rcx],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx-10]
movups  xmm1,xmmword ptr ds:[rcx+rdx-20]
sub     rcx,80
movaps  xmmword ptr ds:[rcx+70],xmm0
movaps  xmmword ptr ds:[rcx+60],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx+50]
movups  xmm1,xmmword ptr ds:[rcx+rdx+40]
dec     r9
movaps  xmmword ptr ds:[rcx+50],xmm0
movaps  xmmword ptr ds:[rcx+40],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx+30]
movups  xmm1,xmmword ptr ds:[rcx+rdx+20]
movaps  xmmword ptr ds:[rcx+30],xmm0
movaps  xmmword ptr ds:[rcx+20],xmm1
movups  xmm0,xmmword ptr ds:[rcx+rdx+10]
movups  xmm1,xmmword ptr ds:[rcx+rdx]
jne     oglmdi2_vs2019.13F12E1B0
movaps  xmmword ptr ds:[rcx+10],xmm0
and     r8,7F
movaps  xmm0,xmm1
mov     r9,r8
shr     r9,4
je      oglmdi2_vs2019.13F12E230
nop     word ptr ds:[rax+rax]
movups  xmmword ptr ds:[rcx],xmm0
sub     rcx,10
movups  xmm0,xmmword ptr ds:[rcx+rdx]
dec     r9
jne     oglmdi2_vs2019.13F12E220
and     r8,F
je      oglmdi2_vs2019.13F12E23E
movups  xmm1,xmmword ptr ds:[r10]
movups  xmmword ptr ds:[r11],xmm1
movups  xmmword ptr ds:[rcx],xmm0
mov     rax,r11
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,20
mov     eax,dword ptr ds:[13F14D8E0]
xor     ebx,ebx
mov     edi,3
test    eax,eax
jne     oglmdi2_vs2019.13F12E279
mov     eax,200
jmp     oglmdi2_vs2019.13F12E27E
cmp     eax,edi
cmovl   eax,edi
movsxd  rcx,eax
mov     edx,8
mov     dword ptr ds:[13F14D8E0],eax
call    oglmdi2_vs2019.13F1330D0
xor     ecx,ecx
mov     qword ptr ds:[13F14D8E8],rax
call    oglmdi2_vs2019.13F133148
cmp     qword ptr ds:[13F14D8E8],rbx
jne     oglmdi2_vs2019.13F12E2D7
mov     edx,8
mov     dword ptr ds:[13F14D8E0],edi
mov     rcx,rdi
call    oglmdi2_vs2019.13F1330D0
xor     ecx,ecx
mov     qword ptr ds:[13F14D8E8],rax
call    oglmdi2_vs2019.13F133148
cmp     qword ptr ds:[13F14D8E8],rbx
jne     oglmdi2_vs2019.13F12E2D7
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F12E34C
mov     rbp,rbx
lea     rsi,qword ptr ds:[13F14C0A8]
lea     r14,qword ptr ds:[13F14C090]
lea     rcx,qword ptr ds:[r14+30]
xor     r8d,r8d
mov     edx,FA0
call    oglmdi2_vs2019.13F133518
mov     rax,qword ptr ds:[13F14D8E8]
lea     r8,qword ptr ds:[13F14DE80]
mov     rdx,rbp
sar     rdx,6
mov     qword ptr ds:[rbx+rax],r14
mov     rax,rbp
and     eax,3F
lea     rcx,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[r8+rdx*8]
mov     rcx,qword ptr ds:[rax+rcx*8+28]
add     rcx,2
cmp     rcx,2
ja      oglmdi2_vs2019.13F12E335
mov     dword ptr ds:[rsi],FFFFFFFE
inc     rbp
add     r14,58
add     rbx,8
add     rsi,58
sub     rdi,1
jne     oglmdi2_vs2019.13F12E2E8
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
mov     rdi,qword ptr ss:[rsp+48]
add     rsp,20
pop     r14
ret     
int3    
push    rbx
sub     rsp,20
call    oglmdi2_vs2019.13F133A78
call    oglmdi2_vs2019.13F133720
xor     ebx,ebx
mov     rcx,qword ptr ds:[13F14D8E8]
mov     rcx,qword ptr ds:[rbx+rcx]
call    oglmdi2_vs2019.13F133A80
mov     rax,qword ptr ds:[13F14D8E8]
mov     rcx,qword ptr ds:[rbx+rax]
add     rcx,30
call    qword ptr ds:[<&RtlDeleteCriticalSection>]
add     rbx,8
cmp     rbx,18
jne     oglmdi2_vs2019.13F12E37A
mov     rcx,qword ptr ds:[13F14D8E8]
call    oglmdi2_vs2019.13F133148
and     qword ptr ds:[13F14D8E8],0
add     rsp,20
pop     rbx
ret     
int3    
add     rcx,30
jmp     qword ptr ds:[<&RtlEnterCriticalSection>]
int3    
add     rcx,30
jmp     qword ptr ds:[<&RtlLeaveCriticalSection>]
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rbx,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F12E403
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F12E454
mov     eax,dword ptr ds:[rcx+14]
or      edi,FFFFFFFF
shr     eax,D
test    al,1
je      oglmdi2_vs2019.13F12E44A
call    oglmdi2_vs2019.13F1339B0
mov     rcx,rbx
mov     edi,eax
call    oglmdi2_vs2019.13F133A80
mov     rcx,rbx
call    oglmdi2_vs2019.13F133F10
mov     ecx,eax
call    oglmdi2_vs2019.13F133DAC
test    eax,eax
jns     oglmdi2_vs2019.13F12E437
or      edi,FFFFFFFF
jmp     oglmdi2_vs2019.13F12E44A
mov     rcx,qword ptr ds:[rbx+28]
test    rcx,rcx
je      oglmdi2_vs2019.13F12E44A
call    oglmdi2_vs2019.13F133148
and     qword ptr ds:[rbx+28],0
mov     rcx,rbx
call    oglmdi2_vs2019.13F133F90
mov     eax,edi
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+8],rcx
push    rdi
sub     rsp,20
mov     rbx,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F12E495
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
mov     eax,dword ptr ds:[rcx+14]
shr     eax,C
test    al,1
je      oglmdi2_vs2019.13F12E4A6
call    oglmdi2_vs2019.13F133F90
jmp     oglmdi2_vs2019.13F12E487
call    oglmdi2_vs2019.13F12E3C4
nop     
mov     rcx,rbx
call    oglmdi2_vs2019.13F12E3DC
mov     edi,eax
mov     rcx,rbx
call    oglmdi2_vs2019.13F12E3D0
mov     eax,edi
jmp     oglmdi2_vs2019.13F12E48A
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
xor     eax,eax
mov     r8,rdx
mov     qword ptr ds:[rcx],rax
mov     rbx,rcx
mov     dword ptr ds:[rcx+8],eax
mov     eax,dword ptr ds:[13F14DC84]
mov     dword ptr ds:[rcx+4],eax
mov     al,byte ptr ds:[rdx]
jmp     oglmdi2_vs2019.13F12E4F4
inc     r8
mov     al,byte ptr ds:[r8]
cmp     al,20
je      oglmdi2_vs2019.13F12E4EE
mov     esi,2
cmp     al,61
je      oglmdi2_vs2019.13F12E51E
cmp     al,72
je      oglmdi2_vs2019.13F12E515
cmp     al,77
jne     oglmdi2_vs2019.13F12E75F
mov     dword ptr ds:[rcx],301
jmp     oglmdi2_vs2019.13F12E524
mov     dword ptr ds:[rcx+4],1
jmp     oglmdi2_vs2019.13F12E527
mov     dword ptr ds:[rcx],109
mov     dword ptr ds:[rcx+4],esi
inc     r8
xor     r9b,r9b
xor     dil,dil
xor     r10b,r10b
xor     r11b,r11b
mov     dl,1
cmp     byte ptr ds:[r8],0
je      oglmdi2_vs2019.13F12E684
movsx   ecx,byte ptr ds:[r8]
cmp     ecx,53
jg      oglmdi2_vs2019.13F12E5F2
je      oglmdi2_vs2019.13F12E5DB
sub     ecx,20
je      oglmdi2_vs2019.13F12E672
sub     ecx,B
je      oglmdi2_vs2019.13F12E5AC
sub     ecx,1
je      oglmdi2_vs2019.13F12E5A4
sub     ecx,18
je      oglmdi2_vs2019.13F12E592
sub     ecx,A
je      oglmdi2_vs2019.13F12E589
cmp     ecx,4
jne     oglmdi2_vs2019.13F12E75F
test    r10b,r10b
jne     oglmdi2_vs2019.13F12E666
or      dword ptr ds:[rbx],10
jmp     oglmdi2_vs2019.13F12E5E7
bts     dword ptr ds:[rbx],7
jmp     oglmdi2_vs2019.13F12E670
mov     eax,dword ptr ds:[rbx]
test    al,40
jne     oglmdi2_vs2019.13F12E666
or      eax,40
jmp     oglmdi2_vs2019.13F12E66E
mov     r11b,1
jmp     oglmdi2_vs2019.13F12E666
test    dil,dil
jne     oglmdi2_vs2019.13F12E666
mov     eax,dword ptr ds:[rbx]
mov     dil,1
test    sil,al
jne     oglmdi2_vs2019.13F12E666
and     eax,FFFFFFFE
or      eax,esi
mov     dword ptr ds:[rbx],eax
mov     eax,dword ptr ds:[rbx+4]
and     eax,FFFFFFFC
or      eax,4
mov     dword ptr ds:[rbx+4],eax
jmp     oglmdi2_vs2019.13F12E670
test    r10b,r10b
jne     oglmdi2_vs2019.13F12E666
or      dword ptr ds:[rbx],20
mov     r10b,1
mov     dl,r10b
jmp     oglmdi2_vs2019.13F12E672
sub     ecx,54
je      oglmdi2_vs2019.13F12E65E
sub     ecx,E
je      oglmdi2_vs2019.13F12E64F
sub     ecx,1
je      oglmdi2_vs2019.13F12E63D
sub     ecx,B
je      oglmdi2_vs2019.13F12E631
sub     ecx,6
je      oglmdi2_vs2019.13F12E622
cmp     ecx,4
jne     oglmdi2_vs2019.13F12E75F
mov     eax,dword ptr ds:[rbx]
bt      eax,9
jae     oglmdi2_vs2019.13F12E666
bts     eax,A
jmp     oglmdi2_vs2019.13F12E66E
mov     eax,dword ptr ds:[rbx]
test    eax,C000
jne     oglmdi2_vs2019.13F12E666
bts     eax,E
jmp     oglmdi2_vs2019.13F12E66E
test    r9b,r9b
jne     oglmdi2_vs2019.13F12E666
btr     dword ptr ds:[rbx+4],B
jmp     oglmdi2_vs2019.13F12E647
test    r9b,r9b
jne     oglmdi2_vs2019.13F12E666
bts     dword ptr ds:[rbx+4],B
mov     r9b,1
mov     dl,r9b
jmp     oglmdi2_vs2019.13F12E672
mov     eax,dword ptr ds:[rbx]
test    eax,C000
jne     oglmdi2_vs2019.13F12E666
bts     eax,F
jmp     oglmdi2_vs2019.13F12E66E
mov     eax,dword ptr ds:[rbx]
bt      eax,C
jae     oglmdi2_vs2019.13F12E66A
xor     dl,dl
jmp     oglmdi2_vs2019.13F12E672
bts     eax,C
mov     dword ptr ds:[rbx],eax
mov     dl,1
xor     eax,eax
test    dl,dl
setne   al
add     r8,rax
test    dl,dl
jne     oglmdi2_vs2019.13F12E538
test    r11b,r11b
lea     rdi,qword ptr ds:[r8+1]
cmove   rdi,r8
jmp     oglmdi2_vs2019.13F12E694
inc     rdi
cmp     byte ptr ds:[rdi],20
je      oglmdi2_vs2019.13F12E691
test    r11b,r11b
jne     oglmdi2_vs2019.13F12E6B0
cmp     byte ptr ds:[rdi],r11b
jne     oglmdi2_vs2019.13F12E75F
mov     byte ptr ds:[rbx+8],1
jmp     oglmdi2_vs2019.13F12E76F
mov     r8d,3
lea     rdx,qword ptr ds:[13F141FE0]
mov     rcx,rdi
call    oglmdi2_vs2019.13F132CD0
test    eax,eax
jne     oglmdi2_vs2019.13F12E75F
add     rdi,3
jmp     oglmdi2_vs2019.13F12E6D6
inc     rdi
mov     al,byte ptr ds:[rdi]
cmp     al,20
je      oglmdi2_vs2019.13F12E6D3
cmp     al,3D
jne     oglmdi2_vs2019.13F12E75F
inc     rdi
cmp     byte ptr ds:[rdi],20
je      oglmdi2_vs2019.13F12E6E0
mov     esi,5
lea     rdx,qword ptr ds:[13F141FE4]
mov     r8d,esi
mov     rcx,rdi
call    oglmdi2_vs2019.13F134130
test    eax,eax
jne     oglmdi2_vs2019.13F12E709
bts     dword ptr ds:[rbx],12
jmp     oglmdi2_vs2019.13F12E749
mov     esi,8
lea     rdx,qword ptr ds:[13F141FF0]
mov     r8d,esi
mov     rcx,rdi
call    oglmdi2_vs2019.13F134130
test    eax,eax
jne     oglmdi2_vs2019.13F12E72A
bts     dword ptr ds:[rbx],11
jmp     oglmdi2_vs2019.13F12E749
mov     esi,7
lea     rdx,qword ptr ds:[13F141FF8]
mov     r8d,esi
mov     rcx,rdi
call    oglmdi2_vs2019.13F134130
test    eax,eax
jne     oglmdi2_vs2019.13F12E75F
bts     dword ptr ds:[rbx],10
lea     rcx,qword ptr ds:[rdi+rsi]
jmp     oglmdi2_vs2019.13F12E752
inc     rcx
mov     al,byte ptr ds:[rcx]
cmp     al,20
je      oglmdi2_vs2019.13F12E74F
test    al,al
jmp     oglmdi2_vs2019.13F12E6A1
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     rsi,qword ptr ss:[rsp+38]
mov     rax,rbx
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
mov     edx,48
lea     ecx,dword ptr ds:[rdx-8]
call    oglmdi2_vs2019.13F1330D0
xor     esi,esi
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F12E80A
lea     rbp,qword ptr ds:[rax+1200]
cmp     rax,rbp
je      oglmdi2_vs2019.13F12E807
lea     rdi,qword ptr ds:[rax+30]
lea     rcx,qword ptr ds:[rdi-30]
xor     r8d,r8d
mov     edx,FA0
call    oglmdi2_vs2019.13F133518
or      qword ptr ds:[rdi-8],FFFFFFFFFFFFFFFF
lea     rcx,qword ptr ds:[rdi+E]
mov     qword ptr ds:[rdi],rsi
mov     eax,esi
mov     dword ptr ds:[rdi+8],A0A0000
mov     byte ptr ds:[rdi+C],A
and     byte ptr ds:[rdi+D],F8
mov     byte ptr ds:[rcx],sil
inc     eax
inc     rcx
cmp     eax,5
jb      oglmdi2_vs2019.13F12E7ED
add     rdi,48
lea     rax,qword ptr ds:[rdi-30]
cmp     rax,rbp
jne     oglmdi2_vs2019.13F12E7BF
mov     rsi,rbx
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     rbx,qword ptr ss:[rsp+30]
mov     rax,rsi
mov     rsi,qword ptr ss:[rsp+40]
mov     rbp,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F12E87B
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
lea     rsi,qword ptr ds:[rcx+1200]
mov     rbx,rcx
mov     rdi,rcx
cmp     rcx,rsi
je      oglmdi2_vs2019.13F12E864
mov     rcx,rdi
call    qword ptr ds:[<&RtlDeleteCriticalSection>]
add     rdi,48
cmp     rdi,rsi
jne     oglmdi2_vs2019.13F12E852
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+18],rdi
push    r15
sub     rsp,30
mov     esi,ecx
cmp     ecx,2000
jb      oglmdi2_vs2019.13F12E8C4
call    oglmdi2_vs2019.13F1330B0
mov     ebx,9
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+48]
mov     rdi,qword ptr ss:[rsp+50]
add     rsp,30
pop     r15
ret     
xor     edi,edi
lea     ecx,dword ptr ds:[rdi+7]
call    oglmdi2_vs2019.13F131378
nop     
mov     ebx,edi
mov     eax,dword ptr ds:[13F14E280]
mov     qword ptr ss:[rsp+20],rbx
cmp     esi,eax
jl      oglmdi2_vs2019.13F12E916
lea     r15,qword ptr ds:[13F14DE80]
cmp     qword ptr ds:[r15+rbx*8],rdi
je      oglmdi2_vs2019.13F12E8EF
jmp     oglmdi2_vs2019.13F12E911
call    oglmdi2_vs2019.13F12E784
mov     qword ptr ds:[r15+rbx*8],rax
test    rax,rax
jne     oglmdi2_vs2019.13F12E902
lea     edi,dword ptr ds:[rax+C]
jmp     oglmdi2_vs2019.13F12E916
mov     eax,dword ptr ds:[13F14E280]
add     eax,40
mov     dword ptr ds:[13F14E280],eax
inc     rbx
jmp     oglmdi2_vs2019.13F12E8D7
mov     ecx,7
call    oglmdi2_vs2019.13F1313CC
mov     eax,edi
jmp     oglmdi2_vs2019.13F12E8AE
movsxd  rdx,ecx
lea     r8,qword ptr ds:[13F14DE80]
mov     rax,rdx
and     edx,3F
sar     rax,6
lea     rcx,qword ptr ds:[rdx+rdx*8]
mov     rax,qword ptr ds:[r8+rax*8]
lea     rcx,qword ptr ds:[rax+rcx*8]
jmp     qword ptr ds:[<&RtlEnterCriticalSection>]
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,20
movsxd  rbx,ecx
mov     rdi,rdx
test    ecx,ecx
js      oglmdi2_vs2019.13F12E9DA
cmp     ebx,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F12E9DA
mov     rax,rbx
lea     r14,qword ptr ds:[13F14DE80]
and     eax,3F
mov     rsi,rbx
sar     rsi,6
lea     rbp,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[r14+rsi*8]
cmp     qword ptr ds:[rax+rbp*8+28],FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F12E9DA
call    oglmdi2_vs2019.13F13158C
cmp     eax,1
jne     oglmdi2_vs2019.13F12E9CD
test    ebx,ebx
je      oglmdi2_vs2019.13F12E9BF
sub     ebx,eax
je      oglmdi2_vs2019.13F12E9B8
cmp     ebx,eax
jne     oglmdi2_vs2019.13F12E9CD
mov     ecx,FFFFFFF4
jmp     oglmdi2_vs2019.13F12E9C4
mov     ecx,FFFFFFF5
jmp     oglmdi2_vs2019.13F12E9C4
mov     ecx,FFFFFFF6
mov     rdx,rdi
call    qword ptr ds:[<&SetStdHandle>]
mov     rax,qword ptr ds:[r14+rsi*8]
mov     qword ptr ds:[rax+rbp*8+28],rdi
xor     eax,eax
jmp     oglmdi2_vs2019.13F12E9F0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
mov     rdi,qword ptr ss:[rsp+48]
add     rsp,20
pop     r14
ret     
int3    
movsxd  rdx,ecx
lea     r8,qword ptr ds:[13F14DE80]
mov     rax,rdx
and     edx,3F
sar     rax,6
lea     rcx,qword ptr ds:[rdx+rdx*8]
mov     rax,qword ptr ds:[r8+rax*8]
lea     rcx,qword ptr ds:[rax+rcx*8]
jmp     qword ptr ds:[<&RtlLeaveCriticalSection>]
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+18],rdi
push    r12
push    r14
push    r15
sub     rsp,30
mov     ecx,7
call    oglmdi2_vs2019.13F131378
or      r14,FFFFFFFFFFFFFFFF
xor     ebx,ebx
lea     r12,qword ptr ds:[13F14DE80]
mov     dword ptr ss:[rsp+20],ebx
cmp     ebx,80
jge     oglmdi2_vs2019.13F12EB4B
movsxd  rdi,ebx
mov     rsi,qword ptr ds:[r12+rdi*8]
test    rsi,rsi
jne     oglmdi2_vs2019.13F12EABA
call    oglmdi2_vs2019.13F12E784
mov     qword ptr ds:[r12+rdi*8],rax
test    rax,rax
je      oglmdi2_vs2019.13F12EB4B
add     dword ptr ds:[13F14E280],40
shl     ebx,6
mov     ecx,ebx
call    oglmdi2_vs2019.13F12E924
movsxd  rax,ebx
sar     rax,6
mov     rax,qword ptr ds:[r12+rax*8]
mov     byte ptr ds:[rax+38],1
mov     r14d,ebx
jmp     oglmdi2_vs2019.13F12EB4B
lea     r15,qword ptr ds:[rsi+1200]
mov     rdi,rsi
mov     qword ptr ss:[rsp+28],rsi
cmp     rdi,r15
je      oglmdi2_vs2019.13F12EB44
test    byte ptr ds:[rdi+38],1
je      oglmdi2_vs2019.13F12EAD6
jmp     oglmdi2_vs2019.13F12EAEE
mov     rcx,rdi
call    qword ptr ds:[<&RtlEnterCriticalSection>]
test    byte ptr ds:[rdi+38],1
je      oglmdi2_vs2019.13F12EAF9
mov     rcx,rdi
call    qword ptr ds:[<&RtlLeaveCriticalSection>]
add     rdi,48
mov     qword ptr ss:[rsp+28],rdi
jmp     oglmdi2_vs2019.13F12EAC9
sub     rdi,rsi
movabs  rax,E38E38E38E38E39
imul    rdi
sar     rdx,2
mov     rax,rdx
shr     rax,3F
add     rdx,rax
shl     ebx,6
add     edx,ebx
movsxd  rax,edx
mov     r8,rax
sar     r8,6
and     eax,3F
lea     rcx,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[r12+r8*8]
mov     byte ptr ds:[rax+rcx*8+38],1
mov     rax,qword ptr ds:[r12+r8*8]
mov     qword ptr ds:[rax+rcx*8+28],r14
mov     r14d,edx
jmp     oglmdi2_vs2019.13F12EB4B
inc     ebx
jmp     oglmdi2_vs2019.13F12EA64
mov     ecx,7
call    oglmdi2_vs2019.13F1313CC
mov     eax,r14d
mov     rbx,qword ptr ss:[rsp+50]
mov     rsi,qword ptr ss:[rsp+58]
mov     rdi,qword ptr ss:[rsp+60]
add     rsp,30
pop     r15
pop     r14
pop     r12
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+18],rdi
push    r14
sub     rsp,20
movsxd  rbx,ecx
test    ecx,ecx
js      oglmdi2_vs2019.13F12EC02
cmp     ebx,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F12EC02
mov     rax,rbx
lea     r14,qword ptr ds:[13F14DE80]
and     eax,3F
mov     rsi,rbx
sar     rsi,6
lea     rdi,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[r14+rsi*8]
test    byte ptr ds:[rax+rdi*8+38],1
je      oglmdi2_vs2019.13F12EC02
cmp     qword ptr ds:[rax+rdi*8+28],FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F12EC02
call    oglmdi2_vs2019.13F13158C
cmp     eax,1
jne     oglmdi2_vs2019.13F12EBF4
test    ebx,ebx
je      oglmdi2_vs2019.13F12EBE7
sub     ebx,eax
je      oglmdi2_vs2019.13F12EBE0
cmp     ebx,eax
jne     oglmdi2_vs2019.13F12EBF4
mov     ecx,FFFFFFF4
jmp     oglmdi2_vs2019.13F12EBEC
mov     ecx,FFFFFFF5
jmp     oglmdi2_vs2019.13F12EBEC
mov     ecx,FFFFFFF6
xor     edx,edx
call    qword ptr ds:[<&SetStdHandle>]
mov     rax,qword ptr ds:[r14+rsi*8]
or      qword ptr ds:[rax+rdi*8+28],FFFFFFFFFFFFFFFF
xor     eax,eax
jmp     oglmdi2_vs2019.13F12EC18
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
mov     rdi,qword ptr ss:[rsp+40]
add     rsp,20
pop     r14
ret     
int3    
int3    
sub     rsp,28
cmp     ecx,FFFFFFFE
jne     oglmdi2_vs2019.13F12EC4E
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
jmp     oglmdi2_vs2019.13F12EC9C
test    ecx,ecx
js      oglmdi2_vs2019.13F12EC84
cmp     ecx,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F12EC84
movsxd  rcx,ecx
lea     r8,qword ptr ds:[13F14DE80]
mov     rax,rcx
and     ecx,3F
sar     rax,6
lea     rdx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[r8+rax*8]
test    byte ptr ds:[rax+rdx*8+38],1
je      oglmdi2_vs2019.13F12EC84
mov     rax,qword ptr ds:[rax+rdx*8+28]
jmp     oglmdi2_vs2019.13F12ECA0
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F132F90
or      rax,FFFFFFFFFFFFFFFF
add     rsp,28
ret     
int3    
int3    
int3    
mov     dword ptr ss:[rsp+10],0
mov     eax,dword ptr ss:[rsp+10]
jmp     oglmdi2_vs2019.13F133148
int3    
int3    
int3    
jmp     oglmdi2_vs2019.13F134230
int3    
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,30
mov     esi,r8d
mov     rbx,rdx
mov     rdi,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F12ED03
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+48]
mov     rsi,qword ptr ss:[rsp+50]
add     rsp,30
pop     rdi
ret     
test    rbx,rbx
je      oglmdi2_vs2019.13F12ECE1
cmp     byte ptr ds:[rdx],0
je      oglmdi2_vs2019.13F12ECE1
cmp     byte ptr ds:[rcx],0
jne     oglmdi2_vs2019.13F12ED1F
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
jmp     oglmdi2_vs2019.13F12ECF1
lea     rcx,qword ptr ss:[rsp+40]
call    oglmdi2_vs2019.13F133F38
mov     r9,qword ptr ss:[rsp+40]
test    r9,r9
jne     oglmdi2_vs2019.13F12ED40
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],18
jmp     oglmdi2_vs2019.13F12ECF1
and     qword ptr ss:[rsp+20],0
mov     r8d,esi
mov     rdx,rbx
mov     rcx,rdi
call    oglmdi2_vs2019.13F134290
mov     rbx,rax
mov     qword ptr ss:[rsp+20],rax
test    rbx,rbx
jne     oglmdi2_vs2019.13F12ED6B
mov     rcx,qword ptr ss:[rsp+40]
call    oglmdi2_vs2019.13F133F90
mov     rcx,qword ptr ss:[rsp+40]
call    oglmdi2_vs2019.13F12E3D0
mov     rax,rbx
jmp     oglmdi2_vs2019.13F12ECF3
int3    
int3    
int3    
mov     r8d,40
jmp     oglmdi2_vs2019.13F12ECC4
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,30
mov     r15,r8
mov     rsi,rdx
mov     r12,rcx
test    r8,r8
je      oglmdi2_vs2019.13F12EDCD
test    r9,r9
je      oglmdi2_vs2019.13F12EDCD
test    rcx,rcx
jne     oglmdi2_vs2019.13F12EDE4
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+70]
add     rsp,30
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
mov     rbx,qword ptr ss:[rsp+90]
test    rbx,rbx
je      oglmdi2_vs2019.13F12EDFF
xor     edx,edx
or      rax,FFFFFFFFFFFFFFFF
div     r15
cmp     r9,rax
jbe     oglmdi2_vs2019.13F12EE2A
cmp     rsi,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F12EE17
mov     r8,rsi
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
mov     r9,qword ptr ss:[rsp+88]
test    rbx,rbx
je      oglmdi2_vs2019.13F12EDBD
xor     edx,edx
or      rax,FFFFFFFFFFFFFFFF
div     r15
cmp     r9,rax
ja      oglmdi2_vs2019.13F12EDBD
mov     eax,dword ptr ds:[rbx+14]
test    eax,4C0
je      oglmdi2_vs2019.13F12EE39
mov     ecx,dword ptr ds:[rbx+20]
jmp     oglmdi2_vs2019.13F12EE3E
mov     ecx,1000
mov     rdi,r15
mov     dword ptr ss:[rsp+90],ecx
imul    rdi,r9
mov     r10,r12
mov     qword ptr ss:[rsp+20],r12
mov     rbp,rdi
mov     r13,rsi
test    rdi,rdi
je      oglmdi2_vs2019.13F12EFD5
mov     eax,dword ptr ds:[rbx+14]
mov     edx,7FFFFFFF
test    eax,4C0
je      oglmdi2_vs2019.13F12EF1A
movsxd  r14,dword ptr ds:[rbx+10]
test    r14d,r14d
je      oglmdi2_vs2019.13F12EF1A
js      oglmdi2_vs2019.13F12F000
cmp     rbp,r14
cmovb   r14d,ebp
cmp     r14,r13
ja      oglmdi2_vs2019.13F12EFDD
mov     rax,qword ptr ds:[rbx]
mov     qword ptr ss:[rsp+28],rax
test    r14,r14
je      oglmdi2_vs2019.13F12EF01
test    r10,r10
jne     oglmdi2_vs2019.13F12EEB8
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
jmp     oglmdi2_vs2019.13F12EEF7
test    rax,rax
je      oglmdi2_vs2019.13F12EED2
cmp     r13,r14
jb      oglmdi2_vs2019.13F12EED2
mov     r8,r14
mov     rdx,rax
mov     rcx,r10
call    oglmdi2_vs2019.13F12DE70
jmp     oglmdi2_vs2019.13F12EEFC
mov     r8,r13
xor     edx,edx
mov     rcx,r10
call    oglmdi2_vs2019.13F12B280
cmp     qword ptr ss:[rsp+28],0
je      oglmdi2_vs2019.13F12EEAB
cmp     r13,r14
jae     oglmdi2_vs2019.13F12EEFC
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
call    oglmdi2_vs2019.13F132F90
mov     r10,qword ptr ss:[rsp+20]
sub     dword ptr ds:[rbx+10],r14d
sub     rbp,r14
add     qword ptr ds:[rbx],r14
mov     ecx,dword ptr ss:[rsp+90]
sub     r13,r14
jmp     oglmdi2_vs2019.13F12EFBC
mov     eax,ecx
cmp     rbp,rax
jb      oglmdi2_vs2019.13F12EF8C
cmp     rbp,rdx
mov     r14d,ebp
cmova   r14d,edx
test    ecx,ecx
je      oglmdi2_vs2019.13F12EF39
xor     edx,edx
mov     eax,r14d
div     ecx
sub     r14d,edx
mov     eax,r14d
cmp     rax,r13
ja      oglmdi2_vs2019.13F12EFDD
mov     rax,qword ptr ds:[rbx+8]
mov     rcx,rbx
and     dword ptr ds:[rbx+10],0
mov     qword ptr ds:[rbx],rax
call    oglmdi2_vs2019.13F133F10
mov     rdx,qword ptr ss:[rsp+20]
mov     ecx,eax
mov     r8d,r14d
call    oglmdi2_vs2019.13F134A20
test    eax,eax
je      oglmdi2_vs2019.13F12F007
js      oglmdi2_vs2019.13F12F000
mov     ecx,dword ptr ss:[rsp+90]
mov     r10,qword ptr ss:[rsp+20]
movsxd  r14,eax
sub     rbp,r14
sub     r13,r14
jmp     oglmdi2_vs2019.13F12EFBC
mov     rcx,rbx
call    oglmdi2_vs2019.13F134E78
cmp     eax,FFFFFFFF
je      oglmdi2_vs2019.13F12F00C
test    r13,r13
je      oglmdi2_vs2019.13F12EFDD
mov     r10,qword ptr ss:[rsp+20]
dec     rbp
dec     r13
mov     r14d,1
mov     byte ptr ds:[r10],al
mov     ecx,dword ptr ds:[rbx+20]
mov     dword ptr ss:[rsp+90],ecx
add     r10,r14
mov     qword ptr ss:[rsp+20],r10
test    rbp,rbp
jne     oglmdi2_vs2019.13F12EE63
mov     r9,qword ptr ss:[rsp+88]
mov     rax,r9
jmp     oglmdi2_vs2019.13F12EDCF
cmp     rsi,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F12EFF0
mov     r8,rsi
xor     edx,edx
mov     rcx,r12
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
jmp     oglmdi2_vs2019.13F12EDC8
lock or dword ptr ds:[rbx+14],10
jmp     oglmdi2_vs2019.13F12F00C
lock or dword ptr ds:[rbx+14],8
sub     rdi,rbp
xor     edx,edx
mov     rax,rdi
div     r15
jmp     oglmdi2_vs2019.13F12EDCF
sub     rsp,38
mov     qword ptr ss:[rsp+20],r9
mov     r9,r8
mov     r8,rdx
or      rdx,FFFFFFFFFFFFFFFF
call    oglmdi2_vs2019.13F12F03C
add     rsp,38
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rsi
mov     qword ptr ds:[rax+18],rdi
mov     qword ptr ds:[rax+20],r14
push    r15
sub     rsp,30
mov     rsi,r9
mov     r15,r8
mov     rdi,rdx
mov     r14,rcx
test    r8,r8
je      oglmdi2_vs2019.13F12F095
test    r9,r9
je      oglmdi2_vs2019.13F12F095
mov     rbx,qword ptr ss:[rsp+60]
test    rbx,rbx
jne     oglmdi2_vs2019.13F12F0B2
cmp     rdx,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F12F085
mov     r8,rdx
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+48]
mov     rdi,qword ptr ss:[rsp+50]
mov     r14,qword ptr ss:[rsp+58]
add     rsp,30
pop     r15
ret     
mov     rcx,rbx
call    oglmdi2_vs2019.13F12E3C4
nop     
mov     qword ptr ss:[rsp+20],rbx
mov     r9,rsi
mov     r8,r15
mov     rdx,rdi
mov     rcx,r14
call    oglmdi2_vs2019.13F12ED8C
mov     rdi,rax
mov     rcx,rbx
call    oglmdi2_vs2019.13F12E3D0
mov     rax,rdi
jmp     oglmdi2_vs2019.13F12F097
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
int3    
int3    
int3    
int3    
int3    
int3    
int3    
nop     word ptr ds:[rax+rax]
mov     rax,rcx
neg     rcx
test    rax,7
je      oglmdi2_vs2019.13F12F11D
nop     
mov     dl,byte ptr ds:[rax]
inc     rax
test    dl,dl
je      oglmdi2_vs2019.13F12F178
test    al,7
jne     oglmdi2_vs2019.13F12F110
movabs  r8,7EFEFEFEFEFEFEFF
movabs  r11,8101010101010100
mov     rdx,qword ptr ds:[rax]
mov     r9,r8
add     rax,8
add     r9,rdx
not     rdx
xor     rdx,r9
and     rdx,r11
je      oglmdi2_vs2019.13F12F131
mov     rdx,qword ptr ds:[rax-8]
test    dl,dl
je      oglmdi2_vs2019.13F12F1A2
test    dh,dh
je      oglmdi2_vs2019.13F12F19C
shr     rdx,10
test    dl,dl
je      oglmdi2_vs2019.13F12F196
test    dh,dh
je      oglmdi2_vs2019.13F12F190
shr     rdx,10
test    dl,dl
je      oglmdi2_vs2019.13F12F18A
test    dh,dh
je      oglmdi2_vs2019.13F12F184
shr     edx,10
test    dl,dl
je      oglmdi2_vs2019.13F12F17E
test    dh,dh
jne     oglmdi2_vs2019.13F12F131
lea     rax,qword ptr ds:[rax+rcx-1]
ret     
lea     rax,qword ptr ds:[rax+rcx-2]
ret     
lea     rax,qword ptr ds:[rax+rcx-3]
ret     
lea     rax,qword ptr ds:[rax+rcx-4]
ret     
lea     rax,qword ptr ds:[rax+rcx-5]
ret     
lea     rax,qword ptr ds:[rax+rcx-6]
ret     
lea     rax,qword ptr ds:[rax+rcx-7]
ret     
lea     rax,qword ptr ds:[rax+rcx-8]
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3    
int3    
sub     rsp,68
cmp     dword ptr ds:[13F14E288],0
jne     oglmdi2_vs2019.13F12F490
xorpd   xmm2,xmm2
movd    edx,xmm0
mov     eax,7F800000
mov     r10d,eax
and     r10d,edx
cmp     r10d,eax
je      oglmdi2_vs2019.13F12F479
cvtss2sd xmm0,xmm0
movq    rdx,xmm0
mov     r10,rdx
btr     r10,3F
mov     r8d,1
movapd  xmm1,xmm0
movabs  rax,3FE921FB54442D18
cmp     r10,rax
jg      oglmdi2_vs2019.13F12F230
movapd  xmm2,xmm0
mulsd   xmm2,xmm2
xor     eax,eax
mov     rdx,r10
movsd   xmm5,qword ptr ds:[13F142010]
jmp     oglmdi2_vs2019.13F12F3A0
nop     word ptr ds:[rax+rax]
movq    xmm0,r10
cmp     r10,qword ptr ds:[13F142090]
jae     oglmdi2_vs2019.13F12F370
movapd  xmm2,xmm0
movsd   xmm3,qword ptr ds:[13F142020]
movapd  xmm4,xmm0
movsd   xmm5,qword ptr ds:[13F142010]
mulsd   xmm2,xmm3
mov     r9,r10
shr     r9,34
addsd   xmm2,xmm5
movsd   xmm3,qword ptr ds:[13F142050]
cvttpd2dq xmm0,xmm2
movsd   xmm1,qword ptr ds:[13F142060]
cvtdq2pd xmm2,xmm0
mulsd   xmm3,xmm2
subsd   xmm4,xmm3
mulsd   xmm1,xmm2
movd    eax,xmm0
movapd  xmm0,xmm4
subsd   xmm0,xmm1
movsd   xmm3,qword ptr ds:[13F142070]
movq    rcx,xmm0
movsd   xmm5,qword ptr ds:[13F142080]
shl     rcx,1
shr     rcx,35
sub     r9,rcx
cmp     r9,F
jle     oglmdi2_vs2019.13F12F2E6
movapd  xmm1,xmm4
mulsd   xmm3,xmm2
mulsd   xmm5,xmm2
subsd   xmm4,xmm3
subsd   xmm1,xmm4
subsd   xmm1,xmm3
subsd   xmm5,xmm1
movapd  xmm0,xmm4
movapd  xmm1,xmm5
subsd   xmm0,xmm5
cmp     rcx,3F2
jge     oglmdi2_vs2019.13F12F3A0
cmp     rcx,3DE
jle     oglmdi2_vs2019.13F12F350
movapd  xmm2,xmm0
mulsd   xmm2,xmm0
and     r8d,eax
je      oglmdi2_vs2019.13F12F330
movsd   xmm3,qword ptr ds:[13F142030]
mulsd   xmm3,xmm0
mulsd   xmm3,xmm2
subsd   xmm0,xmm3
jmp     oglmdi2_vs2019.13F12F454
nop     word ptr ds:[rax+rax]
movsd   xmm0,qword ptr ds:[13F142000]
mulsd   xmm2,qword ptr ds:[13F142010]
subsd   xmm0,xmm2
jmp     oglmdi2_vs2019.13F12F454
nop     dword ptr ds:[rax]
and     r8d,eax
jne     oglmdi2_vs2019.13F12F454
movsd   xmm0,qword ptr ds:[13F142000]
jmp     oglmdi2_vs2019.13F12F454
nop     word ptr ds:[rax+rax]
mov     qword ptr ss:[rsp+20],rdx
mov     qword ptr ss:[rsp+30],r10
call    oglmdi2_vs2019.13F134FF0
mov     rdx,qword ptr ss:[rsp+20]
mov     r10,qword ptr ss:[rsp+30]
mov     r8d,1
movapd  xmm1,xmm0
movsd   xmm5,qword ptr ds:[13F142010]
jmp     oglmdi2_vs2019.13F12F3A0
nop     dword ptr ds:[rax]
movapd  xmm2,xmm0
mulsd   xmm2,xmm0
and     r8d,eax
je      oglmdi2_vs2019.13F12F400
movsd   xmm1,qword ptr ds:[13F142DA8]
mulsd   xmm1,xmm2
movsd   xmm4,xmm2
mulsd   xmm4,xmm2
movsd   xmm5,qword ptr ds:[13F142D98]
mulsd   xmm5,xmm2
movsd   xmm3,xmm0
mulsd   xmm3,xmm2
addsd   xmm1,qword ptr ds:[13F142DA0]
mulsd   xmm1,xmm4
addsd   xmm5,qword ptr ds:[13F142D90]
addsd   xmm1,xmm5
mulsd   xmm1,xmm3
addsd   xmm0,xmm1
jmp     oglmdi2_vs2019.13F12F454
nop     word ptr ds:[rax+rax]
movsd   xmm1,qword ptr ds:[13F142D80]
movsd   xmm4,xmm2
mulsd   xmm1,xmm2
movsd   xmm3,qword ptr ds:[13F142D70]
mulsd   xmm4,xmm2
movsd   xmm0,qword ptr ds:[13F142D60]
mulsd   xmm3,xmm2
mulsd   xmm0,xmm2
addsd   xmm1,qword ptr ds:[13F142D78]
mulsd   xmm1,xmm4
addsd   xmm3,qword ptr ds:[13F142D68]
addsd   xmm1,xmm3
mulsd   xmm1,xmm4
addsd   xmm0,qword ptr ds:[13F142000]
addsd   xmm0,xmm1
add     eax,1
and     eax,2
je      oglmdi2_vs2019.13F12F470
xorpd   xmm2,xmm2
subsd   xmm2,xmm0
movapd  xmm0,xmm2
nop     dword ptr ds:[rax+rax]
cvtsd2ss xmm0,xmm0
add     rsp,68
ret     
call    oglmdi2_vs2019.13F1353A8
add     rsp,68
ret     
nop     word ptr ds:[rax+rax]
vmovd   eax,xmm0
mov     r8d,dword ptr ds:[13F142110]
and     eax,r8d
cmp     eax,r8d
je      oglmdi2_vs2019.13F12F6A5
vcvtss2sd xmm5,xmm0,xmm0
vmovq   r9,xmm5
btr     r9,3F
cmp     r9,qword ptr ds:[13F142040]
jg      oglmdi2_vs2019.13F12F570
cmp     r9,qword ptr ds:[13F1420E0]
jge     oglmdi2_vs2019.13F12F510
cmp     r9,qword ptr ds:[13F1420F0]
jge     oglmdi2_vs2019.13F12F4F0
vaddss  xmm1,xmm0,dword ptr ds:[13F142100]
vmovd   xmm0,dword ptr ds:[13F142108]
add     rsp,68
ret     
nop     dword ptr ds:[rax]
vmulsd  xmm0,xmm5,qword ptr ds:[13F142010]
vfnmadd213sd xmm0,xmm5,qword ptr ds:[13F142000]
vcvtsd2ss xmm0,xmm0,xmm0
add     rsp,68
ret     
nop     word ptr ds:[rax+rax]
movsd   xmm0,xmm5
vmovapd xmm2,xmmword ptr ds:[13F142000]
vmulsd  xmm3,xmm0,xmm0
vmulsd  xmm1,xmm3,qword ptr ds:[13F142010]
vsubsd  xmm2,xmm2,xmm1
vmovsd  xmm1,qword ptr ds:[13F142D78]
vfmadd231sd xmm1,xmm3,qword ptr ds:[13F142D80]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D70]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D68]
vmulsd  xmm3,xmm3,xmm3
vmovdqa xmm0,xmm2
vfmadd231sd xmm0,xmm1,xmm3
vcvtsd2ss xmm0,xmm0,xmm0
add     rsp,68
ret     
nop     word ptr ds:[rax+rax]
vmovq   xmm0,r9
cmp     r9,qword ptr ds:[13F1420A0]
jge     oglmdi2_vs2019.13F12F5E0
vandpd  xmm1,xmm0,xmmword ptr ds:[13F1420B0]
vmovapd xmm2,xmmword ptr ds:[13F142020]
vfmadd213sd xmm2,xmm1,qword ptr ds:[13F142010]
vcvttpd2dq xmm2,xmm2
vpmovsxdq xmm1,xmm2
vandpd  xmm4,xmm1,xmmword ptr ds:[13F1420C0]
vshufps xmm1,xmm1,xmm1,8
vcvtdq2pd xmm1,xmm1
vmovdqa xmm2,xmm0
vfnmadd231sd xmm2,xmm1,qword ptr ds:[13F142050]
vmulsd  xmm3,xmm1,qword ptr ds:[13F142060]
vsubsd  xmm0,xmm2,xmm3
vsubsd  xmm2,xmm2,xmm0
vsubsd  xmm1,xmm2,xmm3
vmovq   rax,xmm4
jmp     oglmdi2_vs2019.13F12F605
nop     dword ptr ds:[rax]
vmovq   xmm0,r9
cmp     r9,qword ptr ds:[13F1420A0]
jge     oglmdi2_vs2019.13F12F600
call    oglmdi2_vs2019.13F135330
jmp     oglmdi2_vs2019.13F12F605
nop     word ptr ds:[rax+rax]
call    oglmdi2_vs2019.13F135140
bt      rax,0
jae     oglmdi2_vs2019.13F12F640
vmovsd  xmm1,qword ptr ds:[13F142DA0]
vmulsd  xmm3,xmm0,xmm0
vfmadd231sd xmm1,xmm3,qword ptr ds:[13F142DA8]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D98]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D90]
vmulsd  xmm3,xmm0,xmm3
vfmadd231sd xmm0,xmm1,xmm3
jmp     oglmdi2_vs2019.13F12F688
nop     
vmovapd xmm2,xmmword ptr ds:[13F142000]
vmulsd  xmm3,xmm0,xmm0
vmulsd  xmm1,xmm3,qword ptr ds:[13F142010]
vsubsd  xmm2,xmm2,xmm1
vmovsd  xmm1,qword ptr ds:[13F142D78]
vfmadd231sd xmm1,xmm3,qword ptr ds:[13F142D80]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D70]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D68]
vmulsd  xmm3,xmm3,xmm3
vmovdqa xmm0,xmm2
vfmadd231sd xmm0,xmm1,xmm3
add     rax,1
shr     rax,1
shl     rax,3F
vmovq   xmm3,rax
vxorpd  xmm0,xmm0,xmm3
vcvtsd2ss xmm0,xmm0,xmm0
add     rsp,68
ret     
call    oglmdi2_vs2019.13F1353A8
add     rsp,68
ret     
int3    
sub     rsp,68
cmp     dword ptr ds:[13F14E288],0
jne     oglmdi2_vs2019.13F12FA50
xorpd   xmm2,xmm2
movd    edx,xmm0
mov     eax,7F800000
mov     r10d,eax
and     r10d,edx
cmp     r10d,eax
je      oglmdi2_vs2019.13F12FA40
movapd  xmm3,xmm0
cvtss2sd xmm0,xmm0
movq    rdx,xmm0
mov     r10,rdx
btr     r10,3F
mov     r8d,1
movabs  rax,3FE921FB54442D18
cmp     r10,rax
jg      oglmdi2_vs2019.13F12F7E0
movabs  rax,3F80000000000000
cmp     r10,rax
jge     oglmdi2_vs2019.13F12F780
movabs  rax,3F20000000000000
cmp     r10,rax
jge     oglmdi2_vs2019.13F12F750
movapd  xmm0,xmm3
movss   xmm1,xmm0
mulss   xmm1,dword ptr ds:[13F142240]
addss   xmm1,dword ptr ds:[13F142248]
add     rsp,68
ret     
nop     word ptr ds:[rax+rax]
movsd   xmm2,xmm0
movsd   xmm4,qword ptr ds:[13F142190]
mulsd   xmm2,xmm2
mulsd   xmm2,xmm0
mulsd   xmm2,xmm4
subsd   xmm0,xmm2
jmp     oglmdi2_vs2019.13F12FA36
nop     word ptr ds:[rax+rax]
movsd   xmm2,xmm0
mulsd   xmm2,xmm0
movsd   xmm1,qword ptr ds:[13F142DA8]
mulsd   xmm1,xmm2
movsd   xmm4,xmm2
movsd   xmm5,qword ptr ds:[13F142D98]
mulsd   xmm4,xmm2
movsd   xmm3,xmm0
mulsd   xmm5,xmm2
mulsd   xmm3,xmm2
addsd   xmm1,qword ptr ds:[13F142DA0]
mulsd   xmm1,xmm4
addsd   xmm5,qword ptr ds:[13F142D90]
addsd   xmm1,xmm5
mulsd   xmm1,xmm3
addsd   xmm0,xmm1
jmp     oglmdi2_vs2019.13F12FA36
nop     word ptr ds:[rax+rax]
cmp     rdx,r10
mov     r11d,0
je      oglmdi2_vs2019.13F12F7F9
mov     r11d,1
subsd   xmm2,xmm0
movsd   xmm0,xmm2
cmp     r10,qword ptr ds:[13F142238]
jae     oglmdi2_vs2019.13F12F930
movsd   xmm2,xmm0
movsd   xmm3,qword ptr ds:[13F142170]
movsd   xmm4,xmm0
movsd   xmm5,qword ptr ds:[13F142160]
mulsd   xmm2,xmm3
mov     r9,r10
shr     r9,34
addsd   xmm2,xmm5
movsd   xmm3,qword ptr ds:[13F142180]
cvttpd2dq xmm0,xmm2
movsd   xmm1,qword ptr ds:[13F1421A0]
cvtdq2pd xmm2,xmm0
mulsd   xmm3,xmm2
subsd   xmm4,xmm3
mulsd   xmm1,xmm2
movd    eax,xmm0
movsd   xmm0,xmm4
subsd   xmm0,xmm1
movsd   xmm3,qword ptr ds:[13F1421B0]
movq    rcx,xmm0
movsd   xmm5,qword ptr ds:[13F1421C0]
shl     rcx,1
shr     rcx,35
sub     r9,rcx
cmp     r9,F
jle     oglmdi2_vs2019.13F12F8AA
movsd   xmm1,xmm4
mulsd   xmm3,xmm2
mulsd   xmm5,xmm2
subsd   xmm4,xmm3
subsd   xmm1,xmm4
subsd   xmm1,xmm3
subsd   xmm5,xmm1
movsd   xmm0,xmm4
movsd   xmm1,xmm5
subsd   xmm0,xmm5
cmp     rcx,3F2
jge     oglmdi2_vs2019.13F12F95E
cmp     rcx,3DE
jle     oglmdi2_vs2019.13F12F910
movsd   xmm2,xmm0
mulsd   xmm2,xmm0
and     r8d,eax
jne     oglmdi2_vs2019.13F12F8F0
movsd   xmm3,qword ptr ds:[13F142190]
mulsd   xmm3,xmm0
mulsd   xmm3,xmm2
subsd   xmm0,xmm3
jmp     oglmdi2_vs2019.13F12FA14
nop     word ptr ds:[rax+rax]
movsd   xmm0,qword ptr ds:[13F142140]
mulsd   xmm2,qword ptr ds:[13F142160]
subsd   xmm0,xmm2
jmp     oglmdi2_vs2019.13F12FA14
nop     dword ptr ds:[rax]
and     r8d,eax
je      oglmdi2_vs2019.13F12FA14
movsd   xmm0,qword ptr ds:[13F142140]
jmp     oglmdi2_vs2019.13F12FA14
nop     word ptr ds:[rax+rax]
mov     qword ptr ss:[rsp+20],r11
lea     rdx,qword ptr ss:[rsp+38]
lea     r8,qword ptr ss:[rsp+30]
movq    rcx,xmm0
call    oglmdi2_vs2019.13F1355A0
mov     r11,qword ptr ss:[rsp+20]
mov     r8d,1
movsd   xmm1,qword ptr ss:[rsp+38]
mov     eax,dword ptr ss:[rsp+30]
movsd   xmm2,xmm0
mulsd   xmm2,xmm0
and     r8d,eax
jne     oglmdi2_vs2019.13F12F9C0
movsd   xmm1,qword ptr ds:[13F142DA8]
mulsd   xmm1,xmm2
movsd   xmm4,xmm2
mulsd   xmm4,xmm2
movsd   xmm5,qword ptr ds:[13F142D98]
mulsd   xmm5,xmm2
movsd   xmm3,xmm0
mulsd   xmm3,xmm2
addsd   xmm1,qword ptr ds:[13F142DA0]
mulsd   xmm1,xmm4
addsd   xmm5,qword ptr ds:[13F142D90]
addsd   xmm1,xmm5
mulsd   xmm1,xmm3
addsd   xmm0,xmm1
jmp     oglmdi2_vs2019.13F12FA14
nop     word ptr ds:[rax+rax]
movsd   xmm1,qword ptr ds:[13F142D80]
movsd   xmm4,xmm2
mulsd   xmm1,xmm2
movsd   xmm3,qword ptr ds:[13F142D70]
mulsd   xmm4,xmm2
movsd   xmm0,qword ptr ds:[13F142D60]
mulsd   xmm3,xmm2
mulsd   xmm0,xmm2
addsd   xmm1,qword ptr ds:[13F142D78]
mulsd   xmm1,xmm4
addsd   xmm3,qword ptr ds:[13F142D68]
addsd   xmm1,xmm3
mulsd   xmm1,xmm4
addsd   xmm0,qword ptr ds:[13F142140]
addsd   xmm0,xmm1
shr     eax,1
mov     ecx,eax
and     eax,r11d
not     ecx
not     r11d
and     ecx,r11d
or      eax,ecx
and     eax,1
jne     oglmdi2_vs2019.13F12FA36
movsd   xmm2,xmm0
xorpd   xmm0,xmm0
subsd   xmm0,xmm2
cvtsd2ss xmm0,xmm0
add     rsp,68
ret     
nop     
call    oglmdi2_vs2019.13F135448
add     rsp,68
ret     
nop     word ptr ds:[rax+rax]
vmovd   eax,xmm0
mov     r8d,dword ptr ds:[13F1421D0]
and     eax,r8d
cmp     eax,r8d
je      oglmdi2_vs2019.13F12FD9C
vcvtss2sd xmm5,xmm0,xmm0
vmovq   r9,xmm5
btr     r9,3F
cmp     r9,qword ptr ds:[13F142200]
jg      oglmdi2_vs2019.13F12FB10
cmp     r9,qword ptr ds:[13F142220]
jge     oglmdi2_vs2019.13F12FAD0
cmp     r9,qword ptr ds:[13F142210]
jge     oglmdi2_vs2019.13F12FAB0
vmovapd xmm1,xmm0
vmulss  xmm1,xmm0,dword ptr ds:[13F142240]
vaddss  xmm1,xmm1,dword ptr ds:[13F142248]
add     rsp,68
ret     
nop     dword ptr ds:[rax]
vmulsd  xmm1,xmm5,xmm5
vmulsd  xmm0,xmm1,xmm5
vfnmadd132sd xmm0,xmm5,qword ptr ds:[13F142190]
jmp     oglmdi2_vs2019.13F12FD93
nop     word ptr ds:[rax+rax]
vmovapd xmm0,xmm5
vmovsd  xmm1,qword ptr ds:[13F142DA0]
vmulsd  xmm3,xmm0,xmm0
vfmadd231sd xmm1,xmm3,qword ptr ds:[13F142DA8]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D98]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D90]
vmulsd  xmm3,xmm0,xmm3
vfmadd231sd xmm0,xmm1,xmm3
jmp     oglmdi2_vs2019.13F12FD93
nop     dword ptr ds:[rax]
vmovq   xmm0,r9
cmp     r9,qword ptr ds:[13F142230]
jge     oglmdi2_vs2019.13F12FB80
vandpd  xmm1,xmm0,xmmword ptr ds:[13F142130]
vmovapd xmm2,xmmword ptr ds:[13F142170]
vfmadd213sd xmm2,xmm1,qword ptr ds:[13F142160]
vcvttpd2dq xmm2,xmm2
vpmovsxdq xmm1,xmm2
vandpd  xmm4,xmm1,xmmword ptr ds:[13F142150]
vshufps xmm1,xmm1,xmm1,8
vcvtdq2pd xmm1,xmm1
vmovdqa xmm2,xmm0
vfnmadd231sd xmm2,xmm1,qword ptr ds:[13F142180]
vmulsd  xmm3,xmm1,qword ptr ds:[13F1421A0]
vsubsd  xmm0,xmm2,xmm3
vsubsd  xmm2,xmm2,xmm0
vsubsd  xmm1,xmm2,xmm3
jmp     oglmdi2_vs2019.13F12FCD6
nop     word ptr ds:[rax+rax]
lea     r9,qword ptr ds:[13F142DB0]
vmovq   r11,xmm0
mov     rcx,r11
shr     r11,34
sub     r11,3FF
mov     r10,r11
shr     r10,3
sub     r10,86
neg     r10
mov     rax,qword ptr ds:[r9+r10]
shl     rcx,C
shr     rcx,C
bts     rcx,34
add     r10,8
vmovdqu xmm0,xmmword ptr ds:[r9+r10]
mul     rcx
mov     r8,rax
mov     r10,rdx
vmovq   rax,xmm0
mul     rcx
and     r11,7
psrldq  xmm0,8
add     rax,r10
adc     rdx,0
mov     r9,rax
mov     r10,rdx
vmovq   rax,xmm0
mul     rcx
add     r10,rax
mov     rcx,36
mov     rax,r10
sub     rcx,r11
xor     rdx,rdx
shr     rax,cl
jae     oglmdi2_vs2019.13F12FC20
not     r10
not     r9
not     r8
movabs  rdx,8000000000000000
adc     rax,0
and     rax,3
vmovd   xmm4,eax
mov     rcx,r11
add     rcx,A
shl     r10,cl
shr     r10,cl
sub     rcx,40
mov     r11,rcx
bsr     rcx,r10
jne     oglmdi2_vs2019.13F12FC5B
mov     r10,r9
mov     r9,r8
mov     r8,0
bsr     rcx,r10
sub     r11,40
add     r11,rcx
sub     rcx,34
cmp     rcx,0
jl      oglmdi2_vs2019.13F12FC90
je      oglmdi2_vs2019.13F12FCB0
mov     r8,r10
shr     r10,cl
shr     r9,cl
sub     rcx,40
neg     rcx
shl     r8,cl
or      r9,r8
jmp     oglmdi2_vs2019.13F12FCB0
nop     word ptr ds:[rax+rax]
neg     rcx
mov     rax,r9
shl     r10,cl
shl     r9,cl
sub     rcx,40
neg     rcx
shr     rax,cl
or      r10,rax
shr     r8,cl
or      r9,r8
nop     
add     r11,3FF
btr     r10,34
mov     rcx,r11
or      r10,rdx
shl     rcx,34
or      r10,rcx
vmovq   xmm0,r10
vmulsd  xmm0,xmm0,qword ptr ds:[13F1421F0]
vmovq   rax,xmm4
and     rax,1
cmp     rax,1
je      oglmdi2_vs2019.13F12FD20
vmovsd  xmm1,qword ptr ds:[13F142DA0]
vmulsd  xmm3,xmm0,xmm0
vfmadd231sd xmm1,xmm3,qword ptr ds:[13F142DA8]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D98]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D90]
vmulsd  xmm3,xmm0,xmm3
vfmadd231sd xmm0,xmm1,xmm3
jmp     oglmdi2_vs2019.13F12FD65
nop     word ptr ds:[rax+rax]
vmovapd xmm2,xmmword ptr ds:[13F142140]
vmulsd  xmm3,xmm0,xmm0
vfmadd231sd xmm2,xmm3,qword ptr ds:[13F142D60]
vmovsd  xmm1,qword ptr ds:[13F142D78]
vfmadd231sd xmm1,xmm3,qword ptr ds:[13F142D80]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D70]
vfmadd213sd xmm1,xmm3,qword ptr ds:[13F142D68]
vmulsd  xmm3,xmm3,xmm3
vmovdqa xmm0,xmm2
vfmadd231sd xmm0,xmm1,xmm3
vpcmpeqq xmm2,xmm4,xmmword ptr ds:[13F1421E0]
vpcmpeqq xmm3,xmm4,xmmword ptr ds:[13F142150]
vorpd   xmm3,xmm2,xmm3
vandnpd xmm3,xmm3,xmmword ptr ds:[13F142120]
vxorpd  xmm0,xmm0,xmm3
vandnpd xmm1,xmm5,xmmword ptr ds:[13F142120]
vxorpd  xmm0,xmm1,xmm0
vcvtsd2ss xmm0,xmm0,xmm0
add     rsp,68
ret     
call    oglmdi2_vs2019.13F135448
add     rsp,68
ret     
int3    
int3    
push    rbp
push    rbx
push    rsi
push    rdi
push    r12
push    r14
push    r15
lea     rbp,qword ptr ss:[rsp-3F0]
sub     rsp,4F0
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+3E0],rax
xor     r12d,r12d
mov     rbx,r9
mov     rdi,r8
mov     rsi,rdx
mov     r15,rcx
test    r9,r9
jne     oglmdi2_vs2019.13F12FDFF
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F12FF32
test    rdi,rdi
je      oglmdi2_vs2019.13F12FE09
test    rsi,rsi
je      oglmdi2_vs2019.13F12FDE7
mov     rdx,qword ptr ss:[rbp+450]
lea     rcx,qword ptr ss:[rsp+40]
call    oglmdi2_vs2019.13F1301AC
mov     r14,r15
mov     dword ptr ss:[rsp+39],r12d
mov     word ptr ss:[rsp+3D],r12w
mov     byte ptr ss:[rsp+3F],r12b
mov     qword ptr ss:[rsp+20],rsi
mov     qword ptr ss:[rsp+28],rdi
mov     qword ptr ss:[rsp+30],r12
and     r14d,2
jne     oglmdi2_vs2019.13F12FE4C
mov     byte ptr ss:[rsp+38],r12b
test    rsi,rsi
jne     oglmdi2_vs2019.13F12FE51
mov     byte ptr ss:[rsp+38],1
lea     rax,qword ptr ss:[rsp+20]
mov     qword ptr ss:[rsp+70],r12
mov     qword ptr ss:[rbp+3C8],rax
lea     rcx,qword ptr ss:[rsp+60]
lea     rax,qword ptr ss:[rsp+48]
mov     qword ptr ss:[rbp-78],r12
mov     qword ptr ss:[rsp+68],rax
mov     rax,qword ptr ss:[rbp+458]
mov     qword ptr ss:[rbp-80],rax
mov     qword ptr ss:[rbp-70],r12
mov     dword ptr ss:[rbp-68],r12d
mov     word ptr ss:[rbp-60],r12w
mov     dword ptr ss:[rbp-50],r12d
mov     byte ptr ss:[rbp-4C],r12b
mov     qword ptr ss:[rbp+3B8],r12
mov     qword ptr ss:[rbp+3C0],r12
mov     qword ptr ss:[rsp+60],r15
mov     qword ptr ss:[rsp+78],rbx
mov     dword ptr ss:[rbp+3D0],r12d
call    oglmdi2_vs2019.13F130358
movsxd  rbx,eax
test    rsi,rsi
je      oglmdi2_vs2019.13F12FF0A
test    r15b,1
je      oglmdi2_vs2019.13F12FEE9
test    rdi,rdi
jne     oglmdi2_vs2019.13F12FED4
test    eax,eax
jne     oglmdi2_vs2019.13F12FF58
mov     rax,qword ptr ss:[rsp+30]
cmp     rax,rdi
jne     oglmdi2_vs2019.13F12FF06
test    ebx,ebx
js      oglmdi2_vs2019.13F12FF0A
cmp     rbx,rdi
jbe     oglmdi2_vs2019.13F12FF0A
jmp     oglmdi2_vs2019.13F12FF58
test    r14,r14
je      oglmdi2_vs2019.13F12FF53
test    rdi,rdi
je      oglmdi2_vs2019.13F12FF0A
test    eax,eax
jns     oglmdi2_vs2019.13F12FEFC
mov     byte ptr ds:[rsi],r12b
jmp     oglmdi2_vs2019.13F12FF0A
mov     rax,qword ptr ss:[rsp+30]
cmp     rax,rdi
je      oglmdi2_vs2019.13F12FF6C
mov     byte ptr ds:[rsi+rax],r12b
mov     rcx,qword ptr ss:[rbp+3C0]
call    oglmdi2_vs2019.13F133148
mov     qword ptr ss:[rbp+3C0],r12
cmp     byte ptr ss:[rsp+58],r12b
je      oglmdi2_vs2019.13F12FF30
mov     rcx,qword ptr ss:[rsp+40]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     eax,ebx
mov     rcx,qword ptr ss:[rbp+3E0]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,4F0
pop     r15
pop     r14
pop     r12
pop     rdi
pop     rsi
pop     rbx
pop     rbp
ret     
test    rdi,rdi
jne     oglmdi2_vs2019.13F12FF5D
or      ebx,FFFFFFFF
jmp     oglmdi2_vs2019.13F12FF0A
mov     rax,qword ptr ss:[rsp+30]
cmp     rax,rdi
jne     oglmdi2_vs2019.13F12FF06
mov     ebx,FFFFFFFE
mov     byte ptr ds:[rdi+rsi-1],r12b
jmp     oglmdi2_vs2019.13F12FF0A
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
movabs  rax,7FFFFFFFFFFFFFFF
mov     rdi,rcx
cmp     rdx,rax
jbe     oglmdi2_vs2019.13F12FFA9
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],C
xor     al,al
jmp     oglmdi2_vs2019.13F130005
xor     esi,esi
lea     rbp,qword ptr ds:[rdx+rdx]
cmp     qword ptr ds:[rcx+408],rsi
jne     oglmdi2_vs2019.13F12FFC1
cmp     rbp,400
jbe     oglmdi2_vs2019.13F12FFCA
cmp     rbp,qword ptr ds:[rcx+400]
ja      oglmdi2_vs2019.13F12FFCE
mov     al,1
jmp     oglmdi2_vs2019.13F130005
mov     rcx,rbp
call    oglmdi2_vs2019.13F134230
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F12FFFB
mov     rcx,qword ptr ds:[rdi+408]
call    oglmdi2_vs2019.13F133148
mov     qword ptr ds:[rdi+408],rbx
mov     sil,1
mov     qword ptr ds:[rdi+400],rbp
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     al,sil
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
lea     r10,qword ptr ds:[rcx+58]
mov     ebx,r8d
mov     rax,qword ptr ds:[r10+408]
mov     r11d,edx
test    rax,rax
jne     oglmdi2_vs2019.13F13003E
mov     eax,200
jmp     oglmdi2_vs2019.13F13004B
mov     r10,rax
mov     rax,qword ptr ds:[rcx+458]
shr     rax,1
lea     r8,qword ptr ds:[r10-1]
add     r8,rax
mov     qword ptr ds:[rcx+48],r8
mov     eax,dword ptr ds:[rcx+38]
test    eax,eax
jg      oglmdi2_vs2019.13F130062
test    r11d,r11d
je      oglmdi2_vs2019.13F130091
dec     eax
xor     edx,edx
mov     dword ptr ds:[rcx+38],eax
mov     eax,r11d
div     ebx
add     dl,30
mov     r11d,eax
cmp     dl,39
jle     oglmdi2_vs2019.13F130085
mov     al,r9b
xor     al,1
shl     al,5
add     al,7
add     dl,al
mov     rax,qword ptr ds:[rcx+48]
mov     byte ptr ds:[rax],dl
dec     qword ptr ds:[rcx+48]
jmp     oglmdi2_vs2019.13F130056
sub     r8d,dword ptr ds:[rcx+48]
mov     rbx,qword ptr ss:[rsp+8]
mov     dword ptr ds:[rcx+50],r8d
inc     qword ptr ds:[rcx+48]
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     rax,qword ptr ds:[rcx+460]
mov     r10,rcx
add     rcx,58
mov     ebx,r8d
mov     r11,rdx
test    rax,rax
jne     oglmdi2_vs2019.13F1300C9
mov     eax,200
jmp     oglmdi2_vs2019.13F1300D6
mov     rcx,rax
mov     rax,qword ptr ds:[r10+458]
shr     rax,1
lea     r8,qword ptr ds:[rcx-1]
add     r8,rax
mov     qword ptr ds:[r10+48],r8
mov     eax,dword ptr ds:[r10+38]
test    eax,eax
jg      oglmdi2_vs2019.13F1300EE
test    r11,r11
je      oglmdi2_vs2019.13F13011F
dec     eax
xor     edx,edx
mov     dword ptr ds:[r10+38],eax
mov     rax,r11
div     rbx
add     dl,30
mov     r11,rax
cmp     dl,39
jle     oglmdi2_vs2019.13F130113
mov     al,r9b
xor     al,1
shl     al,5
add     al,7
add     dl,al
mov     rax,qword ptr ds:[r10+48]
mov     byte ptr ds:[rax],dl
dec     qword ptr ds:[r10+48]
jmp     oglmdi2_vs2019.13F1300E1
sub     r8d,dword ptr ds:[r10+48]
mov     rbx,qword ptr ss:[rsp+8]
mov     dword ptr ds:[r10+50],r8d
inc     qword ptr ds:[r10+48]
ret     
int3    
int3    
int3    
test    r8d,r8d
jle     oglmdi2_vs2019.13F1301A8
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rdi
mov     r10d,dword ptr ds:[r9]
mov     dil,dl
mov     rbx,rcx
xor     r11d,r11d
mov     rdx,qword ptr ds:[rbx]
mov     rax,qword ptr ds:[rdx+8]
cmp     qword ptr ds:[rdx+10],rax
jne     oglmdi2_vs2019.13F130170
cmp     byte ptr ds:[rdx+18],0
je      oglmdi2_vs2019.13F130167
inc     r10d
jmp     oglmdi2_vs2019.13F13016B
or      r10d,FFFFFFFF
mov     dword ptr ds:[r9],r10d
jmp     oglmdi2_vs2019.13F130190
lea     eax,dword ptr ds:[r10+1]
mov     dword ptr ds:[r9],eax
mov     rax,qword ptr ds:[rbx]
inc     qword ptr ds:[rax+10]
mov     rax,qword ptr ds:[rbx]
mov     rcx,qword ptr ds:[rax]
mov     byte ptr ds:[rcx],dil
mov     rax,qword ptr ds:[rbx]
inc     qword ptr ds:[rax]
mov     r10d,dword ptr ds:[r9]
cmp     r10d,FFFFFFFF
je      oglmdi2_vs2019.13F13019E
inc     r11d
cmp     r11d,r8d
jl      oglmdi2_vs2019.13F13014F
mov     rbx,qword ptr ss:[rsp+8]
mov     rdi,qword ptr ss:[rsp+10]
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     byte ptr ds:[rcx+18],0
mov     rdi,rcx
lea     rsi,qword ptr ds:[rcx+8]
test    rdx,rdx
je      oglmdi2_vs2019.13F1301D0
movups  xmm0,xmmword ptr ds:[rdx]
jmp     oglmdi2_vs2019.13F1301E0
cmp     dword ptr ds:[13F14DC7C],0
jne     oglmdi2_vs2019.13F1301E6
movups  xmm0,xmmword ptr ds:[13F14C488]
movdqu  xmmword ptr ds:[rsi],xmm0
jmp     oglmdi2_vs2019.13F130234
call    oglmdi2_vs2019.13F1364CC
mov     qword ptr ds:[rdi],rax
mov     rdx,rsi
mov     rcx,qword ptr ds:[rax+90]
mov     qword ptr ds:[rsi],rcx
mov     rcx,qword ptr ds:[rax+88]
mov     qword ptr ds:[rdi+10],rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F136774
mov     rcx,qword ptr ds:[rdi]
lea     rdx,qword ptr ds:[rdi+10]
call    oglmdi2_vs2019.13F1367A8
mov     rcx,qword ptr ds:[rdi]
mov     eax,dword ptr ds:[rcx+3A8]
test    al,2
jne     oglmdi2_vs2019.13F130234
or      eax,2
mov     dword ptr ds:[rcx+3A8],eax
mov     byte ptr ds:[rdi+18],1
mov     rbx,qword ptr ss:[rsp+30]
mov     rax,rdi
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
int3    
mov     rax,qword ptr ds:[rdx]
mov     rdx,qword ptr ds:[rax+F8]
mov     rax,qword ptr ds:[rdx]
mov     r9b,byte ptr ds:[rax]
mov     al,byte ptr ds:[rcx]
test    al,al
je      oglmdi2_vs2019.13F130272
mov     dl,al
mov     al,dl
cmp     dl,r9b
je      oglmdi2_vs2019.13F130272
inc     rcx
mov     al,byte ptr ds:[rcx]
mov     dl,al
test    al,al
jne     oglmdi2_vs2019.13F130260
inc     rcx
test    al,al
je      oglmdi2_vs2019.13F1302B0
jmp     oglmdi2_vs2019.13F130284
sub     al,45
test    al,DF
je      oglmdi2_vs2019.13F13028A
inc     rcx
mov     al,byte ptr ds:[rcx]
test    al,al
jne     oglmdi2_vs2019.13F13027B
mov     r8,rcx
dec     rcx
mov     al,byte ptr ds:[rcx]
cmp     al,30
je      oglmdi2_vs2019.13F13028D
cmp     al,r9b
lea     rdx,qword ptr ds:[rcx-1]
cmovne  rdx,rcx
mov     al,byte ptr ds:[r8]
inc     rdx
inc     r8
mov     byte ptr ds:[rdx],al
test    al,al
jne     oglmdi2_vs2019.13F1302A1
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rbp
push    rsi
push    rdi
push    r14
sub     rsp,20
mov     rbx,qword ptr ds:[rcx+10]
mov     r14,rdx
mov     rdi,rcx
test    rbx,rbx
jne     oglmdi2_vs2019.13F1302E1
call    oglmdi2_vs2019.13F1330B0
mov     rbx,rax
mov     qword ptr ds:[rdi+10],rax
mov     ebp,dword ptr ds:[rbx]
lea     rdx,qword ptr ss:[rsp+40]
and     dword ptr ds:[rbx],0
mov     esi,1
mov     rcx,qword ptr ds:[rdi+18]
and     qword ptr ss:[rsp+40],0
sub     rcx,rsi
lea     r8d,dword ptr ds:[rsi+9]
call    oglmdi2_vs2019.13F135AC8
mov     dword ptr ds:[r14],eax
mov     rax,qword ptr ds:[rdi+10]
test    rax,rax
jne     oglmdi2_vs2019.13F13031B
call    oglmdi2_vs2019.13F1330B0
mov     qword ptr ds:[rdi+10],rax
cmp     dword ptr ds:[rax],22
je      oglmdi2_vs2019.13F130331
mov     rax,qword ptr ss:[rsp+40]
cmp     rax,qword ptr ds:[rdi+18]
jb      oglmdi2_vs2019.13F130331
mov     qword ptr ds:[rdi+18],rax
jmp     oglmdi2_vs2019.13F130334
xor     sil,sil
cmp     dword ptr ds:[rbx],0
jne     oglmdi2_vs2019.13F13033F
test    ebp,ebp
je      oglmdi2_vs2019.13F13033F
mov     dword ptr ds:[rbx],ebp
mov     rbx,qword ptr ss:[rsp+48]
mov     al,sil
mov     rbp,qword ptr ss:[rsp+50]
add     rsp,20
pop     r14
pop     rdi
pop     rsi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rbp
push    rdi
sub     rsp,20
or      edi,FFFFFFFF
mov     rbx,rcx
cmp     qword ptr ds:[rcx+468],0
je      oglmdi2_vs2019.13F13054E
cmp     qword ptr ds:[rcx+18],0
jne     oglmdi2_vs2019.13F130399
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      eax,edi
jmp     oglmdi2_vs2019.13F13053E
inc     dword ptr ds:[rcx+470]
cmp     dword ptr ds:[rcx+470],2
je      oglmdi2_vs2019.13F13053B
lea     rbp,qword ptr ds:[13F142250]
and     dword ptr ds:[rbx+50],0
and     dword ptr ds:[rbx+2C],0
jmp     oglmdi2_vs2019.13F130513
inc     qword ptr ds:[rbx+18]
cmp     dword ptr ds:[rbx+28],0
jl      oglmdi2_vs2019.13F130528
mov     cl,byte ptr ds:[rbx+41]
mov     edx,dword ptr ds:[rbx+2C]
lea     eax,dword ptr ds:[rcx-20]
cmp     al,5A
ja      oglmdi2_vs2019.13F1303EC
lfence  
movsx   rax,cl
movzx   ecx,byte ptr ds:[rax+rbp-20]
and     ecx,F
jmp     oglmdi2_vs2019.13F1303EE
xor     ecx,ecx
lea     eax,dword ptr ds:[rdx+rcx*8]
mov     ecx,eax
movzx   eax,byte ptr ds:[rax+rbp]
shr     eax,4
mov     dword ptr ds:[rbx+2C],eax
cmp     eax,8
je      oglmdi2_vs2019.13F13054E
test    eax,eax
je      oglmdi2_vs2019.13F130507
sub     eax,1
je      oglmdi2_vs2019.13F1304EE
sub     eax,1
je      oglmdi2_vs2019.13F1304B9
sub     eax,1
je      oglmdi2_vs2019.13F13048D
sub     eax,1
je      oglmdi2_vs2019.13F130484
sub     eax,1
je      oglmdi2_vs2019.13F130457
sub     eax,1
je      oglmdi2_vs2019.13F13044A
cmp     eax,1
jne     oglmdi2_vs2019.13F13055E
mov     rcx,rbx
call    oglmdi2_vs2019.13F1307F4
jmp     oglmdi2_vs2019.13F13050F
mov     rcx,rbx
call    oglmdi2_vs2019.13F130680
jmp     oglmdi2_vs2019.13F13050F
cmp     byte ptr ds:[rbx+41],2A
je      oglmdi2_vs2019.13F13046E
lea     rdx,qword ptr ds:[rbx+38]
mov     rcx,rbx
call    oglmdi2_vs2019.13F1302B4
jmp     oglmdi2_vs2019.13F13050F
add     qword ptr ds:[rbx+20],8
mov     rax,qword ptr ds:[rbx+20]
mov     ecx,dword ptr ds:[rax-8]
test    ecx,ecx
cmovs   ecx,edi
mov     dword ptr ds:[rbx+38],ecx
jmp     oglmdi2_vs2019.13F1304B5
and     dword ptr ds:[rbx+38],0
jmp     oglmdi2_vs2019.13F130513
cmp     byte ptr ds:[rbx+41],2A
je      oglmdi2_vs2019.13F130499
lea     rdx,qword ptr ds:[rbx+34]
jmp     oglmdi2_vs2019.13F130461
add     qword ptr ds:[rbx+20],8
mov     rax,qword ptr ds:[rbx+20]
mov     ecx,dword ptr ds:[rax-8]
mov     dword ptr ds:[rbx+34],ecx
test    ecx,ecx
jns     oglmdi2_vs2019.13F1304B5
or      dword ptr ds:[rbx+30],4
neg     ecx
mov     dword ptr ds:[rbx+34],ecx
mov     al,1
jmp     oglmdi2_vs2019.13F13050F
mov     al,byte ptr ds:[rbx+41]
cmp     al,20
je      oglmdi2_vs2019.13F1304E8
cmp     al,23
je      oglmdi2_vs2019.13F1304E2
cmp     al,2B
je      oglmdi2_vs2019.13F1304DC
cmp     al,2D
je      oglmdi2_vs2019.13F1304D6
cmp     al,30
jne     oglmdi2_vs2019.13F130513
or      dword ptr ds:[rbx+30],8
jmp     oglmdi2_vs2019.13F130513
or      dword ptr ds:[rbx+30],4
jmp     oglmdi2_vs2019.13F130513
or      dword ptr ds:[rbx+30],1
jmp     oglmdi2_vs2019.13F130513
or      dword ptr ds:[rbx+30],20
jmp     oglmdi2_vs2019.13F130513
or      dword ptr ds:[rbx+30],2
jmp     oglmdi2_vs2019.13F130513
and     dword ptr ds:[rbx+34],0
and     dword ptr ds:[rbx+30],0
and     dword ptr ds:[rbx+3C],0
mov     byte ptr ds:[rbx+40],0
mov     dword ptr ds:[rbx+38],edi
mov     byte ptr ds:[rbx+54],0
jmp     oglmdi2_vs2019.13F130513
mov     rcx,rbx
call    oglmdi2_vs2019.13F130564
test    al,al
je      oglmdi2_vs2019.13F13055E
mov     rax,qword ptr ds:[rbx+18]
mov     cl,byte ptr ds:[rax]
mov     byte ptr ds:[rbx+41],cl
test    cl,cl
jne     oglmdi2_vs2019.13F1303C0
inc     qword ptr ds:[rbx+18]
inc     dword ptr ds:[rbx+470]
cmp     dword ptr ds:[rbx+470],2
jne     oglmdi2_vs2019.13F1303B3
mov     eax,dword ptr ds:[rbx+28]
mov     rbx,qword ptr ss:[rsp+38]
mov     rbp,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     eax,edi
jmp     oglmdi2_vs2019.13F13053E
int3    
int3    
push    rbx
sub     rsp,20
xor     edx,edx
mov     rbx,rcx
call    oglmdi2_vs2019.13F1305D8
test    al,al
je      oglmdi2_vs2019.13F1305C0
mov     rcx,qword ptr ds:[rbx+468]
mov     r8b,byte ptr ds:[rbx+41]
mov     rax,qword ptr ds:[rcx+8]
cmp     qword ptr ds:[rcx+10],rax
jne     oglmdi2_vs2019.13F13059E
cmp     byte ptr ds:[rcx+18],0
je      oglmdi2_vs2019.13F130598
inc     dword ptr ds:[rbx+28]
jmp     oglmdi2_vs2019.13F1305BC
or      dword ptr ds:[rbx+28],FFFFFFFF
jmp     oglmdi2_vs2019.13F1305BC
inc     dword ptr ds:[rbx+28]
inc     qword ptr ds:[rcx+10]
mov     rcx,qword ptr ds:[rbx+468]
mov     rdx,qword ptr ds:[rcx]
mov     byte ptr ds:[rdx],r8b
mov     rcx,qword ptr ds:[rbx+468]
inc     qword ptr ds:[rcx]
mov     al,1
jmp     oglmdi2_vs2019.13F1305D2
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     al,al
add     rsp,20
pop     rbx
ret     
sub     rsp,28
movsx   r9,byte ptr ds:[rcx+41]
mov     r8,rcx
mov     byte ptr ds:[rcx+54],0
mov     rcx,r9
cmp     r9d,FFFFFFFF
jl      oglmdi2_vs2019.13F130607
mov     rax,qword ptr ds:[r8+8]
mov     rax,qword ptr ds:[rax]
mov     rax,qword ptr ds:[rax]
movzx   ecx,word ptr ds:[rax+rcx*2]
and     ecx,8000
jmp     oglmdi2_vs2019.13F130609
xor     ecx,ecx
test    ecx,ecx
je      oglmdi2_vs2019.13F130679
mov     rcx,qword ptr ds:[r8+468]
mov     rax,qword ptr ds:[rcx+8]
cmp     qword ptr ds:[rcx+10],rax
jne     oglmdi2_vs2019.13F130631
cmp     byte ptr ds:[rcx+18],0
je      oglmdi2_vs2019.13F13062A
inc     dword ptr ds:[r8+28]
jmp     oglmdi2_vs2019.13F130650
or      dword ptr ds:[r8+28],FFFFFFFF
jmp     oglmdi2_vs2019.13F130650
inc     dword ptr ds:[r8+28]
inc     qword ptr ds:[rcx+10]
mov     rax,qword ptr ds:[r8+468]
mov     rcx,qword ptr ds:[rax]
mov     byte ptr ds:[rcx],r9b
mov     rax,qword ptr ds:[r8+468]
inc     qword ptr ds:[rax]
mov     rax,qword ptr ds:[r8+18]
mov     cl,byte ptr ds:[rax]
inc     rax
mov     byte ptr ds:[r8+41],cl
mov     qword ptr ds:[r8+18],rax
test    cl,cl
jne     oglmdi2_vs2019.13F130679
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     al,al
jmp     oglmdi2_vs2019.13F13067B
mov     al,1
add     rsp,28
ret     
sub     rsp,28
mov     al,byte ptr ds:[rcx+41]
cmp     al,46
jne     oglmdi2_vs2019.13F1306A4
test    byte ptr ds:[rcx],8
jne     oglmdi2_vs2019.13F1307EA
mov     dword ptr ds:[rcx+2C],7
add     rsp,28
jmp     oglmdi2_vs2019.13F1307F4
cmp     al,4E
jne     oglmdi2_vs2019.13F1306CF
test    byte ptr ds:[rcx],8
jne     oglmdi2_vs2019.13F1307EA
mov     dword ptr ds:[rcx+2C],8
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     al,al
jmp     oglmdi2_vs2019.13F1307EC
cmp     dword ptr ds:[rcx+3C],0
jne     oglmdi2_vs2019.13F1306B8
cmp     al,49
je      oglmdi2_vs2019.13F13078D
cmp     al,4C
je      oglmdi2_vs2019.13F130784
cmp     al,54
je      oglmdi2_vs2019.13F13077B
cmp     al,68
je      oglmdi2_vs2019.13F13075D
cmp     al,6A
je      oglmdi2_vs2019.13F130751
cmp     al,6C
je      oglmdi2_vs2019.13F13072D
cmp     al,74
je      oglmdi2_vs2019.13F130721
cmp     al,77
je      oglmdi2_vs2019.13F130715
cmp     al,7A
jne     oglmdi2_vs2019.13F1307EA
mov     dword ptr ds:[rcx+3C],6
jmp     oglmdi2_vs2019.13F1307EA
mov     dword ptr ds:[rcx+3C],C
jmp     oglmdi2_vs2019.13F1307EA
mov     dword ptr ds:[rcx+3C],7
jmp     oglmdi2_vs2019.13F1307EA
mov     rax,qword ptr ds:[rcx+18]
cmp     byte ptr ds:[rax],6C
jne     oglmdi2_vs2019.13F130744
inc     rax
mov     qword ptr ds:[rcx+18],rax
mov     eax,4
jmp     oglmdi2_vs2019.13F130749
mov     eax,3
mov     dword ptr ds:[rcx+3C],eax
jmp     oglmdi2_vs2019.13F1307EA
mov     dword ptr ds:[rcx+3C],5
jmp     oglmdi2_vs2019.13F1307EA
mov     rax,qword ptr ds:[rcx+18]
cmp     byte ptr ds:[rax],68
jne     oglmdi2_vs2019.13F130774
inc     rax
mov     qword ptr ds:[rcx+18],rax
mov     eax,1
jmp     oglmdi2_vs2019.13F130749
mov     eax,2
jmp     oglmdi2_vs2019.13F130749
mov     dword ptr ds:[rcx+3C],D
jmp     oglmdi2_vs2019.13F1307EA
mov     dword ptr ds:[rcx+3C],8
jmp     oglmdi2_vs2019.13F1307EA
mov     rdx,qword ptr ds:[rcx+18]
mov     al,byte ptr ds:[rdx]
cmp     al,33
jne     oglmdi2_vs2019.13F1307AE
cmp     byte ptr ds:[rdx+1],32
jne     oglmdi2_vs2019.13F1307AE
lea     rax,qword ptr ds:[rdx+2]
mov     dword ptr ds:[rcx+3C],A
mov     qword ptr ds:[rcx+18],rax
jmp     oglmdi2_vs2019.13F1307EA
cmp     al,36
jne     oglmdi2_vs2019.13F1307C9
cmp     byte ptr ds:[rdx+1],34
jne     oglmdi2_vs2019.13F1307C9
lea     rax,qword ptr ds:[rdx+2]
mov     dword ptr ds:[rcx+3C],B
mov     qword ptr ds:[rcx+18],rax
jmp     oglmdi2_vs2019.13F1307EA
sub     al,58
cmp     al,20
ja      oglmdi2_vs2019.13F1307EA
movsx   rax,al
movabs  rdx,120821001
bt      rdx,rax
jae     oglmdi2_vs2019.13F1307EA
mov     dword ptr ds:[rcx+3C],9
mov     al,1
add     rsp,28
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rbp
mov     qword ptr ss:[rsp+20],rsi
push    rdi
push    r14
push    r15
sub     rsp,30
mov     al,byte ptr ds:[rcx+41]
mov     rbx,rcx
mov     r15d,1
mov     sil,78
mov     bpl,58
mov     r14b,41
cmp     al,64
jg      oglmdi2_vs2019.13F13087B
je      oglmdi2_vs2019.13F1308E7
cmp     al,r14b
je      oglmdi2_vs2019.13F1308FA
cmp     al,43
je      oglmdi2_vs2019.13F130865
cmp     al,44
jle     oglmdi2_vs2019.13F130903
cmp     al,47
jle     oglmdi2_vs2019.13F1308FA
cmp     al,53
je      oglmdi2_vs2019.13F1308A3
cmp     al,bpl
je      oglmdi2_vs2019.13F1308B8
cmp     al,5A
je      oglmdi2_vs2019.13F130871
cmp     al,61
je      oglmdi2_vs2019.13F1308FA
cmp     al,63
jne     oglmdi2_vs2019.13F130903
xor     edx,edx
call    oglmdi2_vs2019.13F130CE8
jmp     oglmdi2_vs2019.13F1308FF
call    oglmdi2_vs2019.13F130A5C
jmp     oglmdi2_vs2019.13F1308FF
cmp     al,67
jle     oglmdi2_vs2019.13F1308FA
cmp     al,69
je      oglmdi2_vs2019.13F1308E7
cmp     al,6E
je      oglmdi2_vs2019.13F1308E0
cmp     al,6F
je      oglmdi2_vs2019.13F1308C2
cmp     al,70
je      oglmdi2_vs2019.13F1308AA
cmp     al,73
je      oglmdi2_vs2019.13F1308A3
cmp     al,75
je      oglmdi2_vs2019.13F1308EB
cmp     al,sil
jne     oglmdi2_vs2019.13F130903
mov     edx,10
jmp     oglmdi2_vs2019.13F1308F0
call    oglmdi2_vs2019.13F131048
jmp     oglmdi2_vs2019.13F1308FF
mov     dword ptr ds:[rcx+38],10
mov     dword ptr ds:[rcx+3C],B
mov     r8b,r15b
mov     edx,10
jmp     oglmdi2_vs2019.13F1308F3
mov     ecx,dword ptr ds:[rcx+30]
mov     eax,ecx
shr     eax,5
test    r15b,al
je      oglmdi2_vs2019.13F1308D6
bts     ecx,7
mov     dword ptr ds:[rbx+30],ecx
mov     edx,8
mov     rcx,rbx
jmp     oglmdi2_vs2019.13F1308F0
call    oglmdi2_vs2019.13F130F6C
jmp     oglmdi2_vs2019.13F1308FF
or      dword ptr ds:[rcx+30],10
mov     edx,A
xor     r8d,r8d
call    oglmdi2_vs2019.13F130DA4
jmp     oglmdi2_vs2019.13F1308FF
call    oglmdi2_vs2019.13F130AD0
test    al,al
jne     oglmdi2_vs2019.13F13090A
xor     al,al
jmp     oglmdi2_vs2019.13F130A41
cmp     byte ptr ds:[rbx+40],0
jne     oglmdi2_vs2019.13F130A3E
mov     edx,dword ptr ds:[rbx+30]
xor     eax,eax
mov     word ptr ss:[rsp+50],ax
xor     edi,edi
mov     byte ptr ss:[rsp+52],al
mov     eax,edx
shr     eax,4
test    r15b,al
je      oglmdi2_vs2019.13F13095C
mov     eax,edx
shr     eax,6
test    r15b,al
je      oglmdi2_vs2019.13F13093F
mov     byte ptr ss:[rsp+50],2D
jmp     oglmdi2_vs2019.13F130959
test    r15b,dl
je      oglmdi2_vs2019.13F13094B
mov     byte ptr ss:[rsp+50],2B
jmp     oglmdi2_vs2019.13F130959
mov     eax,edx
shr     eax,1
test    r15b,al
je      oglmdi2_vs2019.13F13095C
mov     byte ptr ss:[rsp+50],20
mov     rdi,r15
mov     cl,byte ptr ds:[rbx+41]
mov     al,cl
sub     al,bpl
test    al,DF
jne     oglmdi2_vs2019.13F130977
mov     eax,edx
shr     eax,5
test    r15b,al
je      oglmdi2_vs2019.13F130977
mov     r8b,r15b
jmp     oglmdi2_vs2019.13F13097A
xor     r8b,r8b
mov     al,cl
sub     al,r14b
test    al,DF
sete    al
test    r8b,r8b
jne     oglmdi2_vs2019.13F13098D
test    al,al
je      oglmdi2_vs2019.13F1309A8
mov     byte ptr ss:[rsp+rdi+50],30
cmp     cl,bpl
je      oglmdi2_vs2019.13F13099C
cmp     cl,r14b
jne     oglmdi2_vs2019.13F13099F
mov     sil,bpl
mov     byte ptr ss:[rsp+rdi+51],sil
add     rdi,2
mov     esi,dword ptr ds:[rbx+34]
lea     rbp,qword ptr ds:[rbx+28]
sub     esi,dword ptr ds:[rbx+50]
lea     r14,qword ptr ds:[rbx+468]
sub     esi,edi
test    dl,C
jne     oglmdi2_vs2019.13F1309D0
mov     r9,rbp
mov     r8d,esi
mov     dl,20
mov     rcx,r14
call    oglmdi2_vs2019.13F130134
lea     rax,qword ptr ds:[rbx+10]
mov     r9,rbp
mov     r8d,edi
mov     qword ptr ss:[rsp+20],rax
lea     rdx,qword ptr ss:[rsp+50]
mov     rcx,r14
call    oglmdi2_vs2019.13F1311B8
mov     ecx,dword ptr ds:[rbx+30]
mov     eax,ecx
shr     eax,3
test    r15b,al
je      oglmdi2_vs2019.13F130A11
shr     ecx,2
test    r15b,cl
jne     oglmdi2_vs2019.13F130A11
mov     r9,rbp
mov     r8d,esi
mov     dl,30
mov     rcx,r14
call    oglmdi2_vs2019.13F130134
xor     edx,edx
mov     rcx,rbx
call    oglmdi2_vs2019.13F1310E0
cmp     dword ptr ss:[rbp],0
jl      oglmdi2_vs2019.13F130A3E
mov     r10d,dword ptr ds:[rbx+30]
shr     r10d,2
test    r15b,r10b
je      oglmdi2_vs2019.13F130A3E
mov     r9,rbp
mov     r8d,esi
mov     dl,20
mov     rcx,r14
call    oglmdi2_vs2019.13F130134
mov     al,r15b
mov     rbx,qword ptr ss:[rsp+58]
mov     rbp,qword ptr ss:[rsp+60]
mov     rsi,qword ptr ss:[rsp+68]
add     rsp,30
pop     r15
pop     r14
pop     rdi
ret     
int3    
int3    
add     qword ptr ds:[rcx+20],8
mov     rax,qword ptr ds:[rcx+20]
mov     r8,qword ptr ds:[rax-8]
test    r8,r8
je      oglmdi2_vs2019.13F130AB5
mov     r9,qword ptr ds:[r8+8]
test    r9,r9
je      oglmdi2_vs2019.13F130AB5
mov     edx,dword ptr ds:[rcx+3C]
sub     edx,2
je      oglmdi2_vs2019.13F130A9F
sub     edx,1
je      oglmdi2_vs2019.13F130A9B
sub     edx,9
je      oglmdi2_vs2019.13F130A9B
cmp     dword ptr ds:[rcx+3C],D
je      oglmdi2_vs2019.13F130A9F
mov     al,byte ptr ds:[rcx+41]
sub     al,63
test    al,EF
setne   dl
jmp     oglmdi2_vs2019.13F130AA1
mov     dl,1
jmp     oglmdi2_vs2019.13F130AA1
xor     dl,dl
mov     qword ptr ds:[rcx+48],r9
movzx   eax,word ptr ds:[r8]
test    dl,dl
je      oglmdi2_vs2019.13F130AC5
mov     byte ptr ds:[rcx+54],1
shr     eax,1
jmp     oglmdi2_vs2019.13F130AC9
lea     rdx,qword ptr ds:[13F1422C0]
mov     eax,6
mov     qword ptr ds:[rcx+48],rdx
mov     byte ptr ds:[rcx+54],0
mov     dword ptr ds:[rcx+50],eax
mov     al,1
ret     
int3    
mov     qword ptr ss:[rsp+10],rbx
push    rdi
sub     rsp,50
or      dword ptr ds:[rcx+30],10
mov     rbx,rcx
mov     eax,dword ptr ds:[rcx+38]
test    eax,eax
jns     oglmdi2_vs2019.13F130AFE
mov     al,byte ptr ds:[rcx+41]
sub     al,41
and     al,DF
neg     al
sbb     eax,eax
and     eax,FFFFFFF9
add     eax,D
mov     dword ptr ds:[rcx+38],eax
jmp     oglmdi2_vs2019.13F130B1A
jne     oglmdi2_vs2019.13F130B1A
cmp     byte ptr ds:[rcx+41],67
je      oglmdi2_vs2019.13F130B0E
xor     eax,eax
cmp     byte ptr ds:[rcx+41],47
jne     oglmdi2_vs2019.13F130B1A
mov     dword ptr ds:[rcx+38],1
mov     eax,1
lea     rdi,qword ptr ds:[rcx+58]
add     eax,15D
movsxd  rdx,eax
mov     rcx,rdi
call    oglmdi2_vs2019.13F12FF74
mov     r8d,200
test    al,al
jne     oglmdi2_vs2019.13F130B59
cmp     qword ptr ds:[rbx+460],0
jne     oglmdi2_vs2019.13F130B47
mov     eax,r8d
jmp     oglmdi2_vs2019.13F130B51
mov     rax,qword ptr ds:[rbx+458]
shr     rax,1
add     eax,FFFFFEA3
mov     dword ptr ds:[rbx+38],eax
mov     rax,qword ptr ds:[rdi+408]
test    rax,rax
cmove   rax,rdi
mov     qword ptr ds:[rbx+48],rax
add     qword ptr ds:[rbx+20],8
mov     rax,qword ptr ds:[rbx+20]
mov     rcx,qword ptr ds:[rbx+460]
movsd   xmm0,qword ptr ds:[rax-8]
movsd   qword ptr ss:[rsp+60],xmm0
test    rcx,rcx
jne     oglmdi2_vs2019.13F130B90
mov     rdx,r8
jmp     oglmdi2_vs2019.13F130B9A
mov     rdx,qword ptr ds:[rbx+458]
shr     rdx,1
test    rcx,rcx
jne     oglmdi2_vs2019.13F130BA8
lea     r9,qword ptr ds:[rbx+258]
jmp     oglmdi2_vs2019.13F130BC2
mov     r9,qword ptr ds:[rbx+458]
mov     rdi,rcx
mov     r8,qword ptr ds:[rbx+458]
shr     r9,1
add     r9,rcx
shr     r8,1
mov     rax,qword ptr ds:[rbx+8]
movsx   ecx,byte ptr ds:[rbx+41]
mov     qword ptr ss:[rsp+40],rax
mov     rax,qword ptr ds:[rbx]
mov     qword ptr ss:[rsp+38],rax
mov     eax,dword ptr ds:[rbx+38]
mov     dword ptr ss:[rsp+30],eax
mov     dword ptr ss:[rsp+28],ecx
lea     rcx,qword ptr ss:[rsp+60]
mov     qword ptr ss:[rsp+20],rdx
mov     rdx,rdi
call    oglmdi2_vs2019.13F137074
mov     eax,dword ptr ds:[rbx+30]
shr     eax,5
test    al,1
je      oglmdi2_vs2019.13F130C73
cmp     dword ptr ds:[rbx+38],0
jne     oglmdi2_vs2019.13F130C73
mov     rax,qword ptr ds:[rbx+8]
mov     rcx,qword ptr ds:[rbx+48]
mov     r9,qword ptr ds:[rax]
movzx   r8d,byte ptr ds:[rcx]
mov     rdx,qword ptr ds:[r9+110]
cmp     byte ptr ds:[r8+rdx],65
je      oglmdi2_vs2019.13F130C32
mov     rax,qword ptr ds:[r9]
inc     rcx
movzx   r8d,byte ptr ds:[rcx]
test    byte ptr ds:[rax+r8*2],4
jne     oglmdi2_vs2019.13F130C24
movzx   eax,r8b
mov     r10b,byte ptr ds:[rax+rdx]
cmp     r10b,78
jne     oglmdi2_vs2019.13F130C44
mov     r8b,byte ptr ds:[rcx+2]
mov     rax,qword ptr ds:[r9+F8]
lea     rdx,qword ptr ds:[rcx+2]
cmp     r10b,78
cmovne  rdx,rcx
mov     rcx,qword ptr ds:[rax]
mov     al,byte ptr ds:[rcx]
mov     byte ptr ds:[rdx],al
inc     rdx
mov     al,byte ptr ds:[rdx]
mov     cl,r8b
mov     byte ptr ds:[rdx],r8b
inc     rdx
mov     r8b,al
test    cl,cl
jne     oglmdi2_vs2019.13F130C61
mov     al,byte ptr ds:[rbx+41]
sub     al,47
test    al,DF
jne     oglmdi2_vs2019.13F130C93
mov     eax,dword ptr ds:[rbx+30]
shr     eax,5
test    al,1
jne     oglmdi2_vs2019.13F130C93
mov     rdx,qword ptr ds:[rbx+8]
mov     rcx,qword ptr ds:[rbx+48]
call    oglmdi2_vs2019.13F130248
mov     rcx,qword ptr ds:[rbx+48]
mov     al,byte ptr ds:[rcx]
cmp     al,2D
jne     oglmdi2_vs2019.13F130CAA
or      dword ptr ds:[rbx+30],40
inc     rcx
mov     qword ptr ds:[rbx+48],rcx
mov     al,byte ptr ds:[rcx]
sub     al,49
cmp     al,25
ja      oglmdi2_vs2019.13F130CC8
movabs  rdx,2100000021
bt      rdx,rax
jae     oglmdi2_vs2019.13F130CC8
and     dword ptr ds:[rbx+30],FFFFFFF7
mov     byte ptr ds:[rbx+41],73
or      rdx,FFFFFFFFFFFFFFFF
inc     rdx
cmp     byte ptr ds:[rcx+rdx],0
jne     oglmdi2_vs2019.13F130CCC
mov     dword ptr ds:[rbx+50],edx
mov     al,1
mov     rbx,qword ptr ss:[rsp+68]
add     rsp,50
pop     rdi
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     ecx,dword ptr ds:[rcx+3C]
sub     ecx,2
je      oglmdi2_vs2019.13F130D15
sub     ecx,1
je      oglmdi2_vs2019.13F130D1B
cmp     ecx,9
je      oglmdi2_vs2019.13F130D1B
cmp     dword ptr ds:[rbx+3C],D
je      oglmdi2_vs2019.13F130D5E
mov     al,byte ptr ds:[rbx+41]
sub     al,63
test    al,EF
setne   al
jmp     oglmdi2_vs2019.13F130D17
xor     al,al
test    al,al
je      oglmdi2_vs2019.13F130D5E
add     qword ptr ds:[rbx+20],8
mov     rdx,qword ptr ds:[rbx+460]
mov     rax,qword ptr ds:[rbx+20]
test    rdx,rdx
jne     oglmdi2_vs2019.13F130D3C
mov     r8d,200
lea     rdx,qword ptr ds:[rbx+58]
jmp     oglmdi2_vs2019.13F130D46
mov     r8,qword ptr ds:[rbx+458]
shr     r8,1
movzx   r9d,word ptr ds:[rax-8]
lea     rcx,qword ptr ds:[rbx+50]
call    oglmdi2_vs2019.13F135E18
test    eax,eax
je      oglmdi2_vs2019.13F130D86
mov     byte ptr ds:[rbx+40],1
jmp     oglmdi2_vs2019.13F130D86
lea     rax,qword ptr ds:[rbx+58]
mov     r8,qword ptr ds:[rax+408]
test    r8,r8
cmove   r8,rax
add     qword ptr ds:[rbx+20],8
mov     rcx,qword ptr ds:[rbx+20]
mov     dl,byte ptr ds:[rcx-8]
mov     byte ptr ds:[r8],dl
mov     dword ptr ds:[rbx+50],1
lea     rcx,qword ptr ds:[rbx+58]
mov     al,1
mov     rdx,qword ptr ds:[rcx+408]
test    rdx,rdx
cmove   rdx,rcx
mov     qword ptr ds:[rbx+48],rdx
add     rsp,20
pop     rbx
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r14
push    r15
sub     rsp,20
mov     r14d,edx
mov     rbx,rcx
mov     ecx,dword ptr ds:[rcx+3C]
mov     edx,4
mov     bpl,r8b
lea     r15d,dword ptr ds:[rdx+4]
cmp     ecx,5
jg      oglmdi2_vs2019.13F130E3B
je      oglmdi2_vs2019.13F130DF0
test    ecx,ecx
je      oglmdi2_vs2019.13F130E28
sub     ecx,1
je      oglmdi2_vs2019.13F130E34
sub     ecx,1
je      oglmdi2_vs2019.13F130E2D
sub     ecx,1
je      oglmdi2_vs2019.13F130E28
cmp     ecx,1
jne     oglmdi2_vs2019.13F130E4C
mov     rdi,r15
mov     rax,rdi
sub     rax,1
je      oglmdi2_vs2019.13F130EA2
sub     rax,1
je      oglmdi2_vs2019.13F130E83
sub     rax,2
je      oglmdi2_vs2019.13F130E66
cmp     rax,rdx
je      oglmdi2_vs2019.13F130E50
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     al,al
jmp     oglmdi2_vs2019.13F130F50
mov     rdi,rdx
jmp     oglmdi2_vs2019.13F130DF3
mov     edi,2
jmp     oglmdi2_vs2019.13F130DF3
mov     edi,1
jmp     oglmdi2_vs2019.13F130DF3
sub     ecx,6
je      oglmdi2_vs2019.13F130DF0
sub     ecx,1
je      oglmdi2_vs2019.13F130DF0
sub     ecx,2
je      oglmdi2_vs2019.13F130DF0
jmp     oglmdi2_vs2019.13F130DE6
xor     edi,edi
jmp     oglmdi2_vs2019.13F130DF3
mov     eax,dword ptr ds:[rbx+30]
add     qword ptr ds:[rbx+20],r15
shr     eax,4
test    al,1
mov     rax,qword ptr ds:[rbx+20]
mov     rsi,qword ptr ds:[rax-8]
jmp     oglmdi2_vs2019.13F130EBF
mov     eax,dword ptr ds:[rbx+30]
add     qword ptr ds:[rbx+20],r15
shr     eax,4
test    al,1
mov     rax,qword ptr ds:[rbx+20]
je      oglmdi2_vs2019.13F130E7E
movsxd  rsi,dword ptr ds:[rax-8]
jmp     oglmdi2_vs2019.13F130EBF
mov     esi,dword ptr ds:[rax-8]
jmp     oglmdi2_vs2019.13F130EBF
mov     eax,dword ptr ds:[rbx+30]
add     qword ptr ds:[rbx+20],r15
shr     eax,4
test    al,1
mov     rax,qword ptr ds:[rbx+20]
je      oglmdi2_vs2019.13F130E9C
movsx   rsi,word ptr ds:[rax-8]
jmp     oglmdi2_vs2019.13F130EBF
movzx   esi,word ptr ds:[rax-8]
jmp     oglmdi2_vs2019.13F130EBF
mov     eax,dword ptr ds:[rbx+30]
add     qword ptr ds:[rbx+20],r15
shr     eax,4
test    al,1
mov     rax,qword ptr ds:[rbx+20]
je      oglmdi2_vs2019.13F130EBB
movsx   rsi,byte ptr ds:[rax-8]
jmp     oglmdi2_vs2019.13F130EBF
movzx   esi,byte ptr ds:[rax-8]
mov     ecx,dword ptr ds:[rbx+30]
mov     eax,ecx
shr     eax,4
test    al,1
je      oglmdi2_vs2019.13F130ED9
test    rsi,rsi
jns     oglmdi2_vs2019.13F130ED9
neg     rsi
or      ecx,40
mov     dword ptr ds:[rbx+30],ecx
cmp     dword ptr ds:[rbx+38],0
jge     oglmdi2_vs2019.13F130EE8
mov     dword ptr ds:[rbx+38],1
jmp     oglmdi2_vs2019.13F130EFB
movsxd  rdx,dword ptr ds:[rbx+38]
and     ecx,FFFFFFF7
mov     dword ptr ds:[rbx+30],ecx
lea     rcx,qword ptr ds:[rbx+58]
call    oglmdi2_vs2019.13F12FF74
test    rsi,rsi
jne     oglmdi2_vs2019.13F130F04
and     dword ptr ds:[rbx+30],FFFFFFDF
mov     byte ptr ds:[rbx+54],0
mov     r9b,bpl
mov     r8d,r14d
mov     rcx,rbx
cmp     rdi,r15
jne     oglmdi2_vs2019.13F130F20
mov     rdx,rsi
call    oglmdi2_vs2019.13F1300A4
jmp     oglmdi2_vs2019.13F130F27
mov     edx,esi
call    oglmdi2_vs2019.13F13001C
mov     eax,dword ptr ds:[rbx+30]
shr     eax,7
test    al,1
je      oglmdi2_vs2019.13F130F4E
cmp     dword ptr ds:[rbx+50],0
je      oglmdi2_vs2019.13F130F40
mov     rcx,qword ptr ds:[rbx+48]
cmp     byte ptr ds:[rcx],30
je      oglmdi2_vs2019.13F130F4E
dec     qword ptr ds:[rbx+48]
mov     rcx,qword ptr ds:[rbx+48]
mov     byte ptr ds:[rcx],30
inc     dword ptr ds:[rbx+50]
mov     al,1
mov     rbx,qword ptr ss:[rsp+40]
mov     rbp,qword ptr ss:[rsp+48]
mov     rsi,qword ptr ss:[rsp+50]
add     rsp,20
pop     r15
pop     r14
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     ebx,8
mov     rdi,rcx
add     qword ptr ds:[rcx+20],rbx
mov     rax,qword ptr ds:[rcx+20]
mov     rsi,qword ptr ds:[rax-8]
call    oglmdi2_vs2019.13F137378
test    eax,eax
jne     oglmdi2_vs2019.13F130FAF
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     al,al
jmp     oglmdi2_vs2019.13F131037
mov     ecx,dword ptr ds:[rdi+3C]
mov     edx,4
cmp     ecx,5
jg      oglmdi2_vs2019.13F130FE8
je      oglmdi2_vs2019.13F130FFC
test    ecx,ecx
je      oglmdi2_vs2019.13F130FF9
sub     ecx,1
je      oglmdi2_vs2019.13F130FE1
sub     ecx,1
je      oglmdi2_vs2019.13F130FDA
sub     ecx,1
je      oglmdi2_vs2019.13F130FF9
cmp     ecx,1
je      oglmdi2_vs2019.13F130FFC
xor     ebx,ebx
jmp     oglmdi2_vs2019.13F130FFC
mov     ebx,2
jmp     oglmdi2_vs2019.13F130FFC
mov     ebx,1
jmp     oglmdi2_vs2019.13F130FFC
sub     ecx,6
je      oglmdi2_vs2019.13F130FFC
sub     ecx,1
je      oglmdi2_vs2019.13F130FFC
sub     ecx,2
je      oglmdi2_vs2019.13F130FFC
jmp     oglmdi2_vs2019.13F130FCC
mov     rbx,rdx
sub     rbx,1
je      oglmdi2_vs2019.13F13102C
sub     rbx,1
je      oglmdi2_vs2019.13F131023
sub     rbx,2
je      oglmdi2_vs2019.13F13101C
cmp     rbx,rdx
jne     oglmdi2_vs2019.13F130F98
movsxd  rax,dword ptr ds:[rdi+28]
mov     qword ptr ds:[rsi],rax
jmp     oglmdi2_vs2019.13F131031
mov     eax,dword ptr ds:[rdi+28]
mov     dword ptr ds:[rsi],eax
jmp     oglmdi2_vs2019.13F131031
movzx   eax,word ptr ds:[rdi+28]
mov     word ptr ds:[rsi],ax
jmp     oglmdi2_vs2019.13F131031
mov     cl,byte ptr ds:[rdi+28]
mov     byte ptr ds:[rsi],cl
mov     byte ptr ds:[rdi+40],1
mov     al,1
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
int3    
push    rbx
sub     rsp,20
add     qword ptr ds:[rcx+20],8
mov     rbx,rcx
mov     rax,qword ptr ds:[rcx+20]
mov     r8d,dword ptr ds:[rbx+38]
cmp     r8d,FFFFFFFF
mov     rcx,qword ptr ds:[rax-8]
mov     eax,7FFFFFFF
mov     edx,dword ptr ds:[rbx+3C]
cmove   r8d,eax
mov     qword ptr ds:[rbx+48],rcx
sub     edx,2
je      oglmdi2_vs2019.13F131097
sub     edx,1
je      oglmdi2_vs2019.13F13109D
cmp     edx,9
je      oglmdi2_vs2019.13F13109D
cmp     dword ptr ds:[rbx+3C],D
je      oglmdi2_vs2019.13F1310BB
mov     al,byte ptr ds:[rbx+41]
sub     al,63
test    al,EF
setne   al
jmp     oglmdi2_vs2019.13F131099
xor     al,al
test    al,al
je      oglmdi2_vs2019.13F1310BB
test    rcx,rcx
jne     oglmdi2_vs2019.13F1310AD
lea     rcx,qword ptr ds:[13F1422B0]
mov     qword ptr ds:[rbx+48],rcx
movsxd  rdx,r8d
mov     byte ptr ds:[rbx+54],1
call    oglmdi2_vs2019.13F135F7C
jmp     oglmdi2_vs2019.13F1310D3
test    rcx,rcx
jne     oglmdi2_vs2019.13F1310CB
lea     rcx,qword ptr ds:[13F1422C0]
mov     qword ptr ds:[rbx+48],rcx
movsxd  rdx,r8d
call    oglmdi2_vs2019.13F135E2C
mov     dword ptr ds:[rbx+50],eax
mov     al,1
add     rsp,20
pop     rbx
ret     
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,50
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+40],rax
cmp     byte ptr ds:[rcx+54],0
mov     rbx,rcx
je      oglmdi2_vs2019.13F131175
mov     eax,dword ptr ds:[rcx+50]
test    eax,eax
jle     oglmdi2_vs2019.13F131175
mov     rsi,qword ptr ds:[rcx+48]
xor     edi,edi
test    eax,eax
je      oglmdi2_vs2019.13F131196
movzx   r9d,word ptr ds:[rsi]
lea     rdx,qword ptr ss:[rsp+34]
and     dword ptr ss:[rsp+30],0
lea     rcx,qword ptr ss:[rsp+30]
mov     r8d,6
lea     rsi,qword ptr ds:[rsi+2]
call    oglmdi2_vs2019.13F135E18
test    eax,eax
jne     oglmdi2_vs2019.13F13116F
mov     r8d,dword ptr ss:[rsp+30]
test    r8d,r8d
je      oglmdi2_vs2019.13F13116F
lea     rax,qword ptr ds:[rbx+10]
lea     r9,qword ptr ds:[rbx+28]
mov     qword ptr ss:[rsp+20],rax
lea     rcx,qword ptr ds:[rbx+468]
lea     rdx,qword ptr ss:[rsp+34]
call    oglmdi2_vs2019.13F1311B8
inc     edi
cmp     edi,dword ptr ds:[rbx+50]
jne     oglmdi2_vs2019.13F131118
jmp     oglmdi2_vs2019.13F131196
or      dword ptr ds:[rbx+28],FFFFFFFF
jmp     oglmdi2_vs2019.13F131196
mov     r8d,dword ptr ds:[rbx+50]
lea     rax,qword ptr ds:[rcx+10]
mov     rdx,qword ptr ds:[rbx+48]
lea     r9,qword ptr ds:[rcx+28]
add     rcx,468
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F1311B8
mov     al,1
mov     rcx,qword ptr ss:[rsp+40]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
mov     rbx,qword ptr ss:[rsp+68]
mov     rsi,qword ptr ss:[rsp+70]
add     rsp,50
pop     rdi
ret     
int3    
int3    
int3    
test    r8d,r8d
je      oglmdi2_vs2019.13F13125A
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,20
mov     r14,rcx
movsxd  rdi,r8d
mov     rcx,qword ptr ds:[rcx]
mov     rbx,r9
mov     rax,qword ptr ds:[rcx+8]
cmp     qword ptr ds:[rcx+10],rax
jne     oglmdi2_vs2019.13F131201
cmp     byte ptr ds:[rcx+18],0
je      oglmdi2_vs2019.13F1311FB
add     dword ptr ds:[r9],edi
jmp     oglmdi2_vs2019.13F131240
or      dword ptr ds:[r9],FFFFFFFF
jmp     oglmdi2_vs2019.13F131240
sub     rax,qword ptr ds:[rcx+10]
mov     rsi,rdi
mov     rcx,qword ptr ds:[rcx]
cmp     rax,rdi
cmovb   rsi,rax
mov     r8,rsi
call    oglmdi2_vs2019.13F12DE70
mov     rax,qword ptr ds:[r14]
add     qword ptr ds:[rax],rsi
mov     rax,qword ptr ds:[r14]
add     qword ptr ds:[rax+10],rsi
mov     rax,qword ptr ds:[r14]
cmp     byte ptr ds:[rax+18],0
je      oglmdi2_vs2019.13F131234
add     dword ptr ds:[rbx],edi
jmp     oglmdi2_vs2019.13F131240
cmp     rsi,rdi
je      oglmdi2_vs2019.13F13123E
or      dword ptr ds:[rbx],FFFFFFFF
jmp     oglmdi2_vs2019.13F131240
add     dword ptr ds:[rbx],esi
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
mov     rdi,qword ptr ss:[rsp+48]
add     rsp,20
pop     r14
ret     
int3    
jmp     oglmdi2_vs2019.13F12FDA8
int3    
int3    
int3    
movsd   qword ptr ss:[rsp+8],xmm0
sub     rsp,58
movabs  rcx,7FF0000000000000
movsd   qword ptr ss:[rsp+68],xmm0
mov     rdx,qword ptr ss:[rsp+68]
mov     rax,rdx
and     rax,rcx
cmp     rax,rcx
jne     oglmdi2_vs2019.13F1312FA
movabs  rax,FFFFFFFFFFFFF
test    rax,rdx
je      oglmdi2_vs2019.13F1312A9
mov     rcx,rdx
add     rsp,58
jmp     oglmdi2_vs2019.13F135AAC
test    rdx,rdx
jns     oglmdi2_vs2019.13F1312FA
movsd   xmm1,qword ptr ss:[rsp+60]
lea     rcx,qword ptr ds:[13F1422C8]
mov     r9d,1
xorps   xmm0,xmm0
mov     dword ptr ss:[rsp+40],r9d
movabs  r8,FFF8000000000000
movsd   qword ptr ss:[rsp+38],xmm0
movsd   qword ptr ss:[rsp+30],xmm1
mov     dword ptr ss:[rsp+28],21
lea     edx,dword ptr ds:[r9+4]
mov     dword ptr ss:[rsp+20],8
call    oglmdi2_vs2019.13F135850
jmp     oglmdi2_vs2019.13F131328
movabs  rax,7FFFFFFFFFFFFFFF
test    rax,rdx
setne   cl
bt      rdx,3F
setb    al
test    al,cl
jne     oglmdi2_vs2019.13F1312AE
sqrtsd  xmm2,qword ptr ss:[rsp+60]
movsd   qword ptr ss:[rsp+70],xmm2
movsd   xmm0,qword ptr ss:[rsp+70]
add     rsp,58
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
xor     ebx,ebx
lea     rdx,qword ptr ds:[13F14D900]
xor     r8d,r8d
lea     rcx,qword ptr ds:[rbx+rbx*4]
lea     rcx,qword ptr ds:[rdx+rcx*8]
mov     edx,FA0
call    oglmdi2_vs2019.13F133518
test    eax,eax
je      oglmdi2_vs2019.13F131369
inc     dword ptr ds:[13F14DB30]
inc     ebx
cmp     ebx,E
jb      oglmdi2_vs2019.13F131338
mov     al,1
jmp     oglmdi2_vs2019.13F131372
xor     ecx,ecx
call    oglmdi2_vs2019.13F131394
xor     al,al
add     rsp,20
pop     rbx
ret     
movsxd  rax,ecx
lea     rcx,qword ptr ds:[rax+rax*4]
lea     rax,qword ptr ds:[13F14D900]
lea     rcx,qword ptr ds:[rax+rcx*8]
jmp     qword ptr ds:[<&RtlEnterCriticalSection>]
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     ebx,dword ptr ds:[13F14DB30]
jmp     oglmdi2_vs2019.13F1313BF
lea     rax,qword ptr ds:[13F14D900]
dec     ebx
lea     rcx,qword ptr ds:[rbx+rbx*4]
lea     rcx,qword ptr ds:[rax+rcx*8]
call    qword ptr ds:[<&RtlDeleteCriticalSection>]
dec     dword ptr ds:[13F14DB30]
test    ebx,ebx
jne     oglmdi2_vs2019.13F1313A2
mov     al,1
add     rsp,20
pop     rbx
ret     
int3    
movsxd  rax,ecx
lea     rcx,qword ptr ds:[rax+rax*4]
lea     rax,qword ptr ds:[13F14D900]
lea     rcx,qword ptr ds:[rax+rcx*8]
jmp     qword ptr ds:[<&RtlLeaveCriticalSection>]
int3    
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F1364CC
mov     rax,qword ptr ds:[rax+18]
test    rax,rax
je      oglmdi2_vs2019.13F131402
call    qword ptr ds:[13F140490]
jmp     oglmdi2_vs2019.13F131402
call    oglmdi2_vs2019.13F132878
nop     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
mov     rsi,rdx
mov     edi,ecx
call    oglmdi2_vs2019.13F136648
xor     r9d,r9d
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F131573
mov     rcx,qword ptr ds:[rax]
mov     rax,rcx
lea     r8,qword ptr ds:[rcx+C0]
cmp     rcx,r8
je      oglmdi2_vs2019.13F131454
cmp     dword ptr ds:[rax],edi
je      oglmdi2_vs2019.13F131457
add     rax,10
cmp     rax,r8
jne     oglmdi2_vs2019.13F131447
mov     rax,r9
test    rax,rax
je      oglmdi2_vs2019.13F131573
mov     r8,qword ptr ds:[rax+8]
test    r8,r8
je      oglmdi2_vs2019.13F131573
cmp     r8,5
jne     oglmdi2_vs2019.13F131480
mov     qword ptr ds:[rax+8],r9
lea     eax,dword ptr ds:[r8-4]
jmp     oglmdi2_vs2019.13F131575
cmp     r8,1
jne     oglmdi2_vs2019.13F13148E
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F131575
mov     rbp,qword ptr ds:[rbx+8]
mov     qword ptr ds:[rbx+8],rsi
cmp     dword ptr ds:[rax+4],8
jne     oglmdi2_vs2019.13F13155A
add     rcx,30
lea     rdx,qword ptr ds:[rcx+90]
jmp     oglmdi2_vs2019.13F1314B5
mov     qword ptr ds:[rcx+8],r9
add     rcx,10
cmp     rcx,rdx
jne     oglmdi2_vs2019.13F1314AD
cmp     dword ptr ds:[rax],C000008D
mov     edi,dword ptr ds:[rbx+10]
je      oglmdi2_vs2019.13F13153F
cmp     dword ptr ds:[rax],C000008E
je      oglmdi2_vs2019.13F131538
cmp     dword ptr ds:[rax],C000008F
je      oglmdi2_vs2019.13F131531
cmp     dword ptr ds:[rax],C0000090
je      oglmdi2_vs2019.13F13152A
cmp     dword ptr ds:[rax],C0000091
je      oglmdi2_vs2019.13F131523
cmp     dword ptr ds:[rax],C0000092
je      oglmdi2_vs2019.13F13151C
cmp     dword ptr ds:[rax],C0000093
je      oglmdi2_vs2019.13F131515
cmp     dword ptr ds:[rax],C00002B4
je      oglmdi2_vs2019.13F13150E
cmp     dword ptr ds:[rax],C00002B5
mov     edx,edi
jne     oglmdi2_vs2019.13F131547
mov     edx,8D
jmp     oglmdi2_vs2019.13F131544
mov     edx,8E
jmp     oglmdi2_vs2019.13F131544
mov     edx,85
jmp     oglmdi2_vs2019.13F131544
mov     edx,8A
jmp     oglmdi2_vs2019.13F131544
mov     edx,84
jmp     oglmdi2_vs2019.13F131544
mov     edx,81
jmp     oglmdi2_vs2019.13F131544
mov     edx,86
jmp     oglmdi2_vs2019.13F131544
mov     edx,83
jmp     oglmdi2_vs2019.13F131544
mov     edx,82
mov     dword ptr ds:[rbx+10],edx
mov     ecx,8
mov     rax,r8
call    qword ptr ds:[13F140490]
mov     dword ptr ds:[rbx+10],edi
jmp     oglmdi2_vs2019.13F13156A
mov     ecx,dword ptr ds:[rax+4]
mov     qword ptr ds:[rax+8],r9
mov     rax,r8
call    qword ptr ds:[13F140490]
mov     qword ptr ds:[rbx+8],rbp
jmp     oglmdi2_vs2019.13F131486
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
int3    
int3    
mov     eax,dword ptr ds:[13F14DB34]
ret     
int3    
mov     dword ptr ds:[13F14DB34],ecx
ret     
int3    
mov     rdx,qword ptr ds:[13F14C058]
mov     ecx,edx
xor     rdx,qword ptr ds:[13F14DB38]
and     ecx,3F
ror     rdx,cl
test    rdx,rdx
setne   al
ret     
int3    
int3    
int3    
mov     qword ptr ds:[13F14DB38],rcx
ret     
mov     rdx,qword ptr ds:[13F14C058]
mov     r8,rcx
mov     ecx,edx
xor     rdx,qword ptr ds:[13F14DB38]
and     ecx,3F
ror     rdx,cl
test    rdx,rdx
jne     oglmdi2_vs2019.13F1315E5
xor     eax,eax
ret     
mov     rcx,r8
mov     rax,rdx
jmp     qword ptr ds:[13F140490]
int3    
int3    
mov     r8,qword ptr ds:[13F14C058]
mov     r9,rcx
mov     edx,r8d
mov     ecx,40
and     edx,3F
sub     ecx,edx
ror     r9,cl
xor     r9,r8
mov     qword ptr ds:[13F14DB38],r9
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r12
push    r14
push    r15
sub     rsp,20
mov     r15,qword ptr ss:[rsp+60]
mov     r12,r9
mov     rbx,r8
mov     r14,rdx
mov     rdi,rcx
and     qword ptr ds:[r15],0
mov     qword ptr ds:[r9],1
test    rdx,rdx
je      oglmdi2_vs2019.13F131661
mov     qword ptr ds:[rdx],rbx
add     r14,8
xor     bpl,bpl
cmp     byte ptr ds:[rdi],22
jne     oglmdi2_vs2019.13F131678
test    bpl,bpl
mov     sil,22
sete    bpl
inc     rdi
jmp     oglmdi2_vs2019.13F1316AF
inc     qword ptr ds:[r15]
test    rbx,rbx
je      oglmdi2_vs2019.13F131687
mov     al,byte ptr ds:[rdi]
mov     byte ptr ds:[rbx],al
inc     rbx
movsx   esi,byte ptr ds:[rdi]
inc     rdi
mov     ecx,esi
call    oglmdi2_vs2019.13F138A64
test    eax,eax
je      oglmdi2_vs2019.13F1316AA
inc     qword ptr ds:[r15]
test    rbx,rbx
je      oglmdi2_vs2019.13F1316A7
mov     al,byte ptr ds:[rdi]
mov     byte ptr ds:[rbx],al
inc     rbx
inc     rdi
test    sil,sil
je      oglmdi2_vs2019.13F1316CB
test    bpl,bpl
jne     oglmdi2_vs2019.13F131664
cmp     sil,20
je      oglmdi2_vs2019.13F1316C0
cmp     sil,9
jne     oglmdi2_vs2019.13F131664
test    rbx,rbx
je      oglmdi2_vs2019.13F1316CE
mov     byte ptr ds:[rbx-1],0
jmp     oglmdi2_vs2019.13F1316CE
dec     rdi
xor     sil,sil
mov     al,byte ptr ds:[rdi]
test    al,al
je      oglmdi2_vs2019.13F1317B3
cmp     al,20
je      oglmdi2_vs2019.13F1316E3
cmp     al,9
jne     oglmdi2_vs2019.13F1316EA
inc     rdi
mov     al,byte ptr ds:[rdi]
jmp     oglmdi2_vs2019.13F1316DB
test    al,al
je      oglmdi2_vs2019.13F1317B3
test    r14,r14
je      oglmdi2_vs2019.13F1316FE
mov     qword ptr ds:[r14],rbx
add     r14,8
inc     qword ptr ds:[r12]
mov     edx,1
xor     eax,eax
jmp     oglmdi2_vs2019.13F131710
inc     rdi
inc     eax
mov     cl,byte ptr ds:[rdi]
cmp     cl,5C
je      oglmdi2_vs2019.13F13170B
cmp     cl,22
jne     oglmdi2_vs2019.13F131750
test    dl,al
jne     oglmdi2_vs2019.13F13173C
test    sil,sil
je      oglmdi2_vs2019.13F131733
lea     rcx,qword ptr ds:[rdi+1]
cmp     byte ptr ds:[rcx],22
jne     oglmdi2_vs2019.13F131733
mov     rdi,rcx
jmp     oglmdi2_vs2019.13F13173C
xor     edx,edx
test    sil,sil
sete    sil
shr     eax,1
jmp     oglmdi2_vs2019.13F131750
dec     eax
test    rbx,rbx
je      oglmdi2_vs2019.13F13174D
mov     byte ptr ds:[rbx],5C
inc     rbx
inc     qword ptr ds:[r15]
test    eax,eax
jne     oglmdi2_vs2019.13F131740
mov     al,byte ptr ds:[rdi]
test    al,al
je      oglmdi2_vs2019.13F1317A0
test    sil,sil
jne     oglmdi2_vs2019.13F131767
cmp     al,20
je      oglmdi2_vs2019.13F1317A0
cmp     al,9
je      oglmdi2_vs2019.13F1317A0
test    edx,edx
je      oglmdi2_vs2019.13F131798
test    rbx,rbx
je      oglmdi2_vs2019.13F131777
mov     byte ptr ds:[rbx],al
inc     rbx
mov     al,byte ptr ds:[rdi]
movsx   ecx,al
call    oglmdi2_vs2019.13F138A64
test    eax,eax
je      oglmdi2_vs2019.13F131795
inc     qword ptr ds:[r15]
inc     rdi
test    rbx,rbx
je      oglmdi2_vs2019.13F131795
mov     al,byte ptr ds:[rdi]
mov     byte ptr ds:[rbx],al
inc     rbx
inc     qword ptr ds:[r15]
inc     rdi
jmp     oglmdi2_vs2019.13F131702
test    rbx,rbx
je      oglmdi2_vs2019.13F1317AB
mov     byte ptr ds:[rbx],0
inc     rbx
inc     qword ptr ds:[r15]
jmp     oglmdi2_vs2019.13F1316D1
test    r14,r14
je      oglmdi2_vs2019.13F1317BC
and     qword ptr ds:[r14],0
inc     qword ptr ds:[r12]
mov     rbx,qword ptr ss:[rsp+40]
mov     rbp,qword ptr ss:[rsp+48]
mov     rsi,qword ptr ss:[rsp+50]
mov     rdi,qword ptr ss:[rsp+58]
add     rsp,20
pop     r15
pop     r14
pop     r12
ret     
int3    
push    rbx
sub     rsp,20
movabs  rax,1FFFFFFFFFFFFFFF
mov     r9,rdx
cmp     rcx,rax
jae     oglmdi2_vs2019.13F131835
xor     edx,edx
or      rax,FFFFFFFFFFFFFFFF
div     r8
cmp     r9,rax
jae     oglmdi2_vs2019.13F131835
shl     rcx,3
imul    r9,r8
mov     rax,rcx
not     rax
cmp     rax,r9
jbe     oglmdi2_vs2019.13F131835
add     rcx,r9
mov     edx,1
call    oglmdi2_vs2019.13F1330D0
xor     ecx,ecx
mov     rbx,rax
call    oglmdi2_vs2019.13F133148
mov     rax,rbx
jmp     oglmdi2_vs2019.13F131837
xor     eax,eax
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rbp
push    rsi
push    rdi
push    r14
push    r15
mov     rbp,rsp
sub     rsp,30
xor     edi,edi
mov     r14d,ecx
test    ecx,ecx
je      oglmdi2_vs2019.13F1319B3
lea     eax,dword ptr ds:[rcx-1]
cmp     eax,1
jbe     oglmdi2_vs2019.13F13187E
call    oglmdi2_vs2019.13F1330B0
lea     ebx,dword ptr ds:[rdi+16]
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     edi,ebx
jmp     oglmdi2_vs2019.13F1319B3
call    oglmdi2_vs2019.13F1386B4
lea     rbx,qword ptr ds:[13F14DB40]
mov     r8d,104
mov     rdx,rbx
xor     ecx,ecx
call    oglmdi2_vs2019.13F137E68
mov     rsi,qword ptr ds:[13F14E2F8]
mov     qword ptr ds:[13F14E2D8],rbx
test    rsi,rsi
je      oglmdi2_vs2019.13F1318B2
cmp     byte ptr ds:[rsi],dil
jne     oglmdi2_vs2019.13F1318B5
mov     rsi,rbx
lea     rax,qword ptr ss:[rbp+48]
mov     qword ptr ss:[rbp+40],rdi
lea     r9,qword ptr ss:[rbp+40]
mov     qword ptr ss:[rsp+20],rax
xor     r8d,r8d
mov     qword ptr ss:[rbp+48],rdi
xor     edx,edx
mov     rcx,rsi
call    oglmdi2_vs2019.13F13161C
mov     r15,qword ptr ss:[rbp+40]
mov     r8d,1
mov     rdx,qword ptr ss:[rbp+48]
mov     rcx,r15
call    oglmdi2_vs2019.13F1317E0
mov     rbx,rax
test    rax,rax
jne     oglmdi2_vs2019.13F13190D
call    oglmdi2_vs2019.13F1330B0
mov     ebx,C
xor     ecx,ecx
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F131877
lea     r8,qword ptr ds:[rax+r15*8]
mov     rdx,rbx
lea     rax,qword ptr ss:[rbp+48]
mov     rcx,rsi
lea     r9,qword ptr ss:[rbp+40]
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F13161C
cmp     r14d,1
jne     oglmdi2_vs2019.13F131945
mov     eax,dword ptr ss:[rbp+40]
dec     eax
mov     qword ptr ds:[13F14E2E8],rbx
mov     dword ptr ds:[13F14E2E0],eax
xor     ecx,ecx
jmp     oglmdi2_vs2019.13F1319AE
lea     rdx,qword ptr ss:[rbp+38]
mov     qword ptr ss:[rbp+38],rdi
mov     rcx,rbx
call    oglmdi2_vs2019.13F137D4C
mov     esi,eax
test    eax,eax
je      oglmdi2_vs2019.13F131974
mov     rcx,qword ptr ss:[rbp+38]
call    oglmdi2_vs2019.13F133148
mov     rcx,rbx
mov     qword ptr ss:[rbp+38],rdi
call    oglmdi2_vs2019.13F133148
mov     edi,esi
jmp     oglmdi2_vs2019.13F1319B3
mov     rdx,qword ptr ss:[rbp+38]
mov     rcx,rdi
mov     rax,rdx
cmp     qword ptr ds:[rdx],rdi
je      oglmdi2_vs2019.13F13198F
lea     rax,qword ptr ds:[rax+8]
inc     rcx
cmp     qword ptr ds:[rax],rdi
jne     oglmdi2_vs2019.13F131983
mov     dword ptr ds:[13F14E2E0],ecx
xor     ecx,ecx
mov     qword ptr ss:[rbp+38],rdi
mov     qword ptr ds:[13F14E2E8],rdx
call    oglmdi2_vs2019.13F133148
mov     rcx,rbx
mov     qword ptr ss:[rbp+38],rdi
call    oglmdi2_vs2019.13F133148
mov     rbx,qword ptr ss:[rsp+60]
mov     eax,edi
add     rsp,30
pop     r15
pop     r14
pop     rdi
pop     rsi
pop     rbp
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
xor     edi,edi
cmp     qword ptr ds:[13F14DC48],rdi
je      oglmdi2_vs2019.13F1319E1
xor     eax,eax
jmp     oglmdi2_vs2019.13F131A29
call    oglmdi2_vs2019.13F1386B4
call    oglmdi2_vs2019.13F138B94
mov     rbx,rax
test    rax,rax
jne     oglmdi2_vs2019.13F1319F8
or      edi,FFFFFFFF
jmp     oglmdi2_vs2019.13F131A1F
mov     rcx,rbx
call    oglmdi2_vs2019.13F131A34
test    rax,rax
jne     oglmdi2_vs2019.13F131A0A
or      edi,FFFFFFFF
jmp     oglmdi2_vs2019.13F131A18
mov     qword ptr ds:[13F14DC60],rax
mov     qword ptr ds:[13F14DC48],rax
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
mov     eax,edi
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r14
push    r15
sub     rsp,30
mov     r14,rcx
xor     esi,esi
mov     ecx,esi
mov     r8,r14
mov     dl,byte ptr ds:[r14]
jmp     oglmdi2_vs2019.13F131A7F
cmp     dl,3D
lea     rax,qword ptr ds:[rcx+1]
cmove   rax,rcx
mov     rcx,rax
or      rax,FFFFFFFFFFFFFFFF
inc     rax
cmp     byte ptr ds:[r8+rax],sil
jne     oglmdi2_vs2019.13F131A6D
inc     r8
add     r8,rax
mov     dl,byte ptr ds:[r8]
test    dl,dl
jne     oglmdi2_vs2019.13F131A5B
inc     rcx
mov     edx,8
call    oglmdi2_vs2019.13F1330D0
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F131B04
mov     r15,rax
mov     al,byte ptr ds:[r14]
test    al,al
je      oglmdi2_vs2019.13F131B01
or      rbp,FFFFFFFFFFFFFFFF
inc     rbp
cmp     byte ptr ds:[r14+rbp],sil
jne     oglmdi2_vs2019.13F131AA6
inc     rbp
cmp     al,3D
je      oglmdi2_vs2019.13F131AEB
mov     edx,1
mov     rcx,rbp
call    oglmdi2_vs2019.13F1330D0
mov     rdi,rax
test    rax,rax
je      oglmdi2_vs2019.13F131AF0
mov     r8,r14
mov     rdx,rbp
mov     rcx,rax
call    oglmdi2_vs2019.13F1328D0
xor     ecx,ecx
test    eax,eax
jne     oglmdi2_vs2019.13F131B27
mov     qword ptr ds:[r15],rdi
add     r15,8
call    oglmdi2_vs2019.13F133148
add     r14,rbp
jmp     oglmdi2_vs2019.13F131A9B
mov     rcx,rbx
call    oglmdi2_vs2019.13F131B3C
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F131B04
mov     rsi,rbx
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     rbx,qword ptr ss:[rsp+50]
mov     rax,rsi
mov     rsi,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+58]
add     rsp,30
pop     r15
pop     r14
pop     rdi
ret     
xor     r9d,r9d
mov     qword ptr ss:[rsp+20],rsi
xor     r8d,r8d
xor     edx,edx
call    oglmdi2_vs2019.13F132FB0
int3    
int3    
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F131B7C
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rax,qword ptr ds:[rcx]
mov     rbx,rcx
mov     rdi,rcx
jmp     oglmdi2_vs2019.13F131B65
mov     rcx,rax
call    oglmdi2_vs2019.13F133148
lea     rdi,qword ptr ds:[rdi+8]
mov     rax,qword ptr ds:[rdi]
test    rax,rax
jne     oglmdi2_vs2019.13F131B56
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
sub     rsp,28
mov     rcx,qword ptr ds:[rcx]
cmp     rcx,qword ptr ds:[13F14DC60]
je      oglmdi2_vs2019.13F131B95
call    oglmdi2_vs2019.13F131B3C
add     rsp,28
ret     
int3    
int3    
sub     rsp,28
mov     rcx,qword ptr ds:[rcx]
cmp     rcx,qword ptr ds:[13F14DC58]
je      oglmdi2_vs2019.13F131BB1
call    oglmdi2_vs2019.13F131B3C
add     rsp,28
ret     
int3    
int3    
sub     rsp,28
lea     rcx,qword ptr ds:[13F14DC48]
call    oglmdi2_vs2019.13F131B80
lea     rcx,qword ptr ds:[13F14DC50]
call    oglmdi2_vs2019.13F131B9C
mov     rcx,qword ptr ds:[13F14DC60]
call    oglmdi2_vs2019.13F131B3C
mov     rcx,qword ptr ds:[13F14DC58]
add     rsp,28
jmp     oglmdi2_vs2019.13F131B3C
jmp     oglmdi2_vs2019.13F1319C8
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
call    oglmdi2_vs2019.13F1386B4
mov     rax,qword ptr ds:[13F14E2F8]
lea     rbx,qword ptr ds:[13F14DC68]
test    rax,rax
cmovne  rbx,rax
xor     dil,dil
mov     al,byte ptr ds:[rbx]
cmp     al,20
ja      oglmdi2_vs2019.13F131C2E
test    al,al
je      oglmdi2_vs2019.13F131C5A
test    dil,dil
je      oglmdi2_vs2019.13F131C4D
cmp     al,22
jne     oglmdi2_vs2019.13F131C39
test    dil,dil
sete    dil
movzx   ecx,al
call    oglmdi2_vs2019.13F138A64
test    eax,eax
je      oglmdi2_vs2019.13F131C48
inc     rbx
inc     rbx
jmp     oglmdi2_vs2019.13F131C1F
cmp     al,20
ja      oglmdi2_vs2019.13F131C5A
inc     rbx
mov     al,byte ptr ds:[rbx]
test    al,al
jne     oglmdi2_vs2019.13F131C4D
mov     rax,rbx
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
xor     ebp,ebp
mov     rdi,rdx
sub     rdi,rcx
mov     rbx,rcx
add     rdi,7
mov     esi,ebp
shr     rdi,3
cmp     rcx,rdx
cmova   rdi,rbp
test    rdi,rdi
je      oglmdi2_vs2019.13F131CB7
mov     rax,qword ptr ds:[rbx]
test    rax,rax
je      oglmdi2_vs2019.13F131CAB
call    qword ptr ds:[13F140490]
add     rbx,8
inc     rsi
cmp     rsi,rdi
jne     oglmdi2_vs2019.13F131C9D
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rdi,rdx
mov     rbx,rcx
cmp     rcx,rdx
je      oglmdi2_vs2019.13F131CFC
mov     rax,qword ptr ds:[rbx]
test    rax,rax
je      oglmdi2_vs2019.13F131CF3
call    qword ptr ds:[13F140490]
test    eax,eax
jne     oglmdi2_vs2019.13F131CFE
add     rbx,8
cmp     rbx,rdi
jmp     oglmdi2_vs2019.13F131CDF
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rbx,r9
mov     rdi,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rcx,rdi
call    oglmdi2_vs2019.13F131D44
nop     
mov     ecx,dword ptr ds:[rbx]
call    oglmdi2_vs2019.13F1313CC
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
push    rbx
sub     rsp,20
mov     rbx,rcx
cmp     byte ptr ds:[13F14DC78],0
jne     oglmdi2_vs2019.13F131DF9
mov     eax,1
xchg    dword ptr ds:[13F14DC6C],eax
mov     rax,qword ptr ds:[rcx]
mov     ecx,dword ptr ds:[rax]
test    ecx,ecx
jne     oglmdi2_vs2019.13F131DA2
mov     rax,qword ptr ds:[13F14C058]
mov     ecx,eax
and     ecx,3F
mov     rdx,qword ptr ds:[13F14DC70]
cmp     rdx,rax
je      oglmdi2_vs2019.13F131D99
xor     rax,rdx
ror     rax,cl
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    qword ptr ds:[13F140490]
lea     rcx,qword ptr ds:[13F14DC88]
jmp     oglmdi2_vs2019.13F131DAE
cmp     ecx,1
jne     oglmdi2_vs2019.13F131DB4
lea     rcx,qword ptr ds:[13F14DCA0]
call    oglmdi2_vs2019.13F1325E8
nop     
mov     rax,qword ptr ds:[rbx]
cmp     dword ptr ds:[rax],0
jne     oglmdi2_vs2019.13F131DCF
lea     rdx,qword ptr ds:[13F140548]
lea     rcx,qword ptr ds:[13F140528]
call    oglmdi2_vs2019.13F131C68
lea     rdx,qword ptr ds:[13F140558]
lea     rcx,qword ptr ds:[13F140550]
call    oglmdi2_vs2019.13F131C68
mov     rax,qword ptr ds:[rbx+8]
cmp     dword ptr ds:[rax],0
jne     oglmdi2_vs2019.13F131DF9
mov     byte ptr ds:[13F14DC78],1
mov     rax,qword ptr ds:[rbx+10]
mov     byte ptr ds:[rax],1
add     rsp,20
pop     rbx
ret     
call    oglmdi2_vs2019.13F1313E8
nop     
int3    
int3    
int3    
xor     eax,eax
cmp     ecx,E06D7363
sete    al
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     dword ptr ss:[rsp+18],r8d
mov     dword ptr ss:[rsp+10],edx
push    rbp
mov     rbp,rsp
sub     rsp,50
mov     ebx,ecx
test    r8d,r8d
jne     oglmdi2_vs2019.13F131E7B
xor     ecx,ecx
call    qword ptr ds:[<&GetModuleHandleW>]
test    rax,rax
je      oglmdi2_vs2019.13F131E7B
mov     ecx,5A4D
cmp     word ptr ds:[rax],cx
jne     oglmdi2_vs2019.13F131E7B
movsxd  rcx,dword ptr ds:[rax+3C]
add     rcx,rax
cmp     dword ptr ds:[rcx],4550
jne     oglmdi2_vs2019.13F131E7B
mov     eax,20B
cmp     word ptr ds:[rcx+18],ax
jne     oglmdi2_vs2019.13F131E7B
cmp     dword ptr ds:[rcx+84],E
jbe     oglmdi2_vs2019.13F131E7B
cmp     dword ptr ds:[rcx+F8],0
je      oglmdi2_vs2019.13F131E7B
mov     ecx,ebx
call    oglmdi2_vs2019.13F131F1C
lea     rax,qword ptr ss:[rbp+18]
mov     byte ptr ss:[rbp+28],0
mov     qword ptr ss:[rbp-20],rax
lea     r9,qword ptr ss:[rbp-2C]
lea     rax,qword ptr ss:[rbp+20]
mov     qword ptr ss:[rbp-18],rax
lea     r8,qword ptr ss:[rbp-20]
lea     rax,qword ptr ss:[rbp+28]
mov     qword ptr ss:[rbp-10],rax
lea     rdx,qword ptr ss:[rbp-28]
mov     eax,2
lea     rcx,qword ptr ss:[rbp-30]
mov     dword ptr ss:[rbp-2C],eax
mov     dword ptr ss:[rbp-28],eax
call    oglmdi2_vs2019.13F131D0C
cmp     dword ptr ss:[rbp+20],0
je      oglmdi2_vs2019.13F131EC8
mov     rbx,qword ptr ss:[rsp+60]
add     rsp,50
pop     rbp
ret     
mov     ecx,ebx
call    oglmdi2_vs2019.13F131ED0
int3    
push    rbx
sub     rsp,20
mov     ebx,ecx
call    oglmdi2_vs2019.13F138C98
cmp     eax,1
je      oglmdi2_vs2019.13F131F0A
mov     rax,qword ptr gs:[60]
mov     edx,dword ptr ds:[rax+BC]
shr     edx,8
test    dl,1
jne     oglmdi2_vs2019.13F131F0A
call    qword ptr ds:[<&GetCurrentProcess>]
mov     rcx,rax
mov     edx,ebx
call    qword ptr ds:[<&TerminateProcess>]
mov     ecx,ebx
call    oglmdi2_vs2019.13F131F1C
mov     ecx,ebx
call    qword ptr ds:[<&RtlExitUserProcess>]
int3    
int3    
int3    
push    rbx
sub     rsp,20
and     qword ptr ss:[rsp+38],0
lea     r8,qword ptr ss:[rsp+38]
mov     ebx,ecx
lea     rdx,qword ptr ds:[13F1423A8]
xor     ecx,ecx
call    qword ptr ds:[<&GetModuleHandleExW>]
test    eax,eax
je      oglmdi2_vs2019.13F131F61
mov     rcx,qword ptr ss:[rsp+38]
lea     rdx,qword ptr ds:[13F1423C0]
call    qword ptr ds:[<&GetProcAddress>]
test    rax,rax
je      oglmdi2_vs2019.13F131F61
mov     ecx,ebx
call    qword ptr ds:[13F140490]
mov     rcx,qword ptr ss:[rsp+38]
test    rcx,rcx
je      oglmdi2_vs2019.13F131F71
call    qword ptr ds:[<&FreeLibrary>]
add     rsp,20
pop     rbx
ret     
int3    
mov     qword ptr ds:[13F14DC70],rcx
ret     
mov     edx,2
xor     ecx,ecx
lea     r8d,dword ptr ds:[rdx-1]
jmp     oglmdi2_vs2019.13F131E14
xor     edx,edx
xor     ecx,ecx
lea     r8d,dword ptr ds:[rdx+1]
jmp     oglmdi2_vs2019.13F131E14
int3    
int3    
int3    
xor     r8d,r8d
lea     edx,dword ptr ds:[r8+2]
jmp     oglmdi2_vs2019.13F131E14
sub     rsp,28
mov     r8,qword ptr ds:[13F14C058]
mov     rdx,rcx
mov     eax,r8d
mov     ecx,40
and     eax,3F
sub     ecx,eax
cmp     qword ptr ds:[13F14DC70],r8
jne     oglmdi2_vs2019.13F131FE2
ror     rdx,cl
xor     rdx,r8
mov     qword ptr ds:[13F14DC70],rdx
add     rsp,28
ret     
call    oglmdi2_vs2019.13F1313E8
int3    
xor     r8d,r8d
xor     edx,edx
jmp     oglmdi2_vs2019.13F131E14
int3    
int3    
sub     rsp,28
test    rcx,rcx
jne     oglmdi2_vs2019.13F132014
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     eax,16
jmp     oglmdi2_vs2019.13F13201E
mov     eax,dword ptr ds:[13F14E308]
mov     dword ptr ds:[rcx],eax
xor     eax,eax
add     rsp,28
ret     
int3    
sub     rsp,28
lea     eax,dword ptr ds:[rcx-4000]
test    eax,FFFF3FFF
jne     oglmdi2_vs2019.13F132047
cmp     ecx,C000
je      oglmdi2_vs2019.13F132047
xchg    dword ptr ds:[13F14E308],ecx
xor     eax,eax
jmp     oglmdi2_vs2019.13F13205C
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     eax,16
add     rsp,28
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rdi
mov     qword ptr ss:[rsp+18],r14
movsxd  rax,ecx
lea     rdi,qword ptr ds:[13F14DE80]
mov     r10,rax
mov     r14d,40000
sar     r10,6
and     eax,3F
mov     r9,qword ptr ds:[rdi+r10*8]
lea     r8,qword ptr ds:[rax+rax*8]
movzx   ecx,byte ptr ds:[r9+r8*8+38]
mov     r11b,byte ptr ds:[r9+r8*8+39]
mov     ebx,ecx
and     ebx,80
cmp     edx,4000
je      oglmdi2_vs2019.13F1320FC
cmp     edx,8000
je      oglmdi2_vs2019.13F1320F2
lea     eax,dword ptr ds:[rdx-10000]
test    eax,FFFEFFFF
je      oglmdi2_vs2019.13F1320DE
cmp     edx,r14d
jne     oglmdi2_vs2019.13F13210E
or      cl,80
mov     byte ptr ds:[r9+r8*8+38],cl
mov     rax,qword ptr ds:[rdi+r10*8]
mov     byte ptr ds:[rax+r8*8+39],1
jmp     oglmdi2_vs2019.13F13210E
or      cl,80
mov     byte ptr ds:[r9+r8*8+38],cl
mov     rax,qword ptr ds:[rdi+r10*8]
mov     byte ptr ds:[rax+r8*8+39],2
jmp     oglmdi2_vs2019.13F13210E
and     cl,7F
mov     byte ptr ds:[r9+r8*8+38],cl
jmp     oglmdi2_vs2019.13F13210E
or      cl,80
mov     byte ptr ds:[r9+r8*8+38],cl
mov     rcx,qword ptr ds:[rdi+r10*8]
mov     byte ptr ds:[rcx+r8*8+39],0
test    ebx,ebx
jne     oglmdi2_vs2019.13F132119
mov     eax,8000
jmp     oglmdi2_vs2019.13F132132
test    r11b,r11b
jne     oglmdi2_vs2019.13F132125
mov     eax,4000
jmp     oglmdi2_vs2019.13F132132
cmp     r11b,1
mov     eax,10000
cmove   eax,r14d
mov     rbx,qword ptr ss:[rsp+8]
mov     rdi,qword ptr ss:[rsp+10]
mov     r14,qword ptr ss:[rsp+18]
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,30
mov     rdi,r9
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
lea     rbx,qword ptr ds:[13F14E2B0]
lea     rsi,qword ptr ds:[13F14C330]
mov     qword ptr ss:[rsp+20],rbx
lea     rax,qword ptr ds:[13F14E2B8]
cmp     rbx,rax
je      oglmdi2_vs2019.13F13219B
cmp     qword ptr ds:[rbx],rsi
je      oglmdi2_vs2019.13F132195
mov     rdx,rsi
mov     rcx,rbx
call    oglmdi2_vs2019.13F13950C
mov     qword ptr ds:[rbx],rax
add     rbx,8
jmp     oglmdi2_vs2019.13F132171
mov     ecx,dword ptr ds:[rdi]
call    oglmdi2_vs2019.13F1313CC
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+48]
add     rsp,30
pop     rdi
ret     
int3    
int3    
mov     eax,1
xchg    dword ptr ds:[13F14DC7C],eax
ret     
mov     r11,rsp
sub     rsp,28
mov     eax,4
lea     r9,qword ptr ds:[r11+10]
lea     r8,qword ptr ds:[r11+8]
mov     dword ptr ss:[rsp+38],eax
lea     rdx,qword ptr ds:[r11+18]
mov     dword ptr ss:[rsp+40],eax
lea     rcx,qword ptr ds:[r11+8]
call    oglmdi2_vs2019.13F132144
add     rsp,28
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     ebx,ecx
call    oglmdi2_vs2019.13F1364CC
mov     r8d,dword ptr ds:[rax+3A8]
mov     edx,r8d
and     dl,2
neg     dl
sbb     ecx,ecx
cmp     ebx,FFFFFFFF
je      oglmdi2_vs2019.13F132249
test    ebx,ebx
je      oglmdi2_vs2019.13F132250
cmp     ebx,1
je      oglmdi2_vs2019.13F13223C
cmp     ebx,2
je      oglmdi2_vs2019.13F132236
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F132253
and     r8d,FFFFFFFD
jmp     oglmdi2_vs2019.13F132240
or      r8d,2
mov     dword ptr ds:[rax+3A8],r8d
jmp     oglmdi2_vs2019.13F132250
or      dword ptr ds:[13F14CA80],FFFFFFFF
lea     eax,dword ptr ds:[rcx+2]
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
mov     eax,dword ptr ds:[13F14DC80]
ret     
int3    
sub     rsp,28
cmp     ecx,1
jbe     oglmdi2_vs2019.13F132282
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F13228A
xchg    dword ptr ds:[13F14DC80],ecx
mov     eax,ecx
add     rsp,28
ret     
int3    
lea     rax,qword ptr ds:[13F14DC84]
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rbx,r9
mov     rdi,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rcx,rdi
call    oglmdi2_vs2019.13F132310
mov     edi,eax
mov     ecx,dword ptr ds:[rbx]
call    oglmdi2_vs2019.13F1313CC
mov     eax,edi
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rbx,r9
mov     rdi,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rcx,rdi
call    oglmdi2_vs2019.13F1324C0
mov     edi,eax
mov     ecx,dword ptr ds:[rbx]
call    oglmdi2_vs2019.13F1313CC
mov     eax,edi
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rbp
mov     qword ptr ss:[rsp+20],rsi
push    rdi
push    r14
push    r15
sub     rsp,20
mov     rax,qword ptr ds:[rcx]
xor     ebp,ebp
mov     r15,rcx
mov     rbx,qword ptr ds:[rax]
test    rbx,rbx
je      oglmdi2_vs2019.13F1324A4
mov     r10,qword ptr ds:[13F14C058]
mov     r9,qword ptr ds:[rbx+8]
mov     rsi,r10
xor     rsi,qword ptr ds:[rbx]
xor     r9,r10
mov     rbx,qword ptr ds:[rbx+10]
mov     ecx,r10d
and     ecx,3F
xor     rbx,r10
ror     rbx,cl
ror     rsi,cl
ror     r9,cl
cmp     r9,rbx
jne     oglmdi2_vs2019.13F132416
sub     rbx,rsi
mov     eax,200
sar     rbx,3
cmp     rbx,rax
mov     rdi,rbx
cmova   rdi,rax
lea     eax,dword ptr ss:[rbp+20]
add     rdi,rbx
cmove   rdi,rax
cmp     rdi,rbx
jb      oglmdi2_vs2019.13F1323B2
lea     r8d,dword ptr ss:[rbp+8]
mov     rdx,rdi
mov     rcx,rsi
call    oglmdi2_vs2019.13F139574
xor     ecx,ecx
mov     r14,rax
call    oglmdi2_vs2019.13F133148
test    r14,r14
jne     oglmdi2_vs2019.13F1323DA
lea     rdi,qword ptr ds:[rbx+4]
mov     r8d,8
mov     rdx,rdi
mov     rcx,rsi
call    oglmdi2_vs2019.13F139574
xor     ecx,ecx
mov     r14,rax
call    oglmdi2_vs2019.13F133148
test    r14,r14
je      oglmdi2_vs2019.13F1324A4
mov     r10,qword ptr ds:[13F14C058]
lea     r9,qword ptr ds:[r14+rbx*8]
lea     rbx,qword ptr ds:[r14+rdi*8]
mov     rsi,r14
mov     rcx,rbx
sub     rcx,r9
add     rcx,7
shr     rcx,3
cmp     r9,rbx
cmova   rcx,rbp
test    rcx,rcx
je      oglmdi2_vs2019.13F132416
mov     rax,r10
mov     rdi,r9
rep stosq qword ptr ds:[rdi],rax
mov     r10,qword ptr ds:[13F14C058]
mov     r8d,40
lea     rdi,qword ptr ds:[r9+8]
mov     ecx,r8d
mov     eax,r10d
and     eax,3F
sub     ecx,eax
mov     rax,qword ptr ds:[r15+8]
mov     rdx,qword ptr ds:[rax]
mov     eax,r8d
ror     rdx,cl
xor     rdx,r10
mov     qword ptr ds:[r9],rdx
mov     rdx,qword ptr ds:[13F14C058]
mov     ecx,edx
and     ecx,3F
sub     eax,ecx
mov     cl,al
mov     rax,qword ptr ds:[r15]
ror     rsi,cl
xor     rsi,rdx
mov     rcx,qword ptr ds:[rax]
mov     qword ptr ds:[rcx],rsi
mov     ecx,r8d
mov     rdx,qword ptr ds:[13F14C058]
mov     eax,edx
and     eax,3F
sub     ecx,eax
mov     rax,qword ptr ds:[r15]
ror     rdi,cl
xor     rdi,rdx
mov     rdx,qword ptr ds:[rax]
mov     qword ptr ds:[rdx+8],rdi
mov     rdx,qword ptr ds:[13F14C058]
mov     eax,edx
and     eax,3F
sub     r8d,eax
mov     rax,qword ptr ds:[r15]
mov     cl,r8b
ror     rbx,cl
xor     rbx,rdx
mov     rcx,qword ptr ds:[rax]
xor     eax,eax
mov     qword ptr ds:[rcx+10],rbx
jmp     oglmdi2_vs2019.13F1324A7
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+48]
mov     rbp,qword ptr ss:[rsp+50]
mov     rsi,qword ptr ss:[rsp+58]
add     rsp,20
pop     r15
pop     r14
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r14
push    r15
sub     rsp,20
mov     rax,qword ptr ds:[rcx]
mov     rsi,rcx
mov     rbx,qword ptr ds:[rax]
test    rbx,rbx
jne     oglmdi2_vs2019.13F1324EE
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F1325BD
mov     r8,qword ptr ds:[13F14C058]
mov     ecx,r8d
mov     rdi,r8
xor     rdi,qword ptr ds:[rbx]
and     ecx,3F
mov     rbx,qword ptr ds:[rbx+8]
ror     rdi,cl
xor     rbx,r8
ror     rbx,cl
lea     rax,qword ptr ds:[rdi-1]
cmp     rax,FFFFFFFFFFFFFFFD
ja      oglmdi2_vs2019.13F1325BB
mov     ecx,r8d
mov     r14,r8
and     ecx,3F
mov     r15,rdi
mov     rbp,rbx
sub     rbx,8
cmp     rbx,rdi
jb      oglmdi2_vs2019.13F132589
mov     rax,qword ptr ds:[rbx]
cmp     rax,r14
je      oglmdi2_vs2019.13F13252B
xor     rax,r8
mov     qword ptr ds:[rbx],r14
ror     rax,cl
call    qword ptr ds:[13F140490]
mov     r8,qword ptr ds:[13F14C058]
mov     rax,qword ptr ds:[rsi]
mov     ecx,r8d
and     ecx,3F
mov     rdx,qword ptr ds:[rax]
mov     r9,qword ptr ds:[rdx]
mov     rax,qword ptr ds:[rdx+8]
xor     r9,r8
xor     rax,r8
ror     r9,cl
ror     rax,cl
cmp     r9,r15
jne     oglmdi2_vs2019.13F13257B
cmp     rax,rbp
je      oglmdi2_vs2019.13F13252B
mov     r15,r9
mov     rdi,r9
mov     rbp,rax
mov     rbx,rax
jmp     oglmdi2_vs2019.13F13252B
cmp     rdi,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13259E
mov     rcx,rdi
call    oglmdi2_vs2019.13F133148
mov     r8,qword ptr ds:[13F14C058]
mov     rax,qword ptr ds:[rsi]
mov     rcx,qword ptr ds:[rax]
mov     qword ptr ds:[rcx],r8
mov     rax,qword ptr ds:[rsi]
mov     rcx,qword ptr ds:[rax]
mov     qword ptr ds:[rcx+8],r8
mov     rax,qword ptr ds:[rsi]
mov     rcx,qword ptr ds:[rax]
mov     qword ptr ds:[rcx+10],r8
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+40]
mov     rbp,qword ptr ss:[rsp+48]
mov     rsi,qword ptr ss:[rsp+50]
add     rsp,20
pop     r15
pop     r14
pop     rdi
ret     
int3    
int3    
mov     rdx,rcx
lea     rcx,qword ptr ds:[13F14DC88]
jmp     oglmdi2_vs2019.13F13264C
int3    
mov     r11,rsp
mov     qword ptr ds:[r11+8],rcx
sub     rsp,38
lea     rax,qword ptr ds:[r11+8]
mov     qword ptr ds:[r11-18],rax
lea     r9,qword ptr ds:[r11+18]
mov     eax,2
lea     r8,qword ptr ds:[r11-18]
lea     rdx,qword ptr ds:[r11+20]
mov     dword ptr ss:[rsp+50],eax
lea     rcx,qword ptr ds:[r11+10]
mov     dword ptr ss:[rsp+58],eax
call    oglmdi2_vs2019.13F1322D4
add     rsp,38
ret     
int3    
int3    
test    rcx,rcx
jne     oglmdi2_vs2019.13F13262D
or      eax,FFFFFFFF
ret     
mov     rax,qword ptr ds:[rcx+10]
cmp     qword ptr ds:[rcx],rax
jne     oglmdi2_vs2019.13F132648
mov     rax,qword ptr ds:[13F14C058]
mov     qword ptr ds:[rcx],rax
mov     qword ptr ds:[rcx+8],rax
mov     qword ptr ds:[rcx+10],rax
xor     eax,eax
ret     
int3    
mov     qword ptr ss:[rsp+10],rdx
mov     qword ptr ss:[rsp+8],rcx
push    rbp
mov     rbp,rsp
sub     rsp,40
lea     rax,qword ptr ss:[rbp+10]
mov     qword ptr ss:[rbp-18],rax
lea     r9,qword ptr ss:[rbp+28]
lea     rax,qword ptr ss:[rbp+18]
mov     qword ptr ss:[rbp-10],rax
lea     r8,qword ptr ss:[rbp-18]
mov     eax,2
lea     rdx,qword ptr ss:[rbp-20]
lea     rcx,qword ptr ss:[rbp+20]
mov     dword ptr ss:[rbp+28],eax
mov     dword ptr ss:[rbp-20],eax
call    oglmdi2_vs2019.13F132298
add     rsp,40
pop     rbp
ret     
lea     rax,qword ptr ds:[13F14C330]
mov     qword ptr ds:[13F14E2B0],rax
mov     al,1
ret     
int3    
int3    
int3    
sub     rsp,28
lea     rcx,qword ptr ds:[13F14DC88]
call    oglmdi2_vs2019.13F132624
lea     rcx,qword ptr ds:[13F14DCA0]
call    oglmdi2_vs2019.13F132624
mov     al,1
add     rsp,28
ret     
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F131BB8
mov     al,1
add     rsp,28
ret     
push    rbx
sub     rsp,20
mov     rbx,qword ptr ds:[13F14C058]
mov     rcx,rbx
call    oglmdi2_vs2019.13F132ED8
mov     rcx,rbx
call    oglmdi2_vs2019.13F13280C
mov     rcx,rbx
call    oglmdi2_vs2019.13F139768
mov     rcx,rbx
call    oglmdi2_vs2019.13F1315BC
mov     rcx,rbx
call    oglmdi2_vs2019.13F131F78
mov     al,1
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
xor     ecx,ecx
jmp     oglmdi2_vs2019.13F12B79C
int3    
push    rbx
sub     rsp,20
mov     rcx,qword ptr ds:[13F14E2C8]
or      eax,FFFFFFFF
lock xadd dword ptr ds:[rcx],eax
cmp     eax,1
jne     oglmdi2_vs2019.13F13275C
mov     rcx,qword ptr ds:[13F14E2C8]
lea     rbx,qword ptr ds:[13F14C4A0]
cmp     rcx,rbx
je      oglmdi2_vs2019.13F13275C
call    oglmdi2_vs2019.13F133148
mov     qword ptr ds:[13F14E2C8],rbx
mov     al,1
add     rsp,20
pop     rbx
ret     
sub     rsp,28
mov     rcx,qword ptr ds:[13F14E2A0]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[13F14E2A8]
and     qword ptr ds:[13F14E2A0],0
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[13F14E2E8]
and     qword ptr ds:[13F14E2A8],0
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[13F14E2F0]
and     qword ptr ds:[13F14E2E8],0
call    oglmdi2_vs2019.13F133148
and     qword ptr ds:[13F14E2F0],0
mov     al,1
add     rsp,28
ret     
int3    
lea     rdx,qword ptr ds:[13F1424D0]
lea     rcx,qword ptr ds:[13F1423D0]
jmp     oglmdi2_vs2019.13F139634
int3    
sub     rsp,28
test    cl,cl
je      oglmdi2_vs2019.13F1327F2
cmp     qword ptr ds:[13F14D8E8],0
je      oglmdi2_vs2019.13F1327EB
call    oglmdi2_vs2019.13F133A78
mov     al,1
add     rsp,28
ret     
lea     rdx,qword ptr ds:[13F1424D0]
lea     rcx,qword ptr ds:[13F1423D0]
add     rsp,28
jmp     oglmdi2_vs2019.13F1396B4
int3    
int3    
int3    
mov     qword ptr ds:[13F14DCB8],rcx
ret     
push    rbx
sub     rsp,20
mov     rbx,rcx
call    oglmdi2_vs2019.13F132844
test    rax,rax
je      oglmdi2_vs2019.13F13283B
mov     rcx,rbx
call    qword ptr ds:[13F140490]
test    eax,eax
je      oglmdi2_vs2019.13F13283B
mov     eax,1
jmp     oglmdi2_vs2019.13F13283D
xor     eax,eax
add     rsp,20
pop     rbx
ret     
int3    
push    rbx
sub     rsp,20
xor     ecx,ecx
call    oglmdi2_vs2019.13F131378
nop     
mov     rbx,qword ptr ds:[13F14C058]
mov     ecx,ebx
and     ecx,3F
xor     rbx,qword ptr ds:[13F14DCB8]
ror     rbx,cl
xor     ecx,ecx
call    oglmdi2_vs2019.13F1313CC
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
sub     rsp,28
call    oglmdi2_vs2019.13F139738
test    rax,rax
je      oglmdi2_vs2019.13F132890
mov     ecx,16
call    oglmdi2_vs2019.13F139788
test    byte ptr ds:[13F14C1A0],2
je      oglmdi2_vs2019.13F1328C3
mov     ecx,17
call    qword ptr ds:[<&IsProcessorFeaturePresent>]
test    eax,eax
je      oglmdi2_vs2019.13F1328AF
mov     ecx,7
int     29
mov     r8d,1
mov     edx,40000015
lea     ecx,dword ptr ds:[r8+2]
call    oglmdi2_vs2019.13F132D7C
mov     ecx,3
call    oglmdi2_vs2019.13F131FA0
int3    
int3    
int3    
push    rbx
sub     rsp,20
xor     ebx,ebx
test    rcx,rcx
je      oglmdi2_vs2019.13F1328E9
test    rdx,rdx
je      oglmdi2_vs2019.13F1328E9
test    r8,r8
jne     oglmdi2_vs2019.13F132902
mov     byte ptr ds:[rcx],bl
call    oglmdi2_vs2019.13F1330B0
mov     ebx,16
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     eax,ebx
add     rsp,20
pop     rbx
ret     
mov     r9,rcx
sub     r8,rcx
mov     al,byte ptr ds:[r8+r9]
mov     byte ptr ds:[r9],al
inc     r9
test    al,al
je      oglmdi2_vs2019.13F13291C
sub     rdx,1
jne     oglmdi2_vs2019.13F132908
test    rdx,rdx
jne     oglmdi2_vs2019.13F1328FA
mov     byte ptr ds:[rcx],bl
call    oglmdi2_vs2019.13F1330B0
mov     ebx,22
jmp     oglmdi2_vs2019.13F1328F3
int3    
jmp     oglmdi2_vs2019.13F1330D0
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r13
push    r14
push    r15
sub     rsp,40
cmp     qword ptr ds:[rdx],0
mov     bpl,r9b
mov     r14d,r8d
mov     rbx,rdx
jne     oglmdi2_vs2019.13F132979
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F132B48
test    r14d,r14d
je      oglmdi2_vs2019.13F132987
lea     eax,dword ptr ds:[r8-2]
cmp     eax,22
ja      oglmdi2_vs2019.13F132964
mov     rdx,rcx
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F1301AC
mov     r15,qword ptr ds:[rbx]
xor     esi,esi
movzx   edi,byte ptr ds:[r15]
lea     r13d,dword ptr ds:[rsi+8]
lea     rax,qword ptr ds:[r15+1]
jmp     oglmdi2_vs2019.13F1329B0
mov     rax,qword ptr ds:[rbx]
movzx   edi,byte ptr ds:[rax]
inc     rax
lea     r8,qword ptr ss:[rsp+28]
mov     qword ptr ds:[rbx],rax
mov     edx,r13d
mov     ecx,edi
call    oglmdi2_vs2019.13F132C40
test    eax,eax
jne     oglmdi2_vs2019.13F1329A7
movzx   eax,bpl
mov     ebp,eax
or      ebp,2
cmp     dil,2D
cmovne  ebp,eax
lea     eax,dword ptr ds:[rdi-2B]
test    al,FD
jne     oglmdi2_vs2019.13F1329E9
mov     rax,qword ptr ds:[rbx]
mov     dil,byte ptr ds:[rax]
inc     rax
mov     qword ptr ds:[rbx],rax
or      r13d,FFFFFFFF
test    r14d,FFFFFFEF
jne     oglmdi2_vs2019.13F132A93
lea     eax,dword ptr ds:[rdi-30]
cmp     al,9
ja      oglmdi2_vs2019.13F132A0A
movsx   eax,dil
add     eax,FFFFFFD0
jmp     oglmdi2_vs2019.13F132A2D
lea     eax,dword ptr ds:[rdi-61]
cmp     al,19
ja      oglmdi2_vs2019.13F132A1A
movsx   eax,dil
add     eax,FFFFFFA9
jmp     oglmdi2_vs2019.13F132A2D
lea     eax,dword ptr ds:[rdi-41]
cmp     al,19
ja      oglmdi2_vs2019.13F132A2A
movsx   eax,dil
add     eax,FFFFFFC9
jmp     oglmdi2_vs2019.13F132A2D
mov     eax,r13d
test    eax,eax
je      oglmdi2_vs2019.13F132A38
mov     eax,A
jmp     oglmdi2_vs2019.13F132A89
mov     rax,qword ptr ds:[rbx]
mov     dl,byte ptr ds:[rax]
lea     rcx,qword ptr ds:[rax+1]
mov     qword ptr ds:[rbx],rcx
lea     eax,dword ptr ds:[rdx-58]
test    al,DF
je      oglmdi2_vs2019.13F132A7A
test    r14d,r14d
mov     eax,8
cmovne  eax,r14d
dec     rcx
mov     qword ptr ds:[rbx],rcx
mov     r14d,eax
test    dl,dl
je      oglmdi2_vs2019.13F132A93
cmp     byte ptr ds:[rcx],dl
je      oglmdi2_vs2019.13F132A93
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F132A93
mov     dil,byte ptr ds:[rcx]
lea     rax,qword ptr ds:[rcx+1]
mov     qword ptr ds:[rbx],rax
mov     eax,10
test    r14d,r14d
cmovne  eax,r14d
mov     r14d,eax
xor     edx,edx
mov     eax,r13d
div     r14d
mov     r8d,eax
lea     ecx,dword ptr ds:[rdi-30]
cmp     cl,9
ja      oglmdi2_vs2019.13F132AAF
movsx   ecx,dil
add     ecx,FFFFFFD0
jmp     oglmdi2_vs2019.13F132AD2
lea     eax,dword ptr ds:[rdi-61]
cmp     al,19
ja      oglmdi2_vs2019.13F132ABF
movsx   ecx,dil
add     ecx,FFFFFFA9
jmp     oglmdi2_vs2019.13F132AD2
lea     eax,dword ptr ds:[rdi-41]
cmp     al,19
ja      oglmdi2_vs2019.13F132ACF
movsx   ecx,dil
add     ecx,FFFFFFC9
jmp     oglmdi2_vs2019.13F132AD2
mov     ecx,r13d
cmp     ecx,r13d
je      oglmdi2_vs2019.13F132B09
cmp     ecx,r14d
jae     oglmdi2_vs2019.13F132B09
cmp     esi,r8d
jb      oglmdi2_vs2019.13F132AEE
jne     oglmdi2_vs2019.13F132AE7
cmp     ecx,edx
jbe     oglmdi2_vs2019.13F132AEE
mov     ecx,C
jmp     oglmdi2_vs2019.13F132AF9
imul    esi,r14d
add     esi,ecx
mov     ecx,8
mov     rax,qword ptr ds:[rbx]
mov     dil,byte ptr ds:[rax]
inc     rax
mov     qword ptr ds:[rbx],rax
or      ebp,ecx
jmp     oglmdi2_vs2019.13F132A9E
mov     rax,qword ptr ds:[rbx]
dec     rax
mov     qword ptr ds:[rbx],rax
test    dil,dil
je      oglmdi2_vs2019.13F132B2C
cmp     byte ptr ds:[rax],dil
je      oglmdi2_vs2019.13F132B2C
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
test    bpl,8
jne     oglmdi2_vs2019.13F132B5E
cmp     byte ptr ss:[rsp+38],0
mov     qword ptr ds:[rbx],r15
je      oglmdi2_vs2019.13F132B48
mov     rax,qword ptr ss:[rsp+20]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     rcx,qword ptr ds:[rbx+8]
test    rcx,rcx
je      oglmdi2_vs2019.13F132B57
mov     rax,qword ptr ds:[rbx]
mov     qword ptr ds:[rcx],rax
xor     eax,eax
jmp     oglmdi2_vs2019.13F132C1E
mov     edi,ebp
mov     r14d,7FFFFFFF
and     edi,1
mov     r15d,80000000
test    bpl,4
jne     oglmdi2_vs2019.13F132B84
test    edi,edi
je      oglmdi2_vs2019.13F132BC4
test    bpl,2
je      oglmdi2_vs2019.13F132BBF
cmp     esi,r15d
jbe     oglmdi2_vs2019.13F132BC4
and     ebp,2
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
test    edi,edi
jne     oglmdi2_vs2019.13F132BCE
mov     esi,r13d
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F132BAC
mov     rcx,qword ptr ss:[rsp+20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     rax,qword ptr ds:[rbx+8]
test    rax,rax
je      oglmdi2_vs2019.13F132BBB
mov     rcx,qword ptr ds:[rbx]
mov     qword ptr ds:[rax],rcx
mov     eax,esi
jmp     oglmdi2_vs2019.13F132C1E
cmp     esi,r14d
ja      oglmdi2_vs2019.13F132B84
test    bpl,2
je      oglmdi2_vs2019.13F132B99
neg     esi
jmp     oglmdi2_vs2019.13F132B99
test    ebp,ebp
je      oglmdi2_vs2019.13F132BF9
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F132BE5
mov     rcx,qword ptr ss:[rsp+20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     rdx,qword ptr ds:[rbx+8]
test    rdx,rdx
je      oglmdi2_vs2019.13F132BF4
mov     rcx,qword ptr ds:[rbx]
mov     qword ptr ds:[rdx],rcx
mov     eax,r15d
jmp     oglmdi2_vs2019.13F132C1E
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F132C0C
mov     rcx,qword ptr ss:[rsp+20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     rdx,qword ptr ds:[rbx+8]
test    rdx,rdx
je      oglmdi2_vs2019.13F132C1B
mov     rcx,qword ptr ds:[rbx]
mov     qword ptr ds:[rdx],rcx
mov     eax,r14d
mov     rbx,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+68]
mov     rsi,qword ptr ss:[rsp+70]
mov     rdi,qword ptr ss:[rsp+78]
add     rsp,40
pop     r15
pop     r14
pop     r13
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
movsxd  rdi,ecx
xor     ebx,ebx
mov     esi,edx
lea     ebp,dword ptr ds:[rdi+1]
test    r8,r8
je      oglmdi2_vs2019.13F132C8C
mov     rax,qword ptr ds:[r8]
cmp     ebp,100
ja      oglmdi2_vs2019.13F132C79
mov     rax,qword ptr ds:[rax]
movzx   eax,word ptr ds:[rax+rdi*2]
and     eax,edx
jmp     oglmdi2_vs2019.13F132CA1
cmp     dword ptr ds:[rax+8],1
jle     oglmdi2_vs2019.13F132C88
mov     ecx,edi
call    oglmdi2_vs2019.13F1399F4
jmp     oglmdi2_vs2019.13F132CA1
xor     eax,eax
jmp     oglmdi2_vs2019.13F132CA1
call    oglmdi2_vs2019.13F138FAC
cmp     ebp,100
ja      oglmdi2_vs2019.13F132C9F
movzx   ebx,word ptr ds:[rax+rdi*2]
and     ebx,esi
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
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
int3    
int3    
nop     word ptr ds:[rax+rax]
sub     rdx,rcx
test    r8,r8
je      oglmdi2_vs2019.13F132D42
test    ecx,7
je      oglmdi2_vs2019.13F132CFD
movzx   eax,byte ptr ds:[rcx]
cmp     al,byte ptr ds:[rdx+rcx]
jne     oglmdi2_vs2019.13F132D45
inc     rcx
dec     r8
je      oglmdi2_vs2019.13F132D42
test    al,al
je      oglmdi2_vs2019.13F132D42
test    rcx,7
jne     oglmdi2_vs2019.13F132CE0
movabs  r11,8080808080808080
movabs  r10,FEFEFEFEFEFEFEFF
lea     eax,dword ptr ds:[rdx+rcx]
and     eax,FFF
cmp     eax,FF8
ja      oglmdi2_vs2019.13F132CE0
mov     rax,qword ptr ds:[rcx]
cmp     rax,qword ptr ds:[rdx+rcx]
jne     oglmdi2_vs2019.13F132CE0
add     rcx,8
sub     r8,8
jbe     oglmdi2_vs2019.13F132D42
lea     r9,qword ptr ds:[r10+rax]
not     rax
and     rax,r9
test    r11,rax
je      oglmdi2_vs2019.13F132D11
xor     eax,eax
ret     
sbb     rax,rax
or      rax,1
ret     
int3    
int3    
int3    
test    r8,r8
jne     oglmdi2_vs2019.13F132D6D
xor     eax,eax
ret     
movzx   eax,word ptr ds:[rcx]
test    ax,ax
je      oglmdi2_vs2019.13F132D73
cmp     ax,word ptr ds:[rdx]
jne     oglmdi2_vs2019.13F132D73
add     rcx,2
add     rdx,2
sub     r8,1
jne     oglmdi2_vs2019.13F132D58
movzx   eax,word ptr ds:[rcx]
movzx   ecx,word ptr ds:[rdx]
sub     eax,ecx
ret     
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
push    rbp
push    rdi
push    r14
lea     rbp,qword ptr ss:[rsp-4F0]
sub     rsp,5F0
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+4E0],rax
mov     edi,r8d
mov     esi,edx
mov     ebx,ecx
cmp     ecx,FFFFFFFF
je      oglmdi2_vs2019.13F132DBB
call    oglmdi2_vs2019.13F12A340
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+70]
mov     r8d,98
call    oglmdi2_vs2019.13F12B280
xor     edx,edx
lea     rcx,qword ptr ss:[rbp+10]
mov     r8d,4D0
call    oglmdi2_vs2019.13F12B280
lea     rax,qword ptr ss:[rsp+70]
mov     qword ptr ss:[rsp+48],rax
lea     rcx,qword ptr ss:[rbp+10]
lea     rax,qword ptr ss:[rbp+10]
mov     qword ptr ss:[rsp+50],rax
call    qword ptr ds:[<&RtlCaptureContext>]
mov     r14,qword ptr ss:[rbp+108]
lea     rdx,qword ptr ss:[rsp+40]
mov     rcx,r14
xor     r8d,r8d
call    qword ptr ds:[<&RtlLookupFunctionEntry>]
test    rax,rax
je      oglmdi2_vs2019.13F132E4E
and     qword ptr ss:[rsp+38],0
lea     rcx,qword ptr ss:[rsp+58]
mov     rdx,qword ptr ss:[rsp+40]
mov     r9,rax
mov     qword ptr ss:[rsp+30],rcx
mov     r8,r14
lea     rcx,qword ptr ss:[rsp+60]
mov     qword ptr ss:[rsp+28],rcx
lea     rcx,qword ptr ss:[rbp+10]
mov     qword ptr ss:[rsp+20],rcx
xor     ecx,ecx
call    qword ptr ds:[<&RtlVirtualUnwind>]
mov     rax,qword ptr ss:[rbp+508]
mov     qword ptr ss:[rbp+108],rax
lea     rax,qword ptr ss:[rbp+508]
add     rax,8
mov     dword ptr ss:[rsp+70],esi
mov     qword ptr ss:[rbp+A8],rax
mov     rax,qword ptr ss:[rbp+508]
mov     qword ptr ss:[rbp-80],rax
mov     dword ptr ss:[rsp+74],edi
call    qword ptr ds:[<&IsDebuggerPresent>]
xor     ecx,ecx
mov     edi,eax
call    qword ptr ds:[<&SetUnhandledExceptionFilter>]
lea     rcx,qword ptr ss:[rsp+48]
call    qword ptr ds:[<&UnhandledExceptionFilter>]
test    eax,eax
jne     oglmdi2_vs2019.13F132EB0
test    edi,edi
jne     oglmdi2_vs2019.13F132EB0
cmp     ebx,FFFFFFFF
je      oglmdi2_vs2019.13F132EB0
mov     ecx,ebx
call    oglmdi2_vs2019.13F12A340
mov     rcx,qword ptr ss:[rbp+4E0]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
lea     r11,qword ptr ss:[rsp+5F0]
mov     rbx,qword ptr ds:[r11+28]
mov     rsi,qword ptr ds:[r11+30]
mov     rsp,r11
pop     r14
pop     rdi
pop     rbp
ret     
int3    
mov     qword ptr ds:[13F14DCC0],rcx
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,30
mov     ebx,r9d
mov     rdi,r8
mov     rsi,rdx
mov     rbp,rcx
call    oglmdi2_vs2019.13F136648
test    rax,rax
je      oglmdi2_vs2019.13F132F47
mov     rax,qword ptr ds:[rax+3B8]
test    rax,rax
je      oglmdi2_vs2019.13F132F47
mov     rdx,qword ptr ss:[rsp+60]
mov     r9d,ebx
mov     qword ptr ss:[rsp+20],rdx
mov     r8,rdi
mov     rdx,rsi
mov     rcx,rbp
call    qword ptr ds:[13F140490]
mov     rbx,qword ptr ss:[rsp+40]
mov     rbp,qword ptr ss:[rsp+48]
mov     rsi,qword ptr ss:[rsp+50]
add     rsp,30
pop     rdi
ret     
mov     r10,qword ptr ds:[13F14C058]
mov     r9d,ebx
mov     ecx,r10d
mov     r8,rdi
xor     r10,qword ptr ds:[13F14DCC0]
and     ecx,3F
ror     r10,cl
mov     rdx,rsi
test    r10,r10
je      oglmdi2_vs2019.13F132F7B
mov     rcx,qword ptr ss:[rsp+60]
mov     rax,r10
mov     qword ptr ss:[rsp+20],rcx
jmp     oglmdi2_vs2019.13F132F29
mov     rax,qword ptr ss:[rsp+60]
mov     rcx,rbp
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F132FB0
int3    
int3    
int3    
sub     rsp,38
and     qword ptr ss:[rsp+20],0
xor     r9d,r9d
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    oglmdi2_vs2019.13F132EE0
add     rsp,38
ret     
int3    
int3    
sub     rsp,28
mov     ecx,17
call    qword ptr ds:[<&IsProcessorFeaturePresent>]
test    eax,eax
je      oglmdi2_vs2019.13F132FCA
mov     ecx,5
int     29
mov     r8d,1
mov     edx,C0000417
lea     ecx,dword ptr ds:[r8+1]
call    oglmdi2_vs2019.13F132D7C
call    qword ptr ds:[<&GetCurrentProcess>]
mov     rcx,rax
mov     edx,C0000417
add     rsp,28
jmp     qword ptr ds:[<&TerminateProcess>]
int3    
xor     eax,eax
lea     r9,qword ptr ds:[13F1424D0]
mov     rdx,r9
lea     r8d,dword ptr ds:[rax+8]
cmp     ecx,dword ptr ds:[rdx]
je      oglmdi2_vs2019.13F133037
inc     eax
add     rdx,r8
cmp     eax,2D
jb      oglmdi2_vs2019.13F133008
lea     eax,dword ptr ds:[rcx-13]
cmp     eax,11
ja      oglmdi2_vs2019.13F133024
mov     eax,D
ret     
add     ecx,FFFFFF44
mov     eax,16
cmp     ecx,E
cmovbe  eax,r8d
ret     
mov     eax,dword ptr ds:[r9+rax*8+4]
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     edi,ecx
call    oglmdi2_vs2019.13F136648
test    rax,rax
jne     oglmdi2_vs2019.13F13305F
lea     rax,qword ptr ds:[13F14C1B4]
jmp     oglmdi2_vs2019.13F133063
add     rax,24
mov     dword ptr ds:[rax],edi
call    oglmdi2_vs2019.13F136648
lea     rbx,qword ptr ds:[13F14C1B0]
test    rax,rax
je      oglmdi2_vs2019.13F13307A
lea     rbx,qword ptr ds:[rax+20]
mov     ecx,edi
call    oglmdi2_vs2019.13F132FF8
mov     dword ptr ds:[rbx],eax
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F136648
test    rax,rax
jne     oglmdi2_vs2019.13F1330A7
lea     rax,qword ptr ds:[13F14C1B4]
jmp     oglmdi2_vs2019.13F1330AB
add     rax,24
add     rsp,28
ret     
sub     rsp,28
call    oglmdi2_vs2019.13F136648
test    rax,rax
jne     oglmdi2_vs2019.13F1330C7
lea     rax,qword ptr ds:[13F14C1B0]
jmp     oglmdi2_vs2019.13F1330CB
add     rax,20
add     rsp,28
ret     
push    rbx
sub     rsp,20
mov     r8,rdx
mov     rbx,rcx
test    rcx,rcx
je      oglmdi2_vs2019.13F1330EF
xor     edx,edx
lea     rax,qword ptr ds:[rdx-20]
div     rbx
cmp     rax,r8
jb      oglmdi2_vs2019.13F133132
imul    rbx,r8
mov     eax,1
test    rbx,rbx
cmove   rbx,rax
jmp     oglmdi2_vs2019.13F133116
call    oglmdi2_vs2019.13F13225C
test    eax,eax
je      oglmdi2_vs2019.13F133132
mov     rcx,rbx
call    oglmdi2_vs2019.13F132814
test    eax,eax
je      oglmdi2_vs2019.13F133132
mov     rcx,qword ptr ds:[13F14E318]
mov     r8,rbx
mov     edx,8
call    qword ptr ds:[<&RtlAllocateHeap>]
test    rax,rax
je      oglmdi2_vs2019.13F133101
jmp     oglmdi2_vs2019.13F13313F
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],C
xor     eax,eax
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F133184
push    rbx
sub     rsp,20
mov     r8,rcx
xor     edx,edx
mov     rcx,qword ptr ds:[13F14E318]
call    qword ptr ds:[<&HeapFree>]
test    eax,eax
jne     oglmdi2_vs2019.13F13317F
call    oglmdi2_vs2019.13F1330B0
mov     rbx,rax
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F132FF8
mov     dword ptr ds:[rbx],eax
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,20
mov     r15d,ecx
lea     r14,qword ptr ds:[13F120000]
mov     r12,r9
mov     rbp,r8
mov     r13,rdx
mov     rcx,qword ptr ds:[r14+r15*8+2DD70]
mov     r10,qword ptr ds:[13F14C058]
or      rdi,FFFFFFFFFFFFFFFF
mov     eax,r10d
mov     rdx,r10
xor     rdx,rcx
and     eax,3F
mov     cl,al
ror     rdx,cl
cmp     rdx,rdi
je      oglmdi2_vs2019.13F13333F
test    rdx,rdx
je      oglmdi2_vs2019.13F1331F1
mov     rax,rdx
jmp     oglmdi2_vs2019.13F133341
cmp     r8,r12
je      oglmdi2_vs2019.13F1332D3
mov     esi,dword ptr ss:[rbp]
mov     rbx,qword ptr ds:[r14+rsi*8+2DCD0]
test    rbx,rbx
je      oglmdi2_vs2019.13F133218
cmp     rbx,rdi
je      oglmdi2_vs2019.13F1332BF
jmp     oglmdi2_vs2019.13F1332BA
mov     r14,qword ptr ds:[r14+rsi*8+22640]
xor     edx,edx
mov     rcx,r14
mov     r8d,800
call    qword ptr ds:[<&LoadLibraryExW>]
mov     rbx,rax
test    rax,rax
jne     oglmdi2_vs2019.13F133288
call    qword ptr ds:[<&GetLastError>]
cmp     eax,57
jne     oglmdi2_vs2019.13F133286
lea     ebx,dword ptr ds:[rax-50]
mov     rcx,r14
mov     r8d,ebx
lea     rdx,qword ptr ds:[13F141FA8]
call    oglmdi2_vs2019.13F132D50
test    eax,eax
je      oglmdi2_vs2019.13F133286
mov     r8d,ebx
lea     rdx,qword ptr ds:[13F142B38]
mov     rcx,r14
call    oglmdi2_vs2019.13F132D50
test    eax,eax
je      oglmdi2_vs2019.13F133286
xor     r8d,r8d
xor     edx,edx
mov     rcx,r14
call    qword ptr ds:[<&LoadLibraryExW>]
mov     rbx,rax
jmp     oglmdi2_vs2019.13F133288
xor     ebx,ebx
lea     r14,qword ptr ds:[13F120000]
test    rbx,rbx
jne     oglmdi2_vs2019.13F1332A1
mov     rax,rdi
xchg    qword ptr ds:[r14+rsi*8+2DCD0],rax
jmp     oglmdi2_vs2019.13F1332BF
mov     rax,rbx
xchg    qword ptr ds:[r14+rsi*8+2DCD0],rax
test    rax,rax
je      oglmdi2_vs2019.13F1332BA
mov     rcx,rbx
call    qword ptr ds:[<&FreeLibrary>]
test    rbx,rbx
jne     oglmdi2_vs2019.13F133314
add     rbp,4
cmp     rbp,r12
jne     oglmdi2_vs2019.13F1331FA
mov     r10,qword ptr ds:[13F14C058]
xor     ebx,ebx
test    rbx,rbx
je      oglmdi2_vs2019.13F133324
mov     rdx,r13
mov     rcx,rbx
call    qword ptr ds:[<&GetProcAddress>]
test    rax,rax
je      oglmdi2_vs2019.13F13331D
mov     r8,qword ptr ds:[13F14C058]
mov     edx,40
mov     ecx,r8d
and     ecx,3F
sub     edx,ecx
mov     cl,dl
mov     rdx,rax
ror     rdx,cl
xor     rdx,r8
xchg    qword ptr ds:[r14+r15*8+2DD70],rdx
jmp     oglmdi2_vs2019.13F133341
mov     r10,qword ptr ds:[13F14C058]
jmp     oglmdi2_vs2019.13F1332D5
mov     r10,qword ptr ds:[13F14C058]
mov     eax,r10d
mov     ecx,40
and     eax,3F
sub     ecx,eax
ror     rdi,cl
xor     rdi,r10
xchg    qword ptr ds:[r14+r15*8+2DD70],rdi
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+50]
mov     rbp,qword ptr ss:[rsp+58]
mov     rsi,qword ptr ss:[rsp+60]
add     rsp,20
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
lea     r9,qword ptr ds:[13F142BB0]
mov     ecx,1C
lea     r8,qword ptr ds:[13F142BAC]
lea     rdx,qword ptr ds:[13F142BB0]
call    oglmdi2_vs2019.13F133188
test    rax,rax
je      oglmdi2_vs2019.13F1333A3
mov     rdx,rbx
mov     rcx,FFFFFFFFFFFFFFFA
add     rsp,20
pop     rbx
jmp     qword ptr ds:[13F140490]
mov     eax,C0000225
add     rsp,20
pop     rbx
ret     
int3    
int3    
sub     rsp,28
lea     r9,qword ptr ds:[13F142B4C]
xor     ecx,ecx
lea     r8,qword ptr ds:[13F142B48]
lea     rdx,qword ptr ds:[13F142B50]
call    oglmdi2_vs2019.13F133188
test    rax,rax
je      oglmdi2_vs2019.13F1333E0
add     rsp,28
jmp     qword ptr ds:[13F140490]
mov     eax,1
add     rsp,28
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
lea     r9,qword ptr ds:[13F142B68]
mov     ecx,3
lea     r8,qword ptr ds:[13F142B60]
lea     rdx,qword ptr ds:[13F140BB8]
call    oglmdi2_vs2019.13F133188
test    rax,rax
je      oglmdi2_vs2019.13F133428
mov     rcx,rbx
add     rsp,20
pop     rbx
jmp     qword ptr ds:[13F140490]
add     rsp,20
pop     rbx
jmp     qword ptr ds:[<&TlsAlloc>]
push    rbx
sub     rsp,20
mov     ebx,ecx
lea     r9,qword ptr ds:[13F142B70]
mov     ecx,4
lea     r8,qword ptr ds:[13F142B68]
lea     rdx,qword ptr ds:[13F140BC8]
call    oglmdi2_vs2019.13F133188
mov     ecx,ebx
test    rax,rax
je      oglmdi2_vs2019.13F13346E
add     rsp,20
pop     rbx
jmp     qword ptr ds:[13F140490]
add     rsp,20
pop     rbx
jmp     qword ptr ds:[<&TlsFree>]
int3    
int3    
push    rbx
sub     rsp,20
mov     ebx,ecx
lea     r9,qword ptr ds:[13F142B78]
mov     ecx,5
lea     r8,qword ptr ds:[13F142B70]
lea     rdx,qword ptr ds:[13F140BD0]
call    oglmdi2_vs2019.13F133188
mov     ecx,ebx
test    rax,rax
je      oglmdi2_vs2019.13F1334B6
add     rsp,20
pop     rbx
jmp     qword ptr ds:[13F140490]
add     rsp,20
pop     rbx
jmp     qword ptr ds:[<&TlsGetValue>]
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rbx,rdx
lea     r9,qword ptr ds:[13F142B80]
mov     edi,ecx
lea     rdx,qword ptr ds:[13F140BE0]
mov     ecx,6
lea     r8,qword ptr ds:[13F142B78]
call    oglmdi2_vs2019.13F133188
mov     rdx,rbx
mov     ecx,edi
test    rax,rax
je      oglmdi2_vs2019.13F133504
call    qword ptr ds:[13F140490]
jmp     oglmdi2_vs2019.13F13350A
call    qword ptr ds:[<&TlsSetValue>]
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     esi,r8d
lea     r9,qword ptr ds:[13F142B88]
mov     ebx,edx
lea     r8,qword ptr ds:[13F142B80]
mov     rdi,rcx
lea     rdx,qword ptr ds:[13F140BF0]
mov     ecx,12
call    oglmdi2_vs2019.13F133188
mov     edx,ebx
mov     rcx,rdi
test    rax,rax
je      oglmdi2_vs2019.13F133563
mov     r8d,esi
call    qword ptr ds:[13F140490]
jmp     oglmdi2_vs2019.13F133569
call    qword ptr ds:[<&InitializeCriticalSectionAndSpinCount>]
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,50
mov     ebx,r9d
mov     rdi,r8
mov     esi,edx
lea     r9,qword ptr ds:[13F142B90]
mov     rbp,rcx
lea     r8,qword ptr ds:[13F142B88]
lea     rdx,qword ptr ds:[13F140F80]
mov     ecx,14
call    oglmdi2_vs2019.13F133188
test    rax,rax
je      oglmdi2_vs2019.13F133611
mov     r8,qword ptr ss:[rsp+A0]
mov     r9d,ebx
mov     rcx,qword ptr ss:[rsp+98]
mov     edx,esi
mov     qword ptr ss:[rsp+40],r8
mov     r8,rdi
mov     qword ptr ss:[rsp+38],rcx
mov     rcx,qword ptr ss:[rsp+90]
mov     qword ptr ss:[rsp+30],rcx
mov     ecx,dword ptr ss:[rsp+88]
mov     dword ptr ss:[rsp+28],ecx
mov     rcx,qword ptr ss:[rsp+80]
mov     qword ptr ss:[rsp+20],rcx
mov     rcx,rbp
call    qword ptr ds:[13F140490]
jmp     oglmdi2_vs2019.13F133643
xor     edx,edx
mov     rcx,rbp
call    oglmdi2_vs2019.13F133658
mov     ecx,eax
mov     r9d,ebx
mov     eax,dword ptr ss:[rsp+88]
mov     r8,rdi
mov     dword ptr ss:[rsp+28],eax
mov     edx,esi
mov     rax,qword ptr ss:[rsp+80]
mov     qword ptr ss:[rsp+20],rax
call    qword ptr ds:[<&LCMapStringW>]
mov     rbx,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+68]
mov     rsi,qword ptr ss:[rsp+70]
add     rsp,50
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     edi,edx
lea     r9,qword ptr ds:[13F142B98]
mov     rbx,rcx
lea     rdx,qword ptr ds:[13F142B98]
mov     ecx,16
lea     r8,qword ptr ds:[13F142B90]
call    oglmdi2_vs2019.13F133188
mov     rcx,rbx
test    rax,rax
je      oglmdi2_vs2019.13F133698
mov     edx,edi
call    qword ptr ds:[13F140490]
jmp     oglmdi2_vs2019.13F13369D
call    oglmdi2_vs2019.13F139AFC
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rdi
lea     rdi,qword ptr ds:[13F14DD70]
lea     rax,qword ptr ds:[13F14DE80]
cmp     rax,rdi
mov     rax,qword ptr ds:[13F14C058]
sbb     rcx,rcx
not     rcx
and     ecx,22
rep stosq qword ptr ds:[rdi],rax
mov     rdi,qword ptr ss:[rsp+8]
mov     al,1
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
test    cl,cl
jne     oglmdi2_vs2019.13F133715
lea     rbx,qword ptr ds:[13F14DCD0]
mov     rcx,qword ptr ds:[rbx]
test    rcx,rcx
je      oglmdi2_vs2019.13F133705
cmp     rcx,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F133701
call    qword ptr ds:[<&FreeLibrary>]
and     qword ptr ds:[rbx],0
add     rbx,8
lea     rax,qword ptr ds:[13F14DD70]
cmp     rbx,rax
jne     oglmdi2_vs2019.13F1336ED
mov     al,1
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,30
and     dword ptr ss:[rsp+20],0
mov     ecx,8
call    oglmdi2_vs2019.13F131378
nop     
mov     ebx,3
mov     dword ptr ss:[rsp+24],ebx
cmp     ebx,dword ptr ds:[13F14D8E0]
je      oglmdi2_vs2019.13F1337B8
movsxd  rdi,ebx
mov     rax,qword ptr ds:[13F14D8E8]
mov     rcx,qword ptr ds:[rax+rdi*8]
test    rcx,rcx
jne     oglmdi2_vs2019.13F133760
jmp     oglmdi2_vs2019.13F1337B4
mov     eax,dword ptr ds:[rcx+14]
shr     eax,D
test    al,1
je      oglmdi2_vs2019.13F133783
mov     rcx,qword ptr ds:[13F14D8E8]
mov     rcx,qword ptr ds:[rcx+rdi*8]
call    oglmdi2_vs2019.13F12E460
cmp     eax,FFFFFFFF
je      oglmdi2_vs2019.13F133783
inc     dword ptr ss:[rsp+20]
mov     rax,qword ptr ds:[13F14D8E8]
mov     rcx,qword ptr ds:[rax+rdi*8]
add     rcx,30
call    qword ptr ds:[<&RtlDeleteCriticalSection>]
mov     rcx,qword ptr ds:[13F14D8E8]
mov     rcx,qword ptr ds:[rcx+rdi*8]
call    oglmdi2_vs2019.13F133148
mov     rax,qword ptr ds:[13F14D8E8]
and     qword ptr ds:[rax+rdi*8],0
inc     ebx
jmp     oglmdi2_vs2019.13F13373F
mov     ecx,8
call    oglmdi2_vs2019.13F1313CC
mov     eax,dword ptr ss:[rsp+20]
mov     rbx,qword ptr ss:[rsp+40]
add     rsp,30
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rdi,r9
mov     rbx,r8
mov     rcx,qword ptr ds:[rdx]
call    oglmdi2_vs2019.13F12E3C4
nop     
mov     rdx,qword ptr ds:[rbx+8]
mov     rax,qword ptr ds:[rbx]
mov     rax,qword ptr ds:[rax]
test    rax,rax
je      oglmdi2_vs2019.13F13385B
mov     ecx,dword ptr ds:[rax+14]
mov     eax,ecx
shr     eax,D
test    al,1
je      oglmdi2_vs2019.13F13385B
mov     eax,ecx
and     al,3
cmp     al,2
jne     oglmdi2_vs2019.13F13381A
test    cl,C0
jne     oglmdi2_vs2019.13F133824
bt      ecx,B
jb      oglmdi2_vs2019.13F133824
inc     dword ptr ds:[rdx]
jmp     oglmdi2_vs2019.13F13385B
mov     rax,qword ptr ds:[rbx+10]
cmp     byte ptr ds:[rax],0
jne     oglmdi2_vs2019.13F13383C
mov     rax,qword ptr ds:[rbx]
mov     rcx,qword ptr ds:[rax]
mov     eax,dword ptr ds:[rcx+14]
shr     eax,1
test    al,1
je      oglmdi2_vs2019.13F13385B
mov     rax,qword ptr ds:[rbx]
mov     rcx,qword ptr ds:[rax]
call    oglmdi2_vs2019.13F133A2C
cmp     eax,FFFFFFFF
je      oglmdi2_vs2019.13F133854
mov     rax,qword ptr ds:[rbx+8]
inc     dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F13385B
mov     rax,qword ptr ds:[rbx+18]
or      dword ptr ds:[rax],FFFFFFFF
mov     rcx,qword ptr ds:[rdi]
call    oglmdi2_vs2019.13F12E3D0
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rsi
push    rdi
push    r14
sub     rsp,60
mov     rsi,r9
mov     rdi,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rbx,qword ptr ds:[13F14D8E8]
movsxd  rax,dword ptr ds:[13F14D8E0]
lea     r14,qword ptr ds:[rbx+rax*8]
mov     qword ptr ss:[rsp+38],rbx
cmp     rbx,r14
je      oglmdi2_vs2019.13F133938
mov     rax,qword ptr ds:[rbx]
mov     qword ptr ss:[rsp+20],rax
mov     rdx,qword ptr ds:[rdi]
test    rax,rax
je      oglmdi2_vs2019.13F1338E1
mov     ecx,dword ptr ds:[rax+14]
mov     eax,ecx
shr     eax,D
test    al,1
je      oglmdi2_vs2019.13F1338E1
mov     eax,ecx
and     al,3
cmp     al,2
jne     oglmdi2_vs2019.13F1338D9
test    cl,C0
jne     oglmdi2_vs2019.13F1338E7
bt      ecx,B
jb      oglmdi2_vs2019.13F1338E7
inc     dword ptr ds:[rdx]
add     rbx,8
jmp     oglmdi2_vs2019.13F1338A2
mov     rdx,qword ptr ds:[rdi+10]
mov     rcx,qword ptr ds:[rdi+8]
mov     rax,qword ptr ds:[rdi]
lea     r8,qword ptr ss:[rsp+20]
mov     qword ptr ss:[rsp+40],r8
mov     qword ptr ss:[rsp+48],rax
mov     qword ptr ss:[rsp+50],rcx
mov     qword ptr ss:[rsp+58],rdx
mov     rax,qword ptr ss:[rsp+20]
mov     qword ptr ss:[rsp+28],rax
mov     qword ptr ss:[rsp+30],rax
lea     r9,qword ptr ss:[rsp+28]
lea     r8,qword ptr ss:[rsp+40]
lea     rdx,qword ptr ss:[rsp+30]
lea     rcx,qword ptr ss:[rsp+88]
call    oglmdi2_vs2019.13F1337D4
jmp     oglmdi2_vs2019.13F1338E1
mov     ecx,dword ptr ds:[rsi]
call    oglmdi2_vs2019.13F1313CC
mov     rbx,qword ptr ss:[rsp+80]
add     rsp,60
pop     r14
pop     rdi
pop     rsi
ret     
mov     byte ptr ss:[rsp+8],cl
push    rbp
mov     rbp,rsp
sub     rsp,40
and     dword ptr ss:[rbp+28],0
lea     rax,qword ptr ss:[rbp+28]
and     dword ptr ss:[rbp+20],0
lea     r9,qword ptr ss:[rbp-20]
mov     qword ptr ss:[rbp-18],rax
lea     r8,qword ptr ss:[rbp-18]
lea     rax,qword ptr ss:[rbp+10]
mov     qword ptr ss:[rbp-10],rax
lea     rdx,qword ptr ss:[rbp-1C]
lea     rax,qword ptr ss:[rbp+20]
mov     qword ptr ss:[rbp-8],rax
lea     rcx,qword ptr ss:[rbp+18]
mov     eax,8
mov     dword ptr ss:[rbp-20],eax
mov     dword ptr ss:[rbp-1C],eax
call    oglmdi2_vs2019.13F133870
cmp     byte ptr ss:[rbp+10],0
mov     eax,dword ptr ss:[rbp+20]
cmovne  eax,dword ptr ss:[rbp+28]
add     rsp,40
pop     rbp
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     rbx,rcx
mov     ecx,dword ptr ds:[rcx+14]
mov     eax,ecx
and     al,3
cmp     al,2
jne     oglmdi2_vs2019.13F133A18
test    cl,C0
je      oglmdi2_vs2019.13F133A18
mov     edi,dword ptr ds:[rbx]
sub     edi,dword ptr ds:[rbx+8]
and     dword ptr ds:[rbx+10],0
mov     rsi,qword ptr ds:[rbx+8]
mov     qword ptr ds:[rbx],rsi
test    edi,edi
jle     oglmdi2_vs2019.13F133A18
mov     rcx,rbx
call    oglmdi2_vs2019.13F133F10
mov     ecx,eax
mov     r8d,edi
mov     rdx,rsi
call    oglmdi2_vs2019.13F13A52C
cmp     edi,eax
je      oglmdi2_vs2019.13F133A09
lock or dword ptr ds:[rbx+14],10
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F133A1A
mov     eax,dword ptr ds:[rbx+14]
shr     eax,2
test    al,1
je      oglmdi2_vs2019.13F133A18
lock and dword ptr ds:[rbx+14],FFFFFFFD
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F133A44
add     rsp,20
pop     rbx
jmp     oglmdi2_vs2019.13F133950
call    oglmdi2_vs2019.13F1339B0
test    eax,eax
jne     oglmdi2_vs2019.13F133A6E
mov     eax,dword ptr ds:[rbx+14]
shr     eax,B
test    al,1
je      oglmdi2_vs2019.13F133A6A
mov     rcx,rbx
call    oglmdi2_vs2019.13F133F10
mov     ecx,eax
call    oglmdi2_vs2019.13F139C38
test    eax,eax
jne     oglmdi2_vs2019.13F133A6E
xor     eax,eax
jmp     oglmdi2_vs2019.13F133A71
or      eax,FFFFFFFF
add     rsp,20
pop     rbx
ret     
int3    
mov     cl,1
jmp     oglmdi2_vs2019.13F133950
int3    
push    rbx
sub     rsp,20
mov     eax,dword ptr ds:[rcx+14]
mov     rbx,rcx
shr     eax,D
test    al,1
je      oglmdi2_vs2019.13F133ABA
mov     eax,dword ptr ds:[rcx+14]
shr     eax,6
test    al,1
je      oglmdi2_vs2019.13F133ABA
mov     rcx,qword ptr ds:[rcx+8]
call    oglmdi2_vs2019.13F133148
lock and dword ptr ds:[rbx+14],FFFFFEBF
xor     eax,eax
mov     qword ptr ds:[rbx+8],rax
mov     qword ptr ds:[rbx],rax
mov     dword ptr ds:[rbx+10],eax
add     rsp,20
pop     rbx
ret     
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,90
lea     rcx,qword ptr ds:[rax-78]
call    qword ptr ds:[<&GetStartupInfoW>]
xor     r14d,r14d
cmp     word ptr ss:[rsp+62],r14w
je      oglmdi2_vs2019.13F133B8F
mov     rax,qword ptr ss:[rsp+68]
test    rax,rax
je      oglmdi2_vs2019.13F133B8F
movsxd  rbx,dword ptr ds:[rax]
lea     rsi,qword ptr ds:[rax+4]
mov     edi,2000
add     rbx,rsi
cmp     dword ptr ds:[rax],edi
cmovl   edi,dword ptr ds:[rax]
mov     ecx,edi
call    oglmdi2_vs2019.13F12E87C
cmp     edi,dword ptr ds:[13F14E280]
cmovg   edi,dword ptr ds:[13F14E280]
test    edi,edi
je      oglmdi2_vs2019.13F133B8F
mov     ebp,r14d
cmp     qword ptr ds:[rbx],FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F133B7F
cmp     qword ptr ds:[rbx],FFFFFFFFFFFFFFFE
je      oglmdi2_vs2019.13F133B7F
test    byte ptr ds:[rsi],1
je      oglmdi2_vs2019.13F133B7F
test    byte ptr ds:[rsi],8
jne     oglmdi2_vs2019.13F133B55
mov     rcx,qword ptr ds:[rbx]
call    qword ptr ds:[<&GetFileType>]
test    eax,eax
je      oglmdi2_vs2019.13F133B7F
mov     rax,rbp
lea     r8,qword ptr ds:[13F14DE80]
mov     rcx,rbp
sar     rcx,6
and     eax,3F
mov     rcx,qword ptr ds:[r8+rcx*8]
lea     rdx,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[rbx]
mov     qword ptr ds:[rcx+rdx*8+28],rax
mov     al,byte ptr ds:[rsi]
mov     byte ptr ds:[rcx+rdx*8+38],al
inc     rbp
inc     rsi
add     rbx,8
sub     rdi,1
jne     oglmdi2_vs2019.13F133B32
lea     r11,qword ptr ss:[rsp+90]
mov     rbx,qword ptr ds:[r11+10]
mov     rbp,qword ptr ds:[r11+18]
mov     rsi,qword ptr ds:[r11+20]
mov     rdi,qword ptr ds:[r11+28]
mov     rsp,r11
pop     r14
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,20
xor     esi,esi
xor     r14d,r14d
movsxd  rcx,esi
lea     rdi,qword ptr ds:[13F14DE80]
mov     rax,rcx
and     ecx,3F
sar     rax,6
lea     rbx,qword ptr ds:[rcx+rcx*8]
mov     rdi,qword ptr ds:[rdi+rax*8]
mov     rax,qword ptr ds:[rdi+rbx*8+28]
add     rax,2
cmp     rax,1
jbe     oglmdi2_vs2019.13F133C03
or      byte ptr ds:[rdi+rbx*8+38],80
jmp     oglmdi2_vs2019.13F133C92
mov     byte ptr ds:[rdi+rbx*8+38],81
mov     ecx,esi
test    esi,esi
je      oglmdi2_vs2019.13F133C24
sub     ecx,1
je      oglmdi2_vs2019.13F133C1D
cmp     ecx,1
mov     ecx,FFFFFFF4
jmp     oglmdi2_vs2019.13F133C29
mov     ecx,FFFFFFF5
jmp     oglmdi2_vs2019.13F133C29
mov     ecx,FFFFFFF6
call    qword ptr ds:[<&GetStdHandle>]
mov     rbp,rax
lea     rcx,qword ptr ds:[rax+1]
cmp     rcx,1
jbe     oglmdi2_vs2019.13F133C47
mov     rcx,rax
call    qword ptr ds:[<&GetFileType>]
jmp     oglmdi2_vs2019.13F133C49
xor     eax,eax
test    eax,eax
je      oglmdi2_vs2019.13F133C6D
movzx   ecx,al
mov     qword ptr ds:[rdi+rbx*8+28],rbp
cmp     ecx,2
jne     oglmdi2_vs2019.13F133C61
or      byte ptr ds:[rdi+rbx*8+38],40
jmp     oglmdi2_vs2019.13F133C92
cmp     ecx,3
jne     oglmdi2_vs2019.13F133C92
or      byte ptr ds:[rdi+rbx*8+38],8
jmp     oglmdi2_vs2019.13F133C92
or      byte ptr ds:[rdi+rbx*8+38],40
mov     qword ptr ds:[rdi+rbx*8+28],FFFFFFFFFFFFFFFE
mov     rax,qword ptr ds:[13F14D8E8]
test    rax,rax
je      oglmdi2_vs2019.13F133C92
mov     rax,qword ptr ds:[r14+rax]
mov     dword ptr ds:[rax+18],FFFFFFFE
inc     esi
add     r14,8
cmp     esi,3
jne     oglmdi2_vs2019.13F133BCE
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
mov     rdi,qword ptr ss:[rsp+48]
add     rsp,20
pop     r14
ret     
push    rbx
sub     rsp,20
mov     ecx,7
call    oglmdi2_vs2019.13F131378
xor     ebx,ebx
xor     ecx,ecx
call    oglmdi2_vs2019.13F12E87C
test    eax,eax
jne     oglmdi2_vs2019.13F133CE5
call    oglmdi2_vs2019.13F133AC0
call    oglmdi2_vs2019.13F133BB0
mov     bl,1
mov     ecx,7
call    oglmdi2_vs2019.13F1313CC
mov     al,bl
add     rsp,20
pop     rbx
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
xor     ebx,ebx
lea     rdi,qword ptr ds:[13F14DE80]
mov     rcx,qword ptr ds:[rbx+rdi]
test    rcx,rcx
je      oglmdi2_vs2019.13F133D1E
call    oglmdi2_vs2019.13F12E82C
and     qword ptr ds:[rbx+rdi],0
add     rbx,8
cmp     rbx,400
jb      oglmdi2_vs2019.13F133D04
mov     rbx,qword ptr ss:[rsp+30]
mov     al,1
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rdi,r9
mov     rbx,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F12E924
nop     
mov     rax,qword ptr ds:[rbx]
movsxd  rcx,dword ptr ds:[rax]
mov     rdx,rcx
mov     rax,rcx
sar     rax,6
lea     r8,qword ptr ds:[13F14DE80]
and     edx,3F
lea     rdx,qword ptr ds:[rdx+rdx*8]
mov     rax,qword ptr ds:[r8+rax*8]
test    byte ptr ds:[rax+rdx*8+38],1
je      oglmdi2_vs2019.13F133D87
call    oglmdi2_vs2019.13F133E50
mov     ebx,eax
jmp     oglmdi2_vs2019.13F133D95
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
or      ebx,FFFFFFFF
mov     ecx,dword ptr ds:[rdi]
call    oglmdi2_vs2019.13F12EA0C
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     dword ptr ss:[rsp+8],ecx
sub     rsp,38
movsxd  rdx,ecx
cmp     edx,FFFFFFFE
jne     oglmdi2_vs2019.13F133DD1
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
jmp     oglmdi2_vs2019.13F133E45
test    ecx,ecx
js      oglmdi2_vs2019.13F133E2D
cmp     edx,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F133E2D
mov     rcx,rdx
lea     r8,qword ptr ds:[13F14DE80]
and     ecx,3F
mov     rax,rdx
sar     rax,6
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[r8+rax*8]
test    byte ptr ds:[rax+rcx*8+38],1
je      oglmdi2_vs2019.13F133E2D
lea     rax,qword ptr ss:[rsp+40]
mov     dword ptr ss:[rsp+50],edx
mov     dword ptr ss:[rsp+58],edx
lea     r9,qword ptr ss:[rsp+50]
lea     rdx,qword ptr ss:[rsp+58]
mov     qword ptr ss:[rsp+20],rax
lea     r8,qword ptr ss:[rsp+20]
lea     rcx,qword ptr ss:[rsp+48]
call    oglmdi2_vs2019.13F133D38
jmp     oglmdi2_vs2019.13F133E48
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
add     rsp,38
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
movsxd  rdi,ecx
mov     ecx,edi
call    oglmdi2_vs2019.13F12EC30
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F133E6E
xor     ebx,ebx
jmp     oglmdi2_vs2019.13F133EC8
mov     rax,qword ptr ds:[13F14DE80]
mov     ecx,2
cmp     edi,1
jne     oglmdi2_vs2019.13F133E88
test    byte ptr ds:[rax+C8],dil
jne     oglmdi2_vs2019.13F133E95
cmp     edi,ecx
jne     oglmdi2_vs2019.13F133EAC
test    byte ptr ds:[rax+80],1
je      oglmdi2_vs2019.13F133EAC
call    oglmdi2_vs2019.13F12EC30
mov     ecx,1
mov     rbx,rax
call    oglmdi2_vs2019.13F12EC30
cmp     rax,rbx
je      oglmdi2_vs2019.13F133E6A
mov     ecx,edi
call    oglmdi2_vs2019.13F12EC30
mov     rcx,rax
call    qword ptr ds:[<&CloseHandle>]
test    eax,eax
jne     oglmdi2_vs2019.13F133E6A
call    qword ptr ds:[<&GetLastError>]
mov     ebx,eax
mov     ecx,edi
call    oglmdi2_vs2019.13F12EB74
mov     rdx,rdi
lea     r8,qword ptr ds:[13F14DE80]
and     edx,3F
mov     rcx,rdi
sar     rcx,6
lea     rdx,qword ptr ds:[rdx+rdx*8]
mov     rcx,qword ptr ds:[r8+rcx*8]
mov     byte ptr ds:[rcx+rdx*8+38],0
test    ebx,ebx
je      oglmdi2_vs2019.13F133F00
mov     ecx,ebx
call    oglmdi2_vs2019.13F133040
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F133F02
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
sub     rsp,28
test    rcx,rcx
jne     oglmdi2_vs2019.13F133F2E
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F133F31
mov     eax,dword ptr ds:[rcx+18]
add     rsp,28
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
and     qword ptr ds:[rcx],0
mov     ecx,8
call    oglmdi2_vs2019.13F131378
nop     
lea     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F133FAC
mov     rdx,qword ptr ds:[rax]
mov     qword ptr ds:[rbx],rdx
test    rdx,rdx
je      oglmdi2_vs2019.13F133F7B
and     dword ptr ds:[rdx+10],0
and     qword ptr ds:[rdx+28],0
and     qword ptr ds:[rdx],0
and     qword ptr ds:[rdx+8],0
or      dword ptr ds:[rdx+18],FFFFFFFF
mov     ecx,8
call    oglmdi2_vs2019.13F1313CC
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
int3    
int3    
or      dword ptr ds:[rcx+18],FFFFFFFF
xor     eax,eax
mov     qword ptr ds:[rcx],rax
mov     qword ptr ds:[rcx+8],rax
mov     dword ptr ds:[rcx+10],eax
mov     qword ptr ds:[rcx+1C],rax
mov     qword ptr ds:[rcx+28],rax
xchg    dword ptr ds:[rcx+14],eax
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
mov     rdi,qword ptr ds:[13F14D8E8]
mov     rsi,rcx
movsxd  rbp,dword ptr ds:[13F14D8E0]
add     rdi,18
add     rbp,FFFFFFFFFFFFFFFD
lea     rbp,qword ptr ds:[rdi+rbp*8]
cmp     rdi,rbp
je      oglmdi2_vs2019.13F13407A
mov     rbx,qword ptr ds:[rdi]
test    rbx,rbx
je      oglmdi2_vs2019.13F13402B
mov     eax,dword ptr ds:[rbx+14]
shr     eax,D
test    al,1
jne     oglmdi2_vs2019.13F134025
mov     rcx,rbx
call    oglmdi2_vs2019.13F12E3C4
prefetchw byte ptr ds:[rbx+14]
mov     eax,dword ptr ds:[rbx+14]
mov     ecx,eax
bts     ecx,D
lock cmpxchg dword ptr ds:[rbx+14],ecx
jne     oglmdi2_vs2019.13F134007
shr     eax,D
not     al
test    al,1
jne     oglmdi2_vs2019.13F134075
mov     rcx,rbx
call    oglmdi2_vs2019.13F12E3D0
add     rdi,8
jmp     oglmdi2_vs2019.13F133FDD
mov     edx,58
lea     ecx,dword ptr ds:[rdx-57]
call    oglmdi2_vs2019.13F1330D0
xor     ecx,ecx
mov     qword ptr ds:[rdi],rax
call    oglmdi2_vs2019.13F133148
mov     rax,qword ptr ds:[rdi]
test    rax,rax
je      oglmdi2_vs2019.13F13407A
or      dword ptr ds:[rax+18],FFFFFFFF
xor     r8d,r8d
mov     rcx,qword ptr ds:[rdi]
mov     edx,FA0
add     rcx,30
call    oglmdi2_vs2019.13F133518
mov     rbx,qword ptr ds:[rdi]
lock or dword ptr ds:[rbx+14],2000
mov     rcx,rbx
call    oglmdi2_vs2019.13F12E3C4
mov     qword ptr ds:[rsi],rbx
jmp     oglmdi2_vs2019.13F13407E
and     qword ptr ds:[rsi],0
mov     rbx,qword ptr ss:[rsp+30]
mov     rax,rsi
mov     rsi,qword ptr ss:[rsp+40]
mov     rbp,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
int3    
int3    
mov     r11,rdx
mov     r10,rcx
test    r8,r8
jne     oglmdi2_vs2019.13F1340A6
xor     eax,eax
ret     
movzx   ecx,word ptr ds:[r10]
lea     r10,qword ptr ds:[r10+2]
movzx   edx,word ptr ds:[r11]
lea     r11,qword ptr ds:[r11+2]
lea     eax,dword ptr ds:[rcx-41]
cmp     eax,19
lea     r9d,dword ptr ds:[rcx+20]
lea     eax,dword ptr ds:[rdx-41]
cmova   r9d,ecx
cmp     eax,19
lea     ecx,dword ptr ds:[rdx+20]
mov     eax,r9d
cmova   ecx,edx
sub     eax,ecx
jne     oglmdi2_vs2019.13F1340E2
test    r9d,r9d
je      oglmdi2_vs2019.13F1340E2
sub     r8,1
jne     oglmdi2_vs2019.13F1340A6
ret     
int3    
mov     r11,rdx
mov     r10,rcx
test    r8,r8
jne     oglmdi2_vs2019.13F1340F2
xor     eax,eax
ret     
movzx   ecx,byte ptr ds:[r10]
movzx   edx,byte ptr ds:[r11]
lea     eax,dword ptr ds:[rcx-41]
cmp     eax,19
lea     r9d,dword ptr ds:[rcx+20]
lea     eax,dword ptr ds:[rdx-41]
cmova   r9d,ecx
inc     r10
inc     r11
lea     ecx,dword ptr ds:[rdx+20]
cmp     eax,19
mov     eax,r9d
cmova   ecx,edx
sub     eax,ecx
jne     oglmdi2_vs2019.13F13412C
test    r9d,r9d
je      oglmdi2_vs2019.13F13412C
sub     r8,1
jne     oglmdi2_vs2019.13F1340F2
ret     
int3    
int3    
int3    
sub     rsp,28
cmp     dword ptr ds:[13F14DC7C],0
jne     oglmdi2_vs2019.13F134173
test    rcx,rcx
jne     oglmdi2_vs2019.13F13415C
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     eax,7FFFFFFF
add     rsp,28
ret     
test    rdx,rdx
je      oglmdi2_vs2019.13F134142
cmp     r8,7FFFFFFF
ja      oglmdi2_vs2019.13F134142
add     rsp,28
jmp     oglmdi2_vs2019.13F1340E4
xor     r9d,r9d
add     rsp,28
jmp     oglmdi2_vs2019.13F134180
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,40
mov     rbx,r8
mov     rdi,rdx
mov     rsi,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F1341B4
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     eax,7FFFFFFF
jmp     oglmdi2_vs2019.13F13421D
test    rdx,rdx
je      oglmdi2_vs2019.13F13419D
cmp     rbx,7FFFFFFF
ja      oglmdi2_vs2019.13F13419D
test    rbx,rbx
jne     oglmdi2_vs2019.13F1341CB
xor     eax,eax
jmp     oglmdi2_vs2019.13F13421D
mov     rdx,r9
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F1301AC
mov     rax,qword ptr ss:[rsp+28]
mov     r8,qword ptr ds:[rax+110]
movzx   eax,byte ptr ds:[rsi]
inc     rsi
movzx   edx,byte ptr ds:[rax+r8]
movzx   eax,byte ptr ds:[rdi]
inc     rdi
movzx   ecx,byte ptr ds:[rax+r8]
mov     eax,edx
sub     eax,ecx
jne     oglmdi2_vs2019.13F13420A
test    edx,edx
je      oglmdi2_vs2019.13F13420A
sub     rbx,1
jne     oglmdi2_vs2019.13F1341E4
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F13421D
mov     rcx,qword ptr ss:[rsp+20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     rbx,qword ptr ss:[rsp+50]
mov     rsi,qword ptr ss:[rsp+58]
add     rsp,40
pop     rdi
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     rbx,rcx
cmp     rcx,FFFFFFFFFFFFFFE0
ja      oglmdi2_vs2019.13F13427B
test    rcx,rcx
mov     eax,1
cmove   rbx,rax
jmp     oglmdi2_vs2019.13F134262
call    oglmdi2_vs2019.13F13225C
test    eax,eax
je      oglmdi2_vs2019.13F13427B
mov     rcx,rbx
call    oglmdi2_vs2019.13F132814
test    eax,eax
je      oglmdi2_vs2019.13F13427B
mov     rcx,qword ptr ds:[13F14E318]
mov     r8,rbx
xor     edx,edx
call    qword ptr ds:[<&RtlAllocateHeap>]
test    rax,rax
je      oglmdi2_vs2019.13F13424D
jmp     oglmdi2_vs2019.13F134288
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],C
xor     eax,eax
add     rsp,20
pop     rbx
ret     
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+20],rsi
push    rdi
sub     rsp,50
mov     rbp,rcx
mov     rdi,r9
lea     rcx,qword ptr ds:[rax-18]
mov     esi,r8d
call    oglmdi2_vs2019.13F12E4C4
xor     ebx,ebx
movsd   xmm0,qword ptr ds:[rax]
mov     eax,dword ptr ds:[rax+8]
movsd   qword ptr ss:[rsp+30],xmm0
mov     dword ptr ss:[rsp+38],eax
cmp     al,bl
je      oglmdi2_vs2019.13F134314
mov     r8d,dword ptr ss:[rsp+30]
lea     rcx,qword ptr ss:[rsp+70]
mov     r9d,esi
mov     dword ptr ss:[rsp+20],180
mov     rdx,rbp
call    oglmdi2_vs2019.13F13B034
test    eax,eax
jne     oglmdi2_vs2019.13F134314
inc     dword ptr ds:[13F14D8F0]
mov     eax,dword ptr ss:[rsp+34]
lock or dword ptr ds:[rdi+14],eax
mov     eax,dword ptr ss:[rsp+70]
mov     dword ptr ds:[rdi+10],ebx
mov     qword ptr ds:[rdi+28],rbx
mov     qword ptr ds:[rdi+8],rbx
mov     qword ptr ds:[rdi],rbx
mov     rbx,rdi
mov     dword ptr ds:[rdi+18],eax
mov     rbp,qword ptr ss:[rsp+68]
mov     rax,rbx
mov     rbx,qword ptr ss:[rsp+60]
mov     rsi,qword ptr ss:[rsp+78]
add     rsp,50
pop     rdi
ret     
mov     qword ptr ss:[rsp+20],rbx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,30
movsxd  r13,ecx
lea     r11,qword ptr ds:[13F14DE80]
mov     rax,r13
mov     r15,r13
and     eax,3F
sar     r15,6
mov     rdi,rdx
mov     r10d,A
lea     rsi,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[r11+r15*8]
mov     rcx,qword ptr ds:[rax+rsi*8+28]
mov     qword ptr ss:[rsp+80],rcx
test    r8,r8
je      oglmdi2_vs2019.13F134386
cmp     byte ptr ds:[rdx],r10b
jne     oglmdi2_vs2019.13F134386
or      byte ptr ds:[rax+rsi*8+38],4
jmp     oglmdi2_vs2019.13F13438B
and     byte ptr ds:[rax+rsi*8+38],FB
lea     rbp,qword ptr ds:[rdx+r8]
mov     r14,rdi
mov     rbx,rdi
cmp     rdi,rbp
jae     oglmdi2_vs2019.13F1344CD
mov     al,byte ptr ds:[r14]
cmp     al,1A
je      oglmdi2_vs2019.13F1344B3
lea     r8,qword ptr ds:[r14+1]
cmp     al,D
je      oglmdi2_vs2019.13F1343BE
mov     byte ptr ds:[rbx],al
mov     r14,r8
inc     rbx
jmp     oglmdi2_vs2019.13F1344A8
cmp     r8,rbp
jae     oglmdi2_vs2019.13F1343E5
cmp     byte ptr ds:[r8],r10b
movzx   ecx,al
cmove   ecx,r10d
xor     eax,eax
cmp     byte ptr ds:[r8],r10b
mov     byte ptr ds:[rbx],cl
sete    al
inc     r14
add     rax,r14
mov     r14,rax
jmp     oglmdi2_vs2019.13F13449D
and     qword ptr ss:[rsp+20],0
lea     r9,qword ptr ss:[rsp+78]
mov     r14,r8
lea     rdx,qword ptr ss:[rsp+70]
mov     r8d,1
call    qword ptr ds:[<&ReadFile>]
test    eax,eax
je      oglmdi2_vs2019.13F13448D
cmp     dword ptr ss:[rsp+78],0
je      oglmdi2_vs2019.13F13448D
mov     rax,r13
lea     r11,qword ptr ds:[13F14DE80]
and     eax,3F
mov     rdx,r13
sar     rdx,6
mov     r10d,A
lea     r9,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[r11+rdx*8]
test    byte ptr ds:[rax+r9*8+38],48
je      oglmdi2_vs2019.13F134459
mov     cl,byte ptr ss:[rsp+70]
cmp     cl,r10b
jne     oglmdi2_vs2019.13F13444B
mov     byte ptr ds:[rbx],r10b
jmp     oglmdi2_vs2019.13F13449D
mov     byte ptr ds:[rbx],D
mov     rax,qword ptr ds:[r11+rdx*8]
mov     byte ptr ds:[rax+r9*8+3A],cl
jmp     oglmdi2_vs2019.13F13449D
cmp     byte ptr ss:[rsp+70],r10b
jne     oglmdi2_vs2019.13F134465
cmp     rbx,rdi
je      oglmdi2_vs2019.13F134446
mov     r8d,1
or      rdx,FFFFFFFFFFFFFFFF
mov     ecx,r13d
call    oglmdi2_vs2019.13F13B54C
mov     r10d,A
lea     r11,qword ptr ds:[13F14DE80]
cmp     byte ptr ss:[rsp+70],r10b
je      oglmdi2_vs2019.13F1344A0
jmp     oglmdi2_vs2019.13F13449A
mov     r10d,A
lea     r11,qword ptr ds:[13F14DE80]
mov     byte ptr ds:[rbx],D
inc     rbx
mov     rcx,qword ptr ss:[rsp+80]
cmp     r14,rbp
jb      oglmdi2_vs2019.13F13439E
jmp     oglmdi2_vs2019.13F1344CD
mov     rcx,qword ptr ds:[r11+r15*8]
mov     al,byte ptr ds:[rcx+rsi*8+38]
test    al,40
jne     oglmdi2_vs2019.13F1344C7
or      al,2
mov     byte ptr ds:[rcx+rsi*8+38],al
jmp     oglmdi2_vs2019.13F1344CD
mov     byte ptr ds:[rbx],1A
inc     rbx
sub     ebx,edi
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+88]
add     rsp,30
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
int3    
int3    
int3    
push    rbx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,38
movsxd  r13,ecx
mov     rsi,rdx
mov     rax,r13
lea     rcx,qword ptr ds:[13F14DE80]
and     eax,3F
mov     r15,r13
sar     r15,6
mov     r9d,A
lea     rdi,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[rcx+r15*8]
mov     r10,qword ptr ds:[rax+rdi*8+28]
mov     qword ptr ss:[rsp+98],r10
test    r8,r8
je      oglmdi2_vs2019.13F134544
cmp     word ptr ds:[rdx],r9w
jne     oglmdi2_vs2019.13F134544
or      byte ptr ds:[rax+rdi*8+38],4
jmp     oglmdi2_vs2019.13F134549
and     byte ptr ds:[rax+rdi*8+38],FB
lea     rbp,qword ptr ds:[rdx+r8*2]
mov     r14,rsi
mov     rbx,rsi
cmp     rsi,rbp
jae     oglmdi2_vs2019.13F13474D
mov     edx,D
lea     r8d,dword ptr ds:[rdx+D]
lea     r11d,dword ptr ds:[rdx-B]
movzx   ecx,word ptr ds:[r14]
cmp     cx,r8w
je      oglmdi2_vs2019.13F13472A
lea     rax,qword ptr ds:[r14+2]
cmp     cx,dx
je      oglmdi2_vs2019.13F13458E
mov     word ptr ds:[rbx],cx
mov     r14,rax
add     rbx,r11
jmp     oglmdi2_vs2019.13F13469D
cmp     rax,rbp
jae     oglmdi2_vs2019.13F1345BC
movzx   edx,word ptr ds:[rax]
cmp     dx,r9w
jne     oglmdi2_vs2019.13F1345A0
movzx   ecx,r9w
cmp     dx,r9w
mov     word ptr ds:[rbx],cx
mov     eax,4
cmovne  rax,r11
add     r14,rax
add     rbx,2
jmp     oglmdi2_vs2019.13F134692
and     qword ptr ss:[rsp+20],0
lea     r9,qword ptr ss:[rsp+90]
mov     r8d,r11d
lea     rdx,qword ptr ss:[rsp+80]
mov     rcx,r10
mov     r14,rax
call    qword ptr ds:[<&ReadFile>]
test    eax,eax
je      oglmdi2_vs2019.13F13470A
cmp     dword ptr ss:[rsp+90],0
je      oglmdi2_vs2019.13F13470A
mov     rax,r13
mov     r8,r13
and     eax,3F
sar     r8,6
lea     r9,qword ptr ds:[rax+rax*8]
lea     rax,qword ptr ds:[13F14DE80]
mov     rax,qword ptr ds:[rax+r8*8]
test    byte ptr ds:[rax+r9*8+38],48
je      oglmdi2_vs2019.13F1346AB
movzx   eax,word ptr ss:[rsp+80]
lea     r10,qword ptr ds:[rbx+2]
mov     ecx,A
lea     r11d,dword ptr ds:[rcx-8]
cmp     ax,cx
jne     oglmdi2_vs2019.13F134642
mov     r9d,ecx
mov     word ptr ds:[rbx],r9w
jmp     oglmdi2_vs2019.13F134687
mov     ecx,D
mov     word ptr ss:[rsp+88],ax
mov     word ptr ds:[rbx],cx
xor     edx,edx
lea     rbx,qword ptr ds:[13F14DE80]
mov     rax,qword ptr ds:[rbx+r8*8]
lea     rcx,qword ptr ds:[rax+r9*8]
mov     al,byte ptr ss:[rsp+rdx+88]
mov     byte ptr ds:[rcx+rdx+3A],al
inc     rdx
cmp     rdx,r11
jl      oglmdi2_vs2019.13F13465B
mov     rax,qword ptr ds:[rbx+r8*8]
mov     ecx,A
mov     byte ptr ds:[rax+r9*8+3C],cl
mov     r9d,ecx
mov     rbx,r10
mov     r10,qword ptr ss:[rsp+98]
mov     edx,D
mov     r8d,1A
cmp     r14,rbp
jb      oglmdi2_vs2019.13F134569
jmp     oglmdi2_vs2019.13F13474D
mov     r9d,A
cmp     word ptr ss:[rsp+80],r9w
jne     oglmdi2_vs2019.13F1346CE
cmp     rbx,rsi
jne     oglmdi2_vs2019.13F1346CE
lea     r11d,dword ptr ds:[r9-8]
mov     word ptr ds:[rbx],r9w
add     rbx,r11
jmp     oglmdi2_vs2019.13F13468A
mov     rdx,FFFFFFFFFFFFFFFE
mov     ecx,r13d
lea     r8d,dword ptr ds:[rdx+3]
call    oglmdi2_vs2019.13F13B54C
mov     r9d,A
lea     r11d,dword ptr ds:[r9-8]
cmp     word ptr ss:[rsp+80],r9w
je      oglmdi2_vs2019.13F13468A
mov     r10,qword ptr ss:[rsp+98]
lea     edx,dword ptr ds:[r9+3]
mov     word ptr ds:[rbx],dx
add     rbx,r11
jmp     oglmdi2_vs2019.13F134697
mov     r10,qword ptr ss:[rsp+98]
mov     edx,D
mov     word ptr ds:[rbx],dx
lea     r11d,dword ptr ds:[rdx-B]
add     rbx,r11
lea     r9d,dword ptr ds:[rdx-3]
jmp     oglmdi2_vs2019.13F134697
lea     rax,qword ptr ds:[13F14DE80]
mov     rcx,qword ptr ds:[rax+r15*8]
mov     al,byte ptr ds:[rcx+rdi*8+38]
test    al,40
jne     oglmdi2_vs2019.13F134746
or      al,r11b
mov     byte ptr ds:[rcx+rdi*8+38],al
jmp     oglmdi2_vs2019.13F13474D
mov     word ptr ds:[rbx],r8w
add     rbx,r11
sub     rbx,rsi
sar     rbx,1
lea     eax,dword ptr ds:[rbx+rbx]
add     rsp,38
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
pop     rbx
ret     
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r12
push    r14
push    r15
sub     rsp,30
movsxd  r14,ecx
mov     r15,r9
mov     ecx,r14d
mov     rbp,rdx
call    oglmdi2_vs2019.13F13432C
movsxd  r8,eax
test    eax,eax
je      oglmdi2_vs2019.13F1348E4
mov     rax,r14
lea     r12,qword ptr ds:[13F120000]
and     eax,3F
mov     rsi,r14
sar     rsi,6
lea     rdi,qword ptr ds:[rax+rax*8]
mov     r9,qword ptr ds:[r12+rsi*8+2DE80]
cmp     byte ptr ds:[r9+rdi*8+39],0
jne     oglmdi2_vs2019.13F1347D1
mov     eax,r8d
jmp     oglmdi2_vs2019.13F1348E4
lea     rcx,qword ptr ds:[r8+rbp]
lea     rbx,qword ptr ds:[rcx-1]
cmp     byte ptr ds:[rbx],0
jl      oglmdi2_vs2019.13F1347E6
mov     rbx,rcx
jmp     oglmdi2_vs2019.13F13488F
mov     r8d,1
mov     edx,r8d
jmp     oglmdi2_vs2019.13F134801
cmp     edx,4
ja      oglmdi2_vs2019.13F13480F
cmp     rbx,rbp
jb      oglmdi2_vs2019.13F13480F
sub     rbx,r8
add     edx,r8d
movzx   eax,byte ptr ds:[rbx]
cmp     byte ptr ds:[rax+r12+2C210],0
je      oglmdi2_vs2019.13F1347F1
movzx   ecx,byte ptr ds:[rbx]
movsx   eax,byte ptr ds:[rcx+r12+2C210]
test    eax,eax
jne     oglmdi2_vs2019.13F134832
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],2A
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F1348E4
inc     eax
cmp     eax,edx
jne     oglmdi2_vs2019.13F13483F
mov     eax,edx
add     rbx,rax
jmp     oglmdi2_vs2019.13F13488F
test    byte ptr ds:[r9+rdi*8+38],48
je      oglmdi2_vs2019.13F134882
add     rbx,r8
mov     byte ptr ds:[r9+rdi*8+3A],cl
cmp     edx,2
jb      oglmdi2_vs2019.13F134865
mov     al,byte ptr ds:[rbx]
add     rbx,r8
mov     rcx,qword ptr ds:[r12+rsi*8+2DE80]
mov     byte ptr ds:[rcx+rdi*8+3B],al
cmp     edx,3
jne     oglmdi2_vs2019.13F13487B
mov     al,byte ptr ds:[rbx]
add     rbx,r8
mov     rcx,qword ptr ds:[r12+rsi*8+2DE80]
mov     byte ptr ds:[rcx+rdi*8+3C],al
mov     eax,edx
sub     rbx,rax
jmp     oglmdi2_vs2019.13F13488F
neg     edx
mov     ecx,r14d
movsxd  rdx,edx
call    oglmdi2_vs2019.13F13B54C
mov     eax,dword ptr ss:[rsp+70]
sub     ebx,ebp
mov     dword ptr ss:[rsp+28],eax
mov     r9d,ebx
mov     r8,rbp
mov     qword ptr ss:[rsp+20],r15
xor     edx,edx
mov     ecx,FDE9
call    oglmdi2_vs2019.13F138AA0
mov     edx,eax
test    eax,eax
jne     oglmdi2_vs2019.13F1348C8
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
jmp     oglmdi2_vs2019.13F13482A
mov     rcx,qword ptr ds:[r12+rsi*8+2DE80]
sub     eax,ebx
and     byte ptr ds:[rcx+rdi*8+3D],FD
neg     eax
sbb     al,al
and     al,2
or      byte ptr ds:[rcx+rdi*8+3D],al
lea     eax,dword ptr ds:[rdx+rdx]
mov     rbx,qword ptr ss:[rsp+50]
mov     rbp,qword ptr ss:[rsp+58]
mov     rsi,qword ptr ss:[rsp+60]
mov     rdi,qword ptr ss:[rsp+68]
add     rsp,30
pop     r15
pop     r14
pop     r12
ret     
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+10],rbx
mov     qword ptr ds:[rax+18],rdi
mov     qword ptr ds:[rax+20],r12
mov     dword ptr ds:[rax+8],ecx
push    r13
push    r14
push    r15
sub     rsp,20
mov     r14d,r8d
mov     r12,rdx
movsxd  rdi,ecx
cmp     edi,FFFFFFFE
jne     oglmdi2_vs2019.13F134946
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
jmp     oglmdi2_vs2019.13F134A00
test    ecx,ecx
js      oglmdi2_vs2019.13F1349E8
cmp     edi,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F1349E8
mov     rax,rdi
mov     r15,rdi
sar     r15,6
lea     rcx,qword ptr ds:[13F14DE80]
and     eax,3F
lea     r13,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[rcx+r15*8]
test    byte ptr ds:[rax+r13*8+38],1
je      oglmdi2_vs2019.13F1349E8
cmp     r14d,7FFFFFFF
jbe     oglmdi2_vs2019.13F13499C
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
jmp     oglmdi2_vs2019.13F1349FB
mov     ecx,edi
call    oglmdi2_vs2019.13F12E924
or      ebx,FFFFFFFF
lea     rax,qword ptr ds:[13F14DE80]
mov     rax,qword ptr ds:[rax+r15*8]
test    byte ptr ds:[rax+r13*8+38],1
jne     oglmdi2_vs2019.13F1349CE
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
jmp     oglmdi2_vs2019.13F1349DD
mov     r8d,r14d
mov     rdx,r12
mov     ecx,edi
call    oglmdi2_vs2019.13F134A20
mov     ebx,eax
mov     ecx,edi
call    oglmdi2_vs2019.13F12EA0C
mov     eax,ebx
jmp     oglmdi2_vs2019.13F134A03
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+48]
mov     rdi,qword ptr ss:[rsp+50]
mov     r12,qword ptr ss:[rsp+58]
add     rsp,20
pop     r15
pop     r14
pop     r13
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+18],rbx
mov     qword ptr ss:[rsp+10],rdx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,60
movsxd  r12,ecx
mov     r10,rdx
mov     r13d,r8d
cmp     r12d,FFFFFFFE
jne     oglmdi2_vs2019.13F134A61
call    oglmdi2_vs2019.13F133090
xor     esi,esi
mov     dword ptr ds:[rax],esi
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
jmp     oglmdi2_vs2019.13F134E5B
xor     esi,esi
test    ecx,ecx
js      oglmdi2_vs2019.13F134E44
cmp     r12d,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F134E44
mov     rax,r12
lea     r9d,dword ptr ds:[rsi+1]
and     eax,3F
mov     qword ptr ss:[rsp+48],r9
mov     r8,r12
lea     rcx,qword ptr ds:[13F14DE80]
sar     r8,6
mov     qword ptr ss:[rsp+40],r8
lea     r14,qword ptr ds:[rax+rax*8]
mov     rcx,qword ptr ds:[rcx+r8*8]
mov     al,byte ptr ds:[rcx+r14*8+38]
test    r9b,al
je      oglmdi2_vs2019.13F134E44
cmp     r13d,7FFFFFFF
jbe     oglmdi2_vs2019.13F134AD0
call    oglmdi2_vs2019.13F133090
mov     dword ptr ds:[rax],esi
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
jmp     oglmdi2_vs2019.13F134E56
test    r13d,r13d
je      oglmdi2_vs2019.13F134E40
test    al,2
jne     oglmdi2_vs2019.13F134E40
test    r10,r10
je      oglmdi2_vs2019.13F134AB9
movsx   r11d,byte ptr ds:[rcx+r14*8+39]
mov     rbx,rsi
mov     rax,qword ptr ds:[rcx+r14*8+28]
mov     edx,r11d
mov     qword ptr ss:[rsp+38],rax
mov     edi,4
mov     byte ptr ss:[rsp+A0],r11b
sub     edx,r9d
je      oglmdi2_vs2019.13F134B4B
cmp     edx,r9d
jne     oglmdi2_vs2019.13F134B39
mov     eax,r13d
not     eax
test    r9b,al
jne     oglmdi2_vs2019.13F134B39
call    oglmdi2_vs2019.13F133090
mov     dword ptr ds:[rax],esi
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F134CD4
mov     ebp,r13d
lea     rdx,qword ptr ds:[13F14DE80]
mov     r15,r10
jmp     oglmdi2_vs2019.13F134BCF
mov     eax,r13d
not     eax
test    r9b,al
je      oglmdi2_vs2019.13F134B1D
mov     ebp,r13d
shr     ebp,1
cmp     ebp,edi
cmovb   ebp,edi
mov     ecx,ebp
call    oglmdi2_vs2019.13F134230
xor     ecx,ecx
mov     rbx,rax
call    oglmdi2_vs2019.13F133148
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     r15,rbx
test    rbx,rbx
jne     oglmdi2_vs2019.13F134B9A
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],C
call    oglmdi2_vs2019.13F133090
mov     dword ptr ds:[rax],8
jmp     oglmdi2_vs2019.13F134CD4
xor     edx,edx
mov     ecx,r12d
lea     r8d,dword ptr ds:[rdx+1]
call    oglmdi2_vs2019.13F13B54C
mov     r8,qword ptr ss:[rsp+40]
lea     rdx,qword ptr ds:[13F14DE80]
mov     r11b,byte ptr ss:[rsp+A0]
mov     r9d,1
mov     rcx,qword ptr ds:[rdx+r8*8]
mov     qword ptr ds:[rcx+r14*8+30],rax
mov     rcx,qword ptr ds:[rdx+r8*8]
test    byte ptr ds:[rcx+r14*8+38],48
mov     edi,esi
mov     qword ptr ss:[rsp+50],r15
mov     r10d,A
je      oglmdi2_vs2019.13F134C5E
mov     al,byte ptr ds:[rcx+r14*8+3A]
cmp     al,r10b
je      oglmdi2_vs2019.13F134C5E
test    ebp,ebp
je      oglmdi2_vs2019.13F134C5E
mov     byte ptr ds:[r15],al
dec     ebp
mov     rax,qword ptr ds:[rdx+r8*8]
add     r15,r9
mov     edi,r9d
mov     byte ptr ds:[rax+r14*8+3A],r10b
test    r11b,r11b
je      oglmdi2_vs2019.13F134C5E
mov     rax,qword ptr ds:[rdx+r8*8]
mov     cl,byte ptr ds:[rax+r14*8+3B]
cmp     cl,r10b
je      oglmdi2_vs2019.13F134C5E
test    ebp,ebp
je      oglmdi2_vs2019.13F134C5E
mov     byte ptr ds:[r15],cl
lea     edi,dword ptr ds:[r10-8]
mov     rax,qword ptr ds:[rdx+r8*8]
add     r15,r9
dec     ebp
mov     byte ptr ds:[rax+r14*8+3B],r10b
cmp     r11b,r9b
jne     oglmdi2_vs2019.13F134C5E
mov     rax,qword ptr ds:[rdx+r8*8]
mov     cl,byte ptr ds:[rax+r14*8+3C]
cmp     cl,r10b
je      oglmdi2_vs2019.13F134C5E
test    ebp,ebp
je      oglmdi2_vs2019.13F134C5E
mov     byte ptr ds:[r15],cl
lea     edi,dword ptr ds:[r10-7]
mov     rax,qword ptr ds:[rdx+r8*8]
add     r15,r9
dec     ebp
mov     byte ptr ds:[rax+r14*8+3C],r10b
mov     ecx,r12d
call    oglmdi2_vs2019.13F13B450
test    eax,eax
je      oglmdi2_vs2019.13F134CF2
mov     rax,qword ptr ss:[rsp+40]
lea     rcx,qword ptr ds:[13F14DE80]
mov     rax,qword ptr ds:[rcx+rax*8]
cmp     byte ptr ds:[rax+r14*8+38],sil
jge     oglmdi2_vs2019.13F134CF2
mov     rcx,qword ptr ss:[rsp+38]
lea     rdx,qword ptr ss:[rsp+30]
call    qword ptr ds:[<&GetConsoleMode>]
test    eax,eax
je      oglmdi2_vs2019.13F134CF2
cmp     byte ptr ss:[rsp+A0],2
jne     oglmdi2_vs2019.13F134CF7
mov     rcx,qword ptr ss:[rsp+38]
lea     r9,qword ptr ss:[rsp+B8]
shr     ebp,1
mov     rdx,r15
mov     r8d,ebp
mov     qword ptr ss:[rsp+20],rsi
call    qword ptr ds:[<&ReadConsoleW>]
test    eax,eax
jne     oglmdi2_vs2019.13F134CE6
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
or      edi,FFFFFFFF
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
mov     eax,edi
jmp     oglmdi2_vs2019.13F134E5E
mov     eax,dword ptr ss:[rsp+B8]
lea     edi,dword ptr ds:[rdi+rax*2]
jmp     oglmdi2_vs2019.13F134D32
mov     byte ptr ss:[rsp+48],sil
mov     rcx,qword ptr ss:[rsp+38]
lea     r9,qword ptr ss:[rsp+B8]
mov     r8d,ebp
mov     qword ptr ss:[rsp+20],rsi
mov     rdx,r15
call    qword ptr ds:[<&ReadFile>]
test    eax,eax
je      oglmdi2_vs2019.13F134E0A
cmp     dword ptr ss:[rsp+B8],r13d
ja      oglmdi2_vs2019.13F134E0A
add     edi,dword ptr ss:[rsp+B8]
mov     rdx,qword ptr ss:[rsp+40]
lea     r11,qword ptr ds:[13F14DE80]
mov     rax,qword ptr ds:[r11+rdx*8]
cmp     byte ptr ds:[rax+r14*8+38],sil
jge     oglmdi2_vs2019.13F134CD7
cmp     byte ptr ss:[rsp+A0],2
movsxd  r8,edi
je      oglmdi2_vs2019.13F134D7B
mov     r9,qword ptr ss:[rsp+A8]
mov     rax,r13
shr     rax,1
mov     rdx,r15
mov     ecx,r12d
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F134768
mov     edi,eax
jmp     oglmdi2_vs2019.13F134CD7
shr     r8,1
cmp     byte ptr ss:[rsp+48],sil
je      oglmdi2_vs2019.13F134DF8
mov     r10,qword ptr ss:[rsp+50]
mov     rax,r10
mov     rdi,r10
lea     r9,qword ptr ds:[r10+r8*2]
cmp     r10,r9
jae     oglmdi2_vs2019.13F134DEB
mov     esi,A
movzx   ecx,word ptr ds:[rax]
cmp     cx,1A
je      oglmdi2_vs2019.13F134DE1
cmp     cx,D
jne     oglmdi2_vs2019.13F134DC7
lea     r8,qword ptr ds:[rax+2]
cmp     r8,r9
jae     oglmdi2_vs2019.13F134DC7
cmp     word ptr ds:[r8],si
jne     oglmdi2_vs2019.13F134DC7
movzx   ecx,si
mov     r8d,4
jmp     oglmdi2_vs2019.13F134DCD
mov     r8d,2
add     rax,r8
mov     word ptr ds:[rdi],cx
lea     r8,qword ptr ds:[rdi+2]
mov     rdi,r8
cmp     rax,r9
jb      oglmdi2_vs2019.13F134D9E
jmp     oglmdi2_vs2019.13F134DEB
mov     rax,qword ptr ds:[r11+rdx*8]
or      byte ptr ds:[rax+r14*8+38],2
sub     rdi,r10
sar     rdi,1
add     edi,edi
jmp     oglmdi2_vs2019.13F134CD7
mov     rdx,qword ptr ss:[rsp+50]
mov     ecx,r12d
call    oglmdi2_vs2019.13F1344EC
jmp     oglmdi2_vs2019.13F134D74
call    qword ptr ds:[<&GetLastError>]
cmp     eax,5
jne     oglmdi2_vs2019.13F134E30
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F133090
mov     dword ptr ds:[rax],5
jmp     oglmdi2_vs2019.13F134CD4
cmp     eax,6D
jne     oglmdi2_vs2019.13F134CCD
mov     edi,esi
jmp     oglmdi2_vs2019.13F134CD7
xor     eax,eax
jmp     oglmdi2_vs2019.13F134E5E
call    oglmdi2_vs2019.13F133090
mov     dword ptr ds:[rax],esi
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+B0]
add     rsp,60
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+18],rdi
push    r14
sub     rsp,20
mov     rdi,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F134EAA
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F134FC7
mov     eax,dword ptr ds:[rcx+14]
shr     eax,D
test    al,1
je      oglmdi2_vs2019.13F134FC7
mov     eax,dword ptr ds:[rcx+14]
shr     eax,C
test    al,1
jne     oglmdi2_vs2019.13F134FC7
mov     eax,dword ptr ds:[rcx+14]
shr     eax,1
test    al,1
je      oglmdi2_vs2019.13F134ED9
lock or dword ptr ds:[rcx+14],10
jmp     oglmdi2_vs2019.13F134FC7
lock or dword ptr ds:[rcx+14],1
mov     eax,dword ptr ds:[rcx+14]
test    eax,4C0
jne     oglmdi2_vs2019.13F134EED
call    oglmdi2_vs2019.13F13B554
mov     rbx,qword ptr ds:[rdi+8]
mov     rcx,rdi
mov     qword ptr ds:[rdi],rbx
call    oglmdi2_vs2019.13F133F10
mov     r8d,dword ptr ds:[rdi+20]
mov     ecx,eax
mov     rdx,rbx
call    oglmdi2_vs2019.13F134904
mov     dword ptr ds:[rdi+10],eax
lea     ecx,dword ptr ds:[rax+1]
cmp     ecx,1
jbe     oglmdi2_vs2019.13F134FB5
mov     eax,dword ptr ds:[rdi+14]
or      esi,FFFFFFFF
test    al,6
jne     oglmdi2_vs2019.13F134F80
mov     rcx,rdi
call    oglmdi2_vs2019.13F133F10
cmp     eax,esi
je      oglmdi2_vs2019.13F134F6B
mov     rcx,rdi
call    oglmdi2_vs2019.13F133F10
cmp     eax,FFFFFFFE
je      oglmdi2_vs2019.13F134F6B
mov     rcx,rdi
call    oglmdi2_vs2019.13F133F10
movsxd  rbx,eax
lea     r14,qword ptr ds:[13F14DE80]
mov     rcx,rdi
sar     rbx,6
call    oglmdi2_vs2019.13F133F10
and     eax,3F
lea     rcx,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[r14+rbx*8]
lea     rdx,qword ptr ds:[rax+rcx*8]
jmp     oglmdi2_vs2019.13F134F72
lea     rdx,qword ptr ds:[13F14C1C0]
mov     al,byte ptr ds:[rdx+38]
and     al,82
cmp     al,82
jne     oglmdi2_vs2019.13F134F80
lock or dword ptr ds:[rdi+14],20
cmp     dword ptr ds:[rdi+20],200
jne     oglmdi2_vs2019.13F134FA4
mov     eax,dword ptr ds:[rdi+14]
shr     eax,6
test    al,1
je      oglmdi2_vs2019.13F134FA4
mov     eax,dword ptr ds:[rdi+14]
shr     eax,8
test    al,1
jne     oglmdi2_vs2019.13F134FA4
mov     dword ptr ds:[rdi+20],1000
add     dword ptr ds:[rdi+10],esi
mov     rax,qword ptr ds:[rdi]
movzx   esi,byte ptr ds:[rax]
inc     rax
mov     qword ptr ds:[rdi],rax
jmp     oglmdi2_vs2019.13F134FCA
neg     eax
sbb     eax,eax
and     eax,8
add     eax,8
lock or dword ptr ds:[rdi+14],eax
and     dword ptr ds:[rdi+10],0
or      esi,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+30]
mov     eax,esi
mov     rsi,qword ptr ss:[rsp+38]
mov     rdi,qword ptr ss:[rsp+40]
add     rsp,20
pop     r14
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
lea     r9,qword ptr ds:[13F142DB0]
movq    r11,xmm0
mov     rcx,r11
shr     r11,34
sub     r11,3FF
mov     r10,r11
shr     r10,3
sub     r10,86
neg     r10
mov     rax,qword ptr ds:[r9+r10]
shl     rcx,C
shr     rcx,C
bts     rcx,34
add     r10,8
movdqu  xmm0,xmmword ptr ds:[r9+r10]
mul     rcx
mov     r8,rax
mov     r10,rdx
movq    rax,xmm0
mul     rcx
and     r11,7
psrldq  xmm0,8
add     rax,r10
adc     rdx,0
mov     r9,rax
mov     r10,rdx
movq    rax,xmm0
mul     rcx
add     r10,rax
mov     rcx,36
mov     rax,r10
sub     rcx,r11
xor     rdx,rdx
shr     rax,cl
jae     oglmdi2_vs2019.13F135090
not     r10
not     r9
not     r8
movabs  rdx,8000000000000000
adc     rax,0
and     rax,3
movq    xmm1,rax
mov     rcx,r11
add     rcx,A
shl     r10,cl
shr     r10,cl
sub     rcx,40
mov     r11,rcx
bsr     rcx,r10
jne     oglmdi2_vs2019.13F1350D0
mov     r10,r9
mov     r9,r8
bsr     rcx,r10
sub     r11,40
nop     word ptr ds:[rax+rax]
add     r11,rcx
sub     rcx,34
cmp     rcx,0
jl      oglmdi2_vs2019.13F1350F0
je      oglmdi2_vs2019.13F135110
mov     r8,r10
shr     r10,cl
jmp     oglmdi2_vs2019.13F135110
nop     word ptr ds:[rax+rax]
neg     rcx
mov     rax,r9
shl     r10,cl
shl     r9,cl
sub     rcx,40
neg     rcx
shr     rax,cl
or      r10,rax
nop     dword ptr ds:[rax]
add     r11,3FF
btr     r10,34
mov     rcx,r11
or      r10,rdx
shl     rcx,34
or      r10,rcx
movq    xmm0,r10
movq    rax,xmm1
mulsd   xmm0,qword ptr ds:[13F142BE0]
ret     
int3    
int3    
int3    
int3    
sub     rsp,38
lea     r9,qword ptr ds:[13F142DB0]
vmovq   r11,xmm0
mov     rcx,r11
shr     r11,34
sub     r11,3FF
mov     r10,r11
shr     r10,3
sub     r10,86
neg     r10
mov     rax,qword ptr ds:[r9+r10]
shl     rcx,C
shr     rcx,C
bts     rcx,34
add     r10,8
vmovdqu xmm0,xmmword ptr ds:[r9+r10]
mul     rcx
mov     r8,rax
mov     r10,rdx
vmovq   rax,xmm0
mul     rcx
and     r11,7
vpsrldq xmm0,xmm0,8
add     rax,r10
adc     rdx,0
mov     r9,rax
mov     r10,rdx
vmovq   rax,xmm0
mul     rcx
add     r10,rax
mov     rcx,36
mov     rax,r10
sub     rcx,r11
xor     rdx,rdx
shr     rax,cl
jae     oglmdi2_vs2019.13F1351F0
not     r10
not     r9
not     r8
movabs  rdx,8000000000000000
nop     word ptr ds:[rax+rax]
adc     rax,0
and     rax,3
mov     qword ptr ss:[rsp+20],rax
mov     rcx,r11
add     rcx,A
shl     r10,cl
shr     r10,cl
sub     rcx,40
mov     r11,rcx
bsr     rcx,r10
jne     oglmdi2_vs2019.13F135230
mov     r10,r9
mov     r9,r8
mov     r8,0
bsr     rcx,r10
sub     r11,40
nop     dword ptr ds:[rax]
add     r11,rcx
sub     rcx,34
cmp     rcx,0
jl      oglmdi2_vs2019.13F135260
je      oglmdi2_vs2019.13F135280
mov     r8,r10
shr     r10,cl
shr     r9,cl
sub     rcx,40
neg     rcx
shl     r8,cl
or      r9,r8
jmp     oglmdi2_vs2019.13F135280
nop     word ptr ds:[rax+rax]
neg     rcx
mov     rax,r9
shl     r10,cl
shl     r9,cl
sub     rcx,40
neg     rcx
shr     rax,cl
or      r10,rax
shr     r8,cl
or      r9,r8
nop     
add     r11,3FF
btr     r10,34
mov     rcx,r11
or      r10,rdx
shl     rcx,34
or      r10,rcx
vmovq   xmm2,r10
bsr     rcx,r9
sub     rcx,40
neg     rcx
shl     r9,cl
shr     r9,C
add     rcx,34
sub     r11,rcx
shl     r11,34
or      r9,rdx
or      r9,r11
vmovq   xmm1,r9
vandpd  xmm4,xmm2,xmmword ptr ds:[13F142C00]
vsubsd  xmm0,xmm2,xmm4
vmulsd  xmm5,xmm2,qword ptr ds:[13F142BF0]
vmulsd  xmm3,xmm4,qword ptr ds:[13F142C10]
vsubsd  xmm3,xmm3,xmm5
vfmadd231sd xmm3,xmm0,qword ptr ds:[13F142C10]
vfmadd231sd xmm3,xmm4,qword ptr ds:[13F142C20]
vfmadd231sd xmm3,xmm0,qword ptr ds:[13F142C20]
vmulsd  xmm4,xmm1,qword ptr ds:[13F142BF0]
vfmadd231sd xmm4,xmm2,qword ptr ds:[13F142C30]
vaddsd  xmm3,xmm3,xmm4
vaddsd  xmm0,xmm5,xmm3
vsubsd  xmm1,xmm5,xmm0
vaddsd  xmm1,xmm1,xmm3
mov     rax,qword ptr ss:[rsp+20]
add     rsp,38
ret     
nop     dword ptr ds:[rax]
vmovapd xmm1,xmm0
vmovapd xmm4,xmmword ptr ds:[13F142D20]
vmovapd xmm2,xmmword ptr ds:[13F142D40]
vfmadd132sd xmm1,xmm2,qword ptr ds:[13F142D00]
vsubsd  xmm1,xmm1,xmm2
vcvttpd2dq xmm5,xmm1
vmovq   rax,xmm5
vmovapd xmm2,xmm1
vfnmadd132sd xmm2,xmm0,qword ptr ds:[13F142D10]
vmulsd  xmm3,xmm1,xmm4
vmovapd xmm0,xmm1
vfmsub213sd xmm0,xmm4,xmm3
vsubsd  xmm5,xmm2,xmm3
vsubsd  xmm4,xmm2,xmm5
vsubsd  xmm4,xmm4,xmm3
vfnmadd231sd xmm2,xmm1,qword ptr ds:[13F142D20]
vsubsd  xmm5,xmm5,xmm2
vaddsd  xmm5,xmm5,xmm4
vsubsd  xmm5,xmm5,xmm0
vmovapd xmm0,xmm2
vfnmadd132sd xmm1,xmm5,qword ptr ds:[13F142D30]
and     rax,3
ret     
int3    
mov     r8d,12
lea     rdx,qword ptr ds:[13F142D58]
jmp     oglmdi2_vs2019.13F1353BC
int3    
int3    
sub     rsp,58
and     qword ptr ss:[rsp+78],0
movaps  xmm1,xmm0
movss   dword ptr ss:[rsp+78],xmm1
mov     r11,rdx
mov     ecx,dword ptr ss:[rsp+78]
mov     edx,7F800000
mov     eax,ecx
mov     r10d,r8d
and     eax,edx
cmp     eax,edx
jne     oglmdi2_vs2019.13F13543A
test    ecx,7FFFFF
jne     oglmdi2_vs2019.13F135432
mov     r9d,1
mov     dword ptr ss:[rsp+78],FFC00000
mov     r8,qword ptr ss:[rsp+78]
xorps   xmm0,xmm0
mov     dword ptr ss:[rsp+40],r9d
mov     edx,r10d
movss   dword ptr ss:[rsp+38],xmm0
mov     rcx,r11
movss   dword ptr ss:[rsp+30],xmm1
mov     dword ptr ss:[rsp+28],21
mov     dword ptr ss:[rsp+20],8
call    oglmdi2_vs2019.13F135978
jmp     oglmdi2_vs2019.13F13543A
bts     ecx,16
mov     dword ptr ss:[rsp+78],ecx
movss   xmm0,dword ptr ss:[rsp+78]
add     rsp,58
ret     
int3    
int3    
int3    
mov     r8d,1E
lea     rdx,qword ptr ds:[13F142D50]
jmp     oglmdi2_vs2019.13F1353BC
int3    
int3    
push    rbx
sub     rsp,20
call    oglmdi2_vs2019.13F13B5D0
mov     ebx,eax
and     ebx,3F
call    oglmdi2_vs2019.13F13B5EA
mov     eax,ebx
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+18],rbx
mov     qword ptr ss:[rsp+20],rsi
push    rdi
sub     rsp,20
mov     rbx,rdx
mov     rdi,rcx
call    oglmdi2_vs2019.13F13B5D0
mov     esi,eax
mov     dword ptr ss:[rsp+38],eax
mov     ecx,ebx
not     ecx
or      ecx,FFFF807F
and     ecx,eax
and     edi,ebx
or      ecx,edi
mov     dword ptr ss:[rsp+30],ecx
cmp     byte ptr ds:[13F14C310],0
je      oglmdi2_vs2019.13F1354DE
test    cl,40
je      oglmdi2_vs2019.13F1354DE
call    oglmdi2_vs2019.13F13B5E0
jmp     oglmdi2_vs2019.13F1354E6
mov     byte ptr ds:[13F14C310],0
mov     ecx,dword ptr ss:[rsp+30]
and     ecx,FFFFFFBF
call    oglmdi2_vs2019.13F13B5E0
mov     esi,dword ptr ss:[rsp+38]
jmp     oglmdi2_vs2019.13F1354E6
and     ecx,FFFFFFBF
call    oglmdi2_vs2019.13F13B5E0
mov     eax,esi
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+48]
add     rsp,20
pop     rdi
ret     
push    rbx
sub     rsp,20
mov     rbx,rcx
call    oglmdi2_vs2019.13F13B5D0
and     ebx,3F
or      eax,ebx
mov     ecx,eax
add     rsp,20
pop     rbx
jmp     oglmdi2_vs2019.13F13B5E0
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F13B5D0
and     eax,3F
add     rsp,28
ret     
int3    
int3    
int3    
int3    
int3    
int3    
int3    
push    rbx
sub     rsp,10
xor     r8d,r8d
xor     ecx,ecx
mov     dword ptr ds:[13F14E284],r8d
lea     r9d,dword ptr ds:[r8+1]
mov     eax,r9d
cpuid   
mov     dword ptr ss:[rsp],eax
mov     eax,18001000
mov     dword ptr ss:[rsp+8],ecx
and     ecx,eax
mov     dword ptr ss:[rsp+4],ebx
mov     dword ptr ss:[rsp+C],edx
cmp     ecx,eax
jne     oglmdi2_vs2019.13F135591
xor     ecx,ecx
xgetbv  
shl     rdx,20
or      rdx,rax
mov     qword ptr ss:[rsp+20],rdx
mov     rax,qword ptr ss:[rsp+20]
mov     r8d,dword ptr ds:[13F14E284]
and     al,6
cmp     al,6
cmove   r8d,r9d
mov     dword ptr ds:[13F14E284],r8d
mov     dword ptr ds:[13F14E288],r8d
xor     eax,eax
add     rsp,10
pop     rbx
ret     
sub     rsp,88
mov     qword ptr ss:[rsp+20],rdi
mov     qword ptr ss:[rsp+30],rsi
mov     rdi,rcx
mov     rsi,rdx
mov     rdx,r8
movq    xmm0,rdi
lea     r9,qword ptr ds:[13F142E60]
movq    r11,xmm0
mov     rcx,r11
shr     r11,34
sub     r11,3FF
mov     r10,r11
shr     r10,3
sub     r10,86
neg     r10
mov     rax,qword ptr ds:[r9+r10]
mov     rdi,rdx
shl     rcx,C
shr     rcx,C
bts     rcx,34
add     r10,8
movdqu  xmm0,xmmword ptr ds:[r9+r10]
mul     rcx
mov     r8,rax
mov     r10,rdx
movq    rax,xmm0
mul     rcx
and     r11,7
psrldq  xmm0,8
add     rax,r10
adc     rdx,0
mov     r9,rax
mov     r10,rdx
movq    rax,xmm0
mul     rcx
add     r10,rax
mov     rcx,36
mov     rax,r10
sub     rcx,r11
xor     rdx,rdx
shr     rax,cl
jae     oglmdi2_vs2019.13F135670
not     r10
not     r9
not     r8
movabs  rdx,8000000000000000
nop     word ptr ds:[rax+rax]
adc     rax,0
and     rax,3
mov     dword ptr ds:[rdi],eax
mov     rcx,r11
add     rcx,A
shl     r10,cl
shr     r10,cl
sub     rcx,40
mov     r11,rcx
bsr     rcx,r10
jne     oglmdi2_vs2019.13F1356B0
mov     r10,r9
mov     r9,r8
bsr     rcx,r10
sub     r11,40
nop     word ptr ds:[rax+rax]
add     r11,rcx
sub     rcx,34
cmp     rcx,0
jl      oglmdi2_vs2019.13F1356D0
je      oglmdi2_vs2019.13F1356F0
mov     r8,r10
shr     r10,cl
jmp     oglmdi2_vs2019.13F1356F0
nop     word ptr ds:[rax+rax]
neg     rcx
mov     rax,r9
shl     r10,cl
shl     r9,cl
sub     rcx,40
neg     rcx
shr     rax,cl
or      r10,rax
nop     dword ptr ds:[rax]
add     r11,3FF
btr     r10,34
mov     rcx,r11
or      r10,rdx
shl     rcx,34
or      r10,rcx
movq    xmm0,r10
mulsd   xmm0,qword ptr ds:[13F142E50]
movsd   qword ptr ds:[rsi],xmm0
mov     rsi,qword ptr ss:[rsp+30]
mov     rdi,qword ptr ss:[rsp+20]
add     rsp,88
ret     
mov     rax,rsp
push    rbx
sub     rsp,50
movsd   xmm0,qword ptr ss:[rsp+80]
mov     ebx,ecx
movsd   xmm1,qword ptr ss:[rsp+88]
mov     edx,FFC0
mov     dword ptr ds:[rax-38],ecx
mov     rcx,qword ptr ss:[rsp+90]
movsd   qword ptr ds:[rax-20],xmm0
movsd   qword ptr ds:[rax-18],xmm1
movsd   qword ptr ds:[rax-28],xmm3
mov     qword ptr ds:[rax-30],r8
call    oglmdi2_vs2019.13F13547C
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F1315C4
test    eax,eax
jne     oglmdi2_vs2019.13F135785
mov     ecx,ebx
call    oglmdi2_vs2019.13F13B984
movsd   xmm0,qword ptr ss:[rsp+40]
add     rsp,50
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     ebx,ecx
mov     rsi,rdx
and     ebx,1F
mov     edi,ecx
test    cl,8
je      oglmdi2_vs2019.13F1357C6
test    sil,sil
jns     oglmdi2_vs2019.13F1357C6
mov     ecx,1
call    oglmdi2_vs2019.13F1354F8
and     ebx,FFFFFFF7
jmp     oglmdi2_vs2019.13F13581D
mov     ecx,4
test    cl,dil
je      oglmdi2_vs2019.13F1357E1
bt      rsi,9
jae     oglmdi2_vs2019.13F1357E1
call    oglmdi2_vs2019.13F1354F8
and     ebx,FFFFFFFB
jmp     oglmdi2_vs2019.13F13581D
test    dil,1
je      oglmdi2_vs2019.13F1357FD
bt      rsi,A
jae     oglmdi2_vs2019.13F1357FD
mov     ecx,8
call    oglmdi2_vs2019.13F1354F8
and     ebx,FFFFFFFE
jmp     oglmdi2_vs2019.13F13581D
test    dil,2
je      oglmdi2_vs2019.13F13581D
bt      rsi,B
jae     oglmdi2_vs2019.13F13581D
test    dil,10
je      oglmdi2_vs2019.13F13581A
mov     ecx,10
call    oglmdi2_vs2019.13F1354F8
and     ebx,FFFFFFFD
test    dil,10
je      oglmdi2_vs2019.13F135837
bt      rsi,C
jae     oglmdi2_vs2019.13F135837
mov     ecx,20
call    oglmdi2_vs2019.13F1354F8
and     ebx,FFFFFFEF
mov     rsi,qword ptr ss:[rsp+38]
xor     eax,eax
test    ebx,ebx
mov     rbx,qword ptr ss:[rsp+30]
sete    al
add     rsp,20
pop     rdi
ret     
int3    
int3    
mov     rax,rsp
push    rbp
push    rbx
push    rsi
push    rdi
push    r14
lea     rbp,qword ptr ds:[rax-37]
sub     rsp,F0
movaps  xmmword ptr ds:[rax-38],xmm6
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp-11],rax
mov     esi,edx
mov     r14,rcx
mov     edx,FFC0
mov     ecx,1F80
mov     edi,r9d
mov     rbx,r8
call    oglmdi2_vs2019.13F13547C
mov     ecx,dword ptr ss:[rbp+5F]
mov     qword ptr ss:[rsp+40],rax
mov     qword ptr ss:[rsp+50],rbx
movsd   xmm0,qword ptr ss:[rsp+50]
mov     rdx,qword ptr ss:[rsp+40]
movsd   qword ptr ss:[rsp+48],xmm0
call    oglmdi2_vs2019.13F135794
movsd   xmm6,qword ptr ss:[rbp+77]
test    eax,eax
jne     oglmdi2_vs2019.13F1358FC
cmp     dword ptr ss:[rbp+7F],2
jne     oglmdi2_vs2019.13F1358D3
mov     eax,dword ptr ss:[rbp-41]
and     eax,FFFFFFE3
movsd   qword ptr ss:[rbp-51],xmm6
or      eax,3
mov     dword ptr ss:[rbp-41],eax
mov     r8d,dword ptr ss:[rbp+5F]
lea     rax,qword ptr ss:[rsp+48]
mov     qword ptr ss:[rsp+28],rax
lea     rdx,qword ptr ss:[rsp+40]
lea     rax,qword ptr ss:[rbp+6F]
mov     r9d,esi
lea     rcx,qword ptr ss:[rsp+60]
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F13B620
call    oglmdi2_vs2019.13F13159C
test    al,al
je      oglmdi2_vs2019.13F135939
test    edi,edi
je      oglmdi2_vs2019.13F135939
mov     rax,qword ptr ss:[rsp+40]
mov     r8,r14
movsd   xmm0,qword ptr ss:[rsp+48]
mov     ecx,edi
movsd   xmm3,qword ptr ss:[rbp+6F]
mov     edx,dword ptr ss:[rbp+67]
mov     qword ptr ss:[rsp+30],rax
movsd   qword ptr ss:[rsp+28],xmm0
movsd   qword ptr ss:[rsp+20],xmm6
call    oglmdi2_vs2019.13F13572C
jmp     oglmdi2_vs2019.13F135955
mov     ecx,edi
call    oglmdi2_vs2019.13F13B984
mov     rcx,qword ptr ss:[rsp+40]
mov     edx,FFC0
call    oglmdi2_vs2019.13F13547C
movsd   xmm0,qword ptr ss:[rsp+48]
mov     rcx,qword ptr ss:[rbp-11]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
movaps  xmm6,xmmword ptr ss:[rsp+E0]
add     rsp,F0
pop     r14
pop     rdi
pop     rsi
pop     rbx
pop     rbp
ret     
int3    
mov     rax,rsp
push    rbp
push    rbx
push    rsi
push    rdi
push    r14
lea     rbp,qword ptr ds:[rax-37]
sub     rsp,F0
movaps  xmmword ptr ds:[rax-38],xmm6
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp-11],rax
mov     esi,edx
mov     r14,rcx
mov     edx,FFC0
mov     ecx,1F80
mov     edi,r9d
mov     rbx,r8
call    oglmdi2_vs2019.13F13547C
mov     ecx,dword ptr ss:[rbp+5F]
mov     qword ptr ss:[rsp+48],rax
mov     dword ptr ss:[rsp+50],ebx
movss   xmm0,dword ptr ss:[rsp+50]
mov     rdx,qword ptr ss:[rsp+48]
movss   dword ptr ss:[rsp+40],xmm0
call    oglmdi2_vs2019.13F135794
movss   xmm6,dword ptr ss:[rbp+77]
test    eax,eax
jne     oglmdi2_vs2019.13F135A23
cmp     dword ptr ss:[rbp+7F],2
jne     oglmdi2_vs2019.13F1359FA
mov     eax,dword ptr ss:[rbp-41]
and     eax,FFFFFFE1
movss   dword ptr ss:[rbp-51],xmm6
or      eax,1
mov     dword ptr ss:[rbp-41],eax
mov     r8d,dword ptr ss:[rbp+5F]
lea     rax,qword ptr ss:[rsp+40]
mov     qword ptr ss:[rsp+28],rax
lea     rdx,qword ptr ss:[rsp+48]
lea     rax,qword ptr ss:[rbp+6F]
mov     r9d,esi
lea     rcx,qword ptr ss:[rsp+60]
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F13B958
call    oglmdi2_vs2019.13F13159C
test    al,al
je      oglmdi2_vs2019.13F135A6D
test    edi,edi
je      oglmdi2_vs2019.13F135A6D
movss   xmm0,dword ptr ss:[rsp+40]
mov     r8,r14
movss   xmm3,dword ptr ss:[rbp+6F]
mov     ecx,edi
mov     rax,qword ptr ss:[rsp+48]
mov     edx,dword ptr ss:[rbp+67]
mov     qword ptr ss:[rsp+30],rax
cvtps2pd xmm0,xmm0
cvtps2pd xmm1,xmm6
movsd   qword ptr ss:[rsp+28],xmm0
cvtps2pd xmm3,xmm3
movsd   qword ptr ss:[rsp+20],xmm1
call    oglmdi2_vs2019.13F13572C
cvtsd2ss xmm0,xmm0
jmp     oglmdi2_vs2019.13F135A89
mov     ecx,edi
call    oglmdi2_vs2019.13F13B984
mov     rcx,qword ptr ss:[rsp+48]
mov     edx,FFC0
call    oglmdi2_vs2019.13F13547C
movss   xmm0,dword ptr ss:[rsp+40]
mov     rcx,qword ptr ss:[rbp-11]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
movaps  xmm6,xmmword ptr ss:[rsp+E0]
add     rsp,F0
pop     r14
pop     rdi
pop     rsi
pop     rbx
pop     rbp
ret     
int3    
movabs  rax,8000000000000
or      rcx,rax
mov     qword ptr ss:[rsp+8],rcx
movsd   xmm0,qword ptr ss:[rsp+8]
ret     
int3    
int3    
int3    
sub     rsp,38
mov     qword ptr ss:[rsp+20],rcx
mov     qword ptr ss:[rsp+28],rdx
test    rdx,rdx
je      oglmdi2_vs2019.13F135ADE
mov     qword ptr ds:[rdx],rcx
mov     r9b,1
lea     rdx,qword ptr ss:[rsp+20]
xor     ecx,ecx
call    oglmdi2_vs2019.13F132938
add     rsp,38
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,50
xor     ebp,ebp
mov     rsi,r8
mov     rdi,rdx
mov     rbx,rcx
test    rdx,rdx
je      oglmdi2_vs2019.13F135C54
test    r8,r8
je      oglmdi2_vs2019.13F135C54
cmp     byte ptr ds:[rdx],bpl
jne     oglmdi2_vs2019.13F135B3B
test    rcx,rcx
je      oglmdi2_vs2019.13F135C5B
mov     word ptr ds:[rcx],bp
jmp     oglmdi2_vs2019.13F135C5B
mov     rdx,r9
lea     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F1301AC
mov     rax,qword ptr ss:[rsp+38]
cmp     dword ptr ds:[rax+C],FDE9
jne     oglmdi2_vs2019.13F135B78
lea     r9,qword ptr ds:[13F14E290]
mov     r8,rsi
mov     rdx,rdi
mov     rcx,rbx
call    oglmdi2_vs2019.13F13BA00
mov     rcx,rax
or      eax,FFFFFFFF
test    ecx,ecx
cmovs   ecx,eax
jmp     oglmdi2_vs2019.13F135B91
cmp     qword ptr ds:[rax+138],rbp
jne     oglmdi2_vs2019.13F135BAB
test    rbx,rbx
je      oglmdi2_vs2019.13F135B8C
movzx   eax,byte ptr ds:[rdi]
mov     word ptr ds:[rbx],ax
mov     ecx,1
cmp     byte ptr ss:[rsp+48],bpl
je      oglmdi2_vs2019.13F135BA4
mov     rax,qword ptr ss:[rsp+30]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     eax,ecx
jmp     oglmdi2_vs2019.13F135C5D
movzx   ecx,byte ptr ds:[rdi]
lea     rdx,qword ptr ss:[rsp+38]
call    oglmdi2_vs2019.13F13B9B4
test    eax,eax
je      oglmdi2_vs2019.13F135C0E
mov     rcx,qword ptr ss:[rsp+38]
mov     r9d,dword ptr ds:[rcx+8]
cmp     r9d,1
jle     oglmdi2_vs2019.13F135BFA
cmp     esi,r9d
jl      oglmdi2_vs2019.13F135BFA
mov     ecx,dword ptr ds:[rcx+C]
mov     eax,ebp
test    rbx,rbx
mov     r8,rdi
mov     edx,9
setne   al
mov     dword ptr ss:[rsp+28],eax
mov     qword ptr ss:[rsp+20],rbx
call    oglmdi2_vs2019.13F138AA0
mov     rcx,qword ptr ss:[rsp+38]
test    eax,eax
jne     oglmdi2_vs2019.13F135C09
movsxd  rax,dword ptr ds:[rcx+8]
cmp     rsi,rax
jb      oglmdi2_vs2019.13F135C41
cmp     byte ptr ds:[rdi+1],bpl
je      oglmdi2_vs2019.13F135C41
mov     ecx,dword ptr ds:[rcx+8]
jmp     oglmdi2_vs2019.13F135B91
mov     eax,ebp
mov     r9d,1
test    rbx,rbx
mov     r8,rdi
setne   al
mov     dword ptr ss:[rsp+28],eax
lea     edx,dword ptr ds:[r9+8]
mov     rax,qword ptr ss:[rsp+38]
mov     qword ptr ss:[rsp+20],rbx
mov     ecx,dword ptr ds:[rax+C]
call    oglmdi2_vs2019.13F138AA0
test    eax,eax
jne     oglmdi2_vs2019.13F135B8C
call    oglmdi2_vs2019.13F1330B0
or      ecx,FFFFFFFF
mov     dword ptr ds:[rax],2A
jmp     oglmdi2_vs2019.13F135B91
mov     qword ptr ds:[13F14E290],rbp
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+68]
mov     rsi,qword ptr ss:[rsp+70]
add     rsp,50
pop     rdi
ret     
int3    
int3    
xor     r9d,r9d
jmp     oglmdi2_vs2019.13F135AF4
mov     qword ptr ss:[rsp+8],rbx
mov     word ptr ss:[rsp+20],r9w
push    rbp
push    rsi
push    rdi
mov     rbp,rsp
sub     rsp,60
mov     rsi,r8
mov     rdi,rdx
mov     rbx,rcx
test    rdx,rdx
jne     oglmdi2_vs2019.13F135CB2
test    r8,r8
je      oglmdi2_vs2019.13F135CB2
test    rcx,rcx
je      oglmdi2_vs2019.13F135CAB
and     dword ptr ds:[rcx],edx
xor     eax,eax
jmp     oglmdi2_vs2019.13F135D71
test    rbx,rbx
je      oglmdi2_vs2019.13F135CBA
or      dword ptr ds:[rcx],FFFFFFFF
cmp     rsi,7FFFFFFF
jbe     oglmdi2_vs2019.13F135CD9
call    oglmdi2_vs2019.13F1330B0
mov     ebx,16
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F135D6F
mov     rdx,qword ptr ss:[rbp+40]
lea     rcx,qword ptr ss:[rbp-20]
call    oglmdi2_vs2019.13F1301AC
mov     rax,qword ptr ss:[rbp-18]
mov     ecx,dword ptr ds:[rax+C]
cmp     ecx,FDE9
jne     oglmdi2_vs2019.13F135D23
movzx   edx,word ptr ss:[rbp+38]
lea     r8,qword ptr ss:[rbp+28]
and     qword ptr ss:[rbp+28],0
mov     rcx,rdi
call    oglmdi2_vs2019.13F13BBB4
test    rbx,rbx
je      oglmdi2_vs2019.13F135D11
mov     dword ptr ds:[rbx],eax
cmp     eax,4
jle     oglmdi2_vs2019.13F135DD8
call    oglmdi2_vs2019.13F1330B0
mov     ebx,dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F135D5E
cmp     qword ptr ds:[rax+138],0
jne     oglmdi2_vs2019.13F135D9A
movzx   eax,word ptr ss:[rbp+38]
mov     ecx,FF
cmp     ax,cx
jbe     oglmdi2_vs2019.13F135D81
test    rdi,rdi
je      oglmdi2_vs2019.13F135D52
test    rsi,rsi
je      oglmdi2_vs2019.13F135D52
mov     r8,rsi
xor     edx,edx
mov     rcx,rdi
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     ebx,2A
mov     dword ptr ds:[rax],ebx
cmp     byte ptr ss:[rbp-8],0
je      oglmdi2_vs2019.13F135D6F
mov     rcx,qword ptr ss:[rbp-20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+80]
add     rsp,60
pop     rdi
pop     rsi
pop     rbp
ret     
test    rdi,rdi
je      oglmdi2_vs2019.13F135D8D
test    rsi,rsi
je      oglmdi2_vs2019.13F135E02
mov     byte ptr ds:[rdi],al
test    rbx,rbx
je      oglmdi2_vs2019.13F135DD8
mov     dword ptr ds:[rbx],1
jmp     oglmdi2_vs2019.13F135DD8
and     dword ptr ss:[rbp+28],0
lea     rax,qword ptr ss:[rbp+28]
mov     qword ptr ss:[rsp+38],rax
lea     r8,qword ptr ss:[rbp+38]
and     qword ptr ss:[rsp+30],0
mov     r9d,1
mov     dword ptr ss:[rsp+28],esi
xor     edx,edx
mov     qword ptr ss:[rsp+20],rdi
call    oglmdi2_vs2019.13F138AFC
test    eax,eax
je      oglmdi2_vs2019.13F135DDC
cmp     dword ptr ss:[rbp+28],0
jne     oglmdi2_vs2019.13F135D52
test    rbx,rbx
je      oglmdi2_vs2019.13F135DD8
mov     dword ptr ds:[rbx],eax
xor     ebx,ebx
jmp     oglmdi2_vs2019.13F135D5E
call    qword ptr ds:[<&GetLastError>]
cmp     eax,7A
jne     oglmdi2_vs2019.13F135D52
test    rdi,rdi
je      oglmdi2_vs2019.13F135E02
test    rsi,rsi
je      oglmdi2_vs2019.13F135E02
mov     r8,rsi
xor     edx,edx
mov     rcx,rdi
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     ebx,22
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F135D5E
sub     rsp,38
and     qword ptr ss:[rsp+20],0
call    oglmdi2_vs2019.13F135C7C
add     rsp,38
ret     
mov     eax,dword ptr ds:[13F14C068]
mov     r9,rcx
cmp     eax,5
jl      oglmdi2_vs2019.13F135ED1
mov     r8,rcx
mov     eax,20
and     r8d,1F
sub     rax,r8
neg     r8
sbb     r10,r10
and     r10,rax
mov     rax,r9
cmp     rdx,r10
cmovb   r10,rdx
add     rcx,r10
cmp     r9,rcx
je      oglmdi2_vs2019.13F135E75
cmp     byte ptr ds:[rax],0
je      oglmdi2_vs2019.13F135E75
inc     rax
cmp     rax,rcx
jne     oglmdi2_vs2019.13F135E68
mov     rcx,rax
sub     rcx,r9
cmp     rcx,r10
jne     oglmdi2_vs2019.13F135F78
mov     r8,rdx
mov     rcx,rax
sub     r8,r10
and     r8,FFFFFFFFFFFFFFE0
add     r8,rax
cmp     rax,r8
je      oglmdi2_vs2019.13F135EB5
vpxor   xmm1,xmm1,xmm1
vpcmpeqb ymm1,ymm1,yword ptr ds:[rcx]
vpmovmskb eax,ymm1
test    eax,eax
vzeroupper 
jne     oglmdi2_vs2019.13F135EB5
add     rcx,20
cmp     rcx,r8
jne     oglmdi2_vs2019.13F135E99
lea     rax,qword ptr ds:[r9+rdx]
jmp     oglmdi2_vs2019.13F135EC7
cmp     byte ptr ds:[rcx],0
je      oglmdi2_vs2019.13F135F75
inc     rcx
cmp     rcx,rax
jne     oglmdi2_vs2019.13F135EBB
jmp     oglmdi2_vs2019.13F135F75
cmp     eax,1
jl      oglmdi2_vs2019.13F135F5F
and     ecx,F
mov     eax,10
sub     rax,rcx
neg     rcx
sbb     r10,r10
and     r10,rax
mov     rax,r9
cmp     rdx,r10
cmovb   r10,rdx
lea     rcx,qword ptr ds:[r10+r9]
cmp     r9,rcx
je      oglmdi2_vs2019.13F135F0E
cmp     byte ptr ds:[rax],0
je      oglmdi2_vs2019.13F135F0E
inc     rax
cmp     rax,rcx
jne     oglmdi2_vs2019.13F135F01
mov     rcx,rax
sub     rcx,r9
cmp     rcx,r10
jne     oglmdi2_vs2019.13F135F78
mov     r8,rdx
mov     rcx,rax
sub     r8,r10
xorps   xmm1,xmm1
and     r8,FFFFFFFFFFFFFFF0
add     r8,rax
cmp     rax,r8
je      oglmdi2_vs2019.13F135F4A
movdqa  xmm0,xmm1
pcmpeqb xmm0,xmmword ptr ds:[rcx]
pmovmskb eax,xmm0
test    eax,eax
jne     oglmdi2_vs2019.13F135F4A
add     rcx,10
cmp     rcx,r8
jne     oglmdi2_vs2019.13F135F31
lea     rax,qword ptr ds:[r9+rdx]
jmp     oglmdi2_vs2019.13F135F58
cmp     byte ptr ds:[rcx],0
je      oglmdi2_vs2019.13F135F75
inc     rcx
cmp     rcx,rax
jne     oglmdi2_vs2019.13F135F50
jmp     oglmdi2_vs2019.13F135F75
lea     rax,qword ptr ds:[rcx+rdx]
cmp     r9,rax
je      oglmdi2_vs2019.13F135F75
cmp     byte ptr ds:[rcx],0
je      oglmdi2_vs2019.13F135F75
inc     rcx
cmp     rcx,rax
jne     oglmdi2_vs2019.13F135F68
sub     rcx,r9
mov     rax,rcx
ret     
mov     eax,dword ptr ds:[13F14C068]
mov     r10,rdx
mov     r8,rcx
cmp     eax,5
jl      oglmdi2_vs2019.13F13605D
test    r8b,1
je      oglmdi2_vs2019.13F135FC0
lea     rax,qword ptr ds:[rcx+rdx*2]
mov     rdx,rcx
cmp     rcx,rax
je      oglmdi2_vs2019.13F136148
xor     ecx,ecx
cmp     word ptr ds:[rdx],cx
je      oglmdi2_vs2019.13F136148
add     rdx,2
cmp     rdx,rax
jne     oglmdi2_vs2019.13F135FA9
jmp     oglmdi2_vs2019.13F136148
and     ecx,1F
mov     eax,20
sub     rax,rcx
mov     rdx,r8
neg     rcx
sbb     r11,r11
and     r11,rax
shr     r11,1
cmp     r10,r11
cmovb   r11,r10
xor     ecx,ecx
lea     rax,qword ptr ds:[r8+r11*2]
cmp     r8,rax
je      oglmdi2_vs2019.13F135FFA
cmp     word ptr ds:[rdx],cx
je      oglmdi2_vs2019.13F135FFA
add     rdx,2
cmp     rdx,rax
jne     oglmdi2_vs2019.13F135FEC
sub     rdx,r8
sar     rdx,1
cmp     rdx,r11
jne     oglmdi2_vs2019.13F13614E
lea     r9,qword ptr ds:[r8+rdx*2]
mov     rax,r10
sub     rax,r11
and     rax,FFFFFFFFFFFFFFE0
add     rax,rdx
lea     rdx,qword ptr ds:[r8+rax*2]
cmp     r9,rdx
je      oglmdi2_vs2019.13F136040
vpxor   xmm1,xmm1,xmm1
vpcmpeqw ymm1,ymm1,yword ptr ds:[r9]
vpmovmskb eax,ymm1
test    eax,eax
vzeroupper 
jne     oglmdi2_vs2019.13F136040
add     r9,20
cmp     r9,rdx
jne     oglmdi2_vs2019.13F136023
lea     rax,qword ptr ds:[r8+r10*2]
jmp     oglmdi2_vs2019.13F136050
cmp     word ptr ds:[r9],cx
je      oglmdi2_vs2019.13F136055
add     r9,2
cmp     r9,rax
jne     oglmdi2_vs2019.13F136046
mov     rdx,r9
jmp     oglmdi2_vs2019.13F136148
cmp     eax,1
jl      oglmdi2_vs2019.13F13612C
test    r8b,1
je      oglmdi2_vs2019.13F136095
lea     rax,qword ptr ds:[rcx+rdx*2]
mov     rdx,r8
cmp     r8,rax
je      oglmdi2_vs2019.13F136148
xor     ecx,ecx
cmp     word ptr ds:[rdx],cx
je      oglmdi2_vs2019.13F136148
add     rdx,2
cmp     rdx,rax
jne     oglmdi2_vs2019.13F13607E
jmp     oglmdi2_vs2019.13F136148
and     ecx,F
mov     eax,10
sub     rax,rcx
mov     rdx,r8
neg     rcx
sbb     r11,r11
and     r11,rax
shr     r11,1
cmp     r10,r11
cmovb   r11,r10
xor     ecx,ecx
lea     rax,qword ptr ds:[r8+r11*2]
cmp     r8,rax
je      oglmdi2_vs2019.13F1360CF
cmp     word ptr ds:[rdx],cx
je      oglmdi2_vs2019.13F1360CF
add     rdx,2
cmp     rdx,rax
jne     oglmdi2_vs2019.13F1360C1
sub     rdx,r8
sar     rdx,1
cmp     rdx,r11
jne     oglmdi2_vs2019.13F13614E
mov     rax,r10
lea     r9,qword ptr ds:[r8+rdx*2]
sub     rax,r11
xorps   xmm1,xmm1
and     rax,FFFFFFFFFFFFFFF0
add     rax,rdx
lea     rdx,qword ptr ds:[r8+rax*2]
jmp     oglmdi2_vs2019.13F136109
movdqa  xmm0,xmm1
pcmpeqw xmm0,xmmword ptr ds:[r9]
pmovmskb eax,xmm0
test    eax,eax
jne     oglmdi2_vs2019.13F13610E
add     r9,10
cmp     r9,rdx
jne     oglmdi2_vs2019.13F1360F4
lea     rax,qword ptr ds:[r8+r10*2]
jmp     oglmdi2_vs2019.13F136122
cmp     word ptr ds:[r9],cx
je      oglmdi2_vs2019.13F136055
add     r9,2
cmp     r9,rax
jne     oglmdi2_vs2019.13F136114
jmp     oglmdi2_vs2019.13F136055
lea     rax,qword ptr ds:[rcx+rdx*2]
mov     rdx,r8
cmp     r8,rax
je      oglmdi2_vs2019.13F136148
xor     ecx,ecx
cmp     word ptr ds:[rdx],cx
je      oglmdi2_vs2019.13F136148
add     rdx,2
cmp     rdx,rax
jne     oglmdi2_vs2019.13F13613A
sub     rdx,r8
sar     rdx,1
mov     rax,rdx
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rbx,r9
mov     rdi,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rax,qword ptr ds:[rdi]
mov     rcx,qword ptr ds:[rax]
mov     rax,qword ptr ds:[rcx+88]
lock inc dword ptr ds:[rax]
mov     ecx,dword ptr ds:[rbx]
call    oglmdi2_vs2019.13F1313CC
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rbx,r9
mov     rdi,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rcx,qword ptr ds:[rdi]
xor     edx,edx
mov     rcx,qword ptr ds:[rcx]
call    oglmdi2_vs2019.13F136464
nop     
mov     ecx,dword ptr ds:[rbx]
call    oglmdi2_vs2019.13F1313CC
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rbx,r9
mov     rdi,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rax,qword ptr ds:[rdi+8]
mov     rdx,qword ptr ds:[rax]
mov     rcx,qword ptr ds:[rdi]
mov     rdx,qword ptr ds:[rdx]
mov     rcx,qword ptr ds:[rcx]
call    oglmdi2_vs2019.13F136464
nop     
mov     ecx,dword ptr ds:[rbx]
call    oglmdi2_vs2019.13F1313CC
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rbx,r9
mov     rdi,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rax,qword ptr ds:[rdi]
mov     rcx,qword ptr ds:[rax]
mov     rcx,qword ptr ds:[rcx+88]
test    rcx,rcx
je      oglmdi2_vs2019.13F136269
or      eax,FFFFFFFF
lock xadd dword ptr ds:[rcx],eax
cmp     eax,1
jne     oglmdi2_vs2019.13F136269
lea     rax,qword ptr ds:[13F14C4A0]
cmp     rcx,rax
je      oglmdi2_vs2019.13F136269
call    oglmdi2_vs2019.13F133148
nop     
mov     ecx,dword ptr ds:[rbx]
call    oglmdi2_vs2019.13F1313CC
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
push    rbp
mov     rbp,rsp
sub     rsp,50
mov     qword ptr ss:[rbp-28],rcx
lea     rax,qword ptr ss:[rbp-28]
mov     qword ptr ss:[rbp-18],rax
lea     r9,qword ptr ss:[rbp+20]
mov     edx,1
lea     r8,qword ptr ss:[rbp-18]
mov     eax,5
mov     dword ptr ss:[rbp+20],eax
mov     dword ptr ss:[rbp+28],eax
lea     rax,qword ptr ss:[rbp-28]
mov     qword ptr ss:[rbp-10],rax
lea     rax,qword ptr ss:[rbp-20]
mov     qword ptr ss:[rbp-8],rax
mov     eax,4
mov     dword ptr ss:[rbp-30],eax
mov     dword ptr ss:[rbp-2C],eax
lea     rax,qword ptr ds:[13F14E2B0]
mov     qword ptr ss:[rbp-20],rax
mov     dword ptr ds:[rcx+28],edx
lea     rcx,qword ptr ds:[13F1422D0]
mov     rax,qword ptr ss:[rbp-28]
mov     qword ptr ds:[rax],rcx
lea     rcx,qword ptr ds:[13F14C4A0]
mov     rax,qword ptr ss:[rbp-28]
mov     dword ptr ds:[rax+3A8],edx
mov     rax,qword ptr ss:[rbp-28]
mov     qword ptr ds:[rax+88],rcx
lea     ecx,dword ptr ds:[rdx+42]
mov     rax,qword ptr ss:[rbp-28]
lea     rdx,qword ptr ss:[rbp+28]
mov     word ptr ds:[rax+BC],cx
mov     rax,qword ptr ss:[rbp-28]
mov     word ptr ds:[rax+1C2],cx
lea     rcx,qword ptr ss:[rbp+18]
mov     rax,qword ptr ss:[rbp-28]
and     qword ptr ds:[rax+3A0],0
call    oglmdi2_vs2019.13F136154
lea     r9,qword ptr ss:[rbp-30]
lea     r8,qword ptr ss:[rbp-10]
lea     rdx,qword ptr ss:[rbp-2C]
lea     rcx,qword ptr ss:[rbp+18]
call    oglmdi2_vs2019.13F1361D4
add     rsp,50
pop     rbp
ret     
int3    
int3    
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F13636B
push    rbx
sub     rsp,20
mov     rbx,rcx
call    oglmdi2_vs2019.13F13636C
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
add     rsp,20
pop     rbx
ret     
push    rbp
mov     rbp,rsp
sub     rsp,40
lea     rax,qword ptr ss:[rbp-18]
mov     qword ptr ss:[rbp-18],rcx
mov     qword ptr ss:[rbp-10],rax
lea     rdx,qword ptr ds:[13F1422D0]
mov     eax,5
mov     dword ptr ss:[rbp+20],eax
mov     dword ptr ss:[rbp+28],eax
lea     rax,qword ptr ss:[rbp-18]
mov     qword ptr ss:[rbp-8],rax
mov     eax,4
mov     dword ptr ss:[rbp-20],eax
mov     dword ptr ss:[rbp-1C],eax
mov     rax,qword ptr ds:[rcx]
cmp     rax,rdx
je      oglmdi2_vs2019.13F1363BA
mov     rcx,rax
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+70]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+58]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+60]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+68]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+48]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+50]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+78]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+80]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ss:[rbp-18]
mov     rcx,qword ptr ds:[rcx+3C0]
call    oglmdi2_vs2019.13F133148
lea     r9,qword ptr ss:[rbp+20]
lea     r8,qword ptr ss:[rbp-10]
lea     rdx,qword ptr ss:[rbp+28]
lea     rcx,qword ptr ss:[rbp+18]
call    oglmdi2_vs2019.13F13621C
lea     r9,qword ptr ss:[rbp-20]
lea     r8,qword ptr ss:[rbp-8]
lea     rdx,qword ptr ss:[rbp-1C]
lea     rcx,qword ptr ss:[rbp+18]
call    oglmdi2_vs2019.13F136194
add     rsp,40
pop     rbp
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rdi,rcx
mov     rbx,rdx
mov     rcx,qword ptr ds:[rcx+90]
test    rcx,rcx
je      oglmdi2_vs2019.13F1364AC
call    oglmdi2_vs2019.13F1393F8
mov     rcx,qword ptr ds:[rdi+90]
cmp     rcx,qword ptr ds:[13F14E2B0]
je      oglmdi2_vs2019.13F1364AC
lea     rax,qword ptr ds:[13F14C330]
cmp     rcx,rax
je      oglmdi2_vs2019.13F1364AC
cmp     dword ptr ds:[rcx+10],0
jne     oglmdi2_vs2019.13F1364AC
call    oglmdi2_vs2019.13F1391F8
mov     qword ptr ds:[rdi+90],rbx
test    rbx,rbx
je      oglmdi2_vs2019.13F1364C0
mov     rcx,rbx
call    oglmdi2_vs2019.13F13916C
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
call    qword ptr ds:[<&GetLastError>]
mov     ecx,dword ptr ds:[13F14C320]
mov     ebx,eax
cmp     ecx,FFFFFFFF
je      oglmdi2_vs2019.13F13650D
call    oglmdi2_vs2019.13F13347C
mov     rdi,rax
test    rax,rax
je      oglmdi2_vs2019.13F136507
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F136574
xor     edi,edi
xor     esi,esi
jmp     oglmdi2_vs2019.13F136577
mov     ecx,dword ptr ds:[13F14C320]
or      rdx,FFFFFFFFFFFFFFFF
call    oglmdi2_vs2019.13F1334C4
test    eax,eax
je      oglmdi2_vs2019.13F136501
mov     edx,3C8
mov     ecx,1
call    oglmdi2_vs2019.13F1330D0
mov     ecx,dword ptr ds:[13F14C320]
mov     rdi,rax
test    rax,rax
jne     oglmdi2_vs2019.13F136547
xor     edx,edx
call    oglmdi2_vs2019.13F1334C4
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F136501
mov     rdx,rdi
call    oglmdi2_vs2019.13F1334C4
test    eax,eax
jne     oglmdi2_vs2019.13F136565
mov     ecx,dword ptr ds:[13F14C320]
xor     edx,edx
call    oglmdi2_vs2019.13F1334C4
mov     rcx,rdi
jmp     oglmdi2_vs2019.13F136540
mov     rcx,rdi
call    oglmdi2_vs2019.13F13627C
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     rsi,rdi
mov     ecx,ebx
call    qword ptr ds:[<&SetLastError>]
neg     rdi
sbb     rax,rax
and     rax,rsi
je      oglmdi2_vs2019.13F13659A
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
call    oglmdi2_vs2019.13F132878
int3    
push    rbx
sub     rsp,20
mov     ecx,dword ptr ds:[13F14C320]
cmp     ecx,FFFFFFFF
je      oglmdi2_vs2019.13F1365CC
call    oglmdi2_vs2019.13F13347C
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F1365C6
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F136641
jmp     oglmdi2_vs2019.13F136633
mov     ecx,dword ptr ds:[13F14C320]
or      rdx,FFFFFFFFFFFFFFFF
call    oglmdi2_vs2019.13F1334C4
test    eax,eax
je      oglmdi2_vs2019.13F136641
mov     edx,3C8
mov     ecx,1
call    oglmdi2_vs2019.13F1330D0
mov     ecx,dword ptr ds:[13F14C320]
mov     rbx,rax
test    rax,rax
jne     oglmdi2_vs2019.13F136606
xor     edx,edx
call    oglmdi2_vs2019.13F1334C4
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F136641
mov     rdx,rbx
call    oglmdi2_vs2019.13F1334C4
test    eax,eax
jne     oglmdi2_vs2019.13F136624
mov     ecx,dword ptr ds:[13F14C320]
xor     edx,edx
call    oglmdi2_vs2019.13F1334C4
mov     rcx,rbx
jmp     oglmdi2_vs2019.13F1365FF
mov     rcx,rbx
call    oglmdi2_vs2019.13F13627C
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
test    rbx,rbx
je      oglmdi2_vs2019.13F136641
mov     rax,rbx
add     rsp,20
pop     rbx
ret     
call    oglmdi2_vs2019.13F132878
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
call    qword ptr ds:[<&GetLastError>]
mov     ecx,dword ptr ds:[13F14C320]
mov     ebx,eax
cmp     ecx,FFFFFFFF
je      oglmdi2_vs2019.13F136689
call    oglmdi2_vs2019.13F13347C
mov     rdi,rax
test    rax,rax
je      oglmdi2_vs2019.13F136683
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F1366F0
xor     edi,edi
xor     esi,esi
jmp     oglmdi2_vs2019.13F1366F3
mov     ecx,dword ptr ds:[13F14C320]
or      rdx,FFFFFFFFFFFFFFFF
call    oglmdi2_vs2019.13F1334C4
test    eax,eax
je      oglmdi2_vs2019.13F13667D
mov     edx,3C8
mov     ecx,1
call    oglmdi2_vs2019.13F1330D0
mov     ecx,dword ptr ds:[13F14C320]
mov     rdi,rax
test    rax,rax
jne     oglmdi2_vs2019.13F1366C3
xor     edx,edx
call    oglmdi2_vs2019.13F1334C4
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F13667D
mov     rdx,rdi
call    oglmdi2_vs2019.13F1334C4
test    eax,eax
jne     oglmdi2_vs2019.13F1366E1
mov     ecx,dword ptr ds:[13F14C320]
xor     edx,edx
call    oglmdi2_vs2019.13F1334C4
mov     rcx,rdi
jmp     oglmdi2_vs2019.13F1366BC
mov     rcx,rdi
call    oglmdi2_vs2019.13F13627C
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     rsi,rdi
mov     ecx,ebx
call    qword ptr ds:[<&SetLastError>]
mov     rbx,qword ptr ss:[rsp+30]
neg     rdi
sbb     rax,rax
and     rax,rsi
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
sub     rsp,28
lea     rcx,qword ptr ds:[13F13634C]
call    oglmdi2_vs2019.13F1333EC
mov     dword ptr ds:[13F14C320],eax
cmp     eax,FFFFFFFF
jne     oglmdi2_vs2019.13F136733
xor     al,al
jmp     oglmdi2_vs2019.13F136748
call    oglmdi2_vs2019.13F136648
test    rax,rax
jne     oglmdi2_vs2019.13F136746
xor     ecx,ecx
call    oglmdi2_vs2019.13F136750
jmp     oglmdi2_vs2019.13F13672F
mov     al,1
add     rsp,28
ret     
int3    
int3    
int3    
sub     rsp,28
mov     ecx,dword ptr ds:[13F14C320]
cmp     ecx,FFFFFFFF
je      oglmdi2_vs2019.13F13676B
call    oglmdi2_vs2019.13F133434
or      dword ptr ds:[13F14C320],FFFFFFFF
mov     al,1
add     rsp,28
ret     
int3    
int3    
push    rbx
sub     rsp,20
mov     rax,qword ptr ds:[13F14E2B0]
mov     rbx,rdx
cmp     qword ptr ds:[rdx],rax
je      oglmdi2_vs2019.13F13679F
mov     eax,dword ptr ds:[rcx+3A8]
test    dword ptr ds:[13F14CA80],eax
jne     oglmdi2_vs2019.13F13679F
call    oglmdi2_vs2019.13F1394A0
mov     qword ptr ds:[rbx],rax
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
mov     rax,qword ptr ds:[13F14E2C8]
mov     rbx,rdx
cmp     qword ptr ds:[rdx],rax
je      oglmdi2_vs2019.13F1367D3
mov     eax,dword ptr ds:[rcx+3A8]
test    dword ptr ds:[13F14CA80],eax
jne     oglmdi2_vs2019.13F1367D3
call    oglmdi2_vs2019.13F138714
mov     qword ptr ds:[rbx],rax
add     rsp,20
pop     rbx
ret     
int3    
int3    
int3    
mov     r11,rsp
mov     qword ptr ds:[r11+8],rbx
mov     qword ptr ds:[r11+10],rbp
mov     qword ptr ds:[r11+18],rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,70
mov     eax,dword ptr ss:[rsp+C8]
xor     r13d,r13d
test    eax,eax
mov     byte ptr ds:[rdx],r13b
mov     rbx,rdx
mov     r14,rcx
mov     rdx,qword ptr ss:[rsp+E0]
lea     rcx,qword ptr ds:[r11-48]
mov     edi,r13d
mov     rbp,r9
cmovns  edi,eax
mov     rsi,r8
call    oglmdi2_vs2019.13F1301AC
lea     eax,dword ptr ds:[rdi+B]
movsxd  rcx,eax
cmp     rsi,rcx
ja      oglmdi2_vs2019.13F13684A
call    oglmdi2_vs2019.13F1330B0
lea     edi,dword ptr ds:[r13+22]
mov     dword ptr ds:[rax],edi
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F136B16
mov     rcx,qword ptr ds:[r14]
mov     edx,7FF
mov     rax,rcx
shr     rax,34
and     rax,rdx
cmp     rax,rdx
jne     oglmdi2_vs2019.13F1368D7
mov     eax,dword ptr ss:[rsp+D8]
mov     r9,rbp
mov     qword ptr ss:[rsp+40],r13
mov     r8,rsi
mov     dword ptr ss:[rsp+38],eax
mov     rdx,rbx
mov     rax,qword ptr ss:[rsp+C0]
mov     rcx,r14
mov     byte ptr ss:[rsp+30],r13b
mov     dword ptr ss:[rsp+28],edi
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F136B4C
mov     edi,eax
test    eax,eax
je      oglmdi2_vs2019.13F1368A6
mov     byte ptr ds:[rbx],r13b
jmp     oglmdi2_vs2019.13F136B16
mov     edx,65
mov     rcx,rbx
call    oglmdi2_vs2019.13F13F474
test    rax,rax
je      oglmdi2_vs2019.13F136B13
mov     cl,byte ptr ss:[rsp+D0]
xor     cl,1
shl     cl,5
add     cl,50
mov     byte ptr ds:[rax],cl
mov     byte ptr ds:[rax+3],r13b
jmp     oglmdi2_vs2019.13F136B13
mov     eax,2D
test    rcx,rcx
jns     oglmdi2_vs2019.13F1368E9
mov     byte ptr ds:[rbx],al
inc     rbx
mov     rcx,qword ptr ds:[r14]
mov     al,byte ptr ss:[rsp+D0]
lea     r15,qword ptr ds:[rbx+1]
xor     al,1
mov     ebp,3FF
movzx   r12d,al
mov     r10d,30
mov     edx,r12d
movabs  rax,7FF0000000000000
shl     edx,5
movabs  r11,FFFFFFFFFFFFF
add     edx,7
test    rax,rcx
jne     oglmdi2_vs2019.13F13693E
mov     byte ptr ds:[rbx],r10b
mov     rax,qword ptr ds:[r14]
and     rax,r11
neg     rax
sbb     rbp,rbp
and     ebp,3FE
jmp     oglmdi2_vs2019.13F136941
mov     byte ptr ds:[rbx],31
lea     rsi,qword ptr ds:[r15+1]
test    edi,edi
jne     oglmdi2_vs2019.13F13694E
mov     al,r13b
jmp     oglmdi2_vs2019.13F13695F
mov     rax,qword ptr ss:[rsp+58]
mov     rcx,qword ptr ds:[rax+F8]
mov     rax,qword ptr ds:[rcx]
mov     al,byte ptr ds:[rax]
mov     byte ptr ds:[r15],al
test    qword ptr ds:[r14],r11
jbe     oglmdi2_vs2019.13F1369F8
movzx   r8d,r10w
movabs  r9,F000000000000
test    edi,edi
jle     oglmdi2_vs2019.13F1369AB
mov     rax,qword ptr ds:[r14]
mov     cl,r8b
and     rax,r9
and     rax,r11
shr     rax,cl
add     ax,r10w
cmp     ax,39
jbe     oglmdi2_vs2019.13F136999
add     ax,dx
mov     byte ptr ds:[rsi],al
dec     edi
inc     rsi
shr     r9,4
add     r8w,FFFC
jns     oglmdi2_vs2019.13F136979
test    r8w,r8w
js      oglmdi2_vs2019.13F1369F8
mov     rax,qword ptr ds:[r14]
mov     cl,r8b
and     rax,r9
and     rax,r11
shr     rax,cl
cmp     ax,8
jbe     oglmdi2_vs2019.13F1369F8
lea     rcx,qword ptr ds:[rsi-1]
mov     r8b,byte ptr ds:[rcx]
lea     eax,dword ptr ds:[r8-46]
test    al,DF
jne     oglmdi2_vs2019.13F1369DD
mov     byte ptr ds:[rcx],r10b
dec     rcx
jmp     oglmdi2_vs2019.13F1369CA
cmp     rcx,r15
je      oglmdi2_vs2019.13F1369F5
cmp     r8b,39
jne     oglmdi2_vs2019.13F1369ED
add     dl,3A
jmp     oglmdi2_vs2019.13F1369F1
lea     edx,dword ptr ds:[r8+1]
mov     byte ptr ds:[rcx],dl
jmp     oglmdi2_vs2019.13F1369F8
inc     byte ptr ds:[rcx-1]
test    edi,edi
jle     oglmdi2_vs2019.13F136A15
mov     r8d,edi
mov     dl,r10b
mov     rcx,rsi
mov     ebx,edi
call    oglmdi2_vs2019.13F12B280
add     rsi,rbx
mov     r10d,30
cmp     byte ptr ds:[r15],r13b
cmovne  r15,rsi
shl     r12b,5
add     r12b,50
mov     byte ptr ds:[r15],r12b
lea     r9,qword ptr ds:[r15+2]
mov     rax,qword ptr ds:[r14]
shr     rax,34
and     eax,7FF
mov     ecx,eax
sub     rcx,rbp
mov     rdx,rcx
jns     oglmdi2_vs2019.13F136A47
mov     rcx,rbp
sub     rcx,rax
test    rdx,rdx
mov     eax,2B
mov     r8,r9
lea     edx,dword ptr ds:[rax+2]
cmovs   eax,edx
mov     byte ptr ds:[r15+1],al
mov     byte ptr ds:[r9],r10b
cmp     rcx,3E8
jl      oglmdi2_vs2019.13F136A98
movabs  rax,20C49BA5E353F7CF
lea     r8,qword ptr ds:[r9+1]
imul    rcx
sar     rdx,7
mov     rax,rdx
shr     rax,3F
add     rdx,rax
lea     eax,dword ptr ds:[r10+rdx]
mov     byte ptr ds:[r9],al
imul    rax,rdx,FFFFFFFFFFFFFC18
add     rcx,rax
cmp     r8,r9
jne     oglmdi2_vs2019.13F136AA3
cmp     rcx,64
jl      oglmdi2_vs2019.13F136AD2
movabs  rax,A3D70A3D70A3D70B
imul    rcx
add     rdx,rcx
sar     rdx,6
mov     rax,rdx
shr     rax,3F
add     rdx,rax
lea     eax,dword ptr ds:[r10+rdx]
mov     byte ptr ds:[r8],al
inc     r8
imul    rax,rdx,FFFFFFFFFFFFFF9C
add     rcx,rax
cmp     r8,r9
jne     oglmdi2_vs2019.13F136ADD
cmp     rcx,A
jl      oglmdi2_vs2019.13F136B09
movabs  rax,6666666666666667
imul    rcx
sar     rdx,2
mov     rax,rdx
shr     rax,3F
add     rdx,rax
lea     eax,dword ptr ds:[r10+rdx]
mov     byte ptr ds:[r8],al
inc     r8
imul    rax,rdx,FFFFFFFFFFFFFFF6
add     rcx,rax
add     cl,r10b
mov     byte ptr ds:[r8],cl
mov     byte ptr ds:[r8+1],r13b
mov     edi,r13d
cmp     byte ptr ss:[rsp+68],r13b
je      oglmdi2_vs2019.13F136B29
mov     rcx,qword ptr ss:[rsp+50]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
lea     r11,qword ptr ss:[rsp+70]
mov     eax,edi
mov     rbx,qword ptr ds:[r11+30]
mov     rbp,qword ptr ds:[r11+38]
mov     rsi,qword ptr ds:[r11+40]
mov     rsp,r11
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
ret     
int3    
int3    
int3    
mov     r11,rsp
mov     qword ptr ds:[r11+8],rbx
mov     qword ptr ds:[r11+10],rbp
mov     qword ptr ds:[r11+18],rsi
push    rdi
sub     rsp,50
mov     ebp,dword ptr ss:[rsp+88]
mov     rsi,r8
mov     rax,qword ptr ss:[rsp+80]
lea     r8,qword ptr ds:[r11-18]
mov     rcx,qword ptr ds:[rcx]
mov     rdi,rdx
lea     r10d,dword ptr ss:[rbp+2]
inc     r10
lea     edx,dword ptr ss:[rbp+1]
cmp     r10,rax
cmovb   rax,r10
mov     qword ptr ds:[r11-38],rax
call    oglmdi2_vs2019.13F13C17C
xor     ecx,ecx
lea     r9,qword ptr ss:[rsp+40]
cmp     dword ptr ss:[rsp+40],2D
lea     r8d,dword ptr ss:[rbp+1]
mov     rdx,rsi
sete    cl
xor     eax,eax
test    ebp,ebp
setg    al
sub     rdx,rax
sub     rdx,rcx
cmp     rsi,FFFFFFFFFFFFFFFF
cmove   rdx,rsi
add     rcx,rax
add     rcx,rdi
call    oglmdi2_vs2019.13F13BC68
test    eax,eax
je      oglmdi2_vs2019.13F136BD5
mov     byte ptr ds:[rdi],0
jmp     oglmdi2_vs2019.13F136C12
mov     rax,qword ptr ss:[rsp+A0]
mov     r8d,ebp
mov     r9b,byte ptr ss:[rsp+90]
mov     rdx,rsi
mov     qword ptr ss:[rsp+38],rax
mov     rcx,rdi
lea     rax,qword ptr ss:[rsp+40]
mov     byte ptr ss:[rsp+30],0
mov     qword ptr ss:[rsp+28],rax
mov     eax,dword ptr ss:[rsp+98]
mov     dword ptr ss:[rsp+20],eax
call    oglmdi2_vs2019.13F136C28
mov     rbx,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+68]
mov     rsi,qword ptr ss:[rsp+70]
add     rsp,50
pop     rdi
ret     
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r15
sub     rsp,50
xor     eax,eax
movsxd  rbx,r8d
test    r8d,r8d
mov     r15b,r9b
mov     rbp,rdx
mov     rdi,rcx
cmovg   eax,ebx
add     eax,9
cdqe    
cmp     rdx,rax
ja      oglmdi2_vs2019.13F136C8D
call    oglmdi2_vs2019.13F1330B0
mov     ebx,22
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+68]
mov     rsi,qword ptr ss:[rsp+70]
mov     rdi,qword ptr ss:[rsp+78]
add     rsp,50
pop     r15
ret     
mov     rdx,qword ptr ss:[rsp+98]
lea     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F1301AC
cmp     byte ptr ss:[rsp+90],0
mov     rsi,qword ptr ss:[rsp+88]
je      oglmdi2_vs2019.13F136CDA
xor     edx,edx
cmp     dword ptr ds:[rsi],2D
sete    dl
add     rdx,rdi
test    ebx,ebx
jle     oglmdi2_vs2019.13F136CDA
or      r8,FFFFFFFFFFFFFFFF
inc     r8
cmp     byte ptr ds:[rdx+r8],0
jne     oglmdi2_vs2019.13F136CC4
inc     r8
lea     rcx,qword ptr ds:[rdx+1]
call    oglmdi2_vs2019.13F12DE70
cmp     dword ptr ds:[rsi],2D
mov     rdx,rdi
jne     oglmdi2_vs2019.13F136CE9
mov     byte ptr ds:[rdi],2D
lea     rdx,qword ptr ds:[rdi+1]
test    ebx,ebx
jle     oglmdi2_vs2019.13F136D08
mov     al,byte ptr ds:[rdx+1]
mov     byte ptr ds:[rdx],al
inc     rdx
mov     rax,qword ptr ss:[rsp+38]
mov     rcx,qword ptr ds:[rax+F8]
mov     rax,qword ptr ds:[rcx]
mov     cl,byte ptr ds:[rax]
mov     byte ptr ds:[rdx],cl
movzx   ecx,byte ptr ss:[rsp+90]
lea     r8,qword ptr ds:[13F142FCC]
add     rbx,rdx
xor     rcx,1
add     rbx,rcx
sub     rdi,rbx
mov     rcx,rbx
cmp     rbp,FFFFFFFFFFFFFFFF
lea     rdx,qword ptr ds:[rdi+rbp]
cmove   rdx,rbp
call    oglmdi2_vs2019.13F1328D0
test    eax,eax
jne     oglmdi2_vs2019.13F136DE4
lea     rcx,qword ptr ds:[rbx+2]
test    r15b,r15b
je      oglmdi2_vs2019.13F136D4C
mov     byte ptr ds:[rbx],45
mov     rax,qword ptr ds:[rsi+8]
cmp     byte ptr ds:[rax],30
je      oglmdi2_vs2019.13F136DAC
mov     r8d,dword ptr ds:[rsi+4]
sub     r8d,1
jns     oglmdi2_vs2019.13F136D66
neg     r8d
mov     byte ptr ds:[rbx+1],2D
cmp     r8d,64
jl      oglmdi2_vs2019.13F136D87
mov     eax,51EB851F
imul    r8d
sar     edx,5
mov     eax,edx
shr     eax,1F
add     edx,eax
add     byte ptr ds:[rbx+2],dl
imul    eax,edx,FFFFFF9C
add     r8d,eax
cmp     r8d,A
jl      oglmdi2_vs2019.13F136DA8
mov     eax,66666667
imul    r8d
sar     edx,2
mov     eax,edx
shr     eax,1F
add     edx,eax
add     byte ptr ds:[rbx+3],dl
imul    eax,edx,FFFFFFF6
add     r8d,eax
add     byte ptr ds:[rbx+4],r8b
cmp     dword ptr ss:[rsp+80],2
jne     oglmdi2_vs2019.13F136DCA
cmp     byte ptr ds:[rcx],30
jne     oglmdi2_vs2019.13F136DCA
lea     rdx,qword ptr ds:[rcx+1]
mov     r8d,3
call    oglmdi2_vs2019.13F12DE70
cmp     byte ptr ss:[rsp+48],0
je      oglmdi2_vs2019.13F136DDD
mov     rax,qword ptr ss:[rsp+30]
and     dword ptr ds:[rax+3A8],FFFFFFFD
xor     eax,eax
jmp     oglmdi2_vs2019.13F136C72
and     qword ptr ss:[rsp+20],0
xor     r9d,r9d
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    oglmdi2_vs2019.13F132FB0
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,40
mov     rdx,qword ptr ss:[rsp+78]
mov     rbx,rcx
lea     rcx,qword ptr ds:[rax-28]
mov     r14,r9
mov     esi,r8d
call    oglmdi2_vs2019.13F1301AC
cmp     byte ptr ss:[rsp+70],0
movsxd  rcx,dword ptr ds:[r14+4]
je      oglmdi2_vs2019.13F136E51
lea     eax,dword ptr ds:[rcx-1]
cmp     eax,esi
jne     oglmdi2_vs2019.13F136E51
xor     eax,eax
cmp     dword ptr ds:[r14],2D
sete    al
add     rax,rbx
mov     word ptr ds:[rcx+rax-1],30
cmp     dword ptr ds:[r14],2D
jne     oglmdi2_vs2019.13F136E5D
mov     byte ptr ds:[rbx],2D
inc     rbx
or      rdi,FFFFFFFFFFFFFFFF
cmp     dword ptr ds:[r14+4],0
jg      oglmdi2_vs2019.13F136E8C
mov     r8,rdi
inc     r8
cmp     byte ptr ds:[rbx+r8],0
jne     oglmdi2_vs2019.13F136E6B
inc     r8
lea     rcx,qword ptr ds:[rbx+1]
mov     rdx,rbx
call    oglmdi2_vs2019.13F12DE70
mov     byte ptr ds:[rbx],30
inc     rbx
jmp     oglmdi2_vs2019.13F136E93
movsxd  rax,dword ptr ds:[r14+4]
add     rbx,rax
test    esi,esi
jle     oglmdi2_vs2019.13F136F0F
lea     rbp,qword ptr ds:[rbx+1]
mov     r8,rdi
inc     r8
cmp     byte ptr ds:[rbx+r8],0
jne     oglmdi2_vs2019.13F136E9E
inc     r8
mov     rdx,rbx
mov     rcx,rbp
call    oglmdi2_vs2019.13F12DE70
mov     rax,qword ptr ss:[rsp+28]
mov     rcx,qword ptr ds:[rax+F8]
mov     rax,qword ptr ds:[rcx]
mov     cl,byte ptr ds:[rax]
mov     byte ptr ds:[rbx],cl
mov     eax,dword ptr ds:[r14+4]
test    eax,eax
jns     oglmdi2_vs2019.13F136F0F
neg     eax
cmp     byte ptr ss:[rsp+70],0
jne     oglmdi2_vs2019.13F136EDE
cmp     eax,esi
jge     oglmdi2_vs2019.13F136EE0
mov     esi,eax
test    esi,esi
je      oglmdi2_vs2019.13F136EFF
inc     rdi
cmp     byte ptr ds:[rdi+rbp],0
jne     oglmdi2_vs2019.13F136EE4
movsxd  rcx,esi
lea     r8,qword ptr ds:[rdi+1]
add     rcx,rbp
mov     rdx,rbp
call    oglmdi2_vs2019.13F12DE70
movsxd  r8,esi
mov     edx,30
mov     rcx,rbp
call    oglmdi2_vs2019.13F12B280
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F136F22
mov     rax,qword ptr ss:[rsp+20]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     rbx,qword ptr ss:[rsp+50]
xor     eax,eax
mov     rbp,qword ptr ss:[rsp+58]
mov     rsi,qword ptr ss:[rsp+60]
mov     rdi,qword ptr ss:[rsp+68]
add     rsp,40
pop     r14
ret     
int3    
mov     r11,rsp
mov     qword ptr ds:[r11+8],rbx
mov     qword ptr ds:[r11+10],rbp
mov     qword ptr ds:[r11+18],rdi
push    r14
sub     rsp,50
mov     rcx,qword ptr ds:[rcx]
xor     eax,eax
mov     qword ptr ds:[r11-18],rax
mov     rbp,r8
mov     qword ptr ds:[r11-10],rax
lea     r8,qword ptr ds:[r11-18]
mov     rax,qword ptr ss:[rsp+80]
mov     rdi,rdx
mov     edx,dword ptr ss:[rsp+88]
mov     qword ptr ds:[r11-38],rax
call    oglmdi2_vs2019.13F13C17C
mov     r14d,dword ptr ss:[rsp+44]
lea     r9,qword ptr ss:[rsp+40]
mov     r8d,dword ptr ss:[rsp+88]
xor     ecx,ecx
cmp     dword ptr ss:[rsp+40],2D
mov     rdx,rbp
sete    cl
dec     r14d
sub     rdx,rcx
cmp     rbp,FFFFFFFFFFFFFFFF
lea     rbx,qword ptr ds:[rcx+rdi]
cmove   rdx,rbp
mov     rcx,rbx
call    oglmdi2_vs2019.13F13BC68
test    eax,eax
je      oglmdi2_vs2019.13F136FC9
mov     byte ptr ds:[rdi],0
jmp     oglmdi2_vs2019.13F13705C
mov     eax,dword ptr ss:[rsp+44]
dec     eax
cmp     eax,FFFFFFFC
jl      oglmdi2_vs2019.13F13701A
cmp     eax,dword ptr ss:[rsp+88]
jge     oglmdi2_vs2019.13F13701A
cmp     r14d,eax
jge     oglmdi2_vs2019.13F136FEE
mov     al,byte ptr ds:[rbx]
inc     rbx
test    al,al
jne     oglmdi2_vs2019.13F136FE2
mov     byte ptr ds:[rbx-2],al
mov     rax,qword ptr ss:[rsp+A0]
lea     r9,qword ptr ss:[rsp+40]
mov     r8d,dword ptr ss:[rsp+88]
mov     rdx,rbp
mov     qword ptr ss:[rsp+28],rax
mov     rcx,rdi
mov     byte ptr ss:[rsp+20],1
call    oglmdi2_vs2019.13F136DFC
jmp     oglmdi2_vs2019.13F13705C
mov     rax,qword ptr ss:[rsp+A0]
mov     rdx,rbp
mov     r9b,byte ptr ss:[rsp+90]
mov     rcx,rdi
mov     r8d,dword ptr ss:[rsp+88]
mov     qword ptr ss:[rsp+38],rax
lea     rax,qword ptr ss:[rsp+40]
mov     byte ptr ss:[rsp+30],1
mov     qword ptr ss:[rsp+28],rax
mov     eax,dword ptr ss:[rsp+98]
mov     dword ptr ss:[rsp+20],eax
call    oglmdi2_vs2019.13F136C28
mov     rbx,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+68]
mov     rdi,qword ptr ss:[rsp+70]
add     rsp,50
pop     r14
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,60
mov     r10,r9
mov     rdi,r8
mov     rbx,rdx
mov     rsi,rcx
test    rdx,rdx
jne     oglmdi2_vs2019.13F1370B1
call    oglmdi2_vs2019.13F1330B0
mov     ebx,16
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     eax,ebx
jmp     oglmdi2_vs2019.13F13734C
test    rdi,rdi
je      oglmdi2_vs2019.13F137099
test    r10,r10
je      oglmdi2_vs2019.13F137099
mov     r9,qword ptr ss:[rsp+90]
test    r9,r9
je      oglmdi2_vs2019.13F137099
mov     ecx,dword ptr ss:[rsp+98]
cmp     ecx,41
je      oglmdi2_vs2019.13F1370E1
lea     eax,dword ptr ds:[rcx-45]
cmp     eax,2
jbe     oglmdi2_vs2019.13F1370E1
xor     r11b,r11b
jmp     oglmdi2_vs2019.13F1370E4
mov     r11b,1
mov     rdx,qword ptr ss:[rsp+A8]
test    dl,8
jne     oglmdi2_vs2019.13F1371D6
mov     r8,qword ptr ds:[rsi]
mov     ebp,7FF
mov     rax,r8
shr     rax,34
and     rax,rbp
cmp     rax,rbp
jne     oglmdi2_vs2019.13F1371D6
movabs  rcx,FFFFFFFFFFFFF
mov     rax,r8
mov     edx,C
and     rax,rcx
jne     oglmdi2_vs2019.13F13712B
xor     ecx,ecx
jmp     oglmdi2_vs2019.13F137158
movabs  rcx,8000000000000
test    r8,r8
jns     oglmdi2_vs2019.13F137144
cmp     rax,rcx
jne     oglmdi2_vs2019.13F137144
mov     rcx,rdx
jmp     oglmdi2_vs2019.13F137158
mov     rax,r8
and     rax,rcx
neg     rax
sbb     rcx,rcx
and     rcx,FFFFFFFFFFFFFFFC
add     rcx,8
shr     r8,3F
lea     rax,qword ptr ds:[r8+4]
cmp     rdi,rax
jae     oglmdi2_vs2019.13F13716A
mov     byte ptr ds:[rbx],0
jmp     oglmdi2_vs2019.13F1371CF
or      r9,FFFFFFFFFFFFFFFF
test    r8b,r8b
je      oglmdi2_vs2019.13F137184
mov     byte ptr ds:[rbx],2D
inc     rbx
mov     byte ptr ds:[rbx],0
cmp     rdi,r9
je      oglmdi2_vs2019.13F137184
dec     rdi
movzx   edx,r11b
lea     r10,qword ptr ds:[13F142F00]
xor     edx,1
add     edx,edx
mov     eax,edx
add     rax,rcx
mov     r8,qword ptr ds:[r10+rax*8]
inc     r9
cmp     byte ptr ds:[r8+r9],0
jne     oglmdi2_vs2019.13F13719D
xor     eax,eax
cmp     rdi,r9
setbe   al
lea     r8d,dword ptr ds:[rdx+rax]
mov     rdx,rdi
add     r8,rcx
mov     rcx,rbx
mov     r8,qword ptr ds:[r10+r8*8]
call    oglmdi2_vs2019.13F1328D0
test    eax,eax
jne     oglmdi2_vs2019.13F137362
xor     edx,edx
mov     eax,edx
jmp     oglmdi2_vs2019.13F13734C
shr     rdx,4
and     edx,1
or      edx,2
sub     ecx,41
je      oglmdi2_vs2019.13F137315
sub     ecx,4
je      oglmdi2_vs2019.13F1372DC
sub     ecx,1
je      oglmdi2_vs2019.13F13724F
sub     ecx,1
je      oglmdi2_vs2019.13F137213
sub     ecx,1A
je      oglmdi2_vs2019.13F137315
sub     ecx,4
je      oglmdi2_vs2019.13F1372DC
cmp     ecx,1
je      oglmdi2_vs2019.13F13724F
mov     rax,qword ptr ss:[rsp+B0]
mov     r8,rdi
mov     qword ptr ss:[rsp+40],rax
mov     rcx,rsi
mov     eax,dword ptr ss:[rsp+A0]
mov     dword ptr ss:[rsp+38],edx
mov     rdx,rbx
mov     byte ptr ss:[rsp+30],r11b
mov     dword ptr ss:[rsp+28],eax
mov     qword ptr ss:[rsp+20],r9
mov     r9,r10
call    oglmdi2_vs2019.13F136F40
jmp     oglmdi2_vs2019.13F13734C
mov     ebp,dword ptr ss:[rsp+A0]
lea     r8,qword ptr ss:[rsp+50]
mov     rcx,qword ptr ds:[rsi]
xor     eax,eax
mov     qword ptr ss:[rsp+20],r9
mov     edx,ebp
mov     r9,r10
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+58],rax
call    oglmdi2_vs2019.13F13C17C
mov     r8d,dword ptr ss:[rsp+54]
xor     ecx,ecx
cmp     dword ptr ss:[rsp+50],2D
mov     rdx,rdi
sete    cl
or      r9,FFFFFFFFFFFFFFFF
sub     rdx,rcx
add     r8d,ebp
cmp     rdi,r9
lea     r9,qword ptr ss:[rsp+50]
cmove   rdx,rdi
add     rcx,rbx
call    oglmdi2_vs2019.13F13BC68
test    eax,eax
je      oglmdi2_vs2019.13F1372B5
mov     byte ptr ds:[rbx],0
jmp     oglmdi2_vs2019.13F13734C
mov     rax,qword ptr ss:[rsp+B0]
lea     r9,qword ptr ss:[rsp+50]
mov     qword ptr ss:[rsp+28],rax
mov     r8d,ebp
mov     rdx,rdi
mov     byte ptr ss:[rsp+20],0
mov     rcx,rbx
call    oglmdi2_vs2019.13F136DFC
jmp     oglmdi2_vs2019.13F13734C
mov     rax,qword ptr ss:[rsp+B0]
mov     r8,rdi
mov     qword ptr ss:[rsp+40],rax
mov     rcx,rsi
mov     eax,dword ptr ss:[rsp+A0]
mov     dword ptr ss:[rsp+38],edx
mov     rdx,rbx
mov     byte ptr ss:[rsp+30],r11b
mov     dword ptr ss:[rsp+28],eax
mov     qword ptr ss:[rsp+20],r9
mov     r9,r10
call    oglmdi2_vs2019.13F136B4C
jmp     oglmdi2_vs2019.13F13734C
mov     rax,qword ptr ss:[rsp+B0]
mov     r8,rdi
mov     qword ptr ss:[rsp+40],rax
mov     rcx,rsi
mov     eax,dword ptr ss:[rsp+A0]
mov     dword ptr ss:[rsp+38],edx
mov     rdx,rbx
mov     byte ptr ss:[rsp+30],r11b
mov     dword ptr ss:[rsp+28],eax
mov     qword ptr ss:[rsp+20],r9
mov     r9,r10
call    oglmdi2_vs2019.13F1367DC
lea     r11,qword ptr ss:[rsp+60]
mov     rbx,qword ptr ds:[r11+10]
mov     rbp,qword ptr ds:[r11+18]
mov     rsi,qword ptr ds:[r11+20]
mov     rsp,r11
pop     rdi
ret     
and     qword ptr ss:[rsp+20],0
xor     r9d,r9d
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    oglmdi2_vs2019.13F132FB0
int3    
mov     rcx,qword ptr ds:[13F14C058]
xor     eax,eax
or      rcx,1
cmp     qword ptr ds:[13F14E298],rcx
sete    al
ret     
cmp     rcx,rdx
jae     oglmdi2_vs2019.13F137399
or      eax,FFFFFFFF
ret     
xor     eax,eax
cmp     rcx,rdx
seta    al
ret     
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,30
xor     ebx,ebx
mov     ebp,r8d
mov     rdi,rdx
mov     rsi,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F1373EF
cmp     byte ptr ds:[rdx+28],bl
je      oglmdi2_vs2019.13F1373DE
mov     rcx,qword ptr ds:[rdx+10]
call    oglmdi2_vs2019.13F133148
mov     byte ptr ds:[rdi+28],bl
mov     qword ptr ds:[rdi+10],rbx
mov     qword ptr ds:[rdi+18],rbx
mov     qword ptr ds:[rdi+20],rbx
jmp     oglmdi2_vs2019.13F1374FD
cmp     byte ptr ds:[rcx],bl
jne     oglmdi2_vs2019.13F137448
cmp     qword ptr ds:[rdx+18],rbx
jne     oglmdi2_vs2019.13F13743F
cmp     byte ptr ds:[rdx+28],bl
je      oglmdi2_vs2019.13F13740A
mov     rcx,qword ptr ds:[rdx+10]
call    oglmdi2_vs2019.13F133148
mov     byte ptr ds:[rdi+28],bl
mov     ecx,2
call    oglmdi2_vs2019.13F134230
mov     qword ptr ds:[rdi+10],rax
mov     rcx,rbx
neg     rax
sbb     edx,edx
not     edx
and     edx,C
sete    cl
test    edx,edx
sete    al
mov     byte ptr ds:[rdi+28],al
mov     qword ptr ds:[rdi+18],rcx
test    edx,edx
je      oglmdi2_vs2019.13F13743F
mov     ebx,edx
jmp     oglmdi2_vs2019.13F1374FD
mov     rax,qword ptr ds:[rdi+10]
mov     word ptr ds:[rax],bx
jmp     oglmdi2_vs2019.13F1373E6
or      r9d,FFFFFFFF
mov     dword ptr ss:[rsp+28],ebx
mov     r8,rsi
mov     qword ptr ss:[rsp+20],rbx
mov     ecx,ebp
lea     edx,dword ptr ds:[r9+A]
call    oglmdi2_vs2019.13F138AA0
movsxd  r14,eax
test    eax,eax
jne     oglmdi2_vs2019.13F137480
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
call    oglmdi2_vs2019.13F1330B0
mov     ebx,dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F1374FD
mov     rcx,qword ptr ds:[rdi+18]
cmp     r14,rcx
jbe     oglmdi2_vs2019.13F1374CC
cmp     byte ptr ds:[rdi+28],bl
je      oglmdi2_vs2019.13F13749A
mov     rcx,qword ptr ds:[rdi+10]
call    oglmdi2_vs2019.13F133148
mov     byte ptr ds:[rdi+28],bl
lea     rcx,qword ptr ds:[r14+r14]
call    oglmdi2_vs2019.13F134230
mov     qword ptr ds:[rdi+10],rax
mov     rcx,rbx
neg     rax
sbb     edx,edx
not     edx
and     edx,C
cmove   rcx,r14
test    edx,edx
sete    al
mov     byte ptr ds:[rdi+28],al
mov     qword ptr ds:[rdi+18],rcx
test    edx,edx
jne     oglmdi2_vs2019.13F137438
mov     rax,qword ptr ds:[rdi+10]
or      r9d,FFFFFFFF
mov     dword ptr ss:[rsp+28],ecx
mov     r8,rsi
mov     ecx,ebp
mov     qword ptr ss:[rsp+20],rax
lea     edx,dword ptr ds:[r9+A]
call    oglmdi2_vs2019.13F138AA0
movsxd  rcx,eax
test    eax,eax
je      oglmdi2_vs2019.13F13746A
dec     rcx
mov     qword ptr ds:[rdi+20],rcx
mov     rbp,qword ptr ss:[rsp+48]
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+50]
mov     rdi,qword ptr ss:[rsp+58]
add     rsp,30
pop     r14
ret     
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,40
xor     ebx,ebx
mov     r14d,r8d
mov     rdi,rdx
mov     rsi,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F137567
cmp     byte ptr ds:[rdx+28],bl
je      oglmdi2_vs2019.13F137556
mov     rcx,qword ptr ds:[rdx+10]
call    oglmdi2_vs2019.13F133148
mov     byte ptr ds:[rdi+28],bl
mov     qword ptr ds:[rdi+10],rbx
mov     qword ptr ds:[rdi+18],rbx
mov     qword ptr ds:[rdi+20],rbx
jmp     oglmdi2_vs2019.13F137689
cmp     word ptr ds:[rcx],bx
jne     oglmdi2_vs2019.13F1375C0
cmp     qword ptr ds:[rdx+18],rbx
jne     oglmdi2_vs2019.13F1375B8
cmp     byte ptr ds:[rdx+28],bl
je      oglmdi2_vs2019.13F137583
mov     rcx,qword ptr ds:[rdx+10]
call    oglmdi2_vs2019.13F133148
mov     byte ptr ds:[rdi+28],bl
mov     ecx,1
call    oglmdi2_vs2019.13F134230
mov     qword ptr ds:[rdi+10],rax
mov     rcx,rbx
neg     rax
sbb     edx,edx
not     edx
and     edx,C
sete    cl
test    edx,edx
sete    al
mov     byte ptr ds:[rdi+28],al
mov     qword ptr ds:[rdi+18],rcx
test    edx,edx
je      oglmdi2_vs2019.13F1375B8
mov     ebx,edx
jmp     oglmdi2_vs2019.13F137689
mov     rax,qword ptr ds:[rdi+10]
mov     byte ptr ds:[rax],bl
jmp     oglmdi2_vs2019.13F13755E
mov     qword ptr ss:[rsp+38],rbx
or      r9d,FFFFFFFF
mov     qword ptr ss:[rsp+30],rbx
mov     r8,rsi
mov     dword ptr ss:[rsp+28],ebx
xor     edx,edx
mov     ecx,r14d
mov     qword ptr ss:[rsp+20],rbx
call    oglmdi2_vs2019.13F138AFC
movsxd  rbp,eax
test    eax,eax
jne     oglmdi2_vs2019.13F137604
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
call    oglmdi2_vs2019.13F1330B0
mov     ebx,dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F137689
mov     rcx,qword ptr ds:[rdi+18]
cmp     rbp,rcx
jbe     oglmdi2_vs2019.13F13764F
cmp     byte ptr ds:[rdi+28],bl
je      oglmdi2_vs2019.13F13761E
mov     rcx,qword ptr ds:[rdi+10]
call    oglmdi2_vs2019.13F133148
mov     byte ptr ds:[rdi+28],bl
mov     rcx,rbp
call    oglmdi2_vs2019.13F134230
mov     qword ptr ds:[rdi+10],rax
mov     rcx,rbx
neg     rax
sbb     edx,edx
not     edx
and     edx,C
cmove   rcx,rbp
test    edx,edx
sete    al
mov     byte ptr ds:[rdi+28],al
mov     qword ptr ds:[rdi+18],rcx
test    edx,edx
jne     oglmdi2_vs2019.13F1375B1
mov     rax,qword ptr ds:[rdi+10]
or      r9d,FFFFFFFF
mov     qword ptr ss:[rsp+38],rbx
mov     r8,rsi
mov     qword ptr ss:[rsp+30],rbx
xor     edx,edx
mov     dword ptr ss:[rsp+28],ecx
mov     ecx,r14d
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F138AFC
movsxd  rcx,eax
test    eax,eax
je      oglmdi2_vs2019.13F1375EB
dec     rcx
mov     qword ptr ds:[rdi+20],rcx
mov     rbp,qword ptr ss:[rsp+58]
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+50]
mov     rsi,qword ptr ss:[rsp+60]
mov     rdi,qword ptr ss:[rsp+68]
add     rsp,40
pop     r14
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rdx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
mov     rbp,rsp
sub     rsp,60
xor     edi,edi
mov     rbx,rcx
test    rdx,rdx
jne     oglmdi2_vs2019.13F1376E4
call    oglmdi2_vs2019.13F1330B0
lea     ebx,dword ptr ds:[rdi+16]
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     eax,ebx
jmp     oglmdi2_vs2019.13F137884
xorps   xmm0,xmm0
mov     qword ptr ds:[rdx],rdi
mov     rax,qword ptr ds:[rcx]
movdqu  xmmword ptr ss:[rbp-20],xmm0
mov     qword ptr ss:[rbp-10],rdi
test    rax,rax
je      oglmdi2_vs2019.13F137751
lea     rdx,qword ptr ss:[rbp+50]
mov     word ptr ss:[rbp+50],3F2A
mov     rcx,rax
mov     byte ptr ss:[rbp+52],dil
call    oglmdi2_vs2019.13F13D970
mov     rcx,qword ptr ds:[rbx]
test    rax,rax
jne     oglmdi2_vs2019.13F137729
lea     r9,qword ptr ss:[rbp-20]
xor     r8d,r8d
xor     edx,edx
call    oglmdi2_vs2019.13F1378B4
jmp     oglmdi2_vs2019.13F137735
lea     r8,qword ptr ss:[rbp-20]
mov     rdx,rax
call    oglmdi2_vs2019.13F137A3C
mov     esi,eax
test    eax,eax
jne     oglmdi2_vs2019.13F137744
add     rbx,8
mov     rax,qword ptr ds:[rbx]
jmp     oglmdi2_vs2019.13F1376F6
mov     r12,qword ptr ss:[rbp-18]
mov     r15,qword ptr ss:[rbp-20]
jmp     oglmdi2_vs2019.13F137849
mov     r15,qword ptr ss:[rbp-20]
mov     r9,rdi
mov     r12,qword ptr ss:[rbp-18]
mov     rdx,r15
mov     rax,r12
mov     qword ptr ss:[rbp+50],rdi
sub     rax,r15
mov     r8,rdi
mov     r14,rax
sar     r14,3
inc     r14
lea     rcx,qword ptr ds:[rax+7]
shr     rcx,3
cmp     r15,r12
cmova   rcx,rdi
or      rsi,FFFFFFFFFFFFFFFF
test    rcx,rcx
je      oglmdi2_vs2019.13F1377B3
mov     r10,qword ptr ds:[rdx]
mov     rax,rsi
inc     rax
cmp     byte ptr ds:[r10+rax],dil
jne     oglmdi2_vs2019.13F137794
inc     r9
add     rdx,8
add     r9,rax
inc     r8
cmp     r8,rcx
jne     oglmdi2_vs2019.13F13778E
mov     qword ptr ss:[rbp+50],r9
mov     r8d,1
mov     rdx,r9
mov     rcx,r14
call    oglmdi2_vs2019.13F1317E0
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F137842
lea     rdx,qword ptr ds:[rax+r14*8]
mov     r14,r15
mov     qword ptr ss:[rbp-28],rdx
mov     rax,rdx
mov     qword ptr ss:[rbp+58],rdx
cmp     r15,r12
je      oglmdi2_vs2019.13F137839
mov     rcx,rbx
sub     rcx,r15
mov     qword ptr ss:[rbp-30],rcx
mov     r8,qword ptr ds:[r14]
mov     r13,rsi
inc     r13
cmp     byte ptr ds:[r8+r13],dil
jne     oglmdi2_vs2019.13F1377F3
sub     rdx,rax
inc     r13
add     rdx,qword ptr ss:[rbp+50]
mov     r9,r13
mov     rcx,rax
call    oglmdi2_vs2019.13F13D7F0
test    eax,eax
jne     oglmdi2_vs2019.13F13789C
mov     rax,qword ptr ss:[rbp+58]
mov     rcx,qword ptr ss:[rbp-30]
mov     rdx,qword ptr ss:[rbp-28]
mov     qword ptr ds:[rcx+r14],rax
add     rax,r13
add     r14,8
mov     qword ptr ss:[rbp+58],rax
cmp     r14,r12
jne     oglmdi2_vs2019.13F1377ED
mov     rax,qword ptr ss:[rbp+48]
mov     esi,edi
mov     qword ptr ds:[rax],rbx
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     rbx,r12
mov     r14,r15
sub     rbx,r15
add     rbx,7
shr     rbx,3
cmp     r15,r12
cmova   rbx,rdi
test    rbx,rbx
je      oglmdi2_vs2019.13F13787A
mov     rcx,qword ptr ds:[r14]
call    oglmdi2_vs2019.13F133148
inc     rdi
lea     r14,qword ptr ds:[r14+8]
cmp     rdi,rbx
jne     oglmdi2_vs2019.13F137866
mov     rcx,r15
call    oglmdi2_vs2019.13F133148
mov     eax,esi
mov     rbx,qword ptr ss:[rsp+A0]
add     rsp,60
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
xor     r9d,r9d
mov     qword ptr ss:[rsp+20],rdi
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    oglmdi2_vs2019.13F132FB0
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,30
or      rbp,FFFFFFFFFFFFFFFF
mov     rdi,r9
xor     esi,esi
mov     r14,r8
mov     r13,rdx
mov     r12,rcx
inc     rbp
cmp     byte ptr ds:[rcx+rbp],sil
jne     oglmdi2_vs2019.13F1378E2
mov     edx,1
mov     rax,r14
add     rbp,rdx
not     rax
cmp     rbp,rax
jbe     oglmdi2_vs2019.13F13791E
lea     eax,dword ptr ds:[rdx+B]
mov     rbx,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+68]
mov     rsi,qword ptr ss:[rsp+70]
add     rsp,30
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
ret     
lea     r15,qword ptr ds:[r8+1]
add     r15,rbp
mov     rcx,r15
call    oglmdi2_vs2019.13F1330D0
mov     rbx,rax
test    r14,r14
je      oglmdi2_vs2019.13F13794E
mov     r9,r14
mov     r8,r13
mov     rdx,r15
mov     rcx,rax
call    oglmdi2_vs2019.13F13D7F0
test    eax,eax
jne     oglmdi2_vs2019.13F137A26
sub     r15,r14
lea     rcx,qword ptr ds:[rbx+r14]
mov     rdx,r15
mov     r9,rbp
mov     r8,r12
call    oglmdi2_vs2019.13F13D7F0
test    eax,eax
jne     oglmdi2_vs2019.13F137A26
mov     rcx,qword ptr ds:[rdi+8]
lea     r15d,dword ptr ds:[rax+8]
mov     r14,qword ptr ds:[rdi+10]
cmp     rcx,r14
jne     oglmdi2_vs2019.13F137A1D
cmp     qword ptr ds:[rdi],rsi
jne     oglmdi2_vs2019.13F1379B0
mov     edx,r15d
lea     ecx,dword ptr ds:[rax+4]
call    oglmdi2_vs2019.13F1330D0
xor     ecx,ecx
mov     qword ptr ds:[rdi],rax
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rdi]
test    rcx,rcx
je      oglmdi2_vs2019.13F1379E4
lea     rax,qword ptr ds:[rcx+20]
mov     qword ptr ds:[rdi+8],rcx
mov     qword ptr ds:[rdi+10],rax
jmp     oglmdi2_vs2019.13F137A1D
sub     r14,qword ptr ds:[rdi]
movabs  rax,7FFFFFFFFFFFFFFF
sar     r14,3
cmp     r14,rax
ja      oglmdi2_vs2019.13F1379E4
mov     rcx,qword ptr ds:[rdi]
lea     rbp,qword ptr ds:[r14+r14]
mov     rdx,rbp
mov     r8,r15
call    oglmdi2_vs2019.13F139574
test    rax,rax
jne     oglmdi2_vs2019.13F1379FF
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
mov     esi,C
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     eax,esi
jmp     oglmdi2_vs2019.13F137901
lea     rcx,qword ptr ds:[rax+r14*8]
mov     qword ptr ds:[rdi],rax
mov     qword ptr ds:[rdi+8],rcx
lea     rcx,qword ptr ds:[rax+rbp*8]
mov     qword ptr ds:[rdi+10],rcx
xor     ecx,ecx
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rdi+8]
mov     qword ptr ds:[rcx],rbx
add     qword ptr ds:[rdi+8],r15
jmp     oglmdi2_vs2019.13F1379F1
xor     r9d,r9d
mov     qword ptr ss:[rsp+20],rsi
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    oglmdi2_vs2019.13F132FB0
int3    
int3    
mov     qword ptr ss:[rsp+20],rbx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
lea     rbp,qword ptr ss:[rsp-230]
sub     rsp,330
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+220],rax
mov     r12,r8
mov     rsi,rcx
movabs  rbx,200000000801
cmp     rdx,rcx
je      oglmdi2_vs2019.13F137AA3
mov     al,byte ptr ds:[rdx]
sub     al,2F
cmp     al,2D
ja      oglmdi2_vs2019.13F137A93
movsx   rax,al
bt      rbx,rax
jb      oglmdi2_vs2019.13F137AA3
mov     rcx,rsi
call    oglmdi2_vs2019.13F13DD50
mov     rdx,rax
cmp     rax,rsi
jne     oglmdi2_vs2019.13F137A81
mov     r8b,byte ptr ds:[rdx]
cmp     r8b,3A
jne     oglmdi2_vs2019.13F137ACA
lea     rax,qword ptr ds:[rsi+1]
cmp     rdx,rax
je      oglmdi2_vs2019.13F137ACA
mov     r9,r12
xor     r8d,r8d
xor     edx,edx
mov     rcx,rsi
call    oglmdi2_vs2019.13F1378B4
jmp     oglmdi2_vs2019.13F137D20
sub     r8b,2F
xor     edi,edi
cmp     r8b,2D
ja      oglmdi2_vs2019.13F137AE2
movsx   rax,r8b
bt      rbx,rax
mov     al,1
jb      oglmdi2_vs2019.13F137AE5
mov     al,dil
sub     rdx,rsi
mov     qword ptr ss:[rbp-60],rdi
inc     rdx
mov     qword ptr ss:[rbp-58],rdi
neg     al
mov     qword ptr ss:[rbp-50],rdi
lea     rcx,qword ptr ss:[rsp+30]
mov     qword ptr ss:[rbp-48],rdi
sbb     r13,r13
mov     qword ptr ss:[rbp-40],rdi
and     r13,rdx
mov     byte ptr ss:[rbp-38],dil
xor     edx,edx
call    oglmdi2_vs2019.13F1301AC
mov     rax,qword ptr ss:[rsp+38]
mov     r15d,FDE9
cmp     dword ptr ds:[rax+C],r15d
jne     oglmdi2_vs2019.13F137B40
cmp     byte ptr ss:[rsp+48],dil
je      oglmdi2_vs2019.13F137B3B
mov     rax,qword ptr ss:[rsp+30]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     r8d,r15d
jmp     oglmdi2_vs2019.13F137B7A
call    oglmdi2_vs2019.13F1333B0
test    eax,eax
jne     oglmdi2_vs2019.13F137B64
cmp     byte ptr ss:[rsp+48],dil
je      oglmdi2_vs2019.13F137B5C
mov     rax,qword ptr ss:[rsp+30]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     r8d,1
jmp     oglmdi2_vs2019.13F137B7A
cmp     byte ptr ss:[rsp+48],dil
je      oglmdi2_vs2019.13F137B77
mov     rax,qword ptr ss:[rsp+30]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     r8d,edi
lea     rdx,qword ptr ss:[rbp-60]
mov     rcx,rsi
call    oglmdi2_vs2019.13F1373A4
mov     rcx,qword ptr ss:[rbp-50]
lea     r8,qword ptr ss:[rbp-30]
test    eax,eax
mov     dword ptr ss:[rsp+28],edi
mov     qword ptr ss:[rsp+20],rdi
cmovne  rcx,rdi
xor     r9d,r9d
xor     edx,edx
call    qword ptr ds:[<&FindFirstFileExW>]
mov     rbx,rax
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F137BC8
mov     r9,r12
xor     r8d,r8d
xor     edx,edx
mov     rcx,rsi
call    oglmdi2_vs2019.13F1378B4
mov     edi,eax
jmp     oglmdi2_vs2019.13F137D0F
mov     r14,qword ptr ds:[r12+8]
sub     r14,qword ptr ds:[r12]
sar     r14,3
xor     edx,edx
mov     qword ptr ss:[rsp+70],rdi
lea     rcx,qword ptr ss:[rsp+50]
mov     qword ptr ss:[rsp+78],rdi
mov     qword ptr ss:[rbp-80],rdi
mov     qword ptr ss:[rbp-78],rdi
mov     qword ptr ss:[rbp-70],rdi
mov     byte ptr ss:[rbp-68],dil
call    oglmdi2_vs2019.13F1301AC
mov     rax,qword ptr ss:[rsp+58]
cmp     dword ptr ds:[rax+C],r15d
jne     oglmdi2_vs2019.13F137C1E
cmp     byte ptr ss:[rsp+68],dil
je      oglmdi2_vs2019.13F137C19
mov     rax,qword ptr ss:[rsp+50]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     r8d,r15d
jmp     oglmdi2_vs2019.13F137C58
call    oglmdi2_vs2019.13F1333B0
test    eax,eax
jne     oglmdi2_vs2019.13F137C42
cmp     byte ptr ss:[rsp+68],dil
je      oglmdi2_vs2019.13F137C3A
mov     rax,qword ptr ss:[rsp+50]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     r8d,1
jmp     oglmdi2_vs2019.13F137C58
cmp     byte ptr ss:[rsp+68],dil
je      oglmdi2_vs2019.13F137C55
mov     rax,qword ptr ss:[rsp+50]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     r8d,edi
lea     rdx,qword ptr ss:[rsp+70]
lea     rcx,qword ptr ss:[rbp-4]
call    oglmdi2_vs2019.13F13751C
mov     r15,qword ptr ss:[rbp-80]
test    eax,eax
mov     rcx,r15
cmovne  rcx,rdi
cmp     byte ptr ds:[rcx],2E
jne     oglmdi2_vs2019.13F137C89
mov     al,byte ptr ds:[rcx+1]
test    al,al
je      oglmdi2_vs2019.13F137C9F
cmp     al,2E
jne     oglmdi2_vs2019.13F137C89
cmp     byte ptr ds:[rcx+2],dil
je      oglmdi2_vs2019.13F137C9F
mov     r9,r12
mov     r8,r13
mov     rdx,rsi
call    oglmdi2_vs2019.13F1378B4
mov     edi,eax
test    eax,eax
jne     oglmdi2_vs2019.13F137CF8
xor     edi,edi
cmp     byte ptr ss:[rbp-68],dil
je      oglmdi2_vs2019.13F137CAD
mov     rcx,r15
call    oglmdi2_vs2019.13F133148
lea     rdx,qword ptr ss:[rbp-30]
mov     rcx,rbx
call    qword ptr ds:[<&FindNextFileW>]
mov     r15d,FDE9
test    eax,eax
jne     oglmdi2_vs2019.13F137BD5
mov     rax,qword ptr ds:[r12]
mov     rdx,qword ptr ds:[r12+8]
sub     rdx,rax
sar     rdx,3
cmp     r14,rdx
je      oglmdi2_vs2019.13F137D06
sub     rdx,r14
lea     rcx,qword ptr ds:[rax+r14*8]
lea     r9,qword ptr ds:[13F137390]
mov     r8d,8
call    oglmdi2_vs2019.13F13D440
jmp     oglmdi2_vs2019.13F137D06
cmp     byte ptr ss:[rbp-68],0
je      oglmdi2_vs2019.13F137D06
mov     rcx,r15
call    oglmdi2_vs2019.13F133148
mov     rcx,rbx
call    qword ptr ds:[<&FindClose>]
cmp     byte ptr ss:[rbp-38],0
je      oglmdi2_vs2019.13F137D1E
mov     rcx,qword ptr ss:[rbp-50]
call    oglmdi2_vs2019.13F133148
mov     eax,edi
mov     rcx,qword ptr ss:[rbp+220]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
mov     rbx,qword ptr ss:[rsp+388]
add     rsp,330
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
int3    
int3    
jmp     oglmdi2_vs2019.13F1376A8
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,40
xor     ebx,ebx
mov     ebp,r8d
mov     rdi,rdx
mov     rsi,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F137D91
cmp     byte ptr ds:[rdx+28],bl
je      oglmdi2_vs2019.13F137D80
mov     byte ptr ds:[rdx+28],bl
mov     qword ptr ds:[rdx+10],rbx
mov     qword ptr ds:[rdx+18],rbx
mov     qword ptr ds:[rdx+20],rbx
jmp     oglmdi2_vs2019.13F137E4E
cmp     word ptr ds:[rcx],bx
jne     oglmdi2_vs2019.13F137DC6
cmp     qword ptr ds:[rdx+18],rbx
jne     oglmdi2_vs2019.13F137DBE
cmp     byte ptr ds:[rdx+28],bl
je      oglmdi2_vs2019.13F137DA4
mov     byte ptr ds:[rdx+28],bl
call    oglmdi2_vs2019.13F1330B0
mov     ecx,22
mov     dword ptr ds:[rax],ecx
mov     byte ptr ds:[rdi+28],bl
mov     qword ptr ds:[rdi+18],rbx
mov     ebx,ecx
jmp     oglmdi2_vs2019.13F137E4E
mov     rax,qword ptr ds:[rdx+10]
mov     byte ptr ds:[rax],bl
jmp     oglmdi2_vs2019.13F137D88
mov     qword ptr ss:[rsp+38],rbx
or      r9d,FFFFFFFF
mov     qword ptr ss:[rsp+30],rbx
mov     r8,rsi
mov     dword ptr ss:[rsp+28],ebx
xor     edx,edx
mov     ecx,ebp
mov     qword ptr ss:[rsp+20],rbx
call    oglmdi2_vs2019.13F138AFC
movsxd  rdx,eax
test    eax,eax
jne     oglmdi2_vs2019.13F137E06
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
call    oglmdi2_vs2019.13F1330B0
mov     ebx,dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F137E4E
mov     rcx,qword ptr ds:[rdi+18]
cmp     rdx,rcx
jbe     oglmdi2_vs2019.13F137E19
cmp     byte ptr ds:[rdi+28],bl
je      oglmdi2_vs2019.13F137DA4
mov     byte ptr ds:[rdi+28],bl
jmp     oglmdi2_vs2019.13F137DA4
mov     rax,qword ptr ds:[rdi+10]
or      r9d,FFFFFFFF
mov     qword ptr ss:[rsp+38],rbx
mov     r8,rsi
mov     qword ptr ss:[rsp+30],rbx
xor     edx,edx
mov     dword ptr ss:[rsp+28],ecx
mov     ecx,ebp
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F138AFC
movsxd  rcx,eax
test    eax,eax
je      oglmdi2_vs2019.13F137DF0
dec     rcx
mov     qword ptr ds:[rdi+20],rcx
mov     rbp,qword ptr ss:[rsp+58]
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+50]
mov     rsi,qword ptr ss:[rsp+60]
add     rsp,40
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rdi
push    rbp
lea     rbp,qword ptr ss:[rsp-190]
sub     rsp,290
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+180],rax
mov     edi,r8d
mov     rbx,rdx
mov     r8d,105
lea     rdx,qword ptr ss:[rsp+70]
call    qword ptr ds:[<&GetModuleFileNameW>]
test    eax,eax
jne     oglmdi2_vs2019.13F137EC2
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
xor     eax,eax
jmp     oglmdi2_vs2019.13F137F62
and     qword ptr ss:[rsp+60],0
lea     rcx,qword ptr ss:[rsp+20]
mov     rax,rdi
mov     qword ptr ss:[rsp+40],rbx
xor     edx,edx
mov     qword ptr ss:[rsp+48],rax
mov     qword ptr ss:[rsp+58],rax
mov     qword ptr ss:[rsp+50],rbx
mov     byte ptr ss:[rsp+68],0
call    oglmdi2_vs2019.13F1301AC
mov     rax,qword ptr ss:[rsp+28]
mov     r8d,FDE9
cmp     dword ptr ds:[rax+C],r8d
jne     oglmdi2_vs2019.13F137F16
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F137F4F
mov     rax,qword ptr ss:[rsp+20]
and     dword ptr ds:[rax+3A8],FFFFFFFD
jmp     oglmdi2_vs2019.13F137F4F
call    oglmdi2_vs2019.13F1333B0
test    eax,eax
jne     oglmdi2_vs2019.13F137F39
cmp     byte ptr ss:[rsp+38],al
je      oglmdi2_vs2019.13F137F31
mov     rax,qword ptr ss:[rsp+20]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     r8d,1
jmp     oglmdi2_vs2019.13F137F4F
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F137F4C
mov     rax,qword ptr ss:[rsp+20]
and     dword ptr ds:[rax+3A8],FFFFFFFD
xor     r8d,r8d
lea     rdx,qword ptr ss:[rsp+40]
lea     rcx,qword ptr ss:[rsp+70]
call    oglmdi2_vs2019.13F137D54
mov     eax,dword ptr ss:[rsp+60]
mov     rcx,qword ptr ss:[rbp+180]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
lea     r11,qword ptr ss:[rsp+290]
mov     rbx,qword ptr ds:[r11+18]
mov     rdi,qword ptr ds:[r11+20]
mov     rsp,r11
pop     rbp
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rdi,r9
mov     rbx,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rax,qword ptr ds:[rbx]
mov     rcx,qword ptr ds:[rax]
mov     rax,qword ptr ds:[rcx+88]
add     rax,18
mov     rcx,qword ptr ds:[13F14E2B8]
test    rcx,rcx
je      oglmdi2_vs2019.13F138031
test    rax,rax
je      oglmdi2_vs2019.13F138024
mov     r8d,2
mov     r9d,r8d
lea     edx,dword ptr ds:[r8+7E]
movups  xmm0,xmmword ptr ds:[rax]
movups  xmmword ptr ds:[rcx],xmm0
movups  xmm1,xmmword ptr ds:[rax+10]
movups  xmmword ptr ds:[rcx+10],xmm1
movups  xmm0,xmmword ptr ds:[rax+20]
movups  xmmword ptr ds:[rcx+20],xmm0
movups  xmm1,xmmword ptr ds:[rax+30]
movups  xmmword ptr ds:[rcx+30],xmm1
movups  xmm0,xmmword ptr ds:[rax+40]
movups  xmmword ptr ds:[rcx+40],xmm0
movups  xmm1,xmmword ptr ds:[rax+50]
movups  xmmword ptr ds:[rcx+50],xmm1
movups  xmm0,xmmword ptr ds:[rax+60]
movups  xmmword ptr ds:[rcx+60],xmm0
add     rcx,rdx
movups  xmm1,xmmword ptr ds:[rax+70]
movups  xmmword ptr ds:[rcx-10],xmm1
add     rax,rdx
sub     r9,1
jne     oglmdi2_vs2019.13F137FD4
mov     al,byte ptr ds:[rax]
mov     byte ptr ds:[rcx],al
jmp     oglmdi2_vs2019.13F13804B
xor     edx,edx
mov     r8d,101
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     r8d,2
lea     edx,dword ptr ds:[r8+7E]
mov     rax,qword ptr ds:[rbx]
mov     rcx,qword ptr ds:[rax]
mov     rax,qword ptr ds:[rcx+88]
add     rax,119
mov     rcx,qword ptr ds:[13F14E2C0]
test    rcx,rcx
je      oglmdi2_vs2019.13F1380C8
test    rax,rax
je      oglmdi2_vs2019.13F1380BB
movups  xmm0,xmmword ptr ds:[rax]
movups  xmmword ptr ds:[rcx],xmm0
movups  xmm1,xmmword ptr ds:[rax+10]
movups  xmmword ptr ds:[rcx+10],xmm1
movups  xmm0,xmmword ptr ds:[rax+20]
movups  xmmword ptr ds:[rcx+20],xmm0
movups  xmm1,xmmword ptr ds:[rax+30]
movups  xmmword ptr ds:[rcx+30],xmm1
movups  xmm0,xmmword ptr ds:[rax+40]
movups  xmmword ptr ds:[rcx+40],xmm0
movups  xmm1,xmmword ptr ds:[rax+50]
movups  xmmword ptr ds:[rcx+50],xmm1
movups  xmm0,xmmword ptr ds:[rax+60]
movups  xmmword ptr ds:[rcx+60],xmm0
add     rcx,rdx
movups  xmm1,xmmword ptr ds:[rax+70]
movups  xmmword ptr ds:[rcx-10],xmm1
add     rax,rdx
sub     r8,1
jne     oglmdi2_vs2019.13F13806F
jmp     oglmdi2_vs2019.13F1380D8
xor     edx,edx
mov     r8d,100
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     rax,qword ptr ds:[rbx+8]
mov     rcx,qword ptr ds:[rax]
mov     rdx,qword ptr ds:[rcx]
or      eax,FFFFFFFF
lock xadd dword ptr ds:[rdx],eax
cmp     eax,1
jne     oglmdi2_vs2019.13F138109
mov     rax,qword ptr ds:[rbx+8]
mov     rcx,qword ptr ds:[rax]
lea     rax,qword ptr ds:[13F14C4A0]
cmp     qword ptr ds:[rcx],rax
je      oglmdi2_vs2019.13F138109
mov     rcx,qword ptr ds:[rcx]
call    oglmdi2_vs2019.13F133148
mov     rax,qword ptr ds:[rbx]
mov     rdx,qword ptr ds:[rax]
mov     rax,qword ptr ds:[rbx+8]
mov     rcx,qword ptr ds:[rax]
mov     rax,qword ptr ds:[rdx+88]
mov     qword ptr ds:[rcx],rax
mov     rax,qword ptr ds:[rbx]
mov     rcx,qword ptr ds:[rax]
mov     rax,qword ptr ds:[rcx+88]
lock inc dword ptr ds:[rax]
mov     ecx,dword ptr ds:[rdi]
call    oglmdi2_vs2019.13F1313CC
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
push    rbx
sub     rsp,40
mov     ebx,ecx
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F1301AC
and     dword ptr ds:[13F14E2D0],0
cmp     ebx,FFFFFFFE
jne     oglmdi2_vs2019.13F138176
mov     dword ptr ds:[13F14E2D0],1
call    qword ptr ds:[<&GetOEMCP>]
jmp     oglmdi2_vs2019.13F13818B
cmp     ebx,FFFFFFFD
jne     oglmdi2_vs2019.13F13818F
mov     dword ptr ds:[13F14E2D0],1
call    qword ptr ds:[<&GetACP>]
mov     ebx,eax
jmp     oglmdi2_vs2019.13F1381A6
cmp     ebx,FFFFFFFC
jne     oglmdi2_vs2019.13F1381A6
mov     rax,qword ptr ss:[rsp+28]
mov     dword ptr ds:[13F14E2D0],1
mov     ebx,dword ptr ds:[rax+C]
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F1381B9
mov     rcx,qword ptr ss:[rsp+20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     eax,ebx
add     rsp,40
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
lea     rbx,qword ptr ds:[rcx+18]
mov     rsi,rcx
mov     ebp,101
mov     rcx,rbx
mov     r8d,ebp
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
xor     eax,eax
lea     rdi,qword ptr ds:[rsi+C]
mov     qword ptr ds:[rsi+4],rax
mov     ecx,6
mov     qword ptr ds:[rsi+220],rax
movzx   eax,ax
rep stosd dword ptr ds:[rdi],eax
lea     rdi,qword ptr ds:[13F14C4A0]
sub     rdi,rsi
mov     al,byte ptr ds:[rdi+rbx]
mov     byte ptr ds:[rbx],al
inc     rbx
sub     rbp,1
jne     oglmdi2_vs2019.13F138217
lea     rcx,qword ptr ds:[rsi+119]
mov     edx,100
mov     al,byte ptr ds:[rcx+rdi]
mov     byte ptr ds:[rcx],al
inc     rcx
sub     rdx,1
jne     oglmdi2_vs2019.13F138231
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
push    rbp
lea     rbp,qword ptr ss:[rsp-680]
sub     rsp,780
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+670],rax
mov     rbx,rcx
mov     ecx,dword ptr ds:[rcx+4]
cmp     ecx,FDE9
je      oglmdi2_vs2019.13F1383D0
lea     rdx,qword ptr ss:[rsp+50]
call    qword ptr ds:[<&GetCPInfo>]
test    eax,eax
je      oglmdi2_vs2019.13F1383D0
xor     eax,eax
lea     rcx,qword ptr ss:[rsp+70]
mov     esi,100
mov     byte ptr ds:[rcx],al
inc     eax
inc     rcx
cmp     eax,esi
jb      oglmdi2_vs2019.13F1382B0
mov     al,byte ptr ss:[rsp+56]
lea     rdx,qword ptr ss:[rsp+56]
mov     byte ptr ss:[rsp+70],20
jmp     oglmdi2_vs2019.13F1382ED
movzx   r8d,byte ptr ds:[rdx+1]
movzx   ecx,al
jmp     oglmdi2_vs2019.13F1382E2
cmp     ecx,esi
jae     oglmdi2_vs2019.13F1382E7
mov     eax,ecx
mov     byte ptr ss:[rsp+rcx+70],20
inc     ecx
cmp     ecx,r8d
jbe     oglmdi2_vs2019.13F1382D5
add     rdx,2
mov     al,byte ptr ds:[rdx]
test    al,al
jne     oglmdi2_vs2019.13F1382CB
mov     eax,dword ptr ds:[rbx+4]
lea     r8,qword ptr ss:[rsp+70]
and     dword ptr ss:[rsp+30],0
mov     r9d,esi
mov     dword ptr ss:[rsp+28],eax
mov     edx,1
lea     rax,qword ptr ss:[rbp+270]
xor     ecx,ecx
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F138FDC
and     dword ptr ss:[rsp+40],0
lea     r9,qword ptr ss:[rsp+70]
mov     eax,dword ptr ds:[rbx+4]
mov     r8d,esi
mov     rdx,qword ptr ds:[rbx+220]
xor     ecx,ecx
mov     dword ptr ss:[rsp+38],eax
lea     rax,qword ptr ss:[rbp+70]
mov     dword ptr ss:[rsp+30],esi
mov     qword ptr ss:[rsp+28],rax
mov     dword ptr ss:[rsp+20],esi
call    oglmdi2_vs2019.13F13E104
and     dword ptr ss:[rsp+40],0
lea     r9,qword ptr ss:[rsp+70]
mov     eax,dword ptr ds:[rbx+4]
mov     r8d,200
mov     rdx,qword ptr ds:[rbx+220]
xor     ecx,ecx
mov     dword ptr ss:[rsp+38],eax
lea     rax,qword ptr ss:[rbp+170]
mov     dword ptr ss:[rsp+30],esi
mov     qword ptr ss:[rsp+28],rax
mov     dword ptr ss:[rsp+20],esi
call    oglmdi2_vs2019.13F13E104
mov     eax,1
lea     rdx,qword ptr ss:[rbp+270]
test    byte ptr ds:[rdx],1
je      oglmdi2_vs2019.13F1383A5
or      byte ptr ds:[rax+rbx+18],10
mov     cl,byte ptr ss:[rbp+rax+6F]
jmp     oglmdi2_vs2019.13F1383BA
test    byte ptr ds:[rdx],2
je      oglmdi2_vs2019.13F1383B8
or      byte ptr ds:[rax+rbx+18],20
mov     cl,byte ptr ss:[rbp+rax+16F]
jmp     oglmdi2_vs2019.13F1383BA
xor     cl,cl
mov     byte ptr ds:[rax+rbx+118],cl
add     rdx,2
inc     rax
sub     rsi,1
jne     oglmdi2_vs2019.13F138395
jmp     oglmdi2_vs2019.13F138413
xor     edx,edx
mov     esi,100
lea     ecx,dword ptr ds:[rdx+1]
lea     r8d,dword ptr ds:[rdx-61]
lea     eax,dword ptr ds:[r8+20]
cmp     eax,19
ja      oglmdi2_vs2019.13F1383F1
or      byte ptr ds:[rcx+rbx+18],10
lea     eax,dword ptr ds:[rdx+20]
jmp     oglmdi2_vs2019.13F138403
cmp     r8d,19
ja      oglmdi2_vs2019.13F138401
or      byte ptr ds:[rcx+rbx+18],20
lea     eax,dword ptr ds:[rdx-20]
jmp     oglmdi2_vs2019.13F138403
xor     al,al
mov     byte ptr ds:[rcx+rbx+118],al
inc     edx
inc     rcx
cmp     edx,esi
jb      oglmdi2_vs2019.13F1383DA
mov     rcx,qword ptr ss:[rbp+670]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
lea     r11,qword ptr ss:[rsp+780]
mov     rbx,qword ptr ds:[r11+18]
mov     rsi,qword ptr ds:[r11+20]
mov     rsp,r11
pop     rbp
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
mov     qword ptr ss:[rsp+18],r8
push    rbp
push    rsi
push    rdi
mov     rbp,rsp
sub     rsp,40
mov     sil,dl
mov     ebx,ecx
mov     rdx,r9
mov     rcx,r8
call    oglmdi2_vs2019.13F1385FC
mov     ecx,ebx
call    oglmdi2_vs2019.13F138144
mov     rcx,qword ptr ss:[rbp+30]
mov     edi,eax
mov     r8,qword ptr ds:[rcx+88]
cmp     eax,dword ptr ds:[r8+4]
jne     oglmdi2_vs2019.13F138482
xor     eax,eax
jmp     oglmdi2_vs2019.13F13853A
mov     ecx,228
call    oglmdi2_vs2019.13F134230
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F13852D
mov     rax,qword ptr ss:[rbp+30]
mov     edx,4
mov     rcx,rbx
mov     rax,qword ptr ds:[rax+88]
lea     r8d,dword ptr ds:[rdx+7C]
movups  xmm0,xmmword ptr ds:[rax]
movups  xmmword ptr ds:[rcx],xmm0
movups  xmm1,xmmword ptr ds:[rax+10]
movups  xmmword ptr ds:[rcx+10],xmm1
movups  xmm0,xmmword ptr ds:[rax+20]
movups  xmmword ptr ds:[rcx+20],xmm0
movups  xmm1,xmmword ptr ds:[rax+30]
movups  xmmword ptr ds:[rcx+30],xmm1
movups  xmm0,xmmword ptr ds:[rax+40]
movups  xmmword ptr ds:[rcx+40],xmm0
movups  xmm1,xmmword ptr ds:[rax+50]
movups  xmmword ptr ds:[rcx+50],xmm1
movups  xmm0,xmmword ptr ds:[rax+60]
movups  xmmword ptr ds:[rcx+60],xmm0
add     rcx,r8
movups  xmm1,xmmword ptr ds:[rax+70]
add     rax,r8
movups  xmmword ptr ds:[rcx-10],xmm1
sub     rdx,1
jne     oglmdi2_vs2019.13F1384AF
movups  xmm0,xmmword ptr ds:[rax]
movups  xmmword ptr ds:[rcx],xmm0
movups  xmm1,xmmword ptr ds:[rax+10]
movups  xmmword ptr ds:[rcx+10],xmm1
mov     rax,qword ptr ds:[rax+20]
mov     qword ptr ds:[rcx+20],rax
mov     ecx,edi
and     dword ptr ds:[rbx],edx
mov     rdx,rbx
call    oglmdi2_vs2019.13F138730
mov     edi,eax
cmp     eax,FFFFFFFF
jne     oglmdi2_vs2019.13F138547
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
or      edi,FFFFFFFF
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
mov     eax,edi
mov     rbx,qword ptr ss:[rsp+60]
add     rsp,40
pop     rdi
pop     rsi
pop     rbp
ret     
test    sil,sil
jne     oglmdi2_vs2019.13F138551
call    oglmdi2_vs2019.13F1321B4
mov     rax,qword ptr ss:[rbp+30]
mov     rcx,qword ptr ds:[rax+88]
or      eax,FFFFFFFF
lock xadd dword ptr ds:[rcx],eax
cmp     eax,1
jne     oglmdi2_vs2019.13F138584
mov     rax,qword ptr ss:[rbp+30]
mov     rcx,qword ptr ds:[rax+88]
lea     rax,qword ptr ds:[13F14C4A0]
cmp     rcx,rax
je      oglmdi2_vs2019.13F138584
call    oglmdi2_vs2019.13F133148
mov     dword ptr ds:[rbx],1
mov     rcx,rbx
mov     rax,qword ptr ss:[rbp+30]
xor     ebx,ebx
mov     qword ptr ds:[rax+88],rcx
mov     rax,qword ptr ss:[rbp+30]
test    byte ptr ds:[rax+3A8],2
jne     oglmdi2_vs2019.13F138530
test    byte ptr ds:[13F14CA80],1
jne     oglmdi2_vs2019.13F138530
lea     rax,qword ptr ss:[rbp+30]
mov     qword ptr ss:[rbp-10],rax
lea     r9,qword ptr ss:[rbp-1C]
lea     rax,qword ptr ss:[rbp+38]
mov     qword ptr ss:[rbp-8],rax
lea     r8,qword ptr ss:[rbp-10]
lea     eax,dword ptr ds:[rbx+5]
lea     rdx,qword ptr ss:[rbp-18]
mov     dword ptr ss:[rbp-1C],eax
lea     rcx,qword ptr ss:[rbp-20]
mov     dword ptr ss:[rbp-18],eax
call    oglmdi2_vs2019.13F137F88
test    sil,sil
je      oglmdi2_vs2019.13F138530
mov     rax,qword ptr ss:[rbp+38]
mov     rcx,qword ptr ds:[rax]
mov     qword ptr ds:[13F14C490],rcx
jmp     oglmdi2_vs2019.13F138530
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
mov     rsi,rdx
mov     rdi,rcx
mov     eax,dword ptr ds:[13F14CA80]
test    dword ptr ds:[rcx+3A8],eax
je      oglmdi2_vs2019.13F138632
cmp     qword ptr ds:[rcx+90],0
je      oglmdi2_vs2019.13F138632
mov     rbx,qword ptr ds:[rcx+88]
jmp     oglmdi2_vs2019.13F138696
mov     ecx,5
call    oglmdi2_vs2019.13F131378
nop     
mov     rbx,qword ptr ds:[rdi+88]
mov     qword ptr ss:[rsp+30],rbx
cmp     rbx,qword ptr ds:[rsi]
je      oglmdi2_vs2019.13F13868C
test    rbx,rbx
je      oglmdi2_vs2019.13F138675
or      eax,FFFFFFFF
lock xadd dword ptr ds:[rbx],eax
cmp     eax,1
jne     oglmdi2_vs2019.13F138675
lea     rax,qword ptr ds:[13F14C4A0]
mov     rcx,qword ptr ss:[rsp+30]
cmp     rcx,rax
je      oglmdi2_vs2019.13F138675
call    oglmdi2_vs2019.13F133148
mov     rax,qword ptr ds:[rsi]
mov     qword ptr ds:[rdi+88],rax
mov     qword ptr ss:[rsp+30],rax
lock inc dword ptr ds:[rax]
mov     rbx,qword ptr ss:[rsp+30]
mov     ecx,5
call    oglmdi2_vs2019.13F1313CC
test    rbx,rbx
je      oglmdi2_vs2019.13F1386AE
mov     rax,rbx
mov     rbx,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
call    oglmdi2_vs2019.13F132878
nop     
sub     rsp,28
cmp     byte ptr ds:[13F14E2D4],0
jne     oglmdi2_vs2019.13F13870D
lea     rcx,qword ptr ds:[13F14C7E0]
mov     qword ptr ds:[13F14E2C0],rcx
lea     rax,qword ptr ds:[13F14C4A0]
lea     rcx,qword ptr ds:[13F14C6D0]
mov     qword ptr ds:[13F14E2C8],rax
mov     qword ptr ds:[13F14E2B8],rcx
call    oglmdi2_vs2019.13F1365A0
lea     r9,qword ptr ds:[13F14E2C8]
mov     r8,rax
mov     dl,1
mov     ecx,FFFFFFFD
call    oglmdi2_vs2019.13F138438
mov     byte ptr ds:[13F14E2D4],1
mov     al,1
add     rsp,28
ret     
sub     rsp,28
call    oglmdi2_vs2019.13F1364CC
mov     rcx,rax
lea     rdx,qword ptr ds:[13F14E2C8]
add     rsp,28
jmp     oglmdi2_vs2019.13F1385FC
mov     qword ptr ss:[rsp+18],rbx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,40
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+38],rax
mov     rsi,rdx
call    oglmdi2_vs2019.13F138144
xor     ebx,ebx
mov     edi,eax
test    eax,eax
je      oglmdi2_vs2019.13F1389BA
lea     r13,qword ptr ds:[13F14C8F0]
mov     r14d,ebx
mov     rax,r13
lea     ebp,dword ptr ds:[rbx+1]
cmp     dword ptr ds:[rax],edi
je      oglmdi2_vs2019.13F1388CD
add     r14d,ebp
add     rax,30
cmp     r14d,5
jb      oglmdi2_vs2019.13F138777
cmp     edi,FDE8
je      oglmdi2_vs2019.13F1388C5
movzx   ecx,di
call    qword ptr ds:[<&IsValidCodePage>]
test    eax,eax
je      oglmdi2_vs2019.13F1388C5
mov     eax,FDE9
cmp     edi,eax
jne     oglmdi2_vs2019.13F1387E0
mov     qword ptr ds:[rsi+4],rax
mov     qword ptr ds:[rsi+220],rbx
mov     dword ptr ds:[rsi+18],ebx
mov     word ptr ds:[rsi+1C],bx
lea     rdi,qword ptr ds:[rsi+C]
movzx   eax,bx
mov     ecx,6
rep stosd dword ptr ds:[rdi],eax
mov     rcx,rsi
call    oglmdi2_vs2019.13F138254
jmp     oglmdi2_vs2019.13F1389C2
lea     rdx,qword ptr ss:[rsp+20]
mov     ecx,edi
call    qword ptr ds:[<&GetCPInfo>]
test    eax,eax
je      oglmdi2_vs2019.13F1388B9
xor     edx,edx
lea     rcx,qword ptr ds:[rsi+18]
mov     r8d,101
call    oglmdi2_vs2019.13F12B280
cmp     dword ptr ss:[rsp+20],2
mov     dword ptr ds:[rsi+4],edi
mov     qword ptr ds:[rsi+220],rbx
jne     oglmdi2_vs2019.13F1388AF
lea     rcx,qword ptr ss:[rsp+26]
cmp     byte ptr ss:[rsp+26],bl
je      oglmdi2_vs2019.13F138852
cmp     byte ptr ds:[rcx+1],bl
je      oglmdi2_vs2019.13F138852
movzx   eax,byte ptr ds:[rcx+1]
movzx   edx,byte ptr ds:[rcx]
cmp     edx,eax
ja      oglmdi2_vs2019.13F13884A
sub     eax,edx
lea     edi,dword ptr ds:[rdx+1]
lea     edx,dword ptr ds:[rax+rbp]
or      byte ptr ds:[rdi+rsi+18],4
add     edi,ebp
sub     rdx,rbp
jne     oglmdi2_vs2019.13F13883E
add     rcx,2
cmp     byte ptr ds:[rcx],bl
jne     oglmdi2_vs2019.13F138826
lea     rax,qword ptr ds:[rsi+1A]
mov     ecx,FE
or      byte ptr ds:[rax],8
add     rax,rbp
sub     rcx,rbp
jne     oglmdi2_vs2019.13F13885B
mov     ecx,dword ptr ds:[rsi+4]
sub     ecx,3A4
je      oglmdi2_vs2019.13F13889F
sub     ecx,4
je      oglmdi2_vs2019.13F138896
sub     ecx,D
je      oglmdi2_vs2019.13F13888D
cmp     ecx,ebp
je      oglmdi2_vs2019.13F138884
mov     rax,rbx
jmp     oglmdi2_vs2019.13F1388A6
mov     rax,qword ptr ds:[13F143678]
jmp     oglmdi2_vs2019.13F1388A6
mov     rax,qword ptr ds:[13F143670]
jmp     oglmdi2_vs2019.13F1388A6
mov     rax,qword ptr ds:[13F143668]
jmp     oglmdi2_vs2019.13F1388A6
mov     rax,qword ptr ds:[13F143660]
mov     qword ptr ds:[rsi+220],rax
jmp     oglmdi2_vs2019.13F1388B1
mov     ebp,ebx
mov     dword ptr ds:[rsi+8],ebp
jmp     oglmdi2_vs2019.13F1387C4
cmp     dword ptr ds:[13F14E2D0],ebx
jne     oglmdi2_vs2019.13F1389BA
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F1389C4
xor     edx,edx
lea     rcx,qword ptr ds:[rsi+18]
mov     r8d,101
call    oglmdi2_vs2019.13F12B280
mov     eax,r14d
lea     r9,qword ptr ds:[r13+10]
lea     r15,qword ptr ds:[13F14C8E0]
mov     r14d,4
lea     r11,qword ptr ds:[rax+rax*2]
shl     r11,4
add     r9,r11
mov     rdx,r9
cmp     byte ptr ds:[r9],bl
je      oglmdi2_vs2019.13F138943
cmp     byte ptr ds:[rdx+1],bl
je      oglmdi2_vs2019.13F138943
movzx   r8d,byte ptr ds:[rdx]
movzx   eax,byte ptr ds:[rdx+1]
cmp     r8d,eax
ja      oglmdi2_vs2019.13F13893B
lea     r10d,dword ptr ds:[r8+1]
cmp     r10d,101
jae     oglmdi2_vs2019.13F13893B
mov     al,byte ptr ds:[r15]
add     r8d,ebp
or      byte ptr ds:[r10+rsi+18],al
add     r10d,ebp
movzx   eax,byte ptr ds:[rdx+1]
cmp     r8d,eax
jbe     oglmdi2_vs2019.13F13891B
add     rdx,2
cmp     byte ptr ds:[rdx],bl
jne     oglmdi2_vs2019.13F138905
add     r9,8
add     r15,rbp
sub     r14,rbp
jne     oglmdi2_vs2019.13F1388FD
mov     dword ptr ds:[rsi+4],edi
mov     dword ptr ds:[rsi+8],ebp
sub     edi,3A4
je      oglmdi2_vs2019.13F138986
sub     edi,4
je      oglmdi2_vs2019.13F13897D
sub     edi,D
je      oglmdi2_vs2019.13F138974
cmp     edi,ebp
jne     oglmdi2_vs2019.13F13898D
mov     rbx,qword ptr ds:[13F143678]
jmp     oglmdi2_vs2019.13F13898D
mov     rbx,qword ptr ds:[13F143670]
jmp     oglmdi2_vs2019.13F13898D
mov     rbx,qword ptr ds:[13F143668]
jmp     oglmdi2_vs2019.13F13898D
mov     rbx,qword ptr ds:[13F143660]
sub     r11,rsi
mov     qword ptr ds:[rsi+220],rbx
lea     rdx,qword ptr ds:[rsi+C]
mov     ecx,6
lea     rdi,qword ptr ds:[r11+r13]
movzx   eax,word ptr ds:[rdi+rdx-8]
mov     word ptr ds:[rdx],ax
lea     rdx,qword ptr ds:[rdx+2]
sub     rcx,rbp
jne     oglmdi2_vs2019.13F1389A4
jmp     oglmdi2_vs2019.13F1387D3
mov     rcx,rsi
call    oglmdi2_vs2019.13F1381C4
xor     eax,eax
mov     rcx,qword ptr ss:[rsp+38]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
mov     rbx,qword ptr ss:[rsp+90]
add     rsp,40
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,40
mov     ebx,edx
mov     edi,r9d
mov     rdx,rcx
mov     esi,r8d
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F1301AC
mov     rax,qword ptr ss:[rsp+30]
movzx   edx,bl
test    byte ptr ds:[rdx+rax+19],dil
jne     oglmdi2_vs2019.13F138A39
test    esi,esi
je      oglmdi2_vs2019.13F138A33
mov     rax,qword ptr ss:[rsp+28]
mov     rcx,qword ptr ds:[rax]
movzx   eax,word ptr ds:[rcx+rdx*2]
and     eax,esi
jmp     oglmdi2_vs2019.13F138A35
xor     eax,eax
test    eax,eax
je      oglmdi2_vs2019.13F138A3E
mov     eax,1
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F138A51
mov     rcx,qword ptr ss:[rsp+20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     rbx,qword ptr ss:[rsp+50]
mov     rsi,qword ptr ss:[rsp+58]
add     rsp,40
pop     rdi
ret     
int3    
int3    
int3    
mov     edx,ecx
mov     r9d,4
xor     ecx,ecx
xor     r8d,r8d
jmp     oglmdi2_vs2019.13F1389EC
int3    
int3    
sub     rsp,28
call    qword ptr ds:[<&GetCommandLineA>]
mov     qword ptr ds:[13F14E2F8],rax
call    qword ptr ds:[<&GetCommandLineW>]
mov     qword ptr ds:[13F14E300],rax
mov     al,1
add     rsp,28
ret     
int3    
int3    
int3    
cmp     ecx,C435
ja      oglmdi2_vs2019.13F138AC8
lea     eax,dword ptr ds:[rcx-C42C]
cmp     eax,9
ja      oglmdi2_vs2019.13F138ABF
mov     r10d,2A7
bt      r10d,eax
jb      oglmdi2_vs2019.13F138AC4
cmp     ecx,2A
jne     <oglmdi2_vs2019.MultiByteToWideChar>
xor     edx,edx
jmp     <oglmdi2_vs2019.MultiByteToWideChar>
cmp     ecx,D698
je      oglmdi2_vs2019.13F138AF0
cmp     ecx,DEA9
jbe     <oglmdi2_vs2019.MultiByteToWideChar>
cmp     ecx,DEB3
jbe     oglmdi2_vs2019.13F138AC4
cmp     ecx,FDE8
je      oglmdi2_vs2019.13F138AC4
cmp     ecx,FDE9
jne     <oglmdi2_vs2019.MultiByteToWideChar>
and     edx,8
jmp     qword ptr ds:[<&MultiByteToWideChar>]
int3    
int3    
push    rbx
lea     eax,dword ptr ds:[rcx-FDE8]
mov     r10d,ecx
cmp     eax,1
setbe   r11b
xor     ebx,ebx
cmp     ecx,C435
ja      oglmdi2_vs2019.13F138B33
lea     eax,dword ptr ds:[rcx-C42C]
cmp     eax,9
ja      oglmdi2_vs2019.13F138B2D
mov     ecx,2A7
bt      ecx,eax
jb      oglmdi2_vs2019.13F138B66
cmp     r10d,2A
jmp     oglmdi2_vs2019.13F138B5E
cmp     r10d,D698
je      oglmdi2_vs2019.13F138B66
cmp     r10d,DEA9
jbe     oglmdi2_vs2019.13F138B60
cmp     r10d,DEB3
jbe     oglmdi2_vs2019.13F138B66
cmp     r10d,FDE8
je      oglmdi2_vs2019.13F138B66
cmp     r10d,FDE9
je      oglmdi2_vs2019.13F138B66
btr     edx,7
jmp     oglmdi2_vs2019.13F138B68
mov     edx,ebx
mov     rcx,qword ptr ss:[rsp+48]
test    r11b,r11b
mov     rax,qword ptr ss:[rsp+40]
cmovne  rax,rbx
cmovne  rcx,rbx
mov     qword ptr ss:[rsp+48],rcx
mov     ecx,r10d
mov     qword ptr ss:[rsp+40],rax
pop     rbx
jmp     qword ptr ds:[<&WideCharToMultiByte>]
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,40
call    qword ptr ds:[<&GetEnvironmentStringsW>]
xor     r14d,r14d
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F138C66
mov     rsi,rax
cmp     word ptr ds:[rax],r14w
je      oglmdi2_vs2019.13F138BE7
or      rax,FFFFFFFFFFFFFFFF
inc     rax
cmp     word ptr ds:[rsi+rax*2],r14w
jne     oglmdi2_vs2019.13F138BCF
lea     rsi,qword ptr ds:[rsi+rax*2]
add     rsi,2
cmp     word ptr ds:[rsi],r14w
jne     oglmdi2_vs2019.13F138BCB
mov     qword ptr ss:[rsp+38],r14
sub     rsi,rbx
mov     qword ptr ss:[rsp+30],r14
add     rsi,2
sar     rsi,1
mov     r8,rbx
mov     r9d,esi
mov     dword ptr ss:[rsp+28],r14d
xor     edx,edx
mov     qword ptr ss:[rsp+20],r14
xor     ecx,ecx
call    oglmdi2_vs2019.13F138AFC
movsxd  rbp,eax
test    eax,eax
je      oglmdi2_vs2019.13F138C66
mov     rcx,rbp
call    oglmdi2_vs2019.13F134230
mov     rdi,rax
test    rax,rax
je      oglmdi2_vs2019.13F138C59
mov     qword ptr ss:[rsp+38],r14
mov     r9d,esi
mov     qword ptr ss:[rsp+30],r14
mov     r8,rbx
mov     dword ptr ss:[rsp+28],ebp
xor     edx,edx
xor     ecx,ecx
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F138AFC
test    eax,eax
je      oglmdi2_vs2019.13F138C59
mov     rsi,rdi
mov     rdi,r14
jmp     oglmdi2_vs2019.13F138C5C
mov     rsi,r14
mov     rcx,rdi
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F138C69
mov     rsi,r14
test    rbx,rbx
je      oglmdi2_vs2019.13F138C77
mov     rcx,rbx
call    qword ptr ds:[<&FreeEnvironmentStringsW>]
mov     rbx,qword ptr ss:[rsp+50]
mov     rax,rsi
mov     rsi,qword ptr ss:[rsp+60]
mov     rbp,qword ptr ss:[rsp+58]
mov     rdi,qword ptr ss:[rsp+68]
add     rsp,40
pop     r14
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,20
xor     ebx,ebx
mov     dword ptr ss:[rsp+30],ebx
mov     rax,qword ptr gs:[60]
mov     rcx,qword ptr ds:[rax+20]
cmp     dword ptr ds:[rcx+8],ebx
jl      oglmdi2_vs2019.13F138CC7
lea     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F133360
cmp     dword ptr ss:[rsp+30],1
je      oglmdi2_vs2019.13F138CCC
mov     ebx,1
mov     eax,ebx
add     rsp,20
pop     rbx
ret     
test    rcx,rcx
je      oglmdi2_vs2019.13F138DDD
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     rcx,qword ptr ds:[rcx+18]
cmp     rcx,qword ptr ds:[13F14C9F8]
je      oglmdi2_vs2019.13F138CF7
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+20]
cmp     rcx,qword ptr ds:[13F14CA00]
je      oglmdi2_vs2019.13F138D09
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+28]
cmp     rcx,qword ptr ds:[13F14CA08]
je      oglmdi2_vs2019.13F138D1B
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+30]
cmp     rcx,qword ptr ds:[13F14CA10]
je      oglmdi2_vs2019.13F138D2D
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+38]
cmp     rcx,qword ptr ds:[13F14CA18]
je      oglmdi2_vs2019.13F138D3F
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+40]
cmp     rcx,qword ptr ds:[13F14CA20]
je      oglmdi2_vs2019.13F138D51
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+48]
cmp     rcx,qword ptr ds:[13F14CA28]
je      oglmdi2_vs2019.13F138D63
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+68]
cmp     rcx,qword ptr ds:[13F14CA48]
je      oglmdi2_vs2019.13F138D75
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+70]
cmp     rcx,qword ptr ds:[13F14CA50]
je      oglmdi2_vs2019.13F138D87
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+78]
cmp     rcx,qword ptr ds:[13F14CA58]
je      oglmdi2_vs2019.13F138D99
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+80]
cmp     rcx,qword ptr ds:[13F14CA60]
je      oglmdi2_vs2019.13F138DAE
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+88]
cmp     rcx,qword ptr ds:[13F14CA68]
je      oglmdi2_vs2019.13F138DC3
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+90]
cmp     rcx,qword ptr ds:[13F14CA70]
je      oglmdi2_vs2019.13F138DD8
call    oglmdi2_vs2019.13F133148
add     rsp,20
pop     rbx
ret     
int3    
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F138E4B
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     rcx,qword ptr ds:[rcx]
cmp     rcx,qword ptr ds:[13F14C9E0]
je      oglmdi2_vs2019.13F138DFE
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+8]
cmp     rcx,qword ptr ds:[13F14C9E8]
je      oglmdi2_vs2019.13F138E10
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+10]
cmp     rcx,qword ptr ds:[13F14C9F0]
je      oglmdi2_vs2019.13F138E22
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+58]
cmp     rcx,qword ptr ds:[13F14CA38]
je      oglmdi2_vs2019.13F138E34
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+60]
cmp     rcx,qword ptr ds:[13F14CA40]
je      oglmdi2_vs2019.13F138E46
call    oglmdi2_vs2019.13F133148
add     rsp,20
pop     rbx
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
xor     edi,edi
lea     rax,qword ptr ds:[rcx+rdx*8]
mov     rbx,rcx
mov     rsi,rdx
movabs  rcx,1FFFFFFFFFFFFFFF
and     rsi,rcx
cmp     rbx,rax
cmova   rsi,rdi
test    rsi,rsi
je      oglmdi2_vs2019.13F138E94
mov     rcx,qword ptr ds:[rbx]
call    oglmdi2_vs2019.13F133148
inc     rdi
lea     rbx,qword ptr ds:[rbx+8]
cmp     rdi,rsi
jne     oglmdi2_vs2019.13F138E80
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
test    rcx,rcx
je      oglmdi2_vs2019.13F138FAB
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
push    rsi
sub     rsp,20
mov     ebp,7
mov     rbx,rcx
mov     edx,ebp
call    oglmdi2_vs2019.13F138E4C
lea     rcx,qword ptr ds:[rbx+38]
mov     edx,ebp
call    oglmdi2_vs2019.13F138E4C
lea     esi,dword ptr ss:[rbp+5]
mov     edx,esi
lea     rcx,qword ptr ds:[rbx+70]
call    oglmdi2_vs2019.13F138E4C
lea     rcx,qword ptr ds:[rbx+D0]
mov     edx,esi
call    oglmdi2_vs2019.13F138E4C
lea     rcx,qword ptr ds:[rbx+130]
lea     edx,dword ptr ss:[rbp-5]
call    oglmdi2_vs2019.13F138E4C
mov     rcx,qword ptr ds:[rbx+140]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+148]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+150]
call    oglmdi2_vs2019.13F133148
lea     rcx,qword ptr ds:[rbx+160]
mov     edx,ebp
call    oglmdi2_vs2019.13F138E4C
lea     rcx,qword ptr ds:[rbx+198]
mov     edx,ebp
call    oglmdi2_vs2019.13F138E4C
lea     rcx,qword ptr ds:[rbx+1D0]
mov     edx,esi
call    oglmdi2_vs2019.13F138E4C
lea     rcx,qword ptr ds:[rbx+230]
mov     edx,esi
call    oglmdi2_vs2019.13F138E4C
lea     rcx,qword ptr ds:[rbx+290]
lea     edx,dword ptr ss:[rbp-5]
call    oglmdi2_vs2019.13F138E4C
mov     rcx,qword ptr ds:[rbx+2A0]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+2A8]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+2B0]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+2B8]
call    oglmdi2_vs2019.13F133148
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
add     rsp,20
pop     rsi
ret     
sub     rsp,28
call    oglmdi2_vs2019.13F1364CC
lea     rdx,qword ptr ss:[rsp+30]
mov     rcx,qword ptr ds:[rax+90]
mov     qword ptr ss:[rsp+30],rcx
mov     rcx,rax
call    oglmdi2_vs2019.13F136774
mov     rax,qword ptr ss:[rsp+30]
mov     rax,qword ptr ds:[rax]
add     rsp,28
ret     
int3    
push    rbp
push    r12
push    r13
push    r14
push    r15
sub     rsp,60
lea     rbp,qword ptr ss:[rsp+30]
mov     qword ptr ss:[rbp+60],rbx
mov     qword ptr ss:[rbp+68],rsi
mov     qword ptr ss:[rbp+70],rdi
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rbp
mov     qword ptr ss:[rbp+20],rax
mov     r13d,edx
mov     r15d,r9d
mov     rdx,rcx
mov     r12,r8
lea     rcx,qword ptr ss:[rbp]
call    oglmdi2_vs2019.13F1301AC
mov     edi,dword ptr ss:[rbp+88]
test    edi,edi
jne     oglmdi2_vs2019.13F13902F
mov     rax,qword ptr ss:[rbp+8]
mov     edi,dword ptr ds:[rax+C]
neg     dword ptr ss:[rbp+90]
mov     r9d,r15d
mov     r8,r12
mov     ecx,edi
sbb     edx,edx
and     dword ptr ss:[rsp+28],0
and     qword ptr ss:[rsp+20],0
and     edx,8
inc     edx
call    oglmdi2_vs2019.13F138AA0
movsxd  r14,eax
test    eax,eax
jne     oglmdi2_vs2019.13F139062
xor     edi,edi
jmp     oglmdi2_vs2019.13F139130
mov     rsi,r14
add     rsi,rsi
lea     rax,qword ptr ds:[rsi+10]
cmp     rsi,rax
sbb     rcx,rcx
and     rcx,rax
je      oglmdi2_vs2019.13F1390CA
cmp     rcx,400
ja      oglmdi2_vs2019.13F1390B1
lea     rax,qword ptr ds:[rcx+F]
cmp     rax,rcx
ja      oglmdi2_vs2019.13F139093
movabs  rax,FFFFFFFFFFFFFF0
and     rax,FFFFFFFFFFFFFFF0
call    oglmdi2_vs2019.13F13F420
sub     rsp,rax
lea     rbx,qword ptr ss:[rsp+30]
test    rbx,rbx
je      oglmdi2_vs2019.13F139118
mov     dword ptr ds:[rbx],CCCC
jmp     oglmdi2_vs2019.13F1390C4
call    oglmdi2_vs2019.13F134230
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F1390CC
mov     dword ptr ds:[rax],DDDD
add     rbx,10
jmp     oglmdi2_vs2019.13F1390CC
xor     ebx,ebx
test    rbx,rbx
je      oglmdi2_vs2019.13F139118
mov     r8,rsi
xor     edx,edx
mov     rcx,rbx
call    oglmdi2_vs2019.13F12B280
mov     r9d,r15d
mov     dword ptr ss:[rsp+28],r14d
mov     r8,r12
mov     qword ptr ss:[rsp+20],rbx
mov     edx,1
mov     ecx,edi
call    oglmdi2_vs2019.13F138AA0
test    eax,eax
je      oglmdi2_vs2019.13F139118
mov     r9,qword ptr ss:[rbp+80]
mov     r8d,eax
mov     rdx,rbx
mov     ecx,r13d
call    qword ptr ds:[<&GetStringTypeW>]
mov     edi,eax
jmp     oglmdi2_vs2019.13F13911A
xor     edi,edi
test    rbx,rbx
je      oglmdi2_vs2019.13F139130
lea     rcx,qword ptr ds:[rbx-10]
cmp     dword ptr ds:[rcx],DDDD
jne     oglmdi2_vs2019.13F139130
call    oglmdi2_vs2019.13F133148
cmp     byte ptr ss:[rbp+18],0
je      oglmdi2_vs2019.13F139141
mov     rax,qword ptr ss:[rbp]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     eax,edi
mov     rcx,qword ptr ss:[rbp+20]
xor     rcx,rbp
call    oglmdi2_vs2019.13F129910
mov     rbx,qword ptr ss:[rbp+60]
mov     rsi,qword ptr ss:[rbp+68]
mov     rdi,qword ptr ss:[rbp+70]
lea     rsp,qword ptr ss:[rbp+30]
pop     r15
pop     r14
pop     r13
pop     r12
pop     rbp
ret     
int3    
int3    
int3    
lock inc dword ptr ds:[rcx+10]
mov     rax,qword ptr ds:[rcx+E0]
test    rax,rax
je      oglmdi2_vs2019.13F13917F
lock inc dword ptr ds:[rax]
mov     rax,qword ptr ds:[rcx+F0]
test    rax,rax
je      oglmdi2_vs2019.13F13918E
lock inc dword ptr ds:[rax]
mov     rax,qword ptr ds:[rcx+E8]
test    rax,rax
je      oglmdi2_vs2019.13F13919D
lock inc dword ptr ds:[rax]
mov     rax,qword ptr ds:[rcx+100]
test    rax,rax
je      oglmdi2_vs2019.13F1391AC
lock inc dword ptr ds:[rax]
lea     rax,qword ptr ds:[rcx+38]
mov     r8d,6
lea     rdx,qword ptr ds:[13F14C498]
cmp     qword ptr ds:[rax-10],rdx
je      oglmdi2_vs2019.13F1391CE
mov     rdx,qword ptr ds:[rax]
test    rdx,rdx
je      oglmdi2_vs2019.13F1391CE
lock inc dword ptr ds:[rdx]
cmp     qword ptr ds:[rax-18],0
je      oglmdi2_vs2019.13F1391E1
mov     rdx,qword ptr ds:[rax-8]
test    rdx,rdx
je      oglmdi2_vs2019.13F1391E1
lock inc dword ptr ds:[rdx]
add     rax,20
sub     r8,1
jne     oglmdi2_vs2019.13F1391B6
mov     rcx,qword ptr ds:[rcx+120]
jmp     oglmdi2_vs2019.13F139370
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
mov     rax,qword ptr ds:[rcx+F8]
mov     rbx,rcx
test    rax,rax
je      oglmdi2_vs2019.13F139294
lea     rcx,qword ptr ds:[13F14C9E0]
cmp     rax,rcx
je      oglmdi2_vs2019.13F139294
mov     rax,qword ptr ds:[rbx+E0]
test    rax,rax
je      oglmdi2_vs2019.13F139294
cmp     dword ptr ds:[rax],0
jne     oglmdi2_vs2019.13F139294
mov     rcx,qword ptr ds:[rbx+F0]
test    rcx,rcx
je      oglmdi2_vs2019.13F13925A
cmp     dword ptr ds:[rcx],0
jne     oglmdi2_vs2019.13F13925A
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+F8]
call    oglmdi2_vs2019.13F138CD4
mov     rcx,qword ptr ds:[rbx+E8]
test    rcx,rcx
je      oglmdi2_vs2019.13F13927C
cmp     dword ptr ds:[rcx],0
jne     oglmdi2_vs2019.13F13927C
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+F8]
call    oglmdi2_vs2019.13F138DE0
mov     rcx,qword ptr ds:[rbx+E0]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+F8]
call    oglmdi2_vs2019.13F133148
mov     rax,qword ptr ds:[rbx+100]
test    rax,rax
je      oglmdi2_vs2019.13F1392E7
cmp     dword ptr ds:[rax],0
jne     oglmdi2_vs2019.13F1392E7
mov     rcx,qword ptr ds:[rbx+108]
sub     rcx,FE
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+110]
mov     edi,80
sub     rcx,rdi
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+118]
sub     rcx,rdi
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+100]
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rbx+120]
call    oglmdi2_vs2019.13F139398
lea     rsi,qword ptr ds:[rbx+128]
mov     ebp,6
lea     rdi,qword ptr ds:[rbx+38]
lea     rax,qword ptr ds:[13F14C498]
cmp     qword ptr ds:[rdi-10],rax
je      oglmdi2_vs2019.13F13932A
mov     rcx,qword ptr ds:[rdi]
test    rcx,rcx
je      oglmdi2_vs2019.13F13932A
cmp     dword ptr ds:[rcx],0
jne     oglmdi2_vs2019.13F13932A
call    oglmdi2_vs2019.13F133148
mov     rcx,qword ptr ds:[rsi]
call    oglmdi2_vs2019.13F133148
cmp     qword ptr ds:[rdi-18],0
je      oglmdi2_vs2019.13F139344
mov     rcx,qword ptr ds:[rdi-8]
test    rcx,rcx
je      oglmdi2_vs2019.13F139344
cmp     dword ptr ds:[rcx],0
jne     oglmdi2_vs2019.13F139344
call    oglmdi2_vs2019.13F133148
add     rsi,8
add     rdi,20
sub     rbp,1
jne     oglmdi2_vs2019.13F139303
mov     rcx,rbx
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
jmp     oglmdi2_vs2019.13F133148
int3    
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F139391
lea     rax,qword ptr ds:[13F142FE0]
cmp     rcx,rax
je      oglmdi2_vs2019.13F139391
mov     eax,1
lock xadd dword ptr ds:[rcx+15C],eax
inc     eax
ret     
mov     eax,7FFFFFFF
ret     
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F1393CD
push    rbx
sub     rsp,20
lea     rax,qword ptr ds:[13F142FE0]
mov     rbx,rcx
cmp     rcx,rax
je      oglmdi2_vs2019.13F1393C8
mov     eax,dword ptr ds:[rcx+15C]
test    eax,eax
jne     oglmdi2_vs2019.13F1393C8
call    oglmdi2_vs2019.13F138EA4
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
add     rsp,20
pop     rbx
ret     
int3    
int3    
test    rcx,rcx
je      oglmdi2_vs2019.13F1393EF
lea     rax,qword ptr ds:[13F142FE0]
cmp     rcx,rax
je      oglmdi2_vs2019.13F1393EF
or      eax,FFFFFFFF
lock xadd dword ptr ds:[rcx+15C],eax
dec     eax
ret     
mov     eax,7FFFFFFF
ret     
int3    
int3    
int3    
sub     rsp,28
test    rcx,rcx
je      oglmdi2_vs2019.13F13949B
or      r9d,FFFFFFFF
lock add dword ptr ds:[rcx+10],r9d
mov     rax,qword ptr ds:[rcx+E0]
test    rax,rax
je      oglmdi2_vs2019.13F13941E
lock add dword ptr ds:[rax],r9d
mov     rax,qword ptr ds:[rcx+F0]
test    rax,rax
je      oglmdi2_vs2019.13F13942E
lock add dword ptr ds:[rax],r9d
mov     rax,qword ptr ds:[rcx+E8]
test    rax,rax
je      oglmdi2_vs2019.13F13943E
lock add dword ptr ds:[rax],r9d
mov     rax,qword ptr ds:[rcx+100]
test    rax,rax
je      oglmdi2_vs2019.13F13944E
lock add dword ptr ds:[rax],r9d
lea     rax,qword ptr ds:[rcx+38]
mov     r8d,6
lea     rdx,qword ptr ds:[13F14C498]
cmp     qword ptr ds:[rax-10],rdx
je      oglmdi2_vs2019.13F139471
mov     rdx,qword ptr ds:[rax]
test    rdx,rdx
je      oglmdi2_vs2019.13F139471
lock add dword ptr ds:[rdx],r9d
cmp     qword ptr ds:[rax-18],0
je      oglmdi2_vs2019.13F139485
mov     rdx,qword ptr ds:[rax-8]
test    rdx,rdx
je      oglmdi2_vs2019.13F139485
lock add dword ptr ds:[rdx],r9d
add     rax,20
sub     r8,1
jne     oglmdi2_vs2019.13F139458
mov     rcx,qword ptr ds:[rcx+120]
call    oglmdi2_vs2019.13F1393D0
add     rsp,28
ret     
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
call    oglmdi2_vs2019.13F1364CC
mov     ecx,dword ptr ds:[rax+3A8]
lea     rdi,qword ptr ds:[rax+90]
test    dword ptr ds:[13F14CA80],ecx
je      oglmdi2_vs2019.13F1394CC
mov     rbx,qword ptr ds:[rdi]
test    rbx,rbx
jne     oglmdi2_vs2019.13F1394F8
mov     ecx,4
call    oglmdi2_vs2019.13F131378
nop     
mov     rdx,qword ptr ds:[13F14E2B0]
mov     rcx,rdi
call    oglmdi2_vs2019.13F13950C
mov     rbx,rax
mov     ecx,4
call    oglmdi2_vs2019.13F1313CC
test    rbx,rbx
je      oglmdi2_vs2019.13F139506
mov     rax,rbx
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
call    oglmdi2_vs2019.13F132878
nop     
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rdi,rdx
test    rdx,rdx
je      oglmdi2_vs2019.13F139564
test    rcx,rcx
je      oglmdi2_vs2019.13F139564
mov     rbx,qword ptr ds:[rcx]
cmp     rbx,rdx
jne     oglmdi2_vs2019.13F139530
mov     rax,rdi
jmp     oglmdi2_vs2019.13F139566
mov     qword ptr ds:[rcx],rdi
mov     rcx,rdi
call    oglmdi2_vs2019.13F13916C
test    rbx,rbx
je      oglmdi2_vs2019.13F13952B
mov     rcx,rbx
call    oglmdi2_vs2019.13F1393F8
cmp     dword ptr ds:[rbx+10],0
jne     oglmdi2_vs2019.13F13952B
lea     rax,qword ptr ds:[13F14C330]
cmp     rbx,rax
je      oglmdi2_vs2019.13F13952B
mov     rcx,rbx
call    oglmdi2_vs2019.13F1391F8
jmp     oglmdi2_vs2019.13F13952B
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
sub     rsp,20
mov     rbp,r8
mov     rbx,rdx
mov     rsi,rcx
test    rdx,rdx
je      oglmdi2_vs2019.13F1395B3
xor     edx,edx
lea     rax,qword ptr ds:[rdx-20]
div     rbx
cmp     rax,r8
jae     oglmdi2_vs2019.13F1395B3
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],C
xor     eax,eax
jmp     oglmdi2_vs2019.13F1395F4
test    rsi,rsi
je      oglmdi2_vs2019.13F1395C2
call    oglmdi2_vs2019.13F13E1B4
mov     rdi,rax
jmp     oglmdi2_vs2019.13F1395C4
xor     edi,edi
imul    rbx,rbp
mov     rcx,rsi
mov     rdx,rbx
call    oglmdi2_vs2019.13F13E1F0
mov     rsi,rax
test    rax,rax
je      oglmdi2_vs2019.13F1395F1
cmp     rdi,rbx
jae     oglmdi2_vs2019.13F1395F1
sub     rbx,rdi
lea     rcx,qword ptr ds:[rax+rdi]
mov     r8,rbx
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
mov     rax,rsi
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
sub     rsp,28
call    qword ptr ds:[<&GetProcessHeap>]
test    rax,rax
mov     qword ptr ds:[13F14E318],rax
setne   al
add     rsp,28
ret     
and     qword ptr ds:[13F14E318],0
mov     al,1
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     rsi,rdx
mov     rdi,rcx
cmp     rcx,rdx
je      oglmdi2_vs2019.13F1396A2
mov     rbx,rcx
mov     rax,qword ptr ds:[rbx]
test    rax,rax
je      oglmdi2_vs2019.13F139663
call    qword ptr ds:[13F140490]
test    al,al
je      oglmdi2_vs2019.13F13966C
add     rbx,10
cmp     rbx,rsi
jne     oglmdi2_vs2019.13F139651
cmp     rbx,rsi
je      oglmdi2_vs2019.13F1396A2
cmp     rbx,rdi
je      oglmdi2_vs2019.13F13969E
add     rbx,FFFFFFFFFFFFFFF8
cmp     qword ptr ds:[rbx-8],0
je      oglmdi2_vs2019.13F139691
mov     rax,qword ptr ds:[rbx]
test    rax,rax
je      oglmdi2_vs2019.13F139691
xor     ecx,ecx
call    qword ptr ds:[13F140490]
sub     rbx,10
lea     rax,qword ptr ds:[rbx+8]
cmp     rax,rdi
jne     oglmdi2_vs2019.13F13967A
xor     al,al
jmp     oglmdi2_vs2019.13F1396A4
mov     al,1
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rbx,rdx
mov     rdi,rcx
cmp     rcx,rdx
je      oglmdi2_vs2019.13F1396E3
mov     rax,qword ptr ds:[rbx-8]
test    rax,rax
je      oglmdi2_vs2019.13F1396DA
xor     ecx,ecx
call    qword ptr ds:[13F140490]
sub     rbx,10
cmp     rbx,rdi
jne     oglmdi2_vs2019.13F1396C9
mov     rbx,qword ptr ss:[rsp+30]
mov     al,1
add     rsp,20
pop     rdi
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rdi,r9
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F131378
nop     
mov     rbx,qword ptr ds:[13F14C058]
mov     ecx,ebx
and     ecx,3F
xor     rbx,qword ptr ds:[13F14E330]
ror     rbx,cl
mov     ecx,dword ptr ds:[rdi]
call    oglmdi2_vs2019.13F1313CC
mov     rax,rbx
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     r11,rsp
sub     rsp,28
mov     eax,3
lea     r9,qword ptr ds:[r11+10]
lea     r8,qword ptr ds:[r11+8]
mov     dword ptr ss:[rsp+38],eax
lea     rdx,qword ptr ds:[r11+18]
mov     dword ptr ss:[rsp+40],eax
lea     rcx,qword ptr ds:[r11+8]
call    oglmdi2_vs2019.13F1396F0
add     rsp,28
ret     
int3    
int3    
mov     qword ptr ds:[13F14E320],rcx
mov     qword ptr ds:[13F14E328],rcx
mov     qword ptr ds:[13F14E330],rcx
mov     qword ptr ds:[13F14E338],rcx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+20],rbx
push    rsi
push    rdi
push    r12
push    r13
push    r14
sub     rsp,40
mov     ebx,ecx
xor     r13d,r13d
and     dword ptr ss:[rsp+78],r13d
mov     r14b,1
mov     byte ptr ss:[rsp+70],r14b
cmp     ecx,2
je      oglmdi2_vs2019.13F1397D1
cmp     ecx,4
je      oglmdi2_vs2019.13F139801
cmp     ecx,6
je      oglmdi2_vs2019.13F1397D1
cmp     ecx,8
je      oglmdi2_vs2019.13F139801
cmp     ecx,B
je      oglmdi2_vs2019.13F139801
cmp     ecx,F
je      oglmdi2_vs2019.13F1397D1
lea     eax,dword ptr ds:[rcx-15]
cmp     eax,1
ja      oglmdi2_vs2019.13F13984E
sub     ecx,2
je      oglmdi2_vs2019.13F139889
sub     ecx,4
je      oglmdi2_vs2019.13F13986E
sub     ecx,9
je      oglmdi2_vs2019.13F139880
sub     ecx,6
je      oglmdi2_vs2019.13F139877
cmp     ecx,1
je      oglmdi2_vs2019.13F13986E
xor     edi,edi
jmp     oglmdi2_vs2019.13F139890
call    oglmdi2_vs2019.13F136648
mov     r13,rax
test    rax,rax
jne     oglmdi2_vs2019.13F139826
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+88]
add     rsp,40
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
ret     
mov     rax,qword ptr ds:[rax]
mov     rcx,qword ptr ds:[13F142390]
shl     rcx,4
add     rcx,rax
jmp     oglmdi2_vs2019.13F139842
cmp     dword ptr ds:[rax+4],ebx
je      oglmdi2_vs2019.13F139849
add     rax,10
cmp     rax,rcx
jne     oglmdi2_vs2019.13F139839
xor     eax,eax
test    rax,rax
jne     oglmdi2_vs2019.13F139860
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F13980E
lea     rdi,qword ptr ds:[rax+8]
xor     r14b,r14b
mov     byte ptr ss:[rsp+70],r14b
jmp     oglmdi2_vs2019.13F139890
lea     rdi,qword ptr ds:[13F14E330]
jmp     oglmdi2_vs2019.13F139890
lea     rdi,qword ptr ds:[13F14E328]
jmp     oglmdi2_vs2019.13F139890
lea     rdi,qword ptr ds:[13F14E338]
jmp     oglmdi2_vs2019.13F139890
lea     rdi,qword ptr ds:[13F14E320]
and     qword ptr ss:[rsp+80],0
test    r14b,r14b
je      oglmdi2_vs2019.13F1398A9
mov     ecx,3
call    oglmdi2_vs2019.13F131378
nop     
test    r14b,r14b
je      oglmdi2_vs2019.13F1398C2
mov     rsi,qword ptr ds:[13F14C058]
mov     ecx,esi
and     ecx,3F
xor     rsi,qword ptr ds:[rdi]
ror     rsi,cl
jmp     oglmdi2_vs2019.13F1398C5
mov     rsi,qword ptr ds:[rdi]
cmp     rsi,1
je      oglmdi2_vs2019.13F139963
test    rsi,rsi
je      oglmdi2_vs2019.13F1399DB
mov     r12d,910
cmp     ebx,B
ja      oglmdi2_vs2019.13F139920
bt      r12d,ebx
jae     oglmdi2_vs2019.13F139920
mov     rax,qword ptr ds:[r13+8]
mov     qword ptr ss:[rsp+80],rax
mov     qword ptr ss:[rsp+30],rax
and     qword ptr ds:[r13+8],0
cmp     ebx,8
jne     oglmdi2_vs2019.13F139957
call    oglmdi2_vs2019.13F1364CC
mov     eax,dword ptr ds:[rax+10]
mov     dword ptr ss:[rsp+78],eax
mov     dword ptr ss:[rsp+20],eax
call    oglmdi2_vs2019.13F1364CC
mov     dword ptr ds:[rax+10],8C
cmp     ebx,8
jne     oglmdi2_vs2019.13F139957
mov     rax,qword ptr ds:[13F142398]
shl     rax,4
add     rax,qword ptr ds:[r13]
mov     rcx,qword ptr ds:[13F1423A0]
shl     rcx,4
add     rcx,rax
mov     qword ptr ss:[rsp+28],rax
cmp     rax,rcx
je      oglmdi2_vs2019.13F139969
and     qword ptr ds:[rax+8],0
add     rax,10
jmp     oglmdi2_vs2019.13F139942
mov     rax,qword ptr ds:[13F14C058]
mov     qword ptr ds:[rdi],rax
jmp     oglmdi2_vs2019.13F139969
mov     r12d,910
test    r14b,r14b
je      oglmdi2_vs2019.13F139978
mov     ecx,3
call    oglmdi2_vs2019.13F1313CC
cmp     rsi,1
jne     oglmdi2_vs2019.13F139985
xor     eax,eax
jmp     oglmdi2_vs2019.13F139811
cmp     ebx,8
jne     oglmdi2_vs2019.13F1399A3
call    oglmdi2_vs2019.13F1364CC
mov     edx,dword ptr ds:[rax+10]
mov     ecx,ebx
mov     rax,rsi
mov     r8,qword ptr ds:[13F140490]
call    r8
jmp     oglmdi2_vs2019.13F1399B1
mov     ecx,ebx
mov     rax,rsi
mov     rdx,qword ptr ds:[13F140490]
call    rdx
cmp     ebx,B
ja      oglmdi2_vs2019.13F13997E
bt      r12d,ebx
jae     oglmdi2_vs2019.13F13997E
mov     rax,qword ptr ss:[rsp+80]
mov     qword ptr ds:[r13+8],rax
cmp     ebx,8
jne     oglmdi2_vs2019.13F13997E
call    oglmdi2_vs2019.13F1364CC
mov     ecx,dword ptr ss:[rsp+78]
mov     dword ptr ds:[rax+10],ecx
jmp     oglmdi2_vs2019.13F13997E
test    r14b,r14b
je      oglmdi2_vs2019.13F1399E8
lea     ecx,dword ptr ds:[rsi+3]
call    oglmdi2_vs2019.13F1313CC
mov     ecx,3
call    oglmdi2_vs2019.13F131FA0
nop     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
mov     qword ptr ss:[rsp+18],rdi
push    rbp
mov     rbp,rsp
sub     rsp,80
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp-10],rax
mov     esi,edx
movsxd  rdi,ecx
mov     rdx,r8
lea     rcx,qword ptr ss:[rbp-38]
call    oglmdi2_vs2019.13F1301AC
lea     eax,dword ptr ds:[rdi+1]
xor     ebx,ebx
cmp     eax,100
ja      oglmdi2_vs2019.13F139A46
mov     rax,qword ptr ss:[rbp-30]
mov     rcx,qword ptr ds:[rax]
movzx   eax,word ptr ds:[rcx+rdi*2]
jmp     oglmdi2_vs2019.13F139AC5
mov     rdx,qword ptr ss:[rbp-30]
mov     eax,edi
sar     eax,8
mov     r10d,1
movzx   ecx,al
mov     rax,qword ptr ds:[rdx]
cmp     word ptr ds:[rax+rcx*2],bx
jge     oglmdi2_vs2019.13F139A71
mov     byte ptr ss:[rbp-40],cl
lea     r9d,dword ptr ds:[r10+1]
mov     byte ptr ss:[rbp-3F],dil
mov     byte ptr ss:[rbp-3E],bl
jmp     oglmdi2_vs2019.13F139A7B
mov     byte ptr ss:[rbp-40],dil
mov     r9d,r10d
mov     byte ptr ss:[rbp-3F],bl
xor     eax,eax
mov     dword ptr ss:[rsp+30],r10d
mov     dword ptr ss:[rbp-18],eax
lea     r8,qword ptr ss:[rbp-40]
mov     word ptr ss:[rbp-14],ax
lea     rcx,qword ptr ss:[rbp-30]
mov     eax,dword ptr ds:[rdx+C]
mov     edx,r10d
mov     dword ptr ss:[rsp+28],eax
lea     rax,qword ptr ss:[rbp-18]
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F138FDC
test    eax,eax
jne     oglmdi2_vs2019.13F139AC1
cmp     byte ptr ss:[rbp-20],bl
je      oglmdi2_vs2019.13F139ABD
mov     rax,qword ptr ss:[rbp-38]
and     dword ptr ds:[rax+3A8],FFFFFFFD
xor     eax,eax
jmp     oglmdi2_vs2019.13F139AD7
movzx   eax,word ptr ss:[rbp-18]
and     eax,esi
cmp     byte ptr ss:[rbp-20],bl
je      oglmdi2_vs2019.13F139AD7
mov     rcx,qword ptr ss:[rbp-38]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     rcx,qword ptr ss:[rbp-10]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
lea     r11,qword ptr ss:[rsp+80]
mov     rbx,qword ptr ds:[r11+10]
mov     rsi,qword ptr ds:[r11+18]
mov     rdi,qword ptr ds:[r11+20]
mov     rsp,r11
pop     rbp
ret     
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rbp
mov     qword ptr ss:[rsp+18],rsi
push    rdi
push    r14
push    r15
sub     rsp,20
mov     r14,rcx
test    rcx,rcx
je      oglmdi2_vs2019.13F139B90
xor     ebx,ebx
lea     r15,qword ptr ds:[13F120000]
mov     edi,E3
lea     eax,dword ptr ds:[rdi+rbx]
mov     r8d,55
cdq     
mov     rcx,r14
sub     eax,edx
sar     eax,1
movsxd  rbp,eax
mov     rdx,rbp
mov     rsi,rbp
add     rdx,rdx
mov     rdx,qword ptr ds:[r15+rdx*8+25730]
call    oglmdi2_vs2019.13F134098
test    eax,eax
je      oglmdi2_vs2019.13F139B6B
jns     oglmdi2_vs2019.13F139B5F
lea     edi,dword ptr ss:[rbp-1]
jmp     oglmdi2_vs2019.13F139B62
lea     ebx,dword ptr ss:[rbp+1]
cmp     ebx,edi
jle     oglmdi2_vs2019.13F139B2A
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F139B76
add     rsi,rsi
mov     eax,dword ptr ds:[r15+rsi*8+25738]
test    eax,eax
js      oglmdi2_vs2019.13F139B90
cmp     eax,E4
jae     oglmdi2_vs2019.13F139B90
cdqe    
add     rax,rax
mov     eax,dword ptr ds:[r15+rax*8+23CD0]
jmp     oglmdi2_vs2019.13F139B92
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+40]
mov     rbp,qword ptr ss:[rsp+48]
mov     rsi,qword ptr ss:[rsp+50]
add     rsp,20
pop     r15
pop     r14
pop     rdi
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+20],r9
push    rdi
sub     rsp,20
mov     rdi,r9
mov     rbx,r8
mov     ecx,dword ptr ds:[rdx]
call    oglmdi2_vs2019.13F12E924
nop     
mov     rax,qword ptr ds:[rbx]
movsxd  rcx,dword ptr ds:[rax]
mov     rdx,rcx
mov     rax,rcx
sar     rax,6
lea     r8,qword ptr ds:[13F14DE80]
and     edx,3F
lea     rdx,qword ptr ds:[rdx+rdx*8]
mov     rax,qword ptr ds:[r8+rax*8]
test    byte ptr ds:[rax+rdx*8+38],1
je      oglmdi2_vs2019.13F139C16
call    oglmdi2_vs2019.13F12EC30
mov     rcx,rax
call    qword ptr ds:[<&FlushFileBuffers>]
xor     ebx,ebx
test    eax,eax
jne     oglmdi2_vs2019.13F139C24
call    oglmdi2_vs2019.13F133090
mov     rbx,rax
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ds:[rbx],eax
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
or      ebx,FFFFFFFF
mov     ecx,dword ptr ds:[rdi]
call    oglmdi2_vs2019.13F12EA0C
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
mov     dword ptr ss:[rsp+8],ecx
sub     rsp,38
movsxd  rdx,ecx
cmp     edx,FFFFFFFE
jne     oglmdi2_vs2019.13F139C55
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
jmp     oglmdi2_vs2019.13F139CC1
test    ecx,ecx
js      oglmdi2_vs2019.13F139CB1
cmp     edx,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F139CB1
mov     rcx,rdx
lea     r8,qword ptr ds:[13F14DE80]
and     ecx,3F
mov     rax,rdx
sar     rax,6
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[r8+rax*8]
test    byte ptr ds:[rax+rcx*8+38],1
je      oglmdi2_vs2019.13F139CB1
lea     rax,qword ptr ss:[rsp+40]
mov     dword ptr ss:[rsp+50],edx
mov     dword ptr ss:[rsp+58],edx
lea     r9,qword ptr ss:[rsp+50]
lea     rdx,qword ptr ss:[rsp+58]
mov     qword ptr ss:[rsp+20],rax
lea     r8,qword ptr ss:[rsp+20]
lea     rcx,qword ptr ss:[rsp+48]
call    oglmdi2_vs2019.13F139BAC
jmp     oglmdi2_vs2019.13F139CC4
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
add     rsp,38
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
lea     rbp,qword ptr ss:[rsp-27]
sub     rsp,100
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+1F],rax
movsxd  rbx,edx
mov     rdi,r8
mov     rax,rbx
mov     qword ptr ss:[rbp-1],rcx
and     eax,3F
mov     r13d,r9d
lea     rcx,qword ptr ds:[13F120000]
mov     qword ptr ss:[rbp-19],r8
add     r13,r8
mov     qword ptr ss:[rbp-9],rbx
mov     r12,rbx
mov     qword ptr ss:[rbp-49],r13
lea     r14,qword ptr ds:[rax+rax*8]
sar     r12,6
mov     rax,qword ptr ds:[rcx+r12*8+2DE80]
mov     rax,qword ptr ds:[rax+r14*8+28]
mov     qword ptr ss:[rbp-41],rax
call    qword ptr ds:[<&GetConsoleCP>]
xor     edx,edx
lea     rcx,qword ptr ss:[rsp+50]
mov     dword ptr ss:[rbp-59],eax
call    oglmdi2_vs2019.13F1301AC
mov     rcx,qword ptr ss:[rsp+58]
xor     r15d,r15d
xor     r10d,r10d
mov     qword ptr ss:[rbp-51],r15
mov     qword ptr ss:[rbp-69],r15
mov     rsi,rdi
mov     edx,dword ptr ds:[rcx+C]
mov     dword ptr ss:[rbp-55],edx
cmp     rdi,r13
jae     oglmdi2_vs2019.13F13A0AA
mov     rax,rbx
mov     ebx,dword ptr ss:[rbp-65]
sar     rax,6
mov     qword ptr ss:[rbp-11],rax
mov     cl,byte ptr ds:[rsi]
mov     r15d,1
mov     byte ptr ss:[rsp+40],cl
mov     dword ptr ss:[rsp+44],r10d
cmp     edx,FDE9
jne     oglmdi2_vs2019.13F139F1E
lea     r15,qword ptr ds:[13F120000]
mov     edx,r10d
mov     r9,qword ptr ds:[r15+rax*8+2DE80]
mov     rdi,r10
lea     rax,qword ptr ds:[r9+r14*8]
cmp     byte ptr ds:[rax+rdi+3E],r10b
je      oglmdi2_vs2019.13F139DCB
inc     edx
inc     rdi
cmp     rdi,5
jl      oglmdi2_vs2019.13F139DB9
test    rdi,rdi
jle     oglmdi2_vs2019.13F139EC1
mov     rax,qword ptr ds:[r15+r12*8+2DE80]
mov     r8,qword ptr ss:[rbp-49]
sub     r8,rsi
movzx   ecx,byte ptr ds:[rax+r14*8+3E]
movsx   r15d,byte ptr ds:[rcx+r15+2C210]
inc     r15d
mov     r13d,r15d
sub     r13d,edx
movsxd  r11,r13d
cmp     r11,r8
jg      oglmdi2_vs2019.13F13A06F
mov     rdx,r10
test    rdi,rdi
jle     oglmdi2_vs2019.13F139E33
lea     rax,qword ptr ss:[rbp+7]
sub     r9,rax
lea     r10,qword ptr ds:[r9+r14*8]
lea     rcx,qword ptr ss:[rbp+7]
add     rcx,rdx
inc     rdx
mov     al,byte ptr ds:[rcx+r10+3E]
mov     byte ptr ds:[rcx],al
cmp     rdx,rdi
jl      oglmdi2_vs2019.13F139E1A
xor     r10d,r10d
test    r13d,r13d
jle     oglmdi2_vs2019.13F139E4D
lea     rcx,qword ptr ss:[rbp+7]
mov     r8,r11
add     rcx,rdi
mov     rdx,rsi
call    oglmdi2_vs2019.13F12DE70
xor     r10d,r10d
mov     rdx,r10
test    rdi,rdi
jle     oglmdi2_vs2019.13F139E74
lea     r8,qword ptr ds:[13F120000]
mov     rcx,qword ptr ds:[r8+r12*8+2DE80]
add     rcx,rdx
inc     rdx
mov     byte ptr ds:[rcx+r14*8+3E],r10b
cmp     rdx,rdi
jl      oglmdi2_vs2019.13F139E5C
lea     rax,qword ptr ss:[rbp+7]
mov     qword ptr ss:[rbp-39],r10
mov     qword ptr ss:[rbp-31],rax
lea     r9,qword ptr ss:[rbp-39]
mov     eax,r10d
lea     rdx,qword ptr ss:[rbp-31]
cmp     r15d,4
lea     rcx,qword ptr ss:[rsp+44]
sete    al
inc     eax
mov     r8d,eax
mov     r15d,eax
call    oglmdi2_vs2019.13F13BA3C
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13A182
lea     eax,dword ptr ds:[r13-1]
mov     r13,qword ptr ss:[rbp-49]
movsxd  rdi,eax
add     rdi,rsi
jmp     oglmdi2_vs2019.13F139F93
movzx   eax,byte ptr ds:[rsi]
mov     rdx,r13
sub     rdx,rsi
movsx   rdi,byte ptr ds:[rax+r15+2C210]
lea     ecx,dword ptr ds:[rdi+1]
movsxd  rax,ecx
cmp     rax,rdx
jg      oglmdi2_vs2019.13F13A0F7
cmp     ecx,4
mov     qword ptr ss:[rbp-29],r10
mov     eax,r10d
mov     qword ptr ss:[rbp-21],rsi
sete    al
lea     r9,qword ptr ss:[rbp-29]
inc     eax
lea     rdx,qword ptr ss:[rbp-21]
mov     r8d,eax
lea     rcx,qword ptr ss:[rsp+44]
mov     ebx,eax
call    oglmdi2_vs2019.13F13BA3C
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13A182
add     rdi,rsi
mov     r15d,ebx
jmp     oglmdi2_vs2019.13F139F93
lea     rax,qword ptr ds:[13F120000]
mov     rdx,qword ptr ds:[rax+r12*8+2DE80]
mov     cl,byte ptr ds:[rdx+r14*8+3D]
test    cl,4
je      oglmdi2_vs2019.13F139F58
mov     al,byte ptr ds:[rdx+r14*8+3E]
and     cl,FB
mov     byte ptr ss:[rbp+F],al
mov     r8d,2
mov     al,byte ptr ds:[rsi]
mov     byte ptr ds:[rdx+r14*8+3D],cl
lea     rdx,qword ptr ss:[rbp+F]
mov     byte ptr ss:[rbp+10],al
jmp     oglmdi2_vs2019.13F139F80
call    oglmdi2_vs2019.13F138FAC
movzx   ecx,byte ptr ds:[rsi]
xor     edx,edx
cmp     word ptr ds:[rax+rcx*2],dx
jge     oglmdi2_vs2019.13F139F7A
inc     rdi
cmp     rdi,r13
jae     oglmdi2_vs2019.13F13A148
lea     r8d,dword ptr ds:[rdx+2]
jmp     oglmdi2_vs2019.13F139F7D
mov     r8,r15
mov     rdx,rsi
lea     rcx,qword ptr ss:[rsp+44]
call    oglmdi2_vs2019.13F135C74
cmp     eax,FFFFFFFF
je      oglmdi2_vs2019.13F13A182
mov     ecx,dword ptr ss:[rbp-59]
lea     rax,qword ptr ss:[rbp+17]
xor     ebx,ebx
lea     r8,qword ptr ss:[rsp+44]
mov     qword ptr ss:[rsp+38],rbx
lea     rsi,qword ptr ds:[rdi+1]
mov     qword ptr ss:[rsp+30],rbx
mov     r9d,r15d
mov     dword ptr ss:[rsp+28],5
xor     edx,edx
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F138AFC
mov     edi,eax
test    eax,eax
je      oglmdi2_vs2019.13F13A194
mov     rcx,qword ptr ss:[rbp-41]
lea     r9,qword ptr ss:[rsp+48]
mov     r8d,eax
mov     qword ptr ss:[rsp+20],rbx
lea     rdx,qword ptr ss:[rbp+17]
call    qword ptr ds:[<&WriteFile>]
xor     r10d,r10d
test    eax,eax
je      oglmdi2_vs2019.13F13A18B
mov     r15,qword ptr ss:[rbp-51]
mov     ecx,esi
sub     ecx,dword ptr ss:[rbp-19]
lea     ebx,dword ptr ds:[rcx+r15]
mov     dword ptr ss:[rbp-65],ebx
cmp     dword ptr ss:[rsp+48],edi
jb      oglmdi2_vs2019.13F13A0AA
cmp     byte ptr ss:[rsp+40],A
jne     oglmdi2_vs2019.13F13A05B
mov     rcx,qword ptr ss:[rbp-41]
lea     eax,dword ptr ds:[r10+D]
lea     r9,qword ptr ss:[rsp+48]
mov     word ptr ss:[rsp+40],ax
lea     r8d,dword ptr ds:[r10+1]
mov     qword ptr ss:[rsp+20],r10
lea     rdx,qword ptr ss:[rsp+40]
call    qword ptr ds:[<&WriteFile>]
xor     r10d,r10d
test    eax,eax
je      oglmdi2_vs2019.13F13A179
cmp     dword ptr ss:[rsp+48],1
jb      oglmdi2_vs2019.13F13A0AA
inc     r15d
inc     ebx
mov     qword ptr ss:[rbp-51],r15
mov     dword ptr ss:[rbp-65],ebx
mov     rdi,rsi
cmp     rsi,r13
jae     oglmdi2_vs2019.13F13A0AA
mov     rax,qword ptr ss:[rbp-11]
mov     edx,dword ptr ss:[rbp-55]
jmp     oglmdi2_vs2019.13F139D83
mov     edx,r10d
test    r8,r8
jle     oglmdi2_vs2019.13F13A0A4
sub     rsi,rdi
lea     rbx,qword ptr ds:[13F120000]
mov     al,byte ptr ds:[rsi+rdi]
inc     edx
mov     rcx,qword ptr ds:[rbx+r12*8+2DE80]
add     rcx,rdi
inc     rdi
mov     byte ptr ds:[rcx+r14*8+3E],al
movsxd  rax,edx
cmp     rax,r8
jl      oglmdi2_vs2019.13F13A081
mov     ebx,dword ptr ss:[rbp-65]
add     ebx,r8d
mov     dword ptr ss:[rbp-65],ebx
cmp     byte ptr ss:[rbp-71],r10b
je      oglmdi2_vs2019.13F13A0BC
mov     rax,qword ptr ss:[rsp+50]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     rax,qword ptr ss:[rbp-1]
movsd   xmm0,qword ptr ss:[rbp-69]
mov     rcx,qword ptr ss:[rbp-51]
movsd   qword ptr ds:[rax],xmm0
mov     dword ptr ds:[rax+8],ecx
mov     rcx,qword ptr ss:[rbp+1F]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
mov     rbx,qword ptr ss:[rsp+140]
add     rsp,100
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
mov     r9d,r10d
test    rdx,rdx
jle     oglmdi2_vs2019.13F13A141
mov     r13,qword ptr ss:[rbp-9]
mov     r8,r10
mov     r10,r13
and     r13d,3F
sar     r10,6
lea     r11,qword ptr ds:[r13*8]
add     r11,r13
mov     al,byte ptr ds:[r8+rsi]
inc     r9d
mov     rcx,qword ptr ds:[r15+r10*8+2DE80]
add     rcx,r8
inc     r8
mov     byte ptr ds:[rcx+r11*8+3E],al
movsxd  rax,r9d
cmp     rax,rdx
jl      oglmdi2_vs2019.13F13A11C
xor     r10d,r10d
add     ebx,edx
jmp     oglmdi2_vs2019.13F13A0A7
mov     al,byte ptr ds:[rsi]
lea     r8,qword ptr ds:[13F120000]
mov     rcx,qword ptr ds:[r8+r12*8+2DE80]
inc     ebx
mov     dword ptr ss:[rbp-65],ebx
mov     byte ptr ds:[rcx+r14*8+3E],al
mov     rax,qword ptr ds:[r8+r12*8+2DE80]
or      byte ptr ds:[rax+r14*8+3D],4
cmp     byte ptr ss:[rbp-71],dl
jmp     oglmdi2_vs2019.13F13A0AE
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ss:[rbp-69],eax
cmp     byte ptr ss:[rbp-71],0
jmp     oglmdi2_vs2019.13F13A0AE
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ss:[rbp-69],eax
cmp     byte ptr ss:[rbp-71],bl
jmp     oglmdi2_vs2019.13F13A0AE
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+18],rbp
push    rsi
push    rdi
push    r14
mov     eax,1450
call    oglmdi2_vs2019.13F13F420
sub     rsp,rax
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+1440],rax
movsxd  r10,edx
mov     rdi,rcx
mov     rax,r10
mov     ebp,r9d
sar     rax,6
lea     rcx,qword ptr ds:[13F14DE80]
and     r10d,3F
add     rbp,r8
mov     rsi,r8
mov     rax,qword ptr ds:[rcx+rax*8]
lea     rdx,qword ptr ds:[r10+r10*8]
mov     r14,qword ptr ds:[rax+rdx*8+28]
xor     eax,eax
mov     qword ptr ds:[rdi],rax
mov     dword ptr ds:[rdi+8],eax
cmp     r8,rbp
jae     oglmdi2_vs2019.13F13A273
lea     rbx,qword ptr ss:[rsp+40]
cmp     rsi,rbp
jae     oglmdi2_vs2019.13F13A232
mov     al,byte ptr ds:[rsi]
inc     rsi
cmp     al,A
jne     oglmdi2_vs2019.13F13A220
inc     dword ptr ds:[rdi+8]
mov     byte ptr ds:[rbx],D
inc     rbx
mov     byte ptr ds:[rbx],al
inc     rbx
lea     rax,qword ptr ss:[rsp+143F]
cmp     rbx,rax
jb      oglmdi2_vs2019.13F13A209
and     qword ptr ss:[rsp+20],0
lea     rax,qword ptr ss:[rsp+40]
sub     ebx,eax
lea     r9,qword ptr ss:[rsp+30]
mov     r8d,ebx
lea     rdx,qword ptr ss:[rsp+40]
mov     rcx,r14
call    qword ptr ds:[<&WriteFile>]
test    eax,eax
je      oglmdi2_vs2019.13F13A26B
mov     eax,dword ptr ss:[rsp+30]
add     dword ptr ds:[rdi+4],eax
cmp     eax,ebx
jb      oglmdi2_vs2019.13F13A273
cmp     rsi,rbp
jb      oglmdi2_vs2019.13F13A204
jmp     oglmdi2_vs2019.13F13A273
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ds:[rdi],eax
mov     rax,rdi
mov     rcx,qword ptr ss:[rsp+1440]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
lea     r11,qword ptr ss:[rsp+1450]
mov     rbx,qword ptr ds:[r11+20]
mov     rbp,qword ptr ds:[r11+30]
mov     rsp,r11
pop     r14
pop     rdi
pop     rsi
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+18],rbp
push    rsi
push    rdi
push    r14
mov     eax,1450
call    oglmdi2_vs2019.13F13F420
sub     rsp,rax
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+1440],rax
movsxd  r10,edx
mov     rdi,rcx
mov     rax,r10
mov     ebp,r9d
sar     rax,6
lea     rcx,qword ptr ds:[13F14DE80]
and     r10d,3F
add     rbp,r8
mov     rsi,r8
mov     rax,qword ptr ds:[rcx+rax*8]
lea     rdx,qword ptr ds:[r10+r10*8]
mov     r14,qword ptr ds:[rax+rdx*8+28]
xor     eax,eax
mov     qword ptr ds:[rdi],rax
mov     dword ptr ds:[rdi+8],eax
cmp     r8,rbp
jae     oglmdi2_vs2019.13F13A38E
lea     rbx,qword ptr ss:[rsp+40]
cmp     rsi,rbp
jae     oglmdi2_vs2019.13F13A347
movzx   eax,word ptr ds:[rsi]
add     rsi,2
cmp     ax,A
jne     oglmdi2_vs2019.13F13A333
add     dword ptr ds:[rdi+8],2
mov     ecx,D
mov     word ptr ds:[rbx],cx
add     rbx,2
mov     word ptr ds:[rbx],ax
add     rbx,2
lea     rax,qword ptr ss:[rsp+143E]
cmp     rbx,rax
jb      oglmdi2_vs2019.13F13A311
and     qword ptr ss:[rsp+20],0
lea     rax,qword ptr ss:[rsp+40]
sub     rbx,rax
lea     r9,qword ptr ss:[rsp+30]
sar     rbx,1
lea     rdx,qword ptr ss:[rsp+40]
add     ebx,ebx
mov     rcx,r14
mov     r8d,ebx
call    qword ptr ds:[<&WriteFile>]
test    eax,eax
je      oglmdi2_vs2019.13F13A386
mov     eax,dword ptr ss:[rsp+30]
add     dword ptr ds:[rdi+4],eax
cmp     eax,ebx
jb      oglmdi2_vs2019.13F13A38E
cmp     rsi,rbp
jb      oglmdi2_vs2019.13F13A30C
jmp     oglmdi2_vs2019.13F13A38E
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ds:[rdi],eax
mov     rax,rdi
mov     rcx,qword ptr ss:[rsp+1440]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
lea     r11,qword ptr ss:[rsp+1450]
mov     rbx,qword ptr ds:[r11+20]
mov     rbp,qword ptr ds:[r11+30]
mov     rsp,r11
pop     r14
pop     rdi
pop     rsi
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+18],rbp
push    rsi
push    rdi
push    r12
push    r14
push    r15
mov     eax,1470
call    oglmdi2_vs2019.13F13F420
sub     rsp,rax
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+1460],rax
movsxd  r10,edx
mov     rbx,rcx
mov     rax,r10
mov     r14d,r9d
sar     rax,6
lea     rcx,qword ptr ds:[13F14DE80]
and     r10d,3F
add     r14,r8
mov     r15,r8
mov     rdi,r8
mov     rax,qword ptr ds:[rcx+rax*8]
lea     rdx,qword ptr ds:[r10+r10*8]
mov     r12,qword ptr ds:[rax+rdx*8+28]
xor     eax,eax
mov     qword ptr ds:[rbx],rax
cmp     r8,r14
mov     dword ptr ds:[rbx+8],eax
jae     oglmdi2_vs2019.13F13A4FD
lea     rax,qword ptr ss:[rsp+50]
cmp     rdi,r14
jae     oglmdi2_vs2019.13F13A466
movzx   ecx,word ptr ds:[rdi]
add     rdi,2
cmp     cx,A
jne     oglmdi2_vs2019.13F13A452
mov     edx,D
mov     word ptr ds:[rax],dx
add     rax,2
mov     word ptr ds:[rax],cx
add     rax,2
lea     rcx,qword ptr ss:[rsp+6F8]
cmp     rax,rcx
jb      oglmdi2_vs2019.13F13A434
and     qword ptr ss:[rsp+38],0
lea     rcx,qword ptr ss:[rsp+50]
and     qword ptr ss:[rsp+30],0
lea     r8,qword ptr ss:[rsp+50]
sub     rax,rcx
mov     dword ptr ss:[rsp+28],D55
lea     rcx,qword ptr ss:[rsp+700]
sar     rax,1
mov     qword ptr ss:[rsp+20],rcx
mov     r9d,eax
mov     ecx,FDE9
xor     edx,edx
call    oglmdi2_vs2019.13F138AFC
mov     ebp,eax
test    eax,eax
je      oglmdi2_vs2019.13F13A4F5
xor     esi,esi
test    eax,eax
je      oglmdi2_vs2019.13F13A4E5
and     qword ptr ss:[rsp+20],0
lea     rdx,qword ptr ss:[rsp+700]
mov     ecx,esi
lea     r9,qword ptr ss:[rsp+40]
mov     r8d,ebp
add     rdx,rcx
mov     rcx,r12
sub     r8d,esi
call    qword ptr ds:[<&WriteFile>]
test    eax,eax
je      oglmdi2_vs2019.13F13A4F5
add     esi,dword ptr ss:[rsp+40]
cmp     esi,ebp
jb      oglmdi2_vs2019.13F13A4B2
mov     eax,edi
sub     eax,r15d
mov     dword ptr ds:[rbx+4],eax
cmp     rdi,r14
jmp     oglmdi2_vs2019.13F13A429
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ds:[rbx],eax
mov     rax,rbx
mov     rcx,qword ptr ss:[rsp+1460]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
lea     r11,qword ptr ss:[rsp+1470]
mov     rbx,qword ptr ds:[r11+30]
mov     rbp,qword ptr ds:[r11+40]
mov     rsp,r11
pop     r15
pop     r14
pop     r12
pop     rdi
pop     rsi
ret     
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
mov     dword ptr ss:[rsp+8],ecx
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,20
mov     r14d,r8d
mov     r15,rdx
movsxd  rbx,ecx
cmp     ebx,FFFFFFFE
jne     oglmdi2_vs2019.13F13A56D
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
jmp     oglmdi2_vs2019.13F13A5FC
test    ecx,ecx
js      oglmdi2_vs2019.13F13A5E4
cmp     ebx,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F13A5E4
mov     rax,rbx
mov     rsi,rbx
sar     rsi,6
lea     r13,qword ptr ds:[13F14DE80]
and     eax,3F
lea     r12,qword ptr ds:[rax+rax*8]
mov     rax,qword ptr ds:[r13+rsi*8]
test    byte ptr ds:[rax+r12*8+38],1
je      oglmdi2_vs2019.13F13A5E4
mov     ecx,ebx
call    oglmdi2_vs2019.13F12E924
or      edi,FFFFFFFF
mov     rax,qword ptr ds:[r13+rsi*8]
test    byte ptr ds:[rax+r12*8+38],1
jne     oglmdi2_vs2019.13F13A5CA
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
jmp     oglmdi2_vs2019.13F13A5D9
mov     r8d,r14d
mov     rdx,r15
mov     ecx,ebx
call    oglmdi2_vs2019.13F13A618
mov     edi,eax
mov     ecx,ebx
call    oglmdi2_vs2019.13F12EA0C
mov     eax,edi
jmp     oglmdi2_vs2019.13F13A5FF
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
mov     rbx,qword ptr ss:[rsp+58]
mov     rsi,qword ptr ss:[rsp+60]
add     rsp,20
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
ret     
int3    
mov     qword ptr ss:[rsp+20],rbx
push    rbp
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
mov     rbp,rsp
sub     rsp,60
mov     r14d,r8d
mov     rdi,rdx
movsxd  r12,ecx
test    r8d,r8d
je      oglmdi2_vs2019.13F13A8D8
test    rdx,rdx
jne     oglmdi2_vs2019.13F13A666
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      eax,FFFFFFFF
jmp     oglmdi2_vs2019.13F13A8DA
mov     rax,r12
lea     rcx,qword ptr ds:[13F14DE80]
and     eax,3F
mov     r13,r12
sar     r13,6
lea     r15,qword ptr ds:[rax+rax*8]
mov     rcx,qword ptr ds:[rcx+r13*8]
mov     sil,byte ptr ds:[rcx+r15*8+39]
lea     eax,dword ptr ds:[rsi-1]
cmp     al,1
ja      oglmdi2_vs2019.13F13A697
mov     eax,r14d
not     eax
test    al,1
je      oglmdi2_vs2019.13F13A646
test    byte ptr ds:[rcx+r15*8+38],20
je      oglmdi2_vs2019.13F13A6AD
xor     edx,edx
mov     ecx,r12d
lea     r8d,dword ptr ds:[rdx+2]
call    oglmdi2_vs2019.13F13B54C
xor     ebx,ebx
mov     ecx,r12d
mov     qword ptr ss:[rbp-20],rbx
call    oglmdi2_vs2019.13F13B450
test    eax,eax
je      oglmdi2_vs2019.13F13A7C6
lea     rax,qword ptr ds:[13F14DE80]
mov     rax,qword ptr ds:[rax+r13*8]
cmp     byte ptr ds:[rax+r15*8+38],bl
jge     oglmdi2_vs2019.13F13A7C6
call    oglmdi2_vs2019.13F1364CC
mov     rcx,qword ptr ds:[rax+90]
cmp     qword ptr ds:[rcx+138],rbx
jne     oglmdi2_vs2019.13F13A704
lea     rax,qword ptr ds:[13F14DE80]
mov     rax,qword ptr ds:[rax+r13*8]
cmp     byte ptr ds:[rax+r15*8+39],bl
je      oglmdi2_vs2019.13F13A7C6
lea     rax,qword ptr ds:[13F14DE80]
mov     rcx,qword ptr ds:[rax+r13*8]
lea     rdx,qword ptr ss:[rbp-10]
mov     rcx,qword ptr ds:[rcx+r15*8+28]
call    qword ptr ds:[<&GetConsoleMode>]
test    eax,eax
je      oglmdi2_vs2019.13F13A7C6
test    sil,sil
je      oglmdi2_vs2019.13F13A7A8
dec     sil
cmp     sil,1
ja      oglmdi2_vs2019.13F13A864
xor     esi,esi
lea     r12,qword ptr ds:[rdi+r14]
mov     qword ptr ss:[rbp-30],rsi
mov     r14,rdi
cmp     rdi,r12
jae     oglmdi2_vs2019.13F13A7A1
mov     ebx,dword ptr ss:[rbp-2C]
movzx   eax,word ptr ds:[r14]
movzx   ecx,ax
mov     word ptr ss:[rbp-10],ax
call    oglmdi2_vs2019.13F13E26C
movzx   ecx,word ptr ss:[rbp-10]
cmp     ax,cx
jne     oglmdi2_vs2019.13F13A798
add     ebx,2
mov     dword ptr ss:[rbp-2C],ebx
cmp     cx,A
jne     oglmdi2_vs2019.13F13A78D
mov     ecx,D
call    oglmdi2_vs2019.13F13E26C
mov     ecx,D
cmp     ax,cx
jne     oglmdi2_vs2019.13F13A798
inc     ebx
mov     dword ptr ss:[rbp-2C],ebx
inc     esi
add     r14,2
cmp     r14,r12
jae     oglmdi2_vs2019.13F13A7A1
jmp     oglmdi2_vs2019.13F13A74D
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ss:[rbp-30],eax
mov     ebx,esi
jmp     oglmdi2_vs2019.13F13A85A
mov     r9d,r14d
lea     rcx,qword ptr ss:[rbp-30]
mov     r8,rdi
mov     edx,r12d
call    oglmdi2_vs2019.13F139CCC
movsd   xmm0,qword ptr ds:[rax]
mov     ebx,dword ptr ds:[rax+8]
jmp     oglmdi2_vs2019.13F13A85F
lea     rax,qword ptr ds:[13F14DE80]
mov     rcx,qword ptr ds:[rax+r13*8]
cmp     byte ptr ds:[rcx+r15*8+38],bl
jge     oglmdi2_vs2019.13F13A827
movsx   ecx,sil
test    sil,sil
je      oglmdi2_vs2019.13F13A813
sub     ecx,1
je      oglmdi2_vs2019.13F13A7FF
cmp     ecx,1
jne     oglmdi2_vs2019.13F13A864
mov     r9d,r14d
lea     rcx,qword ptr ss:[rbp-30]
mov     r8,rdi
mov     edx,r12d
call    oglmdi2_vs2019.13F13A2A0
jmp     oglmdi2_vs2019.13F13A7BA
mov     r9d,r14d
lea     rcx,qword ptr ss:[rbp-30]
mov     r8,rdi
mov     edx,r12d
call    oglmdi2_vs2019.13F13A3BC
jmp     oglmdi2_vs2019.13F13A7BA
mov     r9d,r14d
lea     rcx,qword ptr ss:[rbp-30]
mov     r8,rdi
mov     edx,r12d
call    oglmdi2_vs2019.13F13A19C
jmp     oglmdi2_vs2019.13F13A7BA
mov     rcx,qword ptr ds:[rcx+r15*8+28]
lea     r9,qword ptr ss:[rbp-2C]
xor     eax,eax
mov     r8d,r14d
and     qword ptr ss:[rsp+20],rax
mov     rdx,rdi
mov     qword ptr ss:[rbp-30],rax
mov     dword ptr ss:[rbp-28],eax
call    qword ptr ds:[<&WriteFile>]
test    eax,eax
jne     oglmdi2_vs2019.13F13A857
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ss:[rbp-30],eax
mov     ebx,dword ptr ss:[rbp-28]
movsd   xmm0,qword ptr ss:[rbp-30]
movsd   qword ptr ss:[rbp-20],xmm0
mov     rax,qword ptr ss:[rbp-20]
shr     rax,20
test    eax,eax
jne     oglmdi2_vs2019.13F13A8D1
mov     ecx,dword ptr ss:[rbp-20]
test    ecx,ecx
je      oglmdi2_vs2019.13F13A8A1
cmp     ecx,5
jne     oglmdi2_vs2019.13F13A897
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F133090
mov     dword ptr ds:[rax],5
jmp     oglmdi2_vs2019.13F13A65E
call    oglmdi2_vs2019.13F133040
jmp     oglmdi2_vs2019.13F13A65E
lea     rax,qword ptr ds:[13F14DE80]
mov     rax,qword ptr ds:[rax+r13*8]
test    byte ptr ds:[rax+r15*8+38],40
je      oglmdi2_vs2019.13F13A8B9
cmp     byte ptr ds:[rdi],1A
je      oglmdi2_vs2019.13F13A8D8
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],1C
call    oglmdi2_vs2019.13F133090
and     dword ptr ds:[rax],0
jmp     oglmdi2_vs2019.13F13A65E
mov     eax,dword ptr ss:[rbp-1C]
sub     eax,ebx
jmp     oglmdi2_vs2019.13F13A8DA
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+B8]
add     rsp,60
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbp
ret     
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,50
mov     rbx,qword ptr ss:[rsp+80]
test    rbx,rbx
jne     oglmdi2_vs2019.13F13A929
call    oglmdi2_vs2019.13F1330B0
mov     ebx,16
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+60]
add     rsp,50
pop     rdi
ret     
or      dword ptr ds:[rbx],FFFFFFFF
test    rcx,rcx
je      oglmdi2_vs2019.13F13A90B
mov     eax,dword ptr ss:[rsp+88]
test    eax,eax
je      oglmdi2_vs2019.13F13A945
test    r9d,FFFFFE7F
jne     oglmdi2_vs2019.13F13A90B
and     dword ptr ss:[rsp+40],0
and     dword ptr ss:[rsp+44],0
mov     dword ptr ss:[rsp+30],eax
mov     dword ptr ss:[rsp+28],r9d
mov     dword ptr ss:[rsp+20],r8d
mov     r9d,edx
mov     r8,rcx
mov     rdx,rbx
lea     rcx,qword ptr ss:[rsp+40]
call    oglmdi2_vs2019.13F13AF1C
mov     edi,eax
mov     dword ptr ss:[rsp+44],eax
cmp     dword ptr ss:[rsp+40],0
je      oglmdi2_vs2019.13F13A9A9
test    edi,edi
je      oglmdi2_vs2019.13F13A9A2
movsxd  rcx,dword ptr ds:[rbx]
mov     rax,rcx
sar     rax,6
lea     rdx,qword ptr ds:[13F14DE80]
and     ecx,3F
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[rdx+rax*8]
and     byte ptr ds:[rax+rcx*8+38],FE
mov     ecx,dword ptr ds:[rbx]
call    oglmdi2_vs2019.13F12EA0C
test    edi,edi
je      oglmdi2_vs2019.13F13A9B0
or      dword ptr ds:[rbx],FFFFFFFF
mov     eax,edi
jmp     oglmdi2_vs2019.13F13A91E
int3    
mov     r11,rsp
mov     qword ptr ds:[r11+10],rbx
mov     qword ptr ds:[r11+18],rbp
mov     qword ptr ds:[r11+20],rsi
push    rdi
push    r14
push    r15
sub     rsp,30
movsxd  r14,ecx
xor     ebx,ebx
mov     r10,r14
mov     byte ptr ds:[r9],bl
and     r10d,3F
lea     rcx,qword ptr ds:[13F14DE80]
mov     rax,r14
mov     rsi,r9
sar     rax,6
mov     edi,r8d
mov     rbp,rdx
lea     r10,qword ptr ds:[r10+r10*8]
mov     rax,qword ptr ds:[rcx+rax*8]
cmp     byte ptr ds:[rax+r10*8+38],bl
jge     oglmdi2_vs2019.13F13AC19
mov     r15d,74000
test    r15d,r8d
jne     oglmdi2_vs2019.13F13AA36
lea     rcx,qword ptr ds:[r11+8]
mov     dword ptr ss:[rsp+50],ebx
call    oglmdi2_vs2019.13F131FF4
test    eax,eax
jne     oglmdi2_vs2019.13F13AC34
mov     eax,dword ptr ss:[rsp+50]
and     eax,r15d
jne     oglmdi2_vs2019.13F13AA71
bts     edi,E
mov     ecx,edi
and     ecx,r15d
mov     r15d,2
cmp     ecx,4000
je      oglmdi2_vs2019.13F13AA87
lea     eax,dword ptr ds:[rcx-10000]
mov     edx,FFFFBFFF
test    edx,eax
je      oglmdi2_vs2019.13F13AA75
lea     eax,dword ptr ds:[rcx-20000]
test    edx,eax
je      oglmdi2_vs2019.13F13AA82
lea     eax,dword ptr ds:[rcx-40000]
test    edx,eax
jne     oglmdi2_vs2019.13F13AA89
mov     byte ptr ds:[rsi],1
jmp     oglmdi2_vs2019.13F13AA89
or      edi,eax
jmp     oglmdi2_vs2019.13F13AA36
mov     ecx,301
mov     eax,edi
and     eax,ecx
cmp     eax,ecx
jne     oglmdi2_vs2019.13F13AA89
mov     byte ptr ds:[rsi],r15b
jmp     oglmdi2_vs2019.13F13AA89
mov     byte ptr ds:[rsi],bl
test    edi,70000
je      oglmdi2_vs2019.13F13AC19
test    byte ptr ss:[rbp],40
jne     oglmdi2_vs2019.13F13AC19
mov     eax,dword ptr ss:[rbp+4]
mov     edx,C0000000
and     eax,edx
mov     ecx,ebx
mov     edi,ebx
cmp     eax,40000000
je      oglmdi2_vs2019.13F13AAC3
cmp     eax,80000000
je      oglmdi2_vs2019.13F13AAEE
cmp     eax,edx
jne     oglmdi2_vs2019.13F13AC19
mov     eax,dword ptr ss:[rbp+8]
test    eax,eax
je      oglmdi2_vs2019.13F13AC19
cmp     eax,r15d
jbe     oglmdi2_vs2019.13F13AAE1
cmp     eax,4
jbe     oglmdi2_vs2019.13F13AB34
cmp     eax,5
jne     oglmdi2_vs2019.13F13AC19
mov     edi,1
test    ecx,ecx
je      oglmdi2_vs2019.13F13ABBC
mov     r8d,3
mov     dword ptr ss:[rsp+50],ebx
lea     rdx,qword ptr ss:[rsp+50]
mov     ecx,r14d
call    oglmdi2_vs2019.13F134A20
test    eax,eax
jle     oglmdi2_vs2019.13F13AB0F
cmp     edi,1
cmove   edi,ebx
cmp     eax,FFFFFFFF
je      oglmdi2_vs2019.13F13AB59
cmp     eax,r15d
je      oglmdi2_vs2019.13F13AB70
cmp     eax,3
jne     oglmdi2_vs2019.13F13ABA9
cmp     dword ptr ss:[rsp+50],BFBBEF
jne     oglmdi2_vs2019.13F13AB70
mov     byte ptr ds:[rsi],1
jmp     oglmdi2_vs2019.13F13ABBC
mov     r8d,r15d
xor     edx,edx
mov     ecx,r14d
call    oglmdi2_vs2019.13F13B54C
test    rax,rax
je      oglmdi2_vs2019.13F13ABC0
xor     r8d,r8d
xor     edx,edx
mov     ecx,r14d
call    oglmdi2_vs2019.13F13B54C
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F13AB65
call    oglmdi2_vs2019.13F1330B0
mov     eax,dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F13AC1B
mov     ecx,dword ptr ss:[rbp+4]
shr     ecx,1F
jmp     oglmdi2_vs2019.13F13AAE6
movzx   eax,word ptr ss:[rsp+50]
cmp     eax,FFFE
jne     oglmdi2_vs2019.13F13AB89
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
jmp     oglmdi2_vs2019.13F13AB59
cmp     eax,FEFF
jne     oglmdi2_vs2019.13F13ABA9
xor     r8d,r8d
mov     rdx,r15
mov     ecx,r14d
call    oglmdi2_vs2019.13F13B54C
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13AB59
mov     byte ptr ds:[rsi],r15b
jmp     oglmdi2_vs2019.13F13ABBC
xor     r8d,r8d
xor     edx,edx
mov     ecx,r14d
call    oglmdi2_vs2019.13F13B54C
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13AB59
test    edi,edi
je      oglmdi2_vs2019.13F13AC19
movsx   ecx,byte ptr ds:[rsi]
mov     edi,ebx
mov     dword ptr ss:[rsp+50],ebx
sub     ecx,1
je      oglmdi2_vs2019.13F13ABE0
cmp     ecx,1
jne     oglmdi2_vs2019.13F13ABED
mov     dword ptr ss:[rsp+50],FEFF
mov     edi,r15d
jmp     oglmdi2_vs2019.13F13ABF1
mov     dword ptr ss:[rsp+50],BFBBEF
mov     edi,3
test    edi,edi
je      oglmdi2_vs2019.13F13AC19
mov     r8d,edi
movsxd  rax,ebx
lea     rdx,qword ptr ss:[rsp+50]
sub     r8d,ebx
add     rdx,rax
mov     ecx,r14d
call    oglmdi2_vs2019.13F13A52C
cmp     eax,FFFFFFFF
je      oglmdi2_vs2019.13F13AB59
add     ebx,eax
cmp     edi,ebx
jg      oglmdi2_vs2019.13F13ABF1
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+58]
mov     rbp,qword ptr ss:[rsp+60]
mov     rsi,qword ptr ss:[rsp+68]
add     rsp,30
pop     r15
pop     r14
pop     rdi
ret     
xor     r9d,r9d
mov     qword ptr ss:[rsp+20],rbx
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    oglmdi2_vs2019.13F132FB0
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+18],rbp
push    rsi
push    rdi
push    r14
sub     rsp,30
mov     rbx,rcx
mov     byte ptr ds:[rcx],0
mov     ecx,edx
mov     r14d,r9d
mov     ebp,r8d
mov     edi,edx
mov     esi,FFFFFFFF
and     ecx,3
je      oglmdi2_vs2019.13F13ACC1
sub     ecx,1
je      oglmdi2_vs2019.13F13AC9D
cmp     ecx,1
je      oglmdi2_vs2019.13F13AC96
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     ecx,esi
jmp     oglmdi2_vs2019.13F13ACC6
mov     ecx,C0000000
jmp     oglmdi2_vs2019.13F13ACC6
test    edi,70000
setne   cl
test    dil,8
setne   al
and     cl,al
neg     cl
sbb     ecx,ecx
and     ecx,80000000
add     ecx,40000000
jmp     oglmdi2_vs2019.13F13ACC6
mov     ecx,80000000
mov     eax,edi
mov     dword ptr ds:[rbx+4],ecx
mov     edx,700
and     eax,edx
je      oglmdi2_vs2019.13F13AD35
cmp     eax,100
je      oglmdi2_vs2019.13F13AD2E
cmp     eax,200
je      oglmdi2_vs2019.13F13AD27
cmp     eax,300
je      oglmdi2_vs2019.13F13AD20
cmp     eax,400
je      oglmdi2_vs2019.13F13AD35
cmp     eax,500
je      oglmdi2_vs2019.13F13AD19
cmp     eax,600
je      oglmdi2_vs2019.13F13AD27
cmp     eax,edx
je      oglmdi2_vs2019.13F13AD19
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
mov     ecx,dword ptr ds:[rbx+4]
mov     eax,esi
jmp     oglmdi2_vs2019.13F13AD3A
mov     eax,1
jmp     oglmdi2_vs2019.13F13AD3A
mov     eax,2
jmp     oglmdi2_vs2019.13F13AD3A
mov     eax,5
jmp     oglmdi2_vs2019.13F13AD3A
mov     eax,4
jmp     oglmdi2_vs2019.13F13AD3A
mov     eax,3
mov     dword ptr ds:[rbx+8],eax
sub     ebp,10
je      oglmdi2_vs2019.13F13AD8B
sub     ebp,10
je      oglmdi2_vs2019.13F13AD84
sub     ebp,10
je      oglmdi2_vs2019.13F13AD7D
sub     ebp,10
je      oglmdi2_vs2019.13F13AD76
cmp     ebp,40
je      oglmdi2_vs2019.13F13AD68
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F13AD8D
xor     esi,esi
cmp     ecx,80000000
sete    sil
jmp     oglmdi2_vs2019.13F13AD8D
mov     esi,3
jmp     oglmdi2_vs2019.13F13AD8D
mov     esi,2
jmp     oglmdi2_vs2019.13F13AD8D
mov     esi,1
jmp     oglmdi2_vs2019.13F13AD8D
xor     esi,esi
and     dword ptr ds:[rbx+14],0
mov     dword ptr ds:[rbx+C],esi
mov     dword ptr ds:[rbx+10],80
test    dil,dil
jns     oglmdi2_vs2019.13F13ADA3
or      byte ptr ds:[rbx],10
mov     esi,8000
test    esi,edi
jne     oglmdi2_vs2019.13F13ADCB
test    edi,74000
jne     oglmdi2_vs2019.13F13ADC8
lea     rcx,qword ptr ss:[rsp+58]
call    oglmdi2_vs2019.13F131FF4
test    eax,eax
jne     oglmdi2_vs2019.13F13AE40
cmp     dword ptr ss:[rsp+58],esi
je      oglmdi2_vs2019.13F13ADCB
or      byte ptr ds:[rbx],80
mov     ecx,100
test    ecx,edi
je      oglmdi2_vs2019.13F13ADEA
mov     eax,dword ptr ds:[13F14E340]
not     eax
and     eax,r14d
test    al,al
js      oglmdi2_vs2019.13F13ADEA
mov     dword ptr ds:[rbx+10],1
test    dil,40
je      oglmdi2_vs2019.13F13ADFE
bts     dword ptr ds:[rbx+14],1A
bts     dword ptr ds:[rbx+4],10
or      dword ptr ds:[rbx+C],4
bt      edi,C
jae     oglmdi2_vs2019.13F13AE07
or      dword ptr ds:[rbx+10],ecx
bt      edi,D
jae     oglmdi2_vs2019.13F13AE12
bts     dword ptr ds:[rbx+14],19
test    dil,20
je      oglmdi2_vs2019.13F13AE1F
bts     dword ptr ds:[rbx+14],1B
jmp     oglmdi2_vs2019.13F13AE2A
test    dil,10
je      oglmdi2_vs2019.13F13AE2A
bts     dword ptr ds:[rbx+14],1C
mov     rbp,qword ptr ss:[rsp+60]
mov     rax,rbx
mov     rbx,qword ptr ss:[rsp+50]
add     rsp,30
pop     r14
pop     rdi
pop     rsi
ret     
and     qword ptr ss:[rsp+20],0
xor     r9d,r9d
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    oglmdi2_vs2019.13F132FB0
int3    
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rbp
push    rdi
sub     rsp,20
movsxd  rbx,ecx
lea     rcx,qword ptr ds:[13F14DE80]
mov     rdx,rbx
mov     rax,rbx
sar     rax,6
and     edx,3F
mov     rax,qword ptr ds:[rcx+rax*8]
lea     rdx,qword ptr ds:[rdx+rdx*8]
mov     cl,byte ptr ds:[rax+rdx*8+38]
test    cl,48
jne     oglmdi2_vs2019.13F13AF07
xor     ebp,ebp
test    cl,cl
jns     oglmdi2_vs2019.13F13AF07
lea     r8d,dword ptr ss:[rbp+2]
or      rdx,FFFFFFFFFFFFFFFF
mov     ecx,ebx
call    oglmdi2_vs2019.13F13B54C
mov     rdi,rax
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F13AEC3
call    oglmdi2_vs2019.13F133090
cmp     dword ptr ds:[rax],83
je      oglmdi2_vs2019.13F13AF07
call    oglmdi2_vs2019.13F1330B0
mov     eax,dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F13AF09
mov     r8d,1
mov     word ptr ss:[rsp+30],bp
lea     rdx,qword ptr ss:[rsp+30]
mov     ecx,ebx
call    oglmdi2_vs2019.13F134A20
test    eax,eax
jne     oglmdi2_vs2019.13F13AEF5
cmp     word ptr ss:[rsp+30],1A
jne     oglmdi2_vs2019.13F13AEF5
mov     rdx,rdi
mov     ecx,ebx
call    oglmdi2_vs2019.13F13E2A8
cmp     eax,FFFFFFFF
je      oglmdi2_vs2019.13F13AEBA
xor     r8d,r8d
xor     edx,edx
mov     ecx,ebx
call    oglmdi2_vs2019.13F13B54C
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13AEBA
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+38]
mov     rbp,qword ptr ss:[rsp+40]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rsi
mov     qword ptr ds:[rax+18],rdi
mov     qword ptr ds:[rax+20],r14
push    rbp
lea     rbp,qword ptr ds:[rax-47]
sub     rsp,90
and     qword ptr ss:[rbp+F],0
mov     rsi,rdx
and     qword ptr ss:[rbp+17],0
mov     r14,rcx
and     qword ptr ss:[rbp+1F],0
lea     rcx,qword ptr ss:[rbp-11]
and     qword ptr ss:[rbp+27],0
xor     edx,edx
and     qword ptr ss:[rbp+2F],0
mov     edi,r9d
mov     rbx,r8
mov     byte ptr ss:[rbp+37],0
call    oglmdi2_vs2019.13F1301AC
mov     rax,qword ptr ss:[rbp-9]
mov     r8d,FDE9
cmp     dword ptr ds:[rax+C],r8d
jne     oglmdi2_vs2019.13F13AF92
cmp     byte ptr ss:[rbp+7],0
je      oglmdi2_vs2019.13F13AFC7
mov     rax,qword ptr ss:[rbp-11]
and     dword ptr ds:[rax+3A8],FFFFFFFD
jmp     oglmdi2_vs2019.13F13AFC7
call    oglmdi2_vs2019.13F1333B0
test    eax,eax
jne     oglmdi2_vs2019.13F13AFB3
cmp     byte ptr ss:[rbp+7],al
je      oglmdi2_vs2019.13F13AFAB
mov     rax,qword ptr ss:[rbp-11]
and     dword ptr ds:[rax+3A8],FFFFFFFD
mov     r8d,1
jmp     oglmdi2_vs2019.13F13AFC7
cmp     byte ptr ss:[rbp+7],0
je      oglmdi2_vs2019.13F13AFC4
mov     rax,qword ptr ss:[rbp-11]
and     dword ptr ds:[rax+3A8],FFFFFFFD
xor     r8d,r8d
lea     rdx,qword ptr ss:[rbp+F]
mov     rcx,rbx
call    oglmdi2_vs2019.13F1373A4
test    eax,eax
je      oglmdi2_vs2019.13F13AFDC
or      ebx,FFFFFFFF
jmp     oglmdi2_vs2019.13F13B005
mov     eax,dword ptr ss:[rbp+7F]
mov     r9d,edi
mov     r8,qword ptr ss:[rbp+1F]
mov     rdx,rsi
mov     dword ptr ss:[rsp+30],eax
mov     rcx,r14
mov     eax,dword ptr ss:[rbp+77]
mov     dword ptr ss:[rsp+28],eax
mov     eax,dword ptr ss:[rbp+6F]
mov     dword ptr ss:[rsp+20],eax
call    oglmdi2_vs2019.13F13B068
mov     ebx,eax
cmp     byte ptr ss:[rbp+37],0
je      oglmdi2_vs2019.13F13B014
mov     rcx,qword ptr ss:[rbp+1F]
call    oglmdi2_vs2019.13F133148
lea     r11,qword ptr ss:[rsp+90]
mov     eax,ebx
mov     rbx,qword ptr ds:[r11+10]
mov     rsi,qword ptr ds:[r11+18]
mov     rdi,qword ptr ds:[r11+20]
mov     r14,qword ptr ds:[r11+28]
mov     rsp,r11
pop     rbp
ret     
int3    
sub     rsp,38
mov     eax,r9d
mov     dword ptr ss:[rsp+28],1
mov     r9d,dword ptr ss:[rsp+60]
mov     r10d,r8d
mov     r11,rdx
mov     qword ptr ss:[rsp+20],rcx
mov     r8d,eax
mov     edx,r10d
mov     rcx,r11
call    oglmdi2_vs2019.13F13A8F4
add     rsp,38
ret     
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rsi
mov     qword ptr ds:[rax+20],rdi
mov     qword ptr ds:[rax+18],r8
push    rbp
push    r12
push    r13
push    r14
push    r15
lea     rbp,qword ptr ds:[rax-47]
sub     rsp,B0
mov     r12d,r9d
mov     rbx,r8
mov     r9d,dword ptr ss:[rbp+77]
mov     rdi,rdx
mov     r8d,dword ptr ss:[rbp+6F]
mov     rsi,rcx
mov     edx,r12d
lea     rcx,qword ptr ss:[rbp-1]
call    oglmdi2_vs2019.13F13AC4C
movups  xmm0,xmmword ptr ds:[rax]
movsd   xmm1,qword ptr ds:[rax+10]
movups  xmmword ptr ss:[rbp-49],xmm0
psrldq  xmm0,8
movq    r15,xmm0
movsd   qword ptr ss:[rbp-31],xmm1
shr     r15,20
movsd   qword ptr ss:[rbp-39],xmm1
mov     qword ptr ss:[rbp-21],r15
cmp     r15d,FFFFFFFF
jne     oglmdi2_vs2019.13F13B0F5
call    oglmdi2_vs2019.13F133090
xor     esi,esi
mov     dword ptr ds:[rax],esi
or      dword ptr ds:[rdi],FFFFFFFF
call    oglmdi2_vs2019.13F1330B0
mov     eax,dword ptr ds:[rax]
jmp     oglmdi2_vs2019.13F13B42E
call    oglmdi2_vs2019.13F12EA34
mov     dword ptr ds:[rdi],eax
cmp     eax,FFFFFFFF
jne     oglmdi2_vs2019.13F13B11A
call    oglmdi2_vs2019.13F133090
xor     esi,esi
mov     dword ptr ds:[rax],esi
or      dword ptr ds:[rdi],FFFFFFFF
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],18
jmp     oglmdi2_vs2019.13F13B0E9
mov     ecx,dword ptr ss:[rbp-41]
lea     r9,qword ptr ss:[rbp-19]
mov     r14,qword ptr ss:[rbp-39]
mov     eax,r12d
mov     rdx,qword ptr ss:[rbp-49]
mov     r8d,r15d
shr     eax,7
shr     r14,20
not     eax
or      r14d,dword ptr ss:[rbp-39]
and     eax,1
mov     dword ptr ds:[rsi],1
xor     esi,esi
mov     qword ptr ss:[rsp+30],rsi
mov     dword ptr ss:[rsp+28],r14d
mov     dword ptr ss:[rsp+20],ecx
mov     rcx,rbx
shr     rdx,20
mov     dword ptr ss:[rbp-19],18
mov     qword ptr ss:[rbp-11],rsi
mov     dword ptr ss:[rbp-9],eax
mov     qword ptr ss:[rbp-29],r14
call    qword ptr ds:[<&CreateFileW>]
mov     ebx,dword ptr ss:[rbp-45]
mov     ecx,C0000000
mov     r13,rax
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F13B200
mov     eax,ebx
and     eax,ecx
cmp     eax,ecx
jne     oglmdi2_vs2019.13F13B1CD
test    r12b,1
je      oglmdi2_vs2019.13F13B1CD
mov     ecx,dword ptr ss:[rbp-41]
lea     r9,qword ptr ss:[rbp-19]
mov     qword ptr ss:[rsp+30],rsi
btr     ebx,1F
mov     dword ptr ss:[rbp-45],ebx
mov     r8d,r15d
mov     rdx,qword ptr ss:[rbp-49]
mov     dword ptr ss:[rsp+28],r14d
mov     dword ptr ss:[rsp+20],ecx
mov     rcx,qword ptr ss:[rbp+5F]
shr     rdx,20
call    qword ptr ds:[<&CreateFileW>]
mov     r13,rax
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F13B200
movsxd  rcx,dword ptr ds:[rdi]
lea     r15,qword ptr ds:[13F14DE80]
mov     rax,rcx
and     ecx,3F
sar     rax,6
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[r15+rax*8]
and     byte ptr ds:[rax+rcx*8+38],FE
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
jmp     oglmdi2_vs2019.13F13B0E9
mov     rcx,r13
call    qword ptr ds:[<&GetFileType>]
test    eax,eax
jne     oglmdi2_vs2019.13F13B25E
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
mov     ebx,eax
call    oglmdi2_vs2019.13F133040
movsxd  rdx,dword ptr ds:[rdi]
lea     r15,qword ptr ds:[13F14DE80]
mov     rcx,rdx
and     edx,3F
sar     rcx,6
lea     rdx,qword ptr ds:[rdx+rdx*8]
mov     rcx,qword ptr ds:[r15+rcx*8]
and     byte ptr ds:[rcx+rdx*8+38],FE
mov     rcx,r13
call    qword ptr ds:[<&CloseHandle>]
test    ebx,ebx
jne     oglmdi2_vs2019.13F13B0E9
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],D
jmp     oglmdi2_vs2019.13F13B0E9
mov     r14b,byte ptr ss:[rbp-49]
cmp     eax,2
jne     oglmdi2_vs2019.13F13B26D
or      r14b,40
jmp     oglmdi2_vs2019.13F13B276
cmp     eax,3
jne     oglmdi2_vs2019.13F13B276
or      r14b,8
mov     ecx,dword ptr ds:[rdi]
mov     rdx,r13
call    oglmdi2_vs2019.13F12E94C
movsxd  rcx,dword ptr ds:[rdi]
lea     r15,qword ptr ds:[13F14DE80]
mov     rax,rcx
or      r14b,1
sar     rax,6
and     ecx,3F
mov     byte ptr ss:[rbp-49],r14b
mov     rax,qword ptr ds:[r15+rax*8]
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     byte ptr ds:[rax+rcx*8+38],r14b
movsxd  rcx,dword ptr ds:[rdi]
mov     rax,rcx
and     ecx,3F
sar     rax,6
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[r15+rax*8]
mov     byte ptr ds:[rax+rcx*8+39],sil
test    r12b,2
je      oglmdi2_vs2019.13F13B2E6
mov     ecx,dword ptr ds:[rdi]
call    oglmdi2_vs2019.13F13AE58
mov     dword ptr ss:[rbp-4D],eax
test    eax,eax
je      oglmdi2_vs2019.13F13B2E6
mov     ecx,dword ptr ds:[rdi]
call    oglmdi2_vs2019.13F133E50
mov     eax,dword ptr ss:[rbp-4D]
jmp     oglmdi2_vs2019.13F13B42E
movups  xmm0,xmmword ptr ss:[rbp-49]
lea     r9,qword ptr ss:[rbp-51]
mov     ecx,dword ptr ds:[rdi]
movsd   xmm1,qword ptr ss:[rbp-31]
lea     rdx,qword ptr ss:[rbp-1]
mov     r8d,r12d
movaps  xmmword ptr ss:[rbp-1],xmm0
mov     byte ptr ss:[rbp-51],sil
movsd   qword ptr ss:[rbp+F],xmm1
call    oglmdi2_vs2019.13F13A9B8
movsxd  rcx,dword ptr ds:[rdi]
mov     dword ptr ss:[rbp-4D],eax
test    eax,eax
jne     oglmdi2_vs2019.13F13B2D9
mov     rax,rcx
sar     rcx,6
and     eax,3F
mov     rcx,qword ptr ds:[r15+rcx*8]
lea     rdx,qword ptr ds:[rax+rax*8]
mov     al,byte ptr ss:[rbp-51]
mov     byte ptr ds:[rcx+rdx*8+39],al
movsxd  rcx,dword ptr ds:[rdi]
mov     rax,rcx
and     ecx,3F
sar     rax,6
lea     rdx,qword ptr ds:[rcx+rcx*8]
mov     rcx,qword ptr ds:[r15+rax*8]
mov     eax,r12d
shr     eax,10
and     al,1
and     byte ptr ds:[rcx+rdx*8+3D],FE
or      byte ptr ds:[rcx+rdx*8+3D],al
test    r14b,48
jne     oglmdi2_vs2019.13F13B37D
test    r12b,8
je      oglmdi2_vs2019.13F13B37D
movsxd  rcx,dword ptr ds:[rdi]
mov     rax,rcx
and     ecx,3F
sar     rax,6
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[r15+rax*8]
or      byte ptr ds:[rax+rcx*8+38],20
mov     ecx,C0000000
mov     eax,ebx
and     eax,ecx
cmp     eax,ecx
jne     oglmdi2_vs2019.13F13B42C
test    r12b,1
je      oglmdi2_vs2019.13F13B42C
mov     rcx,r13
call    qword ptr ds:[<&CloseHandle>]
mov     rcx,qword ptr ss:[rbp-29]
lea     r9,qword ptr ss:[rbp-19]
mov     r8d,dword ptr ss:[rbp-21]
btr     ebx,1F
mov     qword ptr ss:[rsp+30],rsi
mov     dword ptr ss:[rsp+28],ecx
mov     ecx,dword ptr ss:[rbp-41]
mov     dword ptr ss:[rsp+20],ecx
mov     rcx,qword ptr ss:[rbp+5F]
mov     dword ptr ss:[rbp-45],ebx
mov     rdx,qword ptr ss:[rbp-49]
shr     rdx,20
call    qword ptr ds:[<&CreateFileW>]
mov     rdx,rax
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F13B412
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
movsxd  rcx,dword ptr ds:[rdi]
mov     rax,rcx
and     ecx,3F
sar     rax,6
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[r15+rax*8]
and     byte ptr ds:[rax+rcx*8+38],FE
mov     ecx,dword ptr ds:[rdi]
call    oglmdi2_vs2019.13F12EB74
jmp     oglmdi2_vs2019.13F13B0E9
movsxd  rcx,dword ptr ds:[rdi]
mov     rax,rcx
sar     rax,6
and     ecx,3F
mov     rax,qword ptr ds:[r15+rax*8]
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     qword ptr ds:[rax+rcx*8+28],rdx
xor     eax,eax
lea     r11,qword ptr ss:[rsp+B0]
mov     rbx,qword ptr ds:[r11+30]
mov     rsi,qword ptr ds:[r11+38]
mov     rdi,qword ptr ds:[r11+48]
mov     rsp,r11
pop     r15
pop     r14
pop     r13
pop     r12
pop     rbp
ret     
int3    
sub     rsp,28
cmp     ecx,FFFFFFFE
jne     oglmdi2_vs2019.13F13B466
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
jmp     oglmdi2_vs2019.13F13B4A8
test    ecx,ecx
js      oglmdi2_vs2019.13F13B498
cmp     ecx,dword ptr ds:[13F14E280]
jae     oglmdi2_vs2019.13F13B498
movsxd  rcx,ecx
lea     rdx,qword ptr ds:[13F14DE80]
mov     rax,rcx
and     ecx,3F
sar     rax,6
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[rdx+rax*8]
movzx   eax,byte ptr ds:[rax+rcx*8+38]
and     eax,40
jmp     oglmdi2_vs2019.13F13B4AA
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
call    oglmdi2_vs2019.13F132F90
xor     eax,eax
add     rsp,28
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
movsxd  rbx,ecx
mov     edi,r8d
mov     ecx,ebx
mov     rsi,rdx
call    oglmdi2_vs2019.13F12EC30
cmp     rax,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F13B4E6
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],9
or      rax,FFFFFFFFFFFFFFFF
jmp     oglmdi2_vs2019.13F13B539
mov     r9d,edi
lea     r8,qword ptr ss:[rsp+48]
mov     rdx,rsi
mov     rcx,rax
call    qword ptr ds:[<&SetFilePointerEx>]
test    eax,eax
jne     oglmdi2_vs2019.13F13B50D
call    qword ptr ds:[<&GetLastError>]
mov     ecx,eax
call    oglmdi2_vs2019.13F133040
jmp     oglmdi2_vs2019.13F13B4E0
mov     rax,qword ptr ss:[rsp+48]
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13B4E0
mov     rdx,rbx
lea     r8,qword ptr ds:[13F14DE80]
and     edx,3F
mov     rcx,rbx
sar     rcx,6
lea     rdx,qword ptr ds:[rdx+rdx*8]
mov     rcx,qword ptr ds:[r8+rcx*8]
and     byte ptr ds:[rcx+rdx*8+38],FD
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
jmp     oglmdi2_vs2019.13F13B4B0
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
inc     dword ptr ds:[13F14D8F0]
mov     rbx,rcx
mov     edi,1000
mov     ecx,edi
call    oglmdi2_vs2019.13F134230
xor     ecx,ecx
mov     qword ptr ds:[rbx+8],rax
call    oglmdi2_vs2019.13F133148
cmp     qword ptr ds:[rbx+8],0
je      oglmdi2_vs2019.13F13B58C
lock or dword ptr ds:[rbx+14],40
jmp     oglmdi2_vs2019.13F13B5A1
lock or dword ptr ds:[rbx+14],400
lea     rax,qword ptr ds:[rbx+1C]
mov     edi,2
mov     qword ptr ds:[rbx+8],rax
mov     dword ptr ds:[rbx+20],edi
mov     rax,qword ptr ds:[rbx+8]
and     dword ptr ds:[rbx+10],0
mov     qword ptr ds:[rbx],rax
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
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
nop     word ptr ds:[rax+rax]
sub     rsp,8
stmxcsr dword ptr ss:[rsp]
mov     eax,dword ptr ss:[rsp]
add     rsp,8
ret     
mov     dword ptr ss:[rsp+8],ecx
ldmxcsr dword ptr ss:[rsp+8]
ret     
stmxcsr dword ptr ss:[rsp+8]
mov     ecx,FFFFFFC0
and     dword ptr ss:[rsp+8],ecx
ldmxcsr dword ptr ss:[rsp+8]
ret     
ucomisd xmm0,qword ptr ds:[13F146FD0]
jae     oglmdi2_vs2019.13F13B61C
ucomisd xmm0,qword ptr ds:[13F146FD8]
jbe     oglmdi2_vs2019.13F13B61C
cvtsd2si rcx,xmm0
cvtsi2sd xmm0,rcx
ret     
int3    
int3    
int3    
sub     rsp,48
and     dword ptr ss:[rsp+30],0
mov     rax,qword ptr ss:[rsp+78]
mov     qword ptr ss:[rsp+28],rax
mov     rax,qword ptr ss:[rsp+70]
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F13B648
add     rsp,48
ret     
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+10],rbx
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
mov     qword ptr ds:[rax+8],rcx
push    rbp
mov     rbp,rsp
sub     rsp,20
mov     rbx,rdx
mov     esi,r9d
xor     edx,edx
mov     edi,C000000D
mov     dword ptr ds:[rcx+4],edx
mov     rax,qword ptr ss:[rbp+10]
mov     dword ptr ds:[rax+8],edx
mov     rax,qword ptr ss:[rbp+10]
mov     dword ptr ds:[rax+C],edx
test    r8b,10
je      oglmdi2_vs2019.13F13B694
mov     rax,qword ptr ss:[rbp+10]
mov     edi,C000008F
or      dword ptr ds:[rax+4],1
test    r8b,2
je      oglmdi2_vs2019.13F13B6A7
mov     rax,qword ptr ss:[rbp+10]
mov     edi,C0000093
or      dword ptr ds:[rax+4],2
test    r8b,1
je      oglmdi2_vs2019.13F13B6BA
mov     rax,qword ptr ss:[rbp+10]
mov     edi,C0000091
or      dword ptr ds:[rax+4],4
test    r8b,4
je      oglmdi2_vs2019.13F13B6CD
mov     rax,qword ptr ss:[rbp+10]
mov     edi,C000008E
or      dword ptr ds:[rax+4],8
test    r8b,8
je      oglmdi2_vs2019.13F13B6E0
mov     rax,qword ptr ss:[rbp+10]
mov     edi,C0000090
or      dword ptr ds:[rax+4],10
mov     rcx,qword ptr ss:[rbp+10]
mov     rax,qword ptr ds:[rbx]
shr     rax,7
shl     eax,4
not     eax
xor     eax,dword ptr ds:[rcx+8]
and     eax,10
xor     dword ptr ds:[rcx+8],eax
mov     rcx,qword ptr ss:[rbp+10]
mov     rax,qword ptr ds:[rbx]
shr     rax,9
shl     eax,3
not     eax
xor     eax,dword ptr ds:[rcx+8]
and     eax,8
xor     dword ptr ds:[rcx+8],eax
mov     rcx,qword ptr ss:[rbp+10]
mov     rax,qword ptr ds:[rbx]
shr     rax,A
shl     eax,2
not     eax
xor     eax,dword ptr ds:[rcx+8]
and     eax,4
xor     dword ptr ds:[rcx+8],eax
mov     rcx,qword ptr ss:[rbp+10]
mov     rax,qword ptr ds:[rbx]
shr     rax,B
add     eax,eax
not     eax
xor     eax,dword ptr ds:[rcx+8]
and     eax,2
xor     dword ptr ds:[rcx+8],eax
mov     eax,dword ptr ds:[rbx]
mov     rcx,qword ptr ss:[rbp+10]
shr     rax,C
not     eax
xor     eax,dword ptr ds:[rcx+8]
and     eax,1
xor     dword ptr ds:[rcx+8],eax
call    oglmdi2_vs2019.13F135518
mov     rdx,rax
test    al,1
je      oglmdi2_vs2019.13F13B76C
mov     rcx,qword ptr ss:[rbp+10]
or      dword ptr ds:[rcx+C],10
test    dl,4
je      oglmdi2_vs2019.13F13B779
mov     rcx,qword ptr ss:[rbp+10]
or      dword ptr ds:[rcx+C],8
test    dl,8
je      oglmdi2_vs2019.13F13B786
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax+C],4
test    dl,10
je      oglmdi2_vs2019.13F13B793
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax+C],2
test    dl,20
je      oglmdi2_vs2019.13F13B7A0
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax+C],1
mov     eax,dword ptr ds:[rbx]
mov     ecx,6000
and     rax,rcx
je      oglmdi2_vs2019.13F13B7EA
cmp     rax,2000
je      oglmdi2_vs2019.13F13B7DA
cmp     rax,4000
je      oglmdi2_vs2019.13F13B7CA
cmp     rax,rcx
jne     oglmdi2_vs2019.13F13B7F1
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax],3
jmp     oglmdi2_vs2019.13F13B7F1
mov     rax,qword ptr ss:[rbp+10]
and     dword ptr ds:[rax],FFFFFFFE
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax],2
jmp     oglmdi2_vs2019.13F13B7F1
mov     rax,qword ptr ss:[rbp+10]
and     dword ptr ds:[rax],FFFFFFFD
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax],1
jmp     oglmdi2_vs2019.13F13B7F1
mov     rax,qword ptr ss:[rbp+10]
and     dword ptr ds:[rax],FFFFFFFC
mov     rax,qword ptr ss:[rbp+10]
and     esi,FFF
shl     esi,5
and     dword ptr ds:[rax],FFFE001F
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax],esi
mov     rax,qword ptr ss:[rbp+10]
mov     rsi,qword ptr ss:[rbp+38]
or      dword ptr ds:[rax+20],1
cmp     dword ptr ss:[rbp+40],0
je      oglmdi2_vs2019.13F13B84F
mov     rax,qword ptr ss:[rbp+10]
mov     edx,FFFFFFE1
and     dword ptr ds:[rax+20],edx
mov     rax,qword ptr ss:[rbp+30]
mov     ecx,dword ptr ds:[rax]
mov     rax,qword ptr ss:[rbp+10]
mov     dword ptr ds:[rax+10],ecx
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax+60],1
mov     rax,qword ptr ss:[rbp+10]
and     dword ptr ds:[rax+60],edx
mov     rax,qword ptr ss:[rbp+10]
mov     ecx,dword ptr ds:[rsi]
mov     dword ptr ds:[rax+50],ecx
jmp     oglmdi2_vs2019.13F13B897
mov     rcx,qword ptr ss:[rbp+10]
mov     r8d,FFFFFFE3
mov     eax,dword ptr ds:[rcx+20]
and     eax,r8d
or      eax,2
mov     dword ptr ds:[rcx+20],eax
mov     rax,qword ptr ss:[rbp+30]
mov     rcx,qword ptr ds:[rax]
mov     rax,qword ptr ss:[rbp+10]
mov     qword ptr ds:[rax+10],rcx
mov     rax,qword ptr ss:[rbp+10]
or      dword ptr ds:[rax+60],1
mov     rdx,qword ptr ss:[rbp+10]
mov     eax,dword ptr ds:[rdx+60]
and     eax,r8d
or      eax,2
mov     dword ptr ds:[rdx+60],eax
mov     rax,qword ptr ss:[rbp+10]
mov     rdx,qword ptr ds:[rsi]
mov     qword ptr ds:[rax+50],rdx
call    oglmdi2_vs2019.13F13545C
xor     edx,edx
lea     r9,qword ptr ss:[rbp+10]
mov     ecx,edi
lea     r8d,dword ptr ds:[rdx+1]
call    qword ptr ds:[<&RaiseException>]
mov     rcx,qword ptr ss:[rbp+10]
mov     eax,dword ptr ds:[rcx+8]
test    al,10
je      oglmdi2_vs2019.13F13B8C1
btr     qword ptr ds:[rbx],7
mov     eax,dword ptr ds:[rcx+8]
test    al,8
je      oglmdi2_vs2019.13F13B8CD
btr     qword ptr ds:[rbx],9
mov     eax,dword ptr ds:[rcx+8]
test    al,4
je      oglmdi2_vs2019.13F13B8D9
btr     qword ptr ds:[rbx],A
mov     eax,dword ptr ds:[rcx+8]
test    al,2
je      oglmdi2_vs2019.13F13B8E5
btr     qword ptr ds:[rbx],B
mov     eax,dword ptr ds:[rcx+8]
test    al,1
je      oglmdi2_vs2019.13F13B8EE
btr     qword ptr ds:[rbx],C
mov     eax,dword ptr ds:[rcx]
and     eax,3
je      oglmdi2_vs2019.13F13B925
sub     eax,1
je      oglmdi2_vs2019.13F13B919
sub     eax,1
je      oglmdi2_vs2019.13F13B90D
cmp     eax,1
jne     oglmdi2_vs2019.13F13B92C
or      qword ptr ds:[rbx],6000
jmp     oglmdi2_vs2019.13F13B92C
btr     qword ptr ds:[rbx],D
bts     qword ptr ds:[rbx],E
jmp     oglmdi2_vs2019.13F13B92C
btr     qword ptr ds:[rbx],E
bts     qword ptr ds:[rbx],D
jmp     oglmdi2_vs2019.13F13B92C
and     qword ptr ds:[rbx],FFFFFFFFFFFF9FFF
cmp     dword ptr ss:[rbp+40],0
je      oglmdi2_vs2019.13F13B939
mov     eax,dword ptr ds:[rcx+50]
mov     dword ptr ds:[rsi],eax
jmp     oglmdi2_vs2019.13F13B940
mov     rax,qword ptr ds:[rcx+50]
mov     qword ptr ds:[rsi],rax
mov     rbx,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
mov     rdi,qword ptr ss:[rsp+48]
add     rsp,20
pop     rbp
ret     
int3    
int3    
int3    
sub     rsp,48
mov     rax,qword ptr ss:[rsp+78]
mov     dword ptr ss:[rsp+30],1
mov     qword ptr ss:[rsp+28],rax
mov     rax,qword ptr ss:[rsp+70]
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F13B648
add     rsp,48
ret     
int3    
int3    
sub     rsp,28
cmp     ecx,1
je      oglmdi2_vs2019.13F13B9A2
lea     eax,dword ptr ds:[rcx-2]
cmp     eax,1
ja      oglmdi2_vs2019.13F13B9AD
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
jmp     oglmdi2_vs2019.13F13B9AD
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],21
add     rsp,28
ret     
int3    
int3    
push    rbx
sub     rsp,40
movsxd  rbx,ecx
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F1301AC
lea     eax,dword ptr ds:[rbx+1]
cmp     eax,100
ja      oglmdi2_vs2019.13F13B9E4
mov     rax,qword ptr ss:[rsp+28]
mov     rcx,qword ptr ds:[rax]
movzx   eax,word ptr ds:[rcx+rbx*2]
and     eax,8000
jmp     oglmdi2_vs2019.13F13B9E6
xor     eax,eax
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F13B9F9
mov     rcx,qword ptr ss:[rsp+20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
add     rsp,40
pop     rbx
ret     
int3    
push    rbx
sub     rsp,30
mov     rbx,rcx
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F13E414
cmp     rax,4
ja      oglmdi2_vs2019.13F13BA33
mov     edx,dword ptr ss:[rsp+20]
mov     ecx,FFFD
cmp     edx,FFFF
cmova   edx,ecx
test    rbx,rbx
je      oglmdi2_vs2019.13F13BA33
mov     word ptr ds:[rbx],dx
add     rsp,30
pop     rbx
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rbp
push    rdi
push    r12
push    r13
push    r14
push    r15
sub     rsp,20
mov     rdi,qword ptr ds:[rdx]
xor     r13d,r13d
mov     r12,r9
mov     rbp,r8
mov     r14,rdx
mov     r15,rcx
test    rcx,rcx
je      oglmdi2_vs2019.13F13BB5C
mov     rbx,rcx
test    r8,r8
je      oglmdi2_vs2019.13F13BB1B
cmp     byte ptr ds:[rdi],r13b
jne     oglmdi2_vs2019.13F13BA87
mov     r8d,1
jmp     oglmdi2_vs2019.13F13BAA4
cmp     byte ptr ds:[rdi+1],r13b
jne     oglmdi2_vs2019.13F13BA95
mov     r8d,2
jmp     oglmdi2_vs2019.13F13BAA4
mov     al,byte ptr ds:[rdi+2]
neg     al
sbb     r8,r8
neg     r8
add     r8,3
mov     r9,r12
lea     rcx,qword ptr ss:[rsp+50]
mov     rdx,rdi
call    oglmdi2_vs2019.13F13E414
mov     rdx,rax
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13BB32
test    rax,rax
je      oglmdi2_vs2019.13F13BB29
mov     ecx,dword ptr ss:[rsp+50]
cmp     ecx,FFFF
jbe     oglmdi2_vs2019.13F13BB07
cmp     rbp,1
jbe     oglmdi2_vs2019.13F13BB1B
add     ecx,FFFF0000
mov     r8d,D800
mov     eax,ecx
mov     dword ptr ss:[rsp+50],ecx
shr     eax,A
dec     rbp
or      ax,r8w
mov     word ptr ds:[rbx],ax
mov     eax,3FF
and     cx,ax
add     rbx,2
mov     eax,DC00
or      cx,ax
mov     word ptr ds:[rbx],cx
add     rdi,rdx
add     rbx,2
sub     rbp,1
jne     oglmdi2_vs2019.13F13BA7A
sub     rbx,r15
mov     qword ptr ds:[r14],rdi
sar     rbx,1
mov     rax,rbx
jmp     oglmdi2_vs2019.13F13BB44
mov     rdi,r13
mov     word ptr ds:[rbx],r13w
jmp     oglmdi2_vs2019.13F13BB1B
mov     qword ptr ds:[r14],rdi
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],2A
or      rax,FFFFFFFFFFFFFFFF
mov     rbx,qword ptr ss:[rsp+58]
mov     rbp,qword ptr ss:[rsp+60]
add     rsp,20
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
ret     
mov     rbx,r13
cmp     byte ptr ds:[rdi],r13b
jne     oglmdi2_vs2019.13F13BB6C
mov     r8d,1
jmp     oglmdi2_vs2019.13F13BB89
cmp     byte ptr ds:[rdi+1],r13b
jne     oglmdi2_vs2019.13F13BB7A
mov     r8d,2
jmp     oglmdi2_vs2019.13F13BB89
mov     al,byte ptr ds:[rdi+2]
neg     al
sbb     r8,r8
neg     r8
add     r8,3
mov     r9,r12
mov     rdx,rdi
xor     ecx,ecx
call    oglmdi2_vs2019.13F13E414
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13BB35
test    rax,rax
je      oglmdi2_vs2019.13F13BB24
cmp     rax,4
jne     oglmdi2_vs2019.13F13BBAA
inc     rbx
add     rdi,rax
inc     rbx
jmp     oglmdi2_vs2019.13F13BB5F
int3    
int3    
sub     rsp,28
test    rcx,rcx
jne     oglmdi2_vs2019.13F13BBCB
and     qword ptr ds:[r8],0
mov     eax,1
jmp     oglmdi2_vs2019.13F13BC62
test    edx,edx
jne     oglmdi2_vs2019.13F13BBD3
mov     byte ptr ds:[rcx],dl
jmp     oglmdi2_vs2019.13F13BBBD
test    edx,FFFFFF80
jne     oglmdi2_vs2019.13F13BBDF
mov     byte ptr ds:[rcx],dl
jmp     oglmdi2_vs2019.13F13BBC1
test    edx,FFFFF800
jne     oglmdi2_vs2019.13F13BBF2
mov     r9d,1
mov     r10b,C0
jmp     oglmdi2_vs2019.13F13BC2B
test    edx,FFFF0000
jne     oglmdi2_vs2019.13F13BC12
lea     eax,dword ptr ds:[rdx-D800]
cmp     eax,7FF
jbe     oglmdi2_vs2019.13F13BC4F
mov     r9d,2
mov     r10b,E0
jmp     oglmdi2_vs2019.13F13BC2B
test    edx,FFE00000
jne     oglmdi2_vs2019.13F13BC4F
cmp     edx,10FFFF
ja      oglmdi2_vs2019.13F13BC4F
mov     r9d,3
mov     r10b,F0
mov     r11,r9
mov     al,dl
shr     edx,6
and     al,3F
or      al,80
mov     byte ptr ds:[r11+rcx],al
sub     r11,1
jne     oglmdi2_vs2019.13F13BC2E
or      dl,r10b
lea     rax,qword ptr ds:[r9+1]
mov     byte ptr ds:[rcx],dl
and     qword ptr ds:[r8],r11
jmp     oglmdi2_vs2019.13F13BC62
and     qword ptr ds:[r8],0
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],2A
or      rax,FFFFFFFFFFFFFFFF
add     rsp,28
ret     
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     r11d,r8d
mov     r10,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F13BC95
call    oglmdi2_vs2019.13F1330B0
mov     ebx,16
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     eax,ebx
jmp     oglmdi2_vs2019.13F13BD3F
test    rdx,rdx
je      oglmdi2_vs2019.13F13BC7D
xor     eax,eax
mov     byte ptr ds:[rcx],0
test    r11d,r11d
cmovg   eax,r11d
inc     eax
cdqe    
cmp     rdx,rax
ja      oglmdi2_vs2019.13F13BCBB
call    oglmdi2_vs2019.13F1330B0
mov     ebx,22
jmp     oglmdi2_vs2019.13F13BC87
test    r9,r9
je      oglmdi2_vs2019.13F13BC7D
mov     rbx,qword ptr ds:[r9+8]
lea     r8,qword ptr ds:[rcx+1]
mov     byte ptr ds:[rcx],30
jmp     oglmdi2_vs2019.13F13BCEE
movzx   ecx,byte ptr ds:[rbx]
lea     rax,qword ptr ds:[rbx+1]
test    cl,cl
mov     edx,30
cmovne  edx,ecx
cmove   rax,rbx
mov     byte ptr ds:[r8],dl
mov     rbx,rax
inc     r8
dec     r11d
test    r11d,r11d
jg      oglmdi2_vs2019.13F13BCCD
mov     byte ptr ds:[r8],0
js      oglmdi2_vs2019.13F13BD13
cmp     byte ptr ds:[rbx],35
jl      oglmdi2_vs2019.13F13BD13
jmp     oglmdi2_vs2019.13F13BD04
mov     byte ptr ds:[r8],30
dec     r8
mov     al,byte ptr ds:[r8]
cmp     al,39
je      oglmdi2_vs2019.13F13BD00
inc     al
mov     byte ptr ds:[r8],al
cmp     byte ptr ds:[r10],31
jne     oglmdi2_vs2019.13F13BD1F
inc     dword ptr ds:[r9+4]
jmp     oglmdi2_vs2019.13F13BD3D
or      r8,FFFFFFFFFFFFFFFF
inc     r8
cmp     byte ptr ds:[r10+r8+1],0
jne     oglmdi2_vs2019.13F13BD23
inc     r8
lea     rdx,qword ptr ds:[r10+1]
mov     rcx,r10
call    oglmdi2_vs2019.13F12DE70
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+10],rdx
push    rbx
push    rbp
push    rsi
push    rdi
push    r12
push    r14
push    r15
sub     rsp,220
mov     r10d,dword ptr ds:[rcx]
mov     r14,rdx
mov     rsi,rcx
test    r10d,r10d
je      oglmdi2_vs2019.13F13C165
mov     edi,dword ptr ds:[rdx]
test    edi,edi
je      oglmdi2_vs2019.13F13C165
dec     r10d
lea     eax,dword ptr ds:[rdi-1]
test    eax,eax
jne     oglmdi2_vs2019.13F13BE72
mov     r12d,dword ptr ds:[rdx+4]
xor     ebp,ebp
cmp     r12d,1
jne     oglmdi2_vs2019.13F13BDC2
mov     ebx,dword ptr ds:[rcx+4]
lea     r8,qword ptr ss:[rsp+44]
add     rcx,4
mov     dword ptr ds:[rsi],ebp
xor     r9d,r9d
mov     dword ptr ss:[rsp+40],ebp
mov     edx,1CC
call    oglmdi2_vs2019.13F13D3B0
mov     eax,ebx
jmp     oglmdi2_vs2019.13F13C167
test    r10d,r10d
jne     oglmdi2_vs2019.13F13BDFD
mov     ebx,dword ptr ds:[rcx+4]
lea     r8,qword ptr ss:[rsp+44]
mov     dword ptr ds:[rcx],ebp
xor     r9d,r9d
add     rcx,4
mov     dword ptr ss:[rsp+40],ebp
mov     edx,1CC
call    oglmdi2_vs2019.13F13D3B0
xor     edx,edx
mov     eax,ebx
div     r12d
test    edx,edx
mov     dword ptr ds:[rsi+4],edx
setne   bpl
mov     dword ptr ds:[rsi],ebp
jmp     oglmdi2_vs2019.13F13C167
mov     r15d,FFFFFFFF
mov     rdi,rbp
mov     r14,rbp
cmp     r10d,r15d
je      oglmdi2_vs2019.13F13BE36
mov     rcx,r12
mov     eax,dword ptr ds:[rsi+r10*4+4]
xor     edx,edx
shl     r14,20
add     r10d,r15d
or      rax,r14
shl     rdi,20
div     rcx
mov     eax,eax
mov     r14,rdx
add     rdi,rax
cmp     r10d,r15d
jne     oglmdi2_vs2019.13F13BE11
xor     r9d,r9d
mov     dword ptr ss:[rsp+40],ebp
lea     r8,qword ptr ss:[rsp+44]
mov     dword ptr ds:[rsi],ebp
mov     edx,1CC
lea     rcx,qword ptr ds:[rsi+4]
call    oglmdi2_vs2019.13F13D3B0
mov     rcx,r14
mov     dword ptr ds:[rsi+4],r14d
shr     rcx,20
mov     rax,rdi
test    ecx,ecx
mov     dword ptr ds:[rsi+8],ecx
setne   bpl
inc     ebp
mov     dword ptr ds:[rsi],ebp
jmp     oglmdi2_vs2019.13F13C167
cmp     eax,r10d
ja      oglmdi2_vs2019.13F13C165
mov     r8d,r10d
movsxd  rdx,r10d
sub     r8d,eax
mov     r9d,r10d
movsxd  rbx,r8d
cmp     rdx,rbx
jl      oglmdi2_vs2019.13F13BED8
add     rcx,4
lea     rax,qword ptr ds:[rbx*4]
mov     r11,r14
sub     r11,rax
sub     r11,rsi
lea     rcx,qword ptr ds:[rcx+rdx*4]
mov     eax,dword ptr ds:[rcx]
cmp     dword ptr ds:[r11+rcx],eax
jne     oglmdi2_vs2019.13F13BEC1
dec     r9d
dec     rdx
sub     rcx,4
cmp     rdx,rbx
jge     oglmdi2_vs2019.13F13BEA8
jmp     oglmdi2_vs2019.13F13BED8
mov     eax,r9d
sub     eax,r8d
movsxd  rdx,eax
movsxd  rax,r9d
mov     ecx,dword ptr ds:[rsi+rax*4+4]
cmp     dword ptr ds:[r14+rdx*4+4],ecx
jae     oglmdi2_vs2019.13F13BEDB
inc     r8d
test    r8d,r8d
je      oglmdi2_vs2019.13F13C165
lea     eax,dword ptr ds:[rdi-1]
mov     ebx,20
mov     r9d,dword ptr ds:[r14+rax*4+4]
lea     eax,dword ptr ds:[rdi-2]
mov     ebp,dword ptr ds:[r14+rax*4+4]
bsr     eax,r9d
mov     dword ptr ss:[rsp+260],ebp
je      oglmdi2_vs2019.13F13BF11
mov     r11d,1F
sub     r11d,eax
jmp     oglmdi2_vs2019.13F13BF14
mov     r11d,ebx
sub     ebx,r11d
mov     dword ptr ss:[rsp+270],r11d
mov     dword ptr ss:[rsp+20],ebx
test    r11d,r11d
je      oglmdi2_vs2019.13F13BF5F
mov     eax,r9d
mov     edx,ebp
mov     ecx,ebx
shr     edx,cl
mov     ecx,r11d
shl     eax,cl
mov     r9d,edx
shl     ebp,cl
or      r9d,eax
mov     dword ptr ss:[rsp+260],ebp
cmp     edi,2
jbe     oglmdi2_vs2019.13F13BF5F
lea     eax,dword ptr ds:[rdi-3]
mov     ecx,ebx
mov     eax,dword ptr ds:[r14+rax*4+4]
shr     eax,cl
or      ebp,eax
mov     dword ptr ss:[rsp+260],ebp
xor     ebp,ebp
lea     r14d,dword ptr ds:[r8-1]
mov     r12d,ebp
test    r14d,r14d
js      oglmdi2_vs2019.13F13C130
mov     eax,ebx
mov     r15d,FFFFFFFF
mov     ebx,r9d
mov     qword ptr ss:[rsp+218],r13
lea     r13d,dword ptr ds:[r14+rdi]
mov     qword ptr ss:[rsp+38],rbx
mov     qword ptr ss:[rsp+30],rax
cmp     r13d,r10d
ja      oglmdi2_vs2019.13F13BF9E
mov     edx,dword ptr ds:[rsi+r13*4+4]
jmp     oglmdi2_vs2019.13F13BFA0
mov     edx,ebp
lea     eax,dword ptr ds:[r13-1]
mov     dword ptr ss:[rsp+278],edx
mov     ecx,dword ptr ds:[rsi+rax*4+4]
lea     eax,dword ptr ds:[r13-2]
mov     r11d,dword ptr ds:[rsi+rax*4+4]
mov     qword ptr ss:[rsp+28],rcx
mov     dword ptr ss:[rsp+2C],edx
mov     edx,dword ptr ss:[rsp+270]
test    edx,edx
je      oglmdi2_vs2019.13F13C000
mov     rcx,qword ptr ss:[rsp+30]
mov     r8d,r11d
mov     rax,qword ptr ss:[rsp+28]
shr     r8,cl
mov     ecx,edx
shl     rax,cl
or      r8,rax
shl     r11d,cl
cmp     r13d,3
jb      oglmdi2_vs2019.13F13C005
mov     ecx,dword ptr ss:[rsp+20]
lea     eax,dword ptr ds:[r13-3]
mov     eax,dword ptr ds:[rsi+rax*4+4]
shr     eax,cl
or      r11d,eax
jmp     oglmdi2_vs2019.13F13C005
mov     r8,qword ptr ss:[rsp+28]
xor     edx,edx
mov     rax,r8
div     rbx
mov     r8d,edx
mov     r9,rax
cmp     rax,r15
jbe     oglmdi2_vs2019.13F13C02F
movabs  rax,FFFFFFFF00000001
add     rax,r9
mov     r9,r15
imul    rax,rbx
add     r8,rax
cmp     r8,r15
ja      oglmdi2_vs2019.13F13C05E
mov     edx,dword ptr ss:[rsp+260]
mov     eax,edx
imul    rax,r9
mov     rcx,r8
shl     rcx,20
or      rcx,r11
cmp     rax,rcx
jbe     oglmdi2_vs2019.13F13C05E
dec     r9
sub     rax,rdx
add     r8,rbx
cmp     r8,r15
jbe     oglmdi2_vs2019.13F13C041
test    r9,r9
je      oglmdi2_vs2019.13F13C111
mov     r10,rbp
mov     r11d,ebp
test    edi,edi
je      oglmdi2_vs2019.13F13C0BF
mov     rbx,qword ptr ss:[rsp+268]
add     rbx,4
nop     dword ptr ds:[rax]
mov     eax,dword ptr ds:[rbx]
lea     rbx,qword ptr ds:[rbx+4]
imul    rax,r9
add     r10,rax
lea     eax,dword ptr ds:[r11+r14]
mov     r8d,r10d
mov     ecx,eax
shr     r10,20
mov     eax,dword ptr ds:[rsi+rax*4+4]
mov     rdx,r10
inc     r10
cmp     eax,r8d
cmovae  r10,rdx
sub     eax,r8d
inc     r11d
mov     dword ptr ds:[rsi+rcx*4+4],eax
cmp     r11d,edi
jb      oglmdi2_vs2019.13F13C080
mov     rbx,qword ptr ss:[rsp+38]
mov     eax,dword ptr ss:[rsp+278]
cmp     rax,r10
jae     oglmdi2_vs2019.13F13C10D
mov     r10d,ebp
test    edi,edi
je      oglmdi2_vs2019.13F13C10A
mov     r11,qword ptr ss:[rsp+268]
mov     r8,rbp
add     r11,4
lea     eax,dword ptr ds:[r10+r14]
inc     r10d
mov     ecx,dword ptr ds:[rsi+rax*4+4]
lea     rdx,qword ptr ds:[rsi+rax*4]
mov     eax,dword ptr ds:[r11]
lea     r11,qword ptr ds:[r11+4]
add     r8,rax
add     r8,rcx
mov     dword ptr ds:[rdx+4],r8d
shr     r8,20
cmp     r10d,edi
jb      oglmdi2_vs2019.13F13C0E1
dec     r9
lea     r10d,dword ptr ds:[r13-1]
shl     r12,20
dec     r13d
mov     eax,r9d
add     r12,rax
sub     r14d,1
jns     oglmdi2_vs2019.13F13BF92
mov     r13,qword ptr ss:[rsp+218]
lea     edx,dword ptr ds:[r10+1]
mov     ecx,edx
cmp     edx,dword ptr ds:[rsi]
jae     oglmdi2_vs2019.13F13C14C
nop     word ptr ds:[rax+rax]
mov     eax,ecx
inc     ecx
mov     dword ptr ds:[rsi+rax*4+4],ebp
cmp     ecx,dword ptr ds:[rsi]
jb      oglmdi2_vs2019.13F13C140
mov     dword ptr ds:[rsi],edx
test    edx,edx
je      oglmdi2_vs2019.13F13C160
dec     edx
cmp     dword ptr ds:[rsi+rdx*4+4],ebp
jne     oglmdi2_vs2019.13F13C160
mov     dword ptr ds:[rsi],edx
test    edx,edx
jne     oglmdi2_vs2019.13F13C152
mov     rax,r12
jmp     oglmdi2_vs2019.13F13C167
xor     eax,eax
add     rsp,220
pop     r15
pop     r14
pop     r12
pop     rdi
pop     rsi
pop     rbp
pop     rbx
ret     
int3    
int3    
int3    
push    rbp
push    rbx
push    rsi
push    rdi
push    r12
push    r13
push    r14
push    r15
lea     rbp,qword ptr ss:[rsp-6D8]
sub     rsp,7D8
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rbp+6C0],rax
mov     qword ptr ss:[rsp+38],rcx
mov     rsi,r9
lea     rcx,qword ptr ss:[rsp+58]
mov     qword ptr ss:[rsp+68],r9
mov     r14,r8
mov     qword ptr ss:[rsp+78],r8
mov     edi,edx
call    oglmdi2_vs2019.13F13E5F0
mov     eax,dword ptr ss:[rsp+58]
xor     r12d,r12d
and     eax,1F
cmp     al,1F
jne     oglmdi2_vs2019.13F13C1DF
mov     byte ptr ss:[rsp+60],r12b
jmp     oglmdi2_vs2019.13F13C1EE
lea     rcx,qword ptr ss:[rsp+58]
call    oglmdi2_vs2019.13F13E65C
mov     byte ptr ss:[rsp+60],1
mov     rax,qword ptr ss:[rsp+38]
mov     ebx,20
test    rax,rax
mov     qword ptr ds:[r14+8],rsi
mov     ecx,ebx
mov     r9d,7FF
movabs  r10,FFFFFFFFFFFFF
lea     edx,dword ptr ds:[rbx+D]
cmovs   ecx,edx
mov     rdx,rax
shr     rdx,34
mov     dword ptr ds:[r14],ecx
and     rdx,r9
jne     oglmdi2_vs2019.13F13C23B
test    r10,rax
jne     oglmdi2_vs2019.13F13C23B
mov     dword ptr ds:[r14+4],r12d
lea     r8,qword ptr ds:[13F1479BC]
jmp     oglmdi2_vs2019.13F13D37A
cmp     rdx,r9
je      oglmdi2_vs2019.13F13C245
mov     ecx,r12d
jmp     oglmdi2_vs2019.13F13C286
mov     rcx,rax
and     rcx,r10
jne     oglmdi2_vs2019.13F13C254
mov     ecx,1
jmp     oglmdi2_vs2019.13F13C27E
test    rax,rax
jns     oglmdi2_vs2019.13F13C26F
movabs  rdx,8000000000000
cmp     rcx,rdx
jne     oglmdi2_vs2019.13F13C26F
mov     ecx,4
jmp     oglmdi2_vs2019.13F13C27E
mov     rcx,rax
shr     rcx,33
not     ecx
and     ecx,1
or      ecx,2
mov     dword ptr ds:[r14+4],1
sub     ecx,1
je      oglmdi2_vs2019.13F13D38F
sub     ecx,1
je      oglmdi2_vs2019.13F13D373
sub     ecx,1
je      oglmdi2_vs2019.13F13D36A
cmp     ecx,1
je      oglmdi2_vs2019.13F13D361
movabs  rcx,7FFFFFFFFFFFFFFF
mov     esi,2
and     rax,rcx
mov     qword ptr ss:[rsp+38],rax
inc     edi
movsd   xmm0,qword ptr ss:[rsp+38]
mov     dword ptr ss:[rsp+50],edi
movsd   qword ptr ss:[rsp+48],xmm0
mov     rdx,qword ptr ss:[rsp+48]
mov     r8,rdx
shr     r8,34
mov     rcx,r8
and     rcx,r9
mov     rax,rcx
neg     rax
movabs  rax,10000000000000
sbb     rdi,rdi
and     rdx,r10
and     rdi,rax
add     rdi,rdx
neg     rcx
sbb     eax,eax
and     r8d,r9d
lea     r15d,dword ptr ds:[rsi+rax]
add     r15d,r8d
call    oglmdi2_vs2019.13F13E770
call    oglmdi2_vs2019.13F13E6AC
cvttsd2si ecx,xmm0
mov     dword ptr ss:[rbp-7C],edi
lea     eax,dword ptr ds:[rcx-7FFFFFFF]
and     eax,FFFFFFFE
neg     eax
sbb     r13d,r13d
shr     rdi,20
and     r13d,ecx
mov     dword ptr ss:[rbp-78],edi
mov     eax,edi
mov     dword ptr ss:[rsp+40],r13d
neg     eax
sbb     edx,edx
neg     edx
inc     edx
mov     dword ptr ss:[rbp-80],edx
cmp     r15d,434
jb      oglmdi2_vs2019.13F13C5DD
xor     eax,eax
mov     dword ptr ss:[rbp+328],100000
mov     dword ptr ss:[rbp+324],eax
mov     dword ptr ss:[rbp+320],esi
test    edi,edi
je      oglmdi2_vs2019.13F13C4BA
mov     r8d,r12d
mov     ecx,r8d
mov     eax,dword ptr ss:[rbp+rcx*4-7C]
cmp     dword ptr ss:[rbp+rcx*4+324],eax
jne     oglmdi2_vs2019.13F13C4BA
inc     r8d
cmp     r8d,esi
jne     oglmdi2_vs2019.13F13C37B
lea     r11d,dword ptr ds:[r15-432]
mov     dword ptr ss:[rsp+38],r12d
mov     r8d,r11d
lea     eax,dword ptr ds:[rdx-1]
and     r11d,1F
shr     r8d,5
mov     esi,ebx
mov     edi,1
sub     esi,r11d
mov     ecx,esi
shl     rdi,cl
dec     edi
mov     ecx,eax
bsr     eax,dword ptr ss:[rbp+rax*4-7C]
mov     r15d,edi
not     r15d
je      oglmdi2_vs2019.13F13C3D5
inc     eax
jmp     oglmdi2_vs2019.13F13C3D8
mov     eax,r12d
sub     ebx,eax
lea     eax,dword ptr ds:[rdx+r8]
cmp     eax,73
jne     oglmdi2_vs2019.13F13C3EA
mov     cl,1
cmp     r11d,ebx
ja      oglmdi2_vs2019.13F13C3ED
mov     cl,r12b
or      r12d,FFFFFFFF
cmp     eax,73
ja      oglmdi2_vs2019.13F13C486
test    cl,cl
jne     oglmdi2_vs2019.13F13C486
mov     r14d,72
cmp     eax,r14d
cmovb   r14d,eax
mov     r10d,r14d
cmp     r14d,r12d
je      oglmdi2_vs2019.13F13C466
cmp     r10d,r8d
jb      oglmdi2_vs2019.13F13C466
mov     eax,r10d
sub     eax,r8d
lea     ecx,dword ptr ds:[rax-1]
cmp     eax,edx
jae     oglmdi2_vs2019.13F13C430
mov     r9d,dword ptr ss:[rbp+rax*4-7C]
jmp     oglmdi2_vs2019.13F13C433
xor     r9d,r9d
cmp     ecx,edx
jae     oglmdi2_vs2019.13F13C43D
mov     edx,dword ptr ss:[rbp+rcx*4-7C]
jmp     oglmdi2_vs2019.13F13C43F
xor     edx,edx
and     edx,r15d
mov     eax,r10d
mov     ecx,esi
and     r9d,edi
shr     edx,cl
add     r10d,r12d
mov     ecx,r11d
shl     r9d,cl
or      edx,r9d
mov     dword ptr ss:[rbp+rax*4-7C],edx
cmp     r10d,r12d
je      oglmdi2_vs2019.13F13C466
mov     edx,dword ptr ss:[rbp-80]
jmp     oglmdi2_vs2019.13F13C417
xor     ecx,ecx
test    r8d,r8d
je      oglmdi2_vs2019.13F13C479
and     dword ptr ss:[rbp+rcx*4-7C],0
inc     ecx
cmp     ecx,r8d
jne     oglmdi2_vs2019.13F13C46D
cmp     r11d,ebx
lea     eax,dword ptr ds:[r14+1]
cmova   r14d,eax
jmp     oglmdi2_vs2019.13F13C489
xor     r14d,r14d
and     dword ptr ss:[rbp+328],0
mov     r15d,1
mov     dword ptr ss:[rbp+150],r15d
mov     dword ptr ss:[rbp-80],r14d
mov     dword ptr ss:[rbp+320],1
mov     dword ptr ss:[rbp+154],4
jmp     oglmdi2_vs2019.13F13C7DC
lea     r11d,dword ptr ds:[r15-433]
mov     dword ptr ss:[rsp+38],r12d
mov     r8d,r11d
lea     eax,dword ptr ds:[rdx-1]
and     r11d,1F
shr     r8d,5
mov     esi,ebx
mov     edi,1
sub     esi,r11d
mov     ecx,esi
shl     rdi,cl
dec     edi
mov     ecx,eax
bsr     eax,dword ptr ss:[rbp+rax*4-7C]
mov     r15d,edi
not     r15d
je      oglmdi2_vs2019.13F13C4F8
inc     eax
jmp     oglmdi2_vs2019.13F13C4FB
mov     eax,r12d
sub     ebx,eax
lea     eax,dword ptr ds:[rdx+r8]
cmp     eax,73
jne     oglmdi2_vs2019.13F13C50D
mov     cl,1
cmp     r11d,ebx
ja      oglmdi2_vs2019.13F13C510
mov     cl,r12b
or      r12d,FFFFFFFF
cmp     eax,73
ja      oglmdi2_vs2019.13F13C5A9
test    cl,cl
jne     oglmdi2_vs2019.13F13C5A9
mov     r14d,72
cmp     eax,r14d
cmovb   r14d,eax
mov     r10d,r14d
cmp     r14d,r12d
je      oglmdi2_vs2019.13F13C589
cmp     r10d,r8d
jb      oglmdi2_vs2019.13F13C589
mov     eax,r10d
sub     eax,r8d
lea     ecx,dword ptr ds:[rax-1]
cmp     eax,edx
jae     oglmdi2_vs2019.13F13C553
mov     r9d,dword ptr ss:[rbp+rax*4-7C]
jmp     oglmdi2_vs2019.13F13C556
xor     r9d,r9d
cmp     ecx,edx
jae     oglmdi2_vs2019.13F13C560
mov     edx,dword ptr ss:[rbp+rcx*4-7C]
jmp     oglmdi2_vs2019.13F13C562
xor     edx,edx
and     edx,r15d
mov     eax,r10d
mov     ecx,esi
and     r9d,edi
shr     edx,cl
add     r10d,r12d
mov     ecx,r11d
shl     r9d,cl
or      edx,r9d
mov     dword ptr ss:[rbp+rax*4-7C],edx
cmp     r10d,r12d
je      oglmdi2_vs2019.13F13C589
mov     edx,dword ptr ss:[rbp-80]
jmp     oglmdi2_vs2019.13F13C53A
xor     ecx,ecx
test    r8d,r8d
je      oglmdi2_vs2019.13F13C59C
and     dword ptr ss:[rbp+rcx*4-7C],0
inc     ecx
cmp     ecx,r8d
jne     oglmdi2_vs2019.13F13C590
cmp     r11d,ebx
lea     eax,dword ptr ds:[r14+1]
cmova   r14d,eax
jmp     oglmdi2_vs2019.13F13C5AC
xor     r14d,r14d
and     dword ptr ss:[rbp+328],0
mov     r15d,1
mov     dword ptr ss:[rbp+150],r15d
mov     dword ptr ss:[rbp-80],r14d
mov     dword ptr ss:[rbp+320],1
mov     dword ptr ss:[rbp+154],2
jmp     oglmdi2_vs2019.13F13C7DC
cmp     r15d,36
je      oglmdi2_vs2019.13F13C710
xor     eax,eax
mov     dword ptr ss:[rbp+328],100000
mov     dword ptr ss:[rbp+324],eax
mov     dword ptr ss:[rbp+320],esi
test    edi,edi
je      oglmdi2_vs2019.13F13C710
mov     r8d,r12d
mov     ecx,r8d
mov     eax,dword ptr ss:[rbp+rcx*4-7C]
cmp     dword ptr ss:[rbp+rcx*4+324],eax
jne     oglmdi2_vs2019.13F13C710
inc     r8d
cmp     r8d,esi
jne     oglmdi2_vs2019.13F13C60A
bsr     eax,edi
mov     dword ptr ss:[rsp+38],r12d
je      oglmdi2_vs2019.13F13C634
inc     eax
jmp     oglmdi2_vs2019.13F13C637
mov     eax,r12d
sub     ebx,eax
mov     r14d,edx
or      r12d,FFFFFFFF
mov     eax,edx
mov     r10d,eax
lea     r8d,dword ptr ds:[rax-1]
cmp     eax,edx
jae     oglmdi2_vs2019.13F13C654
mov     r9d,dword ptr ss:[rbp+r10*4-7C]
jmp     oglmdi2_vs2019.13F13C657
xor     r9d,r9d
cmp     r8d,edx
jae     oglmdi2_vs2019.13F13C663
mov     ecx,dword ptr ss:[rbp+r8*4-7C]
jmp     oglmdi2_vs2019.13F13C665
xor     ecx,ecx
shr     ecx,1E
mov     eax,r9d
shl     eax,2
or      ecx,eax
mov     eax,r8d
mov     dword ptr ss:[rbp+r10*4-7C],ecx
cmp     r8d,r12d
je      oglmdi2_vs2019.13F13C682
mov     edx,dword ptr ss:[rbp-80]
jmp     oglmdi2_vs2019.13F13C642
cmp     ebx,esi
lea     eax,dword ptr ds:[r14+1]
mov     esi,436
lea     rcx,qword ptr ss:[rbp+324]
cmovb   r14d,eax
sub     esi,r15d
mov     edi,esi
mov     dword ptr ss:[rbp-80],r14d
shr     edi,5
xor     edx,edx
mov     ebx,edi
shl     rbx,2
mov     r8,rbx
call    oglmdi2_vs2019.13F12B280
and     esi,1F
mov     eax,1
mov     cl,sil
shl     eax,cl
mov     dword ptr ss:[rbp+rbx+324],eax
lea     r15d,dword ptr ds:[rdi+1]
mov     r8d,r15d
shl     r8,2
mov     dword ptr ss:[rbp+320],r15d
mov     dword ptr ss:[rbp+150],r15d
test    r8,r8
je      oglmdi2_vs2019.13F13C7DC
mov     ebx,1CC
lea     rcx,qword ptr ss:[rbp+154]
cmp     r8,rbx
ja      oglmdi2_vs2019.13F13C7BB
lea     rdx,qword ptr ss:[rbp+324]
call    oglmdi2_vs2019.13F12DE70
jmp     oglmdi2_vs2019.13F13C7D5
lea     eax,dword ptr ds:[rdx-1]
mov     dword ptr ss:[rsp+38],r12d
bsr     eax,dword ptr ss:[rbp+rax*4-7C]
je      oglmdi2_vs2019.13F13C723
inc     eax
jmp     oglmdi2_vs2019.13F13C726
mov     eax,r12d
sub     ebx,eax
mov     r14d,edx
or      r12d,FFFFFFFF
mov     eax,edx
mov     r10d,eax
lea     r8d,dword ptr ds:[rax-1]
cmp     eax,edx
jae     oglmdi2_vs2019.13F13C743
mov     r9d,dword ptr ss:[rbp+r10*4-7C]
jmp     oglmdi2_vs2019.13F13C746
xor     r9d,r9d
cmp     r8d,edx
jae     oglmdi2_vs2019.13F13C752
mov     ecx,dword ptr ss:[rbp+r8*4-7C]
jmp     oglmdi2_vs2019.13F13C754
xor     ecx,ecx
shr     ecx,1F
lea     eax,dword ptr ds:[r9+r9]
or      ecx,eax
mov     eax,r8d
mov     dword ptr ss:[rbp+r10*4-7C],ecx
cmp     r8d,r12d
je      oglmdi2_vs2019.13F13C76F
mov     edx,dword ptr ss:[rbp-80]
jmp     oglmdi2_vs2019.13F13C731
cmp     ebx,1
lea     eax,dword ptr ds:[r14+1]
mov     esi,435
lea     rcx,qword ptr ss:[rbp+324]
cmovb   r14d,eax
sub     esi,r15d
mov     edi,esi
mov     dword ptr ss:[rbp-80],r14d
shr     edi,5
xor     edx,edx
mov     ebx,edi
shl     rbx,2
mov     r8,rbx
call    oglmdi2_vs2019.13F12B280
and     esi,1F
mov     eax,1
mov     cl,sil
shl     eax,cl
mov     dword ptr ss:[rbp+rbx+324],eax
jmp     oglmdi2_vs2019.13F13C6C8
mov     r8,rbx
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
call    oglmdi2_vs2019.13F132F90
mov     r15d,dword ptr ss:[rbp+150]
mov     eax,CCCCCCCD
test    r13d,r13d
js      oglmdi2_vs2019.13F13CCDA
mul     r13d
mov     eax,edx
lea     rdx,qword ptr ds:[13F120000]
shr     eax,3
mov     dword ptr ss:[rsp+38],eax
mov     r12d,eax
mov     dword ptr ss:[rsp+30],eax
test    eax,eax
je      oglmdi2_vs2019.13F13CBDD
mov     eax,26
cmp     r12d,eax
mov     r13d,r12d
cmova   r13d,eax
mov     dword ptr ss:[rsp+44],r13d
lea     eax,dword ptr ds:[r13-1]
movzx   ecx,byte ptr ds:[rdx+rax*4+27902]
movzx   esi,byte ptr ds:[rdx+rax*4+27903]
mov     ebx,ecx
mov     edi,eax
xor     edx,edx
shl     rbx,2
mov     r8,rbx
lea     eax,dword ptr ds:[rsi+rcx]
lea     rcx,qword ptr ss:[rbp+324]
mov     dword ptr ss:[rbp+320],eax
call    oglmdi2_vs2019.13F12B280
lea     rcx,qword ptr ds:[13F120000]
shl     rsi,2
movzx   eax,word ptr ds:[rcx+rdi*4+27900]
lea     rdx,qword ptr ds:[rcx+26FF0]
lea     rcx,qword ptr ss:[rbp+324]
mov     r8,rsi
add     rcx,rbx
lea     rdx,qword ptr ds:[rdx+rax*4]
call    oglmdi2_vs2019.13F12DE70
mov     r10d,dword ptr ss:[rbp+320]
cmp     r10d,1
ja      oglmdi2_vs2019.13F13C939
mov     eax,dword ptr ss:[rbp+324]
test    eax,eax
jne     oglmdi2_vs2019.13F13C8B0
xor     r15d,r15d
mov     dword ptr ss:[rbp+150],r15d
jmp     oglmdi2_vs2019.13F13CBB0
cmp     eax,1
je      oglmdi2_vs2019.13F13CBB0
test    r15d,r15d
je      oglmdi2_vs2019.13F13CBB0
xor     r8d,r8d
mov     r10,rax
xor     r9d,r9d
mov     ecx,dword ptr ss:[rbp+r9*4+154]
mov     eax,r8d
imul    rcx,r10
add     rcx,rax
mov     r8,rcx
mov     dword ptr ss:[rbp+r9*4+154],ecx
shr     r8,20
inc     r9d
cmp     r9d,r15d
jne     oglmdi2_vs2019.13F13C8CB
test    r8d,r8d
je      oglmdi2_vs2019.13F13C92D
cmp     dword ptr ss:[rbp+150],73
jae     oglmdi2_vs2019.13F13C91C
mov     eax,dword ptr ss:[rbp+150]
mov     dword ptr ss:[rbp+rax*4+154],r8d
mov     r15d,dword ptr ss:[rbp+150]
inc     r15d
jmp     oglmdi2_vs2019.13F13C8A4
xor     r15d,r15d
mov     dword ptr ss:[rbp+150],r15d
xor     al,al
jmp     oglmdi2_vs2019.13F13CBB2
mov     r15d,dword ptr ss:[rbp+150]
jmp     oglmdi2_vs2019.13F13CBB0
cmp     r15d,1
ja      oglmdi2_vs2019.13F13C9F0
mov     ebx,dword ptr ss:[rbp+154]
mov     r8,r10
shl     r8,2
mov     r15d,r10d
mov     dword ptr ss:[rbp+150],r10d
test    r8,r8
je      oglmdi2_vs2019.13F13C99F
mov     eax,1CC
lea     rcx,qword ptr ss:[rbp+154]
cmp     r8,rax
ja      oglmdi2_vs2019.13F13C97E
lea     rdx,qword ptr ss:[rbp+324]
call    oglmdi2_vs2019.13F12DE70
jmp     oglmdi2_vs2019.13F13C998
mov     r8,rax
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
call    oglmdi2_vs2019.13F132F90
mov     r15d,dword ptr ss:[rbp+150]
test    ebx,ebx
je      oglmdi2_vs2019.13F13C8A1
cmp     ebx,1
je      oglmdi2_vs2019.13F13CBB0
test    r15d,r15d
je      oglmdi2_vs2019.13F13CBB0
xor     r8d,r8d
mov     r10,rbx
xor     r9d,r9d
mov     ecx,dword ptr ss:[rbp+r9*4+154]
mov     eax,r8d
imul    rcx,r10
add     rcx,rax
mov     r8,rcx
mov     dword ptr ss:[rbp+r9*4+154],ecx
shr     r8,20
inc     r9d
cmp     r9d,r15d
jne     oglmdi2_vs2019.13F13C9C2
jmp     oglmdi2_vs2019.13F13C8F4
cmp     r10d,r15d
lea     rcx,qword ptr ss:[rbp+154]
mov     r12d,r15d
lea     r13,qword ptr ss:[rbp+324]
cmovae  r13,rcx
lea     rdx,qword ptr ss:[rbp+154]
cmovb   r12d,r10d
lea     rcx,qword ptr ss:[rbp+324]
cmovae  rdx,rcx
setb    al
test    al,al
mov     qword ptr ss:[rsp+48],rdx
cmovne  r10d,r15d
xor     r15d,r15d
xor     r9d,r9d
mov     dword ptr ss:[rbp+4F0],r15d
test    r12d,r12d
je      oglmdi2_vs2019.13F13CB53
mov     esi,dword ptr ds:[r13+r9*4]
mov     eax,r9d
test    esi,esi
jne     oglmdi2_vs2019.13F13CA6F
cmp     r9d,r15d
jne     oglmdi2_vs2019.13F13CB47
and     dword ptr ss:[rbp+r9*4+4F4],esi
lea     r15d,dword ptr ds:[r9+1]
mov     dword ptr ss:[rbp+4F0],r15d
jmp     oglmdi2_vs2019.13F13CB47
xor     r11d,r11d
mov     r8d,r9d
test    r10d,r10d
je      oglmdi2_vs2019.13F13CB38
mov     ebx,r9d
neg     ebx
cmp     r8d,73
je      oglmdi2_vs2019.13F13CAE6
mov     edi,r8d
cmp     r8d,r15d
jne     oglmdi2_vs2019.13F13CAA3
and     dword ptr ss:[rbp+rdi*4+4F4],0
lea     eax,dword ptr ds:[r8+1]
mov     dword ptr ss:[rbp+4F0],eax
lea     eax,dword ptr ds:[r8+rbx]
inc     r8d
mov     edx,dword ptr ds:[rdx+rax*4]
mov     eax,dword ptr ss:[rbp+rdi*4+4F4]
imul    rdx,rsi
add     rdx,rax
mov     eax,r11d
add     rdx,rax
lea     eax,dword ptr ds:[r8+rbx]
mov     r11,rdx
mov     dword ptr ss:[rbp+rdi*4+4F4],edx
mov     r15d,dword ptr ss:[rbp+4F0]
shr     r11,20
cmp     eax,r10d
je      oglmdi2_vs2019.13F13CAE6
mov     rdx,qword ptr ss:[rsp+48]
jmp     oglmdi2_vs2019.13F13CA83
test    r11d,r11d
je      oglmdi2_vs2019.13F13CB38
cmp     r8d,73
je      oglmdi2_vs2019.13F13CCCE
mov     edx,r8d
cmp     r8d,r15d
jne     oglmdi2_vs2019.13F13CB0F
and     dword ptr ss:[rbp+rdx*4+4F4],0
lea     eax,dword ptr ds:[r8+1]
mov     dword ptr ss:[rbp+4F0],eax
mov     eax,dword ptr ss:[rbp+rdx*4+4F4]
inc     r8d
mov     ecx,r11d
add     rcx,rax
mov     dword ptr ss:[rbp+rdx*4+4F4],ecx
mov     r15d,dword ptr ss:[rbp+4F0]
shr     rcx,20
mov     r11d,ecx
test    ecx,ecx
jne     oglmdi2_vs2019.13F13CAEB
cmp     r8d,73
je      oglmdi2_vs2019.13F13CCCE
mov     rdx,qword ptr ss:[rsp+48]
inc     r9d
cmp     r9d,r12d
jne     oglmdi2_vs2019.13F13CA42
mov     r8d,r15d
shl     r8,2
mov     dword ptr ss:[rbp+150],r15d
test    r8,r8
je      oglmdi2_vs2019.13F13CBA6
mov     eax,1CC
lea     rcx,qword ptr ss:[rbp+154]
cmp     r8,rax
ja      oglmdi2_vs2019.13F13CB85
lea     rdx,qword ptr ss:[rbp+4F4]
call    oglmdi2_vs2019.13F12DE70
jmp     oglmdi2_vs2019.13F13CB9F
mov     r8,rax
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
call    oglmdi2_vs2019.13F132F90
mov     r15d,dword ptr ss:[rbp+150]
mov     r12d,dword ptr ss:[rsp+30]
mov     r13d,dword ptr ss:[rsp+44]
mov     al,1
test    al,al
je      oglmdi2_vs2019.13F13CCCE
sub     r12d,r13d
lea     rdx,qword ptr ds:[13F120000]
mov     dword ptr ss:[rsp+30],r12d
mov     eax,26
jne     oglmdi2_vs2019.13F13C811
mov     eax,dword ptr ss:[rsp+38]
mov     r13d,dword ptr ss:[rsp+40]
lea     eax,dword ptr ds:[rax+rax*4]
mov     ecx,r13d
add     eax,eax
sub     ecx,eax
je      oglmdi2_vs2019.13F13CC6E
lea     eax,dword ptr ds:[rcx-1]
mov     eax,dword ptr ds:[rdx+rax*4+27998]
test    eax,eax
je      oglmdi2_vs2019.13F13CCCE
cmp     eax,1
je      oglmdi2_vs2019.13F13CC6E
test    r15d,r15d
je      oglmdi2_vs2019.13F13CC6E
xor     r8d,r8d
mov     r10d,eax
xor     r9d,r9d
mov     ecx,dword ptr ss:[rbp+r9*4+154]
mov     eax,r8d
imul    rcx,r10
add     rcx,rax
mov     r8,rcx
mov     dword ptr ss:[rbp+r9*4+154],ecx
shr     r8,20
inc     r9d
cmp     r9d,r15d
jne     oglmdi2_vs2019.13F13CC12
test    r8d,r8d
je      oglmdi2_vs2019.13F13CC67
cmp     dword ptr ss:[rbp+150],73
jae     oglmdi2_vs2019.13F13CCCE
mov     eax,dword ptr ss:[rbp+150]
mov     dword ptr ss:[rbp+rax*4+154],r8d
mov     r15d,dword ptr ss:[rbp+150]
inc     r15d
jmp     oglmdi2_vs2019.13F13CCD1
mov     r15d,dword ptr ss:[rbp+150]
mov     rdi,qword ptr ss:[rsp+68]
xor     r12d,r12d
mov     rbx,rdi
test    r14d,r14d
je      oglmdi2_vs2019.13F13D14C
mov     r8d,r12d
mov     r9d,r12d
mov     edx,r9d
inc     r9d
mov     eax,dword ptr ss:[rbp+rdx*4-7C]
lea     rcx,qword ptr ds:[rax+rax*4]
mov     eax,r8d
lea     r8,qword ptr ds:[rax+rcx*2]
mov     dword ptr ss:[rbp+rdx*4-7C],r8d
shr     r8,20
cmp     r9d,r14d
jne     oglmdi2_vs2019.13F13CC88
test    r8d,r8d
je      oglmdi2_vs2019.13F13D14C
cmp     dword ptr ss:[rbp-80],73
jae     oglmdi2_vs2019.13F13D129
mov     eax,dword ptr ss:[rbp-80]
mov     dword ptr ss:[rbp+rax*4-7C],r8d
inc     dword ptr ss:[rbp-80]
jmp     oglmdi2_vs2019.13F13D14C
xor     r15d,r15d
mov     dword ptr ss:[rbp+150],r15d
jmp     oglmdi2_vs2019.13F13CC6E
neg     r13d
mul     r13d
mov     eax,edx
lea     rdx,qword ptr ds:[13F120000]
shr     eax,3
mov     dword ptr ss:[rsp+44],eax
mov     r12d,eax
mov     dword ptr ss:[rsp+30],eax
test    eax,eax
je      oglmdi2_vs2019.13F13D091
mov     ecx,26
cmp     r12d,ecx
mov     eax,r12d
cmova   eax,ecx
mov     dword ptr ss:[rsp+38],eax
dec     eax
mov     edi,eax
movzx   ecx,byte ptr ds:[rdx+rax*4+27902]
movzx   esi,byte ptr ds:[rdx+rax*4+27903]
mov     ebx,ecx
shl     rbx,2
xor     edx,edx
mov     r8,rbx
lea     eax,dword ptr ds:[rsi+rcx]
lea     rcx,qword ptr ss:[rbp+324]
mov     dword ptr ss:[rbp+320],eax
call    oglmdi2_vs2019.13F12B280
lea     rcx,qword ptr ds:[13F120000]
shl     rsi,2
movzx   eax,word ptr ds:[rcx+rdi*4+27900]
lea     rdx,qword ptr ds:[rcx+26FF0]
lea     rcx,qword ptr ss:[rbp+324]
mov     r8,rsi
add     rcx,rbx
lea     rdx,qword ptr ds:[rdx+rax*4]
call    oglmdi2_vs2019.13F12DE70
mov     r10d,dword ptr ss:[rbp+320]
cmp     r10d,1
ja      oglmdi2_vs2019.13F13CE0D
mov     eax,dword ptr ss:[rbp+324]
test    eax,eax
jne     oglmdi2_vs2019.13F13CD9C
xor     r14d,r14d
mov     dword ptr ss:[rbp-80],r14d
jmp     oglmdi2_vs2019.13F13D067
cmp     eax,1
je      oglmdi2_vs2019.13F13D067
test    r14d,r14d
je      oglmdi2_vs2019.13F13D067
xor     r8d,r8d
mov     r10,rax
xor     r9d,r9d
mov     ecx,dword ptr ss:[rbp+r9*4-7C]
mov     eax,r8d
imul    rcx,r10
add     rcx,rax
mov     r8,rcx
mov     dword ptr ss:[rbp+r9*4-7C],ecx
shr     r8,20
inc     r9d
cmp     r9d,r14d
jne     oglmdi2_vs2019.13F13CDB7
test    r8d,r8d
je      oglmdi2_vs2019.13F13CE04
cmp     dword ptr ss:[rbp-80],73
jae     oglmdi2_vs2019.13F13CDF6
mov     eax,dword ptr ss:[rbp-80]
mov     dword ptr ss:[rbp+rax*4-7C],r8d
mov     r14d,dword ptr ss:[rbp-80]
inc     r14d
jmp     oglmdi2_vs2019.13F13CD93
xor     r14d,r14d
mov     dword ptr ss:[rbp-80],r14d
xor     al,al
jmp     oglmdi2_vs2019.13F13D069
mov     r14d,dword ptr ss:[rbp-80]
jmp     oglmdi2_vs2019.13F13D067
cmp     r14d,1
ja      oglmdi2_vs2019.13F13CEB2
mov     ebx,dword ptr ss:[rbp-7C]
mov     r8,r10
shl     r8,2
mov     r14d,r10d
mov     dword ptr ss:[rbp-80],r10d
test    r8,r8
je      oglmdi2_vs2019.13F13CE67
mov     eax,1CC
lea     rcx,qword ptr ss:[rbp-7C]
cmp     r8,rax
ja      oglmdi2_vs2019.13F13CE49
lea     rdx,qword ptr ss:[rbp+324]
call    oglmdi2_vs2019.13F12DE70
jmp     oglmdi2_vs2019.13F13CE63
mov     r8,rax
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
call    oglmdi2_vs2019.13F132F90
mov     r14d,dword ptr ss:[rbp-80]
test    ebx,ebx
je      oglmdi2_vs2019.13F13CD90
cmp     ebx,1
je      oglmdi2_vs2019.13F13D067
test    r14d,r14d
je      oglmdi2_vs2019.13F13D067
xor     r8d,r8d
mov     r10,rbx
xor     r9d,r9d
mov     ecx,dword ptr ss:[rbp+r9*4-7C]
mov     eax,r8d
imul    rcx,r10
add     rcx,rax
mov     r8,rcx
mov     dword ptr ss:[rbp+r9*4-7C],ecx
shr     r8,20
inc     r9d
cmp     r9d,r14d
jne     oglmdi2_vs2019.13F13CE8A
jmp     oglmdi2_vs2019.13F13CDDA
cmp     r10d,r14d
lea     rdx,qword ptr ss:[rbp-7C]
mov     r12d,r14d
lea     rcx,qword ptr ss:[rbp+324]
cmovae  rcx,rdx
lea     r8,qword ptr ss:[rbp+324]
cmovb   r12d,r10d
mov     qword ptr ss:[rsp+70],rcx
setb    al
lea     rdx,qword ptr ss:[rbp-7C]
cmovae  rdx,r8
test    al,al
mov     qword ptr ss:[rsp+48],rdx
cmovne  r10d,r14d
xor     r14d,r14d
xor     r9d,r9d
mov     dword ptr ss:[rbp+4F0],r14d
test    r12d,r12d
je      oglmdi2_vs2019.13F13D018
mov     esi,dword ptr ds:[rcx+r9*4]
mov     eax,r9d
test    esi,esi
jne     oglmdi2_vs2019.13F13CF2F
cmp     r9d,r14d
jne     oglmdi2_vs2019.13F13D00C
and     dword ptr ss:[rbp+r9*4+4F4],esi
lea     r14d,dword ptr ds:[r9+1]
mov     dword ptr ss:[rbp+4F0],r14d
jmp     oglmdi2_vs2019.13F13D00C
xor     r11d,r11d
mov     r8d,r9d
test    r10d,r10d
je      oglmdi2_vs2019.13F13CFF8
mov     ebx,r9d
neg     ebx
cmp     r8d,73
je      oglmdi2_vs2019.13F13CFA6
mov     edi,r8d
cmp     r8d,r14d
jne     oglmdi2_vs2019.13F13CF63
and     dword ptr ss:[rbp+rdi*4+4F4],0
lea     eax,dword ptr ds:[r8+1]
mov     dword ptr ss:[rbp+4F0],eax
lea     eax,dword ptr ds:[rbx+r8]
inc     r8d
mov     edx,dword ptr ds:[rdx+rax*4]
mov     eax,dword ptr ss:[rbp+rdi*4+4F4]
imul    rdx,rsi
add     rdx,rax
mov     eax,r11d
add     rdx,rax
lea     eax,dword ptr ds:[rbx+r8]
mov     r11,rdx
mov     dword ptr ss:[rbp+rdi*4+4F4],edx
mov     r14d,dword ptr ss:[rbp+4F0]
shr     r11,20
cmp     eax,r10d
je      oglmdi2_vs2019.13F13CFA6
mov     rdx,qword ptr ss:[rsp+48]
jmp     oglmdi2_vs2019.13F13CF43
test    r11d,r11d
je      oglmdi2_vs2019.13F13CFF8
cmp     r8d,73
je      oglmdi2_vs2019.13F13D118
mov     edx,r8d
cmp     r8d,r14d
jne     oglmdi2_vs2019.13F13CFCF
and     dword ptr ss:[rbp+rdx*4+4F4],0
lea     eax,dword ptr ds:[r8+1]
mov     dword ptr ss:[rbp+4F0],eax
mov     ecx,dword ptr ss:[rbp+rdx*4+4F4]
inc     r8d
mov     eax,r11d
add     rcx,rax
mov     dword ptr ss:[rbp+rdx*4+4F4],ecx
mov     r14d,dword ptr ss:[rbp+4F0]
shr     rcx,20
mov     r11d,ecx
test    ecx,ecx
jne     oglmdi2_vs2019.13F13CFAB
cmp     r8d,73
je      oglmdi2_vs2019.13F13D118
mov     rcx,qword ptr ss:[rsp+70]
mov     rdx,qword ptr ss:[rsp+48]
inc     r9d
cmp     r9d,r12d
jne     oglmdi2_vs2019.13F13CF03
mov     r8d,r14d
shl     r8,2
mov     dword ptr ss:[rbp-80],r14d
test    r8,r8
je      oglmdi2_vs2019.13F13D062
mov     eax,1CC
lea     rcx,qword ptr ss:[rbp-7C]
cmp     r8,rax
ja      oglmdi2_vs2019.13F13D044
lea     rdx,qword ptr ss:[rbp+4F4]
call    oglmdi2_vs2019.13F12DE70
jmp     oglmdi2_vs2019.13F13D05E
mov     r8,rax
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],22
call    oglmdi2_vs2019.13F132F90
mov     r14d,dword ptr ss:[rbp-80]
mov     r12d,dword ptr ss:[rsp+30]
mov     al,1
test    al,al
je      oglmdi2_vs2019.13F13D118
sub     r12d,dword ptr ss:[rsp+38]
lea     rdx,qword ptr ds:[13F120000]
mov     dword ptr ss:[rsp+30],r12d
mov     ecx,26
jne     oglmdi2_vs2019.13F13CD04
mov     eax,dword ptr ss:[rsp+44]
lea     eax,dword ptr ds:[rax+rax*4]
add     eax,eax
sub     r13d,eax
je      oglmdi2_vs2019.13F13CC6E
lea     eax,dword ptr ds:[r13-1]
mov     eax,dword ptr ds:[rdx+rax*4+27998]
test    eax,eax
je      oglmdi2_vs2019.13F13D118
cmp     eax,1
je      oglmdi2_vs2019.13F13CC6E
test    r14d,r14d
je      oglmdi2_vs2019.13F13CC6E
xor     r8d,r8d
mov     r10d,eax
xor     r9d,r9d
mov     ecx,dword ptr ss:[rbp+r9*4-7C]
mov     eax,r8d
imul    rcx,r10
add     rcx,rax
mov     r8,rcx
mov     dword ptr ss:[rbp+r9*4-7C],ecx
shr     r8,20
inc     r9d
cmp     r9d,r14d
jne     oglmdi2_vs2019.13F13D0C9
test    r8d,r8d
je      oglmdi2_vs2019.13F13D10F
cmp     dword ptr ss:[rbp-80],73
jae     oglmdi2_vs2019.13F13D118
mov     eax,dword ptr ss:[rbp-80]
mov     dword ptr ss:[rbp+rax*4-7C],r8d
mov     r14d,dword ptr ss:[rbp-80]
inc     r14d
mov     dword ptr ss:[rbp-80],r14d
jmp     oglmdi2_vs2019.13F13CC6E
mov     r14d,dword ptr ss:[rbp-80]
jmp     oglmdi2_vs2019.13F13CC6E
and     dword ptr ss:[rbp-80],0
mov     rdi,qword ptr ss:[rsp+68]
xor     r12d,r12d
mov     rbx,rdi
jmp     oglmdi2_vs2019.13F13D14C
xor     r9d,r9d
mov     dword ptr ss:[rbp+320],r12d
lea     r8,qword ptr ss:[rbp+324]
mov     dword ptr ss:[rbp-80],r12d
mov     edx,1CC
lea     rcx,qword ptr ss:[rbp-7C]
call    oglmdi2_vs2019.13F13D3B0
lea     rdx,qword ptr ss:[rbp+150]
lea     rcx,qword ptr ss:[rbp-80]
call    oglmdi2_vs2019.13F13BD50
mov     esi,dword ptr ss:[rsp+40]
cmp     eax,A
jne     oglmdi2_vs2019.13F13D1F9
inc     esi
mov     byte ptr ds:[rdi],31
lea     rbx,qword ptr ds:[rdi+1]
test    r15d,r15d
je      oglmdi2_vs2019.13F13D209
mov     r8d,r12d
mov     r9d,r12d
mov     edx,r9d
inc     r9d
mov     eax,dword ptr ss:[rbp+rdx*4+154]
lea     rcx,qword ptr ds:[rax+rax*4]
mov     eax,r8d
lea     r8,qword ptr ds:[rax+rcx*2]
mov     dword ptr ss:[rbp+rdx*4+154],r8d
shr     r8,20
cmp     r9d,r15d
jne     oglmdi2_vs2019.13F13D181
test    r8d,r8d
je      oglmdi2_vs2019.13F13D209
cmp     dword ptr ss:[rbp+150],73
jae     oglmdi2_vs2019.13F13D1CE
mov     eax,dword ptr ss:[rbp+150]
mov     dword ptr ss:[rbp+rax*4+154],r8d
inc     dword ptr ss:[rbp+150]
jmp     oglmdi2_vs2019.13F13D209
xor     r9d,r9d
mov     dword ptr ss:[rbp+320],r12d
lea     r8,qword ptr ss:[rbp+324]
mov     dword ptr ss:[rbp+150],r12d
mov     edx,1CC
lea     rcx,qword ptr ss:[rbp+154]
call    oglmdi2_vs2019.13F13D3B0
jmp     oglmdi2_vs2019.13F13D209
test    eax,eax
jne     oglmdi2_vs2019.13F13D201
dec     esi
jmp     oglmdi2_vs2019.13F13D209
add     al,30
lea     rbx,qword ptr ds:[rdi+1]
mov     byte ptr ds:[rdi],al
mov     rax,qword ptr ss:[rsp+78]
mov     edx,dword ptr ss:[rsp+50]
mov     dword ptr ds:[rax+4],esi
test    esi,esi
js      oglmdi2_vs2019.13F13D223
cmp     edx,7FFFFFFF
ja      oglmdi2_vs2019.13F13D223
add     edx,esi
mov     rcx,qword ptr ss:[rbp+740]
dec     rcx
mov     eax,edx
cmp     rcx,rax
cmovb   rax,rcx
add     rdi,rax
cmp     rbx,rdi
je      oglmdi2_vs2019.13F13D32A
mov     r14d,9
or      esi,FFFFFFFF
mov     r10d,dword ptr ss:[rbp-80]
test    r10d,r10d
je      oglmdi2_vs2019.13F13D32A
mov     r8d,r12d
mov     r9d,r12d
mov     edx,r9d
inc     r9d
mov     eax,dword ptr ss:[rbp+rdx*4-7C]
imul    rcx,rax,3B9ACA00
mov     eax,r8d
add     rcx,rax
mov     r8,rcx
mov     dword ptr ss:[rbp+rdx*4-7C],ecx
shr     r8,20
cmp     r9d,r10d
jne     oglmdi2_vs2019.13F13D25E
test    r8d,r8d
je      oglmdi2_vs2019.13F13D2C0
cmp     dword ptr ss:[rbp-80],73
jae     oglmdi2_vs2019.13F13D29D
mov     eax,dword ptr ss:[rbp-80]
mov     dword ptr ss:[rbp+rax*4-7C],r8d
inc     dword ptr ss:[rbp-80]
jmp     oglmdi2_vs2019.13F13D2C0
xor     r9d,r9d
mov     dword ptr ss:[rbp+320],r12d
lea     r8,qword ptr ss:[rbp+324]
mov     dword ptr ss:[rbp-80],r12d
mov     edx,1CC
lea     rcx,qword ptr ss:[rbp-7C]
call    oglmdi2_vs2019.13F13D3B0
lea     rdx,qword ptr ss:[rbp+150]
lea     rcx,qword ptr ss:[rbp-80]
call    oglmdi2_vs2019.13F13BD50
mov     r10d,edi
mov     r8,rax
sub     r10d,ebx
mov     r9d,8
mov     eax,CCCCCCCD
mul     r8d
shr     edx,3
mov     cl,dl
shl     cl,2
lea     eax,dword ptr ds:[rcx+rdx]
add     al,al
sub     r8b,al
lea     ecx,dword ptr ds:[r8+30]
mov     r8d,edx
cmp     r10d,r9d
jb      oglmdi2_vs2019.13F13D309
mov     eax,r9d
mov     byte ptr ds:[rax+rbx],cl
add     r9d,esi
cmp     r9d,esi
jne     oglmdi2_vs2019.13F13D2DF
mov     rax,rdi
sub     rax,rbx
cmp     rax,r14
cmovg   rax,r14
add     rbx,rax
cmp     rbx,rdi
jne     oglmdi2_vs2019.13F13D24B
mov     byte ptr ds:[rbx],r12b
cmp     byte ptr ss:[rsp+60],r12b
je      oglmdi2_vs2019.13F13D33E
lea     rcx,qword ptr ss:[rsp+58]
call    oglmdi2_vs2019.13F13E610
mov     rcx,qword ptr ss:[rbp+6C0]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,7D8
pop     r15
pop     r14
pop     r13
pop     r12
pop     rdi
pop     rsi
pop     rbx
pop     rbp
ret     
lea     r8,qword ptr ds:[13F1479D8]
jmp     oglmdi2_vs2019.13F13D37A
lea     r8,qword ptr ds:[13F1479D0]
jmp     oglmdi2_vs2019.13F13D37A
lea     r8,qword ptr ds:[13F1479C8]
mov     rdx,qword ptr ss:[rbp+740]
mov     rcx,rsi
call    oglmdi2_vs2019.13F1328D0
test    eax,eax
jne     oglmdi2_vs2019.13F13D398
jmp     oglmdi2_vs2019.13F13D32D
lea     r8,qword ptr ds:[13F1479C0]
jmp     oglmdi2_vs2019.13F13D37A
xor     r9d,r9d
mov     qword ptr ss:[rsp+20],r12
xor     r8d,r8d
xor     edx,edx
xor     ecx,ecx
call    oglmdi2_vs2019.13F132FB0
int3    
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,20
mov     rbx,r9
mov     rsi,r8
mov     rdi,rdx
test    r9,r9
jne     oglmdi2_vs2019.13F13D3D1
xor     eax,eax
jmp     oglmdi2_vs2019.13F13D427
test    rcx,rcx
jne     oglmdi2_vs2019.13F13D3EB
call    oglmdi2_vs2019.13F1330B0
mov     ebx,16
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     eax,ebx
jmp     oglmdi2_vs2019.13F13D427
test    rsi,rsi
je      oglmdi2_vs2019.13F13D402
cmp     rdi,rbx
jb      oglmdi2_vs2019.13F13D402
mov     r8,rbx
mov     rdx,rsi
call    oglmdi2_vs2019.13F12DE70
jmp     oglmdi2_vs2019.13F13D3CD
mov     r8,rdi
xor     edx,edx
call    oglmdi2_vs2019.13F12B280
test    rsi,rsi
je      oglmdi2_vs2019.13F13D3D6
cmp     rdi,rbx
jae     oglmdi2_vs2019.13F13D422
call    oglmdi2_vs2019.13F1330B0
mov     ebx,22
jmp     oglmdi2_vs2019.13F13D3E0
mov     eax,16
mov     rbx,qword ptr ss:[rsp+30]
mov     rsi,qword ptr ss:[rsp+38]
add     rsp,20
pop     rdi
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
push    r12
push    r13
push    r14
sub     rsp,450
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+410],rax
mov     r12,r9
mov     r14,r8
mov     r13,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F13D487
test    rdx,rdx
je      oglmdi2_vs2019.13F13D487
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
jmp     oglmdi2_vs2019.13F13D7CF
test    r14,r14
je      oglmdi2_vs2019.13F13D472
test    r12,r12
je      oglmdi2_vs2019.13F13D472
cmp     rdx,2
jb      oglmdi2_vs2019.13F13D7CF
mov     qword ptr ss:[rsp+448],rbx
mov     qword ptr ss:[rsp+440],rbp
mov     qword ptr ss:[rsp+438],rsi
mov     qword ptr ss:[rsp+430],rdi
mov     qword ptr ss:[rsp+428],r15
lea     r15,qword ptr ds:[rdx-1]
imul    r15,r14
add     r15,rcx
xor     ecx,ecx
mov     qword ptr ss:[rsp+20],rcx
nop     word ptr ds:[rax+rax]
xor     edx,edx
mov     rax,r15
sub     rax,r13
div     r14
lea     rbx,qword ptr ds:[rax+1]
cmp     rbx,8
ja      oglmdi2_vs2019.13F13D589
cmp     r15,r13
jbe     oglmdi2_vs2019.13F13D563
lea     rsi,qword ptr ds:[r14+r13]
mov     rbx,r13
mov     rdi,rsi
cmp     rsi,r15
ja      oglmdi2_vs2019.13F13D52D
nop     dword ptr ds:[rax]
mov     rdx,rbx
mov     rcx,rdi
mov     rax,r12
call    qword ptr ds:[13F140490]
test    eax,eax
cmovg   rbx,rdi
add     rdi,r14
cmp     rdi,r15
jbe     oglmdi2_vs2019.13F13D510
mov     r8,r14
mov     rdx,r15
cmp     rbx,r15
je      oglmdi2_vs2019.13F13D556
sub     rbx,r15
nop     dword ptr ds:[rax+rax]
movzx   eax,byte ptr ds:[rdx]
movzx   ecx,byte ptr ds:[rbx+rdx]
mov     byte ptr ds:[rbx+rdx],al
mov     byte ptr ds:[rdx],cl
lea     rdx,qword ptr ds:[rdx+1]
sub     r8,1
jne     oglmdi2_vs2019.13F13D540
sub     r15,r14
cmp     r15,r13
ja      oglmdi2_vs2019.13F13D502
mov     rcx,qword ptr ss:[rsp+20]
mov     rax,rcx
dec     rcx
mov     qword ptr ss:[rsp+20],rcx
test    rax,rax
jle     oglmdi2_vs2019.13F13D7A7
mov     r13,qword ptr ss:[rsp+rcx*8+30]
mov     r15,qword ptr ss:[rsp+rcx*8+220]
jmp     oglmdi2_vs2019.13F13D4E0
shr     rbx,1
mov     rcx,r13
imul    rbx,r14
mov     rax,r12
lea     rdi,qword ptr ds:[rbx+r13]
mov     rdx,rdi
call    qword ptr ds:[13F140490]
test    eax,eax
jle     oglmdi2_vs2019.13F13D5DB
mov     r9,r14
mov     r8,rdi
cmp     r13,rdi
je      oglmdi2_vs2019.13F13D5DB
nop     dword ptr ds:[rax]
nop     word ptr ds:[rax+rax]
movzx   eax,byte ptr ds:[r8]
mov     rdx,r8
sub     rdx,rbx
movzx   ecx,byte ptr ds:[rdx]
mov     byte ptr ds:[rdx],al
mov     byte ptr ds:[r8],cl
inc     r8
sub     r9,1
jne     oglmdi2_vs2019.13F13D5C0
mov     rdx,r15
mov     rcx,r13
mov     rax,r12
call    qword ptr ds:[13F140490]
test    eax,eax
jle     oglmdi2_vs2019.13F13D618
mov     r8,r14
mov     rdx,r15
cmp     r13,r15
je      oglmdi2_vs2019.13F13D618
mov     r9,r13
sub     r9,r15
nop     
movzx   eax,byte ptr ds:[rdx]
movzx   ecx,byte ptr ds:[r9+rdx]
mov     byte ptr ds:[r9+rdx],al
mov     byte ptr ds:[rdx],cl
lea     rdx,qword ptr ds:[rdx+1]
sub     r8,1
jne     oglmdi2_vs2019.13F13D600
mov     rdx,r15
mov     rcx,rdi
mov     rax,r12
call    qword ptr ds:[13F140490]
test    eax,eax
jle     oglmdi2_vs2019.13F13D658
mov     r8,r14
mov     rdx,r15
cmp     rdi,r15
je      oglmdi2_vs2019.13F13D658
mov     r9,rdi
sub     r9,r15
nop     dword ptr ds:[rax]
movzx   eax,byte ptr ds:[rdx]
movzx   ecx,byte ptr ds:[r9+rdx]
mov     byte ptr ds:[r9+rdx],al
mov     byte ptr ds:[rdx],cl
lea     rdx,qword ptr ds:[rdx+1]
sub     r8,1
jne     oglmdi2_vs2019.13F13D640
mov     rbx,r13
mov     rsi,r15
nop     
cmp     rdi,rbx
jbe     oglmdi2_vs2019.13F13D685
add     rbx,r14
cmp     rbx,rdi
jae     oglmdi2_vs2019.13F13D685
mov     rdx,rdi
mov     rcx,rbx
mov     rax,r12
call    qword ptr ds:[13F140490]
test    eax,eax
jle     oglmdi2_vs2019.13F13D665
cmp     rdi,rbx
ja      oglmdi2_vs2019.13F13D6A0
add     rbx,r14
cmp     rbx,r15
ja      oglmdi2_vs2019.13F13D6A0
mov     rdx,rdi
mov     rcx,rbx
mov     rax,r12
call    qword ptr ds:[13F140490]
test    eax,eax
jle     oglmdi2_vs2019.13F13D685
mov     rbp,rsi
sub     rsi,r14
cmp     rsi,rdi
jbe     oglmdi2_vs2019.13F13D6BE
mov     rdx,rdi
mov     rcx,rsi
mov     rax,r12
call    qword ptr ds:[13F140490]
test    eax,eax
jg      oglmdi2_vs2019.13F13D6A0
cmp     rsi,rbx
jb      oglmdi2_vs2019.13F13D6FB
mov     r8,r14
mov     rdx,rsi
je      oglmdi2_vs2019.13F13D6E9
mov     r9,rbx
sub     r9,rsi
movzx   eax,byte ptr ds:[rdx]
movzx   ecx,byte ptr ds:[r9+rdx]
mov     byte ptr ds:[r9+rdx],al
mov     byte ptr ds:[rdx],cl
lea     rdx,qword ptr ds:[rdx+1]
sub     r8,1
jne     oglmdi2_vs2019.13F13D6D1
cmp     rdi,rsi
mov     rax,rbx
cmovne  rax,rdi
mov     rdi,rax
jmp     oglmdi2_vs2019.13F13D660
cmp     rdi,rbp
jae     oglmdi2_vs2019.13F13D720
sub     rbp,r14
cmp     rbp,rdi
jbe     oglmdi2_vs2019.13F13D720
mov     rdx,rdi
mov     rcx,rbp
mov     rax,r12
call    qword ptr ds:[13F140490]
test    eax,eax
je      oglmdi2_vs2019.13F13D700
cmp     rdi,rbp
jb      oglmdi2_vs2019.13F13D73B
sub     rbp,r14
cmp     rbp,r13
jbe     oglmdi2_vs2019.13F13D73B
mov     rdx,rdi
mov     rcx,rbp
mov     rax,r12
call    qword ptr ds:[13F140490]
test    eax,eax
je      oglmdi2_vs2019.13F13D720
mov     rcx,r15
mov     rax,rbp
sub     rcx,rbx
sub     rax,r13
cmp     rax,rcx
mov     rcx,qword ptr ss:[rsp+20]
jl      oglmdi2_vs2019.13F13D77C
cmp     r13,rbp
jae     oglmdi2_vs2019.13F13D76B
mov     qword ptr ss:[rsp+rcx*8+30],r13
mov     qword ptr ss:[rsp+rcx*8+220],rbp
inc     rcx
mov     qword ptr ss:[rsp+20],rcx
cmp     rbx,r15
jae     oglmdi2_vs2019.13F13D563
mov     r13,rbx
jmp     oglmdi2_vs2019.13F13D4E0
cmp     rbx,r15
jae     oglmdi2_vs2019.13F13D796
mov     qword ptr ss:[rsp+rcx*8+30],rbx
mov     qword ptr ss:[rsp+rcx*8+220],r15
inc     rcx
mov     qword ptr ss:[rsp+20],rcx
cmp     r13,rbp
jae     oglmdi2_vs2019.13F13D563
mov     r15,rbp
jmp     oglmdi2_vs2019.13F13D4E0
mov     rdi,qword ptr ss:[rsp+430]
mov     rsi,qword ptr ss:[rsp+438]
mov     rbp,qword ptr ss:[rsp+440]
mov     rbx,qword ptr ss:[rsp+448]
mov     r15,qword ptr ss:[rsp+428]
mov     rcx,qword ptr ss:[rsp+410]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,450
pop     r14
pop     r13
pop     r12
ret     
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
xor     r10d,r10d
mov     rbx,r8
mov     r11,rdx
test    r9,r9
jne     oglmdi2_vs2019.13F13D834
test    rcx,rcx
jne     oglmdi2_vs2019.13F13D839
test    rdx,rdx
je      oglmdi2_vs2019.13F13D826
call    oglmdi2_vs2019.13F1330B0
mov     ebx,16
mov     dword ptr ds:[rax],ebx
call    oglmdi2_vs2019.13F132F90
mov     r10d,ebx
mov     rbx,qword ptr ss:[rsp+30]
mov     eax,r10d
add     rsp,20
pop     rdi
ret     
test    rcx,rcx
je      oglmdi2_vs2019.13F13D812
test    r11,r11
je      oglmdi2_vs2019.13F13D812
test    r9,r9
jne     oglmdi2_vs2019.13F13D848
mov     byte ptr ds:[rcx],r10b
jmp     oglmdi2_vs2019.13F13D826
test    rbx,rbx
jne     oglmdi2_vs2019.13F13D852
mov     byte ptr ds:[rcx],r10b
jmp     oglmdi2_vs2019.13F13D812
sub     rbx,rcx
mov     rdx,rcx
mov     r8,r11
mov     rdi,r9
cmp     r9,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F13D878
mov     al,byte ptr ds:[rbx+rdx]
mov     byte ptr ds:[rdx],al
inc     rdx
test    al,al
je      oglmdi2_vs2019.13F13D898
sub     r8,1
jne     oglmdi2_vs2019.13F13D864
jmp     oglmdi2_vs2019.13F13D898
mov     al,byte ptr ds:[rbx+rdx]
mov     byte ptr ds:[rdx],al
inc     rdx
test    al,al
je      oglmdi2_vs2019.13F13D890
sub     r8,1
je      oglmdi2_vs2019.13F13D890
sub     rdi,1
jne     oglmdi2_vs2019.13F13D878
test    rdi,rdi
jne     oglmdi2_vs2019.13F13D898
mov     byte ptr ds:[rdx],r10b
test    r8,r8
jne     oglmdi2_vs2019.13F13D826
cmp     r9,FFFFFFFFFFFFFFFF
jne     oglmdi2_vs2019.13F13D8B1
mov     byte ptr ds:[rcx+r11-1],r10b
lea     r10d,dword ptr ds:[r8+50]
jmp     oglmdi2_vs2019.13F13D826
mov     byte ptr ds:[rcx],r10b
call    oglmdi2_vs2019.13F1330B0
mov     ebx,22
jmp     oglmdi2_vs2019.13F13D81C
int3    
sub     rsp,58
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+40],rax
xor     eax,eax
mov     r9,rdx
cmp     rax,20
mov     r8,rcx
jae     oglmdi2_vs2019.13F13D95C
mov     byte ptr ss:[rsp+rax+20],0
inc     rax
cmp     rax,20
jl      oglmdi2_vs2019.13F13D8E3
mov     al,byte ptr ds:[rdx]
jmp     oglmdi2_vs2019.13F13D916
movzx   edx,al
shr     rdx,3
movzx   eax,al
and     eax,7
movzx   ecx,byte ptr ss:[rsp+rdx+20]
bts     ecx,eax
inc     r9
mov     byte ptr ss:[rsp+rdx+20],cl
mov     al,byte ptr ds:[r9]
test    al,al
jne     oglmdi2_vs2019.13F13D8F7
jmp     oglmdi2_vs2019.13F13D93B
movzx   eax,r9b
mov     edx,1
movzx   ecx,r9b
and     ecx,7
shr     rax,3
shl     edx,cl
test    byte ptr ss:[rsp+rax+20],dl
jne     oglmdi2_vs2019.13F13D957
inc     r8
mov     r9b,byte ptr ds:[r8]
test    r9b,r9b
jne     oglmdi2_vs2019.13F13D91C
xor     eax,eax
mov     rcx,qword ptr ss:[rsp+40]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
add     rsp,58
ret     
mov     rax,r8
jmp     oglmdi2_vs2019.13F13D945
call    oglmdi2_vs2019.13F129B94
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
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,30
mov     r11,rdx
lea     rsi,qword ptr ds:[13F120000]
and     r11d,F
mov     rdi,rdx
sub     rdi,r11
mov     rbx,rdx
mov     r8,rcx
xorps   xmm3,xmm3
lea     rax,qword ptr ds:[r11-1]
movdqu  xmm1,xmmword ptr ds:[rdi]
cmp     rax,E
ja      oglmdi2_vs2019.13F13DA1D
mov     eax,dword ptr ds:[rsi+rax*4+1DC94]
add     rax,rsi
jmp     rax
psrldq  xmm1,1
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,2
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,3
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,4
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,5
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,6
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,7
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,8
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,9
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,A
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,B
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,C
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,D
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,E
jmp     oglmdi2_vs2019.13F13DA1D
psrldq  xmm1,F
xorps   xmm0,xmm0
mov     edx,F
pcmpeqb xmm0,xmm1
pmovmskb eax,xmm0
test    eax,eax
je      oglmdi2_vs2019.13F13DB6D
bsf     r9d,eax
test    r11,r11
jne     oglmdi2_vs2019.13F13DA44
lea     r10d,dword ptr ds:[rdx-E]
jmp     oglmdi2_vs2019.13F13DA59
xor     r10d,r10d
mov     eax,r9d
mov     ecx,10
sub     rcx,r11
cmp     rax,rcx
setb    r10b
mov     eax,edx
sub     eax,r9d
cmp     eax,edx
ja      oglmdi2_vs2019.13F13DB35
mov     ecx,dword ptr ds:[rsi+rax*4+1DCD0]
add     rcx,rsi
jmp     rcx
pslldq  xmm1,1
psrldq  xmm1,1
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,2
psrldq  xmm1,2
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,3
psrldq  xmm1,3
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,4
psrldq  xmm1,4
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,5
psrldq  xmm1,5
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,6
psrldq  xmm1,6
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,7
psrldq  xmm1,7
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,8
psrldq  xmm1,8
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,9
psrldq  xmm1,9
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,A
psrldq  xmm1,A
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,B
psrldq  xmm1,B
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,C
psrldq  xmm1,C
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,D
psrldq  xmm1,D
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,E
psrldq  xmm1,E
jmp     oglmdi2_vs2019.13F13DB35
pslldq  xmm1,F
psrldq  xmm1,F
jmp     oglmdi2_vs2019.13F13DB35
xorps   xmm1,xmm1
test    r10d,r10d
jne     oglmdi2_vs2019.13F13DC2E
movdqu  xmm2,xmmword ptr ds:[rdi+10]
movdqa  xmm0,xmm2
pcmpeqb xmm0,xmm3
pmovmskb eax,xmm0
test    eax,eax
jne     oglmdi2_vs2019.13F13DB93
mov     rdx,rbx
mov     rcx,r8
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+48]
add     rsp,30
pop     rdi
jmp     oglmdi2_vs2019.13F13D8C4
test    r11,r11
jne     oglmdi2_vs2019.13F13DB3E
cmp     byte ptr ds:[rdi+1],r11b
je      oglmdi2_vs2019.13F13DC2E
mov     rdx,rbx
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+48]
add     rsp,30
pop     rdi
jmp     oglmdi2_vs2019.13F13D8C4
bsf     ecx,eax
mov     eax,ecx
sub     rax,r11
add     rax,10
cmp     rax,10
ja      oglmdi2_vs2019.13F13DB53
sub     edx,ecx
cmp     edx,F
ja      oglmdi2_vs2019.13F13DC26
mov     ecx,dword ptr ds:[rsi+rdx*4+1DD10]
add     rcx,rsi
mov     eax,edx
jmp     rcx
pslldq  xmm2,1
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,2
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,3
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,4
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,5
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,6
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,7
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,8
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,9
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,A
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,B
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,C
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,D
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,E
jmp     oglmdi2_vs2019.13F13DC26
pslldq  xmm2,F
jmp     oglmdi2_vs2019.13F13DC26
xorps   xmm2,xmm2
por     xmm2,xmm1
movdqa  xmm1,xmm2
movzx   eax,byte ptr ds:[r8]
test    al,al
je      oglmdi2_vs2019.13F13DC6C
nop     word ptr ds:[rax+rax]
movsx   eax,al
movd    xmm0,eax
punpcklbw xmm0,xmm0
punpcklbw xmm0,xmm0
pshufd  xmm0,xmm0,0
pcmpeqb xmm0,xmm1
pmovmskb eax,xmm0
test    eax,eax
jne     oglmdi2_vs2019.13F13DC7E
movzx   eax,byte ptr ds:[r8+1]
inc     r8
test    al,al
jne     oglmdi2_vs2019.13F13DC40
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+40]
mov     rsi,qword ptr ss:[rsp+48]
add     rsp,30
pop     rdi
ret     
mov     rbx,qword ptr ss:[rsp+40]
mov     rax,r8
mov     rsi,qword ptr ss:[rsp+48]
add     rsp,30
pop     rdi
ret     
nop     dword ptr ds:[rax]
mov     dh,D9
add     dword ptr ds:[rax],eax
mov     ebp,C40001D9
fld     dword ptr ds:[rcx]
add     bl,cl
fld     dword ptr ds:[rcx]
add     dl,dl
fld     dword ptr ds:[rcx]
add     cl,bl
fld     dword ptr ds:[rcx]
add     al,ah
fld     dword ptr ds:[rcx]
add     bh,ah
fld     dword ptr ds:[rcx]
add     dh,ch
fld     dword ptr ds:[rcx]
add     ch,dh
fld     dword ptr ds:[rcx]
add     ah,bh
fld     dword ptr ds:[rcx]
add     byte ptr ds:[rbx],al
fiadd   dword ptr ds:[rcx]
add     byte ptr ds:[rdx],cl
fiadd   dword ptr ds:[rcx]
add     byte ptr ds:[rcx],dl
fiadd   dword ptr ds:[rcx]
add     byte ptr ds:[rax],bl
fiadd   dword ptr ds:[rcx]
add     byte ptr ds:[rdx-26],dh
add     dword ptr ds:[rax],eax
sbb     edx,DA900001
add     dword ptr ds:[rax],eax
lahf    
fiadd   dword ptr ds:[rcx]
add     byte ptr ds:[rsi-45FFFE26],ch
fiadd   dword ptr ds:[rcx]
add     dh,al
fiadd   dword ptr ds:[rcx]
add     dl,dl
fiadd   dword ptr ds:[rcx]
add     dh,bl
fiadd   dword ptr ds:[rcx]
add     dl,ch
fiadd   dword ptr ds:[rcx]
add     dh,dh
fiadd   dword ptr ds:[rcx]
add     byte ptr ds:[rdx],al
fild    dword ptr ds:[rcx]
add     byte ptr ds:[rsi],cl
fild    dword ptr ds:[rcx]
add     byte ptr ds:[rdx],bl
fild    dword ptr ds:[rcx]
add     byte ptr ds:[rsi],ah
fild    dword ptr ds:[rcx]
add     byte ptr ds:[rdx],dh
fild    dword ptr ds:[rcx]
add     byte ptr ds:[rdx-3EFFFE25],bh
fild    dword ptr ds:[rcx]
add     al,cl
fild    dword ptr ds:[rcx]
add     bh,cl
fild    dword ptr ds:[rcx]
add     dh,dl
fild    dword ptr ds:[rcx]
add     ch,bl
fild    dword ptr ds:[rcx]
add     ah,ah
fild    dword ptr ds:[rcx]
add     bl,ch
fild    dword ptr ds:[rcx]
add     dl,dh
fild    dword ptr ds:[rcx]
add     cl,bh
fild    dword ptr ds:[rcx]
add     byte ptr ds:[rax],al
fadd    qword ptr ds:[rcx]
add     byte ptr ds:[rdi],al
fadd    qword ptr ds:[rcx]
add     byte ptr ds:[rsi],cl
fadd    qword ptr ds:[rcx]
add     byte ptr ds:[15B13DF25],dl
fadd    qword ptr ds:[rcx]
add     byte ptr ds:[rbx],ah
fadd    qword ptr ds:[rcx]
add     byte ptr ss:[rbp+33],al
shr     cl,0
add     byte ptr ds:[rax],al
add     byte ptr ds:[rax-77],cl
pop     rsp
and     al,8
push    rdi
sub     rsp,40
mov     rbx,rdx
mov     rdi,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F13DD81
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
xor     eax,eax
jmp     oglmdi2_vs2019.13F13DDE1
test    rbx,rbx
je      oglmdi2_vs2019.13F13DD6D
cmp     rdi,rbx
jae     oglmdi2_vs2019.13F13DD7D
mov     rdx,r8
lea     rcx,qword ptr ss:[rsp+20]
call    oglmdi2_vs2019.13F1301AC
mov     rcx,qword ptr ss:[rsp+30]
lea     rdx,qword ptr ds:[rbx-1]
cmp     dword ptr ds:[rcx+8],0
je      oglmdi2_vs2019.13F13DDCB
dec     rdx
cmp     rdi,rdx
ja      oglmdi2_vs2019.13F13DDB9
movzx   eax,byte ptr ds:[rdx]
test    byte ptr ds:[rax+rcx+19],4
jne     oglmdi2_vs2019.13F13DDA7
mov     rcx,rbx
sub     rcx,rdx
mov     rdx,rbx
and     ecx,1
sub     rdx,rcx
dec     rdx
cmp     byte ptr ss:[rsp+38],0
je      oglmdi2_vs2019.13F13DDDE
mov     rcx,qword ptr ss:[rsp+20]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
mov     rax,rdx
mov     rbx,qword ptr ss:[rsp+50]
add     rsp,40
pop     rdi
ret     
push    rbp
push    r12
push    r13
push    r14
push    r15
sub     rsp,60
lea     rbp,qword ptr ss:[rsp+50]
mov     qword ptr ss:[rbp+40],rbx
mov     qword ptr ss:[rbp+48],rsi
mov     qword ptr ss:[rbp+50],rdi
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rbp
mov     qword ptr ss:[rbp+8],rax
movsxd  rbx,dword ptr ss:[rbp+60]
mov     r15,r9
mov     qword ptr ss:[rbp],rdx
mov     r13d,r8d
mov     rdi,rcx
test    ebx,ebx
jle     oglmdi2_vs2019.13F13DE42
mov     rdx,rbx
mov     rcx,r9
call    oglmdi2_vs2019.13F13ED1C
cmp     eax,ebx
lea     ebx,dword ptr ds:[rax+1]
jl      oglmdi2_vs2019.13F13DE42
mov     ebx,eax
mov     r14d,dword ptr ss:[rbp+78]
test    r14d,r14d
jne     oglmdi2_vs2019.13F13DE52
mov     rax,qword ptr ds:[rdi]
mov     r14d,dword ptr ds:[rax+C]
neg     dword ptr ss:[rbp+80]
mov     r9d,ebx
mov     r8,r15
mov     ecx,r14d
sbb     edx,edx
and     dword ptr ss:[rsp+28],0
and     qword ptr ss:[rsp+20],0
and     edx,8
inc     edx
call    oglmdi2_vs2019.13F138AA0
movsxd  r12,eax
test    eax,eax
je      oglmdi2_vs2019.13F13E0B9
mov     rax,r12
movabs  r8,FFFFFFFFFFFFFF0
add     rax,rax
lea     rcx,qword ptr ds:[rax+10]
cmp     rax,rcx
sbb     rdx,rdx
and     rdx,rcx
je      oglmdi2_vs2019.13F13DEF5
cmp     rdx,400
ja      oglmdi2_vs2019.13F13DED9
lea     rax,qword ptr ds:[rdx+F]
cmp     rax,rdx
ja      oglmdi2_vs2019.13F13DEB7
mov     rax,r8
and     rax,FFFFFFFFFFFFFFF0
call    oglmdi2_vs2019.13F13F420
sub     rsp,rax
lea     rsi,qword ptr ss:[rsp+50]
test    rsi,rsi
je      oglmdi2_vs2019.13F13E09F
mov     dword ptr ds:[rsi],CCCC
jmp     oglmdi2_vs2019.13F13DEEF
mov     rcx,rdx
call    oglmdi2_vs2019.13F134230
mov     rsi,rax
test    rax,rax
je      oglmdi2_vs2019.13F13DEF7
mov     dword ptr ds:[rax],DDDD
add     rsi,10
jmp     oglmdi2_vs2019.13F13DEF7
xor     esi,esi
test    rsi,rsi
je      oglmdi2_vs2019.13F13E09F
mov     dword ptr ss:[rsp+28],r12d
mov     r9d,ebx
mov     r8,r15
mov     qword ptr ss:[rsp+20],rsi
mov     edx,1
mov     ecx,r14d
call    oglmdi2_vs2019.13F138AA0
test    eax,eax
je      oglmdi2_vs2019.13F13E09F
and     qword ptr ss:[rsp+40],0
mov     r9d,r12d
and     qword ptr ss:[rsp+38],0
mov     r8,rsi
and     qword ptr ss:[rsp+30],0
mov     edx,r13d
mov     r15,qword ptr ss:[rbp]
and     dword ptr ss:[rsp+28],0
mov     rcx,r15
and     qword ptr ss:[rsp+20],0
call    oglmdi2_vs2019.13F13357C
movsxd  rdi,eax
test    eax,eax
je      oglmdi2_vs2019.13F13E09F
mov     edx,400
test    edx,r13d
je      oglmdi2_vs2019.13F13DFBE
mov     eax,dword ptr ss:[rbp+70]
test    eax,eax
je      oglmdi2_vs2019.13F13E0A1
cmp     edi,eax
jg      oglmdi2_vs2019.13F13E09F
and     qword ptr ss:[rsp+40],0
mov     r9d,r12d
and     qword ptr ss:[rsp+38],0
mov     r8,rsi
and     qword ptr ss:[rsp+30],0
mov     edx,r13d
mov     dword ptr ss:[rsp+28],eax
mov     rcx,r15
mov     rax,qword ptr ss:[rbp+68]
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F13357C
mov     edi,eax
test    eax,eax
jne     oglmdi2_vs2019.13F13E0A1
jmp     oglmdi2_vs2019.13F13E09F
mov     rcx,rdi
add     rcx,rcx
lea     rax,qword ptr ds:[rcx+10]
cmp     rcx,rax
sbb     rcx,rcx
and     rcx,rax
je      oglmdi2_vs2019.13F13E026
cmp     rcx,rdx
ja      oglmdi2_vs2019.13F13E00D
lea     rax,qword ptr ds:[rcx+F]
cmp     rax,rcx
ja      oglmdi2_vs2019.13F13DFEB
movabs  rax,FFFFFFFFFFFFFF0
and     rax,FFFFFFFFFFFFFFF0
call    oglmdi2_vs2019.13F13F420
sub     rsp,rax
lea     rbx,qword ptr ss:[rsp+50]
test    rbx,rbx
je      oglmdi2_vs2019.13F13E09F
mov     dword ptr ds:[rbx],CCCC
jmp     oglmdi2_vs2019.13F13E020
call    oglmdi2_vs2019.13F134230
mov     rbx,rax
test    rax,rax
je      oglmdi2_vs2019.13F13E028
mov     dword ptr ds:[rax],DDDD
add     rbx,10
jmp     oglmdi2_vs2019.13F13E028
xor     ebx,ebx
test    rbx,rbx
je      oglmdi2_vs2019.13F13E09F
and     qword ptr ss:[rsp+40],0
mov     r9d,r12d
and     qword ptr ss:[rsp+38],0
mov     r8,rsi
and     qword ptr ss:[rsp+30],0
mov     edx,r13d
mov     dword ptr ss:[rsp+28],edi
mov     rcx,r15
mov     qword ptr ss:[rsp+20],rbx
call    oglmdi2_vs2019.13F13357C
test    eax,eax
je      oglmdi2_vs2019.13F13E08E
and     qword ptr ss:[rsp+38],0
xor     edx,edx
and     qword ptr ss:[rsp+30],rdx
mov     r9d,edi
mov     eax,dword ptr ss:[rbp+70]
mov     r8,rbx
mov     ecx,r14d
test    eax,eax
jne     oglmdi2_vs2019.13F13E0DF
and     dword ptr ss:[rsp+28],edx
and     qword ptr ss:[rsp+20],rdx
call    oglmdi2_vs2019.13F138AFC
mov     edi,eax
test    eax,eax
jne     oglmdi2_vs2019.13F13E0EE
lea     rcx,qword ptr ds:[rbx-10]
cmp     dword ptr ds:[rcx],DDDD
jne     oglmdi2_vs2019.13F13E09F
call    oglmdi2_vs2019.13F133148
xor     edi,edi
test    rsi,rsi
je      oglmdi2_vs2019.13F13E0B7
lea     rcx,qword ptr ds:[rsi-10]
cmp     dword ptr ds:[rcx],DDDD
jne     oglmdi2_vs2019.13F13E0B7
call    oglmdi2_vs2019.13F133148
mov     eax,edi
mov     rcx,qword ptr ss:[rbp+8]
xor     rcx,rbp
call    oglmdi2_vs2019.13F129910
mov     rbx,qword ptr ss:[rbp+40]
mov     rsi,qword ptr ss:[rbp+48]
mov     rdi,qword ptr ss:[rbp+50]
lea     rsp,qword ptr ss:[rbp+10]
pop     r15
pop     r14
pop     r13
pop     r12
pop     rbp
ret     
mov     dword ptr ss:[rsp+28],eax
mov     rax,qword ptr ss:[rbp+68]
mov     qword ptr ss:[rsp+20],rax
jmp     oglmdi2_vs2019.13F13E083
lea     rcx,qword ptr ds:[rbx-10]
cmp     dword ptr ds:[rcx],DDDD
jne     oglmdi2_vs2019.13F13E0A1
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F13E0A1
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
mov     qword ptr ss:[rsp+10],rsi
push    rdi
sub     rsp,70
mov     rsi,rdx
mov     rbx,r9
mov     rdx,rcx
mov     edi,r8d
lea     rcx,qword ptr ss:[rsp+50]
call    oglmdi2_vs2019.13F1301AC
mov     eax,dword ptr ss:[rsp+C0]
lea     rcx,qword ptr ss:[rsp+58]
mov     dword ptr ss:[rsp+40],eax
mov     r9,rbx
mov     eax,dword ptr ss:[rsp+B8]
mov     r8d,edi
mov     dword ptr ss:[rsp+38],eax
mov     rdx,rsi
mov     eax,dword ptr ss:[rsp+B0]
mov     dword ptr ss:[rsp+30],eax
mov     rax,qword ptr ss:[rsp+A8]
mov     qword ptr ss:[rsp+28],rax
mov     eax,dword ptr ss:[rsp+A0]
mov     dword ptr ss:[rsp+20],eax
call    oglmdi2_vs2019.13F13DDEC
cmp     byte ptr ss:[rsp+68],0
je      oglmdi2_vs2019.13F13E188
mov     rcx,qword ptr ss:[rsp+50]
and     dword ptr ds:[rcx+3A8],FFFFFFFD
lea     r11,qword ptr ss:[rsp+70]
mov     rbx,qword ptr ds:[r11+10]
mov     rsi,qword ptr ds:[r11+18]
mov     rsp,r11
pop     rdi
ret     
int3    
int3    
sub     rsp,28
call    oglmdi2_vs2019.13F1386B4
xor     ecx,ecx
test    al,al
sete    cl
mov     eax,ecx
add     rsp,28
ret     
int3    
sub     rsp,28
test    rcx,rcx
jne     oglmdi2_vs2019.13F13E1D6
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],16
call    oglmdi2_vs2019.13F132F90
or      rax,FFFFFFFFFFFFFFFF
add     rsp,28
ret     
mov     r8,rcx
xor     edx,edx
mov     rcx,qword ptr ds:[13F14E318]
add     rsp,28
jmp     qword ptr ds:[<&RtlSizeHeap>]
int3    
int3    
int3    
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rbx,rdx
mov     rdi,rcx
test    rcx,rcx
jne     oglmdi2_vs2019.13F13E20F
mov     rcx,rdx
call    oglmdi2_vs2019.13F134230
jmp     oglmdi2_vs2019.13F13E22E
test    rbx,rbx
jne     oglmdi2_vs2019.13F13E21B
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F13E22C
cmp     rbx,FFFFFFFFFFFFFFE0
jbe     oglmdi2_vs2019.13F13E24E
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],C
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
call    oglmdi2_vs2019.13F13225C
test    eax,eax
je      oglmdi2_vs2019.13F13E221
mov     rcx,rbx
call    oglmdi2_vs2019.13F132814
test    eax,eax
je      oglmdi2_vs2019.13F13E221
mov     rcx,qword ptr ds:[13F14E318]
mov     r9,rbx
mov     r8,rdi
xor     edx,edx
call    qword ptr ds:[<&RtlReAllocateHeap>]
test    rax,rax
je      oglmdi2_vs2019.13F13E239
jmp     oglmdi2_vs2019.13F13E22E
int3    
int3    
mov     word ptr ss:[rsp+8],cx
sub     rsp,28
call    oglmdi2_vs2019.13F13ED34
test    eax,eax
je      oglmdi2_vs2019.13F13E29D
lea     r8,qword ptr ss:[rsp+38]
mov     edx,1
lea     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F13EDA4
test    eax,eax
je      oglmdi2_vs2019.13F13E29D
movzx   eax,word ptr ss:[rsp+30]
jmp     oglmdi2_vs2019.13F13E2A2
mov     eax,FFFF
add     rsp,28
ret     
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r12
push    r14
push    r15
sub     rsp,20
mov     rbx,rdx
mov     r14d,1
mov     r8d,r14d
xor     edx,edx
mov     ebp,ecx
call    oglmdi2_vs2019.13F13B54C
xor     edx,edx
lea     r8d,dword ptr ds:[r14+1]
mov     ecx,ebp
mov     r15,rax
call    oglmdi2_vs2019.13F13B54C
mov     rsi,rbx
sub     rsi,rax
cmp     r15,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13E3DF
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13E3DF
xor     edi,edi
test    rsi,rsi
jle     oglmdi2_vs2019.13F13E39B
mov     r12d,1000
mov     edx,r14d
mov     ecx,r12d
call    oglmdi2_vs2019.13F1330D0
mov     rbx,rax
test    rax,rax
jne     oglmdi2_vs2019.13F13E335
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],C
jmp     oglmdi2_vs2019.13F13E37E
mov     edx,8000
mov     ecx,ebp
call    oglmdi2_vs2019.13F132064
mov     r14d,eax
jmp     oglmdi2_vs2019.13F13E350
cdqe    
sub     rsi,rax
test    rsi,rsi
jle     oglmdi2_vs2019.13F13E38F
mov     r8d,esi
cmp     rsi,r12
mov     rdx,rbx
mov     ecx,ebp
cmovge  r8d,r12d
call    oglmdi2_vs2019.13F13A618
cmp     eax,FFFFFFFF
jne     oglmdi2_vs2019.13F13E346
call    oglmdi2_vs2019.13F133090
cmp     dword ptr ds:[rax],5
jne     oglmdi2_vs2019.13F13E37E
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],D
call    oglmdi2_vs2019.13F1330B0
mov     edi,dword ptr ds:[rax]
mov     rcx,rbx
call    oglmdi2_vs2019.13F133148
jmp     oglmdi2_vs2019.13F13E3E6
mov     edx,r14d
mov     ecx,ebp
call    oglmdi2_vs2019.13F132064
jmp     oglmdi2_vs2019.13F13E385
jns     oglmdi2_vs2019.13F13E3E6
xor     r8d,r8d
mov     rdx,rbx
mov     ecx,ebp
call    oglmdi2_vs2019.13F13B54C
cmp     rax,FFFFFFFFFFFFFFFF
je      oglmdi2_vs2019.13F13E3DF
mov     ecx,ebp
call    oglmdi2_vs2019.13F12EC30
mov     rcx,rax
call    qword ptr ds:[<&SetEndOfFile>]
test    eax,eax
jne     oglmdi2_vs2019.13F13E3E6
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],D
call    oglmdi2_vs2019.13F133090
mov     rbx,rax
call    qword ptr ds:[<&GetLastError>]
mov     dword ptr ds:[rbx],eax
call    oglmdi2_vs2019.13F1330B0
mov     edi,dword ptr ds:[rax]
xor     r8d,r8d
mov     rdx,r15
mov     ecx,ebp
call    oglmdi2_vs2019.13F13B54C
mov     rbx,qword ptr ss:[rsp+40]
mov     eax,edi
mov     rdi,qword ptr ss:[rsp+58]
mov     rbp,qword ptr ss:[rsp+48]
mov     rsi,qword ptr ss:[rsp+50]
add     rsp,20
pop     r15
pop     r14
pop     r12
ret     
mov     qword ptr ss:[rsp+10],rbx
push    rbp
push    rsi
push    rdi
push    r14
push    r15
sub     rsp,40
mov     rax,qword ptr ds:[13F14C058]
xor     rax,rsp
mov     qword ptr ss:[rsp+30],rax
xor     r10d,r10d
lea     r11,qword ptr ds:[13F14E348]
test    r9,r9
lea     rdi,qword ptr ds:[13F141912]
mov     rax,rdx
mov     r15,rdx
cmovne  r11,r9
test    rdx,rdx
lea     ebp,dword ptr ds:[r10+1]
cmovne  rdi,rdx
mov     r14d,ebp
cmovne  r14,r8
neg     rax
sbb     rsi,rsi
and     rsi,rcx
test    r14,r14
jne     oglmdi2_vs2019.13F13E47D
mov     rax,FFFFFFFFFFFFFFFE
jmp     oglmdi2_vs2019.13F13E5D2
cmp     word ptr ds:[r11+6],r10w
jne     oglmdi2_vs2019.13F13E4F1
mov     r9b,byte ptr ds:[rdi]
inc     rdi
test    r9b,r9b
js      oglmdi2_vs2019.13F13E4A9
test    rsi,rsi
je      oglmdi2_vs2019.13F13E49A
movzx   ecx,r9b
mov     dword ptr ds:[rsi],ecx
test    r9b,r9b
setne   r10b
mov     rax,r10
jmp     oglmdi2_vs2019.13F13E5D2
mov     al,r9b
and     al,E0
cmp     al,C0
jne     oglmdi2_vs2019.13F13E4B7
mov     r8b,2
jmp     oglmdi2_vs2019.13F13E4D5
mov     al,r9b
and     al,F0
cmp     al,E0
jne     oglmdi2_vs2019.13F13E4C5
mov     r8b,3
jmp     oglmdi2_vs2019.13F13E4D5
mov     al,r9b
and     al,F8
cmp     al,F0
jne     oglmdi2_vs2019.13F13E5C0
mov     r8b,4
movzx   eax,r8b
mov     ecx,7
sub     ecx,eax
mov     edx,ebp
shl     edx,cl
mov     bl,r8b
sub     edx,ebp
movzx   eax,r9b
and     edx,eax
jmp     oglmdi2_vs2019.13F13E51A
mov     r8b,byte ptr ds:[r11+4]
mov     edx,dword ptr ds:[r11]
mov     bl,byte ptr ds:[r11+6]
lea     eax,dword ptr ds:[r8-2]
cmp     al,2
ja      oglmdi2_vs2019.13F13E5C0
cmp     bl,bpl
jb      oglmdi2_vs2019.13F13E5C0
cmp     bl,r8b
jae     oglmdi2_vs2019.13F13E5C0
movzx   ebp,bl
cmp     rbp,r14
mov     r9d,ebp
cmovae  r9,r14
jmp     oglmdi2_vs2019.13F13E549
mov     cl,byte ptr ds:[rdi]
inc     rdi
mov     al,cl
and     al,C0
cmp     al,80
jne     oglmdi2_vs2019.13F13E5C0
mov     eax,edx
movzx   ecx,cl
and     ecx,3F
shl     eax,6
mov     edx,ecx
or      edx,eax
mov     rax,rdi
sub     rax,r15
cmp     rax,r9
jb      oglmdi2_vs2019.13F13E529
cmp     r9,rbp
jae     oglmdi2_vs2019.13F13E575
movzx   eax,r8b
sub     bl,r9b
mov     word ptr ds:[r11+4],ax
movzx   eax,bl
mov     word ptr ds:[r11+6],ax
mov     dword ptr ds:[r11],edx
jmp     oglmdi2_vs2019.13F13E471
lea     eax,dword ptr ds:[rdx-D800]
cmp     eax,7FF
jbe     oglmdi2_vs2019.13F13E5C0
cmp     edx,110000
jae     oglmdi2_vs2019.13F13E5C0
movzx   eax,r8b
mov     dword ptr ss:[rsp+20],80
mov     dword ptr ss:[rsp+24],800
mov     dword ptr ss:[rsp+28],10000
cmp     edx,dword ptr ss:[rsp+rax*4+18]
jb      oglmdi2_vs2019.13F13E5C0
test    rsi,rsi
je      oglmdi2_vs2019.13F13E5B3
mov     dword ptr ds:[rsi],edx
neg     edx
mov     qword ptr ds:[r11],r10
sbb     rax,rax
and     rax,rbp
jmp     oglmdi2_vs2019.13F13E5D2
mov     qword ptr ds:[r11],r10
call    oglmdi2_vs2019.13F1330B0
mov     dword ptr ds:[rax],2A
or      rax,FFFFFFFFFFFFFFFF
mov     rcx,qword ptr ss:[rsp+30]
xor     rcx,rsp
call    oglmdi2_vs2019.13F129910
mov     rbx,qword ptr ss:[rsp+78]
add     rsp,40
pop     r15
pop     r14
pop     rdi
pop     rsi
pop     rbp
ret     
push    rbx
sub     rsp,20
mov     rbx,rcx
call    oglmdi2_vs2019.13F13EE64
mov     dword ptr ds:[rbx],eax
call    oglmdi2_vs2019.13F13EF58
mov     dword ptr ds:[rbx+4],eax
xor     eax,eax
add     rsp,20
pop     rbx
ret     
push    rbx
sub     rsp,20
mov     rbx,rcx
mov     ecx,dword ptr ds:[rcx]
call    oglmdi2_vs2019.13F13EFAC
mov     ecx,dword ptr ds:[rbx+4]
call    oglmdi2_vs2019.13F13F0F4
and     qword ptr ss:[rsp+30],0
lea     rcx,qword ptr ss:[rsp+30]
call    oglmdi2_vs2019.13F13E5F0
test    eax,eax
jne     oglmdi2_vs2019.13F13E651
mov     eax,dword ptr ss:[rsp+30]
cmp     dword ptr ds:[rbx],eax
jne     oglmdi2_vs2019.13F13E651
mov     eax,dword ptr ss:[rsp+34]
cmp     dword ptr ds:[rbx+4],eax
jne     oglmdi2_vs2019.13F13E651
xor     eax,eax
jmp     oglmdi2_vs2019.13F13E656
mov     eax,1
add     rsp,20
pop     rbx
ret     
push    rbx
sub     rsp,20
and     dword ptr ss:[rsp+38],0
mov     rbx,rcx
and     dword ptr ss:[rsp+3C],0
lea     rcx,qword ptr ss:[rsp+38]
call    oglmdi2_vs2019.13F13E5F0
test    eax,eax
jne     oglmdi2_vs2019.13F13E6A1
mov     rax,qword ptr ss:[rsp+38]
lea     rcx,qword ptr ss:[rsp+38]
or      dword ptr ss:[rsp+38],1F
mov     qword ptr ds:[rbx],rax
call    oglmdi2_vs2019.13F13E610
test    eax,eax
jne     oglmdi2_vs2019.13F13E6A1
call    oglmdi2_vs2019.13F13F178
xor     eax,eax
jmp     oglmdi2_vs2019.13F13E6A6
mov     eax,1
add     rsp,20
pop     rbx
ret     
xor     r8d,r8d
movsd   qword ptr ss:[rsp+8],xmm0
mov     rdx,qword ptr ss:[rsp+8]
movabs  rcx,7FFFFFFFFFFFFFFF
mov     rax,rdx
and     rax,rcx
movabs  rcx,4340000000000000
cmp     rdx,rax
setne   r8b
cmp     rax,rcx
jb      oglmdi2_vs2019.13F13E6F7
movabs  rcx,7FF0000000000000
cmp     rax,rcx
jbe     oglmdi2_vs2019.13F13E76D
mov     rcx,rdx
jmp     oglmdi2_vs2019.13F135AAC
movabs  rcx,3FF0000000000000
cmp     rax,rcx
jae     oglmdi2_vs2019.13F13E731
test    rax,rax
je      oglmdi2_vs2019.13F13E76D
test    r8,r8
je      oglmdi2_vs2019.13F13E727
movabs  rax,8000000000000000
mov     qword ptr ss:[rsp+8],rax
movsd   xmm0,qword ptr ss:[rsp+8]
jmp     oglmdi2_vs2019.13F13E76D
movsd   xmm0,qword ptr ds:[13F140750]
jmp     oglmdi2_vs2019.13F13E76D
mov     rax,rdx
mov     ecx,33
shr     rax,34
sub     cl,al
mov     eax,1
shl     rax,cl
dec     rax
not     rax
and     rax,rdx
mov     qword ptr ss:[rsp+8],rax
movsd   xmm0,qword ptr ss:[rsp+8]
test    r8,r8
jne     oglmdi2_vs2019.13F13E76D
cmp     rax,rdx
je      oglmdi2_vs2019.13F13E76D
addsd   xmm0,qword ptr ds:[13F140750]
ret     
int3    
int3    
sub     rsp,58
movdqa  xmmword ptr ss:[rsp+20],xmm6
cmp     dword ptr ds:[13F14E288],0
jne     oglmdi2_vs2019.13F13EA70
movapd  xmm3,xmm0
movapd  xmm4,xmm0
psrlq   xmm3,34
movq    rax,xmm0
psubq   xmm3,xmmword ptr ds:[13F147A20]
movapd  xmm5,xmm0
andpd   xmm5,xmmword ptr ds:[13F1479F0]
comisd  xmm5,xmmword ptr ds:[13F1479F0]
je      oglmdi2_vs2019.13F13EA40
movapd  xmm2,xmm0
cvtdq2pd xmm6,xmm3
xorpd   xmm5,xmm5
comisd  xmm0,xmm5
jbe     oglmdi2_vs2019.13F13EA00
pand    xmm2,xmmword ptr ds:[13F147A40]
subsd   xmm4,qword ptr ds:[13F147AD0]
comisd  xmm6,xmmword ptr ds:[13F147B60]
je      oglmdi2_vs2019.13F13E9C7
andpd   xmm4,xmmword ptr ds:[13F147BC0]
mov     r9,rax
and     rax,qword ptr ds:[13F147A50]
and     r9,qword ptr ds:[13F147A60]
shl     r9,1
add     rax,r9
movq    xmm1,rax
comisd  xmm4,xmmword ptr ds:[13F147B80]
jb      oglmdi2_vs2019.13F13E900
shr     rax,2C
por     xmm2,xmmword ptr ds:[13F147AE0]
por     xmm1,xmmword ptr ds:[13F147AE0]
lea     r9,qword ptr ds:[13F148C60]
subsd   xmm1,xmm2
mulsd   xmm1,qword ptr ds:[r9+rax*8]
movapd  xmm2,xmm1
movapd  xmm0,xmm1
lea     r9,qword ptr ds:[13F147C40]
movsd   xmm3,qword ptr ds:[13F147B50]
movsd   xmm1,qword ptr ds:[13F147B20]
mulsd   xmm3,xmm2
mulsd   xmm1,xmm2
mulsd   xmm0,xmm2
movapd  xmm4,xmm0
addsd   xmm3,qword ptr ds:[13F147B40]
addsd   xmm1,qword ptr ds:[13F147B10]
mulsd   xmm4,xmm0
mulsd   xmm3,xmm2
mulsd   xmm1,xmm0
addsd   xmm3,qword ptr ds:[13F147B30]
addsd   xmm1,xmm2
mulsd   xmm3,xmm4
addsd   xmm1,xmm3
movsd   xmm5,qword ptr ds:[13F147AB0]
mulsd   xmm1,qword ptr ds:[13F147A70]
mulsd   xmm5,xmm6
subsd   xmm5,xmm1
movsd   xmm0,qword ptr ds:[r9+rax*8]
lea     rdx,qword ptr ds:[13F148450]
movsd   xmm2,qword ptr ds:[rdx+rax*8]
movsd   xmm4,qword ptr ds:[13F147AA0]
mulsd   xmm4,xmm6
addsd   xmm0,xmm4
addsd   xmm2,xmm5
addsd   xmm0,xmm2
movdqa  xmm6,xmmword ptr ss:[rsp+20]
add     rsp,58
ret     
nop     word ptr ds:[rax+rax]
movsd   xmm2,qword ptr ds:[13F147AC0]
subsd   xmm0,qword ptr ds:[13F147AD0]
addsd   xmm2,xmm0
movapd  xmm1,xmm0
divsd   xmm1,xmm2
movsd   xmm4,qword ptr ds:[13F147BE0]
movsd   xmm5,qword ptr ds:[13F147C00]
movapd  xmm6,xmm0
mulsd   xmm6,xmm1
addsd   xmm1,xmm1
movapd  xmm2,xmm1
mulsd   xmm2,xmm1
mulsd   xmm4,xmm2
mulsd   xmm5,xmm2
addsd   xmm4,qword ptr ds:[13F147BD0]
addsd   xmm5,qword ptr ds:[13F147BF0]
mulsd   xmm2,xmm1
mulsd   xmm4,xmm2
mulsd   xmm2,xmm2
mulsd   xmm2,xmm1
mulsd   xmm5,xmm2
movsd   xmm2,qword ptr ds:[13F147A90]
addsd   xmm4,xmm5
subsd   xmm4,xmm6
movsd   xmm6,qword ptr ds:[13F147A80]
movapd  xmm3,xmm0
pand    xmm3,xmmword ptr ds:[13F147C10]
subsd   xmm0,xmm3
addsd   xmm4,xmm0
movapd  xmm0,xmm3
movapd  xmm1,xmm4
mulsd   xmm4,xmm2
mulsd   xmm0,xmm2
mulsd   xmm1,xmm6
mulsd   xmm3,xmm6
addsd   xmm0,xmm4
addsd   xmm0,xmm1
addsd   xmm0,xmm3
movdqa  xmm6,xmmword ptr ss:[rsp+20]
add     rsp,58
ret     
por     xmm2,xmmword ptr ds:[13F147AD0]
subsd   xmm2,qword ptr ds:[13F147AD0]
movsd   xmm5,xmm2
pand    xmm2,xmmword ptr ds:[13F147A40]
movq    rax,xmm2
psrlq   xmm5,34
psubd   xmm5,xmmword ptr ds:[13F147B70]
cvtdq2pd xmm6,xmm5
jmp     oglmdi2_vs2019.13F13E7EF
nop     
jne     oglmdi2_vs2019.13F13EA20
movsd   xmm1,qword ptr ds:[13F1479E0]
mov     r8d,dword ptr ds:[13F147C20]
call    oglmdi2_vs2019.13F13F1F0
jmp     oglmdi2_vs2019.13F13EA60
nop     dword ptr ds:[rax+rax]
movsd   xmm1,qword ptr ds:[13F147A00]
mov     r8d,dword ptr ds:[13F147C24]
call    oglmdi2_vs2019.13F13F1F0
jmp     oglmdi2_vs2019.13F13EA60
nop     word ptr ds:[rax+rax]
cmp     rax,qword ptr ds:[13F1479F0]
je      oglmdi2_vs2019.13F13EA60
cmp     rax,qword ptr ds:[13F1479E0]
je      oglmdi2_vs2019.13F13EA20
or      rax,qword ptr ds:[13F147A10]
movq    xmm0,rax
nop     
movdqa  xmm6,xmmword ptr ss:[rsp+20]
add     rsp,58
ret     
nop     dword ptr ds:[rax+rax]
xor     rax,rax
vpsrlq  xmm3,xmm0,34
vmovq   rax,xmm0
vpsubq  xmm3,xmm3,xmmword ptr ds:[13F147A20]
vcvtdq2pd xmm6,xmm3
vpand   xmm5,xmm0,xmmword ptr ds:[13F1479F0]
vcomisd xmm5,xmmword ptr ds:[13F1479F0]
je      oglmdi2_vs2019.13F13ECE0
vpxor   xmm5,xmm5,xmm5
vcomisd xmm0,xmm5
jbe     oglmdi2_vs2019.13F13EC90
vpand   xmm2,xmm0,xmmword ptr ds:[13F147A40]
vsubsd  xmm4,xmm0,qword ptr ds:[13F147AD0]
vcomisd xmm6,xmmword ptr ds:[13F147B60]
je      oglmdi2_vs2019.13F13EC59
vpand   xmm1,xmm0,xmmword ptr ds:[13F147A50]
vpand   xmm3,xmm0,xmmword ptr ds:[13F147A60]
vpsllq  xmm3,xmm3,1
vpaddq  xmm1,xmm3,xmm1
vmovq   rax,xmm1
vpand   xmm4,xmm4,xmmword ptr ds:[13F147BC0]
vcomisd xmm4,xmmword ptr ds:[13F147B80]
jb      oglmdi2_vs2019.13F13EBB0
shr     rax,2C
vpor    xmm2,xmm2,xmmword ptr ds:[13F147AE0]
vpor    xmm1,xmm1,xmmword ptr ds:[13F147AE0]
lea     r9,qword ptr ds:[13F148C60]
vsubsd  xmm1,xmm1,xmm2
vmulsd  xmm1,xmm1,qword ptr ds:[r9+rax*8]
lea     r9,qword ptr ds:[13F147C40]
vmulsd  xmm0,xmm1,xmm1
vmovsd  xmm3,qword ptr ds:[13F147B50]
vmovsd  xmm5,qword ptr ds:[13F147B20]
vfmadd213sd xmm3,xmm1,qword ptr ds:[13F147B40]
vfmadd213sd xmm5,xmm1,qword ptr ds:[13F147AE0]
movsd   xmm4,xmm0
vfmadd213sd xmm3,xmm1,qword ptr ds:[13F147B30]
vmulsd  xmm4,xmm0,xmm0
vfmadd231sd xmm1,xmm5,xmm0
vfmadd231sd xmm1,xmm3,xmm4
vmulsd  xmm1,xmm1,qword ptr ds:[13F147A70]
vmovsd  xmm5,qword ptr ds:[13F147AB0]
vfmsub213sd xmm5,xmm6,xmm1
movsd   xmm0,qword ptr ds:[r9+rax*8]
lea     rdx,qword ptr ds:[13F148450]
movsd   xmm2,qword ptr ds:[rdx+rax*8]
vaddsd  xmm2,xmm2,xmm5
vfmadd231sd xmm0,xmm6,qword ptr ds:[13F147AA0]
vaddsd  xmm0,xmm0,xmm2
vmovdqa xmm6,xmmword ptr ss:[rsp+20]
add     rsp,58
ret     
nop     
vmovsd  xmm2,qword ptr ds:[13F147AC0]
vsubsd  xmm0,xmm0,qword ptr ds:[13F147AD0]
vaddsd  xmm2,xmm2,xmm0
vdivsd  xmm1,xmm0,xmm2
vmovsd  xmm4,qword ptr ds:[13F147BE0]
vmovsd  xmm5,qword ptr ds:[13F147C00]
vmulsd  xmm6,xmm0,xmm1
vaddsd  xmm1,xmm1,xmm1
vmulsd  xmm2,xmm1,xmm1
vfmadd213sd xmm4,xmm2,qword ptr ds:[13F147BD0]
vfmadd213sd xmm5,xmm2,qword ptr ds:[13F147BF0]
vmulsd  xmm2,xmm2,xmm1
vmulsd  xmm4,xmm4,xmm2
vmulsd  xmm2,xmm2,xmm2
vmulsd  xmm2,xmm2,xmm1
vmulsd  xmm5,xmm5,xmm2
vaddsd  xmm4,xmm4,xmm5
vsubsd  xmm4,xmm4,xmm6
vpand   xmm3,xmm0,xmmword ptr ds:[13F147C10]
vsubsd  xmm0,xmm0,xmm3
vaddsd  xmm4,xmm4,xmm0
vmulsd  xmm1,xmm4,qword ptr ds:[13F147A80]
vmulsd  xmm4,xmm4,qword ptr ds:[13F147A90]
vmulsd  xmm0,xmm3,qword ptr ds:[13F147A90]
vmulsd  xmm3,xmm3,qword ptr ds:[13F147A80]
vaddsd  xmm0,xmm0,xmm4
vaddsd  xmm0,xmm0,xmm1
vaddsd  xmm0,xmm0,xmm3
vmovdqa xmm6,xmmword ptr ss:[rsp+20]
add     rsp,58
ret     
vpor    xmm2,xmm2,xmmword ptr ds:[13F147AD0]
vsubsd  xmm2,xmm2,qword ptr ds:[13F147AD0]
vpsrlq  xmm5,xmm2,34
vpand   xmm2,xmm2,xmmword ptr ds:[13F147A40]
vmovapd xmm0,xmm2
vpsubd  xmm5,xmm5,xmmword ptr ds:[13F147B70]
vcvtdq2pd xmm6,xmm5
jmp     oglmdi2_vs2019.13F13EACB
nop     dword ptr ds:[rax+rax]
jne     oglmdi2_vs2019.13F13ECC0
vmovsd  xmm1,qword ptr ds:[13F1479E0]
mov     r8d,dword ptr ds:[13F147C20]
call    oglmdi2_vs2019.13F13F1F0
vmovdqa xmm6,xmmword ptr ss:[rsp+20]
add     rsp,58
ret     
nop     word ptr ds:[rax+rax]
vmovsd  xmm1,qword ptr ds:[13F147A00]
mov     r8d,dword ptr ds:[13F147C24]
call    oglmdi2_vs2019.13F13F1F0
vmovdqa xmm6,xmmword ptr ss:[rsp+20]
add     rsp,58
ret     
nop     
cmp     rax,qword ptr ds:[13F1479F0]
je      oglmdi2_vs2019.13F13ED10
cmp     rax,qword ptr ds:[13F1479E0]
je      oglmdi2_vs2019.13F13ECC0
or      rax,qword ptr ds:[13F147A10]
movq    xmm1,rax
mov     r8d,dword ptr ds:[13F147C28]
call    oglmdi2_vs2019.13F13F1F0
jmp     oglmdi2_vs2019.13F13ED10
nop     dword ptr ds:[rax]
vmovdqa xmm6,xmmword ptr ss:[rsp+20]
add     rsp,58
ret     
int3    
xor     eax,eax
cmp     byte ptr ds:[rcx],al
je      oglmdi2_vs2019.13F13ED30
cmp     rax,rdx
je      oglmdi2_vs2019.13F13ED30
inc     rax
cmp     byte ptr ds:[rax+rcx],0
jne     oglmdi2_vs2019.13F13ED22
ret     
int3    
int3    
int3    
push    rbx
sub     rsp,40
mov     rax,qword ptr ds:[13F14CA90]
xor     ebx,ebx
cmp     rax,FFFFFFFFFFFFFFFE
jne     oglmdi2_vs2019.13F13ED77
mov     qword ptr ss:[rsp+30],rbx
lea     r8d,dword ptr ds:[rbx+3]
mov     dword ptr ss:[rsp+28],ebx
lea     rcx,qword ptr ds:[13F147C30]
xor     r9d,r9d
mov     dword ptr ss:[rsp+20],r8d
mov     edx,40000000
call    qword ptr ds:[<&CreateFileW>]
mov     qword ptr ds:[13F14CA90],rax
cmp     rax,FFFFFFFFFFFFFFFF
setne   bl
mov     eax,ebx
add     rsp,40
pop     rbx
ret     
int3    
int3    
sub     rsp,28
mov     rcx,qword ptr ds:[13F14CA90]
cmp     rcx,FFFFFFFFFFFFFFFD
ja      oglmdi2_vs2019.13F13ED9F
call    qword ptr ds:[<&CloseHandle>]
add     rsp,28
ret     
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
push    rdi
sub     rsp,40
and     qword ptr ds:[rax-28],0
mov     rdi,r8
mov     r9,r8
mov     esi,edx
mov     r8d,edx
mov     rbp,rcx
mov     rdx,rcx
mov     rcx,qword ptr ds:[13F14CA90]
call    qword ptr ds:[<&WriteConsoleW>]
mov     ebx,eax
test    eax,eax
jne     oglmdi2_vs2019.13F13EE4B
call    qword ptr ds:[<&GetLastError>]
cmp     eax,6
jne     oglmdi2_vs2019.13F13EE4B
mov     rcx,qword ptr ds:[13F14CA90]
cmp     rcx,FFFFFFFFFFFFFFFD
ja      oglmdi2_vs2019.13F13EDFF
call    qword ptr ds:[<&CloseHandle>]
and     qword ptr ss:[rsp+30],0
lea     rcx,qword ptr ds:[13F147C30]
and     dword ptr ss:[rsp+28],0
mov     r8d,3
xor     r9d,r9d
mov     dword ptr ss:[rsp+20],r8d
mov     edx,40000000
call    qword ptr ds:[<&CreateFileW>]
and     qword ptr ss:[rsp+20],0
mov     r9,rdi
mov     rcx,rax
mov     qword ptr ds:[13F14CA90],rax
mov     r8d,esi
mov     rdx,rbp
call    qword ptr ds:[<&WriteConsoleW>]
mov     ebx,eax
mov     rbp,qword ptr ss:[rsp+58]
mov     eax,ebx
mov     rbx,qword ptr ss:[rsp+50]
mov     rsi,qword ptr ss:[rsp+60]
add     rsp,40
pop     rdi
ret     
int3    
int3    
mov     r10d,8040
xor     edx,edx
stmxcsr dword ptr ss:[rsp+8]
mov     r9d,dword ptr ss:[rsp+8]
movzx   eax,r9w
and     ax,r10w
lea     ecx,dword ptr ds:[r10-40]
cmp     ax,cx
jne     oglmdi2_vs2019.13F13EE8F
mov     r8d,C00
jmp     oglmdi2_vs2019.13F13EEAD
cmp     ax,40
jne     oglmdi2_vs2019.13F13EE9D
mov     r8d,800
jmp     oglmdi2_vs2019.13F13EEAD
cmp     ax,r10w
mov     r8d,edx
mov     ecx,400
cmove   r8d,ecx
mov     eax,r9d
mov     r10d,6000
and     eax,r10d
je      oglmdi2_vs2019.13F13EEE4
cmp     eax,2000
je      oglmdi2_vs2019.13F13EEDD
cmp     eax,4000
je      oglmdi2_vs2019.13F13EED6
cmp     eax,r10d
mov     ecx,300
cmovne  ecx,edx
jmp     oglmdi2_vs2019.13F13EEE6
mov     ecx,200
jmp     oglmdi2_vs2019.13F13EEE6
mov     ecx,100
jmp     oglmdi2_vs2019.13F13EEE6
mov     ecx,edx
mov     r10d,1
mov     edx,r9d
shr     edx,8
mov     eax,r9d
shr     eax,7
and     edx,r10d
and     eax,r10d
shl     edx,5
shl     eax,4
or      edx,eax
mov     eax,r9d
shr     eax,9
and     eax,r10d
shl     eax,3
or      edx,eax
mov     eax,r9d
shr     eax,A
and     eax,r10d
shl     eax,2
or      edx,eax
mov     eax,r9d
shr     eax,B
and     eax,r10d
shr     r9d,C
add     eax,eax
and     r9d,r10d
or      edx,eax
or      edx,r9d
or      edx,ecx
or      edx,r8d
mov     eax,edx
mov     ecx,edx
shl     eax,16
and     ecx,3F
and     eax,C0000000
shl     ecx,18
or      eax,ecx
or      eax,edx
ret     
int3    
int3    
int3    
stmxcsr dword ptr ss:[rsp+8]
mov     ecx,dword ptr ss:[rsp+8]
and     ecx,3F
mov     edx,ecx
mov     eax,ecx
shr     eax,2
and     eax,1
shr     edx,1
shl     eax,3
and     edx,1
shl     edx,5
or      edx,eax
mov     eax,ecx
shr     eax,3
and     eax,1
shl     eax,2
or      edx,eax
mov     eax,ecx
shr     eax,4
and     eax,1
add     eax,eax
or      edx,eax
mov     eax,ecx
and     eax,1
shr     ecx,5
shl     eax,4
or      edx,eax
or      edx,ecx
mov     eax,edx
shl     eax,18
or      eax,edx
ret     
int3    
mov     qword ptr ss:[rsp+10],rbx
mov     qword ptr ss:[rsp+18],rsi
mov     qword ptr ss:[rsp+20],rdi
mov     r8d,ecx
mov     eax,ecx
shr     r8d,2
and     eax,C03FFFFF
and     r8d,FC00000
xor     esi,esi
or      r8d,eax
mov     edi,400
mov     eax,C00
shr     r8d,16
and     ecx,eax
mov     r11d,800
cmp     ecx,edi
je      oglmdi2_vs2019.13F13F00E
cmp     ecx,r11d
je      oglmdi2_vs2019.13F13F006
cmp     ecx,eax
je      oglmdi2_vs2019.13F13EFFE
movzx   r9d,si
jmp     oglmdi2_vs2019.13F13F014
mov     r9d,8000
jmp     oglmdi2_vs2019.13F13F014
mov     r9d,40
jmp     oglmdi2_vs2019.13F13F014
mov     r9d,8040
mov     eax,r8d
mov     ecx,300
mov     ebx,100
mov     r10d,200
and     eax,ecx
je      oglmdi2_vs2019.13F13F04D
cmp     eax,ebx
je      oglmdi2_vs2019.13F13F046
cmp     eax,r10d
je      oglmdi2_vs2019.13F13F03F
cmp     eax,ecx
jne     oglmdi2_vs2019.13F13F04D
mov     ecx,6000
jmp     oglmdi2_vs2019.13F13F050
mov     ecx,4000
jmp     oglmdi2_vs2019.13F13F050
mov     ecx,2000
jmp     oglmdi2_vs2019.13F13F050
movzx   ecx,si
test    r8b,1
je      oglmdi2_vs2019.13F13F05D
mov     edx,1000
jmp     oglmdi2_vs2019.13F13F060
movzx   edx,si
mov     eax,r8d
shr     eax,1
test    al,1
jne     oglmdi2_vs2019.13F13F06D
movzx   r11d,si
mov     eax,r8d
or      dx,r11w
shr     eax,2
test    al,1
jne     oglmdi2_vs2019.13F13F07E
movzx   edi,si
mov     eax,r8d
or      dx,di
shr     eax,3
test    al,1
jne     oglmdi2_vs2019.13F13F08F
movzx   r10d,si
mov     eax,r8d
or      dx,r10w
shr     eax,4
test    al,1
je      oglmdi2_vs2019.13F13F0A4
mov     eax,80
jmp     oglmdi2_vs2019.13F13F0A7
movzx   eax,si
or      dx,ax
shr     r8d,5
test    r8b,1
jne     oglmdi2_vs2019.13F13F0B7
movzx   ebx,si
mov     rsi,qword ptr ss:[rsp+18]
or      dx,bx
mov     rbx,qword ptr ss:[rsp+10]
or      dx,cx
mov     rdi,qword ptr ss:[rsp+20]
or      dx,r9w
stmxcsr dword ptr ss:[rsp+8]
mov     ecx,dword ptr ss:[rsp+8]
movzx   eax,dx
and     ecx,FFFF003F
and     eax,FFC0
or      ecx,eax
mov     dword ptr ss:[rsp+8],ecx
ldmxcsr dword ptr ss:[rsp+8]
ret     
int3    
mov     edx,ecx
mov     r9d,1
shr     edx,18
and     edx,3F
stmxcsr dword ptr ss:[rsp+8]
mov     eax,edx
mov     r8d,edx
shr     eax,1
and     r8d,r9d
movzx   ecx,al
mov     eax,edx
shr     eax,2
and     ecx,r9d
shl     ecx,4
shl     r8d,5
or      r8d,ecx
movzx   ecx,al
and     ecx,r9d
mov     eax,edx
shr     eax,3
shl     ecx,3
or      r8d,ecx
movzx   ecx,al
and     ecx,r9d
mov     eax,edx
shr     eax,4
shl     ecx,2
or      r8d,ecx
shr     edx,5
movzx   ecx,al
movzx   eax,dl
and     ecx,r9d
and     eax,r9d
or      r8d,ecx
add     eax,eax
or      r8d,eax
mov     eax,dword ptr ss:[rsp+8]
and     eax,FFFFFFC0
and     r8d,3F
or      eax,r8d
mov     dword ptr ss:[rsp+8],eax
ldmxcsr dword ptr ss:[rsp+8]
ret     
int3    
push    rbx
sub     rsp,20
call    oglmdi2_vs2019.13F13B5D0
mov     ebx,eax
call    oglmdi2_vs2019.13F13B5EA
xor     r9d,r9d
test    bl,3F
je      oglmdi2_vs2019.13F13F1DD
mov     ecx,ebx
mov     eax,ebx
mov     edx,ebx
and     edx,1
shl     edx,4
mov     r8d,edx
or      r8d,8
and     cl,4
cmove   r8d,edx
mov     ecx,r8d
or      ecx,4
and     al,8
mov     eax,ebx
cmove   ecx,r8d
mov     edx,ecx
or      edx,2
and     al,10
mov     eax,ebx
cmove   edx,ecx
mov     r9d,edx
or      r9d,1
and     al,20
cmove   r9d,edx
test    bl,2
je      oglmdi2_vs2019.13F13F1DD
bts     r9d,13
mov     eax,r9d
add     rsp,20
pop     rbx
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
sub     rsp,38
lea     rax,qword ptr ds:[13F146FE0]
mov     r9d,1B
mov     qword ptr ss:[rsp+20],rax
call    oglmdi2_vs2019.13F13F210
add     rsp,38
ret     
mov     rax,rsp
sub     rsp,68
movaps  xmmword ptr ds:[rax-18],xmm6
movaps  xmm6,xmm1
mov     edx,r9d
movaps  xmm3,xmm0
sub     r8d,1
je      oglmdi2_vs2019.13F13F254
cmp     r8d,1
jne     oglmdi2_vs2019.13F13F299
mov     dword ptr ds:[rax-28],r8d
xorps   xmm2,xmm2
movsd   qword ptr ds:[rax-30],xmm2
mov     r9d,r8d
movsd   qword ptr ds:[rax-38],xmm0
mov     dword ptr ds:[rax-40],21
mov     dword ptr ds:[rax-48],8
jmp     oglmdi2_vs2019.13F13F281
mov     dword ptr ss:[rsp+40],1
xorps   xmm0,xmm0
movsd   qword ptr ss:[rsp+38],xmm0
mov     r9d,2
movsd   qword ptr ss:[rsp+30],xmm3
mov     dword ptr ss:[rsp+28],22
mov     dword ptr ss:[rsp+20],4
mov     rcx,qword ptr ss:[rsp+90]
movsd   qword ptr ss:[rsp+78],xmm6
mov     r8,qword ptr ss:[rsp+78]
call    oglmdi2_vs2019.13F135850
movaps  xmm0,xmm6
movaps  xmm6,xmmword ptr ss:[rsp+50]
add     rsp,68
ret     
jmp     qword ptr ds:[<&IsProcessorFeaturePresent>]
int3    
int3    
int3    
int3    
movsxd  r8,dword ptr ds:[rcx+3C]
xor     r9d,r9d
add     r8,rcx
mov     r10,rdx
movzx   eax,word ptr ds:[r8+14]
movzx   r11d,word ptr ds:[r8+6]
add     rax,18
add     rax,r8
test    r11d,r11d
je      oglmdi2_vs2019.13F13F2F1
mov     edx,dword ptr ds:[rax+C]
cmp     r10,rdx
jb      oglmdi2_vs2019.13F13F2E5
mov     ecx,dword ptr ds:[rax+8]
add     ecx,edx
cmp     r10,rcx
jb      oglmdi2_vs2019.13F13F2F3
inc     r9d
add     rax,28
cmp     r9d,r11d
jb      oglmdi2_vs2019.13F13F2D3
xor     eax,eax
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
mov     qword ptr ss:[rsp+8],rbx
push    rdi
sub     rsp,20
mov     rbx,rcx
lea     rdi,qword ptr ds:[13F120000]
mov     rcx,rdi
call    oglmdi2_vs2019.13F13F350
test    eax,eax
je      oglmdi2_vs2019.13F13F342
sub     rbx,rdi
mov     rdx,rbx
mov     rcx,rdi
call    oglmdi2_vs2019.13F13F2B0
test    rax,rax
je      oglmdi2_vs2019.13F13F342
mov     eax,dword ptr ds:[rax+24]
shr     eax,1F
not     eax
and     eax,1
jmp     oglmdi2_vs2019.13F13F342
xor     eax,eax
mov     rbx,qword ptr ss:[rsp+30]
add     rsp,20
pop     rdi
ret     
int3    
int3    
int3    
mov     eax,5A4D
cmp     word ptr ds:[rcx],ax
jne     oglmdi2_vs2019.13F13F37A
movsxd  rax,dword ptr ds:[rcx+3C]
add     rax,rcx
cmp     dword ptr ds:[rax],4550
jne     oglmdi2_vs2019.13F13F37A
mov     ecx,20B
cmp     word ptr ds:[rax+18],cx
jne     oglmdi2_vs2019.13F13F37A
mov     eax,1
ret     
xor     eax,eax
ret     
int3    
int3    
int3    
mov     rax,rsp
mov     qword ptr ds:[rax+8],rbx
mov     qword ptr ds:[rax+10],rbp
mov     qword ptr ds:[rax+18],rsi
mov     qword ptr ds:[rax+20],rdi
push    r14
sub     rsp,20
mov     r10,qword ptr ds:[r9+38]
mov     rsi,rdx
mov     r14,r8
mov     rbp,rcx
mov     rdx,r9
mov     rcx,rsi
mov     rdi,r9
mov     ebx,dword ptr ds:[r10]
shl     rbx,4
add     rbx,r10
lea     r8,qword ptr ds:[rbx+4]
call    oglmdi2_vs2019.13F1298A4
mov     eax,dword ptr ss:[rbp+4]
and     al,66
neg     al
mov     eax,1
sbb     edx,edx
neg     edx
add     edx,eax
test    dword ptr ds:[rbx+4],edx
je      oglmdi2_vs2019.13F13F3EA
mov     r9,rdi
mov     r8,r14
mov     rdx,rsi
mov     rcx,rbp
call    oglmdi2_vs2019.13F12B410
mov     rbx,qword ptr ss:[rsp+30]
mov     rbp,qword ptr ss:[rsp+38]
mov     rsi,qword ptr ss:[rsp+40]
mov     rdi,qword ptr ss:[rsp+48]
add     rsp,20
pop     r14
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
int3    
int3    
int3    
nop     word ptr ds:[rax+rax]
sub     rsp,10
mov     qword ptr ss:[rsp],r10
mov     qword ptr ss:[rsp+8],r11
xor     r11,r11
lea     r10,qword ptr ss:[rsp+18]
sub     r10,rax
cmovb   r10,r11
mov     r11,qword ptr gs:[10]
cmp     r10,r11
jae     oglmdi2_vs2019.13F13F462
and     r10w,F000
lea     r11,qword ptr ds:[r11-1000]
mov     byte ptr ds:[r11],0
cmp     r10,r11
jne     oglmdi2_vs2019.13F13F451
mov     r10,qword ptr ss:[rsp]
mov     r11,qword ptr ss:[rsp+8]
add     rsp,10
ret     
int3    
int3    
int3    
xor     r9d,r9d
mov     r8,rcx
test    edx,edx
jne     oglmdi2_vs2019.13F13F4C2
and     r8d,F
mov     rdx,rcx
and     rdx,FFFFFFFFFFFFFFF0
mov     ecx,r8d
or      r8d,FFFFFFFF
xorps   xmm1,xmm1
shl     r8d,cl
movdqu  xmm0,xmmword ptr ds:[rdx]
pcmpeqb xmm0,xmm1
pmovmskb eax,xmm0
and     eax,r8d
jne     oglmdi2_vs2019.13F13F4BB
add     rdx,10
movdqu  xmm0,xmmword ptr ds:[rdx]
pcmpeqb xmm0,xmm1
pmovmskb eax,xmm0
test    eax,eax
je      oglmdi2_vs2019.13F13F4A7
bsf     eax,eax
add     rax,rdx
ret     
cmp     dword ptr ds:[13F14C068],2
jge     oglmdi2_vs2019.13F13F577
movzx   eax,dl
mov     r10,r8
and     r8d,F
and     r10,FFFFFFFFFFFFFFF0
mov     ecx,eax
shl     ecx,8
or      ecx,eax
movd    xmm0,ecx
mov     ecx,r8d
pshuflw xmm1,xmm0,0
or      r8d,FFFFFFFF
xorps   xmm0,xmm0
shl     r8d,cl
pcmpeqb xmm0,xmmword ptr ds:[r10]
pmovmskb ecx,xmm0
pshufd  xmm2,xmm1,0
movdqa  xmm0,xmm2
pcmpeqb xmm0,xmmword ptr ds:[r10]
pmovmskb edx,xmm0
and     edx,r8d
and     ecx,r8d
jne     oglmdi2_vs2019.13F13F54A
bsr     ecx,edx
xorps   xmm1,xmm1
movdqa  xmm0,xmm2
add     rcx,r10
test    edx,edx
cmovne  r9,rcx
add     r10,10
pcmpeqb xmm1,xmmword ptr ds:[r10]
pcmpeqb xmm0,xmmword ptr ds:[r10]
pmovmskb ecx,xmm1
pmovmskb edx,xmm0
test    ecx,ecx
je      oglmdi2_vs2019.13F13F51D
mov     eax,ecx
neg     eax
and     eax,ecx
dec     eax
and     edx,eax
bsr     ecx,edx
add     rcx,r10
test    edx,edx
cmovne  r9,rcx
mov     rax,r9
ret     
movsx   eax,byte ptr ds:[r8]
cmp     eax,edx
cmove   r9,r8
cmp     byte ptr ds:[r8],0
je      oglmdi2_vs2019.13F13F560
inc     r8
test    r8b,F
jne     oglmdi2_vs2019.13F13F564
movzx   eax,dl
movd    xmm0,eax
pcmpistri xmm0,xmmword ptr ds:[r8],40
jae     oglmdi2_vs2019.13F13F59A
movsxd  r9,ecx
add     r9,r8
pcmpistri xmm0,xmmword ptr ds:[r8],40
je      oglmdi2_vs2019.13F13F560
add     r8,10
jmp     oglmdi2_vs2019.13F13F584
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
int3    
int3    
int3    
int3    
int3    
int3    
nop     word ptr ds:[rax+rax]
jmp     rax
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
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     edx,8A8
mov     rcx,qword ptr ss:[rbp+30]
call    oglmdi2_vs2019.13F129A84
add     rsp,20
pop     rbp
ret     
int3    
int3    
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     edx,50
mov     rcx,qword ptr ss:[rbp+30]
call    oglmdi2_vs2019.13F129A84
add     rsp,20
pop     rbp
ret     
int3    
int3    
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     edx,128
mov     rcx,qword ptr ss:[rbp+30]
call    oglmdi2_vs2019.13F129A84
add     rsp,20
pop     rbp
ret     
int3    
int3    
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rcx,qword ptr ss:[rbp+40]
call    oglmdi2_vs2019.13F128D20
add     rsp,20
pop     rbp
ret     
push    rbp
sub     rsp,20
mov     rbp,rdx
cmp     byte ptr ss:[rbp+20],0
jne     oglmdi2_vs2019.13F13F66D
mov     r9,qword ptr ss:[rbp+70]
mov     r8,qword ptr ss:[rbp+28]
mov     rdx,qword ptr ss:[rbp+58]
mov     rcx,qword ptr ss:[rbp+50]
call    oglmdi2_vs2019.13F129A10
nop     
add     rsp,20
pop     rbp
ret     
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
cmp     byte ptr ss:[rbp+20],0
jne     oglmdi2_vs2019.13F13F699
mov     r9,qword ptr ss:[rbp+78]
mov     r8,qword ptr ss:[rbp+70]
mov     rdx,qword ptr ss:[rbp+68]
mov     rcx,qword ptr ss:[rbp+60]
call    oglmdi2_vs2019.13F129A10
nop     
add     rsp,20
pop     rbp
ret     
int3    
push    rbx
push    rbp
sub     rsp,28
mov     rbp,rdx
mov     qword ptr ss:[rbp+40],rcx
mov     qword ptr ss:[rbp+30],rcx
mov     rax,qword ptr ss:[rbp+30]
mov     rcx,qword ptr ds:[rax]
mov     qword ptr ss:[rbp+28],rcx
mov     rax,qword ptr ss:[rbp+28]
cmp     dword ptr ds:[rax],E06D7363
je      oglmdi2_vs2019.13F13F6D5
mov     dword ptr ss:[rbp+20],0
mov     eax,dword ptr ss:[rbp+20]
jmp     oglmdi2_vs2019.13F13F6F7
call    oglmdi2_vs2019.13F12B74C
mov     rcx,qword ptr ss:[rbp+28]
mov     qword ptr ds:[rax],rcx
mov     rax,qword ptr ss:[rbp+30]
mov     rbx,qword ptr ds:[rax+8]
call    oglmdi2_vs2019.13F12B760
mov     qword ptr ds:[rax],rbx
call    oglmdi2_vs2019.13F1313E8
nop     
add     rsp,28
pop     rbp
pop     rbx
ret     
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rax,qword ptr ds:[rcx]
mov     rdx,rcx
mov     ecx,dword ptr ds:[rax]
call    oglmdi2_vs2019.13F131408
nop     
add     rsp,20
pop     rbp
ret     
int3    
push    rbp
mov     rbp,rdx
mov     rax,qword ptr ds:[rcx]
xor     ecx,ecx
cmp     dword ptr ds:[rax],C0000005
sete    cl
mov     eax,ecx
pop     rbp
ret     
int3    
push    rbx
push    rbp
sub     rsp,48
mov     rbp,rdx
mov     qword ptr ss:[rbp+50],rcx
mov     qword ptr ss:[rbp+48],rcx
call    oglmdi2_vs2019.13F12B958
mov     rcx,qword ptr ss:[rbp+80]
mov     qword ptr ds:[rax+70],rcx
mov     rax,qword ptr ss:[rbp+48]
mov     rcx,qword ptr ds:[rax]
mov     rbx,qword ptr ds:[rcx+38]
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+68],rbx
mov     rcx,qword ptr ss:[rbp+48]
mov     byte ptr ss:[rsp+38],1
and     qword ptr ss:[rsp+30],0
and     dword ptr ss:[rsp+28],0
mov     rax,qword ptr ss:[rbp+A0]
mov     qword ptr ss:[rsp+20],rax
mov     r9,qword ptr ss:[rbp+98]
mov     r8,qword ptr ss:[rbp+90]
mov     rdx,qword ptr ss:[rbp+88]
mov     rcx,qword ptr ds:[rcx]
call    oglmdi2_vs2019.13F12C9C0
call    oglmdi2_vs2019.13F12B958
and     qword ptr ds:[rax+70],0
mov     dword ptr ss:[rbp+40],1
mov     eax,1
add     rsp,48
pop     rbp
pop     rbx
ret     
int3    
push    rbx
push    rbp
sub     rsp,28
mov     rbp,rdx
mov     qword ptr ss:[rbp+38],rcx
mov     qword ptr ss:[rbp+30],rcx
cmp     byte ptr ss:[rbp+58],0
je      oglmdi2_vs2019.13F13F84A
mov     rax,qword ptr ss:[rbp+30]
mov     rcx,qword ptr ds:[rax]
mov     qword ptr ss:[rbp+28],rcx
mov     rax,qword ptr ss:[rbp+28]
cmp     dword ptr ds:[rax],E06D7363
jne     oglmdi2_vs2019.13F13F84A
mov     rax,qword ptr ss:[rbp+28]
cmp     dword ptr ds:[rax+18],4
jne     oglmdi2_vs2019.13F13F84A
mov     rax,qword ptr ss:[rbp+28]
cmp     dword ptr ds:[rax+20],19930520
je      oglmdi2_vs2019.13F13F826
mov     rax,qword ptr ss:[rbp+28]
cmp     dword ptr ds:[rax+20],19930521
je      oglmdi2_vs2019.13F13F826
mov     rax,qword ptr ss:[rbp+28]
cmp     dword ptr ds:[rax+20],19930522
jne     oglmdi2_vs2019.13F13F84A
call    oglmdi2_vs2019.13F12B958
mov     rcx,qword ptr ss:[rbp+28]
mov     qword ptr ds:[rax+20],rcx
mov     rax,qword ptr ss:[rbp+30]
mov     rbx,qword ptr ds:[rax+8]
call    oglmdi2_vs2019.13F12B958
mov     qword ptr ds:[rax+28],rbx
call    oglmdi2_vs2019.13F1313E8
nop     
mov     dword ptr ss:[rbp+20],0
mov     eax,dword ptr ss:[rbp+20]
add     rsp,28
pop     rbp
pop     rbx
ret     
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     qword ptr ss:[rbp+80],rcx
lea     r9,qword ptr ss:[rbp+20]
mov     r8d,dword ptr ss:[rbp+E8]
mov     rdx,qword ptr ss:[rbp+F8]
call    oglmdi2_vs2019.13F12D278
nop     
add     rsp,20
pop     rbp
ret     
int3    
push    rbx
push    rbp
sub     rsp,28
mov     rbp,rdx
mov     rcx,qword ptr ss:[rbp+48]
call    oglmdi2_vs2019.13F12AFFC
cmp     dword ptr ss:[rbp+20],0
jne     oglmdi2_vs2019.13F13F8DE
mov     rbx,qword ptr ss:[rbp+F8]
cmp     dword ptr ds:[rbx],E06D7363
jne     oglmdi2_vs2019.13F13F8DE
cmp     dword ptr ds:[rbx+18],4
jne     oglmdi2_vs2019.13F13F8DE
mov     eax,dword ptr ds:[rbx+20]
sub     eax,19930520
cmp     eax,2
ja      oglmdi2_vs2019.13F13F8DE
mov     rcx,qword ptr ds:[rbx+28]
call    oglmdi2_vs2019.13F12B690
test    eax,eax
je      oglmdi2_vs2019.13F13F8DE
mov     dl,1
mov     rcx,rbx
call    oglmdi2_vs2019.13F12B61C
nop     
call    oglmdi2_vs2019.13F12B958
mov     rcx,qword ptr ss:[rbp+30]
mov     qword ptr ds:[rax+20],rcx
call    oglmdi2_vs2019.13F12B958
mov     rcx,qword ptr ss:[rbp+38]
mov     qword ptr ds:[rax+28],rcx
call    oglmdi2_vs2019.13F12B958
mov     ecx,dword ptr ss:[rbp+E0]
mov     dword ptr ds:[rax+78],ecx
add     rsp,28
pop     rbp
pop     rbx
ret     
int3    
push    rbp
sub     rsp,30
mov     rbp,rdx
call    oglmdi2_vs2019.13F12B6E4
nop     
add     rsp,30
pop     rbp
ret     
int3    
push    rbp
sub     rsp,30
mov     rbp,rdx
call    oglmdi2_vs2019.13F12B958
cmp     dword ptr ds:[rax+30],0
jle     oglmdi2_vs2019.13F13F940
call    oglmdi2_vs2019.13F12B958
dec     dword ptr ds:[rax+30]
add     rsp,30
pop     rbp
ret     
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rcx,qword ptr ss:[rbp+30]
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F12E3D0
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     ecx,7
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F1313CC
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
cmp     qword ptr ss:[rbp+20],0
jne     oglmdi2_vs2019.13F13F992
mov     rcx,qword ptr ss:[rbp+40]
call    oglmdi2_vs2019.13F133F90
nop     
mov     rcx,qword ptr ss:[rbp+40]
call    oglmdi2_vs2019.13F12E3D0
nop     
add     rsp,20
pop     rbp
ret     
int3    
push    rbp
sub     rsp,30
mov     rbp,rdx
mov     rcx,qword ptr ss:[rbp+60]
add     rsp,30
pop     rbp
jmp     oglmdi2_vs2019.13F12E3D0
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rax,qword ptr ss:[rbp+48]
mov     ecx,dword ptr ds:[rax]
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F1313CC
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rax,qword ptr ds:[rcx]
mov     ecx,dword ptr ds:[rax]
call    oglmdi2_vs2019.13F131E08
nop     
add     rsp,20
pop     rbp
ret     
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rax,qword ptr ss:[rbp+58]
mov     ecx,dword ptr ds:[rax]
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F1313CC
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
xor     ecx,ecx
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F1313CC
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     ecx,8
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F1313CC
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rcx,qword ptr ss:[rbp+48]
mov     rcx,qword ptr ds:[rcx]
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F12E3D0
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rax,qword ptr ss:[rbp+98]
mov     ecx,dword ptr ds:[rax]
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F1313CC
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rax,qword ptr ss:[rbp+48]
mov     ecx,dword ptr ds:[rax]
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F12EA0C
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     ecx,dword ptr ss:[rbp+40]
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F12EA0C
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rax,qword ptr ds:[rcx]
cmp     dword ptr ds:[rax],C0000005
je      oglmdi2_vs2019.13F13FAC2
cmp     dword ptr ds:[rax],C000001D
je      oglmdi2_vs2019.13F13FAC2
xor     eax,eax
jmp     oglmdi2_vs2019.13F13FAC7
mov     eax,1
add     rsp,20
pop     rbp
ret     
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     ecx,5
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F1313CC
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     ecx,4
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F1313CC
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
cmp     byte ptr ss:[rbp+70],0
je      oglmdi2_vs2019.13F13FB1A
mov     ecx,3
call    oglmdi2_vs2019.13F1313CC
nop     
add     rsp,20
pop     rbp
ret     
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     ecx,dword ptr ss:[rbp+50]
add     rsp,20
pop     rbp
jmp     oglmdi2_vs2019.13F12EA0C
int3    
push    rbp
sub     rsp,40
mov     rbp,rdx
cmp     dword ptr ss:[rbp+40],0
je      oglmdi2_vs2019.13F13FB84
cmp     dword ptr ss:[rbp+44],0
je      oglmdi2_vs2019.13F13FB75
mov     rax,qword ptr ss:[rbp+80]
movsxd  rcx,dword ptr ds:[rax]
mov     rax,rcx
sar     rax,6
lea     rdx,qword ptr ds:[13F14DE80]
and     ecx,3F
lea     rcx,qword ptr ds:[rcx+rcx*8]
mov     rax,qword ptr ds:[rdx+rax*8]
and     byte ptr ds:[rax+rcx*8+38],FE
mov     rax,qword ptr ss:[rbp+80]
mov     ecx,dword ptr ds:[rax]
call    oglmdi2_vs2019.13F12EA0C
nop     
add     rsp,40
pop     rbp
ret     
int3    
int3    
int3    
int3    
int3    
int3    
push    rbp
sub     rsp,20
mov     rbp,rdx
mov     rax,qword ptr ds:[rcx]
xor     ecx,ecx
cmp     dword ptr ds:[rax],C0000005
sete    cl
mov     eax,ecx
add     rsp,20
pop     rbp
ret     
int3    
lea     rcx,qword ptr ds:[13F14CE90]
jmp     oglmdi2_vs2019.13F129444