/// @description Game
// Begin the game
if (begin_play) {
	scr_game_init();
	global.gamestate = "play";
	if (audio_is_playing(snd_music1)) {
		audio_stop_sound(snd_music1);
	}
	if (audio_is_playing(snd_music4)) {
		audio_stop_sound(snd_music4);
	}
	audio_play_sound_on(global.music,snd_music2,true,11);
	begin_play = false;
}
// Begin menu
if (menu) {
	scr_menu_init();
	global.gamestate = "menu";
	if (audio_is_playing(snd_music2)) {
		audio_stop_sound(snd_music2);
	}
	if (audio_is_playing(snd_music3)) {
		audio_stop_sound(snd_music3);
	}
	if (audio_is_playing(snd_music4)) {
		audio_stop_sound(snd_music4);
	}
	if (!audio_is_playing(snd_music1)) {
		audio_play_sound_on(global.music,snd_music1,true,11);
	}
	menu = false;
}
// Begin the over screen
if (begin_over) {
	scr_over_init();
	global.gamestate = "over";
	begin_over = false;
}
// Begin the tutorial
if (tutorial) {
	scr_tutorial_init();
	global.gamestate = "tutorial";
	tutorial = false;
}	
// During the game
if (global.gamestate == "play") {
	// Fix the score
	global.scr = round(global.scr);
	// Fix the sadness
	global.sad = round(global.sad);
	global.sad = clamp(global.sad,0,100);
	// Create fishermen
	scr1 = global.scr div (global.fisherman*100);
	// Check for higher scores and add fishermen
	if (scr1 == global.fisherman) {
		var xy = irandom(1);
		var xx,yy;
		if (xy) {
			xx = choose(-64,room_width+64);
			yy = irandom(room_height);
		} else {
			xx = irandom(room_height);
			yy = choose(-64,room_height+64);	
		}
		instance_create_layer(xx,yy,"Instances",obj_fisherman);
		global.fisherman += 1;
	}
	// Pausing
	if (keyboard_check_pressed(vk_escape) and !over) {
		var s3 = instance_create_layer(obj_camera.x, obj_camera.y, "Instances", obj_select);
		s3.text = "CONTINUE";
		s3.am_pause = true;
		s3.yoff = -48;

		var s4 = instance_create_layer(obj_camera.x, obj_camera.y, "Instances", obj_select);
		s4.text = "MENU";
		s4.am_pause = true;
		s4.yoff = 96;
		
		var s5 = instance_create_layer(obj_camera.x,obj_camera.y,"Instances",obj_title);
		s5.text = "PAUSED";
		s5.xscl = 1.5;
		s5.yscl = 1.5;
		s5.am_pause = true;
		s5.yoff = -96;
		
		var s = instance_create_layer(room_width div 2, 144, "Instances", obj_select);
		s.text = "TOGGLE SFX";
		s.am_pause = true;
		s.yoff = 0;

		var s = instance_create_layer(room_width div 2, 192, "Instances", obj_select);
		s.text = "TOGGLE MUSIC";
		s.am_pause = true;
		s.yoff = 48;
		
		global.pause = true;	
	}
	// Check if sadness is 100%
	if (global.sad == 100 and !over) {
		instance_create_layer(-128,-128,"Instances",obj_over_fade);
		// Effect
		repeat(5) {
			var e = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_effect);
			e.image_blend = global.blend;
		}
		// Sound effect
		audio_play_sound_on(global.sfx,snd_game_over,false,10);
		over = true;		
	}
	// Pause the game if it is over
	if (over) {
		global.pause = true;	
	}
}
// Music and sfx gain
audio_emitter_gain(global.music,global.music_gain);
audio_emitter_gain(global.sfx,global.sfx_gain);
// World blend
global.blend = global.colors[global.color_num];