/// @description Insert description here
/// @description Changes dialogue based on alignment.
var _array;
_array[0] = "Gotta practice for the big game!";


if !(global.storySkateboardSaved)
{
	
	var _array;
	_array[0] = " Oh, whoops! Guess I forgot to give the board back. Tell Michael I said thanks!";

	
	if !(instance_exists(obj_skateboard))
	{
		instance_create_depth(x, y, depth, obj_skateboard);
	}
}

dialogue_enter(_array, spr_portraitJim);
