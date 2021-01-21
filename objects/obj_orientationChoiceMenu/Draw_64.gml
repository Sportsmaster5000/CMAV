/// @description Asks player if they've played before, offers choice of yes or no.

/// @description Draws the menu
draw_set_alpha(0.9);
draw_roundrect_color(x - (room_width / 4), 32, x + (room_width / 4), y + 50, c_white, c_white, false);
draw_set_alpha(1);

draw_set_halign(fa_center);

var _string = "Is this your first time to play this game?";
var _stringWidth = string_width(_string);

draw_text_color(384, 32, _string, c_black, c_black, c_black, c_black, 1);
menu_draw_horizontal(x - (_stringWidth / 2), y, options, c_black, c_gray, _stringWidth * 2, optionSelected);