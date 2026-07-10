#version 450

// OBJECT GEOMETRY

// 8 unique cube vertices
const vec3 cubeVerts[8] = {
vec3(-0.5, -0.5, -0.5), // 0
vec3(+0.5, -0.5, -0.5), // 1
vec3(+0.5, +0.5, -0.5), // 2
vec3(-0.5, +0.5, -0.5), // 3
vec3(-0.5, -0.5, +0.5), // 4
vec3(+0.5, -0.5, +0.5), // 5
vec3(+0.5, +0.5, +0.5), // 6
vec3(-0.5, +0.5, +0.5)  // 7
};

// Cube vertices (36 vertices, 6 faces, 2 triangles per face)
const vec3 cubeVertices[36] = {
// Face -Z (Bottom) – White
cubeVerts[0], cubeVerts[3], cubeVerts[2],
cubeVerts[0], cubeVerts[2], cubeVerts[1],
// Face -Y (Front) – Blue
cubeVerts[0], cubeVerts[1], cubeVerts[5],
cubeVerts[0], cubeVerts[5], cubeVerts[4],
// Face +X (Right) – Red
cubeVerts[1], cubeVerts[2], cubeVerts[6],
cubeVerts[1], cubeVerts[6], cubeVerts[5],
// Face +Y (Back) – Green
cubeVerts[2], cubeVerts[3], cubeVerts[7],
cubeVerts[2], cubeVerts[7], cubeVerts[6],
// Face -X (Left) – Orange
cubeVerts[0], cubeVerts[4], cubeVerts[7],
cubeVerts[0], cubeVerts[7], cubeVerts[3],
// Face +Z (Top) – Yellow
cubeVerts[4], cubeVerts[5], cubeVerts[6],
cubeVerts[4], cubeVerts[6], cubeVerts[7]
};

// OBJECT COLOR

// Rubik's cube face colours (matching the order above)
const vec3 faceColors[6] = {
vec3(1.0, 1.0, 1.0), //Face -Z (Bottom) – White
vec3(0.0, 0.0, 1.0), //Face -Y (Front) – Blue
vec3(1.0, 0.0, 0.0), //Face +X (Right) – Red
vec3(0.0, 1.0, 0.0), //Face +Y (Back) – Green
vec3(1.0, 0.5, 0.0), //Face -X (Left) – Orange
vec3(1.0, 1.0, 0.0) //Face +Z (Top) – Yellow
};

// PROJECTION TRANSFORMATIONS

// Option 1. Orthographic Projection
float nearOrtho = 0.1;
float farOrtho  =  10.0;
float o22 = -1.0 / (farOrtho - nearOrtho);
//float o23 = -nearOrtho / (farOrtho - nearOrtho);
float o23 = nearOrtho * o22;
float o32 = 0.0;

mat4 mtxOrtho = mat4(
vec4(1.0, 0.0, 0.0, 0.0),
vec4(0.0, 1.0, 0.0, 0.0),
vec4(0.0, 0.0, o22, o32),
vec4(0.0, 0.0, o23, 1.0)
);

// Option 2. Perspective Projection
float aspect = 1.0; // 512/512
float fovY = radians(60.0);
float nearPersp = 0.1; // Near plane at z_eye = -0.1
float farPersp = 10.0; // Far plane at z_eye = -10.0

float p11 = 1.0 / tan(fovY * 0.5);
float p00 = p11 / aspect;
//float p22 = -farPersp / (farPersp - nearPersp);
float p22 = farPersp / (nearPersp - farPersp);
float p32 = -1.0; // Makes w_clip = -z_eye
float p23 = nearPersp * p22;

mat4 mtxPersp = mat4(
vec4(p00, 0.0, 0.0, 0.0),
vec4(0.0, p11, 0.0, 0.0),
vec4(0.0, 0.0, p22, p32),
vec4(0.0, 0.0, p23, 0.0)
);

// MODEL AFFINE TRANSFORMATIONS

// Step 1. Translate
float dx = 0.0;
float dy = 0.0;
float dz = -2.0;
mat4 mtxTrans = mat4(
vec4(1.0, 0.0, 0.0, 0.0),
vec4(0.0, 1.0, 0.0, 0.0),
vec4(0.0, 0.0, 1.0, 0.0),
vec4( dx,  dy,  dz, 1.0)
);

// Step 2. Scale
float S = 1.0;
mat4 mtxScale = mat4(
vec4(  S, 0.0, 0.0 ,0.0),
vec4(0.0,  -S, 0.0, 0.0), //Right-hand
vec4(0.0, 0.0,   S ,0.0), 
vec4(0.0, 0.0, 0.0, 1.0)
);

// Step 3. Rotate around X-axis
float angleX = radians(60.0);
float cX = cos(angleX);
float sX = sin(angleX);
mat4 rotX = mat4(
vec4(1.0, 0.0, 0.0, 0.0),
vec4(0.0,  cX, -sX, 0.0),
vec4(0.0,  sX,  cX, 0.0),
vec4(0.0, 0.0, 0.0, 1.0)
);

// Step 4. Rotate around Z-axis
float angleZ = radians(30.0);
float cZ = cos(angleZ);
float sZ = sin(angleZ);
mat4 rotZ = mat4(
vec4( cZ, -sZ, 0.0, 0.0),
vec4( sZ,  cZ, 0.0, 0.0),
vec4(0.0, 0.0, 1.0, 0.0),
vec4(0.0, 0.0, 0.0, 1.0)
);

// Step 5. Rotate around Y-axis
float angleY = radians(10.0);
float cY = cos(angleY);
float sY = sin(angleY);
mat4 rotY = mat4(
vec4( cY, 0.0,  sY, 0.0),
vec4(0.0, 1.0, 0.0, 0.0),
vec4(-sY, 0.0,  cY, 0.0),
vec4(0.0, 0.0, 0.0, 1.0)
);

// Ortho Sequence
//mat4 projView = mtxOrtho;
//mat4 projView = mtxOrtho * mtxTrans * mtxScale;
//mat4 projView = mtxOrtho * mtxTrans * mtxScale * rotX;
//mat4 projView = mtxOrtho * mtxTrans * mtxScale * rotX * rotZ;
//mat4 projView = mtxOrtho * mtxTrans * mtxScale * rotX * rotZ * rotY;

// Perspective Sequence
//mat4 projView = mtxPersp;
//mat4 projView = mtxPersp * mtxTrans * mtxScale;
//mat4 projView = mtxPersp * mtxTrans * mtxScale * rotX;
//mat4 projView = mtxPersp * mtxTrans * mtxScale * rotX * rotZ;
mat4 projView = mtxPersp * mtxTrans * mtxScale * rotX * rotZ * rotY;

// OUTPUT

layout(location = 0) out vec3 fragColor;

void main() {
int face = gl_VertexIndex / 6;
vec3 pos = cubeVertices[gl_VertexIndex];
fragColor = faceColors[face];

gl_Position = projView * vec4(pos, 1.0);
}
