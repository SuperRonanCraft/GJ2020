/// @desc Game UI

scDrawRect(RES_W - RES_W / 3, 0, RES_W, RES_H, c_black, false, 0.8);

var _x = RES_W - ((RES_W / 3) / 2);
var _y = 50;
if (global.play && !global.power_surge) {
	timer += 0.1;
}

if (game_win_lose) {
	var _done = true;
	with (oLight) {
		alpha = max(alpha - 0.03, 0);
		_done = alpha <= 0;
	}
	if (_done)
		switch (global.win) {
			case true: //GAME WON!
				with (oCamera) {
					if (y >= other.game_win_lose_animated_goal_reached) {
						y = lerp(y, -other.game_win_lose_animated_goal, 0.1);
						if (y < -other.game_win_lose_animated_goal * 0.5)
							other.game_win_lose_animated = true;
					} else {
						y = lerp(y, other.game_win_lose_animated_goal, 0.08)
						if (y >= other.game_win_lose_animated_goal * 0.9)
							other.game_win_lose_animated_goal_reached = true;
						other.game_end_time = 120;
					}
				}
				break;
			case false: //GAME LOST!
				with (oCamera) {
					y -= 20;
					angle += 0.5;
					camera_set_view_angle(cam, angle)
				}
		}
}
scDrawText(_x, _y, "HYPER-DRIVE CHARGE", c_yellow, 0.75, c_dkgray);
_y += 32;
var _tper = timer / timer_max;
draw_healthbar(_x - 150, _y, _x + 150, _y + 15, 100 * _tper, c_gray, c_red, c_green, 0, true, false);
if (timer_charge_down > 0) {
	var _xc = _x - 150;
	var _charge = 300 * timer_charge_down;
	draw_set_alpha(timer_charge_down_alpha);
	draw_healthbar(_xc, _y, _xc + _charge, _y + 15, 100, c_gray, c_yellow, c_yellow, 0, true, false);
	draw_set_alpha(1);
}
_y += 32;
scDrawText(_x, _y, string(round(100 * _tper)) + "%", c_gray, 0.5, c_dkgray);

_y += 50;
scDrawText(_x, _y, "SHIELD", c_white, 1, c_dkgray);
_y += 23;
draw_healthbar(_x - 100, _y, _x + 100, _y + 20, game_shield, c_gray, c_aqua, c_aqua, 0, true, false);
_y += 32;
scDrawText(_x, _y, string(round(game_shield)) + "%", c_gray, 0.5, c_dkgray);

_y += 50;
scDrawText(_x, _y, "HULL HEALTH", c_white, 1, c_dkgray);
_y += 23;
draw_healthbar(_x - 100, _y, _x + 100, _y + 20, (game_health / game_health_max) * 100, c_gray, c_red, c_green, 0, true, false);
_y += 32;
scDrawText(_x, _y, string(round((game_health / game_health_max) * 100)) + "%", c_gray, 0.5, c_dkgray);

if ((game_health / game_health_max) * 100 < 20) {
	if (game_health_warn_fade) {
		game_health_warn_alpha -= 0.04;
		if (game_health_warn_alpha <= 0.4)
			game_health_warn_fade = false;
	} else {
		game_health_warn_alpha += 0.04;
		if (game_health_warn_alpha >= 1)
			game_health_warn_fade = true;
	}
	scDrawText(RES_W / 3, RES_H / 3, "LOW HULL HEALTH", c_red, 1.4, c_dkgray, game_health_warn_alpha);	
}

if (game_win_lose) {
	game_win_lose_alpha = min(game_win_lose_alpha + 0.01, 1);
	scDrawRect(0, 0, RES_W, RES_H, c_black, false, game_win_lose_alpha);
}