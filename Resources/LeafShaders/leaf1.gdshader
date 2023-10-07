shader_type canvas_item;

uniform vec4 origin1: source_color;
uniform vec4 origin2: source_color;
uniform vec4 origin3: source_color;

uniform vec4 new1: source_color;
uniform vec4 new2: source_color;
uniform vec4 new3: source_color;

void fragment() {
	vec4 current_pixel = texture(TEXTURE, UV);
	
	if (current_pixel == origin1)
		COLOR = new1;
	else if (current_pixel == origin2)
		COLOR = new2;
	else if (current_pixel == origin3)
		COLOR = new3;
	else
		COLOR = current_pixel;
}
