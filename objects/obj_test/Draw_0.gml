/// @description Drawing Test Sprites
event_inherited();

if (active)
{
	//Drawing the sprite with a shader.
	shader_set(effect);
	draw_sprite(sprite, 0, 0, 0);
	shader_reset();
}
else
{
	draw_sprite(sprite, 0, 0, 0);
}