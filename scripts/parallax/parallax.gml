/// @function parallax_step()
/// @description Moves the parallax layer centered on the calling instance.
function parallax_step()
{
	//Moves the layer with the calling instance.
	if (layer_exists(PARALLAX_LAYER))
	{
		layer_y(PARALLAX_LAYER, (y * 0.95)- (PARALLAX_HEIGHT / 2));
		layer_x(PARALLAX_LAYER, x/4);
	}
}