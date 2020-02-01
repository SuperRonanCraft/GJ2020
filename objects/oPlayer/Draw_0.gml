/// @description Insert description here
// You can write your code in this editor

scAnimationStatePlayer();


draw_sprite_ext(currentSprite,floor(animationVar),x,y,facing * 0.8,0.8,0,c_white,1);
animationVar+= image_speed;

if(animationVar > sprite_get_number(currentSprite))
	animationVar = 0;
