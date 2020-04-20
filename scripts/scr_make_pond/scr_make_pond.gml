// Make ponds
// Initiali coordinates
var cx = irandom_range(2,width-1);
var cy = irandom_range(2,height-1);
var bx = cx;
var by = cy;
var odds = 1;
var odds2 = 1;
var cdir = 0;
// Create the pond
repeat(200) {
	// Random turn	
	if (irandom(odds) == odds) {
		cdir = irandom(4);	
	}
	// Random return to the middle
	if (irandom(odds) == odds2) {
		cx = bx;
		cy = by;
	}
	// Move
	cx += lengthdir_x(1,cdir*90);
	cy += lengthdir_y(1,cdir*90);
	// Clamp the coordinates
	cx = clamp(cx,2,width-1);
	cy = clamp(cy,2,height-1);
	// Set the place to a pond
	ds_grid_set(global.grid,cx,cy,POND);
}