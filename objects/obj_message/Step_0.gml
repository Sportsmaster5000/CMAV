/// @description slowly floats upwards, increments timer.
y -= 0.5;

time--;

if (time < 0)
{
	instance_destroy();	
}