
;Cube entity definition

;Cube consists of
;8 Vertices
;12 Edges
;6 Squares

;   3--------2
;  /|       /|   y
; 7--------6 |   |
; | |      | |   |
; | 0------|-1   0-----x
; |/       |/   /
; 4--------5   z

;Initial Coordinates Array
;8 Vertices
;Each defined by 4 Coordinates

v0	dd -0.5,-0.5,-0.5,0 ;0
	dd 0.5,-0.5,-0.5,0 ;1
	dd 0.5, 0.5,-0.5,0 ;2
	dd -0.5, 0.5,-0.5,0 ;3
	dd -0.5,-0.5, 0.5,0 ;4
	dd 0.5,-0.5, 0.5,0 ;5
	dd 0.5, 0.5, 0.5,0 ;6
	dd -0.5, 0.5, 0.5,0 ;7

;Face Indices Array
;6 Square Faces
;Each defined by 4 Vertices
f0	db 0,3,2,1 ;0
	db 0,1,5,4 ;1
	db 1,2,6,5 ;2
	db 2,3,7,6 ;3
	db 3,0,4,7 ;4
	db 4,5,6,7 ;5

;Face Color Array
;6 colors of 6 Faces
;Each defined by RGBA
fc0	dd 1.000, 0.000, 0.000, 0.000 ;0
	dd 1.000, 1.000, 0.000, 0.000 ;1
	dd 0.000, 1.000, 0.000, 0.000 ;2
	dd 0.000, 1.000, 1.000, 0.000 ;3
	dd 0.000, 0.000, 1.000, 0.000 ;4
	dd 1.000, 0.000, 1.000, 0.000 ;5

