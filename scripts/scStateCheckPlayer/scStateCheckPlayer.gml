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
		} else {
			playerAnimState = PLAYERANIMATIONSTATE.STANDING
			//playerAnimState = ENEMYSTATE.STANDING;	
		}
		
        break;
}



