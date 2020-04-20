/// @description Tiling
// Check to the right
if (!place_meeting(x+1,y,obj_pond)) {
	draw_sprite_ext(spr_pond,image_index,x-1,y,1,1,0,image_blend,1);
	draw_sprite_ext(spr_pond,image_index,x,y,1,1,0,c_white,1);		
}
// Check to the left
if (!place_meeting(x-1,y,obj_pond)) {
	draw_sprite_ext(spr_pond,image_index,x+1,y,1,1,180,image_blend,1);
	draw_sprite_ext(spr_pond,image_index,x,y,1,1,180,c_white,1);	
}
// Check up
if (!place_meeting(x,y-1,obj_pond)) {
	draw_sprite_ext(spr_pond,image_index,x,y+1,1,1,90,image_blend,1);
	draw_sprite_ext(spr_pond,image_index,x,y,1,1,90,c_white,1);		
}
// Check down
if (!place_meeting(x,y+1,obj_pond)) {
	draw_sprite_ext(spr_pond,image_index,x,y-1,1,1,270,image_blend,1);
	draw_sprite_ext(spr_pond,image_index,x,y,1,1,270,c_white,1);	
}
// Stop animating if paused
if (global.pause) {
	image_speed = 0;	
} else {
	image_speed = c;	
}
