/// @description Stick to the fisherman
x = obj.x;
y = obj.y;
image_angle = obj.angl-90;

if (place_meeting(x,y,obj_player) and obj_player.state == "fish") {
	if (obj.state == "fish") {
		obj.f.obj = noone;
	}
	obj.state = "chase";
} 

if (obj.state == "chase" and !place_meeting(x,y,obj_player)) {
	obj.walk_timer = 0;
	obj.confused_timer = 0;
	obj.state = "confused";	
}