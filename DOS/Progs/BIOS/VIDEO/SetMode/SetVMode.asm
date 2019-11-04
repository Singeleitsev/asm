.model SMALL
.stack 256
.data
.code
main proc
	mov	ax, @data
	mov	ds, ax
;Enable CPU Access to the Video Adapter's I/O Ports and Video Refresh Buffer
	mov	ah, 12h			;12h int 10h: VideoConfig
	mov	al, 00h			;Enable Video
	mov	bl, 32h			;Subfunc No.
	int	10h
;Set VideoMode 640x480x256
	mov	ah, 00h			;00h int 10h - Set VideoMode
	mov	al, 19h			;640x480x256
	int	10h
exit:
        mov     ax, 4c00h
        int     21h
main endp
end main

