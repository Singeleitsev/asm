@echo off
echo Compiling vertex shader...
glslc -fshader-stage=vertex vertex.vert -o vertex.spv
if %errorlevel% equ 0 (
    echo Success: vertex.spv generated.
) else (
    echo Error: compilation failed.
)
pause