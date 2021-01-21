/// @description Overwrites parent.
var _text = "If you hold C when you attack, you can activate Aggro Mode and damage people even if they aren't fighting you..";


npc_create(_text, "Falk", 5, 0.25, 2, true, faction.neutral, 1);

//todo: replace with pilot versions
pilot_create(spr_pilotIdle, spr_pilotDead, spr_pilotRun, spr_pilotFire);

