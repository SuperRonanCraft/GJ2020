/// @desc

if (damage_do) { //Are we allowed to do damage?
	if (damage_tick < damage_tick_max)
		damage_tick++;
	else {
		scDamage(damage);
		damage_tick = 0;
	}
}
