	TITLE	prg19_1.cpp
	.386P
include listing.inc
if @Version gt 510
.model FLAT
else
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT DWORD USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
;	COMDAT ??8@YAHABU_GUID@@0@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?szClassWindow@@3PADA				; szClassWindow
_DATA	SEGMENT
?szClassWindow@@3PADA DB 0caH, 0e0H, 0f0H, 0eaH, 0e0H, 0f1H, 0edH, 0eeH, 0e5H
	DB	0cfH, 0f0H, 0e8H, 0ebH, 0eeH, 0e6H, 0e5H, 0edH, 0e8H, 0e5H, 00H ; szClassWindow
_DATA	ENDS
PUBLIC	_WinMain@16
PUBLIC	?WindowProc@@YGJPAUHWND__@@IIJ@Z		; WindowProc
EXTRN	__imp__GetMessageA@16:NEAR
EXTRN	__imp__TranslateMessage@4:NEAR
EXTRN	__imp__DispatchMessageA@4:NEAR
EXTRN	__imp__UpdateWindow@4:NEAR
EXTRN	__imp__RegisterClassExA@4:NEAR
EXTRN	__imp__CreateWindowExA@48:NEAR
EXTRN	__imp__ShowWindow@8:NEAR
EXTRN	__imp__LoadCursorA@8:NEAR
EXTRN	__imp__LoadIconA@8:NEAR
EXTRN	__imp__GetStockObject@4:NEAR
_DATA	SEGMENT
$SG29710 DB	0caH, 0e0H, 0f0H, 0eaH, 0e0H, 0f1H, ' ', 0efH, 0f0H, 0eeH
	DB	0e3H, 0f0H, 0e0H, 0ecH, 0ecH, 0fbH, ' ', 0e4H, 0ebH, 0ffH, ' W'
	DB	'in32 ', 0edH, 0e0H, ' ', 0d1H, '++', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File prg19_1.cpp
_lpMsg$ = -32
_wcl$ = -80
_hInst$ = 8
_nCmdShow$ = 20
_hWnd$ = -4
_WinMain@16 PROC NEAR
; Line 5
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 10
	mov	DWORD PTR _wcl$[ebp], 48		; 00000030H
; Line 11
	mov	DWORD PTR _wcl$[ebp+4], 3
; Line 12
	mov	DWORD PTR _wcl$[ebp+8], OFFSET FLAT:?WindowProc@@YGJPAUHWND__@@IIJ@Z ; WindowProc
; Line 13
	mov	DWORD PTR _wcl$[ebp+12], 0
; Line 14
	mov	DWORD PTR _wcl$[ebp+16], 0
; Line 15
	mov	eax, DWORD PTR _hInst$[ebp]
	mov	DWORD PTR _wcl$[ebp+20], eax
; Line 16
	push	32512					; 00007f00H
	push	0
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wcl$[ebp+24], eax
; Line 17
	push	32512					; 00007f00H
	push	0
	call	DWORD PTR __imp__LoadCursorA@8
	mov	DWORD PTR _wcl$[ebp+28], eax
; Line 18
	push	0
	call	DWORD PTR __imp__GetStockObject@4
	mov	DWORD PTR _wcl$[ebp+32], eax
; Line 19
	mov	DWORD PTR _wcl$[ebp+36], 0
; Line 20
	mov	DWORD PTR _wcl$[ebp+40], OFFSET FLAT:?szClassWindow@@3PADA ; szClassWindow
; Line 21
	mov	DWORD PTR _wcl$[ebp+44], 0
; Line 24
	lea	eax, DWORD PTR _wcl$[ebp]
	push	eax
	call	DWORD PTR __imp__RegisterClassExA@4
	movzx	eax, ax
	test	eax, eax
	jne	$L29705
; Line 25
	xor	eax, eax
	jmp	$L29694
; Line 27
$L29705:
; Line 39
	push	0
	mov	eax, DWORD PTR _hInst$[ebp]
	push	eax
	push	0
	push	0
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	13565952				; 00cf0000H
	push	OFFSET FLAT:$SG29710
	push	OFFSET FLAT:?szClassWindow@@3PADA	; szClassWindow
	push	0
	call	DWORD PTR __imp__CreateWindowExA@48
	mov	DWORD PTR _hWnd$[ebp], eax
; Line 41
	mov	eax, DWORD PTR _nCmdShow$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 42
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4
; Line 44
$L29712:
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _lpMsg$[ebp]
	push	eax
	call	DWORD PTR __imp__GetMessageA@16
	test	eax, eax
	je	$L29713
; Line 46
	lea	eax, DWORD PTR _lpMsg$[ebp]
	push	eax
	call	DWORD PTR __imp__TranslateMessage@4
; Line 47
	lea	eax, DWORD PTR _lpMsg$[ebp]
	push	eax
	call	DWORD PTR __imp__DispatchMessageA@4
; Line 48
	jmp	$L29712
$L29713:
; Line 49
	mov	eax, DWORD PTR _lpMsg$[ebp+8]
	jmp	$L29694
; Line 50
$L29694:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	16					; 00000010H
_WinMain@16 ENDP
_TEXT	ENDS
EXTRN	__imp__DefWindowProcA@16:NEAR
EXTRN	__imp__PostQuitMessage@4:NEAR
_TEXT	SEGMENT
_hWnd$ = 8
_message$ = 12
_wParam$ = 16
_lParam$ = 20
?WindowProc@@YGJPAUHWND__@@IIJ@Z PROC NEAR		; WindowProc
; Line 55
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 56
	mov	eax, DWORD PTR _message$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L29719
; Line 58
$L29723:
; Line 59
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 60
	jmp	$L29720
; Line 61
$L29724:
; Line 64
	mov	eax, DWORD PTR _lParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _wParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _message$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DefWindowProcA@16
	jmp	$L29718
; Line 65
	jmp	$L29720
$L29719:
	cmp	DWORD PTR -4+[ebp], 2
	je	$L29723
	jmp	$L29724
$L29720:
; Line 66
	xor	eax, eax
	jmp	$L29718
; Line 67
$L29718:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	16					; 00000010H
?WindowProc@@YGJPAUHWND__@@IIJ@Z ENDP			; WindowProc
_TEXT	ENDS
END
