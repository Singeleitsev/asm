;WindowsConA.inc - включаемый файл для консольных приложений 
;		(аналог windows.h в С) содержащий 
;		описание необходимых в программе на ассемблере 
;		структур и констант Windows
;-----------------------------------------------------------------
NULL	equ	0
ULONG	equ	<dd>
POINT	struc
x	ULONG	0
y	ULONG	0
	ends
GENERIC_READ	equ	80000000h
GENERIC_WRITE	equ	40000000h

OPEN_ALWAYS	equ	4

FILE_ATTRIBUTE_NORMAL	equ	00000080h

PAGE_WRITECOPY	equ	08h	;winnt.h
PAGE_READWRITE	equ	04h


SECTION_QUERY	equ	0001h	;winbase.h
SECTION_MAP_WRITE	equ	0002h

FILE_MAP_COPY	equ	SECTION_QUERY

FILE_MAP_WRITE	equ	SECTION_MAP_WRITE


;winnt.h
SECTION_QUERY	equ	0001h
SECTION_MAP_WRITE	equ	0002h
SECTION_MAP_READ	equ	0004h
SECTION_MAP_EXECUTE	equ	0008h
SECTION_EXTEND_SIZE	equ	0010h


STANDARD_RIGHTS_REQUIRED	equ	000F0000h
SECTION_QUERY	equ	0001h
SECTION_ALL_ACCESS	equ	STANDARD_RIGHTS_REQUIRED+SECTION_QUERY+SECTION_MAP_WRITE+SECTION_MAP_READ+SECTION_MAP_EXECUTE+SECTION_EXTEND_SIZE

FileMapAllAccess	equ	 SECTION_ALL_ACCESS


STD_INPUT_HANDLE	equ	-10	;winbase.h
STD_OUTPUT_HANDLE	equ	-11




