if (!global.play)
	exit;
scFall();
standing = scCollisionOPlayer();
scMove();
 
scStateCheckPlayer();

 
scKeybindsControls();

