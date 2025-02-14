shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float amount;

void fragment() {
	vec3 color = texture(screen_texture, round(SCREEN_UV*amount)/amount).rgb;
	COLOR = vec4(color, 1);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
