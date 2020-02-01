/// @description  
image_speed = random(1);
image_index	 = irandom_range(0, image_number-1);

scGravityStart();
//depth = -200;

turn_rate = irandom_range(-3,3);

lifeTime = irandom_range(120,240);

sizeX = 0.1;
sizeY = 0.1;
angle = 0;

vsp = -1;

animationVar = 0;

//show_debug_message("make smoke");

if(instance_number(oSmoke) > 100){
	instance_destroy();	
}