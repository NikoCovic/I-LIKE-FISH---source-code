/// @description Get selected
var to_xscl, to_yscl;
if (place_meeting(x,y,obj_cursor)) {
	selected = true;
	a1 = 0;
	a2 = 0;
	to_xscl = 1.5;
	to_yscl = 1.5;
	// Clicking on it
	if (mouse_check_button_pressed(mb_left)) {
		switch (text) {
			case "PLAY":
				room = rm_play;
				obj_game.begin_play = true;
			break;
			
			case "PLAY AGAIN":
				room = rm_play;
				obj_game.begin_play = true;
			break;
		
			case "QUIT":
				game_end();
			break;
		
			case "CONTINUE":
				global.pause = false;
			break;
		
			case "MENU":
				room = rm_menu;
				obj_game.menu = true;
			break;
			
			case "TOGGLE SFX":
				global.sfx_gain = not global.sfx_gain;
			break;
			
			case "TOGGLE MUSIC":
				global.music_gain = not global.music_gain;
			break;
			
			case "TOGGLE COLOR":
				global.color_num += 1;
				global.color_num %= 5;
			break;
			
			case "<":
				global.tutorial_x += 1;
				global.tutorial_x = clamp(global.tutorial_x,-4,0);
			break;
			
			case ">":
				global.tutorial_x -= 1;
				global.tutorial_x = clamp(global.tutorial_x,-4,0);
			break;
			
			case "TUTORIAL":
				room = rm_tutorial;
				obj_game.tutorial = true;
			break;
		}
	}
} else {
	selected = false;
	timer += 5;
	timer %= 360;
	a1 = sin(degtorad(timer+off))*10;
	a2 = cos(degtorad(timer+off))*10;
	to_xscl = 1;
	to_yscl = 1;
}
xscl += (to_xscl-xscl)/10;
yscl += (to_yscl-yscl)/10;
// Destroy yourself if you are a pause button and the game isn't paused
if (am_pause) {
	if (!global.pause) {
		instance_destroy();	
	}
	// Stick to the camera 
	x = obj_camera.x;
	y = obj_camera.y+yoff*zoom;
	zoom = obj_camera.zoom;	
}
// Scale the collision box
image_xscale = xscl*zoom*string_length(text);
image_yscale = xscl*zoom;