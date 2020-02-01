event_inherited();
//Default Menus
ds_settings = scUICreateMenuPage(
	["AUDIO",			menu_element_type.page_transfer,	menu_page.audio, "Change your hearing perspective"],
	["GRAPHICS",		menu_element_type.page_transfer,	menu_page.graphics, "Change your eyeballs perspective"],
	//["KEYBINDS",		menu_element_type.page_transfer,	menu_page.keybinds, "Change your hands perspective"],
	["BACK",			menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = scUICreateMenuPage(
	["MASTER",			menu_element_type.slider,			scUIChangeVolume,		"vol_master",	global.vol_master,	0],
	["SOUNDS",			menu_element_type.slider,			scUIChangeVolume,		"vol_sounds",	global.vol_sounds,	1],
	["MUSIC",			menu_element_type.slider,			scUIChangeVolume,		"vol_music",	global.vol_music,	2],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_graphics = scUICreateMenuPage(
	["FULLSCREEN",		menu_element_type.toggle,			scUIToggleFullscreen,	"fullscreen",	global.fullscreen],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

/*ds_menu_keybinds = scUICreateMenuPage(
	["MOVE LEFT",		menu_element_type.input,		"key_p1_left",		global.key_p1_left],
	["MOVE RIGHT",		menu_element_type.input,		"key_p1_right",		global.key_p1_right],
	["RESET",		menu_element_type.script_runner,	scUIResetKeybinds, "This will reset all keys!"],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);