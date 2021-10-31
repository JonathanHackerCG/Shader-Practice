/// @description Drawing application surface.
event_inherited();

if (active)
{
	//Drawing the sprite with a shader.
	shader_set(effect);
	draw_surface(main_surface, 0, 0);
	shader_reset();
}
else
{
	draw_surface(main_surface, 0, 0);
}