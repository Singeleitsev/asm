;----------------------------------------
;Макросы-аналоги INVOKE, которые
;резервируют стек,
;помещают параметры в регистры и
;вызывают внешнюю функцию,
;Вход: имя вызываемой функции и параметры
;----------------------------------------
Call0 MACRO funcname
	sub rsp, 20h
	call funcname
	add rsp, 20h
ENDM ;Call0
;----------
Call1 MACRO funcname, par1
	sub rsp, 20h
	mov rcx, par1
	call funcname
	add rsp, 20h
ENDM ;Call1
;----------
Call2 MACRO funcname, par1, par2
	sub rsp, 20h
	mov rcx, par1
	mov rdx, par2
	call funcname
	add rsp, 20h
ENDM ;Call2
;----------
Call3 MACRO funcname, par1, par2, par3
	sub rsp, 20h
	mov rcx, par1
	mov rdx, par2
	mov r8, par3
	call funcname
	add rsp, 20h
ENDM ;Call3
;----------
Call4 MACRO funcname, par1, par2, par3, par4
	sub rsp, 20h
	mov rcx, par1
	mov rdx, par2
	mov r8, par3
	mov r9, par4
	call funcname
	add rsp, 20h
ENDM ;Call4
;----------
Call5 MACRO funcname, par1, par2, par3, par4, par5
	sub rsp, 30h
	mov rcx, par1
	mov rdx, par2
	mov r8, par3
	mov r9, par4
	mov rax, par5
	mov qword ptr [rsp+20h], rax
	call funcname
	add rsp, 30h
ENDM ;Call5
;----------
Call6 MACRO funcname, par1, par2, par3, par4, par5, par6
	sub rsp, 30h
	mov rcx, par1
	mov rdx, par2
	mov r8, par3
	mov r9, par4
	mov rax, par5
	mov qword ptr [rsp+20h], rax
	mov rax, par6
	mov qword ptr [rsp+28h], rax
	call funcname
	add rsp, 30h
ENDM ;Call6
;----------
Call8 MACRO funcname, par1, par2, par3, par4, par5, par6, par7, par8
	sub rsp, 40h
	mov rcx, par1
	mov rdx, par2
	mov r8, par3
	mov r9, par4
	mov rax, par5
	mov qword ptr [rsp+20h], rax
	mov rax, par6
	mov qword ptr [rsp+28h], rax
	mov rax, par7
	mov qword ptr [rsp+30h], rax
	mov rax, par8
	mov qword ptr [rsp+38h], rax
	call funcname
	add rsp, 40h
ENDM ;Call8
;----------
Call12 MACRO funcname, par1, par2, par3, par4, par5, par6, par7, par8, par9, par10, par11, par12
	sub rsp, 60h
	mov rcx, par1
	mov rdx, par2
	mov r8, par3
	mov r9, par4
	mov rax, par5
	mov qword ptr [rsp+20h], rax
	mov rax, par6
	mov qword ptr [rsp+28h], rax
	mov rax, par7
	mov qword ptr [rsp+30h], rax
	mov rax, par8
	mov qword ptr [rsp+38h], rax
	mov rax, par9
	mov qword ptr [rsp+40h], rax
	mov rax, par10
	mov qword ptr [rsp+48h], rax
	mov rax, par11
	mov qword ptr [rsp+50h], rax
	mov rax, par12
	mov qword ptr [rsp+58h], rax
	call funcname
	add rsp, 60h
ENDM ;Call12
;----------

