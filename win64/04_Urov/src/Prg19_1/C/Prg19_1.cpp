#include <windows.h>
LRESULT CALLBACK WindowProc(HWND ,UINT ,WPARAM ,LPARAM);
char szClassWindow[] = "КаркасноеПриложение";	/*Имя класса окна*/
int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpszCmdLine, int nCmdShow)
{
	HWND hWnd;
	MSG lpMsg;
	WNDCLASSEX wcl;
/* Определение класса окна */
wcl.cbSize = sizeof (wcl);	//длина структуры WNDCLASSEXA
wcl.style = CS_HREDRAW|CS_VREDRAW;	//CS (Class Style) - стиль класса окна
wcl.lpfnWndProc = WindowProc;	//адрес функции окна
wcl.cbClsExtra  =0;	//для внутреннего использования Windows
wcl.cbWndExtra  = 0; 	//для внутреннего использования Windows
wcl.hInstance = hInst;	//дескриптор данного приложения
wcl.hIcon = LoadIconA(NULL,IDI_APPLICATION);	//стандартная иконка
wcl.hCursor = LoadCursorA(NULL,IDC_ARROW);	//стандартный курсор
wcl.hbrBackground =(HBRUSH)GetStockObject (WHITE_BRUSH); // определить заполнение окна белым цветом
wcl.lpszMenuName = NULL;	//без меню
wcl.lpszClassName = szClassWindow;	//имя класса окна
wcl.hIconSm=NULL;	//дескриптор маленькой иконки, связываемой с классом окна

//зарегистрировать класс окна
if (!RegisterClassEx (&wcl))
return 0;
//создать окно и присвоить дескриптор окна переменной hWnd
hWnd=CreateWindowEx(
	0,		//расширенный стиль окна
	szClassWindow,	//имя класса окна
 	"Каркас программы для Win32 на С++",	//заголовок окна
	WS_OVERLAPPEDWINDOW,	//стиль окна
	CW_USEDEFAULT,	//X-координата верх. левого угла окна
	CW_USEDEFAULT,	//Y-координата верх. левого угла окна
	CW_USEDEFAULT,	//ширина окна
	CW_USEDEFAULT,	//высота окна
	NULL,	//дескриптор родительского окна
	NULL,	//дескриптор меню окна
	hInst,	//идент. приложения создавшего окно
	NULL);	//указатель на область данных приложения
//показать окно и перерисовать содержимое
ShowWindow (hWnd, nCmdShow);
UpdateWindow (hWnd);
/* запустить цикл обработки сообщений */
while (GetMessage(&lpMsg,NULL,0,0))
{
	TranslateMessage(&lpMsg);	//разрешить использование клавиатуры
	DispatchMessage(&lpMsg);	//вернуть управление Windows
}
	return lpMsg.wParam;
}	//конец WinMain
LRESULT CALLBACK WindowProc (HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
//Функция WndProc вызывается операционной системой Windows 95
//и получает в качестве параметров сообщения из очереди 
//сообщений данного приложения
{
	switch(message)
	{
	case WM_DESTROY: /* завершение программы */
	PostQuitMessage (0);
	break;
	default:
	//Сюда попадают все сообщения, не обрабатываемые в данной оконной функции.
	//Далее эти сообщения направляются обратно Windows на обработку по умолчанию
	return DefWindowProc (hWnd, message, wParam, lParam);
}
return 0;
}
