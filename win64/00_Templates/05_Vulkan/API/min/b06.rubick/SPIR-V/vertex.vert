#version 450

// ---- Hardcoded cube vertices (36 vertices, 6 faces, 2 triangles per face) ----
// Order: each face is two triangles (6 vertices).
const vec3 cubeVertices[36] = vec3[](
// Face -Z (Bottom) – White
vec3(-1.0,-1.0,-1.0), vec3(-1.0,+1.0,-1.0), vec3(+1.0,+1.0,-1.0),
vec3(-1.0,-1.0,-1.0), vec3(+1.0,+1.0,-1.0), vec3(+1.0,-1.0,-1.0),
// Face -X (Left) – Red
vec3(-1.0,-1.0,-1.0), vec3(-1.0,-1.0,+1.0), vec3(-1.0,+1.0,+1.0),
vec3(-1.0,-1.0,-1.0), vec3(-1.0,+1.0,+1.0), vec3(-1.0,+1.0,-1.0),
// Face +Y (Back) – Blue
vec3(-1.0,+1.0,-1.0), vec3(-1.0,+1.0,+1.0), vec3(+1.0,+1.0,+1.0),
vec3(-1.0,+1.0,-1.0), vec3(+1.0,+1.0,+1.0), vec3(+1.0,+1.0,-1.0),
// Face +X (Right) – Orange
vec3(+1.0,-1.0,-1.0), vec3(+1.0,+1.0,+1.0), vec3(+1.0,-1.0,+1.0),
vec3(+1.0,-1.0,-1.0), vec3(+1.0,+1.0,-1.0), vec3(+1.0,+1.0,+1.0),
// Face -Y (Front) – Green
vec3(-1.0,-1.0,-1.0), vec3(+1.0,-1.0,+1.0), vec3(-1.0,-1.0,+1.0),
vec3(-1.0,-1.0,-1.0), vec3(+1.0,-1.0,-1.0), vec3(+1.0,-1.0,+1.0),
// Face +Z (Top) – Yellow
vec3(-1.0,-1.0,+1.0), vec3(+1.0,+1.0,+1.0), vec3(-1.0,+1.0,+1.0),
vec3(-1.0,-1.0,+1.0), vec3(+1.0,-1.0,+1.0), vec3(+1.0,+1.0,+1.0)
);



// ---- Rubik's cube face colours (matching the order above) ----
const vec3 faceColors[6] = vec3[](
vec3(1.0, 1.0, 1.0), // -Z : White
vec3(1.0, 0.0, 0.0), // -X : Red
vec3(0.0, 0.0, 1.0),  // +Y : Blue
vec3(1.0, 0.5, 0.0), // +X : Orange
vec3(0.0, 1.0, 0.0), // -Y : Green
vec3(1.0, 1.0, 0.0) // +Z : Yellow
);




// ---------- AFFINE TRANSFORMATIONS ----------
// Toggle these lines with comments to see the effect step by step.

// 0. Orthographic Projection (drops the Z-component, preserving X and Y)
// This is what converts 3D to 2D screen coordinates.
mat4 ortho = mat4(
vec4( 1.0, 0.0, 0.0, 0.0),
vec4( 0.0, 1.0, 0.0, 0.0),
vec4( 0.0, 0.0, 0.0, 0.0), // Z is discarded
vec4( 0.0, 0.0, 0.0, 1.0)
);

// 1. Overall Scale (adjust this value to change size)
float S = 0.5;
mat4 scaleMat = mat4(
vec4( S, 0.0, 0.0, 0.0),
vec4( 0.0, S, 0.0, 0.0),
vec4( 0.0, 0.0, S, 0.0),
vec4( 0.0, 0.0, 0.0, 1.0)
);

// 2. Rotate around X-axis (approx 35.264 degrees) - this tilts it down
float angleX = atan(1.0 / sqrt(2.0)); // ~35.264 deg
float cX = cos(angleX);
float sX = sin(angleX);
mat4 rotX = mat4(
vec4( 1.0, 0.0, 0.0, 0.0),
vec4( 0.0, cX, -sX, 0.0),
vec4( 0.0, sX,  cX, 0.0),
vec4( 0.0, 0.0, 0.0, 1.0)
);

// 3. Rotate around Y-axis (45 degrees) - this spins the cube horizontally
float angleY = 3.14159265 / 4.0; // 45 deg
float cY = cos(angleY);
float sY = sin(angleY);
mat4 rotY = mat4(
vec4( cY, 0.0, sY, 0.0),
vec4( 0.0, 1.0, 0.0, 0.0),
vec4(-sY, 0.0, cY, 0.0),
vec4( 0.0, 0.0, 0.0, 1.0)
);

// To test a step, uncomment it and comment out the one below.
//mat4 projView = ortho; // Step 0: Ortho
//mat4 projView = ortho * scaleMat; // Step 1: Ortho, Scale
//mat4 projView = ortho * scaleMat * rotX; // Step 2: Ortho, Scale, Rotate about X
mat4 projView = ortho * scaleMat * rotX * rotY; // Step 3: Ortho, Scale, Rotate



// ---- Outputs ----
layout(location = 0) out vec3 fragColor;

void main() {
int face = gl_VertexIndex / 6;
vec3 pos = cubeVertices[gl_VertexIndex];
fragColor = faceColors[face];

gl_Position = projView * vec4(pos, 1.0);
}
