@echo off
echo Compiling vertex shader...
glslc -fshader-stage=vertex triangle.vert -o triangle.spv
if %errorlevel% equ 0 (
    echo Success: triangle.spv generated.
) else (
    echo Error: compilation failed.
)
pause