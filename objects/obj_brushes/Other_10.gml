/// @description Raises maxHP and heals user when interacted with.
var _text = "Brushes Rescued!"

myBalloon = instance_create_layer(PLAYER.x, PLAYER.y - sprite_height, PLAYER.layer, obj_rainbowMessage);
with (myBalloon)
{
	message_create(_text, game_get_speed(gamespeed_fps) * TEXT_SPEED);
}

global.storySophieBrushesSaved = true;

instance_destroy();