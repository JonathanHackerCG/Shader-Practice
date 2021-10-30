/// @description Initialize Variables
event_inherited();

sprites = array_create(0, 0); //Array for swapping test sprites.
array_push(sprites, bkg_testA, bkg_testB, bkg_testC, bkg_testD);
s_index = 0;

effects = array_create(0, 0); //Array for swapping effects.
array_push(effects, A_shd_intensify, B_shd_blackwhite, C_shd_sepia, D_shd_invert);
e_index = 0;

active = true;