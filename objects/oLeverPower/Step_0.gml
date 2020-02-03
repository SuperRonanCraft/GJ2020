/// @description Insert description here
// You can write your code in this editor

if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,false,true) != noone) {
	if (pulled_usable && global.power_surge)
		show_icon = true;
} else
	show_icon = false;
	
if (show_icon && keyboard_check_pressed(ord("E")) && pulled_usable && global.power_surge) { //We can use!
	global.power_surge = false;
	scPlaySound(SOUND.LEVER_USE);
	pulled_cooldown = pulled_cooldown_max;
	pulled_usable = false;
	show_icon = false;
	sprite_index = sp_LeverPower;
	image_index = 0;
}

if (sprite_index == sp_LeverPower_Pull) {
	if (image_index == image_number - 1)
		sprite_index = sp_LeverPower;
} else {
	pulled_cooldown = max(pulled_cooldown - 1, 0);
	pulled_usable = pulled_cooldown <= 0 && (!global.power_surge || power_surge_delay >= power_surge_delay_max);
}

if (global.power_surge)
	power_surge_delay = min(power_surge_delay + 1, power_surge_delay_max);