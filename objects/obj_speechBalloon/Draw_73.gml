/// @description Draws a box behind the text.
var _balloonWidth = string_width_ext(text, string_height(text), TEXT_BALLOON_MAXW);
var _balloonHeight = string_height_ext(text, string_height(text), TEXT_BALLOON_MAXW) + 10;

draw_set_alpha(time/maxTime);

//Shadows.
draw_roundrect_color(x - _balloonWidth/2, y, x + _balloonWidth/2 + 10, y + _balloonHeight + 10, c_dkgray, c_dkgray, false);
draw_roundrect_color(x - _balloonWidth/2, y - string_height(name) + 5, x - _balloonWidth/2 + string_width(name) + 10, y + 5, c_dkgray, c_dkgray, false);

draw_roundrect_color(x - _balloonWidth/2 - 5, y - 5, x + _balloonWidth/2 + 5, y + _balloonHeight + 5, c_white, c_white, false);

draw_roundrect_color(x - _balloonWidth/2 - 5, y - string_height(name), x - _balloonWidth/2 + string_width(name) + 5, y, c_gray, c_gray, false);
draw_set_alpha(1);

//Tells the player to continue if the player can progress the dialogue.
if (global.gameState == gameStates.dialogue)
{
	draw_set_halign(fa_center);
	draw_text(x, y + _balloonHeight - 12, "(Press C to continue)");
}

draw_set_halign(fa_left);
draw_text_ext_color(x - _balloonWidth/2, y - string_height(name), name, string_height(name), TEXT_BALLOON_MAXW, c_black, c_black, c_black, c_black, time/maxTime);

// Inherit the parent event
draw_text_ext_color(x - _balloonWidth/2, y, text, string_height(text), TEXT_BALLOON_MAXW, c_gray, c_gray, c_gray, c_gray, time/maxTime)
draw_text_ext_color(x - _balloonWidth/2, y - 1, text, string_height(text), TEXT_BALLOON_MAXW, c_black, c_black, c_black, c_black, time/maxTime)


