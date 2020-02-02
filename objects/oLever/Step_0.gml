/// @description Insert description here
// You can write your code in this editor

if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,false,true) != noone) {
	if (pulled_usable)
		show_icon = true;
} else
	show_icon = false;
	
if (show_icon && keyboard_check_pressed(ord("E")) && pulled_usable) { //We can use!
	with (oSprinkler)
		active = true;
	with (oGameModeManager)
		timer -= oGameModeManager.timer_max * other.pulled_percent_use;
	scPlaySound(SOUND.LEVER_USE);
}

pulled_usable = (100 * (oGameModeManager.timer / oGameModeManager.timer_max)) > pulled_percent_use * 100;