/// @function pilot_animate()
/// @description animates pilot npcs.
function pilot_animate() {

	switch (state)
	{
		case(pilotStates.run):
			sprite_index = spriteRun;	
		break;
		case(pilotStates.shoot):
			sprite_index = spriteAttack;
		break;
		default:
			sprite_index = spriteIdle;	
		break;
	}


}
