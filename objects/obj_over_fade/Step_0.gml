/// @description Go darker
image_alpha += .01;
if (image_alpha == 1) {
	obj_game.begin_over = true;	
	room = rm_over;
}