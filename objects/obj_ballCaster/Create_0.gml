/// @description creates spear, fires, inherits and destroys self.


var _ball = instance_create_depth(x, y, layer, obj_ball);
var _facing = PLAYER.facing;

with (_ball)
{
	image_xscale = _facing;
	hurtbox_create(global.attack * 2, 0, global.attack * 2, faction.player, true);
	phys_create(0.5, 0, 12  * _facing, -4, true);
}

event_inherited();