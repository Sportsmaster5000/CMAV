/// @description If there is a speech bubble, animates this NPC to talk.
event_inherited();

if (instance_exists(myBalloon))
{
	image_speed = 0.5;	
}
else
{
	image_speed = 0;	
}
