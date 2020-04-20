/// @description Initialize
#macro VIEW_WIDTH 640
#macro VIEW_HEIGHT 672
cam = camera_create();

var vm = matrix_build_lookat(x,y-16,-room_height-50,x,y-16,0,0,1,0);
var pm = matrix_build_projection_ortho(VIEW_WIDTH,VIEW_HEIGHT,1,10000);

camera_set_view_mat(cam,vm);
camera_set_proj_mat(cam,pm);

view_camera[0] = cam;

// Depth
depth = -room_height-5;

zoom = 1;

view_x = VIEW_WIDTH;
view_y = VIEW_HEIGHT;