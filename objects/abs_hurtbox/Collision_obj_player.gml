/// @description Reduces player hp. if HP hits 0, game over.
var _boxDamage = damage;
var _hKnockback = hKnockback;
var _vKnockback = vKnockback;
var _boxAlignment = alignment;
var _hDir = sign(x - other.x);

with (other)
{
	//If the hurtbox is enemy aligned, damages the player.
	if (_boxAlignment == faction.enemy) && (flicker <= 0)
	{
		//Deals damage, may kill target.
		player_damage(_boxDamage, _hKnockback * _hDir, _vKnockback);
	}
}
