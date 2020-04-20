/// @description Draw
// Draw the end score at the death screen
draw_set_font(global.font1);
if (global.gamestate == "over") {
	draw_set_halign(fa_left);
	// Score
	draw_text(room_width div 2-129,95,"SCORE & "+string(global.scr));
	draw_text_color(room_width div 2-128,96,"SCORE & ",global.blend,global.blend,global.blend,global.blend,1);
	// Sadness
	draw_text(room_width div 2-129,127,"SADNESS $ "+string(global.sad)+"%");
	draw_text_color(room_width div 2-128,128,"SADNESS $ ",global.blend,global.blend,global.blend,global.blend,1);
	// Saved fish
	draw_text(room_width div 2-129,159,"SAVED ; "+string(global.saved));
	draw_text_color(room_width div 2-128,160,"SAVED ; ",global.blend,global.blend,global.blend,global.blend,1);
}