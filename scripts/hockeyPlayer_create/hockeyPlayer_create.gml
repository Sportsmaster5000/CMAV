/// @function hockeyPlayer_create(idleSprite, damageSprite, runSprite, attackSprite);
/// @description Initializes a hockey player NPC.
/// @param {sprite} idleSprite idle sprite.
/// @param {sprite} damageSprite damage sprite.
/// @param {sprite} runSprite run sprite.
/// @param {sprite} attackSprite attack sprite.
function hockeyPlayer_create(argument0, argument1, argument2, argument3) {

	spriteIdle = argument0;
	spriteDamage = argument1;
	spriteRun = argument2;
	spriteAttack = argument3;

	//What action this npc is currently performing.
	state = hockeyPlayerStates.idle; 

	//How fast the hockeyplayer accelerates and how fast they can get.
	accel = 3;
	maxSpeed = 4;

	//Timers
	passiveTime = game_get_speed(gamespeed_fps) * 3;
	passiveTimer = 0;

	attackTime = game_get_speed(gamespeed_fps) * 2;
	attackTimer = 0;

	//Pointer to any melee hurtbox this instance has created.
	melee = noone;


}
