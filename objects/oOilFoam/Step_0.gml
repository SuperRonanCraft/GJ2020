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

if(lifeTime < 0){
	instance_destroy();	
}
