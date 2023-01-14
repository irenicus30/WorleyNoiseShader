shader_type canvas_item;

uniform int n;

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}
float random2 (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(39.9874,98.534))) * 96732.0684738);
}


void fragment() {
    float d = 9999999999.0;
    for(int i=0; i<n; i++) {
        vec2 seed = vec2(float(i), 0);
        vec2 point = vec2(random(seed), random2(seed));
        d = min(d, distance(UV, point));
    }
    
    d = clamp(d, 0, 0.1);
    d *= 10.0;
    
    COLOR = vec4(d, d, d, 1);
}
