	/// @description Draws menu, current player sprite.

draw_sprite(global.playerIdleSprite, 0, x, y);

// Inherit the parent event
menu_draw(x, room_height *  3 / 4, options, c_black, c_gray, room_height, optionSelected);

draw_set_halign(fa_center);
draw_text_color(x, room_height * 7 / 8, "Use <- and -> to select character.", c_black, c_black, c_black, c_black, 1)
draw_text_color(x, (room_height * 7 / 8 ) + 25, "Press Enter/Return to Continue.", c_black, c_black, c_black, c_black, 1)

