/// @description Insert description here
// You can write your code in this editor

scAnimationStatePlayer();


draw_sprite_ext(currentSprite,floor(animationVar),x,y,facing * 1,1,0,c_white,1);
animationVar+= image_speed;

if(animationVar > sprite_get_number(currentSprite))
	animationVar = 0;
