/// @description Drawing application surface.
event_inherited();

if (active)
{
	//Drawing the sprite with a shader.
	shader_set(effect);
	
	//Setting custom shader uniforms.
	switch (effect)
	{
		case F_shd_blur_radial:
			shader_set_uniform_f(F_pos, mouse_x / room_width, mouse_y / room_height);
			break;
		case G_shd_blur_motion:
			shader_set_uniform_f(G_pos, mouse_x / room_width, mouse_y / room_height);
			break;
		case H_shd_blur_gaussian:
			shader_set_uniform_f(H_size, room_width, room_height, 16);
			break;
		default:
	}
	
	//Draw the display surface with the shader effect.
	draw_surface(main_surface, 0, 0);
	shader_reset();
}
else
{
	draw_surface(main_surface, 0, 0);
}