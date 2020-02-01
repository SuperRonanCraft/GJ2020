/// @description  
if(other.hsp != 0){
	part_emitter_region(global.ParticleSystem1,global.Emitter1,bbox_left,bbox_right,y-10,y+10,ps_shape_ellipse,ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.ds_part[?PARTICLES.OIL],3);	
}