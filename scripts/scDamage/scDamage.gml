///@arg amount

var dmg = argument[0];

with (oGameModeManager) {
	for (var i = 0; i < dmg; i++) {
		if (game_shield > 0)
			game_shield--;
		else
			game_health--;
	}
	if (game_health < 0)
		game_health = 0;
}