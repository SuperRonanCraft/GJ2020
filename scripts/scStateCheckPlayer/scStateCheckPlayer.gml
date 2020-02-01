///@desc Check each state


switch (playerState) {
    case PLAYERSTATE.NORMAL:
        canControl = true;
		
		if(hsp != 0){
			playerAnimState = PLAYERANIMATIONSTATE.WALKING;	
			
			
			part_emitter_region(global.ParticleSystem1,global.Emitter1,x-25,x+25,y+55,y+40,ps_shape_ellipse,ps_distr_gaussian);

			part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.spartCloud,2);
			breathe = false;
		
		}
		else{
			playerAnimState = ENEMYSTATE.STANDING;	
		}
		
		
        break;
}



