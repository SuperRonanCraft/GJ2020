
switch (playerAnimState) {
    case PLAYERANIMATIONSTATE.WALKING:
        currentSprite = sPlayer_walking;
		breathe = true;
        break;
    case PLAYERANIMATIONSTATE.STANDING:
        
		if(!breathe){
			currentSprite = sPlayer_standing;
			
		}
		
		else if(breathe){
			currentSprite = sPlayer_standing;//sPlayer_standing_breathe;
			
			//part_emitter_region(global.ParticleSystem1,global.Emitter1,x+5,x+15,y-20,y+20,ps_shape_ellipse,ps_distr_gaussian);

			//part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.spartSweat,2);
			
			//if(animationVar == sprite_get_number(sPlayer_standing_breathe)-1){
			//	breathe = false;	
			//}
		}
        break;
}

