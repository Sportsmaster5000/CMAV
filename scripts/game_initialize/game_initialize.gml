/// @function game_initialize()
/// @desctription Initialize the game.
function game_initialize() {

	//Set pixels to interpolate.
	gpu_set_texfilter(true);

	//Set gamespeeed
	game_set_speed(30, gamespeed_fps);

	//Set font
	draw_set_font(font_med);

	//Set size of game window.
	window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);
	
	globals();


}
