/// @description If the player is close enough to the transition collider, prints the location it will send them to. Also draws an arrow and fades in.

if (distance_to_object(PLAYER) <MID_RANGE)
{
		//Draws the text.
		var _width = view_wport[VIEW] / 2;
		var _height = view_hport[VIEW] * 7/8;

		draw_set_halign(fa_center);
		
		if (typeof(name) == "string")
		{
			draw_text_transformed_color(_width, 2 + _height, name, 2, 2, 0, c_gray, c_dkgray, c_gray, c_black, 1);
			draw_text_transformed_color(_width, _height, name, 2, 2, 0, c_white, c_white, c_white, c_white, 1);
		}
		
		draw_set_halign(fa_left);
}

///Fades out if the player has collided with the transition.
if (fadeOut)
{
	draw_set_alpha(fade);
	draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1)
}