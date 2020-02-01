/// @description  

if(targetObj != noone){
	if(!targetObj.show_icon){
		instance_destroy();	
	}
}


if(!active){
	visible = false;	
}

else{
	visible = true;	
}

if(active && targetObj != noone){
	switch (reticle_id) {
	    case RETICLE_ID.TOPLEFT:
	        x = lerp(x,targetObj.bbox_left,0.2);
			y = lerp(y,targetObj.bbox_top,0.2);
	        break;
	    case RETICLE_ID.TOPRIGHT:
	        x = lerp(x,targetObj.bbox_right,0.2);
			y = lerp(y,targetObj.bbox_top,0.2);
			image_angle = 270;
	        break;
	    case RETICLE_ID.BOTTOMRIGHT:
	        x = lerp(x,targetObj.bbox_right,0.2);
			y = lerp(y,targetObj.bbox_bottom,0.2);
			image_angle = 180;
	        break;
	    case RETICLE_ID.BOTTOMLEFT:
	        x = lerp(x,targetObj.bbox_left,0.2);
			y = lerp(y,targetObj.bbox_bottom,0.2);
			image_angle = 90;
	        break;
	}	
	
}

