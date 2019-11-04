#!/bin/bash

# Copyright 2016 Intel Corporation All Rights Reserved
# 
# Intel makes no representations about the suitability of this software for any purpose.
# THIS SOFTWARE IS PROVIDED ""AS IS."" INTEL SPECIFICALLY DISCLAIMS ALL WARRANTIES,
# EXPRESS OR IMPLIED, AND ALL LIABILITY, INCLUDING CONSEQUENTIAL AND OTHER INDIRECT DAMAGES,
# FOR THE USE OF THIS SOFTWARE, INCLUDING LIABILITY FOR INFRINGEMENT OF ANY PROPRIETARY
# RIGHTS, AND INCLUDING THE WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
# Intel does not assume any responsibility for any errors which may appear in this software
# nor any responsibility to update it.

folder=$1/Data

function convert {
  if [ -f "./$folder/$1.$2" ]; then
    echo "Converting $1.$2 shader..."
    glslangValidator -V -H -o $folder/$1.$2.spv $folder/$1.$2 > $folder/$1.$2.spv.txt
  fi
}

if [ "$1" == "" ]; then
  echo "No arguments provided! Please specify folder and shader file name without extension."
  echo "Example usage: source compile_shaders.sh Tutorials/03 shader"
elif [ "$2" == "" ]; then
  echo "Shader name not provided! Please specify folder name and shader file name without extension."
  echo "Example usage: source compile_shaders.sh Tutorials/03 shader"
else
  echo "Converting GLSL shaders into SPIR-V assembly in the '$folder' folder."
  convert $2 vert
  convert $2 frag
fi
