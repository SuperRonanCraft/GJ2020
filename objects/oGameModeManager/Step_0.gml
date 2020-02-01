
if (game_health <= 0) { //We are dead, start animating!
	game_end_time = max(game_end_time - 1, 0);
	if (game_end_time <= 0)
		SlideTransition(TRANS_MODE.GOTO, rLose);
	global.win = false;
} else if (timer <= 0) {
	game_end_time = max(game_end_time - 1, 0);
	if (game_end_time <= 0)
		SlideTransition(TRANS_MODE.GOTO, rWin);
	global.win = true;
}

if (global.play) {
	hazard_spawn_timer++;
	if (hazard_spawn_timer >= hazard_spawn_timer_max) {
		hazard_spawn_timer = 0;
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
	}
}
