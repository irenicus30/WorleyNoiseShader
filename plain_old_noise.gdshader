shader_type canvas_item;

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}


void fragment() {
    float v = random(SCREEN_UV);
    COLOR = vec4(v, v, v, 1);
}
