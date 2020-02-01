///@arg id
var _id = argument[0];

with (oWarnings) {
	var index = noone;
	for (var i = 0; i < ds_list_size(warnings); i++) {
		var _map = warnings[| i];
		var _list = _map[? WARNING_MAP.LOC_LIST];
		for (var a = 0; a < ds_list_size(_list); a++) {
			var _loc = _list[| a];
			if (_loc[? "id"] == _id) {
				index = [i, a];
				break;
			}
		}
	}
	if (index != noone) {
		var _map = warnings[| index[0]];
		var _list = _map[? WARNING_MAP.LOC_LIST]
		ds_list_delete(_list, index[1]);
		if (ds_list_size(_list) <= 0)
			ds_list_delete(warnings, index[0]);
	}
}