/// @desc Unpause
SlideTransition(TRANS_MODE.UNPAUSE);
//sprite_delete(background);
//background = noone;
instance_activate_all();
global.play = true;
global.pause = false;
global.shop_show = false;