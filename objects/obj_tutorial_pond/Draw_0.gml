/// @description Draw the pond
draw_sprite_ext(spr_pond,image_index,x-1,y,1,1,0,global.blend,1);
draw_sprite_ext(spr_pond,image_index,x,y+1,1,1,90,global.blend,1);
draw_sprite_ext(spr_pond,image_index,x+1,y,1,1,180,global.blend,1);
draw_sprite_ext(spr_pond,image_index,x,y-1,1,1,270,global.blend,1);
draw_sprite_ext(spr_pond,image_index,x,y,1,1,0,c_white,1);	
draw_sprite_ext(spr_pond,image_index,x,y,1,1,90,c_white,1);	
draw_sprite_ext(spr_pond,image_index,x,y,1,1,180,c_white,1);	
draw_sprite_ext(spr_pond,image_index,x,y,1,1,270,c_white,1);	
// Draw text above and below the player
draw_set_font(global.font1);
draw_set_halign(fa_center);
draw_text(x,y-32,"POND");
draw_text(x,y+32,"THESE ARE PONDS WHERE YOU THROW THE FISH");
draw_text(x,y+64,"RUNNING THROUGH THEM SLOWS YOU DOWN");