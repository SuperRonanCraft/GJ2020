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
				retic.text = "RESTORE POWER";
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
}
draw_self();