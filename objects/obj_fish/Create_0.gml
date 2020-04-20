/// @description Initialize
randomize();
angl = irandom(360);
size = random_range(.25,1);
obj = noone;
image_blend = global.blend;
image_xscale = size;
image_yscale = size;
turn_timer = 0;
// Don't be on a pond
while (place_meeting(x,y,obj_pond) or place_meeting(x,y,obj_fish) or place_meeting(x,y,obj_player)) {
	x = irandom_range(16,room_width-16);
	y = irandom_range(16,room_height-16);
}
// Health
hp = 100;
hp_loss = (.75-size)/2;
hp_loss = clamp(hp_loss,.05,.1);