/// @description Raises attack when interacted with.
global.attack++;

var _text = "Attack Boosted!"

myBalloon = instance_create_layer(x, y - sprite_height, layer, obj_message);
with (myBalloon)
{
	message_create(_text, game_get_speed(gamespeed_fps) * 5);
}