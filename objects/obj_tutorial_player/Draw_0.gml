/// @Draw the player
// Drawing feet and hands
draw_timer += 10;
draw_timer %= 360;
var foff = 3;
var hoff = 6;
// Turn
dir += 5;
dir %= 360;
angl = dir+90;
// Draw the feet
var rfo = sin(degtorad(draw_timer))*5;
var lfo = -sin(degtorad(draw_timer))*5;
// Draw the hands
var rho = -sin(degtorad(draw_timer))*5;
var lho = sin(degtorad(draw_timer))*5;
// Set the x and y
var rfx, rfy, lfx, lfy, rhx, rhy, lhx, lhy;
// Set the x and y of the feet
rfx = x+lengthdir_x(foff,angl)+lengthdir_x(rfo,dir);	
rfy = y+lengthdir_y(foff,angl)+lengthdir_y(rfo,dir)+7;
	
lfx = x+lengthdir_x(-foff,angl)+lengthdir_x(lfo,dir);	
lfy = y+lengthdir_y(-foff,angl)+lengthdir_y(lfo,dir)+7;
	
rhx = x+lengthdir_x(hoff,angl)+lengthdir_x(rho,dir);	
rhy = y+lengthdir_y(hoff,angl)+lengthdir_y(rho,dir);
	
lhx = x+lengthdir_x(-hoff,angl)+lengthdir_x(lho,dir);	
lhy = y+lengthdir_y(-hoff,angl)+lengthdir_y(lho,dir);

// Draw th feet
draw_sprite_ext(spr_hand_foot,0,rfx,rfy,1,1,angl,c_white,image_alpha);
draw_sprite_ext(spr_hand_foot,0,lfx,lfy,1,1,angl,c_white,image_alpha);

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
// Draw text above and below the player
draw_set_font(global.font1);
draw_set_halign(fa_center);
draw_text(x,y-32,"YOU");
draw_text(x,y+32,"YOUR GOAL IS TO SAVE AS MANY FISH AS YOU CAN");
draw_text(x,y+64,"THE PLAYER WILL MOVE TOWARDS THE CURSOR");
draw_text(x,y+96,"COLLECT FISH BY RUNNING INTO THEM");
draw_text(x,y+128,"THROW THE COLLECTED FISH INTO A POND");