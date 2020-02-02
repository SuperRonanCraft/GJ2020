///@desc Check each state


switch (playerState) {
    case PLAYERSTATE.NORMAL:
        canControl = true;
		if (hsp != 0) {
			if(instance_place(x,y,oOilFoam) == noone){
				playerAnimState = PLAYERANIMATIONSTATE.WALKING;	
			}
			else{
				playerAnimState = PLAYERANIMATIONSTATE.SLIDING;	
			}
		} else if(hsp == 0 && standing){
			playerAnimState = PLAYERANIMATIONSTATE.STANDING;
			//playerAnimState = ENEMYSTATE.STANDING;	
		}
		else if(!standing){
			playerAnimState = PLAYERANIMATIONSTATE.JUMPING;	
		}
		
        break;
}



