/// @function phys_create(gravity, friction, hsp, vsp, collision)
/// @description Initializes physics variables.
/// @param _grav How many pixels the object is pulled down by each step.
/// @param _frict How much horizontal speed is reduced each step while it is non-zero.
/// @param _hsp Horizontal speed.
/// @param _vsp vertical speed
/// @param _collision Whether the object stops when it collides with blocks.
function phys_create(_grav, _friction, _hsp, _vsp, _collision) 
{
	//How much the object's vsp increases each step when the player is not standing on the floor.
	grav = _grav;

	//How much the object's hsp decreases each step.
	frict = _friction;

	//Horizontal speed and vertical speed. Usually starts as 0.
	hsp = _hsp;
	vsp = _vsp;
	
	//Collision is by default on.
	collision = _collision;

	//These variables are ones for after hsp and vsp have any modifiers added to them.
	hspFinal = 0;
	vspFinal = 0;


	//The object is considered grounded if they are directly above a block.
	grounded = place_meeting(x, y + 1, GROUND);
}

/// @function phys_step()
/// @description Place in the step event to activate physics.
function phys_step() 
{

	//grav increases the object's downwards speed by raising vsp. Does not do so past the terminal velocity.
	//If grav is 0 just doesn't apply.
	if (grav != 0)
	{
		if (vsp < TERMINAL_VELOCITY)
		{
		    vsp += grav;
		    round(vsp);
		}
	}


	//Friction will reduce horizontal speed. This is reduced while in the air.
	//If friction is 0 does not apply.
	if (frict != 0)
	{
		if (grounded)
		{
		    hsp -= frict * sign(hsp);
		}
	
		//If hsp is lower than the friction value, it just sets hsp to 0.
		if (abs(hsp) < frict)
		{
		    hsp = 0;
		}
	}

	//Collision with walls. The object's position is changed after each collision function.
	if (collision)
	{
	    vsp = phys_floor_collision(vsp);
	    hsp = phys_wall_collision(hsp);
	}


	//Sets the final values.
	vspFinal = vsp;
	hspFinal = hsp;

	//Actually moves the object.
	y += vspFinal;
	x += hspFinal;

	//Checks if an object is on the ground.
	grounded = (place_meeting(x, y + 1, BLOCK)) || (bottom(bbox_bottom + 1, obj_oneWay));
}


/// @function phys_floor_collison(vsp)
/// @description Stops the player if they would touch a block vertically
/// @param vsp object's vertical speed.
function phys_floor_collision(_vsp) 
{
	//Checks every pixel in this object's path for collision.
	for (var _i = 0; (abs(_i) < abs(_vsp)) || (place_meeting(x, y + _i, BLOCK)); _i += sign(_vsp))
	{
	    //If there is a collision, it will move the player as close to the object as possible and then stop.
	    //This is the check for collision with blocks.
	    if (place_meeting(x, y + _i, BLOCK))
	    {
	        y += _i - sign(_vsp);
	        return 0;
	    }
    
	    //This is the collision for one-way platforms.
	    if (sign(_vsp) >= 0)
	    {	
	        if (bottom(bbox_bottom + (_i + 1), obj_oneWay))
	        {
	                y += _i;
	                return 0;
	        }
	    }
	}

	return _vsp;
}

/// @function phys_wall_collision(hsp)
/// @description If the object would end up inside the block object, it instead just moves them as close as possible. If they are above a given threshold for speed, they bounce off of it.
/// @param hsp object's horizontal speed.
function phys_wall_collision(argument0) 
{
	var _hsp = argument0;

	//Checks every pixel in the object's path for collision.
	for (var _i = 0; (abs(_i) < abs(_hsp)) || (place_meeting(x + _i, y, BLOCK)); _i += sign(_hsp))
	{
	    //If there is a collision, it will move the player as close to the object as possible and then stop. Bas a tiny upwards margin for now.4
	    if (place_meeting(x + _i, y, BLOCK))
	    {
	        x += _i - sign(_hsp);
	        return 0;
	    }
	}
	return _hsp;
}


/// @function bottom(y, object)
/// @description Checks for an object directly under the calling object (in a line from bbox left to bbox right). returns true if the calling object is there. Otherwise returns false.
function bottom(argument0, argument1) 
{

	//The y-coordinate we're checking for collision. Usually this will be bbox_bottom + 1
	var _ycoord = argument0;

	//The object we're checking for a collision with.
	var _object = argument1;

	//Checks every pixel directly under the object's bounding box.
	for (var i = bbox_left; i <= bbox_right; i++)
	{
	    if (instance_position(i, _ycoord, _object))
	    {
	        return true;
	    }
	}

	return false;



}
