/// @desc Load music

current_sound = noone;
alreadypausing = false;
play_endgame = false;
play_endgame_playing = false;
sound_started = false;

if (audio_group_is_loaded(agMusic))
	event_user(0);