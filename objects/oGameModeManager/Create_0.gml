/// @desc Game has started
global.play = true;

timer_max = 1000; //New time
timer = 0;
timer_charge_down = 0;
game_shield = 100;
game_health = 800;
game_end_time = 120;
game_win_lose = false;

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
var xx = wall.bbox_left + 16 + (((wall.bbox_right - 16) - (wall.bbox_left + 16)) * random(1));
var yy = wall.y;
instance_create_depth(xx, yy, 100, oRepairStation);

var _created = false;
while (!_created) {
	var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];
	var xx = wall.bbox_left + 32 + (((wall.bbox_right - 32) - (wall.bbox_left + 32)) * random(1));
	var yy = wall.y - 20;
	if (!instance_place(xx, yy, oRepairStation)) {
		instance_create_depth(xx, yy, depth - 1, oItemExtinguisher);
		_created = true;
	}
}

_created = false;
while (!_created) {
	var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];
	var xx = wall.bbox_left + 32 + (((wall.bbox_right - 32) - (wall.bbox_left + 32)) * random(1));
	var yy = wall.y;
	if (!instance_place(xx, yy, oRepairStation) && !instance_place(xx, yy, oItemExtinguisher)) {
		instance_create_depth(xx, yy, depth - 1, oLever);
		_created = true;
	}
}

scPlaySound(SOUND.MUSIC_3, noone, noone, true);