/// @description creates laser, fires, inherits and destroys self.


var _laser = instance_create_depth(x, y, layer, obj_laser);
var _facing = PLAYER.facing;

with (_laser)
{
	image_xscale = _facing;
	hurtbox_create(global.attack, 0, global.attack, faction.player, true);
	phys_create(0, 0, 10 * _facing, 0, false);
}

event_inherited();