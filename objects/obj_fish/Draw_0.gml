/// @description Draw self
draw_sprite_ext(sprite_index,image_index,x,y,size,size,angl,image_blend,image_alpha);
// Health bar
draw_sprite_ext(spr_hp_bar,1,x-11,y-7,20,1,0,c_white,1);
draw_sprite_ext(spr_hp_bar,0,x-10,y-8,20,1,0,c_white,1);
draw_sprite_ext(spr_hp_bar,0,x-10,y-8,hp/100*20,1,0,global.blend,1);