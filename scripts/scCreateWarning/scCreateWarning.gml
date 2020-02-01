///@arg x
///@arg y
///@arg text
///@arg type
///@arg color
var xx = argument[0];
var yy = argument[1];
var text = argument[2];
var type = argument[3];
var _color = argument[4];

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

var view_width = camera_get_view_width(view_camera[0]);
var view_height = camera_get_view_height(view_camera[0]);

var xx = (xx) * (gui_width / view_width);
var yy = (yy) * (gui_height / view_height);

with (oWarnings) {
	var added = false;
	for (var i = 0; i < ds_list_size(warnings); i++) {
		var _map = warnings[| i];
		if (_map[? WARNING_MAP.TYPE] == type) {
			var _loc = ds_map_create();
			_loc[? "x"] = xx;
			_loc[? "y"] = yy;
			ds_list_add(_map[? WARNING_MAP.LOC_LIST], _loc);
			added = true;
		}
	}
	if (!added) {
		var warn = ds_map_create();
		var _loc = ds_map_create();
		_loc[? "x"] = xx;
		_loc[? "y"] = yy;
		warn[? WARNING_MAP.LOC_LIST] = ds_list_create();
		ds_list_add(warn[? WARNING_MAP.LOC_LIST], _loc);
		warn[? WARNING_MAP.TEXT] = text;
		warn[? WARNING_MAP.TYPE] = type;
		warn[? WARNING_MAP.ALPHA] = 0;
		warn[? WARNING_MAP.ALPHA_FADING] = false;
		warn[? WARNING_MAP.COLOR] = _color;
		warn[? WARNING_MAP.PERCENT_LINE] = 0;
		warn[? WARNING_MAP.PERCENT_LINE_LOC] = 0;
		warn[? WARNING_MAP.ALPHA_LINE] = 0;
		ds_list_add(warnings, warn);
	}
}