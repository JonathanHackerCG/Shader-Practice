/// @description Initialize Variables
event_inherited();

application_surface_draw_enable(false);
application_surface_enable(false);
main_surface = surface_create(1200, 676);

sprites = array_create(0, 0); //Array for swapping test sprites.
array_push(sprites, bkg_testA, bkg_testB, bkg_testC, bkg_testD);
s_index = 0;

effects = array_create(0, 0); //Array for swapping effects.
array_push(effects, A_shd_intensify, B_shd_blackwhite, C_shd_sepia, D_shd_invert,
	E_shd_noise, F_shd_blur_radial, G_shd_blur_motion, H_shd_blur_gaussian, I_shd_ripple);
e_index = 0;

active = true;

F_pos = shader_get_uniform(F_shd_blur_radial, "pos");
G_pos = shader_get_uniform(G_shd_blur_motion, "pos");
H_size = shader_get_uniform(H_shd_blur_gaussian, "size");
I_time = shader_get_uniform(I_shd_ripple, "time");