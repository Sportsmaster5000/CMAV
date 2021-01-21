/// @description overrides parent, allows event selection.
var _arraySize = array_length_1d(options);

optionSelected += LEFT_BUTTON_PRESSED - RIGHT_BUTTON_PRESSED;



//If option goes beyond bounds of array loops to other side.
if (optionSelected < 0)
{
	optionSelected = _arraySize - 1;
}

if (optionSelected >= _arraySize)
{
	optionSelected = 0;
}

//Checks for button inputs.
if  (keyboard_check_released(ord("Y")))
{
			transition_board(900, 1000, room_miloBail);
}

if  (keyboard_check_released(ord("N")))
{
			transition_board(4200, 2100, room_overworld1);
			global.tutorialFinished = true;
}

//Lets you select an option.
if (CONTINUE_BUTTON_RELEASED)
{
	switch	(optionSelected)
	{
		//If it is the player's first time, sends them to orientation.
		case 0:
			transition_board(900, 1000, room_miloBail);
		break;
		//Otherwise, sends them to overworld 1.
		case 1:
			transition_board(4200, 2100, room_overworld1);
			global.tutorialFinished = true;
		break;
		
	}
}