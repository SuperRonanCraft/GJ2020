/// @desc credits

scDrawText(x, y, credits, c_white, 0.5, c_dkgray, 1, noone, fa_top);

y -= 1.5;

if (y < -(string_height(credits) * 1.2) || skipping_delay <= 0)
	SlideTransition(TRANS_MODE.GOTO, rMenu);
else if (!changed_gain && y < -(string_height(credits)) || skipping) {
	if (audio_is_playing(SOUND.GAMEOVER))
		audio_sound_gain(SOUND.GAMEOVER, 0, 3000)
	else if (audio_is_playing(SOUND.GAMEOVER_GOOD))
		audio_sound_gain(SOUND.GAMEOVER_GOOD, 0, 3000)
	changed_gain = true;
}

var _text = "HYPER-DRIVE COMMENCED";
var _desc = "YOUR SHIP GOT AWAY IN ONE PIECE";
var _scale = 1;
var _scale_d = 0.8;
var _c = c_green;
if (!global.win) {
	_text = "SHIP DESTROYED";
	_desc = "YOUR SHIP GOT LOST IN SPACE!";
	_c = c_red;
}

var _x = RES_W / 2;
var _y = RES_H / 2
var _len = ((string_width(_text) * _scale > string_width(_desc) * _scale_d) ? 
	string_width(_text) * _scale : string_width(_desc) * _scale_d) + 50;
scDrawRect(_x - _len / 2, _y - 45, _x + _len / 2, _y + 40, c_black, false, 0.8);
scDrawText(_x, _y - 20, _text, _c, _scale, c_dkgray, 1, fa_middle, fa_middle);
scDrawText(_x, _y + 20, _desc, c_yellow, _scale_d, c_dkgray, 1, fa_middle, fa_middle);

if (!skipping)
	scDrawText(RES_W - 10, RES_H - 10, "SKIP - ESC", c_yellow, 0.5, noone, 0.8, fa_right, fa_bottom);