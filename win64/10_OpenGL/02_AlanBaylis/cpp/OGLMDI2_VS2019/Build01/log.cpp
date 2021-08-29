#include "stdio.h"
#include "stdlib.h"
#include "stdarg.h"
#include "log.h"


// This is actually ShiningKnight's log class...

FILE* log;

void CLog::initLog()
{
	//Clear the log contents
	if((log=fopen("log.txt", "wb"))==NULL) return;

	//Close the file, and return a success!
	fclose(log);
}

void CLog::terminateLog()
{
	if(log) fclose(log);
}

void CLog::addLine(char* text, ...)
{
   char temptext[1024];

	va_list ap;

	//Initialize variable argument list
	va_start(ap, text);
	    vsprintf(temptext, text, ap);
	va_end(ap);

	//Open the log file for append
	if((log = fopen("log.txt", "a+"))==NULL) return;

	fprintf(log,"%s\n", temptext);

	//Close the file
	fclose(log);
}

// NO LINEBREAK
void CLog::addLine2(char* text, ...)
{
   char temptext[1024];

	va_list ap;

	//Initialize variable argument list
	va_start(ap, text);
	    vsprintf(temptext, text, ap);
	va_end(ap);

	//Open the log file for append
	if((log = fopen("log.txt", "a+"))==NULL) return;

	fprintf(log,"%s", temptext);

	//Close the file
	fclose(log);
}
