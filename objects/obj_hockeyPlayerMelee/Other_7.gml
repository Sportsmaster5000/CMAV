/// @description Destroys self at end of animation.
instance_destroy();

if (instance_exists(owner))
{
	with (owner)
	{
		state = hockeyPlayerStates.idle;	
	}
}