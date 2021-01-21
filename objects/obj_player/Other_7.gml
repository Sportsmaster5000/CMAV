/// @description At the end of animation sometimes changes state.
switch (state)
{
	case (playerStates.skill):
	case (playerStates.melee):
		state = playerStates.idle;
	break;
}