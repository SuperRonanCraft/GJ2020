/// @description Insert description here
// You can write your code in this editor

randomize();

#macro RES_W 1024
#macro RES_H 768

enum ENEMY{
	SCOUT	
}

enum ROOMTYPE{
	DOOR1,LIVINGROOM,DOOR2	
}

//global.key_p1_jump = ord("W");
//global.key_p1_shoot = ord("S");
global.key_p1_left = ord("A");
global.key_p1_right = ord("D");
global.key_p1_down = ord("S");

global.key_p1_left_default = global.key_p1_left;
global.key_p1_right_default = global.key_p1_right;
global.key_p1_right_default = global.key_p1_down;


//Amount of enemies to open door
global.doorBarrageNumber = 5;
global.cookies = 0; //Amount of cookies given
global.cutscene_watched = true;

//MUSIC LEVELS
global.vol_master = 1;
global.vol_music = 0.5;
global.vol_sounds = 1;

//FULLSCREEN
global.fullscreen = false;

//FONT
draw_set_font(font0);

//PAUSING
background = noone;
global.pause_possible = true;
global.pause = false;
global.play = true;

global.win = false;
