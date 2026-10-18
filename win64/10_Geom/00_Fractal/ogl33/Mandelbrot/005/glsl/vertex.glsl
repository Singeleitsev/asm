#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;   // unused by the fractal, kept for VAO compatibility
layout (location = 2) in vec3 aColor;    // tint for the fractal

uniform mat4 uModel;
uniform mat4 uView;
uniform mat4 uProjection;

out vec2 vFractalUV;
out vec3 vColor;

void main()
{
    vFractalUV = aPos.xy;
    vColor    = aColor;
    gl_Position = uProjection * uView * uModel * vec4(aPos, 1.0);
}

