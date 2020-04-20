/// @description Insert description here
// You can write your code in this editor
if (!global.pause) {
	dir = point_direction(x,y,xTo,yTo);
}
var to_hspd, to_vspd;
// State switch
switch (state) {
	case "free":
		spd = 1*water;
		to_hspd = lengthdir_x(spd,dir);
		to_vspd = lengthdir_y(spd,dir);
		hspd += (to_hspd-hspd)/10;
		vspd += (to_vspd-vspd)/10;
		move = true;
		if (point_distance(x,y,xTo,yTo) <= 10) {
			xTo = irandom_range(16,room_width-16);	
			yTo = irandom_range(16,room_height-16);	
		}
		walk_timer += 1;
		// Stop walking and get a fish
		if (walk_timer == walk_time) {
			walk_timer = 0;
			walk_time -= irandom_range(1,10);
			walk_time = clamp(walk_time,0,300);
			var xy = irandom(1);
			if (xy) {
				xTo = choose(-64,room_width+64);
				yTo = irandom(room_height);
			} else {
				xTo = irandom(room_width);
				yTo = choose(-64,room_height+64);
			}
			state = "get_fish";
		}
	break;
	
	case "get_fish":
		spd = 1*water;
		to_hspd = lengthdir_x(spd,dir);
		to_vspd = lengthdir_y(spd,dir);
		hspd += (to_hspd-hspd)/10;
		vspd += (to_vspd-vspd)/10;
		move = true;
		// Go put the fish somewhere
		if (point_distance(x,y,xTo,yTo) <= 10) {
			xTo = irandom_range(16,room_width-16);	
			yTo = irandom_range(16,room_height-16);	
			while (place_meeting(xTo,yTo,obj_pond)) {
				xTo = irandom_range(16,room_width-16);
				yTo = irandom_range(16,room_height-16);
			}
			// Create a fish
			f = instance_create_layer(x,y,"Instances",obj_fish);
			f.obj = id;
			state = "fish";
		}
	break;
		
	case "fish":
		spd = 1*water;
		to_hspd = lengthdir_x(spd,dir);
		to_vspd = lengthdir_y(spd,dir);
		hspd += (to_hspd-hspd)/10;
		vspd += (to_vspd-vspd)/10;
		move = true;
		// Put the fish down and walk
		if (point_distance(x,y,xTo,yTo) <= 10) {
			f.obj = noone;
			xTo = irandom_range(16,room_width-16);	
			yTo = irandom_range(16,room_height-16);	
			state = "free";
		}
	break;
	
	case "chase":
		xTo = obj_player.x;
		yTo = obj_player.y;
		spd = 1*water;
		to_hspd = lengthdir_x(spd,dir);
		to_vspd = lengthdir_y(spd,dir);
		hspd += (to_hspd-hspd)/10;
		vspd += (to_vspd-vspd)/10;
		move = true;
		global.seen = true;
	break;
	
	case "confused":
		hspd = 0;
		vspd = 0;
		move = false;
		confused_timer += 1;
		if (confused_timer == 120) {
			confused_timer = 0;
			xTo = irandom_range(16,room_width-16);	
			yTo = irandom_range(16,room_height-16);	
			state = "free";
		}
	break;
	
}
// Check for water
if (place_meeting(x,y,obj_pond)) {
	water = .5;	
} else {
	water = 1;	
}
// Depth 
depth = -y;
if (move) {
	if (!global.pause) {
		x += hspd;
		y += vspd;
		angl = point_direction(xprevious,yprevious,x,y)+90;
	}
} else {
	angl = dir+90;
}
