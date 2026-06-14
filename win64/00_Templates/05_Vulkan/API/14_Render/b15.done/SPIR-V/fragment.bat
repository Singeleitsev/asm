@echo off
echo Compiling fragment shader...
glslc -fshader-stage=fragment fragment.vert -o fragment.spv
if %errorlevel% equ 0 (
    echo Success: fragment.spv generated.
) else (
    echo Error: compilation failed.
)
pause