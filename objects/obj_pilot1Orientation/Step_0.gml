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

//State machine. Turn to switch statement if I add more states.
if (state == pilotStates.run)
{
	///If the hockey player is grounded and not moving, makes them take a step.
	if grounded
	{
		hsp = facing * accel;	
	}
}
if (state == pilotStates.shoot)
{
	var _missile = instance_create_layer(x + (facing * 8), y, layer, obj_pilotMissile)
	var _facing = facing;
	var _alignment = alignment;
	with (_missile)
	{
		phys_create(0, 0, _facing * 12, 0, false);
		hurtbox_create(2, 3, 3, _alignment, false);
		image_xscale = _facing;
	}
}

//animates
pilot_animate();






