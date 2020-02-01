/// @desc draw fire

//scDrawRect(x - 10, y - 10, x + 10, y + 10, c_red, false, 1);
draw_self();
if (fire_size < fire_size_max){
	fire_size += fire_size_change;
}

image_xscale = fire_size;
image_yscale = fire_size;


part_emitter_region(global.ParticleSystem1,global.Emitter1,bbox_left,bbox_right,bbox_top,bbox_bottom,ps_shape_ellipse,ps_distr_gaussian);
part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.ds_part[?PARTICLES.FIRE],100);	

