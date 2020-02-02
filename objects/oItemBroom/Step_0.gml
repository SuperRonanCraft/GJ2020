/// @desc 

// Inherit the parent event
event_inherited();

if (!itemEquipped) {
	scFall();
	hsp = lerp(hsp, 0, 0.1);
} else {
	if (keyboard_check(vk_space)) {
		var _list = ds_list_create();
		instance_place_list(x, bbox_bottom, oOilFoam, _list, false);
		for (var i = 0; i < ds_list_size(_list); i++) {
			instance_destroy(_list[| i]);
		}
		ds_list_destroy(_list);
	}
}

standing = scCollisionOPlayer();
scMove();