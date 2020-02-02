/// @desc 

// Inherit the parent event
event_inherited();

if (!itemEquipped) {
	scFall();
	hsp = lerp(hsp, 0, 0.1);
} else {
	if (keyboard_check(vk_space)) {
		if (oPlayer.standing)
			scParticleSpawn(bbox_left, bbox_right, y + 8, y + 10, PARTICLES.CLEAN, 1);
		var _list = ds_list_create();
		instance_place_list(x, bbox_bottom, oOilFoam, _list, false);
		for (var i = 0; i < ds_list_size(_list); i++) {
			var _mud = _list[| i];
			scParticleSpawn(_mud.bbox_left, _mud.bbox_right, _mud.y - 2, _mud.y + 2, PARTICLES.CLEAN_OIL, 20);
			instance_destroy(_mud);
			if (!audio_is_playing(SOUND.MUD_CLEAN))
				scPlaySound(SOUND.MUD_CLEAN, noone, noone, noone, 0.4);
		}
		ds_list_destroy(_list);
		if (oPlayer.standing && !audio_is_playing(SOUND.MUD_CLEANING))
			scPlaySound(SOUND.MUD_CLEANING, noone, noone, noone, 0.4);
	}
}

standing = scCollisionOPlayer();
scMove();