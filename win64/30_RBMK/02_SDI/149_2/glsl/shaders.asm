szVertexShader:
db "#version 120", 0Dh, 0Ah
db 0Dh, 0Ah
db "// Vertex attributes", 0Dh, 0Ah
db "attribute vec3 aPos;", 0Dh, 0Ah
db "attribute vec3 aNormal;", 0Dh, 0Ah
db "attribute vec3 aColor;", 0Dh, 0Ah
db 0Dh, 0Ah
db "// Interpolated outputs to the fragment shader", 0Dh, 0Ah
db "varying vec3 vNormalEye;", 0Dh, 0Ah
db "varying vec3 vPositionEye;", 0Dh, 0Ah
db "varying vec3 vColor;", 0Dh, 0Ah
db 0Dh, 0Ah
db "void main()", 0Dh, 0Ah
db "{", 0Dh, 0Ah
db " // Clip-space position", 0Dh, 0Ah
db " gl_Position = gl_ModelViewProjectionMatrix * vec4(aPos, 1.0);", 0Dh, 0Ah
db 0Dh, 0Ah
db " // Eye-space position", 0Dh, 0Ah
db " vPositionEye = (gl_ModelViewMatrix * vec4(aPos, 1.0)).xyz;", 0Dh, 0Ah
db 0Dh, 0Ah
db " // Eye-space normal (inverse-transpose of the model-view upper 3x3)", 0Dh, 0Ah
db " vNormalEye = normalize(gl_NormalMatrix * aNormal);", 0Dh, 0Ah
db 0Dh, 0Ah
db " // Pass color through", 0Dh, 0Ah
db " vColor = aColor;", 0Dh, 0Ah
db "}", 0Dh, 0Ah
db 0


szFragmentShader:
db "#version 120", 0Dh, 0Ah
db 0Dh, 0Ah
db "// Light direction (towards the light, in eye space)", 0Dh, 0Ah
db "uniform vec3 lightDir;", 0Dh, 0Ah
db 0Dh, 0Ah
db "// Interpolated inputs from the vertex shader", 0Dh, 0Ah
db "varying vec3 vNormalEye;", 0Dh, 0Ah
db "varying vec3 vPositionEye;", 0Dh, 0Ah
db "varying vec3 vColor;", 0Dh, 0Ah
db 0Dh, 0Ah
db "// Material constants (matching fixed-function defaults)", 0Dh, 0Ah
db "const vec3 ambientColor = vec3(0.4, 0.4, 0.4);", 0Dh, 0Ah
db "const vec3 diffuseColor = vec3(0.4, 0.4, 0.35);", 0Dh, 0Ah
db "const vec3 specularColor = vec3(0.4, 0.4, 0.4);", 0Dh, 0Ah
db "const float shininess = 8.0;", 0Dh, 0Ah
db 0Dh, 0Ah
db "void main()", 0Dh, 0Ah
db "{", 0Dh, 0Ah
db " // Normalize the interpolated normal", 0Dh, 0Ah
db " vec3 N = normalize(vNormalEye);", 0Dh, 0Ah
db 0Dh, 0Ah
db " // Light direction", 0Dh, 0Ah
db " vec3 L = normalize(lightDir);", 0Dh, 0Ah
db 0Dh, 0Ah
db " // View direction: from the fragment towards the eye", 0Dh, 0Ah
db " vec3 V = normalize(-vPositionEye);", 0Dh, 0Ah
db 0Dh, 0Ah
db " // Lambertian diffuse term", 0Dh, 0Ah
db " float NdotL = max(dot(N, L), 0.0);", 0Dh, 0Ah
db 0Dh, 0Ah
db " // Blinn-Phong specular term (half-vector)", 0Dh, 0Ah
db " vec3 H = normalize(L + V);", 0Dh, 0Ah
db " float NdotH = max(dot(N, H), 0.0);", 0Dh, 0Ah
db " float spec = pow(NdotH, shininess);", 0Dh, 0Ah
db 0Dh, 0Ah
db " // Combine", 0Dh, 0Ah
db " vec3 ambient = ambientColor;", 0Dh, 0Ah
db " vec3 diffuse = diffuseColor * NdotL;", 0Dh, 0Ah
db " vec3 specular = specularColor * spec;", 0Dh, 0Ah
db 0Dh, 0Ah
db " // Vertex color modulates ambient + diffuse", 0Dh, 0Ah
db " vec3 finalColor = vColor * (ambient + diffuse) + specular;", 0Dh, 0Ah
db 0Dh, 0Ah
db " gl_FragColor = vec4(finalColor, 1.0);", 0Dh, 0Ah
db "}", 0Dh, 0Ah
db 0



