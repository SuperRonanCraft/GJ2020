/// @desc keyboard-controls
var key_left = keyboard_check(keyleft); 
var key_right = keyboard_check(keyright);
var key_jump = keyboard_check_pressed(keyjump);
//var key_shoot = keyboard_check(keyshoot);


//Horizontal
hsp = (key_right - key_left) * move_speed;

if (hsp > 0) {
	facing = 1;	
} else if (hsp < 0) {
	facing = -1;	
}

if (standing)
	vsp -= key_jump * jump_height;


