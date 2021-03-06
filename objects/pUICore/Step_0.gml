if (!control) exit; //Set when we move to another room
else scUIReloadGlobal(); //Reload global vars

var key_up = keyboard_check_pressed(vk_up), key_down = keyboard_check_pressed(vk_down);
var key_enter = keyboard_check_released(vk_enter), key_enter_mouse = mouse_check_button_released(mb_left);

//Grid that we are checking based off the page we are on
var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if (inputting) { //Are we inputting data?
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.shift:
			var hinput = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
			if (hinput == 0) { //HOVERING SUPPORT
				var option = menu_option[page];
				var x1left = start_x[option] + (x_buffer * 2);
				var x2left = x1left + (string_width("<< ") * scale_element);
				var current_val = ds_grid[# 4, option];//, current_array = ds_grid[# 2, option];
				//var x1right = x2left + (string_width(string(current_array[current_val])) * scale_element)
				//var x2right = x1right + (string_width("<< ") * scale_element);
				var buffer = string_width("<< ") * scale_element;
				if (mouse_check_button_pressed(mb_right))
					if (current_val != 0 && scUIHovering((x1left + x2left) / 2, start_y[option], "<< ", buffer, buffer, scale_element, true))
						hinput = -1;
					//else if (current_val != array_length_1d(current_array) - 1  && scUIHovering((x1right + x2right) / 2, start_y[option], "<< ", buffer, buffer, scale_element, true))
					//	hinput = 1;
					else
						hinput = 1;
			}
				
			if (hinput != 0) {
				//AUDIO
				var val = ds_grid[# 4, menu_option[page]] + hinput;
				if (val >= array_length_1d(ds_grid[# 2, menu_option[page]]))
					val = 0;
				else if (val < 0)
					val = array_length_1d(ds_grid[# 2, menu_option[page]]) - 1;
				ds_grid[# 4, menu_option[page]] = val;
			}
			break;
		case menu_element_type.slider:
			var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
			var option = menu_option[page];
			if (hinput != 0) {
				var val = ds_grid[# 4, option] + hinput * 0.01;
				ds_grid[# 4, option] = clamp(val, 0, 1);
			} else if ((device_mouse_x_to_gui(0) != mouse_x_old || device_mouse_y_to_gui(0) != mouse_y_old) 
					&& mouse_check_button(mb_right)) { //Must be pressing right to move slider
				mouse_x_old = device_mouse_x_to_gui(0);
				mouse_y_old = device_mouse_y_to_gui(0);
				var xleft = start_x[option] + (x_buffer * 2);
				var ycheck = start_y[option];
				if (mouse_x_old > xleft - 10 && mouse_x_old < xleft + slider_width + 10 && mouse_y_old > ycheck - 10 && mouse_y_old < ycheck + 10) {
					var val = (mouse_x_old - xleft) / slider_width;
					ds_grid[# 4, option] = clamp(val, 0, 1);
				}
			}
			break;
		case menu_element_type.toggle:
			var hinput = keyboard_check_pressed(vk_left) - keyboard_check_pressed(vk_right);
			var option = menu_option[page], val = ds_grid[# 4, option];
			if (hinput != 0)
				val = clamp(val + hinput, 0, 1);
			else if (mouse_check_button_pressed(mb_right))
				val = !val;
			if (val != ds_grid[# 4, option]) {
				//AUDIO
				ds_grid[# 4, option] = val;
			}
			break;
		case menu_element_type.input:
			var key = noone;
			if (keyboard_check_pressed(vk_anykey))
				key = keyboard_lastkey;
			if (key == noone /*No key*/ || key == 13 /*Enter key*/) break; //Invalid key, break out
			if (key != variable_global_get(ds_grid[# 2, menu_option[page]])) {
				//AUDIO
				variable_global_set(ds_grid[# 2, menu_option[page]], key);
				keys_update = true; //Update the keybinds when unpaused (only works in pause screen)
			}
			break;
	}
} else { //Not inputting
	var option = menu_option[page];
	//Mouse Support
	if (!unfolding && (device_mouse_x_to_gui(0) != mouse_x_old || device_mouse_y_to_gui(0) != mouse_y_old)) { //Not unfolding and mouse is moving
		mouse_x_old = device_mouse_x_to_gui(0);
		mouse_y_old = device_mouse_y_to_gui(0);
		if (page_workingon == page) //Make sure we are working on the current page
			for (var i = 0; i < ds_grid_height(ds_grid); i++) {
				var yoffset = (y_buffer / 3), val = ds_grid[# 0, i], text = is_array(val) ? val[0] : val, xoffset = string_width(text) * scale_main_hovering;
				if (is_array(start_x) && scUIHovering(start_x[i], start_y[i], text, x_buffer, 10, scale_main_hovering, centered)) {
					option = i; break;} //Set the new option, break away
				else option = -1;
			}
	} else {
		//Keyboard support
		//Up and down support
		if (!is_array(start_y) && !is_array(start_x)) exit;
		var ochange = key_down - key_up;
		if (ochange != 0) {
			//newoption += ochange;
			if (option >= 0 && option + ochange >= 0 && option + ochange < ds_height)
				if (start_y[option] == start_y[option + ochange]) option += ochange * 2;
				else option += ochange;
			else option += ochange;
			if (option > ds_height - 1) option = 0;
			else if (option < 0) option = ds_height - 1;
		}
		 //Left and right support on horizontally aligned buttons
		else {
			ochange = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
			if (ochange != 0) {
				var option = menu_option[page];
				if (option >= 0 && option + ochange >= 0 && option + ochange < ds_height)
					if (start_y[option] == start_y[option + ochange]) option += ochange;
					else if (option - ochange >= 0 && option - ochange < ds_height)
						if (start_y[option] == start_y[option - ochange]) key_enter = true;
			}
		}
	}
	//Sounds and update selection
	if (option != menu_option[page]) { //Not on the same selection
		menu_option[page] = option; //-1 means no option
		if (option != -1) audio_play_sound(SOUND.UI_HOVER, 5, false);
	}
}

//If Enter or Left-Clicking and we have a selection, execute the action
if ((key_enter || key_enter_mouse) && menu_option[page] != -1) {
	button_confirmed = [menu_option[page], page]; 
	var option = ds_grid[# 1, menu_option[page]];
	switch (option) {
		case menu_element_type.script_runner: //Run a script when selecting
			script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_element_type.goto_room: //Change the room, dont care what happens to object
			SlideTransition(TRANS_MODE.GOTO, ds_grid[# 2, menu_option[page]]); control = false; global.pause_possible = false; break; //Remove control and leave the room
		case menu_element_type.page_transfer: //Change the page
			for (var i = 0; i < array_length_1d(menu_pages_index); i++) {
				if (menu_pages_index[i] != ds_grid[# 2, menu_option[page]]) continue; //Find the index of the page related to the order
				page = i; if (key_enter_mouse) menu_option[page] = -1; break;} //Set new page selection to -1 if mouse was used to enter
			break;
		//Input elements
		case menu_element_type.slider: //If its a slider
		case menu_element_type.shift: //If we were shifting
		case menu_element_type.toggle: //If we were toggling
			if (inputting) { 
				if (option == menu_element_type.slider) {
					script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 4, menu_option[page]], ds_grid[# 5, menu_option[page]]);
					variable_global_set(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]);
				} else if (option == menu_element_type.shift) {
					variable_global_set(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]);
				} else {
					if (ds_grid[# 2, menu_option[page]] != noone)
						script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 4, menu_option[page]]);
					variable_global_set(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]);}
			}
		case menu_element_type.input: //Simply inputting a character
			inputting = !inputting; break;
	}
	if (option == menu_element_type.goto_room)
		scPlaySound(SOUND.UI_SELECT); //Confirm sound
	//else 
		//scPlaySound(SOUND.POP); //Confirm sound
}