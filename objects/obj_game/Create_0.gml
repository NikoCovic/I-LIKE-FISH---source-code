/// @description Initialize
#macro CELL_WIDTH_HEIGHT 16
#macro VOID -7
#macro POND -6
randomize();
// World blend
global.blend = c_orange;
global.color_num = 0;
global.colors[0] = c_orange;
global.colors[1] = c_aqua;
global.colors[2] = c_green;
global.colors[3] = c_red;
global.colors[4] = c_fuchsia;
// Score
global.scr = 0;
scr1 = 0;
// Sadness level
global.sad = 0;
// Saved fish
global.saved = 0;
// Are you being seen?
global.seen = false;
// Font
global.font1 = font_add_sprite_ext(spr_font1,"0123456789%$&;ABCDEFGHIJKLMNOPQRSTUVWXYZ<>",true,2);
// Depth
depth = -room_height-5;
// Fishermen
global.fisherman = 1;
// Create grid
width = room_width div CELL_WIDTH_HEIGHT;
height = room_height div CELL_WIDTH_HEIGHT;
global.grid = ds_grid_create(width, height);
// Create the cursor
instance_create_layer(mouse_x,mouse_y,"Instances",obj_cursor);
// Beginning the game
begin_play = false;
// Pause 
global.pause = false;
// Gamestate
global.gamestate = "menu";
menu = true;
// Is the game over
over = false;
begin_over = false;
// Sound emitters
global.sfx = audio_emitter_create();
global.music = audio_emitter_create();
global.music_gain = 1;
global.sfx_gain = 1;
// Tutorial
global.tutorial_x = 0;
tutorial = false;