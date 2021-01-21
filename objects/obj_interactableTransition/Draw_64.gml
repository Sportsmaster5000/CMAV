/// @description fades out if necessary

///Fades out if the player has collided with the transition.
if (fadeOut)
{
	draw_set_alpha(fade);
	draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1)
}