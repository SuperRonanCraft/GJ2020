/// @desc draw fire

//scDrawRect(x - 10, y - 10, x + 10, y + 10, c_red, false, 1);
draw_self();
if (fire_size < fire_size_max){
	fire_size += fire_size_change;
}

image_xscale = fire_size;
image_yscale = fire_size;

if(!extinguished && floor(get_timer())%10 == 0){
	scParticleSpawn(bbox_left - 10, bbox_right + 10, y - 10, y + 10, 
		oParticleHandler.ds_part[? PARTICLES.FIRE], fire_size * fire_part_amt + fire_part_amt);	
}
