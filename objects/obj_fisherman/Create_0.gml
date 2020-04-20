/// @description Initialize
image_speed = 0;
image_blend = global.blend;

draw_timer = 0;
draw_timer2 = 0;
xscl = 1;
yscl = 1;

spd = 1;
angl = 0;
dir = 0;
hspd = 0;
vspd = 0;
state = "fish";
move = true;
xTo = irandom_range(16,room_width-16);
yTo = irandom_range(16,room_height-16);
while (place_meeting(xTo,yTo,obj_pond)) {
	xTo = irandom_range(16,room_width-16);
	yTo = irandom_range(16,room_height-16);	
}

water = 1;

walk_time = 300;
walk_timer = 0;
confused_timer = 0;


// Create a vision area
va = instance_create_layer(x,y,"Instances",obj_vision_area);
va.obj = id;
// Create a fish
f = instance_create_layer(x,y,"Instances",obj_fish);
f.obj = id;

// Sound emitter
em = audio_emitter_create();
audio_emitter_pitch(em,.75);
