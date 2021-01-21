/// @description Inherits, allows event selection.
event_inherited();

if (ANY_BUTTON_RELEASED)
{
			transition_board(xTo, yTo, roomTo);
}

/*
if (FACE_BUTTON_RELEASED)
{
	switch	(optionSelected)
	{
		//Exit case first.
		case 4:
			transition_board(xTo, yTo, roomTo);
		break;
		
		//Checks if the player has enough money to go to the class.
		/*
		if (prices[optionSelected] <= global.money)
		{
		}
		audio_play_sound(snd_confirm, 1, false);
		
		//If they do, the player can pay to go to the class.
		case 0:
			if (global.mathGrade >= array_length_1d(global.grades) - 1)
			{
				break;
			}
			global.mathGrade++;
			global.money -= prices[optionSelected];
		break;
			
		case 1:
			if (global.scienceGrade >= array_length_1d(global.grades) - 1)
			{
				break;
			}
			global.scienceGrade++;
			global.money -= prices[optionSelected];
		break;

			
		case 2:
			if (global.socialStudiesGrade >= array_length_1d(global.grades) - 1)
			{
				break;
			}
			global.socialStudiesGrade++;
			global.money -= prices[optionSelected];
		break;
			
		case 3:
			if (global.gymGrade >= array_length_1d(global.grades) - 1)
			{
				break;
			}
			global.gymGrade++;
			global.money -= prices[optionSelected];
			break;
		
	}
	
			transition_board(xTo, yTo, roomTo);
}
*/