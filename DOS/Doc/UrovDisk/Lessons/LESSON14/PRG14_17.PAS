{prg14_17.pas}
program	prg14101;
{���譨� �������}
function	AddAsm:word; external;
{$L prg14_18.obj}
var
	value1:	word;	{����� ��� ���譨�}
	value2:	word;
	rez:	word;
begin
	value1:=2;
	value2:=3;
{�맮� �㭪樨}
	rez:=AddAsm;
	writeln('�������: ',rez);
end.

