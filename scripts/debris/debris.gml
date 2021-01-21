/// @function debris_create(sprite, grav, hsp, vsp, rsp)
/// @description initializes debris, objects that rotate and obey physics and fall off screen.
/// @param sprite Sprite to be used and rotated.
/// @param grav How heavy the object is on spawn.
/// @param hsp horizontal speed to be spawned with.
/// @param vsp vertical speed to be spawned with.
/// @param rsp How fast the object will be rotated. Positive values spin it clockwise, negative counterclockwise.
function debris_create(argument0, argument1, argument2, argument3, argument4) 
{

	sprite_index = argument0;
	phys_create(argument1, 0, argument2, argument3, false);
	rsp = argument4;


}
