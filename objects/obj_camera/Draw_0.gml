/// @description Draw
var xx = x-room_width*zoom div 2;
var yy = y-(room_height div 2)*zoom-32*zoom;
draw_set_font(global.font1);
// Draw the bar on top
draw_sprite_ext(spr_top_bar, 0, xx, yy, zoom, zoom, 0, c_white, 1);
// Score
draw_set_halign(fa_center);
draw_text_transformed(xx+319*zoom,yy+7*zoom,string(global.scr),zoom,zoom,0);
var s = "";
repeat(string_length(string(global.scr))) {
	s += " ";	
}
draw_text_transformed(xx+319*zoom,yy+7*zoom,"& "+s,zoom,zoom,0);
draw_text_transformed_color(xx+320*zoom,yy+8*zoom,"& "+s,zoom,zoom,0,global.blend,global.blend,global.blend,global.blend,1);
// Sadness bar
draw_set_halign(fa_left);
var sx = 500; 
draw_sprite_ext(spr_hp_bar,0,xx+(sx-1)*zoom,yy+17*zoom,100*zoom,2*zoom,0,c_white,1);
draw_sprite_ext(spr_hp_bar,0,xx+sx*zoom,yy+18*zoom,global.sad*zoom,2*zoom,0,global.blend,1);
draw_text_transformed_color(xx+(sx-20)*zoom,yy+7*zoom,"$",zoom,zoom,0,c_white,c_white,c_white,c_white,1);
draw_text_transformed_color(xx+(sx-19)*zoom,yy+8*zoom,"$",zoom,zoom,0,global.blend,global.blend,global.blend,global.blend,1);
draw_text_transformed_color(xx+(sx+110)*zoom,yy+8*zoom,string(global.sad)+"%",zoom,zoom,0,c_white,c_white,c_white,c_white,1);
// Saved fish
draw_text_transformed(xx+15*zoom,yy+7*zoom,"; ",zoom,zoom,0);
draw_text_transformed_color(xx+16*zoom,yy+8*zoom,"; ",zoom,zoom,0,global.blend,global.blend,global.blend,global.blend,1);
draw_text_transformed(xx+15*zoom,yy+7*zoom,"  "+string(global.saved),zoom,zoom,0);