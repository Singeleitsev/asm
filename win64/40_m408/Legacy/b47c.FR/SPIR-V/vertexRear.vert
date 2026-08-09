#version 450

// --- Vertex inputs from model buffers ---
layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;

// --- Output to fragment shader ---
layout(location = 0) out vec3 fragColor;

// Push constant block
layout(push_constant) uniform MaterialPC {
    vec3 Kd;
    //vec3 Ks;
    //vec3 Ka;
    //float Ns;
    //float d;
} material;


// --- Projection matrix (same as your cube version) ---
float nearOrtho = 0.1;
float farOrtho  = 10.0;
float o22 = -1.0 / (farOrtho - nearOrtho);
float o23 = nearOrtho * o22;
float o32 = 0.0;

mat4 mtxOrtho = mat4(
    vec4(1.0, 0.0, 0.0, 0.0),
    vec4(0.0, 1.0, 0.0, 0.0),
    vec4(0.0, 0.0, o22, o32),
    vec4(0.0, 0.0, o23, 1.0)
);

float aspect = 1.0;
float fovY = radians(60.0);
float nearPersp = 0.1;
float farPersp = 10.0;

float p11 = 1.0 / tan(fovY * 0.5);
float p00 = p11 / aspect;
float p22 = farPersp / (nearPersp - farPersp);
float p32 = -1.0;
float p23 = nearPersp * p22;

mat4 mtxPersp = mat4(
    vec4(p00, 0.0, 0.0, 0.0),
    vec4(0.0, p11, 0.0, 0.0),
    vec4(0.0, 0.0, p22, p32),
    vec4(0.0, 0.0, p23, 0.0)
);

// --- Model transformations (scale + translate to fit view) ---
float S = 0.01; // scale factor
float dx = -0.57;
float dy = 0.0;
float dz = -1.8;

mat4 mtxTrans = mat4(
    vec4(1.0, 0.0, 0.0, 0.0),
    vec4(0.0, 1.0, 0.0, 0.0),
    vec4(0.0, 0.0, 1.0, 0.0),
    vec4(dx, dy, dz, 1.0)
);

mat4 mtxScale = mat4(
    vec4(S, 0.0, 0.0, 0.0),
    vec4(0.0, -S, 0.0, 0.0),  // flip Y if needed
    vec4(0.0, 0.0, S, 0.0),
    vec4(0.0, 0.0, 0.0, 1.0)
);

// --- Optional rotations (keep or remove) ---
float angleX = radians(75.0);
float cX = cos(angleX);
float sX = sin(angleX);
mat4 rotX = mat4(
    vec4(1.0, 0.0, 0.0, 0.0),
    vec4(0.0, cX, -sX, 0.0),
    vec4(0.0, sX, cX, 0.0),
    vec4(0.0, 0.0, 0.0, 1.0)
);

float angleZ = radians(320.0);
float cZ = cos(angleZ);
float sZ = sin(angleZ);
mat4 rotZ = mat4(
    vec4(cZ, -sZ, 0.0, 0.0),
    vec4(sZ, cZ, 0.0, 0.0),
    vec4(0.0, 0.0, 1.0, 0.0),
    vec4(0.0, 0.0, 0.0, 1.0)
);

float angleY = radians(0.0);
float cY = cos(angleY);
float sY = sin(angleY);
mat4 rotY = mat4(
    vec4(cY, 0.0, sY, 0.0),
    vec4(0.0, 1.0, 0.0, 0.0),
    vec4(-sY, 0.0, cY, 0.0),
    vec4(0.0, 0.0, 0.0, 1.0)
);

mat4 projView = mtxPersp * mtxTrans * mtxScale * rotX * rotZ * rotY;

// --- main ---
void main() {
// Use the model vertex position
gl_Position = projView * vec4(inPosition, 1.0);

// solid blue
//fragColor = vec3(0.0, 0.0, 0.9);   

// Simple diffuse lighting
vec3 lightDir = normalize(vec3(1.0, 1.0, 1.0));
float diff = max(dot(inNormal, lightDir), 0.0);
vec3 ambient = material.Kd * 0.2;
fragColor = ambient + material.Kd * diff;

}
