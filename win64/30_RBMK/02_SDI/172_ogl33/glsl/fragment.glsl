#version 330 core

in vec3 vNormalEye;
in vec3 vPositionEye;
in vec3 vColor;

uniform vec3 lightDir;

out vec4 FragColor;

const vec3 ambientColor = vec3(0.4, 0.4, 0.4);
const vec3 diffuseColor = vec3(0.4, 0.4, 0.35);
const vec3 specularColor = vec3(0.4, 0.4, 0.4);
const float shininess = 8.0;

void main()
{
    vec3 N = normalize(vNormalEye);
    vec3 L = normalize(lightDir);
    vec3 V = normalize(-vPositionEye);

    float NdotL = max(dot(N, L), 0.0);
    vec3 H = normalize(L + V);
    float NdotH = max(dot(N, H), 0.0);
    float spec = pow(NdotH, shininess);

    vec3 ambient = ambientColor;
    vec3 diffuse = diffuseColor * NdotL;
    vec3 specular = specularColor * spec;

    vec3 finalColor = vColor * (ambient + diffuse) + specular;
    FragColor = vec4(finalColor, 1.0);
}