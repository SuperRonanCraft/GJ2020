/// @desc Player
hsp = 0;
vsp = 0;

move = 0;
type = ENEMY.SCOUT;

depth = -20;

playerState = PLAYERSTATE.NORMAL;
playerAnimState = PLAYERANIMATIONSTATE.STANDING;
currentSprite = sprite_index;

facing = 1;
breathe = false;

animationVar = 0;
image_speed = 0.3;

canControl = true;

enum PLAYERSTATE{

	NORMAL,INTERACTING,CUTSCENE1
	
}

enum PLAYERANIMATIONSTATE{
	
	STANDING,WALKING,INTERACTING,CUTSCENE	
}

scGravityStart();
scKeybindsSet();
alarm[0] = 30;