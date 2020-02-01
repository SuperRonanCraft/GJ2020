/// @description Insert description here
// You can write your code in this editor

//Particles
global.ParticleSystem1 = part_system_create();
part_system_depth(global.ParticleSystem1, 102);

global.Emitter1 = part_emitter_create(global.ParticleSystem1);

//Initiate
ds_part = ds_map_create();
ds_part_amt = ds_map_create();
var spd = 0.5;
var life = 2;
var amt = 1;

/*var parttype = part_type_create();
part_type_sprite(parttype, s_pwinter, false, false, false);
part_type_size(parttype, 0.1, 1, -0.05, 0);
part_type_direction(parttype, 270, 270, 0, 0);
part_type_speed(parttype, 0.5 * spd, 1 * spd, 0.1 * spd, 0);
ds_map_add(ds_part, PARTICLES.WINTER, parttype);
ds_map_add(ds_part_amt, PARTICLES.WINTER, 2 * amt);

parttype = part_type_create();
part_type_sprite(parttype, s_pice, false, false, true);
part_type_size(parttype, 0.3, 0.5, 0, 0);
part_type_direction(parttype, 0, 360, 0, 0);
part_type_speed(parttype, 0.8 * spd, 1.1 * spd, 0, 0);
part_type_alpha3(parttype,1,0.8,0);
part_type_life(parttype, 5 * life, 15 * life);
ds_map_add(ds_part, PARTICLES.ICE, parttype);
ds_map_add(ds_part_amt, PARTICLES.ICE, 7 * amt);


parttype = part_type_create();
part_type_shape(parttype,pt_shape_square);
part_type_size(parttype,0.125,0.2,-0.005,0);
part_type_scale(parttype,1,1);
part_type_color3(parttype,8454143,4227327,255);
part_type_alpha3(parttype,1,0.8,0);
part_type_speed(parttype,1,1.2,0,0);
part_type_direction(parttype,0,359,0,0);
part_type_gravity(parttype,0.1,90);
part_type_orientation(parttype,0,0,0,1,0);
part_type_blend(parttype,1);
part_type_life(parttype,10,30);
*/

enum PARTICLES {
	FIRE
}