/// @description 

scFall();

//standing = scCollisionOPlayer();
scMove();

//if(standing){
	image_speed = 0.4;	
	if(image_index >= image_number-1){
		image_index = image_number;	
	}
//}


lifeTime--;
image_alpha = lifeTime/10;

if(lifeTime < 0){
	instance_destroy();	
}
