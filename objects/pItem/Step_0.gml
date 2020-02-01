/// @description  


if(!itemEquipped && collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,false,true) != noone){
	if(oPlayer.itemHeld == noone){
		pickupIcon = sp_pickup;	
	}
	else if(oPlayer.itemHeld != noone){
		pickupIcon = sp_swap;	
	}

	show_icon = true;
	
	if(!reticMade){
		reticMade = true;
		for (var i = 0; i < 4; i++) {
			var retic = instance_create_depth(x, y, depth-5,oReticle);
			retic.reticle_id = i;
			retic.targetObj = id;
			retic.active = true;
		}
	}
	
	
	if	( keyboard_check_pressed(ord("E") ) ){
		
		if(oPlayer.itemHeld != noone){
			oPlayer.itemHeld.itemEquipped = false;
			oPlayer.itemHeld.hsp = oPlayer.facing*irandom_range(5,20);
		}
		oPlayer.itemHeld = id;
		
		itemEquipped = true;
		
	}
	
}

else{
	show_icon = false;	
	reticMade = false;
}

if(itemEquipped){
	x = oPlayer.x;
	y = oPlayer.y-50;
}
