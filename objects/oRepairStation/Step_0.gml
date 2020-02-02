/// @description Insert description here
// You can write your code in this editor

if (show_icon) {
	if (!reticMade) {
		reticMade = true;
		for (var i = 0; i < 4; i++) {
			var retic = instance_create_depth(x, y, depth-5, oReticle);
			retic.reticle_id = i;
			retic.targetObj = id;
			retic.active = true;
			retic.sprite_index = sp_pickupReticleAttention;
		}
	}
} else if (reticMade) {
	reticMade = false;
}

if (itemReparing != noone) {
	if (instance_exists(itemReparing)) {
		reparing_time++;
		with (itemReparing)
			scParticleSpawn(bbox_left, bbox_right, bbox_top, bbox_bottom, oParticleHandler.ds_part[? PARTICLES.REPAIR], 1);
		//REPARING PARTICLES
		if (reparing_time >= reparing_time_max) {
			reparing_time = 0;
			itemReparing.hacked = false;
			itemReparing.can_pickup = false;
			itemReparing.disabled = false;
			itemReparing.hacked_cooldown = 0;
			scRemoveWarning(itemReparing);
			with (itemReparing)
				scParticleSpawn(bbox_left, bbox_right, bbox_top, bbox_bottom, oParticleHandler.ds_part[? PARTICLES.FIXED], 40);
			itemReparing = noone;
			//REPARED PARTICLES
		}
	} else { //Safety
		reparing_time = 0;
		itemReparing = noone;
	}
}