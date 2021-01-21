/// @description creates spear, fires, inherits and destroys self.


var _spear = instance_create_depth(x, y, layer, obj_spear);
var _facing = PLAYER.facing;

with (_spear)
{
	image_xscale = _facing;
	hurtbox_create(global.attack * 2, 0, global.attack * 2, faction.player, true);
	phys_create(0, 0, 15 * _facing, 0, false);
}

event_inherited();