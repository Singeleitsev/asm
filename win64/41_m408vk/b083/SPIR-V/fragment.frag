#version 450
layout(location = 0) in vec3 vNormal;
layout(location = 1) in vec3 vPos;
layout(location = 0) out vec4 outColor;

struct Material {
    vec3 Kd;
    vec3 Ks;
    vec3 Ka;
    vec3 Ke;
    vec3 Tf;
    float Ns;
    float Ni;
    float d;
    float Tr;
    float Pr;
    float Pm;
    float Pc;
    float Pcr;
    int illum;
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
    vec3 ambient = (length(m.Ka) > 0.0 ? m.Ka : m.Kd) * 0.2;

    // Diffuse (Kd)
    vec3 diffuse = m.Kd * NdotL;

    // Specular (Ks, Ns) — only for illum >= 2
    vec3 specular = vec3(0.0);
    if (m.illum >= 2) {
        vec3 V = normalize(-vPos);
        vec3 H = normalize(L + V);
        float s = pow(max(dot(N, H), 0.0), max(m.Ns, 1.0));
        specular = m.Ks * s;
    }

    // Emissive (Ke)
    vec3 emissive = m.Ke;

    // Combine
    vec3 color = ambient + diffuse + specular + emissive;

    // Transmission filter tints the color (Tf)
    color *= m.Tf;

    // Alpha: d is the Wavefront opacity (d = 1 -> opaque)
    float alpha = clamp(m.d, 0.0, 1.0);

    outColor = vec4(color, alpha);
	//outColor = vec4(color.b, color.g, color.r, alpha);
}

