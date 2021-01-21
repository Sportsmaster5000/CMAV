var _images;
_images[0] = bg_room1SS1;
_images[1] = bg_room1SS2;
_images[2] = bg_room1SS3;
_images[3] = bg_room1SS4;

var _names;
_names[0] = "Clock Tower";
_names[1] = "H & K";
_names[2] = "Milo Bail Student Center";
_names[3] = "Dodge Campus";

cutscene_create(_images, _names, game_get_speed(gamespeed_fps) * 3);

transition_create(room_startingCutscene, 4200, 2100);