/// @desc

if(collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,false,true) != noone) {
	var _item = oPlayer.itemHeld;
	if (_item != noone) {
		if (_item.object_index == oDrone && _item.hacked) //Has drone item!
			show_icon = true;
		else
			show_icon = false;
	}
} else {
	var _item = oPlayer.itemHeld;
	if (_item != noone && _item.object_index == oDrone && _item.hacked) { //Has drone item, but not hovering!
		if (pickup_indicator_scale_open) {
			if (pickup_indicator_scale < 1)
				pickup_indicator_scale = min(pickup_indicator_scale + pickup_indicator_scale_change, 1);
			else
				pickup_indicator_scale_open = !pickup_indicator_scale_open;
		} else {
			if (pickup_indicator_scale > 0)
				pickup_indicator_scale = max(pickup_indicator_scale - pickup_indicator_scale_change, 0);
			else
				pickup_indicator_scale_open = !pickup_indicator_scale_open;
		}
		draw_sprite_ext(sp_attention, 0, x + 10, y - 170 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_black, 0.8);
		draw_sprite_ext(sp_attention, 0, x, y - 180 + scMovementWave(-10, 10, 1), pickup_indicator_scale * 3, -3, 0, c_white, 1);
		scDrawText(x, y - 200 + scMovementWave(-10, 10, 1), "REPAIR DRONE", c_yellow, 0.8, c_dkgray, 1);
	}
	show_icon = false;
}

draw_self();

if (show_icon) {
	draw_sprite_ext(icon, floor(animationVar), x + 10, y - 160, 3, 3, 0, c_black, 0.8);
	draw_sprite_ext(icon, floor(animationVar), x, y - 170, 3, 3, 0, c_white, 1);
	animationVar += image_speed;
	if (itemReparing == noone && keyboard_check_pressed(ord("E"))) {
		var _item = oPlayer.itemHeld;
		if (_item.hacked) {
			oPlayer.itemHeld = noone;
			_item.itemEquipped = false;
			_item.can_pickup = false;
			itemReparing = _item;
			show_icon = false;
		}
	}
}