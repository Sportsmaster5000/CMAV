/// @description presents rooms to teleport to

/// @description Draws the menu
draw_set_alpha(0.85);
draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

for (var _i = 0; _i <= array_length( global.rooms); _i++)
{
	draw_text_color(0, 32 * _i, room_get_name(global.rooms[_i]), c_white, c_white, c_white, c_white, 1);	
}
