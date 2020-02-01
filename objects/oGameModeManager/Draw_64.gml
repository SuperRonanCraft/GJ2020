/// @desc Game UI

scDrawRect(RES_W - RES_W / 3, 0, RES_W, RES_H, c_black, false, 0.8);


var _x = RES_W - ((RES_W / 3) / 2);
var _y = 50;
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
