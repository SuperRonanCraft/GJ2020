/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude set the strenght of the shake (radius)
/// @arg Frames sets the lenght of the shake in frames
/// @arg override should we override and set this new one?
var mag = argument0;
var frames = argument1;
var override = argument2;
with (oCamera)
	if (argument0 > shake_remain) {
		if (shake_remain <= 0 || override) {
			shake_magnitude = mag;
			shake_remain = mag;
			shake_lenght = frames;
		}
	}