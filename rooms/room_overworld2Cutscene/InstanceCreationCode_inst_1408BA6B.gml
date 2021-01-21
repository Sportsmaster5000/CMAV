var _images;
_images[0] = bg_room2SS1;
_images[1] = bg_room2SS2;
_images[2] = bg_room2SS3;

var _names;
_names[0] = "Clock Tower";
_names[1] = "Weber Fine Arts Building";
_names[2] = "Dorms";

cutscene_create(_images, _names, game_get_speed(gamespeed_fps) * 3);

transition_create(room_overworld2, 5600, 1850);