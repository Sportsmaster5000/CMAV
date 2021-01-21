/// @description  Changes dialogue based on flags.
 
var _array;
_array[0] = "If you hold C when you attack, you can activate Aggro Mode and damage people even if they aren't fighting you.";


//Dialogue while Sophie's brush quest is active.
if !(global.storySophieBrushesSaved) && (global.storySophie1)
{
	if !(global.storySophieFalkMet)
	{
		var _array;
		_array[0] = "Yeah, I stole Sophie's brushes. What are you going to do, fight me? If you get me snack cakes from Michael, I'll give them back.";
		global.storySophieFalkMet = true;
	}
	else
	{
		var _array;
		_array[0] = "No snack cakes, no brushes! Go find Joey!";	
	}
	
	if (global.storySophieCakesGot)
	{
		var _array;
		_array[0] = "Oh, you got my cakes. I'm in a much better mood now, so no more painting. Have the brushes.";
		
		if !(global.storySophieCakesGiven)
		{
			instance_create_depth(x, y, depth, obj_brushes);
			global.storySophieCakesGiven = true;
		}
		
	}
}

dialogue_enter(_array, spr_portraitFalk);
