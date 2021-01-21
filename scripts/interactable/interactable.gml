/// @function interactable_step(_range)
/// @description  Checks if the player object is colliding with this object. If so, checks if the Y button has been released.
/// @param _range How close the player object needs to be.
function interactable_step(_range)
{
	//Exits if no player object.
	if !(instance_exists(PLAYER))
	{
		return;
	}

	var _distance = point_distance(x, y, PLAYER.x, PLAYER.y);

	if (_distance < _range)
	{
		active = true;	
	}
	else
	{
		active = false;	
	}

	if (Y_BUTTON_RELEASED) && active
	{
		//Calls user event 0.
		event_user(0);
	}

}

// @function interactable_draw()
// @description if active, draws an interact icon over the player's head.
function interactable_draw()
{
	if (active)
	{
		//Gets height of the player. This will be how many pixels above the playr that the icon is drawn.
		var _margin = sprite_get_height(PLAYER.sprite_index);

		draw_sprite(spr_interactIcon, 0, PLAYER.x, PLAYER.y - _margin);
	}
}