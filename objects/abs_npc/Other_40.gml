/// @description If outside the view, deactivates the npc, may move them if need be.
active = false;


//NPCs can teleport if they're outside of view.
if (teleportX != noone)
{
	x = teleportX;
	y = teleportY;
	
	//Resets teleport values.
	teleportX = noone;
	teleportY = noone;
	
	if (instance_exists(myBalloon))
	{
		with (myBalloon)
		{
			instance_destroy();
		}
	}
}