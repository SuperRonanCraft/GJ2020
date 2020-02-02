/// @description Insert description here
// You can write your code in this editor

event_inherited();

var _foaming = false;
if (!itemEquipped) {
	scFall();
	hsp = lerp(hsp,0,0.1);
} else {
	if (keyboard_check(vk_space)) {
		//show_debug_message("spraying");
		var foam = instance_create_depth(x+(25*oPlayer.facing), y,depth+1,oFoam);
		foam.hsp = oPlayer.facing * irandom_range(5,10);
		_foaming = true;
	}
}
if (_foaming) {
	if (!audio_is_playing(SOUND.ENTIGUISHER_GAS))
		scPlaySound(SOUND.ENTIGUISHER_GAS);
} else if (audio_is_playing(SOUND.ENTIGUISHER_GAS)) {
	audio_stop_sound(SOUND.ENTIGUISHER_GAS);
}

standing = scCollisionOPlayer();
scMove();