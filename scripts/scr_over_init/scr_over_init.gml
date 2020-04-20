var s = instance_create_layer(room_width div 2, 256, "Instances", obj_select);
s.text = "PLAY AGAIN";

var s = instance_create_layer(room_width div 2, 288, "Instances", obj_select);
s.text = "MENU";

var s = instance_create_layer(room_width div 2,32,"Instances",obj_title);
s.text = "GAME OVER";
s.xscl = 1.5;
s.yscl = 1.5;