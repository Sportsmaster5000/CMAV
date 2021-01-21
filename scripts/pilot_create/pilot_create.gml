/// @function pilot_create(idleSprite, damageSprite, runSprite, attackSprite);
/// @description Initializes a pilot NPC.
/// @param {sprite} idleSprite idle sprite.
/// @param {sprite} damageSprite damage sprite.
/// @param {sprite} runSprite run sprite.
/// @param {sprite} attackSprite attack sprite.
function pilot_create(argument0, argument1, argument2, argument3) {

	spriteIdle = argument0;
	spriteDamage = argument1;
	spriteRun = argument2;
	spriteAttack = argument3;

	//What action this npc is currently performing.
	state = pilotStates.idle; 

	//How fast the hockeyplayer accelerates and how fast they can get.
	accel =4;
	maxSpeed = 16;

	//Timers
	passiveTime = game_get_speed(gamespeed_fps) * 2;
	passiveTimer = 0;

	attackTime = game_get_speed(gamespeed_fps) * 2;
	attackTimer = 0;

	image_speed = 0.5


}
