/// @function message_create(text, time)
/// @description initializes variables for a message object.
/// @param text The text the message will display.
/// @param time The number of frames this object will fade over. Once this is up, the instance will be destroyed.
function message_create(argument0, argument1) 
{

	text = argument0;
	maxTime = argument1;
	time = maxTime;
}
