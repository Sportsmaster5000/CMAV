/// @description Overwrites parent. Parent object for other hockey players.
var _text = "Gotta practice for the big game!";

npc_create(_text, "Biff", 5, 0.25, 0.25, true, faction.neutral, 1);

hockeyPlayer_create(spr_hockeyIdleO, spr_hockeyDamageO, spr_hockeyRunO, spr_hockeyAttackO);

