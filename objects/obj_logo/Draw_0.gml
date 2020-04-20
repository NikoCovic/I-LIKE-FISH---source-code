/// @description Draw self
draw_sprite_ext(sprite_index,0,x,y,1.5,1.5,angl,c_white,1);
draw_sprite_ext(sprite_index,1,x,y,1.5,1.5,angl,global.blend,1);
draw_sprite_ext(spr_fish,1,x-1,y-1,1.5,1.5,angl,c_white,1);
draw_sprite_ext(spr_fish,1,x,y,1.5,1.5,angl,global.blend,1);

t += 1;
t %= 360;
angl = sin(degtorad(t))*10;
