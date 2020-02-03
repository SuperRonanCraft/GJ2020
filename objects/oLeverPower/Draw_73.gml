/// @desc 

if (global.power_surge) {
	var xx = (RES_W / 3) * 2;
	if (power_surge_delay >= power_surge_delay_max) {
		scParticleSpawn(bbox_left, bbox_right, bbox_top, bbox_bottom, PARTICLES.REPAIR, 1);
	} else {
		scDrawText(xx, RES_H - 40, "BACKUP GENERATOR\nCHARGING...", c_white, 1.2, c_dkgray, 0.8, noone, fa_bottom);
		draw_set_alpha(0.8);
		draw_healthbar(xx - 250, RES_H, xx + 250, RES_H + 40, (power_surge_delay / power_surge_delay_max) * 100, 
			c_black, c_yellow, c_yellow, 0, true, false);
		draw_set_alpha(1);
	}
	if (pulled_usable) {
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
			draw_sprite_ext(sp_attention, floor(animationVar), x + 10, y - 160 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_black, 0.8);
			draw_sprite_ext(sp_attention, floor(animationVar), x, y - 170 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_white, 1);
			scDrawText(x, y - 200 + scMovementWave(-10, 10, 1), "RESTORE POWER", c_yellow, 0.8, c_dkgray, 1);
		}
}