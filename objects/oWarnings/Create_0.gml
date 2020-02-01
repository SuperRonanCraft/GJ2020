/// @desc
warnings = ds_list_create();
warning_alpha_org = 1;
warning_alpha_org_min = 0.5;
warning_alpha_change = 0.02;
//warning_stick_len = 100;
warning_scale = 0.8;
warning_scale_text = 0.5;
warning_line_color = c_white;
warning_line_width = 2;

/*var warn = ds_map_create();
warn[? WARNING_MAP.TYPE] = WARNING_TYPE.FIRE;
warn[? WARNING_MAP.X] = RES_W / 3;
warn[? WARNING_MAP.Y] = RES_H / 2;
warn[? WARNING_MAP.TEXT] = "FIRE BREACH!";
warn[? WARNING_MAP.ALPHA] = 0;
warn[? WARNING_MAP.ALPHA_FADING] = false;

ds_list_add(warnings, warn);*/

enum WARNING_TYPE {
	FIRE, HULL_BREACH, INVASION
}

enum WARNING_MAP {
	TYPE, X, Y, TEXT, ALPHA, ALPHA_FADING
}