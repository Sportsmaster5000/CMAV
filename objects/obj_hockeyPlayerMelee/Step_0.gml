/// @description syncs position, animation with creatpr.


if !(instance_exists(owner))
{
	instance_destroy();	
}
else
{
	x = owner.x;
	y = owner.y;
	image_xscale = owner.image_xscale;
}


