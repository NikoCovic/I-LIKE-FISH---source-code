/// @description Draw the wanted text
draw_set_font(global.font1);
draw_set_halign(fa_center);
draw_text_transformed(x,y,text,xscl*zoom,yscl*zoom,0);
// Move with the camera
if (am_pause) {
	if (!global.pause) {
		instance_destroy();	
	}
	x = obj_camera.x;
	y = obj_camera.y+yoff*zoom;
	zoom = obj_camera.zoom;
}