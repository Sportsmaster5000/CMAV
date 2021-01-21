/// @description initializes player character variables, camera variables.
player_create(x, y, global.playerIdleSprite, global.playerRunSprite, global.playerJumpSprite, global.playerMeleeSprite, global.playerFireSprite, global.playerDashSprite);

//Does not create a camera.

//Waits a few seconds before offering the player the choice to start in orientation or at overworld1.
timer = 0;
timerDuration = game_get_speed(gamespeed_fps) * 5;