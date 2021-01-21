/// @function hockeyPlayer_animate()
/// @description animates the hockey player.
function hockeyPlayer_animate() {
	switch (state)
	{
		case(hockeyPlayerStates.run):
			sprite_index = spriteRun;	
		break;
		case(hockeyPlayerStates.melee):
			sprite_index = spriteAttack;
		break;
		default:
			sprite_index = spriteIdle;	
		break;
	}


}
