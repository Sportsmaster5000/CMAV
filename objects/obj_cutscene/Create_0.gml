/// @description Initializes cutscene variables.

//Array of images that will be displayed. Must be overwritten in creation code.
var _images;
_images[0] = noone;

var _names;
_names[0] = noone;

//Creates cutscene variables. Should be overwritten in instance creation code.
cutscene_create(_images, _names, game_get_speed(gamespeed_fps) * 3);

//Includes a transition too. Should be overwritten in instance creation code.
transition_create(room_initialize, x, y);