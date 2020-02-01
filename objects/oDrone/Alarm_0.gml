/// @desc find a new path
if (disabled)
	exit;
if (!instance_exists(target) || target.extinguished) {
	if (instance_number(oHazardFire) > 0)
		target = instance_find(oHazardFire, irandom_range(0, instance_number(oHazardFire) - 1));
}
if (target != noone) {
	with (target) {
		var mx = (x div 64) * 64 + 32;
		var my = (y div 64) * 64 - (32 * 3);
		with (other) {
			if (mp_grid_path(global.grid, path, x, y, mx, my, true))
				path_start(path, spd, path_action_stop, false);
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
		other.roaming_time_crt = max(other.roaming_time_crt - 1, 0);}

alarm[0] = 20;