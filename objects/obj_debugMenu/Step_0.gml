/// @description Overrides parents for now.

//Room teleporting code.
//Checks if pressing one of the number buttons on the keyboard.
if (keyboard_lastkey >= 48) && (keyboard_lastkey <= 57)
{
	transition_board(1000, 0, global.rooms[keyboard_lastkey]);
}