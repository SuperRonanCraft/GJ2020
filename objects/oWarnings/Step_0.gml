/// @desc 

if (ds_list_size(warnings) != 0 && !oGameModeManager.game_win_lose) {
	if (!audio_is_playing(SOUND.ALARM)) {
		scPlaySound(SOUND.ALARM, noone, noone, noone, 1);
		audio_on = true;
	}
} else if (audio_on && audio_is_playing(SOUND.ALARM)) {
	audio_sound_gain(SOUND.ALARM, 0, 250);
	audio_on = 0;
}