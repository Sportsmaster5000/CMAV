/// @description Raises maxHP and heals user when interacted with.
global.maxHP++;

global.hp = global.maxHP;

var _text = "HP Boosted!"

myBalloon = instance_create_layer(x, y - sprite_height, layer, obj_message);
with (myBalloon)
{
	message_create(_text, game_get_speed(gamespeed_fps) * 5);
}