/// @desc Game has started
global.play = true;

timer_max = 500; //New time
timer = timer_max;
game_shield = 100;
game_health = 1000;
game_end_time = 120;

hazard_spawn_timer = 0;
hazard_spawn_timer_max = 180;


var walk = ds_list_create();
for (var i = 0; i < instance_number(oWall); i++) {
	var _wall = instance_find(oWall, i);
	if (_wall != noone)
		if (_wall.walkable)
			ds_list_add(walk, _wall);
}

var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];

var xx = wall.bbox_left + 32 + (((wall.bbox_right - 32) - (wall.bbox_left + 32)) * random(1));
var yy = wall.y - 20;
if (!instance_place(xx, yy, oWall))
	instance_create_depth(xx, yy, depth - 1, oItemExtinguisher);

scPlaySound(SOUND.MUSIC_3, noone, noone, true);