/// @desc SPAWN FIRE!

var walk = ds_list_create();
for (var i = 0; i < instance_number(oWall); i++) {
	var _wall = instance_find(oWall, i);
	if (_wall != noone)
		if (_wall.walkable)
			ds_list_add(walk, _wall);
}

var wall = walk[| irandom_range(0, ds_list_size(walk) - 1)];

var xx = wall.bbox_left + ((wall.bbox_right - wall.bbox_left) * random(1));
var yy = wall.y;
if (!instance_place(xx, yy, oWall))
	instance_create_depth(xx, yy, depth - 1, oHazardFire);