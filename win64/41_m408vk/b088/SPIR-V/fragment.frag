#version 450
layout(location = 0) in vec3 vNormal;
layout(location = 1) in vec3 vPos;
layout(location = 0) out vec4 outColor;

struct Material {
 vec4 Kd; // 0 (xyz used, w ignored)
 vec4 Ks; // 16 (xyz used, w ignored)
 vec4 Ka; // 32 (xyz used, w ignored)
 vec4 Ke; // 48 (xyz used, w ignored)
 vec4 Tf; // 64 (xyz used, w ignored)
 float Ns; // 80
 float Ni; // 84
 float d; // 88
 float Tr; // 92
 float Pr; // 96
 float Pm; // 100
 float Pc; // 104
 float Pcr; // 108
 int illum; // 112
};

layout(std140, set=0, binding=0) uniform MaterialBlock {
 Material materials[1];
};

void main() {
 Material m = materials[0];

 vec3 N = normalize(vNormal);
 vec3 L = normalize(vec3(1.0, 1.0, 1.0));
 float NdotL = max(dot(N, L), 0.0);

  // Ambient (Ka, fall back to Kd)
  vec4 ambient = (length(m.Ka) > 0.0 ? m.Ka : m.Kd) * 0.2;

  // Diffuse (Kd)
  vec4 diffuse = m.Kd * NdotL;

  // Specular (Ks, Ns) — only for illum >= 2
  vec4 specular = vec4(0.0);
  if (m.illum >= 2) {
  vec3 V = normalize(-vPos);
  vec3 H = normalize(L + V);
  float s = pow(max(dot(N, H), 0.0), max(m.Ns, 1.0));
  specular = m.Ks * s;
 }

 // Emissive (Ke)
 vec4 emissive = m.Ke;

 // Combine
 vec4 color = ambient + diffuse + specular + emissive;

 // Transmission filter tints the color (Tf)
 color *= m.Tf;

 // Alpha: d is the Wavefront opacity (d = 1 -> opaque)
 float alpha = clamp(m.d, 0.0, 1.0);
 alpha = max(alpha, 0.15 * length(specular.xyz));  // glass gets a faint highlight

    outColor = vec4(color.xyz, alpha);
}


