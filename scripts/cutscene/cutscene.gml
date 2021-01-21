/// @function cutscene_create(images, names, time)
/// @description creates a cutscene object.
/// @param images An arry of sprites to display.
/// @param names an array of location names that corresponds to the sprites array.
/// @param time The amount of frames each sprite is displayed before it starts to fade out.
function cutscene_create(argument0, argument1, argument2) {

	images[0] = noone;
	array_copy(images, 0, argument0, 0, array_length_1d(argument0));

	names[0] = noone;
	array_copy(names, 0, argument1, 0, array_length_1d(argument1));

	time = argument2;

	//Index of the image being shown.
	imageIndex = 0;

	length = array_length_1d(images)  - 1;

	//Timers.
	//The timer for displaying the image with no fade.
	timer = time;

	//Used when panning the camera.
	xCoord = 0;

}
