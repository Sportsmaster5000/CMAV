/// @description Inherits, defines transition variables. Should be overwritten in create.
event_inherited();

transition_create(room, x, y);

//These transitions also fadeOut.
fade = 0; //How dark the screen has been made. 0 to 1.
fadeOut = false; //If the screen is currently fading out.
fadeTime = game_get_speed(gamespeed_fps) / 2; //1 second.

