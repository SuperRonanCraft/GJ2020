/// @description Restart music
if (!audio_is_playing(SOUND.MUSIC_TITLE))
	audio_play_sound(SOUND.MUSIC_TITLE, 1000, true);