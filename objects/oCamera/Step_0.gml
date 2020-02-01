/// @desc Update Camera
//Update object
	
var _xo = random_range(-shake_remain, shake_remain);
var _yo = random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_lenght) * shake_magnitude));
camera_set_view_pos(cam, x + _xo, y + _yo);

//Code
switch (keynum) {
	case 0: case 1: if (keyboard_check_pressed(vk_up)) keynum += 1; break;
	case 2: case 3: if (keyboard_check_pressed(vk_down)) keynum += 1; break;
	case 4: case 6: if (keyboard_check_pressed(vk_left)) keynum += 1; break;
	case 5: case 7: if (keyboard_check_pressed(vk_right)) keynum += 1; break;
	case 8: if (keyboard_check_pressed(ord("B"))) keynum += 1; break;
	case 9: if (keyboard_check_pressed(ord("A"))) {camera_set_view_angle(cam, camera_get_view_angle(cam) == 0 ? 180 : 0); keynum = 0;} break;
}