/// @desc Warnings

var xx = RES_W - 200;
var yy = RES_H - 80;
for (var i = 0; i < ds_list_size(warnings); i++) {
	var warn = warnings[| i];
	var text = warn[? WARNING_MAP.TEXT];
	var _title = "WARNING";
	var _locations = warn[? WARNING_MAP.LOC_LIST]
	//var type = warn[? WARNING_MAP.TYPE];
	var alpha = warn[? WARNING_MAP.ALPHA];
	var alpha_line = warn[? WARNING_MAP.ALPHA_LINE];
	var _color = warn[? WARNING_MAP.COLOR];
	scDrawText(xx, yy, _title, c_red, warning_scale, noone, alpha, fa_middle, fa_middle);
	scDrawText(xx, yy + 30, text, _color, warning_scale_text, noone, alpha, fa_middle, fa_middle);
	var _title_width = string_width(_title) * warning_scale;
	var _text_width = string_width(text) * warning_scale_text;
	var _xo = (_title_width > _text_width ? _title_width : _text_width) / 2 + 20;
	if (warn[? WARNING_MAP.TYPE] != WARNING_TYPE.FIRE)
		for (var a = 0; a < ds_list_size(_locations); a++) { //LOCATION LINES
			var _loc = _locations[| a];
			var xx_s = _loc[? "x"];
			var yy_s = _loc[? "y"];
			var _x_loc = xx - _xo - 100;
			var _y_loc = yy + 15;
			var xx_sr = xx_s - ((xx_s - _x_loc) * warn[? WARNING_MAP.PERCENT_LINE_LOC]);
			var yy_sr = yy_s - ((yy_s - _y_loc) * warn[? WARNING_MAP.PERCENT_LINE_LOC]);
			draw_set_alpha(alpha_line);
			draw_line_width_color(_x_loc, _y_loc, _x_loc + 100, _y_loc, warning_line_width, warning_line_color, warning_line_color); //warn line
			draw_line_width_color(xx_sr, yy_sr, _x_loc, _y_loc, warning_line_width, warning_line_color, warning_line_color);
			draw_circle_color(_x_loc, _y_loc, 5, warning_line_color, warning_line_color, false);
			draw_set_alpha(1);
		}
	scDrawRect(xx - _xo, yy + 15 - 40, xx - _xo + 4, yy + 15 + 40, warning_line_color, false, alpha);
	scDrawRect(xx + _xo, yy + 15 - 40, xx + _xo + 4, yy + 15 + 40, warning_line_color, false, alpha);
	scDrawRect(xx - _xo + 5, yy + 15 - 40, xx - _xo + 18, yy + 15 - 36, warning_line_color, false, alpha);
	scDrawRect(xx + _xo, yy + 15 - 40, xx + _xo - 14, yy + 15 - 36, warning_line_color, false, alpha);
	scDrawRect(xx - _xo + 5, yy + 15 + 36, xx - _xo + 18, yy + 15 + 40, warning_line_color, false, alpha);
	scDrawRect(xx + _xo, yy + 15 + 36, xx + _xo - 14, yy + 15 + 40, warning_line_color, false, alpha);
	if (!warn[? WARNING_MAP.ALPHA_FADING])
		warn[? WARNING_MAP.ALPHA] = min(warn[? WARNING_MAP.ALPHA] + warning_alpha_change, warning_alpha_org);
	else
		warn[? WARNING_MAP.ALPHA] = max(warning_alpha_org_min, warn[? WARNING_MAP.ALPHA] - warning_alpha_change);
		
	if (warn[? WARNING_MAP.ALPHA] >= warning_alpha_org)
		warn[? WARNING_MAP.ALPHA_FADING] = true;
	else if (warn[? WARNING_MAP.ALPHA] <= warning_alpha_org_min)
		warn[? WARNING_MAP.ALPHA_FADING] = false;
	//LINES
	if (warn[? WARNING_MAP.PERCENT_LINE_LOC] <= 0) {
		warn[? WARNING_MAP.ALPHA_LINE] = max(warn[? WARNING_MAP.ALPHA_LINE] - warning_alpha_change, 0);
		if (warn[? WARNING_MAP.ALPHA_LINE] <= 0)
			warn[? WARNING_MAP.PERCENT_LINE_LOC] = 1;
	} else if (warn[? WARNING_MAP.ALPHA_LINE] >= 1) {
		warn[? WARNING_MAP.PERCENT_LINE_LOC] = max(warn[? WARNING_MAP.PERCENT_LINE_LOC] - warning_alpha_change, 0);
	} else
		warn[? WARNING_MAP.ALPHA_LINE] = 1;
	yy -= 120;
}
