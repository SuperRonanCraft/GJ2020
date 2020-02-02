/// @description Insert description here
// You can write your code in this editor
if (show_icon) {
	if (pulled_alpha_fade) {
		pulled_alpha = min(1, pulled_alpha + pulled_alpha_change)
		if (pulled_alpha >= 1)
			pulled_alpha_fade = false;
	} else {
		pulled_alpha = max(0, pulled_alpha - pulled_alpha_change)
		if (pulled_alpha <= 0)
			pulled_alpha_fade = true;
	}
	with (oGameModeManager) {
		timer_charge_down = other.pulled_percent_use;
		timer_charge_down_alpha = other.pulled_alpha;
	}
	if (!reticMade) {
		reticMade = true;
		for (var i = 0; i < 5; i++) {
			var retic = instance_create_depth(x, y, depth-5, oReticle);
			retic.reticle_id = i;
			retic.targetObj = id;
			retic.active = true;
			retic.button_text = "USE - E";
			if (i == 4) {
				retic.text = "FOAM CLENSE";
				retic.desc = "10% POWER DRAIN";
			}
			retic.sprite_index = sp_pickupReticleAttention;
			scPlaySound(SOUND.ITEM_HOVER, noone, noone, noone, 0.2);
		}
	}
	draw_sprite_ext(sp_swap, floor(animationVar), x + 10, y - 140, 3, 3, 0, c_black, 0.8);
	draw_sprite_ext(sp_swap, floor(animationVar), x, y - 150, 3, 3, 0, c_white, 1);
	animationVar += image_speed;
} else if (reticMade) {
	reticMade = false;
	with (oGameModeManager) {
		timer_charge_down = 0;
		timer_charge_down_alpha = 0;
	}
} else if (instance_number(oHazardFire) >= 10) {
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
		draw_sprite_ext(sp_attention, floor(animationVar), x + 10, y - 140 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_black, 0.8);
		draw_sprite_ext(sp_attention, floor(animationVar), x, y - 150 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_white, 1);
	}
}
draw_self();