//Size Variables and Mode Setup

w = RES_W;
h = RES_H;
h_half = w / 2;

enum TRANS_MODE {
	OFF, NEXT, GOTO, RESTART, INTRO, PAUSE, UNPAUSE
}

mode = TRANS_MODE.INTRO;
pre_mode = mode;
alpha = 1;
percent = 1;
target = room;
depth -= 1;