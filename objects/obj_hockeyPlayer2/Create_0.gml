/// @description Overwrites parent.
var _text = "If you're near an object and an '!' appears over your head, you can press 'C' to interact with it!";


npc_create(_text, "Regina", 5, 0.25, 0.25, true, faction.neutral, 1);

hockeyPlayer_create(spr_hockeyIdleR, spr_hockeyDamageR, spr_hockeyRunR, spr_hockeyAttackR);

