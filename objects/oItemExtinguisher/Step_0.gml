/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(!itemEquipped){
	scFall();
	
	
	hsp = lerp(hsp,0,0.1);
}

else{


	if(keyboard_check(vk_space)){
		//show_debug_message("spraying");
		var foam = instance_create_depth(x+(25*oPlayer.facing), y,depth+1,oFoam);
		foam.hsp = oPlayer.facing * irandom_range(5,10);
	}
	
}


standing = scCollisionOPlayer();
scMove();