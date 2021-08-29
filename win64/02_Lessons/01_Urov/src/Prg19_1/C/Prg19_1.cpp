#include <windows.h>
LRESULT CALLBACK WindowProc(HWND ,UINT ,WPARAM ,LPARAM);
char szClassWindow[] = "�������������������";	/*��� ������ ����*/
int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpszCmdLine, int nCmdShow)
{
	HWND hWnd;
	MSG lpMsg;
	WNDCLASSEX wcl;
/* ����������� ������ ���� */
wcl.cbSize = sizeof (wcl);	//����� ��������� WNDCLASSEXA
wcl.style = CS_HREDRAW|CS_VREDRAW;	//CS (Class Style) - ����� ������ ����
wcl.lpfnWndProc = WindowProc;	//����� ������� ����
wcl.cbClsExtra  =0;	//��� ����������� ������������� Windows
wcl.cbWndExtra  = 0; 	//��� ����������� ������������� Windows
wcl.hInstance = hInst;	//���������� ������� ����������
wcl.hIcon = LoadIconA(NULL,IDI_APPLICATION);	//����������� ������
wcl.hCursor = LoadCursorA(NULL,IDC_ARROW);	//����������� ������
wcl.hbrBackground =(HBRUSH)GetStockObject (WHITE_BRUSH); // ���������� ���������� ���� ����� ������
wcl.lpszMenuName = NULL;	//��� ����
wcl.lpszClassName = szClassWindow;	//��� ������ ����
wcl.hIconSm=NULL;	//���������� ��������� ������, ����������� � ������� ����

//���������������� ����� ����
if (!RegisterClassEx (&wcl))
return 0;
//������� ���� � ��������� ���������� ���� ���������� hWnd
hWnd=CreateWindowEx(
	0,		//����������� ����� ����
	szClassWindow,	//��� ������ ����
 	"������ ��������� ��� Win32 �� �++",	//��������� ����
	WS_OVERLAPPEDWINDOW,	//����� ����
	CW_USEDEFAULT,	//X-���������� ����. ������ ���� ����
	CW_USEDEFAULT,	//Y-���������� ����. ������ ���� ����
	CW_USEDEFAULT,	//������ ����
	CW_USEDEFAULT,	//������ ����
	NULL,	//���������� ������������� ����
	NULL,	//���������� ���� ����
	hInst,	//�����. ���������� ���������� ����
	NULL);	//��������� �� ������� ������ ����������
//�������� ���� � ������������ ����������
ShowWindow (hWnd, nCmdShow);
UpdateWindow (hWnd);
/* ��������� ���� ��������� ��������� */
while (GetMessage(&lpMsg,NULL,0,0))
{
	TranslateMessage(&lpMsg);	//��������� ������������� ����������
	DispatchMessage(&lpMsg);	//������� ���������� Windows
}
	return lpMsg.wParam;
}	//����� WinMain
LRESULT CALLBACK WindowProc (HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
//������� WndProc ���������� ������������ �������� Windows 95
//� �������� � �������� ���������� ��������� �� ������� 
//��������� ������� ����������
{
	switch(message)
	{
	case WM_DESTROY: /* ���������� ��������� */
	PostQuitMessage (0);
	break;
	default:
	//���� �������� ��� ���������, �� �������������� � ������ ������� �������.
	//����� ��� ��������� ������������ ������� Windows �� ��������� �� ���������
	return DefWindowProc (hWnd, message, wParam, lParam);
}
return 0;
}
