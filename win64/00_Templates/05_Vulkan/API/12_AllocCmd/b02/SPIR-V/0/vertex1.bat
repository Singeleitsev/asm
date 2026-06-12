@echo off
setlocal enabledelayedexpansion

echo Compiling vertex shader...
glslc -fshader-stage=vertex triangle.vert -o triangle.spv
if errorlevel 1 (
    echo Compilation failed.
    pause
    exit /b 1
)

echo Generating hex dump...
certutil -encodehex triangle.spv triangle.hex 4 > nul
if errorlevel 1 (
    echo CertUtil failed.
    pause
    exit /b 1
)

echo Creating triangle.asm with hex bytes...
(
    echo ; triangle.asm - auto-generated from triangle.vert
    echo vert_spv \
) > triangle.asm

for /f "usebackq tokens=*" %%a in ("triangle.hex") do (
    set "line=%%a"
    rem Remove leading spaces and the offset column
    set "line=!line:~73!"
    if not "!line!"=="" (
        echo db !line! >> triangle.asm
    )
)

del triangle.hex
echo Success: triangle.asm created.
pause