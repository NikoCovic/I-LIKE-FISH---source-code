/// @description Draw the fish
t += 5;
t %= 360;
angl += sin(degtorad(t))*2;
draw_sprite_ext(sprite_index,image_index,x,y,1,1,angl,global.blend,image_alpha);
// Draw text above and below the player
draw_set_font(global.font1);
draw_set_halign(fa_center);
draw_text(x,y-32,"FISH");
draw_text(x,y+32,"THESE ARE THE FISH YOU HAVE TO SAVE");
draw_text(x,y+64,"BIGGER FISH LIVE LONGER");
draw_text(x,y+96,"BIGGER FISH MAKE YOU SLOWER");
draw_text(x,y+128,"BIGGER FISH GIVE YOU MORE SCORE");
draw_text(x,y+160,"BIGGER FISH MAKE YOU MORE SAD IF THEY DIE");