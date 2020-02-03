/// @desc 
scCreateLight(x, y, 150, !hacked ? c_white : c_red);

if (!hacked)
	if (oGameModeManager.timer - (hacked_cooldown + hacked_time_hacked)
			> hacked_interval * hacked_times) {
		hacked_times++;
		hacked = true;
		scCreateWarning(x, y, "HACKED", WARNING_TYPE.HACKED, c_green, id, true);			
	}

/*show_debug_message("--");
show_debug_message(string(oGameModeManager.timer));

show_debug_message(string((hacked_cooldown + hacked_time_hacked)));
show_debug_message(string(hacked_interval * hacked_times));