
switch (playerAnimState) {
    case PLAYERANIMATIONSTATE.WALKING:
        currentSprite = sPlayer_walking;
        break;
		
    case PLAYERANIMATIONSTATE.SLIDING:
        currentSprite = sPlayer_running;
        break;
		
	case PLAYERANIMATIONSTATE.JUMPING:
        currentSprite = sPlayer_jumping;
        break;
    case PLAYERANIMATIONSTATE.STANDING:
        
		if(!breathe){
			currentSprite = sPlayer_standing;
			
		}
		
		else if(breathe){
			currentSprite = sPlayer_standing;
		}
        break;
}

