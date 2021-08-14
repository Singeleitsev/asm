 mov rcx,[mn] ;Number of Vertices
 mov [i],rcx
 mov rsi,V ;Attractor Base Address
.BallVertex:
 invoke glColor3f, float dword [rsi+10h], float dword [rsi+14h], float dword [rsi+18h]
 invoke glVertex3f, float dword [rsi+0], float dword [rsi+4], float dword [rsi+8]
 add rsi,20h ;Size of CustomPoint Structure
 dec [i]
 cmp [i],0
 jg .BallVertex