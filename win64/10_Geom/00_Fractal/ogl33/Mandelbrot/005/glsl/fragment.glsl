#version 330 core

in vec2 vFractalUV;
in vec3 vColor;

uniform vec2  uCenter;
uniform float uZoom;
uniform float uAspect;

out vec4 FragColor;

// IQ cosine palette — bright and continuous
vec3 palette(float t)
{
    return 0.5 + 0.5 * cos(6.28318 * (vec3(1.0, 1.0, 1.0) * t +
                                      vec3(0.0, 0.33, 0.67)));
}

void main()
{
    vec2 p = vec2(vFractalUV.x * uAspect, vFractalUV.y) * uZoom + uCenter;

    float logScale = log2(max(1.0 / max(uZoom, 1e-6), 1.0));
    float posTerm  = 0.5 * length(p - vec2(-0.75, 0.0));
    int   maxIter  = int(64.0 + 32.0 * clamp(logScale + posTerm, 0.0, 12.0));
    maxIter = min(maxIter, 512);

    vec2 z = vec2(0.0);
    int i = 0;
    for (; i < maxIter; ++i)
    {
        float zx2 = z.x * z.x;
        float zy2 = z.y * z.y;
        if (zx2 + zy2 > 4.0) break;
        z = vec2(zx2 - zy2 + p.x, 2.0 * z.x * z.y + p.y);
    }

    vec3 color;
    if (i == maxIter)
    {
        // Interior: very dark purple instead of pure black
        color = vec3(0.05, 0.0, 0.10);
    }
    else
    {
        float t = float(i) / float(maxIter);
        t = pow(t, 0.4);             // log-ish spread: more range spent on small t
        color = palette(t);
    }

    FragColor = vec4(color * vColor, 1.0);
}