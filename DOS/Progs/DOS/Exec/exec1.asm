INCLUDE ShowAX.inc
.model small
.stack 256
.data
File_Name	db	'C:\DiesIrae.exe', 0
Point_Name	dd	File_Name
.code
main	proc
	mov	ax, @data
	mov	ds, ax

	mov	ax, 4B00h
	mov	bx, 0
	lds	dx, Point_Name
	int	21h
ShowAX
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main
