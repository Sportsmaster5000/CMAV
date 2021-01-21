/// @function npc_create(text, name, hp, grav, frict, collision, alignment, image speed)
/// @description initializes npc variables, including physics things.
/// @param _text the initial message that NPCs will put in their speech balloon.
/// @param _name the name of the npc
/// @param _hp the HP the npc has.
/// @param _grav the weight of the npc.
/// @param _frict how much friction the npc experiences.
/// @param _collision whether to check for collision with this NPC.
/// @param _alignment the faction the npc is associated with. Controls what hurtboxes hurt it.
/// @param _imageSpeed the speed at which the npc is initially animated.
function npc_create(_text, _name, _hp, _grav, _frict, _collision, _alignment, _imageSpeed) 
{

	//A string. Put in speech ballons.
	text = _text;

	//The NPC's name.
	name = _name;

	//the npc's starting HP
	maxHP = _hp;
	hp = maxHP;

	//Initializes physics things.
	phys_create(_grav, _frict, _collision, _alignment, _collision);

	//Alignment
	alignment = _alignment;

	//Initially, image speed for NPCs is 0. They animate while they are talking.
	image_speed = _imageSpeed;

	//Flicker
	flicker = 0;

	//The direction the NPC is facing in. -1 is left, 1 is right.
	hdir = 1;
	facing = hdir;

	//The target for the NPC's attacks.
	target = noone;	


	//This will contain a reference to any dialogue balloon the NPC creates.
	//If it equals noone the NPC has no created dialogue balloons.
	myBalloon = noone;

	//NPCs can sometimes teleport offscreen. If either of these are anything other than noone they will be teleported to that location.
	teleportX = noone;
	teleportY = noone;
}

/// @function npc_speak(_text)
/// @description generates a speech balloon for the npc.
/// @param _text The text to be put in the balloon.
function npc_speak(_text)
{
	//Destroys all speech balloons in the room.
	while (instance_exists(obj_speechBalloon))
	{
		with (obj_speechBalloon)
		{
			instance_destroy();
		}
	}

	//Creates speech balloon object.
	var _name = name;
	var _balloonHeight = string_height_ext(_text, string_height(_text), TEXT_BALLOON_MAXW);
	var _balloon = instance_create_layer(x, y - (sprite_height/2) - _balloonHeight, layer, obj_speechBalloon);
	with (_balloon)
	{
		speechBalloon_create(_text, string_length(_text) * TEXT_BALLOON_SPEED, other, _name);
	}
	
	return _balloon;
}

/// @function speechBalloon_create(text, time, owner, name)
/// @description Creates a specch balloon object.
/// @param _text The text that will be displayed.
/// @param _time The amount of time for which the balloon will exist.
/// @param _owner The instance that created this object.
/// @param _name The name of the npc that created this balloon.
function speechBalloon_create(_text, _maxTime, _owner, _name) 
{

	text = _text;
	maxTime = _maxTime;
	time = maxTime;
	owner = _owner;
	name = _name;
}

/// @function npc_damage(damage, hKnockback, vKnockback)
/// @description makes the npc take damage, applies knockback, vknockback. Might kill them.
/// @param damage the amount of damage being dealt. 
/// @param hKnockback how far the object is knocked back horizontally.
/// @param vKnockback how far the object is knocked vertically.
function npc_damage(argument0, argument1, argument2) {

	var _damage = argument0;
	var _hKnockback = argument1;
	var _vKnockback = argument2;

	//Applies damage.
	hp -= _damage;

	flicker = NPC_FLICKER;

	//applies physics.
	hsp += _hKnockback;
	vsp += _vKnockback;

	//Checks if the npc dies.
	if (hp <= 0)
	{
		//If the NPC dies, destroys the object and creates a debris object with some of the same values.
		instance_destroy();
	
		var _debris = instance_create_layer(x, y, layer, obj_debris);
		var _spriteIndex = sprite_index;
		var _grav = grav;
		var _hsp = hsp;
		var _vsp = vsp;
	
		with (_debris)
		{
			debris_create(_spriteIndex, _grav, _hsp, _vsp * 2, _damage * 9);
		}
	}


}

/// @function npc_step()
/// @description spawns dialogue balloons with the given text in them.
function npc_step() 
{
	/*
	if (instance_exists(PLAYER)) && (distance_to_object(PLAYER) < CLOSE_RANGE)
	{	
		if !instance_exists(myBalloon)
		{			
			//Turns to face player.
			var _direction = sign(PLAYER.x - x);
		
			if (_direction != 0)
			{
				facing = _direction;
			}
		
			//Calls event 0, spawning a dialogue balloon.
			event_user(0);
		}
	}
	*/
}

/// @function npc_animate()
/// @description adjusts NPC sprites.
function npc_animate() 
{


	//Increments flicker.

	if (flicker > 0)
	{
		flicker--;	
	}

	//Adjust sprite to face in direction facing.
	image_xscale = facing;
}

/// @function story_wall_make(_wall)
/// @description Makes walls on either side of the NPC, locking the player into the dialogue.
/// @param _wall The wall object to be created.
function story_wall_make(_wall)
{
	instance_create_layer(x + NPC_WALL_RANGE, y, layer, _wall);
	instance_create_layer(x - NPC_WALL_RANGE, y, layer, _wall);
}

/// @function story_wall_destroy(_wall)
/// @description The wall object to destroy every instance of.
/// @param _wall The wall object to be destroyed.
function story_wall_destroy(_wall)
{
		while (instance_exists(_wall))
		{
			instance_destroy(_wall, true);
		}
}