/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(!itemEquipped){
	scFall();
	
	
	hsp = lerp(hsp,0,0.1);
}
standing = scCollisionOPlayer();
scMove();