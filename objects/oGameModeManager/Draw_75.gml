/// @desc 
if (game_win_lose && game_win_lose_animated) {
	game_win_lose_alpha = min(game_win_lose_alpha + 0.01, 1);
	scDrawRect(0, 0, RES_W, RES_H, c_black, false, game_win_lose_alpha);
}