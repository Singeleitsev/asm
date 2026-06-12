@echo off
echo Compiling vertex shader...
glslc -fshader-stage=vertex vertex.vert -o vert.spv
if %errorlevel% equ 0 (
    echo Success: vert.spv generated.
) else (
    echo Error: compilation failed.
)
pause