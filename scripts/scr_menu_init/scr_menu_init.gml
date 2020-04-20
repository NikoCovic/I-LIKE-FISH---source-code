var s = instance_create_layer(room_width div 2, 96, "Instances", obj_select);
s.text = "PLAY";

var s = instance_create_layer(room_width div 2, 144, "Instances", obj_select);
s.text = "TUTORIAL";

var s = instance_create_layer(room_width div 2, 192, "Instances", obj_select);
s.text = "TOGGLE SFX";

var s = instance_create_layer(room_width div 2, 240, "Instances", obj_select);
s.text = "TOGGLE MUSIC";

var s = instance_create_layer(room_width div 2, 288, "Instances", obj_select);
s.text = "TOGGLE COLOR";

var s = instance_create_layer(room_width div 2, 336, "Instances", obj_select);
s.text = "QUIT";

instance_create_layer(room_width div 2, 32, "Instances", obj_logo);