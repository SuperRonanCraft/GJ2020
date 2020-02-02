/// @desc manage sounds, play a sound
/// @arg sound to play
/// @arg pitch* of sound
/// @arg [cancel-sound]* sound you would like to cancel
/// @arg loops*
/// @arg volume*

var sound = argument[0];
if (sound != noone) {
	if (argument_count > 1 && argument[1] != noone)
		audio_sound_pitch(sound, argument[1]);
	var rep = false;
	if (argument_count > 3 && argument[3] != noone)
		rep = argument[3];
	audio_play_sound(sound, 5, rep);
	if (argument_count > 4 && argument[4] != noone)
		audio_sound_gain(sound, argument[4], 0);
}
//Cancel some sounds
if (argument_count > 2 && argument[2] != noone) {
	var array = argument[2];
	for (var i = 0; i < array_length_1d(array); i++)
		audio_stop_sound(array[i]);
}

enum SOUND {
	//USER INTERFACE
		//Hovering over butto
	UI_HOVER = snHover,
		//Selected a button
	UI_SELECT = snSelect,
	//MUSIC
	MUSIC_TITLE = snMusicTitle,
	MUSIC_1 = noone,//snMusicTitle,
	MUSIC_2 = noone,//snMusicTitle2,
	MUSIC_3 = noone,//snMusicTitle3,
	ENTIGUISHER_GAS = snExtinguisherGas,
	ENTIGUISHER_GAS_BOT = snExtinguisherGasBOT,
	DRAIN = snDrain
}