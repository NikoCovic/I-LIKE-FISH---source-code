/// @description Stick to the player if picked up
if (obj != noone) {
	x = obj.x + lengthdir_x(16,obj.angl-90);	
	y = obj.y + lengthdir_y(16,obj.angl-90);
	angl = obj.angl;
	// Go into the water and live
	if (obj == obj_player.id) {
		if (place_meeting(x,y,obj_pond)) {
			obj.state = "free";
			// Give the player some score
			global.scr += size*100;
			// Saved a new fish
			global.saved += 1;
			// Effect
			repeat(5) {
				var e = instance_create_layer(x,y,"Instances",obj_effect);
				e.image_blend = global.blend;
			}
			// Sound effect
			audio_play_sound_on(global.sfx,snd_pointup,false,10);
			var w = choose(snd_water1,snd_water2,snd_water3,snd_water4,snd_water5);
			audio_play_sound_on(global.sfx,w,false,10);	
			instance_destroy();
		}
	}
} else {
	// Turn a bit
	if (!global.pause) {
		turn_timer += 5;
		turn_timer %= 360;
		angl += sin(degtorad(turn_timer))*2;
	}	
	if (place_meeting(x,y,obj_pond)) {
		instance_destroy();
	}
	// Die if left outside of the room
	if (x < 0 or x > room_width or y < 0 or y > room_height) {
		instance_destroy();	
	}
 	// Lose health
	if (!global.pause) {
		hp -= hp_loss;
		hp = clamp(hp,0,100);
	}
	// Die
	if (hp == 0) {
		global.sad += 20*size;	
		// Effect
		repeat(5) {
			var e = instance_create_layer(x,y,"Instances",obj_effect);
			e.image_xscale = random_range(.25,.5);
			e.image_yscale = e.image_xscale;
			e.image_blend = global.blend;
		}
		// Sound effect
		audio_play_sound_on(global.sfx, snd_fish_die, false, 10);
		instance_destroy();
	}
}
// Depth
depth = -y;
