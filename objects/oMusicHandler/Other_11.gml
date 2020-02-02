/// @desc start stage music
var sounds = [SOUND.MUSIC_1, SOUND.MUSIC_2, SOUND.MUSIC_3];

//Make sure we dont play the same song again
var dontplay = noone;
for (var i = 0; i < array_length_1d(sounds); i++)
	if (audio_is_playing(sounds[i])) {
		dontplay = sounds[i];
		break;
	}
var sound = sounds[0];
//while (sound == dontplay)
//	sound = sounds[abs(random_range(0, 0))];
audio_stop_all();
//Play the song
audio_play_sound(sound, 1000, true);
current_sound = sound;