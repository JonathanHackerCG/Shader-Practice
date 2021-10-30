/// @description Input Checking
event_inherited();

//Switching between sprites.
if (keyboard_check_pressed(vk_right)) { s_index ++; }
if (keyboard_check_pressed(vk_left)) { s_index --; }
s_index = clamp(s_index, 0, array_length(sprites) - 1);
sprite = sprites[s_index];

//Switching between effects.
if (keyboard_check_pressed(vk_up)) { e_index ++; }
if (keyboard_check_pressed(vk_down)) { e_index --; }
e_index = clamp(e_index, 0, array_length(effects) - 1);
effect = effects[e_index];

//Toggling shader effect.
if (keyboard_check_pressed(vk_space)) { active = !active; }