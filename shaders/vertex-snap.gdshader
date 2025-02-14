shader_type spatial;
render_mode skip_vertex_transform;
//render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_burley, specular_schlick_ggx;

uniform vec3 uv1_scale;
uniform vec3 uv1_offset;
uniform vec3 uv2_scale;
uniform vec3 uv2_offset;

uniform float amount;
uniform sampler2D tex;

vec3 matrixMult(mat4 matrix, vec3 vector) {
  return (matrix * vec4(vector, 1.0)).xyz;
}

void vertex() {
	// Called for every vertex the material is visible on.
	VERTEX = matrixMult(MODEL_MATRIX, VERTEX);
	VERTEX = matrixMult(VIEW_MATRIX, VERTEX);
//
	VERTEX = round(VERTEX*amount)/amount;
	UV = UV * uv1_scale.xy + uv1_offset.xy;
	NORMAL = (VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz;
}

// NOTE: Shader automatically converted from Godot Engine 4.3.stable.mono's StandardMaterial3D.


uniform vec4 albedo : source_color;
uniform sampler2D texture_albedo : source_color, filter_nearest_mipmap, repeat_enable;
uniform float point_size : hint_range(0.1, 128.0, 0.1);

uniform float roughness : hint_range(0.0, 1.0);
uniform sampler2D texture_metallic : hint_default_white, filter_nearest_mipmap, repeat_enable;
uniform vec4 metallic_texture_channel;
uniform sampler2D texture_roughness : hint_roughness_r, filter_nearest_mipmap, repeat_enable;

uniform float specular : hint_range(0.0, 1.0, 0.01);
uniform float metallic : hint_range(0.0, 1.0, 0.01);


void fragment() {
	vec2 base_uv = UV;

	vec4 albedo_tex = texture(texture_albedo, base_uv);
	ALBEDO = albedo.rgb * albedo_tex.rgb;

	float metallic_tex = dot(texture(texture_metallic, base_uv), metallic_texture_channel);
	METALLIC = metallic_tex * metallic;
	SPECULAR = specular;

	vec4 roughness_texture_channel = vec4(1.0, 0.0, 0.0, 0.0);
	float roughness_tex = dot(texture(texture_roughness, base_uv), roughness_texture_channel);
	ROUGHNESS = roughness_tex * roughness;
}
