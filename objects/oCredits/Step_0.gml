/// @desc 

if (!skipping) {
	if (keyboard_check_pressed(vk_escape))
		skipping = true;
} else {
	skipping_delay--;
}