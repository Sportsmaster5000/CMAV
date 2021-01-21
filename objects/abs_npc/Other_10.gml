/// @description spawns dialogue balloon. Children can insert events that change text to account for event flags.
//If a balloon object already exists, deletes it.
if (instance_exists(myBalloon))
{
	with (myBalloon)
	{
		instance_destroy();	
	}
}
myBalloon = npc_speak(text);