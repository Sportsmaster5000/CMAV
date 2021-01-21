///@description Physics, control, animation

//Physics
event_inherited();

//Exits if dialogue is activated.
if (global.gameState == gameStates.dialogue)
{
	//Sets sprite as the idle sprite.
	sprite_index = spriteIdle;
	exit;
}

//Lets player enter the pause menu.
if (START_BUTTON_RELEASED)
{
	pause_enter(room_pauseMenu);	
}

//Lets the player enter the debug menu.
if (HIDDEN_MENU_BUTTON_RELEASED)
{
	pause_enter(room_hiddenMenu);
}

//If the player is dashing, once their speed hits 0 they are no longer dashing.
if (state == playerStates.dash) 
{
	//If dash duration is ended, reverts state and slows hsp.
	if (dashDuration == 0)
	{
		//Brakes at the end of dash
		hsp /= 4;
		state = playerStates.idle;
	}
	else
	{
		hsp = hdir * DASH_SPEED;	
	}
}


//Being in melee, dashing or using a skill locks the player out of doing most actions.
if !((state == playerStates.melee)  || (state == playerStates.skill))
{
	
	if !(state == playerStates.dash)
	{
		//If the player is in no other state they are idle.
		state = playerStates.idle;
		
		//Makes the player run and move around.	
		if (player_movement())
		{
			state = playerStates.run;	
		}
		
		///Dash must first be unlocked.
		if (global.dashReceived)
		{
			if (player_dash())
			{
				state = playerStates.dash;	
			}
			
		}
	}
	
	//Lets the player select a skill. Move to its own script?
	skillIndex += DOWN_BUTTON_RELEASED - UP_BUTTON_RELEASED;
	
	if (skillIndex >= array_length_1d(global.skills))
	{
		skillIndex = 0;
	}
	
	if (skillIndex < 0)
	{
		skillIndex = array_length_1d(global.skills) - 1;
	}
	
	
	
	///These actions can cancel out of a dash.
	//Lets the player use their skills.
	if (player_skill())
	{
		//Using a skill while dashing 'brakes' the dash a bit.
		if (state == playerStates.dash)
		{
			hsp /= 4;	
		}
		
		state = playerStates.skill;
	}
	
	//Lets the player use their melee attack. You can even cancel out of a dash from it.
	if (player_melee())
	{
		//Using a skill while dashing 'brakes' the dash a bit.
		if (state == playerStates.dash)
		{
			hsp /= 4;	
		}
		
		state = playerStates.melee;	
	}
	
	
	//Lets the player jump. You can still jump while dashing.
	player_jump();
}


///Sets whether the player can hurt peaceful NPCs.
global.aggro = player_aggro();

///player animation
player_animate();

///player timers
player_timers();

//Yeah it has a timer but clock_step is it's own thing so we're calling it here.
clock_step();

parallax_step();