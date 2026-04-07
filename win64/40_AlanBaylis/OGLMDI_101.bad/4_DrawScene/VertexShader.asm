; Vertex shader source (GLSL)

vertex_shader_source db 0
    db "#version 330 core",0
    db "layout(location=0) in vec3 aPos;",0
    db "layout(location=1) in vec3 aNormal;",0
    db "layout(location=2) in vec2 aUV;",0
    db "uniform mat4 uMVP;",0
    db "out vec2 vUV;",0
    db "void main() { gl_Position = uMVP * vec4(aPos,1.0); vUV = aUV; }",0
    db 0 ; extra terminator for array of strings