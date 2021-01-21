/// @description Inherits, reinitializes damage. Maybe do on create?
event_inherited();

//Consider initializing on caster.
hurtbox_create(global.attack, global.attack, 1, faction.player, true);