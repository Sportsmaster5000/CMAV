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
		case 0:
			global.attack++;
		break;
		case 1:
			global.defense++;
		break;
		case 2:
			global.maxHP++;
			global.hp++;
		break;
		case 3:
			global.maxSP++;
			global.sp++;
		break;
		case 4:
			transition_board(xTo, yTo, roomTo);
		break;
		
	}
}
*/