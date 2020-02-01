/// @desc credits




scDrawText(x, y, credits, c_white, 0.5, noone, 1, noone, fa_top);


y -= 1.5;

if (y < -(string_height(credits) * 0.5))
	SlideTransition(TRANS_MODE.GOTO, rMenu);
	
if (global.win)
	scDrawText(10, 10, "YOU WIN! You are not in debt!", c_green, 1, noone, 1, fa_left, fa_top);
else
	scDrawText(10, 10, "YOU LOST! You bought all the cookies!", c_red, 1, noone, 1, fa_left, fa_top);
