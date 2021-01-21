/// @description Listens for player controls, processes array contents.

//progresses through dialogue.
if (CONTINUE_BUTTON_RELEASED) || (DOWN_BUTTON_RELEASED) || (RIGHT_BUTTON_RELEASED)
{
	index++;
	dialogue_check_line();
}

//allows player to go back in dialogue.
if (UP_BUTTON_RELEASED) || (LEFT_BUTTON_RELEASED)
{
	if (index > 0)
	{
		index --;
		dialogue_check_line();
	}
}

//You can just skip dialogue if you press escape.
if (keyboard_check_released(vk_escape))
{
	while (index < array_length(dialogueArray))
	{
		index++;
		dialogue_check_line();
	}
}