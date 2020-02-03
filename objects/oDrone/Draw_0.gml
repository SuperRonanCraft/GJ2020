/// @desc 

damaging_cd_crt = max(damaging_cd_crt - 1, 0);
if (damaging_cd_crt <= 0)
	damaging = true;

draw_self();
//scFlash(flash_alpha, c_white, image_xscale, image_yscale, sprite_index, image_index, x, y, image_angle);
flash_alpha = max(flash_alpha - 0.05, 0);

if (hacked && !disabled) {
	if (pickup_indicator_scale_open) {
		if (pickup_indicator_scale < 1)
			pickup_indicator_scale = min(pickup_indicator_scale + pickup_indicator_scale_change, 1);
		else
			pickup_indicator_scale_open = !pickup_indicator_scale_open;
	} else {
		if (pickup_indicator_scale > 0)
			pickup_indicator_scale = max(pickup_indicator_scale - pickup_indicator_scale_change, 0);
		else
			pickup_indicator_scale_open = !pickup_indicator_scale_open;
	}
	draw_sprite_ext(sp_attention, 0, x + 10, y - 140 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_black, 0.8);
	draw_sprite_ext(sp_attention, 0, x, y - 150 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_white, 1);

	if (py < y) //DOWN
		sprite_index = spDroneHacked_down
	else if (py > y)
		sprite_index = spDroneHacked_up;
	else
		sprite_index = spDroneHacked_hover;
} else if (!disabled && !global.power_surge) {
	if (py < y) //DOWN
		sprite_index = spDroneActive_down
	else if (py > y)
		sprite_index = spDroneActive_up;
	else
		sprite_index = spDroneActive_hover;
} else {
	sprite_index = spDrone_deactivated;
}
py = y;