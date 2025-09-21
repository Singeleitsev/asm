SetVertices proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

;Set the Cube's Vertices

mov vertex[0].x,0c2c80000h ;-100.0f
mov vertex[0].y,0c2c80000h ;-100.0f
mov vertex[0].z,042c80000h ;100.0f

mov vertex[1].x,042c80000h ;100.0f
mov vertex[1].y,0c2c80000h ;-100.0f
mov vertex[1].z,042c80000h ;100.0f

mov vertex[2].x,042c80000h ;100.0f
mov vertex[2].y,042c80000h ;100.0f
mov vertex[2].z,042c80000h ;100.0f

mov vertex[3].x,0c2c80000h ;-100.0f
mov vertex[3].y,042c80000h ;100.0f
mov vertex[3].z,042c80000h ;100.0f

mov vertex[4].x,0c2c80000h ;-100.0f
mov vertex[4].y,0c2c80000h ;-100.0f
mov vertex[4].z,0c2c80000h ;-100.0f

mov vertex[5].x,042c80000h ;100.0f
mov vertex[5].y,0c2c80000h ;-100.0f
mov vertex[5].z,0c2c80000h ;-100.0f

mov vertex[6].x,042c80000h ;100.0f
mov vertex[6].y,042c80000h ;100.0f
mov vertex[6].z,0c2c80000h ;-100.0f

mov vertex[7].x,0c2c80000h ;-100.0f
mov vertex[7].y,042c80000h ;100.0f
mov vertex[7].z,0c2c80000h ;-100.0f

;lbl_SetVertices_End:
add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
SetVertices endp
