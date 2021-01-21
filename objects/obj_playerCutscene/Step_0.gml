/// @description Overrides parent event. Increment timer.
timer++;

//After three seconds, offers the player the choice to go to orientation.
if (timer > timerDuration)
{
	room_goto(room_choiceGoToOrientation);
}