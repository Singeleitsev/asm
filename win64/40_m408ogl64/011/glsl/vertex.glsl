#version 330 core

layout (location = 0) in vec4 aPos;
layout (location = 1) in vec4 aNormal;
layout (location = 2) in vec4 aDiffuse;
layout (location = 3) in vec4 aSpecular;
layout (location = 4) in vec4 aAmbient;
layout (location = 5) in vec4 aEmissive;
layout (location = 6) in vec4 aProps0;
layout (location = 7) in vec4 aProps1;

uniform mat4 uProjection;
uniform mat4 uView;
uniform mat4 uModel;

out vec3 vPos;
out vec3 vNormal;
out vec4 vDiffuse;
out vec4 vSpecular;
out vec4 vAmbient;
out vec4 vEmissive;
out vec4 vProps0;
out vec4 vProps1;

void main()
{
gl_Position = uProjection * uView * uModel * aPos;

vPos = (uModel * aPos).xyz;

// Normal matrix: inverse-transpose of upper-left 3x3 of model only
// for world-space normal
mat3 mtxNormal = transpose(inverse(mat3(uModel)));
vNormal = normalize(mtxNormal * aNormal.xyz);

vDiffuse = aDiffuse;
vSpecular = aSpecular;
vAmbient = aAmbient;
vEmissive = aEmissive;
vProps0 = aProps0; // x=Ns, y=Ni, z=Tr, w=Pr
vProps1 = aProps1; // x=Pm, y=Pc, z=Pcr, w=illum (as float bits)
}


