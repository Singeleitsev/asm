setcnxnadd:
	mov r10,[naddress0abs]

;set numbers of cnxns
mov eax, [ncount0]
mov ecx, [ncount1]
mul ecx   ; number of cnxns in layer0/1 now in eax, so long as ncount0/1
	  ; not greater than 65k
mov [ccount0], eax
mov eax, [ncount1]
mov ecx, [ncount2]
mul ecx   ; number of cnxns in layer1/2 now in eax, so long as ncount1/2
	  ; not greater than 65k
mov [ccount1], eax
mul ebx

mov ebx, 0 ; offsets for 64bit[naddress0];address of first neu in layer0
mov eax, [ncount0]	     ; number of neurons in layer0
mov ecx, 12		; num of bytes in neuron
mul ecx 		;12*num neurons in layer0 now in eax
mov edx, 0 ; for 64-bit [naddress0] ; neuron start address
add edx, eax	  ;edx now has start address of 1st neu in layer1
mov [naddress1], edx
add rdx, r10
mov [naddress1abs], rdx
mov edx, [naddress1]
mov ecx, [ncount0]  ; number of neurons in layer0 ,outer loop
shr ecx, 2	  ; 4 layer0 neurons done per loop
mov eax, [ncount1]  ; number of neurons in layer1 ,inner loop
shr eax, 2	 ; each loop does 4 neurons
mov rsi, [caddress0abs] 	  ;address of 1st cnxn
	    ;for 64 bit, these are now offsets
inner11:
	mov [rsi], ebx		;mov neu 1st add to cnxn
	add rsi, 4		;go to next add.
	mov dword [rsi], 0	    ;offset here is 0
	add rsi, 4		;go to next add.
	mov [rsi], edx		;mov neu 2nd add to cnxn
	add rsi, 40		;start of next cnxn group , cnxn size - 8
	add edx, 48		; add neu group size takes edx to next neu
	dec eax
	jnz inner11

	mov edx, [naddress1]
	mov eax, [ncount1]  ; number of neurons in layer1 ,inner loop
	shr eax, 2	 ; each loop does 4 neurons
inner12:
	mov [rsi], ebx		;mov neu 1st add to cnxn
	add rsi, 4		;go to next add  remember, one dword dummy
	mov dword [rsi], 4 ;offset here is 1 dword to give position in the group
	add rsi, 4		;go to next add.  offset is 0
	mov [rsi], edx		;mov neu 2nd add to cnxn
	add rsi, 40		;start of next cnxn group , cnxn size - 8
	add edx, 48		; add neu group size takes edx to next neu
	dec eax
	jnz inner12

	mov edx, [naddress1]
	mov eax, [ncount1]  ; number of neurons in layer1 ,inner loop
	shr eax, 2	 ; each loop does 4 neurons
inner13:
	mov [rsi], ebx		;mov neu 1st add to cnxn
	add rsi, 4		;go to next add.  offset is 0
	mov dword [rsi], 8	    ;offset here is 2 dwords
	add rsi, 4		;go to next add.  offset is 0
	mov [rsi], edx		;mov neu 2nd add to cnxn
	add rsi, 40		;start of next cnxn group , cnxn size - 8
	add edx, 48		; add neu group size takes edx to next neu
	dec eax
	jnz inner13

	mov edx, [naddress1]
	mov eax, [ncount1]  ; number of neurons in layer1 ,inner loop
	shr eax, 2	 ; each loop does 4 neurons
inner14:
	mov [rsi], ebx		;mov neu 1st add to cnxn
	add rsi, 4		;go to next add  remember, one dword dummy
	mov dword [rsi], 12 ;offset here is 3 dword to give position in the group
	add rsi, 4		;go to next add.  offset is 0
	mov [rsi], edx		;mov neu 2nd add to cnxn
	add rsi, 40		;start of next cnxn group , cnxn size - 8
	add edx, 48		; add neu group size takes edx to next neu
	dec eax
	jnz inner14

	mov edx, [naddress1]
	mov eax, [ncount1]  ; number of neurons in layer1 ,inner loop
	shr eax, 2	 ; each loop does 4 neurons
	add ebx, 48  ; go to next neuron group address
dec ecx
jnz inner11

	 ;esi cnxn add still correct

;2nd layer1 to 2
mov eax, [ncount1]	     ; number of neurons in layer1
mov ecx, 12		; num of bytes in neuron
mul ecx 		;12*num neurons in layer1 in eax
mov ebx, [naddress1] ;nin4 ; add of first neu in layer1
mov edx, [naddress1] ;nin4 ; add of first neu in layer1

add edx, eax	  ;edx now has start address of 1st neu in layer2
mov [naddress2], edx
add rdx, r10
mov [naddress2abs], rdx
mov edx, [naddress2]

mov ecx, [ncount1]	 ; number of neurons in layer1 ,outer loop
shr ecx, 2
mov eax, [ncount2]	 ; number of neurons in layer2 ,inner loop
shr eax, 2
mov [caddress1abs], rsi 	  ;address of 2nd group of cnxns

inner112:
	mov [rsi], ebx		;mov neu 1st add to cnxn
	add rsi, 4		;go to next add.  offset is 0
	mov dword [rsi], 0	    ;offset here is 0
	add rsi, 4		;go to next add.  offset is 0
	mov [rsi], edx		;mov neu 2nd add to cnxn
	add rsi, 40		;start of next cnxn group , cnxn size - 8
	add edx, 48		; add neu group size takes edx to next neu
	dec eax
	jnz inner112

	mov edx, [naddress2]
	mov eax, [ncount2]  ; number of neurons in layer1 ,inner loop
	shr eax, 2	 ; each loop does 4 neurons
inner122:
	mov [rsi], ebx		;mov neu 1st add to cnxn
	add rsi, 4		;go to next add  remember, one dword dummy
	mov dword [rsi], 4 ;offset here is 1 dword to give position in the group
	add rsi, 4		;go to next add.
	mov [rsi], edx		;mov neu 2nd add to cnxn
	add rsi, 40		;start of next cnxn group , cnxn size - 8
	add edx, 48		; add neu group size takes edx to next neu
	dec eax
	jnz inner122

	mov edx, [naddress2]
	mov eax, [ncount2]  ; number of neurons in layer1 ,inner loop
	shr eax, 2	 ; each loop does 4 neurons
inner132:
	mov [rsi], ebx		;mov neu 1st add to cnxn
	add rsi, 4		;go to next add.
	mov dword [rsi], 8	    ;offset here is 2 dwords
	add rsi, 4		;go to next add.
	mov [rsi], edx		;mov neu 2nd add to cnxn
	add rsi, 40		;start of next cnxn group , cnxn size - 8
	add edx, 48		; add neu group size takes edx to next neu
	dec eax
	jnz inner132

	mov edx, [naddress2]
	mov eax, [ncount2]  ; number of neurons in layer1 ,inner loop
	shr eax, 2	 ; each loop does 4 neurons
inner142:
	mov [rsi], ebx		;mov neu 1st add to cnxn
	add rsi, 4		;go to next add  remember, one dword dummy
	mov dword [rsi], 12 ;offset here is 3 dword to give position in the group
	add rsi, 4		;go to next add.
	mov [rsi], edx		;mov neu 2nd add to cnxn
	add rsi, 40		;start of next cnxn group , cnxn size - 8
	add edx, 48		; add neu group size takes edx to next neu
	dec eax
	jnz inner142

	mov edx, [naddress2]
	mov eax, [ncount2]  ; number of neurons in layer1 ,inner loop
	shr eax, 2	 ; each loop does 4 neurons
	add ebx, 48  ; go to next neuron group address
dec ecx
jnz inner112


	ret