/// @description runs physics code. Not a physics object, but physics variables have been initialized in create.

//Pauses during dialogue.
if (global.gameState == gameStates.dialogue)
{
	exit;
}

phys_step();