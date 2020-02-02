/// @description Insert description here
// You can write your code in this editor

if (active) {
	var foam = instance_create_depth(x + 16, y + 32, depth - 1, oFoam);
	foam.lifeTime = 40;
	foam.hsp = irandom_range(-3, 3);
	timer++;
	if (timer > timer_max) {
		timer = 0;
		active = false;
	}
}