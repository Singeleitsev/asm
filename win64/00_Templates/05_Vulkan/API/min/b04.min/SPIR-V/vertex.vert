#version 450

// Unit cube (36 vertices, 12 triangles)
const vec3 cubePositions[36] = vec3[36](
    // Front face (z = 0.5)
    vec3(-0.5, -0.5,  0.5), vec3( 0.5, -0.5,  0.5), vec3( 0.5,  0.5,  0.5),
    vec3(-0.5, -0.5,  0.5), vec3( 0.5,  0.5,  0.5), vec3(-0.5,  0.5,  0.5),
    // Back face (z = -0.5)
    vec3(-0.5, -0.5, -0.5), vec3( 0.5,  0.5, -0.5), vec3( 0.5, -0.5, -0.5),
    vec3(-0.5, -0.5, -0.5), vec3(-0.5,  0.5, -0.5), vec3( 0.5,  0.5, -0.5),
    // Left face (x = -0.5)
    vec3(-0.5, -0.5, -0.5), vec3(-0.5, -0.5,  0.5), vec3(-0.5,  0.5,  0.5),
    vec3(-0.5, -0.5, -0.5), vec3(-0.5,  0.5,  0.5), vec3(-0.5,  0.5, -0.5),
    // Right face (x = 0.5)
    vec3( 0.5, -0.5, -0.5), vec3( 0.5,  0.5,  0.5), vec3( 0.5, -0.5,  0.5),
    vec3( 0.5, -0.5, -0.5), vec3( 0.5,  0.5, -0.5), vec3( 0.5,  0.5,  0.5),
    // Top face (y = 0.5)
    vec3(-0.5,  0.5, -0.5), vec3(-0.5,  0.5,  0.5), vec3( 0.5,  0.5,  0.5),
    vec3(-0.5,  0.5, -0.5), vec3( 0.5,  0.5,  0.5), vec3( 0.5,  0.5, -0.5),
    // Bottom face (y = -0.5)
    vec3(-0.5, -0.5, -0.5), vec3( 0.5, -0.5,  0.5), vec3(-0.5, -0.5,  0.5),
    vec3(-0.5, -0.5, -0.5), vec3( 0.5, -0.5, -0.5), vec3( 0.5, -0.5,  0.5)
);

layout(location = 0) out vec3 fragColor;

void main() {
    vec3 pos = cubePositions[gl_VertexIndex];
    gl_Position = vec4(pos, 1.0);
    fragColor = vec3(1.0, 0.0, 0.0); // red
}

