/// @desc 
surface_set_target(global.surface_light);
draw_clear_alpha(c_black, 1);
scDrawRect(-50, -50, room_width + 50, room_height + 50, c_ltgray, false, alpha);
surface_reset_target();