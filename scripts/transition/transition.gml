/// @function transition_create(room, x, y)
/// @description initializes variables for a transition object.
/// @param _room The room the player will be moved to.
/// @param _x the x coordinate the play3er will be moved to.
/// @param _y the y coordinate the player will be moved to.
/// @param _name The string representation of the room that will be transferred too.
function transition_create(_roomTo, _xTo, _yTo, _name) 
{

	roomTo = _roomTo;
	xTo = _xTo;
	yTo = _yTo;
	name = _name;
}
 
 /// @function transition_board(x, y, room)
/// @description sends the player to a new board. Also positions the PLAYER object at x, y
/// @param _x The x coordinate the player object will be moved to.
/// @param _y the Y coordinate the player object will be moved to.
/// @param _room The room that will be moved to.
function transition_board(_x, _y, _room) 
{

	global.playerSpawnX = _x;
	global.playerSpawnY = _y;


	room_goto(_room)


}
