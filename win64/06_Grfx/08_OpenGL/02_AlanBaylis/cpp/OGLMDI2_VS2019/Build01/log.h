#ifndef __LOG_H__
#define __LOG_H__

#include <stdio.h>

class CLog
{
public:
static void addLine(char* text, ...);
static void addLine2(char* text, ...);
static void initLog();
static void terminateLog();
};

#endif
