/// @description  
angle += turn_rate;

scMove();

lifeTime-= 0.5;

image_alpha = lifeTime/10;

if(sizeX <= random_range(1,2.5)){
	sizeX += 0.01;
	sizeY += 0.01;
}

if(lifeTime <= 0){
	//show_debug_message("destroy smoke");
	instance_destroy();	
}
