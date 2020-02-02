/// @description Insert description here
// You can write your code in this editor

if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,false,true) != noone) {
	if (pulled_usable)
		show_icon = true;
} else
	show_icon = false;
	
if (show_icon && keyboard_check_pressed(ord("E")) && pulled_usable) { //We can use!
	if (!global.power_surge) {
		with (oSprinkler)
			active = true;
		with (oGameModeManager)
			timer -= oGameModeManager.timer_max * other.pulled_percent_use;
	} else {
		global.power_surge = true;
	}
	scPlaySound(SOUND.LEVER_USE);
	pulled_cooldown = pulled_cooldown_max;
	pulled_usable = false;
	sprite_index = sp_Lever_Pull;
	image_index = 0;
}

if (sprite_index == sp_Lever_Pull) {
	if (image_index == image_number - 1)
		sprite_index = sp_Lever;
} else {
	pulled_cooldown = max(pulled_cooldown - 1, 0);
	pulled_usable = (100 * (oGameModeManager.timer / oGameModeManager.timer_max)) > pulled_percent_use * 100
		&& pulled_cooldown <= 0;
}