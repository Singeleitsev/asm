#version 330 core

in vec3 vPos;
in vec3 vNormal;
in vec4 vDiffuse;
in vec4 vSpecular;
in vec4 vAmbient;
in vec4 vEmissive;
in vec4 vProps0; // x=Ns, y=Ni, z=Tr, w=Pr
in vec4 vProps1; // x=Pm, y=Pc, z=Pcr, w=illum (as float bits)

uniform vec3 uCameraPos;
uniform vec3 uLightDir;

out vec4 FragColor;

const float PI = 3.14159265;

// Lighting Parameters (3-point rig)

const vec3 KEY_COLOR   = vec3(0.5, 0.5, 0.45); // Slightly warm
const vec3 FILL_COLOR   = vec3(0.4, 0.45, 0.5); // Cool fill
const vec3 RIM_COLOR   = vec3(0.8, 0.8, 0.9);  // Bright rim
const vec3 AMBIENT_FLOOR = vec3(0.15); // Global ambient fill

// PBR Functions (for metal)

// GGX / Trowbridge-Reitz normal distribution
float D_GGX(float NdotH, float a)
{
float a2 = a * a;
float d = NdotH * NdotH * (a2 - 1.0) + 1.0;
return a2 / (PI * d * d);
}

// Smith height-correlated visibility (used as G / (4 NdotL NdotV))
float V_SmithGGXCorrelated(float NdotV, float NdotL, float a)
{
float a2 = a * a;
float gv = NdotL * sqrt(NdotV * NdotV * (1.0 - a2) + a2);
float gl = NdotV * sqrt(NdotL * NdotL * (1.0 - a2) + a2);
return 0.5 / max(gv + gl, 1e-4);
}

void main()
{
  // 1. Unpack material properties
  float Ns = vProps0.x;
  float Pr = vProps0.w;
  float Pm = vProps1.x;
  int illum = floatBitsToInt(vProps1.w);

  // 2. Setup vectors
  vec3 N = normalize(vNormal);
  if (!gl_FrontFacing) N = -N; // Two-sided lighting
  vec3 V = normalize(uCameraPos - vPos);
  
  vec3 L_key = normalize(uLightDir);
  vec3 L_fill = normalize(vec3(0.5, -0.8, 0.2));
  vec3 L_rim = normalize(vec3(0.1, -0.9, 0.8));

  // 3. Calculate dot products
  float NdotV = max(dot(N, V), 1e-3);
  
  // Key light
  vec3 H_key = normalize(L_key + V);
  float NdotL_key = max(dot(N, L_key), 0.0);
  float NdotH_key = max(dot(N, H_key), 0.0);
  float VdotH_key = max(dot(V, H_key), 0.0);
  
  // Fill light
  float NdotL_fill = max(dot(N, L_fill), 0.0);
  
  // Rim light
  vec3 H_rim = normalize(L_rim + V);
  float NdotL_rim = max(dot(N, L_rim), 0.0);
  float NdotH_rim = max(dot(N, H_rim), 0.0);

  // 4. Material colors
  vec3 Kd = vDiffuse.rgb;
  vec3 Ks = vSpecular.rgb;
  float alpha = vDiffuse.a;

  vec3 color = vec3(0.0);

  // 5. Lighting Evaluation based on Illumination Model
  if (illum == 0) 
  {
    // Constant color
    color = Kd;
  } 
  else if (illum == 1) 
  {
    // Diffuse only (Lambertian)
    color = Kd * (NdotL_key + NdotL_fill) * 0.5; 
  } 
  else if (Pm > 0.5) 
  {
    // Metallic PBR
    float a = Pr * Pr;
    float D = D_GGX(NdotH_key, a);
    float Vis = V_SmithGGXCorrelated(NdotV, NdotL_key, a);
    vec3 F = Ks + (1.0 - Ks) * pow(1.0 - VdotH_key, 5.0);
    
    vec3 spec = D * Vis * F * NdotL_key;
    
    // Fake ambient reflection for metals (avoids pitch black)
    vec3 ambientMetal = Ks * (vAmbient.rgb + AMBIENT_FLOOR) * 1.5;
    
    // Add rim light specular for that "studio" edge
    float rimFactor = pow(NdotH_rim, max(Ns, 1.0)) * step(1e-4, NdotL_rim);
    
    color = spec + ambientMetal + (Ks * RIM_COLOR * rimFactor) + vEmissive.rgb;
  } 
  else 
  {
    // Dielectric (Blinn-Phong)
    vec3 ambient = (vAmbient.rgb + AMBIENT_FLOOR) * Kd;
    vec3 diffuse = Kd * (KEY_COLOR * NdotL_key + FILL_COLOR * NdotL_fill);
    
    float specPower = max(Ns, 1.0);
    float spec_key = pow(NdotH_key, specPower) * step(1e-4, NdotL_key);
    float spec_rim = pow(NdotH_rim, specPower) * step(1e-4, NdotL_rim);
    
    vec3 specular = Ks * (KEY_COLOR * spec_key + RIM_COLOR * spec_rim);
    
    color = ambient + diffuse + specular + vEmissive.rgb;
  }

  // 6. Output
  FragColor = vec4(color, alpha);
}


