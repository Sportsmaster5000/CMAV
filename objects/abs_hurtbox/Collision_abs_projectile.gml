/// @description destroys the projectile.
var _projectile = other;

//If the projectile has an alignment other than that of this hurtbox, destroys it.
//TODO: Mayb put in the projectile object?
if (_projectile.alignment != alignment)
{
	with (_projectile)
	{
		instance_destroy();
	}
	
	//Creates a debris object.
	/*
	var _debris = instance_create_layer(_projectile.x, _projectile.y, layer, obj_debris);
	
	var _sprite = _projectile.sprite_index;
	
	with (_debris)
	{
		debris_create(_sprite, 0.25, hsp * 4, -5, hsp * 5);
	}
	*/
}