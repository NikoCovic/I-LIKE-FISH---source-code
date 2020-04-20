instance_create_layer(room_width div 2,room_height div 2-64,"Instances",obj_tutorial_player);
instance_create_layer(room_width div 2+640,room_height div 2-64,"Instances",obj_tutorial_fish);
instance_create_layer(room_width div 2+2*640,room_height div 2-64,"Instances",obj_tutorial_pond);
instance_create_layer(room_width div 2+3*640,room_height div 2-64,"Instances",obj_tutorial_fisherman);
instance_create_layer(room_width div 2+4*640,room_height div 2-64,"Instances",obj_tutorial_sadness);

var s = instance_create_layer(room_width div 2, 64, "Instances", obj_title);
s.text = "TUTORIAL";

var s = instance_create_layer(room_width div 2, room_width div 2+256, "Instances", obj_select);
s.text = "MENU";

var s = instance_create_layer(32, room_width div 2, "Instances", obj_select);
s.text = "<";

var s = instance_create_layer(room_width-32, room_width div 2, "Instances", obj_select);
s.text = ">";