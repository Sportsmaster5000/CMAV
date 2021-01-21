/// @function clock_step()
/// @description increments clock time.
function clock_step() 
{



	global.steps += 10;
	global.daySteps += 10;

	//Moves the skybox. TODO: Make this prettier.
	layer_y(SKYBOX_LAYER, y + 600 + ((global.daySteps / STEPS_IN_DAY) * sprite_get_height(bg_skybox)));


	//Increments time values on the clock.

	if (global.steps > game_get_speed(gamespeed_fps))
	{
		global.mins += global.steps div game_get_speed(gamespeed_fps);
		global.steps = global.steps mod game_get_speed(gamespeed_fps);
	}

	if (global.mins >= 60)
	{
	
		global.hours += global.mins div 60;
		global.mins = global.mins mod 60;
	}

	if (global.hours >= 24)
	{
		global.days += global.hours div 24;
		global.hours = global.mins mod 24;
		global.daySteps = 0;
	}



}
