/// @desc Game UI
scDrawRect(RES_W - RES_W / 3, 0, RES_W, RES_H, c_black, false, 0.8);

var _x = RES_W - ((RES_W / 3) / 2);
var _y = 50;
if (global.play) {
	timer += 0.1;
}

if (game_win_lose) {
	switch (global.win) {
		case true: //GAME WON!
			with (oCamera) {
				y -= 20;
			}
		case false: //GAME LOST!
			with (oCamera) {
				y += 20;
				angle += 0.9;
				camera_set_view_angle(cam, angle)
			}
	}
}
scDrawText(_x, _y, "HYPER-DRIVE CHARGE", c_yellow, 0.75, c_dkgray);
_y += 32;
var _tper = timer / timer_max;
draw_healthbar(_x - 150, _y, _x + 150, _y + 15, 100 * _tper, c_gray, c_red, c_green, 0, true, false);
_y += 32;
scDrawText(_x, _y, string(round(100 * _tper)) + "%", c_gray, 0.5, c_dkgray);

_y += 50;
scDrawText(_x, _y, "SHIELD", c_white, 1, c_dkgray);
_y += 23;
draw_healthbar(_x - 100, _y, _x + 100, _y + 20, game_shield, c_gray, c_aqua, c_aqua, 0, true, false);
_y += 32;
scDrawText(_x, _y, string(round(game_shield)) + "%", c_gray, 0.5, c_dkgray);

_y += 50;
scDrawText(_x, _y, "HEALTH", c_white, 1, c_dkgray);
_y += 23;
draw_healthbar(_x - 100, _y, _x + 100, _y + 20, game_health / 10, c_gray, c_red, c_green, 0, true, false);
_y += 32;
scDrawText(_x, _y, string(round(game_health / 10)) + "%", c_gray, 0.5, c_dkgray);
