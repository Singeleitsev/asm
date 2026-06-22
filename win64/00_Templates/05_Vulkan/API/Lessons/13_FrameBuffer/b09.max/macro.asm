;Macros
LOG_TEXT macro text
lea rcx,text
call WriteLog
endm