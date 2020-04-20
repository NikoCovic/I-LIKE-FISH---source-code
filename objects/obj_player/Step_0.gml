/// @description Turn towards the mouse
// Decide if you should move
if (distance_to_point(mouse_x,mouse_y) > 10) {
	move = true;	
} else {
	move = false;	
}
// Depth
depth = -y;
// Change the facing direction
if (!global.pause) {
	switch (state) {
		case "free":
			fish = noone;
			dir = point_direction(x,y,mouse_x,mouse_y);
			angl = dir+90;
			spd = 2*water;
		break;
	
		case "fish":
			dir = point_direction(x,y,mouse_x,mouse_y);
			angl = dir+90;
			spd = (1.5-fish.size)*water;
		break;
	}
}
// Move
if (move) {
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	// Pausing
	if (global.pause) {
		hspd = 0;
		vspd = 0;
	}
	// Collisions
	// Horizontal
	if (place_meeting(x+hspd,y,obj_solid)) {
		while (!place_meeting(x+sign(hspd),y,obj_solid)) {
			x += sign(hspd)	
		}
		hspd = 0;
	}
	// Move
	x += hspd;
	// Vertical
	if (place_meeting(x,y+vspd,obj_solid)) {
		while (!place_meeting(x,y+sign(vspd),obj_solid)) {
			y += sign(vspd)	
		}
		vspd = 0;
	}
	// Move
	y += vspd;
}
// Check if you are in water
if (place_meeting(x,y,obj_pond)) {
	water = .5;	
} else {
	water = 1;	
}
