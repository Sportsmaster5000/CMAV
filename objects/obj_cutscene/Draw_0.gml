/// @description  draws the current image, fades in and out.

//Get scale for the images.
var _xScale = room_width / sprite_get_width(images[imageIndex]);
var _yScale = room_height / sprite_get_height(images[imageIndex]);
var _zScale = ((timer / time) * 0.5) + 1;
//var _alpha = time / timer;


//Draw the current image.
//If on the last image pans it along. 
if (imageIndex == array_length(images) - 1)
{
	draw_sprite_ext(images[imageIndex], 0, xCoord--, 0, _xScale, _yScale, image_angle, image_blend, image_alpha);
}
//Otherwise just zooms in.
else
{
	draw_sprite_ext(images[imageIndex], 0, 0, 0, _xScale * _zScale, _yScale * _zScale, image_angle, image_blend, image_alpha);
}

//draws name
draw_set_halign(fa_left);
draw_text_color(5, /*room_height - */22, names[imageIndex], c_gray, c_gray, c_gray, c_gray, 1);
draw_text_color(5, /*room_height - */20, names[imageIndex], c_white, c_white, c_white, c_white, 1);