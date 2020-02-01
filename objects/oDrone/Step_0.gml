/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (itemEquipped && !disabled) {
	path_end();
	disabled = true;
} if (path_position == 1 && target != noone && instance_exists(target)) {
	if (!hacked) {
		var foam = instance_create_depth(x, y + 20, depth + 1, oFoam);
		foam.hsp = irandom_range(-3, 3);
		foam.lifeTime = 22;
	} /*else {
		HACKED CODE!
	}*/
} else if (!itemEquipped && disabled && !hacked) {
	disabled = false;
}

if (hacked && !disabled) {
	part_emitter_region(global.ParticleSystem1,global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1,global.Emitter1, oParticleHandler.ds_part[?PARTICLES.HACKED], 1);
	can_pickup = true;
}