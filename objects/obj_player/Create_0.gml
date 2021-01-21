/// @description initializes player character variables, camera variables.
player_create(global.playerSpawnX, global.playerSpawnY, global.playerIdleSprite, global.playerRunSprite, global.playerJumpSprite, global.playerMeleeSprite, global.playerFireSprite, global.playerDashSprite);

//If a camera instance hasn't been created, creates one.
if (!instance_exists(obj_camera))
{
	var _camera = instance_create_layer(x, y, layer, obj_camera);
	var _player = self;
	
	
	with (_camera)
	{
			view_camera[VIEW] = cam_create(_player, CAMERA_WIDTH, CAMERA_HEIGHT, 1/2, 2/3, -1, -1, 1,1, 0);
	}
}

//Starts fading in.
fade = 1;
fadeIn = true;
fadeTime = game_get_speed(gamespeed_fps);