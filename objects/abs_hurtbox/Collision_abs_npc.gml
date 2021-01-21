/// @description Deals damage to target if of different alignment.
var _boxDamage = damage;
var _hKnockback = hKnockback;
var _vKnockback = vKnockback;
var _boxAlignment = alignment;
var _hDir = sign(other.x - x);
var _destroy = false; //If the object is going to be destroyed at the end of this event.

with (other)
{
	//f the npc is an enemy and the hurtbox is from the player OR the npc is neutral and the hurtbox is from the player and the player is in aggro mode.
	if (((alignment == faction.enemy) && (_boxAlignment == faction.player)) 
	|| ((global.aggro) && (alignment == faction.neutral) && (_boxAlignment == faction.player)))
	&& (flicker <= 0)
	{
		//Deals damage, may kill target.
		npc_damage(_boxDamage, _hKnockback * _hDir, _vKnockback);
		
		//sets alignment to enemy.
		alignment = faction.enemy;
		
		_destroy = true;
	}
}

if (!pierce) && (_destroy)
{
	instance_destroy();	
}