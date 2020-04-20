/// @description Zoom and move
var xTo, yTo;
var to_zoom = 1;
if (global.seen) {
	// Set the direction
	move_towards_point(mouse_x,mouse_y,0);
	// Set the distance
	var dist = min(32, distance_to_point(mouse_x,mouse_y));
	// Set the xTo and yTo
	xTo = obj_player.x + lengthdir_x(dist,direction);
	yTo = obj_player.y + lengthdir_y(dist,direction);	
	to_zoom = .5;
	if (audio_is_playing(snd_music2)) {
		audio_stop_sound(snd_music2);
	}
	if (!audio_is_playing(snd_music3) and !obj_game.over) {
		audio_play_sound_on(global.music,snd_music3,true,11);
	}
} else {	
	xTo = room_width div 2;
	yTo = room_height div 2;
	if (audio_is_playing(snd_music3)) {
		audio_stop_sound(snd_music3);
	}
	if (!audio_is_playing(snd_music2)) {
		audio_play_sound_on(global.music,snd_music2,true,11);
	}
}
// Move
if (!global.pause) {
	x += (xTo-x)/10;
	y += (yTo-y)/10;
}

if (abs(xTo-x) < .1) {
	x = xTo;	
}
if (abs(yTo-y) < .1) {
	y = yTo;
}

// Zoom
if (!global.pause) { 
	zoom += (to_zoom-zoom)/10;
}
view_x = zoom*VIEW_WIDTH;
view_y = zoom*VIEW_HEIGHT;

if (abs(to_zoom-zoom) < .05) {
	zoom = to_zoom;
}

var vm = matrix_build_lookat(x,y-16*zoom,-room_height-50,x,y-16*zoom,0,0,1,0);
var pm = matrix_build_projection_ortho(view_x,view_y,1,10000);

camera_set_view_mat(cam,vm);
camera_set_proj_mat(cam,pm);

global.seen = false;
	