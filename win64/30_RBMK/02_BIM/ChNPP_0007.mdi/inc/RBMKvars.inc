;Rotation Angle
aXY dd 0.5
aYZ dd 0.5
aXZ dd 0.5

;Matrices 48*48 = 2304 elements
mtxType db 2304 dup (0)
mtxL dd 2304 dup (0.0)
mtxH dd 2304 dup (0.0)
