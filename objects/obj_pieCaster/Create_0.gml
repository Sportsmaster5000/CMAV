/// @description creates spear, fires, inherits and destroys self.


var _pie = instance_create_depth(x, y, layer, obj_pie);
var _facing = PLAYER.facing;

with (_pie)
{
	image_xscale = _facing;
	hurtbox_create(global.attack, 0, global.attack * 2, faction.player, true);
	phys_create(0.05, 0, 15 * _facing, 0, false);
}

event_inherited();