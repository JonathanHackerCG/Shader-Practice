/// @description Drawing Test Sprites
event_inherited();

if (!surface_exists(main_surface))
{
	main_surface = surface_create(1200, 676);
}

surface_set_target(main_surface);
draw_sprite(sprite, 0, 0, 0);
surface_reset_target();