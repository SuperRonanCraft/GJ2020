///@arg x
///@arg y
///@arg text
///@arg type
var xx = argument[0];
var yy = argument[1];
var text = argument[2];
var type = argument[3];

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

var view_width = camera_get_view_width(view_camera[0]);
var view_height = camera_get_view_height(view_camera[0]);

var xx = (xx) * (gui_width / view_width);
var yy = (yy) * (gui_height / view_height);

with (oWarnings) {
	var warn = ds_map_create();
	warn[? WARNING_MAP.X] = xx;
	warn[? WARNING_MAP.Y] = yy;
	warn[? WARNING_MAP.TEXT] = text;
	warn[? WARNING_MAP.TYPE] = type;
	warn[? WARNING_MAP.ALPHA] = 0;
	warn[? WARNING_MAP.ALPHA_FADING] = false;
	ds_list_add(warnings, warn);
}