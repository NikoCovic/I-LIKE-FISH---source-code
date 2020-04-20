/// @description Initialize
image_alpha = 0;
depth = -room_height-7;
if (audio_is_playing(snd_music2)) {
	audio_stop_sound(snd_music2);
}
if (audio_is_playing(snd_music3)) {
	audio_stop_sound(snd_music3);
}
audio_play_sound_on(global.music,snd_music4,true,11);