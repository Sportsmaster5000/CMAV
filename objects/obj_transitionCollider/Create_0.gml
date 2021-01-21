/// @description initializes object variables. These should be set in creation code.
transition_create(2400, 0, room_overworld1, "Dodge Campus");

//These transitions also fadeOut.
fade = 0; //How dark the screen has been made. 0 to 1.
fadeOut = false; //If the screen is currently fading out.
fadeTime = game_get_speed(gamespeed_fps) / 2; //1 second.