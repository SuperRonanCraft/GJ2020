/// @description 

scFall();

standing = instance_place(x,y,oWall);

if(!isFloor && standing != noone){
	
	if(standing.walkable){
		isFloor = true;
		y = standing.bbox_top;
		sprite_index = sp_oilFloor;
		image_index = irandom_range(0,image_number-1);
		if(bbox_left < standing.bbox_left){
			x = standing.x+(sprite_width/2);	
		}
		else if(bbox_right > standing.bbox_right){
			x = (standing.x + (64*standing.image_xscale)) - (sprite_width/2);	
		}
	}
	
	else{
		instance_destroy(self,true);	
	}
}

else if(!isFloor){
	scMove();
}

if(!isFloor){
	lifeTime--;
}

if(isFloor){
	if(instance_place(x,y,oHazardFire) != noone){
		instance_create_depth(x,y,depth-1,oHazardFire);
		for (var i = 0; i < irandom_range(1,4); i++) {    
			instance_create_depth(x,y-10,depth-1,oSmoke);
		}
		part_emitter_region(global.ParticleSystem1,global.Emitter1,bbox_left,bbox_right,y-10,y+10,ps_shape_ellipse,ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.ds_part[?PARTICLES.FIRE],15);	

		instance_destroy(self,true);
	}
}

if(lifeTime < 0){
	instance_destroy();	
}
