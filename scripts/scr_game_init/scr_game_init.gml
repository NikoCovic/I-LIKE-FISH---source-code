// Score
global.scr = 0;
scr1 = 0;
// Sadness level
global.sad = 0;
// Saved fish
global.saved = 0;
// Are you being seen?
global.seen = false;
ds_grid_set_region(global.grid,0,0,width,height,VOID);
repeat(6) {
	scr_make_pond();	
}
// Don't be over
over = false;
// Unpause
global.pause = false;
// Create the pond objects
for (var xx=0; xx<width; xx++) {
	for (var yy=0; yy<height; yy++) {
		if (ds_grid_get(global.grid,xx,yy) == POND) {
			instance_create_layer(xx*CELL_WIDTH_HEIGHT,yy*CELL_WIDTH_HEIGHT,"Instances",obj_pond);	
		}
	}
}
// Number of fishermen
global.fisherman = 1;
repeat(global.fisherman) {
	var xy = irandom(1);
	var xx,yy;
	if (xy) {
		xx = choose(-64,room_width+64);
		yy = irandom(room_height);
	} else {
		xx = irandom(room_height);
		yy = choose(-64,room_height+64);	
	}
	instance_create_layer(xx,yy,"Instances",obj_fisherman);
}
// Create the player
instance_create_layer(irandom_range(16,room_width-16),irandom_range(16,room_height-16),"Instances",obj_player);
// Create the camera
instance_create_layer(room_width div 2, room_height div 2, "Instances",obj_camera);