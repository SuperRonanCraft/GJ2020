/// @desc

if(collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,false,true) != noone) {
	var _item = oPlayer.itemHeld;
	if (_item != noone) {
		if (_item.object_index == oDrone && _item.hacked) //Has drone item!
			show_icon = true;
		else
			show_icon = false;
	}
} else
	show_icon = false;

draw_self();

if (show_icon) {
	draw_sprite_ext(icon, floor(animationVar), x, y - 100, 3, 3, 0, c_white, 1);
	animationVar += image_speed;
	if (itemReparing == noone && keyboard_check_pressed(vk_space)) {
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