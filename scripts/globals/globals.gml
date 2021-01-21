/// @function globals();
/// @description Initializes global variables.
function globals()
{
	

	//The current state the game is in. Used on boards where the player character can move around.
	global.gameState = gameStates.play;
	
	
	//Dialogue things.
	//The dialogue array. Will be read in the dialogue room. Should be set by the NPC sending the player to the dialogue room.
	//noone will result in the player being sent back to the room they were in.
	global.dialogueArray[0] = noone;
	global.dialoguePortrait = noone;
	
	///Player stats.
	global.maxHP = 10;
	global.maxSP = 10;
	global.hp = global.maxHP;
	global.sp = global.maxSP;
	global.money = 0;
	global.attack = 1;
	global.defense = 0;

	//Social stats
	global.reputation = 0;
	global.education = 0;
	global.challenges = 0;
	global.social = 0;
	global.relationships = 0;


	global.maxReputation = 200;
	global.maxEducation = 200;
	global.maxChallenges = 200;
	global.maxSocial = 200;
	global.maxRelationships = 200;


	//Grades
	global.grades[0] = "F";
	global.grades[1] = "D";
	global.grades[2] = "C";
	global.grades[3] = "B";
	global.grades[4] = "A";

	global.mathGrade = 0;
	global.scienceGrade = 0;
	global.socialStudiesGrade = 0;
	global.gymGrade = 0;

	//Array of objects spawned when a skill is used.
	global.skills[0] = skill_struct("Laser", obj_laserCaster, 2);
	global.skills[1] = skill_struct("Spear", obj_spearCaster, 2);
	global.skills[2] = skill_struct("Ball", obj_ballCaster, 2);
	global.skills[3] = skill_struct("Pie", obj_pieCaster, 2);

	//Array of costs for skills.
	global.skillCosts[0] = 2;
	global.skillCosts[1] = 2;
	global.skillCosts[2] = 2;
	global.skillCosts[3] = 2;

	//Whether the player's attacks can hurt neutral npcs or not.
	global.aggro = true;

	//The last room the player was in. Used for the pause menu.
	global.lastRoom = room;

	//Where the player is spawned in the room.
	global.playerSpawnX = 4200;
	global.playerSpawnY = 2100;

	//Rooms to teleport to.
	global.rooms[0] = room_titleScreen;
	global.rooms[1] = room_overworld1;
	global.rooms[2] = room_overworld2;
	global.rooms[3] = room_overworld3;
	global.rooms[4] = room_overworld4;
	global.rooms[5] = room_miloBail;
	
	//Clock
	global.steps = 0;
	global.mins = 0;
	global.hours = 0;
	global.days = 1;
	global.daySteps = 0;

	//Player sprites.
	global.playerIdleSprite = spr_playerIdleF1;
	global.playerRunSprite = spr_playerRunF1;
	global.playerMeleeSprite = spr_playerMeleeF1;
	global.playerJumpSprite = spr_playerJumpF1;
	global.playerDashSprite = spr_playerDashF1;
	global.playerFireSprite = spr_playerFireF1;

	//Sprite sets.
	global.spriteSetPF1[0] = spr_playerIdleF1;
	global.spriteSetPF1[1] = spr_playerRunF1;
	global.spriteSetPF1[2] = spr_playerMeleeF1;
	global.spriteSetPF1[3] = spr_playerJumpF1;
	global.spriteSetPF1[4] = spr_playerDashF1;
	global.spriteSetPF1[5] = spr_playerFireF1;

	global.spriteSetPF2[0] = spr_playerIdleM1;
	global.spriteSetPF2[1] = spr_playerRunM1;
	global.spriteSetPF2[2] = spr_playerMeleeM1;
	global.spriteSetPF2[3] = spr_playerJumpM1;
	global.spriteSetPF2[4] = spr_playerDashM1;
	global.spriteSetPF2[5] = spr_playerFireM1;

	global.spriteSetPF3[0] = spr_playerIdleF2;
	global.spriteSetPF3[1] = spr_playerRunF2;
	global.spriteSetPF3[2] = spr_playerMeleeF2;
	global.spriteSetPF3[3] = spr_playerJumpF2;
	global.spriteSetPF3[4] = spr_playerDashF2;
	global.spriteSetPF3[5] = spr_playerFireF2;

	//Array with all the spritesets.
	global.spriteSets[0] = global.spriteSetPF1;
	global.spriteSets[1] = global.spriteSetPF2;
	//global.spriteSets[2] = global.spriteSetPF3;

	//Visiting a location on the overworld for the first time triggers a cutscene.
	global.overworld1Visited = false;
	global.overworld2Visited = false;
	global.overworld3Visited = false;

	//story flags
	//Tutorial
	global.tutorialFinished = false;
	global.tutorialSophie1 = false;
	global.tutorialSophie2 = false;
	global.tutorialSophie3 = false;
	global.tutorialDrJim1 = false;
	global.tutorialDrJim2 = false;
	global.tutorialDrJim3 = false
	global.tutorialDrJim4 = false;
	global.tutorialMichael1 = false;
	global.tutorialMichael2 = false;
	global.tutorialMichael3 = false;
	global.tutorialFalk = false;
	
	//Dr. Jim's skateboard quest.
	global.storyJoey1 = false;
	global.storySkateboardSaved = false;
	global.dashReceived = false;

	//Tutorial 2 + Sophie's paintbrush quest
	global.storySophie1 = false;
	global.storySophieFalkMet = false;
	global.storySophieCakesGot = false;
	global.storySophieCakesGiven = false;
	global.storySophieBrushesSaved = false;
	global.storySophiePartyInvited = false;


}