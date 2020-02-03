/// @desc Game has started
global.play = true;

timer_max = 500; //New time
timer = 0;
timer_charge_down = 0;
game_shield = 100;
game_health_max = 850;
game_health = game_health_max;
game_health_warn_alpha = 0;
game_health_warn_fade = false;
game_end_time = 120;
game_win_lose = false;
game_win_lose_sound = false;
game_win_lose_alpha = 0;
game_win_lose_animated = false;
game_win_lose_animated_goal = room_height / 2;
game_win_lose_animated_goal_reached = false;

global.power_surge = false;
power_surge_happened = false;

hazard_spawn_timer = 0;
hazard_spawn_timer_max = 240;


var walk = ds_list_create();
for (var i = 0; i < instance_number(oWall); i++) {
	var _wall = instance_find(oWall, i);
	if (_wall != noone)
		if (_wall.walkable)
			ds_list_add(walk, _wall);
}

var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];
var xx = wall.bbox_left + 16 + (((wall.bbox_right - 16) - (wall.bbox_left + 16)) * random(1));
var yy = wall.y;
instance_create_depth(xx, yy, 100, oRepairStation);

var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];
var xx = wall.bbox_left + 32 + (((wall.bbox_right - 16) - (wall.bbox_left + 32)) * random(1));
var yy = wall.y - 50;
instance_create_depth(xx, yy, oPlayer.depth - 1, oItemExtinguisher);

var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];
var xx = wall.bbox_left + 32 + (((wall.bbox_right - 16) - (wall.bbox_left + 32)) * random(1));
var yy = wall.y - 50;
instance_create_depth(xx, yy, oPlayer.depth - 1, oItemBroom);
ds_list_destroy(walk);

/*var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];
var xx = wall.bbox_left + 32 + (((wall.bbox_right - 32) - (wall.bbox_left + 32)) * random(1));
var yy = wall.y;
instance_create_depth(xx, yy, depth - 1, oLever);*/

scPlaySound(SOUND.MUSIC_3, noone, noone, true);