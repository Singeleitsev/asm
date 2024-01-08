
section '.data' data readable writeable
pattin rd 50000
pattout rd 50000
;;;;;;;;;;;;;;;;;;Neurons
neurons rd 10000   ;   neurons per layer * 3 layers * neuron size
;;;;;;;;;;;;;;;;;Connections
cnxns rd  3000000  ; 480M memory = 120M Dwords = 40M cnxns MAX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dword in structure    ;;      Nueron Layout    ;;        Connection Layout         ;;
;                      ;;                       ;;                                  ;;
;dword 1               ;;      N1 input         ;;        Lower Neuron Address      ;;
;dword 2               ;;      N2 input         ;;        offset                    ;;
;dword 3               ;;      N3 input         ;;        Higher Neuron Address     ;;
;dword 4               ;;      N4 input         ;;        Unused                    ;;
;dword 5               ;;      N1 output        ;;        Cnxn1 weight              ;;
;dword 6               ;;      N2 output        ;;        Cnxn2 weight              ;;
;dword 7               ;;      N3 output        ;;        Cnxn3 weight              ;;
;dword 8               ;;      N4 output        ;;        Cnxn4 weight              ;;
;dword 9               ;;      N1 error         ;;        Cnxn1 delta               ;;
;dword 10              ;;      N2 error         ;;        Cnxn2 delta               ;;
;dword 11              ;;      N3 error         ;;        Cnxn3 delta               ;;
;dword 12              ;;      N4 error         ;;        Cnxn4 delta               ;;
;                      ;;                       ;;                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; each group of 4 neurons occupies 12 dwords (48 bytes)
; each group of 4 connections occupies 12 dwords (48 bytes)
; The inputs, outputs, errors, weights and deltas are grouped so they
; can be handled in parallel, that is, 4 values can be read straight
; into a 128-bit register for 4x32bit floating point ops.
; For the connections, the 4 connections in a group always come from
; the same neuron, but go to consecutive neurons. The number of
; nuerons in a layer must always be a multiple of 4.
; The (Lower Neuron Address + offset) addresses the correct lower neuron
; input for the 4 connections. The higher neuron address gives the address
; of the neuron group containing the 4 neurons that each of the connections
; goes to.

;constants
ffffx4 dd 0ffffffffh
ffffx42 dd 0ffffffffh
ffffx43 dd 0ffffffffh
ffffx44 dd 0ffffffffh

minus1x4  dd -1.0
minus1x42 dd -1.0
minus1x43 dd -1.0
minus1x44 dd -1.0

minus2x4  dd -2.0
minus2x42 dd -2.0
minus2x43 dd -2.0
minus2x44 dd -2.0

plus1x4   dd 1.0
plus1x42  dd 1.0
plus1x43  dd 1.0
plus1x44  dd 1.0

plus3x4   dd 0.5
plus3x42  dd 0.5
plus3x43  dd 0.5
plus3x44  dd 0.5

point5x4  dd 0.5
point5x42 dd 0.5
point5x43 dd 0.5
point5x44 dd 0.5

point3x4  dd 0.1 ; 0.3
point3x42 dd 0.1 ; 0.3
point3x43 dd 0.1 ; 0.3
point3x44 dd 0.1 ; 0.3

point8x4  dd 0.1 ; 0.8
point8x42 dd 0.1 ; 0.8
point8x43 dd 0.1 ; 0.8
point8x44 dd 0.1 ; 0.8

point000004  dd 0.00001
point0000042 dd 0.00001
point0000043 dd 0.00001
point0000044 dd 0.00001

ID_OK		   = 101
ID_CANCEL	   = 102
ID_CAPTION	   = 201
ID_MESSAGE	   = 202
ID_ICONERROR	   = 301
ID_ICONINFORMATION = 302
ID_ICONQUESTION    = 303
ID_ICONWARNING	   = 304
ID_TOPMOST	   = 401

;section '.data' data readable writeable
; data to make prog work for variable neuron count
;;;;;;;;;;;;;;;;;;Neurons



;;;;;----------------------------
ncount0 dd	1008 ; 3024 ; 1008
ncount1 dd	256 ; 1008 ; 512 ; 512 ;20
ncount2 dd     1008 ; 3024; 1008 ;20

ccount0 dd  ?
ccount1 dd  ?
naddress0 dd ?
naddress1 dd ?
naddress2 dd ?
caddress0 dd ?
caddress1 dd ?

;required for main loop
numpattern1 dw 4
numsets dd  300 ; 300 ; 200 ; 44718
mulpatt dd 4	       ; number of neurons in layer0/4
loopcount dd 0
;pattern outs


;required in setcnxnadd.inc
;random1 dd -0.015 ;     for reasons unknown, these need to
;random2 dd -0.005 ;     be small for this prog to work with
;random3 dd  0.005 ;     large numbers of neurons
;random4 dd  0.015 ;
seed1 dw   9972 ; 9973
div2 dd 16324.0
;required in CnxnForward
number2 dd 2.0
nummin1 dd -1.0

;required in winproc1
  flags dd ?
  caption rb 40h
  message rb 100h

;required for output of 4xdec numbers in ascii
spacer01 dw 32*256 + 10        ; space(32), return(10)
test01 dd ?
spacer02 dw 32*256 + 10        ; space(32), return(10)
test02 dd ?
spacer03 dw 32*256 + 10
test03 dd ?
spacer04 dw 32*256 + 10
test04 dd ?
spacer11 dw 32*256 + 10        ; space(32), return(10)
test11 dd ?
spacer12 dw 32*256 + 10        ; space(32), return(10)
test12 dd ?
spacer13 dw 32*256 + 10
test13 dd ?
spacer14 dw 32*256 + 10
test14 dd ?
spacer21 dw 32*256 + 10        ; space(32), return(10)
test21 dd ?
spacer22 dw 32*256 + 10        ; space(32), return(10)
test22 dd ?
spacer23 dw 32*256 + 10
test23 dd ?
spacer24 dw 32*256 + 10
test24 dd ?
spacer31 dw 32*256 + 10        ; space(32), return(10)
test31 dd ?
spacer32 dw 32*256 + 10        ; space(32), return(10)
test32 dd ?
spacer33 dw 32*256 + 10
test33 dd ?
spacer34 dw 32*256 + 10
test34 dd ?
test5 dw ?	;leave this here to terminate string with 0000h

;required in eaxFloatToDec
floatstore dd 0.91
flmill dd 1000.0
flcent dd 100.0
fldec dw ?
decout dd ?
isneg dw 0

;required in calMidError
intersum1 dd 0.0

;required for AXtoHex
;inbinspace1 dw ?
;inbin1 dw ?
;space1234 dw ?
;outhex1 dw ?
;outhex2 dw ?
;spaser1234 dw ?  ;for string terminator

; required for adjustweights
const03 dd 0.3 ; 0.1 ; 0.3
const05 dd 0.5 ; 0.1 ; 0.5
const08 dd 0.7 ; 0.8

;required for cnxnForward
const30 dd 3.0

;required for setforiter
pattptr1 dd ?
nptr1 dd ?

;required in storebmp
plus256 dd 256.0

floattest dd 255.0
surfacestore dd ?
patttemp dd ?
linenumber dw ?

inbin1 dw ?
outhex1 dw ?
outhex2 dw ?
outhex3 dw ?
outhex4 dw ?
outhexdum dw ?
secondhex dw ?
rectlefthold dd 0
  _title db 'flat assembler DirectDraw application',0
  _class db 'FDDRAW32',0

  _error db 'Error',0
  _ddraw_error db 'Direct Draw initialization failed.',0
  _open_error db 'Failed opening data file.',0

  picture db '320x21.bmp',0
;  picture db  'DDRAW3.GIF',0
;  picture db 'ddraw2.bmp',0 ; 'DDRAW1.GIF',0
  test1 dd 0
  addoffset dd 0
  addoffset2 dd 0
