{prg14_14.pas}
{�ணࠬ��, ��뢠��� ��楤��� �� ��ᥬ����}
program my_pas;
{$D+} {����祭�� ������ ���ଠ樨 ��� �⫠�稪�}
uses crt;
procedure asmproc(ch:char;x,y,kol:integer); external;
{��楤�� asmproc ������ ��� ������}
{$L c:\bp\work\prg14_12.obj}
BEGIN
	clrscr;	{���⪠ �࠭�}
	asmproc('a',1,4,5);
	asmproc('s',9,2,7);
END.

