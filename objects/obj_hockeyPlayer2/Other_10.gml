/// @description Insert description here
/// @description Changes dialogue based on lignment.
 
var _array;
_array[0] = "Gotta practice for the big game!";


if !(global.storySkateboardSaved)
{
	var _array;
	_array[0] ="Yvonne has Michael's board, if you need it back go ask her.";
}


dialogue_enter(_array, spr_portraitJim);