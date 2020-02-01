/// @desc Game has started
global.play = false;

timer = 120; //New time
timer_current = timer;
game_health = 1000;

scPlaySound(SOUND.MUSIC_3, noone, noone, true);