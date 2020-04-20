/// @description Draw the fish
draw_set_font(global.font1);
t += 5;
t %= 360;
xx = sin(degtorad(t))*50+50;
draw_text(x-77,y-1,"$");
draw_text_color(x-76,y,"$",global.blend,global.blend,global.blend,global.blend,1);
draw_sprite_ext(spr_hp_bar,0,x-51,y-1,100,2,0,c_white,1);
draw_sprite_ext(spr_hp_bar,0,x-50,y,xx,2,0,global.blend,1);
draw_text(x+76,y,string(round(xx))+"%");
// Draw text above and below the player
draw_set_halign(fa_center);
draw_text(x,y-32,"SADNESS BAR");
draw_text(x,y+32,"THIS IS THE SADNESS BAR");
draw_text(x,y+64,"SADNESS INCREASES AS FISH DIE");
draw_text(x,y+96,"YOU LOSE IF SADNESS REACHES 100%");