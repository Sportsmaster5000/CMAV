/// @description Draws menu.

draw_text_color(5, 5, "Press Num button to warp to a room.", c_white, c_white, c_white, c_white, 1);

for (var _i = 0; _i < array_length(rooms); _i++)
{
	draw_text_color(45, 30 * (_i + 1), string(_i) + " Room:" + room_get_name(rooms[_i]), c_white, c_white, c_white, c_white, 1);
}