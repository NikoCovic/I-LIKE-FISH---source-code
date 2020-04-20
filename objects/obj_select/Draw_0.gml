/// @description Draw the text
draw_set_font(global.font1);
draw_set_halign(fa_center);
draw_text_transformed(x,y,text,xscl*zoom,yscl*zoom,a2);
draw_text_transformed_color(x,y,text,xscl*zoom,yscl*zoom,a1,global.blend,global.blend,global.blend,global.blend,1);