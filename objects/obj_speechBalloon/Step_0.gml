/// @description Overrides parent. Doesn't float up, just slowly fades. Always stays on same x as creator.

if (instance_exists(owner))
{
	x = owner.x;	
}

//Decrements time if not in dialogue mode.
if (global.gameState == gameStates.play)
{
	time--;

	if (time < 0)
	{
		instance_destroy();	
	}
}