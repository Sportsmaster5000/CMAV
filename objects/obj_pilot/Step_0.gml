/// @description Inherits. Performs pilot behavior, animates./
event_inherited();

//Pick a target.
//If the player is not being targeted and the alignment is enemy, sets player as the target.
if (target != PLAYER) && (alignment == faction.enemy)
{
	target = PLAYER;
}

switch(target)
{
	case(noone):
		pilot_passive();
	break;
	default:
		pilot_aggressive(target);
	break;
}

//animates
pilot_animate();






