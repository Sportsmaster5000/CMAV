/// @description Changes dialogue text.

var _array;
_array[0] =  "My favorite food is bubblegum!";

if (global.storySophie1) && !(global.storySophieBrushesSaved)
{
	var _array;
	_array[0] =   "I saw Falk with Sophie's brushes down by the dorms.";	
}

// Inherit the parent event
dialogue_enter(_array, spr_portraitSophia);

