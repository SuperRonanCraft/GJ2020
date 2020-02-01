/// @desc Warnings


for (var i = 0; i < ds_list_size(warnings); i++) {
	var xx = RES_W - 200;
	var yy = RES_H - 80;
	var warn = warnings[| i];
	var text = warn[? WARNING_MAP.TEXT];
	var _title = "WARNING";
	var xx_s = warn[? WARNING_MAP.X];
	var yy_s = warn[? WARNING_MAP.Y];
	//var type = warn[? WARNING_MAP.TYPE];
	var alpha = warn[? WARNING_MAP.ALPHA];
	scDrawText(xx, yy, _title, c_red, warning_scale, noone, alpha, fa_middle, fa_middle);
	scDrawText(xx, yy + 30, text, c_red, warning_scale_text, noone, alpha, fa_middle, fa_middle);
	var _title_width = string_width(_title) * warning_scale;
	var _text_width = string_width(text) * warning_scale_text;
	var _xo = (_title_width > _text_width ? _title_width : _text_width) / 2 + 20;
	draw_line_width_color(xx - _xo, yy + 15, xx - _xo - 100, yy + 15, warning_line_width, warning_line_color, warning_line_color);
	draw_line_width_color(xx - _xo - 100, yy + 15, xx_s, yy_s, warning_line_width, warning_line_color, warning_line_color);
	scDrawRect(xx - _xo, yy + 15 - 40, xx - _xo + 4, yy + 15 + 40, warning_line_color, false, 1);
	scDrawRect(xx + _xo, yy + 15 - 40, xx + _xo + 4, yy + 15 + 40, warning_line_color, false, 1);
	scDrawRect(xx - _xo, yy + 15 - 40, xx - _xo + 10, yy + 15 - 36, warning_line_color, false, 1);
	scDrawRect(xx + _xo, yy + 15 - 40, xx + _xo - 10, yy + 15 - 36, warning_line_color, false, 1);
	scDrawRect(xx - _xo, yy + 15 + 36, xx - _xo + 10, yy + 15 + 40, warning_line_color, false, 1);
	scDrawRect(xx + _xo, yy + 15 + 36, xx + _xo - 10, yy + 15 + 40, warning_line_color, false, 1);
	if (!warn[? WARNING_MAP.ALPHA_FADING]) {
		warn[? WARNING_MAP.ALPHA] = min(warn[? WARNING_MAP.ALPHA] + warning_alpha_change, warning_alpha_org);
	} else {
		warn[? WARNING_MAP.ALPHA] = max(warning_alpha_org_min, warn[? WARNING_MAP.ALPHA] - warning_alpha_change);
	}
	if (warn[? WARNING_MAP.ALPHA] >= warning_alpha_org)
		warn[? WARNING_MAP.ALPHA_FADING] = true;
	else if (warn[? WARNING_MAP.ALPHA] <= warning_alpha_org_min)
		warn[? WARNING_MAP.ALPHA_FADING] = false;
	//scDrawRect(xx, yy, xx - 200, yy - 50, c_blue, false, 1);
}
