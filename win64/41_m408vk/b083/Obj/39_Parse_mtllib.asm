parse_mtllib proc
PROLOG 100h

add rsi,7 ;"mtllib" + delimiter

;lbl_End:
inc gnCurrent_mtllib
EPILOG
parse_mtllib endp