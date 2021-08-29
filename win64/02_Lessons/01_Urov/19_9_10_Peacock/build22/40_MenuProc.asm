;-------------------MenuProc-----------------------------------------------
;обработка сообщений от меню
MenuProc proc uses rbx @@hwnd:QWORD, @@wparam:QWORD, @@hdc:QWORD, @@hbrush:QWORD

;Ensure the Stack is Aligned by 10h
	and rsp,-16

;Store retrieved Values:
	mov @@hwnd,rcx
	mov @@wparam,rdx
	mov @@hdc,r8
	mov @@hbrush,r9

;r8 is the proper place for wParam
	mov r8,rdx

;Select Command
	cmp r8,IDM_DRAWTEXT	
		je @@idmdrawtext
	cmp r8,IDM_TEXTOUT
		je @@idmtextout
	cmp r8,IDM_LENGTH
		je @@idmlength
	cmp r8,IDM_RECTANGLE
		je @@idmrectangle
	cmp r8,IDM_PEACOCK
		je @@idmpeacock
	cmp r8,IDM_LACES
		je @@idmlaces
	cmp r8,IDM_ABOUT
		je @@idmabout
	jmp endMenuProc

;@@idmdrawtext:
	include 41_DrawText.asm

;@@idmtextout:
	include 42_TextOut.asm

;@@idmlength:
	include 43_Length.asm

;@@idmrectangle:
	include 44_Rectangle.asm

;@@idmpeacock:	;"Павлин"
	include 45_Peacock.asm

;@@idmlaces:	;"Кружева"
	include 46_Laces.asm

;@@idmabout:
	include 47_About.asm

;... ... ...

endMenuProc:
	mov eax,0
	ret

;@@TXT_TEXTOUT db 'Текст выведен функцией TEXTOUT'
;lenTXT_TEXTOUT=$-@@TXT_TEXTOUT	
;@@TXT_DRAWTEXT db 'Текст выведен функцией DRAWTEXT',0

MenuProc endp
