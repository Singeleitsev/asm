#include "console.h"


ConsoleWindow::ConsoleWindow()
:   MAX_CONSOLE_ROWS(500),
    MAX_CONSOLE_COLUMNS(500)
{
    hStdHandle = INVALID_HANDLE_VALUE;
}

ConsoleWindow::~ConsoleWindow()
{
    if (hStdHandle != INVALID_HANDLE_VALUE)
    {
        FreeConsole();
        fclose(fp);
    }
}

void ConsoleWindow::Open()
{
    if (hStdHandle == INVALID_HANDLE_VALUE)
    {
        CONSOLE_SCREEN_BUFFER_INFO coninfo;
        // allocate a console for this app
        AllocConsole();
        // set the screen buffer to be big enough to let us scroll text
        GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &coninfo);
        coninfo.dwSize.Y = MAX_CONSOLE_ROWS;
        SetConsoleScreenBufferSize(GetStdHandle(STD_OUTPUT_HANDLE), coninfo.dwSize);
        // set title
        SetConsoleTitle("Debug Window");
        // redirect unbuffered STDOUT to the console
        hStdHandle = GetStdHandle(STD_OUTPUT_HANDLE);
        hConHandle = _open_osfhandle((long)hStdHandle, _O_TEXT);
        fp = _fdopen( hConHandle, "w" );
        *stdout = *fp;
        setvbuf( stdout, NULL, _IONBF, 0 );
        // redirect unbuffered STDIN to the console
        hStdHandle = GetStdHandle(STD_INPUT_HANDLE);
        hConHandle = _open_osfhandle((long)hStdHandle, _O_TEXT);
        fp = _fdopen( hConHandle, "r" );
        *stdin = *fp;
        setvbuf( stdin, NULL, _IONBF, 0 );
        // redirect unbuffered STDERR to the console
        hStdHandle = GetStdHandle(STD_ERROR_HANDLE);
        hConHandle = _open_osfhandle((long)hStdHandle, _O_TEXT);
        fp = _fdopen( hConHandle, "w" );
        *stderr = *fp;
        setvbuf( stderr, NULL, _IONBF, 0 );
        // make cout, wcout, cin, wcin, wcerr, cerr, wclog and clog point to console as well
        ios::sync_with_stdio();
	}
};

void ConsoleWindow::Close()
{
    if (hStdHandle != INVALID_HANDLE_VALUE)
    {
        FreeConsole();
        fclose(fp);
        hStdHandle = INVALID_HANDLE_VALUE;
    }
};

