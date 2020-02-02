/// @desc 
if (keyboard_check(vk_control)) {
	global.fullscreen = !global.fullscreen;
	scUIToggleFullscreen(global.fullscreen);
}