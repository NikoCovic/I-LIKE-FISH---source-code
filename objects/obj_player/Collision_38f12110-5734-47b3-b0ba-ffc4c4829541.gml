/// @description Die if you were being chased
if (other.state == "chase" and !obj_game.over) {
	obj_game.over = true;
	instance_create_layer(-128,-128,"Instances",obj_over_fade);
	// Effect
	repeat(5) {
		var e = instance_create_layer(x,y,"Instances",obj_effect);
		e.image_blend = global.blend;
	}
	// Sound effect
	audio_play_sound_on(global.sfx,snd_game_over,false,10);
}
