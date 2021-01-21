/// @function menu_draw(x, y, array, color1, color2, height, select)
/// @description Draws a menu from the given array.
/// @param x x coordinate to draw the menu at.
/// @param y y coordinate to draw the menu at.
/// @param array array to draw.
/// @param color1 color for unselected items.
/// @param color2 color for the selected item.
/// @param height height of the menu.
/// @param select selected item in the array.
function menu_draw(_x, _y, _array, _color1, _color2, _height, _select) 
{

	draw_set_colour(_color1);

	draw_set_halign(fa_center);

	//Draws all the options in the array. The selected option is highlighted.
	for (var _i = 0; _i < array_length_1d(_array); _i++)
	{
	    if (_i != _select)
	    {
	        draw_set_colour(_color2);
	    }
    
	    draw_text(_x, _y + ((_height * _i)/array_length_1d(_array)), string(_array[_i]));
    
	    draw_set_colour(_color1);
	}
}

/// @function menu_draw_horizontal(_x, _y, _array, _color1, _color2, _width, _select)
/// @description Draws a menu from the given array.
/// @param _x x coordinate to draw the menu at.
/// @param _y y coordinate to draw the menu at.
/// @param _array array to draw.
/// @param _color1 color for unselected items.
/// @param _color2 color for the selected item.
/// @param _width _width of the menu.
/// @param _select selected item in the array.
function menu_draw_horizontal(_x, _y, _array, _color1, _color2, _width, _select) 
{

	draw_set_colour(_color1);

	draw_set_halign(fa_center);

	//Draws all the options in the array. The selected option is highlighted.
	for (var _i = 0; _i < array_length_1d(_array); _i++)
	{
	    if (_i != _select)
	    {
	        draw_set_colour(_color2);
	    }
    
	    draw_text(_x + ((_width * _i)/array_length_1d(_array)), _y, string(_array[_i]));
    
	    draw_set_colour(_color1);
	}
}



/// @function menu_create(array)
/// @description initializes menu variables.
/// @param _array an array of strings to use as menu options.
function menu_create(_array) 
{
	options = _array;
	optionSelected = 0;
}



/// @function pause_menu_draw_gui()
/// @description draws HP, SP, and the game time.
function pause_menu_draw_gui() 
{

	var _minuteString;

	if (global.mins < 10)
	{
		_minuteString = string(0) + string(global.mins);
	}
	else
	{
		_minuteString = string(global.mins);
	}
	//Left column
	draw_set_halign(fa_left);

	//Stats
	draw_text(260, 110, "Day " + string(global.days) + " Time: " + string(global.hours) + ":" + _minuteString);
	draw_text(260, 160, "HP: " + string(global.hp) + " / " + string(global.maxHP));
	draw_text(260, 180, "SP: " + string(global.sp) + " / " + string(global.maxSP));
	draw_text(260, 200, "ATTACK: " + string(global.attack));
	draw_text(260, 220, "DEFENSE: " + string(global.defense));
	draw_text(260, 240, "$ " + string(global.money));

	//5 dimensions

	draw_set_font(font_large);

	draw_text(260, 400, "Reputation: ");
	draw_text(260, 420, "Education: ");
	draw_text(260, 440, "Challenges: ");
	draw_text(260, 460, "Social: ");
	draw_text(260, 480, "Relations: ");

	draw_set_font(font_med);

	//Meters.
	meter_draw(400, 400, 550, 420, c_black, c_yellow, c_white, c_gray, 2, global.reputation, global.maxReputation);
	meter_draw(400, 420, 550, 440, c_black, c_fuchsia ,c_white, c_gray, 2, global.education, global.maxEducation);
	meter_draw(400, 440, 550, 460, c_black, c_aqua, c_white, c_gray, 2, global.challenges, global.maxChallenges);
	meter_draw(400, 460, 550, 480, c_black, c_lime, c_white, c_gray, 2, global.social, global.maxSocial);
	meter_draw(400, 480, 550, 500, c_black, c_orange, c_white, c_gray, 2, global.relationships, global.maxRelationships);
}

/// @function pause_exit()
/// @description Exits the pause menu, returns to the previous room.
function pause_exit() 
{
	//Returns to previous room.
	room_goto(global.lastRoom);

	//Sets that room as not persistent.
	room_set_persistent(global.lastRoom, false);
}

/// @function pause_enter(_room)
/// @description Pauses the game and sends the player to a paused menu.
/// @param _room The room that will be moved to.
function pause_enter(_room) 
{
	///Saves the current room. This must be reset upon return.
	room_persistent = true;

	///Saves the current room so that it can be returned to after exiting the pause menu.
	global.lastRoom = room;

	//Goes to the pause menu.
	room_goto(_room);
}
