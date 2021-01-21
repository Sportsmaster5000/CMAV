/// @description Inherits. Performs hockeyplayer behavior, animates./
event_inherited();


//Pick a target.
//If the player is not being targeted and the alignment is enemy, sets player as the target.
if (target != PLAYER) && (alignment == faction.enemy)
{
	target = PLAYER;
}


//Decides what state to enter.

if (target == noone)
{
		hockeyPlayer_passive();
}
else
{
		hockeyPlayer_aggressive(target);
}

//Performs actions based on what state the object is in.
switch (state) 
{
	//If state is run, moves towards 'direction'
    case (hockeyPlayerStates.run):
		///If the hockey player is grounded and not moving, makes them take a step.
		if grounded && (abs(hsp) < (accel / 2)) && (abs(hsp) < maxSpeed)
		{
			hsp += facing * accel * 2;	
		}
        break;
    default:
        break;
}

//animates
hockeyPlayer_animate();






