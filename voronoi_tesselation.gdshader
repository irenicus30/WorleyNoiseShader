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
float random3 (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(89.8745,23.093))) * 98457.8652343);
}
vec3 random_color(int seed)
{
    vec2 p = vec2(float(seed*100), 0);
    return vec3(random(p), random2(p), random3(p));
}


void fragment() {
    float d = 9999999999.0;
    int this_pixel_seed;
    for(int i=0; i<n; i++) {
        vec2 seed = vec2(float(i), 0);
        vec2 point = vec2(random(seed), random2(seed));
        if(d > distance(UV, point))
        {
            d = distance(UV, point);
            this_pixel_seed = i;
        }
    }
        
    COLOR = vec4(random_color(this_pixel_seed), 1);
}
