/// @desc 
draw_self();
if (ping) {
	if (ping_fade) {
		ping_anim = min(ping_anim + ping_anim_change, 1);
		if (ping_anim >= 1)
			ping_fade = false;
	} else {
		ping_anim = max(ping_anim - ping_anim_change, ping_anim_min);
		if (ping_anim <= ping_anim_min)
			ping_fade = true;
	}
} else {
	ping_anim = 1;
}
image_xscale = ping_anim;
image_yscale = ping_anim;
image_alpha = ping_anim;