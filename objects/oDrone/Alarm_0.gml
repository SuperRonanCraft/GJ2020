/// @desc find a new path
if (disabled || itemEquipped) {
	alarm[0] = 20;
	exit;
} else
	alarm[0] = 20;
if (!instance_exists(target)
	|| (target.object_index == oHazardFire && (target.extinguished || hacked)) 
	|| (target.object_index == oWall && path_position == 1)) {
	
	if(!hacked){
		if (instance_number(oHazardFire) > 0) {
			var _tar = instance_find(oHazardFire, irandom_range(0, instance_number(oHazardFire) - 1));
			if (_tar.fire_on && !_tar.extinguished)
				target = _tar;
			else
				alarm[0] = 1;
		} else
			target = noone;
	}
	else{
		var walk = ds_list_create();
		for (var i = 0; i < instance_number(oWall); i++) {
			var _wall = instance_find(oWall, i);
			if (_wall != noone)
				if (_wall.walkable)
					ds_list_add(walk, _wall);
		}

		var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];

		if(instance_exists(wall)){
			target = wall;
			alarm[0] = 5;
		}
	}
}
if (target != noone) {
	with (target) {
		var mx = (x div 64) * 64 + 32;
		var my = (y div 64) * 64 - (32 * 3);
		with (other) {
			if (mp_grid_path(global.grid, path, x, y, mx, my, true))
				path_start(path, !hacked ? spd : spd * 0.75, path_action_stop, false);
			else
				target = noone;
			if (mx > x)
				image_xscale = -1;
			else
				image_xscale = 1;
		}
	}
} else {
	if (other.roaming_time_crt <= 0) {
		with (other) {
			var mx = (x div 64) * 64 + (64 * irandom(5) * choose(-1, 1));
			var my = (y div 64) * 64 - (64 * irandom(5) * choose(-1, 1));
			if (mp_grid_path(global.grid, path, x, y, mx, my, true))
				path_start(path, spd / 2, path_action_stop, false);
			if (mx > x)
				image_xscale = -1;
			else
				image_xscale = 1;
		}
		other.roaming_time_crt = other.roaming_time;
	} else
		other.roaming_time_crt = max(other.roaming_time_crt - 1, 0);
}