#version 450

layout(location = 0) out vec3 fragColor;

const vec2 center = vec2(0.0, 0.0);
const float radius = 0.5;
const float angleStep = 2.0 * 3.141592653589793 / 6.0; // 60 degrees

// Colors for center + 6 outer vertices + repeat of first outer vertex
const vec3 colors[8] = vec3[](
    vec3(1.0, 1.0, 1.0),   // center
    vec3(1.0, 0.0, 0.0),   // vertex 1 - red
    vec3(1.0, 0.5, 0.0),   // vertex 2 - orange
    vec3(1.0, 1.0, 0.0),   // vertex 3 - yellow
    vec3(0.0, 1.0, 0.0),   // vertex 4 - green
    vec3(0.0, 0.0, 1.0),   // vertex 5 - blue
    vec3(0.5, 0.0, 1.0),   // vertex 6 - purple
    vec3(1.0, 0.0, 0.0)    // vertex 7 - same as vertex 1 (red)
);

void main() {
    int idx = int(gl_VertexIndex);
    vec2 pos;

    if (idx == 0) {
        pos = center;
    } else {
        // For idx 7, use the same angle as idx 1
        int outerIdx = (idx == 7) ? 1 : idx;
        float angle = angleStep * float(outerIdx - 1) - 3.141592653589793 / 2.0; // start at top
        pos = center + radius * vec2(cos(angle), sin(angle));
    }

    gl_Position = vec4(pos, 0.0, 1.0);
    fragColor = colors[idx];
}
