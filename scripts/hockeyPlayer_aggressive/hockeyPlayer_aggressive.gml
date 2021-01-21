/// @function hockeyPlayer_aggressive(target)
/// @description makes the hockey player attack the target.
/// @param target The target for the attack.
function hockeyPlayer_aggressive(argument0) {

	var _target = argument0;
	var _direction = sign(_target.x - x);
	var _distance = distance_to_object(_target);

	//Decrements attack timer.
	if (attackTimer > 0)
	{
		attackTimer--;	
	}

	//Decides what state to enter.

	//Being in melee locks the hockeyplayer out of performing other actions.
	if (state != hockeyPlayerStates.melee)
	{

		if (_distance < CLOSE_RANGE)
		{
			if (attackTimer <= 0)
			{
				state = hockeyPlayerStates.melee;
			
				//Spawns hurtbox and initializes variables.
				melee = instance_create_layer(x, y, layer, obj_hockeyPlayerMelee);
				var _alignment = alignment;
				with (melee)
				{
					owner = other;
					hurtbox_create(1, 3, 3, _alignment, true);
				}
			
				//Resets timer.
				attackTimer = attackTime;
			}
		}
		else if (_distance < LONG_RANGE)
		{
			facing = _direction;
			state = hockeyPlayerStates.run;
		}
		//If outside of range reverts to passive behavior.
		else
		{
			hockeyPlayer_passive()	
		}	
	}
	else
	{
			if !(instance_exists(melee))
			{
				state = hockeyPlayerStates.idle;
			}	
	}



}
