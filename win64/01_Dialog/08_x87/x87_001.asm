includelib user32.lib
includelib kernel32.lib

MessageBoxA PROTO :QWORD,:QWORD,:QWORD,:QWORD
FatalExit PROTO :QWORD

.const
lpCaption db 'Message', 0
lpText db 'Hello World!', 0

.data
N dd 32
a dq 0

.data?
Buffer dd ?
a1 dq ?

.code

main proc
    sub rsp,8

;Calculate Step Angle 
	finit
;Alpha = 360/N = 2*pi/N
	fldpi
	mov Buffer,2
	fimul Buffer ;2*pi
	fidiv N ;2*pi/N
	fstp a1

xor rcx,rcx
mov ecx,N
xor rdx,rdx
;FOR i = 1 to N
cycle:
	finit
	;a = a + a1
	fld a
	fadd a1
	fst a
	;sinA = sin(a)
	fld a
	fsin
	fistp Buffer
	;cosA = cos(a)
	fld a
	fcos
	fistp Buffer
	;sincos
	fld a
	fsincos
;NEXT i
dec rcx
cmp rcx,0
jg cycle

;Message Out
    xor r9,r9        ;uType = MB_OK
    lea r8,lpCaption
    lea rdx,lpText
    xor rcx,rcx      ;hWnd = HWND_DESKTOP
    call MessageBoxA

    xor rcx,rcx
    call FatalExit
main endp
end
