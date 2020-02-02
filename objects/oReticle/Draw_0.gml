/// @desc 

if (text == noone) {
	draw_sprite_ext(sprite_index, image_index, x + 10, y + 10, image_xscale, image_yscale, image_angle, c_black, image_alpha - 0.2);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
} else {
	scDrawText(x, y, text, c_yellow, 1, noone, image_alpha, fa_middle, fa_middle);
	if (desc != noone)
		scDrawText(x, y + 35, desc, c_red, 0.9, noone, image_alpha, fa_middle, fa_middle);
}

if (reticle_id == RETICLE_ID.TOPRIGHT) {
	scDrawText(x + 80, y, button_text, c_white, 0.8, noone, image_alpha, fa_left, fa_middle);
}