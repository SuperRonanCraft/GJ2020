
if (game_health <= 0) { //We are dead, start animating!
	global.play = false;
	game_win_lose = true;
	global.win = false;
	game_end_time = max(game_end_time - 1, 0);
	if (game_end_time <= 0)
		SlideTransition(TRANS_MODE.GOTO, rLose);
} else if (timer >= timer_max) {
	global.play = false;
	game_win_lose = true;
	global.win = true;
	game_end_time = max(game_end_time - 1, 0);
	if (game_end_time <= 0)
		SlideTransition(TRANS_MODE.GOTO, rWin);
}

if (global.play) {
	hazard_spawn_timer++;
	if (hazard_spawn_timer >= hazard_spawn_timer_max) {
		hazard_spawn_timer = 0;
		var _hazards_list = ["fire", "hacked"]
		var _hazard = _hazards_list[irandom_range(0, array_length_1d(_hazards_list) - 1)];
		if (_hazard == "hacked")
			if (!instance_exists(oDrone) || oDrone.hacked || 
					oDrone.hacked_cooldown < oDrone.hacked_cooldown_max || irandom(100) < 80)
				_hazard = _hazards_list[0];
		switch (_hazard) {
			case "fire":
				var walk = ds_list_create();
				for (var i = 0; i < instance_number(oWall); i++) {
					var _wall = instance_find(oWall, i);
					if (_wall != noone)
						if (_wall.walkable)
							ds_list_add(walk, _wall);
				}

				var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];

				if (wall != noone) {
					var xx = wall.bbox_left + ((wall.bbox_right - wall.bbox_left) * random(1));
					var yy = wall.y;
					if (!instance_place(xx, yy, oWall))
						instance_create_depth(xx, yy, depth - 1, oHazardFire);
				}
				break;
			case "hacked":
				with (oDrone) {
					hacked = true;
					scCreateWarning(x, y, "HACKED", WARNING_TYPE.HACKED, c_green, id, true);
				}
				break;
		}
	}
}
