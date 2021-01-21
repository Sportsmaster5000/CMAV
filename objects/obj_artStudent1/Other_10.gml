/// @description Changes dialogue text.


var _array;
_array[0] =  "Looking good!";
		

if !(global.storySophieBrushesSaved)
{
		
	var _array;
	_array[0] =  "I lost my paintbrush set. If you find it could you bring it back to me?";
		
	//notes that sophie has been spoken to once.
	if !(global.storySophie1)
	{
		global.storySophie1 = true;
	}
}
else
{
	if !(global.storySophiePartyInvited)
	{
		var _array;
		_array[0] =  "You got my brushes back! You should come to my party later!";
			
		//Increments points.
		global.reputation += 20;
		global.social += 10;
		global.money += 600;
		global.storySophiePartyInvited = true;
			
		var _text = "Reputation +20\nSocial +10\nMoney +600";
			
		myBalloon = instance_create_layer(PLAYER.x, PLAYER.y - sprite_height, layer, obj_rainbowMessage);
		with (myBalloon)
		{
			message_create(_text, game_get_speed(gamespeed_fps) * TEXT_SPEED);
		}
			
	}
	else
	{
		var _array;
		_array[0] =  "See you at my party!";
	}
}

dialogue_enter(_array, spr_portraitSophia);



