///@arg x
///@arg y
///@arg text
///@arg type
///@arg color
///@arg id
///@arg update*
var xx = argument[0];
var yy = argument[1];
var text = argument[2];
var type = argument[3];
var _color = argument[4];
var _id = argument[5];
var _update = argument_count > 6 ? (argument[6] != noone ? argument[6] : false) : false;

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
			if (!_update) {
				var _loc = ds_map_create();
				_loc[? "x"] = xx;
				_loc[? "y"] = yy;
				_loc[? "id"] = _id;
				ds_list_add(_map[? WARNING_MAP.LOC_LIST], _loc);
				added = true;
				break;
			} else {
				var _locs = _map[? WARNING_MAP.LOC_LIST];
				for (var b = 0; b < ds_list_size(_locs); b++) {
					var _loc = _locs[| b];
					if (_loc[? "id"] == _id) {
						_loc[? "x"] = xx;
						_loc[? "y"] = yy;
						added = true;
						break;
					}
				}
			}
		}
	}
	if (!added) {
		var warn = ds_map_create();
		var _loc = ds_map_create();
		_loc[? "x"] = xx;
		_loc[? "y"] = yy;
		_loc[? "id"] = _id;
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