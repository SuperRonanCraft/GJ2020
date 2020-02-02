/// @desc Pause
if (!global.pause_possible) exit;
SlideTransition(TRANS_MODE.PAUSE);
//background = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0);
//instance_deactivate_all(true);
//instance_activate_object(oTransition);
//instance_activate_object(oGameModeManager);
//instance_activate_object(oUIPause);
//instance_activate_object(oMusicHandler);
global.play = false;
global.pause = true;
global.shop_show = true;