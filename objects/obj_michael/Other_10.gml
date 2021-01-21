/// @description Adds event flags before speaking.

var _array;
_array[0] = "Hi! Welcome to UNO! You can move around using the arrow keys.";

if (global.storySkateboardSaved)
{
	var _array;
	_array[0] = "Thanks. As a sign of our friendship I'll teach you the DASH technique. Double tap left or right to use it. Dorms are to the left, past the clock tower.";	
	
	if (!global.dashReceived)
	{
		
		var _text = "Dash Acquired!\nReputation +10";
		
		myBalloon = instance_create_layer(PLAYER.x, PLAYER.y - sprite_height, layer, obj_rainbowMessage);
		with (myBalloon)
		{
			message_create(_text, game_get_speed(gamespeed_fps) * TEXT_SPEED);
		}
		global.reputation += 10;
		global.dashReceived = true;	
	}
}
else
{
	var _array;
	_array[0] = "Roger and Yvonne borrowed my board but I think they forgot to return it. We can't go to the dorms until I have it back.";	
}


if (global.storySophieFalkMet) && (!global.storySophieCakesGot)
{
	var _array;
	_array[0] =  "Falk's being a jerk about his snack cakes again? Go figure! Tell him I said to give Sophie's brushes back.";	
	
	global.storySophieCakesGot = true;
}


dialogue_enter(_array, spr_portraitMicheal)