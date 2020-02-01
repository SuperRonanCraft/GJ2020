/// @description  
draw_self();

animationVar+= image_speed;

if(show_icon){
	draw_sprite_ext(pickupIcon, floor(animationVar), x, y-100, 3,3,0,c_white,1);
}

