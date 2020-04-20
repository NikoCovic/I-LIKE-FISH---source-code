/// @description Initialize
image_speed = 0;
image_blend = global.blend;
xscl = 1;
yscl = 1;
angl = 0;
dir = 0;

hspd = 0;
vspd = 0;
spd = 2;

move = true;

state = "free";

draw_timer = 0;

// Don't be on a wall
while (place_meeting(x,y,obj_solid)) {
	x = irandom_range(16,room_width-16);
	y = irandom_range(16,room_height-16);
}
// The fish you are holding
fish = noone;
water = 1;