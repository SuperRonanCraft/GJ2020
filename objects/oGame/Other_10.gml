/// @desc Toggle Pause
if (room != rWin && room != rLose)
	if (!global.pause)
		event_user(2); //PAUSE
	else
		event_user(1); //UNPAUSE