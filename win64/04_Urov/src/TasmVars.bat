@echo off
rem	этот файл необходимо выполнить, включив в autoexec.bat следующую строку:
rem 	call	\путь\TasmVars.bat
rem
set MSDevDir=C:\MSDEV

rem строки для Windows 95/98
set VcOsDir=WIN95
set PATH="%MSDevDir%\BIN";"%MSDevDir%\BIN\%VcOsDir%";"%PATH%"
set INCLUDE=%MSDevDir%\INCLUDE;%MSDevDir%\MFC\INCLUDE;%INCLUDE%
set LIB=%MSDevDir%\LIB;%MSDevDir%\MFC\LIB;%LIB%

rem строки для Windows NT
rem set VcOsDir=WINNT
rem set PATH=%MSDevDir%\BIN;%MSDevDir%\BIN\%VcOsDir%;%PATH%
rem set INCLUDE=%MSDevDir%\INCLUDE;%MSDevDir%\MFC\INCLUDE;%INCLUDE%
rem set LIB=%MSDevDir%\LIB;%MSDevDir%\MFC\LIB;%LIB%
