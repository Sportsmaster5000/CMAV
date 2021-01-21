/// @description Increment timers, allow skipping of cutscene.

if (FACE_BUTTON_RELEASED)
{
	transition_board(xTo, yTo, roomTo);
}

if (timer > 0)
{
	timer--;
}
else
{
	timer = time;
	
	//If at the end of the cutscene, transition to the given room.
	if (imageIndex >= length)
	{
		transition_board(xTo, yTo, roomTo);
	}
	else
	{
		imageIndex++;
	}
}

//show_debug_message("\n\nImage Index: " + string(imageIndex) + "\nTimer: " + string(timer) + "\nFadeIn Timer " + string(fadeInTimer) + "\nDark Timer: " + string(darkTimer));