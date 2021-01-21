/// @description draws self, flickering if need be. May draw afterimage.


//If dashing draws afterimage.
if (state == playerStates.dash)
{
	draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale, image_yscale, 0, c_white, 0.5);	
}

if (flicker % 2 == 0)
{
	draw_self();	
}