/// @description Get your self picked up
if (other.state != "fish" and obj == noone) {
	other.state = "fish";
	obj = other.id;
	obj.fish = id;
	// Sound effect
	audio_play_sound_on(global.sfx,snd_pickup_fish,false,10);
	audio_sound_gain(snd_pickup_fish,.5,1);
}