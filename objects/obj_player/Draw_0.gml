/// @description Draw self
// Drawing feet and hands
if (!global.pause) {
	draw_timer += 5*spd;
	draw_timer %= 360;
	// Play footstep sound
	if (draw_timer%180 >= 90 and (draw_timer-5*spd)%180 < 90) {
		if (water == 1) {
			audio_play_sound_on(global.sfx,snd_footstep1,false,10);
		} else {
			var w = choose(snd_water1,snd_water2,snd_water3,snd_water4,snd_water5);
			audio_play_sound_on(global.sfx,w,false,10);
		}
	}
}
var foff = 3;
var hoff = 6;
// Draw the feet
var rfo = sin(degtorad(draw_timer))*5;
var lfo = -sin(degtorad(draw_timer))*5;
// Draw the hands
var rho = -sin(degtorad(draw_timer))*5;
var lho = sin(degtorad(draw_timer))*5;
// Set the x and y
var rfx, rfy, lfx, lfy, rhx, rhy, lhx, lhy;
// While moving
if (move) {
	rfx = x+lengthdir_x(foff,angl)+lengthdir_x(rfo,dir);	
	rfy = y+lengthdir_y(foff,angl)+lengthdir_y(rfo,dir)+7;
	
	lfx = x+lengthdir_x(-foff,angl)+lengthdir_x(lfo,dir);	
	lfy = y+lengthdir_y(-foff,angl)+lengthdir_y(lfo,dir)+7;
	
	rhx = x+lengthdir_x(hoff,angl)+lengthdir_x(rho,dir);	
	rhy = y+lengthdir_y(hoff,angl)+lengthdir_y(rho,dir);
	
	lhx = x+lengthdir_x(-hoff,angl)+lengthdir_x(lho,dir);	
	lhy = y+lengthdir_y(-hoff,angl)+lengthdir_y(lho,dir);
// While standing
} else {
	draw_timer = 0;
	rfx = x+lengthdir_x(foff,angl);	
	rfy = y+lengthdir_y(foff,angl)+7;
	
	lfx = x+lengthdir_x(-foff,angl);	
	lfy = y+lengthdir_y(-foff,angl)+7;	
	
	rhx = x+lengthdir_x(hoff,angl);	
	rhy = y+lengthdir_y(hoff,angl);
	
	lhx = x+lengthdir_x(-hoff,angl);	
	lhy = y+lengthdir_y(-hoff,angl);
}
// Check if you have a fish
if (state == "fish") {
	// Put the hands in fron of you
	rhx = x+lengthdir_x(2,angl)+lengthdir_x(10,dir);	
	rhy = y+lengthdir_y(2,angl)+lengthdir_y(10,dir);
	
	lhx = x+lengthdir_x(-2,angl)+lengthdir_x(10,dir);	
	lhy = y+lengthdir_y(-2,angl)+lengthdir_y(10,dir);
}
// Draw th feet if not in water
if (water == 1) {
	draw_sprite_ext(spr_hand_foot,0,rfx,rfy,1,1,angl,c_white,image_alpha);
	draw_sprite_ext(spr_hand_foot,0,lfx,lfy,1,1,angl,c_white,image_alpha);
} else {
// Water outline
	draw_sprite_ext(spr_player_body,0,x,y+4,1.2,1.2,angl,c_white,image_alpha);
}
// Draw the hands
if (dir%360 >= 270 or dir%360 <= 90) {
	draw_sprite_ext(spr_hand_foot,0,rhx,rhy,1,1,angl,c_white,image_alpha);	
} else if (dir%360 <= 270 and dir%360 >= 90) {
	draw_sprite_ext(spr_hand_foot,0,lhx,lhy,1,1,angl,c_white,image_alpha);	
}
// Body
for (var i=0; i<6; i++) {
	draw_sprite_ext(spr_player_body,i,x,y+4-i,xscl,yscl,angl,image_blend,image_alpha);	
	draw_sprite_ext(spr_player_body2,i,x,y+4-i,xscl,yscl,angl,c_white,image_alpha);	
}
// Draw the hands
if (dir%360 >= 270 or dir%360 <= 90) {
	draw_sprite_ext(spr_hand_foot,0,lhx,lhy,1,1,angl,c_white,image_alpha);	
} else if (dir%360 <= 270 and dir%360 >= 90) {
	draw_sprite_ext(spr_hand_foot,0,rhx,rhy,1,1,angl,c_white,image_alpha);	
}
// Head
for (var i=0; i<9; i++) {
	draw_sprite_ext(spr_player_head,i,x,y-2-i,xscl,yscl,angl,image_blend,image_alpha);
	draw_sprite_ext(spr_player_head2,i,x,y-2-i,xscl,yscl,angl,c_white,image_alpha);	
}
// Go blank if game is over
if (obj_game.over) {
	image_alpha = 0;
}
