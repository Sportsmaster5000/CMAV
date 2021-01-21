/// @description Destroys self if flag has already been raised.

if (global.storySkateboardSaved)
{
	instance_destroy();	
}

event_inherited();

