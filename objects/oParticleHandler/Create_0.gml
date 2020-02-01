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
part_type_size(parttype, 1, 1.2, 0, 0);
part_type_direction(parttype, 45, 135, 0, 0.4);
part_type_speed(parttype, 0.5, 1, -0.01, 0);
part_type_life(parttype, 30, 40);
ds_map_add(ds_part, PARTICLES.FIRE, parttype);

var parttype = part_type_create();
part_type_sprite(parttype, s_particleRepairing, true, true, false);
part_type_size(parttype, 0.8, 1.1, 0.01, 0);
part_type_direction(parttype, 0, 359, 0, 2);
part_type_speed(parttype, 1, 2, -0.01, 0);
part_type_life(parttype, 20, 30);
ds_map_add(ds_part, PARTICLES.REPAIR, parttype);

var parttype = part_type_create();
part_type_sprite(parttype, s_particleFixed, true, true, false);
part_type_size(parttype, 1, 1.2, 0, 0);
part_type_direction(parttype, 0, 359, 0, 3);
part_type_speed(parttype, 1, 2, -0.03, 0);
part_type_life(parttype, 50, 80);
ds_map_add(ds_part, PARTICLES.FIXED, parttype);

var parttype = part_type_create();
part_type_sprite(parttype, s_particleHacked, true, true, false);
part_type_size(parttype, 1, 1, 0, 0);
part_type_direction(parttype, 45, 135, 0, 0);
part_type_speed(parttype, 0.1, 0.5, -0.01, 0);
part_type_life(parttype, 20, 30);
ds_map_add(ds_part, PARTICLES.HACKED, parttype);

var parttype = part_type_create();
part_type_sprite(parttype, sp_oilParticleSplash, false, false, true);
part_type_size(parttype, 1, 1, 0, 0);
part_type_direction(parttype, 0, 180, 0, 0);
part_type_speed(parttype, 0.1, 0.5, 0.01, 0);
part_type_life(parttype, 10, 30);
ds_map_add(ds_part, PARTICLES.OIL, parttype);


enum PARTICLES {
	FIRE, REPAIR, FIXED, HACKED, OIL,
}