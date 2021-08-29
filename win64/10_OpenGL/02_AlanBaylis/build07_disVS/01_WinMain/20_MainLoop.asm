;int iLoop;

;while(GetMessage(&Msg, NULL, 0, 0))
lblMainLoop:

;{ //1
sub rsp,20h
lea rcx,Msg
xor rdx,rdx
xor r8,r8
xor r9,r9
call GetMessageA
add rsp,20h
cmp rax,0
je endLoop ;oglmdi2_vs2019.13F128905

;if(!TranslateMDISysAccel(g_hMDIClient, &Msg))
sub rsp,20h
mov rcx,g_hMDIClient
lea rdx,Msg
call TranslateMDISysAccel
add rsp,20h

cmp rax,0
jne lblCheckChildren ;oglmdi2_vs2019.13F128614

;{ //2
sub rsp,20h
;TranslateMessage(&Msg);
lea rcx,Msg
call TranslateMessage
;DispatchMessage(&Msg);
lea rcx,Msg
call DispatchMessageA
add rsp,20h
;} //2



;if(g_iNumChild) // If we have some children
lblCheckChildren: ;13F128614
cmp g_iNumChild,0 ;dword ptr ds:[13F14CE58]
je lblMainLoop ;oglmdi2_vs2019.13F128900

;{ //2
;for(iLoop = 0;iLoop < g_iNumChild;iLoop++) // Loop through all children
lblResetChildNum: ;13F128621
mov iLoop,0
;jmp lblCheckChildNum ;oglmdi2_vs2019.13F128635
jmp lblCheckMinimized

lblIncChildNum: ;13F12862B
mov rax,iLoop
inc rax
mov iLoop,rax

lblCheckChildNum: ;13F128635
mov rax,g_iNumChild ;dword ptr ds:[13F14CE58]
cmp iLoop,rax
jge lblMainLoop ;oglmdi2_vs2019.13F128900

;{ //3
;if(!IsIconic(g_child[iLoop].hWnd)) // If child isn't iconic (minimized)
lblCheckMinimized: ;13F128645
movsxd rax,iLoop
imul rax,rax,20h
mov rcx,g_child ;qword ptr ds:[13F14CE80]
mov rcx,qword ptr ds:[rcx+rax+18] ;hWnd
call qword ptr ds:[<&IsIconic>]
test eax,eax
jne lblIncChildNum ;oglmdi2_vs2019.13F1288FB

;{ //4
;wglMakeCurrent(g_child[iLoop].hDC, g_child[iLoop].hRC);// Make them the current DC and RC
movsxd rax,iLoop
imul rax,rax,20h
movsxd rcx,iLoop
imul rcx,rcx,20h
mov rdx,g_child ;qword ptr ds:[13F14CE80]
mov rdx,qword ptr ds:[rdx+rax+10] ;hRC
mov rax,g_child ;qword ptr ds:[13F14CE80]
mov rcx,qword ptr ds:[rax+rcx+8] ;hDC
call wglMakeCurrent
;GetClientRect(g_child[iLoop].hWnd, &g_rectChild);
movsxd rax,iLoop
imul rax,rax,20h
lea rdx,g_rectChild ;qword ptr ds:[13F14CC10]
mov rcx,g_child ;qword ptr ds:[13F14CE80]
mov rcx,qword ptr ds:[rcx+rax+18] ;g_child[iLoop].hWnd
call GetClientRect


;if(g_rectChild.right > 0 && g_rectChild.bottom > 0)
cmp g_rectChild.right,0 ;dword ptr ds:[13F14CC18]
jle lblFlush ;oglmdi2_vs2019.13F128796

cmp g_rectChild.bottom,0 ;dword ptr ds:[13F14CC1C]
jle lblFlush ;oglmdi2_vs2019.13F128796

;{ //5
;if(g_child[iLoop].iType == 1)
movsxd rax,iLoop
imul rax,rax,20h
mov rcx,g_child ;qword ptr ds:[13F14CE80]
cmp dword ptr ds:[rcx+rax],1 ;g_child[iLoop].iType
jne lblSet2D ;oglmdi2_vs2019.13F128705

;{ //6
;Set3DProjection(g_rectChild.right, g_rectChild.bottom);// Set the childs projection matrix
mov edx,g_rectChild.bottom ;dword ptr ds:[13F14CC1C]
mov ecx,g_rectChild.right ;dword ptr ds:[13F14CC18]
call Set3DProjection ;oglmdi2_vs2019.13F126390
;Draw3DScene();
call Draw3DScene ;oglmdi2_vs2019.13F125430
;} //6

jmp lblFlush ;oglmdi2_vs2019.13F128796

;else
;{ //6
lblSet2D: ;13F128705
mov edx,g_rectChild.bottom ;dword ptr ds:[13F14CC1C]
mov ecx,g_rectChild.right ;dword ptr ds:[13F14CC18]
call Set2DProjection ;oglmdi2_vs2019.13F12877C
;Set2DProjection(g_rectChild.right, g_rectChild.bottom);// Set the childs projection matrix
;switch(g_child[iLoop].iType)
movsxd rax,iLoop
imul rax,rax,20h
mov rcx,g_child ;qword ptr ds:[13F14CE80]
mov eax,dword ptr ds:[rcx+rax] ;g_child[iLoop]
mov dword ptr ss:[rsp+64],eax ;g_child[iLoop].iType

cmp dword ptr ss:[rsp+64],2
je lblCaseFront ;oglmdi2_vs2019.13F128744

cmp dword ptr ss:[rsp+64],3
je lblCaseTop ;oglmdi2_vs2019.13F128760

cmp dword ptr ss:[rsp+64],4
je lblCaseLeft ;oglmdi2_vs2019.13F12877C

jmp lblFlush ;oglmdi2_vs2019.13F128796

;{ //7

;case 2:
lblCaseFront: ;13F128744
;Draw2DSceneFront(g_child[iLoop].hWnd);
movsxd rax,iLoop
imul rax,rax,20h
mov rcx,g_child ;qword ptr ds:[13F14CE80]
mov rcx,qword ptr ds:[rcx+rax+18] ;g_child[iLoop].hWnd
call Draw2DSceneFront ;oglmdi2_vs2019.13F1224E0
;break;
jmp lblFlush ;oglmdi2_vs2019.13F128796

;case 3:
lblCaseTop: ;13F128760
;Draw2DSceneTop(g_child[iLoop].hWnd);
movsxd rax,iLoop
imul rax,rax,20h
mov rcx,g_child ;qword ptr ds:[13F14CE80]
mov rcx,qword ptr ds:[rcx+rax+18] ;g_child[iLoop].hWnd
call Draw2DSceneTop ;oglmdi2_vs2019.13F124460
;break;
jmp lblFlush ;oglmdi2_vs2019.13F128796

;case 4:
lblCaseLeft: ;13F12877C
;Draw2DSceneLeft(g_child[iLoop].hWnd);
movsxd rax,iLoop
imul rax,rax,20h
mov rcx,g_child ;qword ptr ds:[13F14CE80]
mov rcx,qword ptr ds:[rcx+rax+18] ;g_child[iLoop].hWnd
;break;
call Draw2DSceneLeft ;oglmdi2_vs2019.13F123490
;} //7
;} //6
;} //5



;glFlush();
lblFlush: ;13F128796
call qword ptr ds:[<&glFlush>]
;SwapBuffers(g_child[iLoop].hDC);
movsxd rax,iLoop
imul rax,rax,20h
mov rcx,g_child ;qword ptr ds:[13F14CE80]
mov rcx,qword ptr ds:[rcx+rax+8] ;g_child[iLoop].hDC
call SwapBuffers




;if (key[49])
lblKey1: ;13F1287B7
;{ //5
mov eax,1
imul rax,rax,31h ;key[49] ;1 key
lea rcx,key ;qword ptr ds:[13F14CC20]
movzx eax,byte ptr ds:[rcx+rax] ;key[49]
test eax,eax
je lblKey2 ;oglmdi2_vs2019.13F1287FC
;if (Zoom < 1)
movss xmm0,1.0f ;dword ptr ds:[13F140748]
comiss xmm0,Zoom ;xmmword ptr ds:[13F14C004]
jbe lblKey2 ;oglmdi2_vs2019.13F1287FC
;Zoom += 0.001;
cvtss2sd xmm0,Zoom ;xmmword ptr ds:[13F14C004]
addsd xmm0,0.001f ;qword ptr ds:[13F140978]
cvtsd2ss xmm0,xmm0
movss Zoom,xmm0 ;xmmword ptr ds:[13F14C004]
;} //5

;if (key[50])
lblKey2: ;13F1287FC
;{ //5
mov eax,1
imul rax,rax,32h ;key[50] ;2 key
lea rcx,key ;qword ptr ds:[13F14CC20]
movzx eax,byte ptr ds:[rcx+rax] ;key[50]
test eax,eax
je lblKey3 ;oglmdi2_vs2019.13F128841
;if (Zoom > 0)
movss xmm0,Zoom ;xmmword ptr ds:[13F14C004]
comiss xmm0,0.0f ;qword ptr ds:[13F140978]
jbe lblKey3 ;oglmdi2_vs2019.13F128841
;Zoom -= 0.001;
cvtss2sd xmm0,Zoom ;xmmword ptr ds:[13F14C004]
subsd xmm0,0.001f ;qword ptr ds:[13F140978]
cvtsd2ss xmm0,xmm0
movss Zoom,xmm0 ;xmmword ptr ds:[13F14C004]
;} //5

;if (key[51])
lblKey3: ;13F128841
;{ //5
mov eax,1
imul rax,rax,33h ;key[51] ;3 key
lea rcx,key ;qword ptr ds:[13F14CC20]
movzx eax,byte ptr ds:[rcx+rax] ;key[51]
test eax,eax
je lblKey4 ;oglmdi2_vs2019.13F128867
;VerticalShift += 1;
mov eax,VerticalShift ;dword ptr ds:[13F14CE20]
inc eax
mov VerticalShift,eax ;dword ptr ds:[13F14CE20]
;} //5

;if (key[52])
lblKey4: ;13F128867
;{ //5
mov eax,1
imul rax,rax,34h ;key[52] ;4 key
lea rcx,key ;qword ptr ds:[13F14CC20]
movzx eax,byte ptr ds:[rcx+rax] ;key[52]
test eax,eax
je lblKey5 ;oglmdi2_vs2019.13F12888D
;VerticalShift -= 1;
mov eax,VerticalShift ;dword ptr ds:[13F14CE20]
dec eax
mov VerticalShift,eax ;dword ptr ds:[13F14CE20]
;} //5

;if (key[53])
lblKey5: ;13F128892
;{ //5
mov eax,1
imul rax,rax,35h ;key[53] ;5 key
lea rcx,key ;qword ptr ds:[13F14CC20]
movzx eax,byte ptr ds:[rcx+rax] ;key[53]
test eax,eax
je lblKey6 ;oglmdi2_vs2019.13F1288B3
;HorizontalShift += 1;
mov eax,HorizontalShift ;dword ptr ds:[13F14CE24]
inc eax
mov HorizontalShift,eax ;dword ptr ds:[13F14CE24]
;} //5

;if (key[54])
lblKey6: ;13F1288B3
;{ //5
mov eax,1
imul rax,rax,36h ;key[54] ;6 key
lea rcx,key ;qword ptr ds:[13F14CC20]
movzx eax,byte ptr ds:[rcx+rax];key[54]
test eax,eax
je lblKeySpace ;oglmdi2_vs2019.13F1288D9
;HorizontalShift -= 1;
mov eax,HorizontalShift ;dword ptr ds:[13F14CE24]
dec eax
mov HorizontalShift,eax ;dword ptr ds:[13F14CE24]
;} //5

;if (key[VK_SPACE])
lblKeySpace: ;13F1288D9
;{ //5
mov eax,1
imul rax,rax,20h ;key[VK_SPACE]
lea rcx,key ;qword ptr ds:[13F14CC20]
movzx eax,byte ptr ds:[rcx+rax] ;key[VK_SPACE]
test eax,eax
je lblIncChildNum ;oglmdi2_vs2019.13F1288FB
;SetVertices();
call SetVertices ;oglmdi2_vs2019.13F1270B0
;SetPolygons();
call SetPolygons ;oglmdi2_vs2019.13F126410
;} //5

;} //4

;} //3

jmp lblIncChildNum ;oglmdi2_vs2019.13F12862B
;} //2

;jmp     lblMainLoop ;oglmdi2_vs2019.13F1285C1
;} //1

endLoop: ;000000013F128905
mov rax,Msg.wParam ;dword ptr ss:[rsp+D0]




