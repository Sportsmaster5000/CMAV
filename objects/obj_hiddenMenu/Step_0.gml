/// @Goes back to game if pause button is pressed again.
if (HIDDEN_MENU_BUTTON_RELEASED)
{	
	pause_exit();	
}

//Pressing a number key teleports you to the given level.
for (var _i = 0; _i < array_length(rooms); _i++)
{
	if (keyboard_check_released(ord(_i)))
	{
		transition_board(roomPoints[_i][0], roomPoints[_i][1], rooms[_i]);
	}
}