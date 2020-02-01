/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (path_position == 1 && instance_exists(target) && target != noone) {
	var foam = instance_create_depth(x, y + 20, depth + 1, oFoam);
	foam.hsp = irandom_range(-3, 3);
	foam.lifeTime = 22;
}

