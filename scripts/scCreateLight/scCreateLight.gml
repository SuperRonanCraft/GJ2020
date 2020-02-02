///@arg x
///@arg y
///@arg radius
///@arg color
///@arg offset
var _x = argument[0];
var _y = argument[1];
var _r = argument[2];
var _c = argument[3];
var _os = argument_count > 4 ? (argument[4] != noone ? argument[4] : 4) : 4;
gpu_set_blendmode(bm_subtract);
surface_set_target(global.surface_light);
_r += random_range(-_os, _os);
draw_circle_color(_x, _y, _r, _c, c_black, false);
surface_reset_target();
gpu_set_blendmode(bm_normal);