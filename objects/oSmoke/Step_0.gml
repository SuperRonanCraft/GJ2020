/// @description  
//angle += turn_rate;

scCollisionOPlayer();
scMove();

lifeTime-= 0.5;

image_alpha = lifeTime/10;

if(image_xscale <= 2){
	image_xscale += 0.01;
	image_yscale += 0.01;
}

if(lifeTime <= 0){
	show_debug_message("destroy smoke");
	instance_destroy();	
}
