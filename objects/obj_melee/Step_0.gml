/// @description syncs position, animation with player.
x = PLAYER.x;
y = PLAYER.y;
image_xscale = PLAYER.image_xscale;


if (image_index == image_number - 1) || !(instance_exists(PLAYER))
{
	instance_destroy();	
}



