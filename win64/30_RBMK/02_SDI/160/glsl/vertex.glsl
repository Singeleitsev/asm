#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec3 aColor;

uniform mat4 uModel;
uniform mat4 uView;
uniform mat4 uProjection;

out vec3 vNormalEye;
out vec3 vPositionEye;
out vec3 vColor;

void main()
{
    vec4 worldPos = uModel * vec4(aPos, 1.0);
    vPositionEye = (uView * worldPos).xyz;

    mat3 normalMatrix = transpose(inverse(mat3(uView * uModel)));
    vNormalEye = normalize(normalMatrix * aNormal);

    vColor = aColor;

    gl_Position = uProjection * uView * worldPos;
}