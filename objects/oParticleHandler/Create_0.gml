/// @description Insert description here
// You can write your code in this editor

//Particles
global.ParticleSystem1 = part_system_create();
part_system_depth(global.ParticleSystem1, 102);
global.Emitter1 = part_emitter_create(global.ParticleSystem1);

//Initiate
ds_part = ds_map_create();

var parttype = part_type_create();
part_type_sprite(parttype, sParticleFlame, true, true, false);
part_type_size(parttype, 1, 1, 0, 0);
part_type_direction(parttype, 45, 135, 0, 0.4);
part_type_speed(parttype, 0.5, 1, -0.01, 0);
part_type_life(parttype,30,30);
ds_map_add(ds_part, PARTICLES.FIRE, parttype);


enum PARTICLES {
	FIRE
}