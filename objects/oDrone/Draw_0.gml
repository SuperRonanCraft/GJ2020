/// @desc 

damaging_cd_crt = max(damaging_cd_crt - 1, 0);
if (damaging_cd_crt <= 0)
	damaging = true;

draw_self();
//scFlash(flash_alpha, c_white, image_xscale, image_yscale, sprite_index, image_index, x, y, image_angle);
flash_alpha = max(flash_alpha - 0.05, 0);