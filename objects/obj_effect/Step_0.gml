/// @description Spin, shrkink, fade out, die
if (!global.pause or obj_game.over) {
	image_xscale -= .02;
	image_yscale -= .02;
	image_angle += a;
	x += lengthdir_x(spd,dir);
	y += lengthdir_y(spd,dir);
}
if (image_xscale <= 0) {
	instance_destroy();	
}
depth = -y;
