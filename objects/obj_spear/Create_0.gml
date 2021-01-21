/// @description Inherits, reinitializes damage. Maybe do on create?
event_inherited();

phys_create(0.2, 0, 0, 0, false);

//Consider initializing on caster.
hurtbox_create(global.attack, global.attack, 1, faction.player, true);