/// @function player_create(spriteIdle, spriteRun, spriteJum, spriteMelee, spriteFire, spriteDash)
/// @description Initializes player variables.
/// @param _x x coordinate this object will spawn at.
/// @param _y y coordinate this object will spawn at.
/// @param _spriteIdle The sprite that will be used while the player is idle.
/// @param _spriteRun running sprite
/// @param _spriteJump jumping sprite
/// @param _spriteMelee Melee attack sprite.
/// @param _spriteFire sprite used when executing a skill.
/// @param _spriteDash sprite used while dashing
function player_create(_x, _y, _spriteIdle, _spriteRun, _spriteJump, _spriteMelee, _spriteFire, _spriteDash) 
{
	//initialize physics.
	phys_create(PLAYER_GRAV, PLAYER_FRICT, 0, 0, true);

	//Initialize sprites.
	spriteIdle = _spriteIdle;
	spriteRun = _spriteRun;
	spriteJump = _spriteJump;
	spriteMelee = _spriteMelee;
	spriteFire = _spriteFire;
	spriteDash = _spriteDash;
	sprite_index = spriteIdle;

	//State is what the player character is being commanded to do.
	//Transitioning between states may or may not be permitted.
	state = playerStates.idle;

	//The skill currently being selected from global.skills
	skillIndex = 0;

	//How fast the player can accelerate. Is added to hsp, to a limit of maxSpeed.
	accel = 2;

	//The highest the player can accelerate themselves to.
	maxSpeed = 12;

	//The force appled when the player character jumps. Subtracted from vsp.
	jumpHeight = 15;

	//Which direction the player is facing.
	facing = image_xscale;

	//Sets image speed.
	image_speed = 0.5;


	///Timers
	//Number of seconds to regenerate 1 SP. Lower is faster.
	spRegen = 1;
	spRegenTimer = 0;

	//Invulnerability counter.
	flicker = 0;

	//Dash input timer. Dashing is executed by pressing a direction button twice within quick succession.
	rDashDelay = 0;
	lDashDelay = 0;

	//Dash duration. The player is dashing while this is > 0
	dashDuration = 0;

	//Places the player character at their spawn point.
	x = _x;
	y = _y;


}


/// @function player_aggro()
/// @desctiption player projectiles harm enemies while they hold down the aggro button. Just returns whether or not the aggro button is held down.
function player_aggro() 
{
	return (Y_BUTTON);
}


/// @function player_damage(damage, hKnockback, vKnockback)
/// @description damages player, applies knockback, might even kill them.
/// @param damage Damage that is being dealt. Will have defense applied to it.
/// @param hKnockback How much the player is being knocked back. Should usually be modified by a direction.
/// @param vKnockback how far the player is knocked vertically. Usually negative to knock them upwards.
function player_damage(_damage, _hKnockback, _vKnockback) 
{
	//Applies damage.
	global.hp -= max((_damage - global.defense), 0);

	flicker = PLAYER_FLICKER;

	//applies physics.
	hsp += _hKnockback;
	vsp += _vKnockback;

	//Checks if the player dies.
	if (global.hp <= 0)
	{
		//Haven't programmed game over code yet so just destroys the object for now ig
		//instance_destroy();		
	}


}


/// @function player_draw_gui()
/// @description draws HP, SP, and the game time.
function player_draw_gui() 
{
	
	//Darkens the screen if fading in.
	if (fadeIn)
	{
		draw_set_alpha(fade);
		draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1)
	}
	
	//Right column. Time.
	draw_set_halign(fa_right);

    var _minuteString;

    var intMinuteOffset = global.mins mod 15; // Finds the offset of the current time from the last 15 minute milestone

    

    if (global.mins < 15)

    {

        _minuteString = string(0) + string(global.mins - intMinuteOffset);

    }

    else

    {

        _minuteString = string(global.mins - intMinuteOffset);

    }



	draw_set_color(c_gray);
	draw_text(CAMERA_WIDTH - 5, 7, "Day " + string(global.days) + " Time: " + string(global.hours) + ":" + _minuteString);

	draw_set_color(c_white);
	draw_text(CAMERA_WIDTH - 5, 5, "Day " + string(global.days) + " Time: " + string(global.hours) + ":" + _minuteString);


	//HP and SP bar text.
	//Drop shadows.
	draw_set_halign(fa_left);

	draw_set_color(c_gray);
	draw_text(5, 7, "HP: ");
	draw_text(5, 27, "SP: ");
	draw_text(5, 47, "$ " + string(global.money));

	draw_set_color(c_white);
	draw_text(5, 5, "HP: ");
	draw_text(5, 25, "SP: ");
	draw_text(5, 45, "$ " + string(global.money));
	draw_text(5, 65, "Skill: " + global.skills[skillIndex].skillName);


	///HP bar
	meter_draw(35, 8, 235, 24, c_black, c_red, c_white, c_gray, 2, global.hp, global.maxHP);

	///SP bar
	meter_draw(35, 28, 235, 44, c_black, c_blue,  c_white, c_gray, 2, global.sp, global.maxSP);


}


/// @description player_animate()
/// @function Changes the player's sprite in response to various conditions.
function player_animate() 
{
	//Makes sure the sprite is facing the right way.
	image_xscale = facing;

	//If the player is grounded sets the sprite to the standing or walking ones.
	if (grounded)
	{
	    if (state == playerStates.idle)
	    {
	        sprite_index = spriteIdle;
	    }
	    else
	    {
	        sprite_index = spriteRun;
	    }
    
	}
	//If the characer is in the air, sets the sprite to a jumping or flapping one.
	else 
	{
	    sprite_index = spriteJump;
	}

	//Attacks, dashing, and skills override other animations.
	if (state == playerStates.skill)
	{
		sprite_index = spriteFire;	
	}

	if (state == playerStates.melee)
	{
		if (instance_exists(obj_melee))
		{
			sprite_index = spriteMelee;	
			image_index = obj_melee.image_index;
		}
	}

	if (state == playerStates.dash)
	{
		sprite_index = spriteDash;	
	}
}


/// @description player_run()
/// @function Makes the player character run. Returns 0 if moved, 1 if not.
function player_movement() 
{
	// Left and right controls.

	//Gets controller input for horizontal direction.
	hdir = RIGHT_BUTTON - LEFT_BUTTON;


	//Sets the direction the player is facing. This will be used when animating the sprite.
	if (hdir != 0) && grounded
	{
	    facing = hdir;
	}

	//Modifies the hsp variable.
	if (abs(hsp + (hdir * accel)) < maxSpeed)
	{
	    hsp += hdir * accel;
	}

	return abs(hdir);

}



/// @function player_dash()
/// @description makes the player dash. Since oyu can't dash yet, just returns false for now.
function player_dash() 
{
	
	var _dash = 0;

	if (RIGHT_BUTTON_PRESSED)
	{
		if (rDashDelay <= 0)
		{
			rDashDelay = DASH_DELAY;	
		}
		else
		{
			_dash = hdir;
		}
	}

	if (LEFT_BUTTON_PRESSED)
	{
		if (lDashDelay <= 0)
		{
			lDashDelay = DASH_DELAY;	
		}
		else
		{
			_dash = hdir;
		}
	}

	if (_dash != 0)
	{
		hsp = _dash * DASH_SPEED;
		facing = _dash;
		dashDuration = DASH_TIME;
	}

	return abs(_dash);
}


/// @description player_run()
/// @function Makes the player character jump. Returns true if a jump was performed this step.
function player_jump() 
{
	//If the player character jumped this step.
	var _jumped = false;


	// Jumping controls.

	//If the player presses the jump button while grounded, they jump.
	if (A_BUTTON_PRESSED) && (grounded)
	{
	    vsp = min(-jumpHeight, vsp);
		_jumped = true;
	}
    
	//If the player is holding the jump button, this offsets gravity, increasing their jump power.
	vsp -= A_BUTTON * GRAVITY_OFFSET;

	return _jumped;
}

/// @function player_melee()
/// @description melee attack controls. Returns true if a hurtbox was created, false if not.
function player_melee() 
{
	if (B_BUTTON_RELEASED)
	{
		
		//Makes a melee hurtbox.
		var _melee = instance_create_layer(x, y, layer, obj_melee);
		var _imageSpeed = image_speed;
		var _imageXScale = image_xscale;
	
		//Copies playeer xscale and imageSpeed onto the generated hurtbox.
		with (_melee)
		{
			image_speed = _imageSpeed;
			image_xscale = _imageXScale
		}
	
		return true;
	}

	return false;
}

/// @function skill_struct(name, caster, cost)
/// @description Creates a struct for a given skill. Returns the created skill struct.
/// @param _name The name of the skill.
/// @param _caster The object used to cast the skill.
/// @param _cost the number of skill points each skill costs.
function skill_struct(_name, _caster, _cost)
{
	var skillStruct = 
	{
		skillName: _name,
		caster : _caster,
		cost : _cost
	};
	
	return skillStruct;
}

/// @function player_skill()
/// @description Attempts to use the currently selected skill if the player is pressing the skill button.
function player_skill() 
{
	var _skill = global.skills[skillIndex];

	if (X_BUTTON_PRESSED)
	{	
		//Cost of the skill being used.
		var _cost = _skill.cost;
	
		//Checks if the player has enough SP.
		if (_cost > global.sp)
		{
			return false;	
		}
	
		global.sp -= _cost;
	
		//Creates the projectile.
		instance_create_layer(x, y, layer, _skill.caster);
	
		return true;
	}

	return false;
}


/// @function player_timers()
/// @description decrements timers.
function player_timers() 
{
	//Regenerates player SP.
	if (spRegenTimer < (spRegen * game_get_speed(gamespeed_fps)))
	{
		spRegenTimer++;
	}
	else
	{
		if (global.sp < global.maxSP)
		{
			global.sp++;	
		}
		
		spRegenTimer = 0;
	}

	//timer for duration of a dash.
	if (dashDuration > 0)
	{
		dashDuration--;	
	}


	//To dash you double tap a button input. These timers measure the delay.
	if (lDashDelay > 0)
	{
		lDashDelay--;	
	}

	if (rDashDelay > 0)
	{
		rDashDelay--;	
	}


	//Invulnerability timer.
	if (flicker > 0)
	{
		flicker--;	
	}
	
	//Fade
	if (fade > 0)
	{
		fade -= 1/fadeTime;
	}
}
