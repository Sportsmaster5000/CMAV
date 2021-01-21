/// @description If you press a face button, goes to the next room.
if keyboard_check_released(vk_anykey)
{
	room_goto(roomTo);
}