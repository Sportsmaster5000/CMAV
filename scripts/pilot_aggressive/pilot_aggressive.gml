/// @function pilot_aggressive(target)
/// @description makes the pilot attack the target.
/// @param target The target for the attack.
function pilot_aggressive(argument0) {

	var _target = argument0;
	var _direction = sign(_target.x - x);
	var _distance = distance_to_object(_target);

	//Decrements attack timer.
	if (attackTimer > 0)
	{
		attackTimer--;	
	}

	//Sets state based on range, may perform an action on changing state.
	if (_distance < CLOSE_RANGE)
	{
		facing = -_direction;
		state = pilotStates.run;
	} 
	//If within range fires a projectile.
	else if (_distance < LONG_RANGE)
	{
		facing = _direction;
		if (attackTimer <= 0)
		{
			state = pilotStates.shoot;
			attackTimer = attackTime;
		
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
		else
		{
			state = pilotStates.idle;	
		}
	}
	//If outside of range reverts to passive behavior.
	else
	{
		pilot_passive()	
	}


	//Consider merging these with above if sattemenet.s
	if (state == pilotStates.run)
	{
	}



}
