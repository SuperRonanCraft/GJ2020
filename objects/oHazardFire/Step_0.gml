/// @description  
if(!extinguished && fire_size <= 0){
	//Add remove from list script
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


	
	
	