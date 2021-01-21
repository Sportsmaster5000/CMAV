/// @description Draws the message text.
draw_set_halign(fa_center);
draw_text_ext_color(x, y, text, string_height(text), TEXT_BALLOON_MAXW, c_gray, c_gray, c_gray, c_gray, time/maxTime)
draw_text_ext_color(x, y - 1, text, string_height(text), TEXT_BALLOON_MAXW, c_black, c_black, c_black, c_black, time/maxTime)
