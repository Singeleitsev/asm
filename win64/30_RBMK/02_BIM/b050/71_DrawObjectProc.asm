DrawObjectProc proc
LOCAL x:WORD, y:WORD
LOCAL lpLayout:QWORD

;Since the Proc has Locals
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx,1700h ;GL_MODELVIEW
Call glMatrixMode
Call glPushMatrix ;Store Initial Value
movss xmm0,f32_neg5875
movss xmm1,f32_neg5875
xorps xmm2,xmm2
Call glTranslatef ;(-5875, -5875, 0)

mov x,0
mov y,0
lea rax,Layout
mov lpLayout,rax

lbl_DrawObject_ScanRow:
Call glPushMatrix ;Store the Start of the Row

;Gray
lbl_DrawObject_Check1:
mov rax,lpLayout
cmp byte ptr [rax],1
jne lbl_DrawObject_Check2
movss xmm0,f32_0p75
movss xmm1,f32_0p75
movss xmm2,f32_0p75
Call glColor3f ;(0.75, 0.75, 0.75)
Call DrawCap
jmp lbl_DrawObject_NextX
;Green
lbl_DrawObject_Check2:
mov rax,lpLayout
cmp byte ptr [rax],2
jne lbl_DrawObject_Check3
movss xmm0,f32_0p15
movss xmm1,f32_0p75
movss xmm2,f32_0p15
Call glColor3f ;(0.15, 0.75, 0.15)
Call DrawCap
jmp lbl_DrawObject_NextX
;Yellow
lbl_DrawObject_Check3:
mov rax,lpLayout
cmp byte ptr [rax],3
jne lbl_DrawObject_Check4
movss xmm0,f32_0p85
movss xmm1,f32_0p85
movss xmm2,f32_0p15
Call glColor3f ;(0.85, 0.85, 0.15)
Call DrawCap
jmp lbl_DrawObject_NextX
;Red
lbl_DrawObject_Check4:
mov rax,lpLayout
cmp byte ptr [rax],4
jne lbl_DrawObject_Check5
movss xmm0,f32_0p85
movss xmm1,f32_0p15
movss xmm2,f32_0p15
Call glColor3f ;(0.85, 0.15, 0.15)
Call DrawCap
jmp lbl_DrawObject_NextX
;Blue
lbl_DrawObject_Check5:
mov rax,lpLayout
cmp byte ptr [rax],5
jne lbl_DrawObject_NextX
movss xmm0,f32_QUARTER
movss xmm1,f32_0p4
movss xmm2,f32_0p85
Call glColor3f ;(0.25, 0.4, 0.85)
Call DrawCap

lbl_DrawObject_NextX:
movss xmm0,f32_250
xorps xmm1,xmm1
xorps xmm2,xmm2
Call glTranslatef ;(250, 0, 0)
inc lpLayout
inc x
cmp x,47
jg lbl_DrawObject_NextY
jmp lbl_DrawObject_Check1

lbl_DrawObject_NextY:
Call glPopMatrix ;ReStore the Start of the Row
inc y
cmp y,47
jg lbl_DrawObject_Back_to_Origin
mov x,0
xorps xmm0,xmm0
movss xmm1,f32_250
xorps xmm2,xmm2
Call glTranslatef ;(0, 250, 0)
jmp lbl_DrawObject_ScanRow

lbl_DrawObject_Back_to_Origin:
Call glPopMatrix ;ReStore Initial Value

add rsp,100h
;Since the Proc has Locals
;Assembler will add this epilogue automatically:
;leave
ret
DrawObjectProc endp
