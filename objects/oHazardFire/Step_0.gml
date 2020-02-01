/// @description  
event_inherited();


if(irandom_range(0,10)==1 && !extinguished){
	//var smoke = instance_create_depth(x + irandom_range(-2,2), y-5,depth-5,oSmoke);
}


if(!extinguished && fire_size <= 0.5){
	//Add remove from list script
	damage_do = false;
	scRemoveWarning(id, hazard_type);
	extinguished = true;
	sprite_index = sp_extinguishedSmoke;
	fire_size_max += 2;
}

if(extinguished && fire_size > fire_size_max/2){
	image_alpha -=0.1;	
}

if(image_alpha <= 0){
	instance_destroy();	
}


	
	
	