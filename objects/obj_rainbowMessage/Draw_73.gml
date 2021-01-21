//Draws rainbow text.
var _color0 = make_color_hsv(hue++, 255, 255);
var _color1 = make_color_hsv(hue - 1, 255, 255);
var _color2 = make_color_hsv(hue - 2, 255, 255);
var _color3 = make_color_hsv(hue - 3, 255, 255);

draw_set_halign(fa_center);
draw_text_ext_color(x, y, text, string_height(text), TEXT_BALLOON_MAXW, _color0, _color0, _color0, _color0, (time/maxTime) / 4);
draw_text_ext_color(x, y - 1, text, string_height(text), TEXT_BALLOON_MAXW, _color1, _color1, _color1, _color1, (time/maxTime) / 3);
draw_text_ext_color(x, y - 2, text, string_height(text), TEXT_BALLOON_MAXW, _color2, _color2, _color2, _color2, (time/maxTime) / 2);
draw_text_ext_color(x, y - 3, text, string_height(text), TEXT_BALLOON_MAXW, c_white, c_white, c_white, c_white, time/maxTime);
