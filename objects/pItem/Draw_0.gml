/// @description  
draw_self();

animationVar+= image_speed;

if (show_icon){
	draw_sprite_ext(pickupIcon, floor(animationVar), x + 10, y - 90, 3, 3, 0, c_black, 0.8);
	draw_sprite_ext(pickupIcon, floor(animationVar), x, y - 100, 3, 3, 0, c_white, 1);
} else if (can_pickup && !itemEquipped) {
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
	draw_sprite_ext(sp_pickup, 0, x + 10, y - 140 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_black, 0.8);
	draw_sprite_ext(sp_pickup, 0, x, y - 150 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_white, 1);
}

