/// @desc draw fire

//scDrawRect(x - 10, y - 10, x + 10, y + 10, c_red, false, 1);
draw_self();
if (fire_size < fire_size_max)
	fire_size += fire_size_change;
