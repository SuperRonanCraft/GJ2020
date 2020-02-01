///@arg amount

var dmg = argument[0];

with (oGameModeManager) {
	if (game_health <= 0)
		break;
	for (var i = 0; i < dmg; i++) {
		if (game_shield > 0)
			game_shield--;
		else
			game_health--;
	}
	if (game_health <= 0) { //You JUST died
		game_health = 0;
		scScreenShake(50, 120, true);
	} else { //You just got damaged
		scScreenShake(20, 20, false);
	}
}