/// @description If fading out, increments fade and if it's high enough sends the player to the next room.

//If collided with, starts fading out.
if (fadeOut)
{
	fade += 1/fadeTime;

	show_debug_message("Fade: " + string(fade));
	
	if (fade >= 1)
	{
		event_user(0);
	}
}