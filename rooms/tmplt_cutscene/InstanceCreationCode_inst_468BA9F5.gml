var _images;
_images[0] = bg_room1SS1;

var _names;
_names[0] = "Clock Tower";

cutscene_create(_images, _names, game_get_speed(gamespeed_fps) * 3);

transition_create(room_overworld1, 2000, 50);