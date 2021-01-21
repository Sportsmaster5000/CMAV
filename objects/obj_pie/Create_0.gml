//Overwrites parent physics.
phys_create(0.1, 0, 0, 0, true);

//Consider initializing on caster.
hurtbox_create(global.attack, global.attack, 1, faction.player, true);