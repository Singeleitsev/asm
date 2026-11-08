#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec3 aColor;
layout (location = 3) in float aAlpha;

uniform mat4 uModel;
uniform mat4 uView;
uniform mat4 uProjection;

out vec3 vPositionEye;
out vec3 vNormalEye;
out vec3 vColor;
out float vAlpha;

void main()
{
mat4 mtxModelView = uView * uModel;

vec4 vPosition = mtxModelView * vec4(aPos, 1.0);
gl_Position = uProjection * vPosition;
vPositionEye = vPosition.xyz;

vNormalEye = transpose(inverse(mat3(mtxModelView))) * aNormal;

vColor = aColor;
vAlpha = aAlpha;

}

