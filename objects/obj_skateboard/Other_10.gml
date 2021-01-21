/// @description Raises maxHP and heals user when interacted with.
var _text = "Skateboard Rescued!"

myBalloon = instance_create_layer(x, y - sprite_height, layer, obj_rainbowMessage);
with (myBalloon)
{
	message_create(_text, game_get_speed(gamespeed_fps) * 5);
}

global.storySkateboardSaved = true;

instance_destroy();