///Macros and enums
//player constants
#macro PLAYER_FLICKER (game_get_speed(gamespeed_fps) * 3)
#macro PLAYER_GRAV 1
#macro PLAYER_FRICT 1
#macro DASH_TIME (game_get_speed(gamespeed_fps) * 0.5)
#macro DASH_DELAY (game_get_speed(gamespeed_fps) / 4)
#macro DASH_SPEED 30 //How fast the player dashes.
#macro STEPS_IN_DAY (60 * 60 * 24)

	//numeric game values.
#macro NPC_FLICKER (game_get_speed(gamespeed_fps) * 2)
#macro NPC_WALL_RANGE 300
#macro CLOSE_RANGE 100
#macro MID_RANGE 200
#macro LONG_RANGE 400
#macro TEXT_SPEED 10 //How long messages stay on screen.
#macro TEXT_BALLOON_SPEED 3 //How long speech balloons stay on screen.
#macro TEXT_BALLOON_MAXW 300


	//static resource pointers
#macro GROUND abs_ground //parent object for block and oneway platforms.
#macro BLOCK obj_block //Wall objects.
#macro PLAYER obj_player //Pointer to player object. There should only be one on the map at once.
#macro STARTING_ROOM room_titleScreen //The main hub world of the game.
#macro DIALOGUE_ROOM room_dialogue //The room the user is sent to when they initiate dialogue.
#macro SKYBOX_LAYER layer_get_id("SKYBOX") //The layer the skybox is on.
#macro SKYBOX layer_sprite_get_id(layer_get_id("SKYBOX") , bg_skybox)
#macro SAVEFILE "save.dat"


//Parallax properties.
#macro PARALLAX_LAYER layer_get_id("PARALLAX") //The layer the skybox is on.
#macro PARALLAX_HEIGHT sprite_get_height(bg_parallax) //Height of the parallax sprite.
#macro PARALLAX layer_sprite_get_id(layer_get_id("PARALLAX"), bg_parallax) //The sprite resource on the parallax layer.


//Camera constants.
#macro CAMERA_H_OFFSET -400
#macro CAMERA_V_OFFSET -300
#macro CAMERA_WIDTH 800
#macro CAMERA_HEIGHT 600


	//views
#macro VIEW 0 //The index of the view that will be used in the game.

//Window stuff.
#macro WINDOW_HEIGHT 768 //Height of the window the game will use.
#macro WINDOW_WIDTH 1024 //Width of the game window.


	//Physics values.
#macro TERMINAL_VELOCITY 12 //The highest an object's vertical speed can be.
#macro GRAVITY_OFFSET (grav/2) //This value is added to the player's gravity while they're holding the jump button. This allows jump cancelling.

	//Controls.
//#macro START_BUTTON ((gamepad_button_check(0, gp_start)) || (keyboard_check(ord("M"))) || (keyboard_check(vk_escape)))
#macro START_BUTTON ((gamepad_button_check(0, gp_start)) || (keyboard_check(ord("M"))))// || (keyboard_check(vk_escape)))
#macro RIGHT_BUTTON (keyboard_check(vk_right) || gamepad_button_check(0, gp_padr) || keyboard_check(ord("D")))
#macro DOWN_BUTTON (keyboard_check(vk_down) || gamepad_button_check(0, gp_padd) || keyboard_check(ord("S")))
#macro LEFT_BUTTON (keyboard_check(vk_left) || gamepad_button_check(0, gp_padl) ||  keyboard_check(ord("A")))
#macro UP_BUTTON (keyboard_check(vk_up) || gamepad_button_check(0, gp_padu) keyboard_check(ord("W")))
#macro A_BUTTON (keyboard_check(vk_space) ||keyboard_check(ord("U")) ||  gamepad_button_check(0, gp_face1))
#macro B_BUTTON (keyboard_check(ord("Z")) || keyboard_check(ord("J")) ||  gamepad_button_check(0, gp_face2))
#macro X_BUTTON (keyboard_check(ord("X")) ||keyboard_check(ord("K")) ||  gamepad_button_check(0, gp_face3))
#macro Y_BUTTON (keyboard_check(ord("C")) || keyboard_check(ord("L")) || gamepad_button_check(0, gp_face4))
#macro CONTINUE_BUTTON keyboard_check(vk_enter)
#macro ANY_BUTTON keyboard_check(vk_anykey)
#macro FACE_BUTTON (A_BUTTON || B_BUTTON || X_BUTTON || Y_BUTTON) 

#macro RIGHT_BUTTON_PRESSED (keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || keyboard_check_pressed(ord("D")))
#macro DOWN_BUTTON_PRESSED (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd) || keyboard_check_pressed(ord("S")))
#macro LEFT_BUTTON_PRESSED (keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || keyboard_check_pressed(ord("A")))
#macro UP_BUTTON_PRESSED (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu) || keyboard_check_pressed(ord("W")))
#macro A_BUTTON_PRESSED (keyboard_check_pressed(vk_space)  || keyboard_check_pressed(ord("U")) ||  gamepad_button_check_pressed(0, gp_face1))
#macro B_BUTTON_PRESSED (keyboard_check_pressed(ord("Z"))  || keyboard_check_pressed(ord("J")) || gamepad_button_check_pressed(0, gp_face2))
#macro X_BUTTON_PRESSED (keyboard_check_pressed(ord("X"))  || keyboard_check_pressed(ord("K")) ||  gamepad_button_check_pressed(0, gp_face3))
#macro Y_BUTTON_PRESSED (keyboard_check_pressed(ord("C"))  || keyboard_check_pressed(ord("L")) || gamepad_button_check_pressed(0, gp_face4))
#macro ANY_BUTTON_PRESSED keyboard_check_pressed(vk_anykey)
#macro CONTINUE_BUTTON_PRESSED keyboard_check_pressed(vk_enter)

//#macro START_BUTTON_RELEASED ((gamepad_button_check_released(0, gp_start)) || (keyboard_check_released(ord("M"))) || (keyboard_check(vk_escape)))
#macro START_BUTTON_RELEASED ((gamepad_button_check_released(0, gp_start)) || (keyboard_check_released(ord("M"))))// (keyboard_check(vk_escape)))
#macro RIGHT_BUTTON_RELEASED (keyboard_check_released(vk_right) || gamepad_button_check_released(0, gp_padr) || keyboard_check_released(ord("D")))
#macro DOWN_BUTTON_RELEASED (keyboard_check_released(vk_down) || gamepad_button_check_released(0, gp_padd) || keyboard_check_released(ord("S")))
#macro LEFT_BUTTON_RELEASED (keyboard_check_released(vk_left) || gamepad_button_check_released(0, gp_padl) || keyboard_check_released(ord("A")))
#macro UP_BUTTON_RELEASED (keyboard_check_released(vk_up) || gamepad_button_check_released(0, gp_padu) || keyboard_check_released(ord("W")))
#macro A_BUTTON_RELEASED (keyboard_check_released(vk_space) ||keyboard_check_released(ord("U")) ||   gamepad_button_check_released(0, gp_face1))
#macro B_BUTTON_RELEASED (keyboard_check_released(ord("Z")) || keyboard_check_released(ord("J")) ||  gamepad_button_check_released(0, gp_face2))
#macro X_BUTTON_RELEASED (keyboard_check_released(ord("X")) ||keyboard_check_released(ord("K")) ||   gamepad_button_check_released(0, gp_face3))
#macro Y_BUTTON_RELEASED (keyboard_check_released(ord("C")) || keyboard_check_released(ord("L")) ||  gamepad_button_check_released(0, gp_face4))
#macro CONTINUE_BUTTON_RELEASED keyboard_check_released(vk_enter)
#macro ANY_BUTTON_RELEASED keyboard_check_released(vk_anykey)
#macro HIDDEN_MENU_BUTTON_RELEASED keyboard_check_released(ord("H"))
#macro FACE_BUTTON_RELEASED (A_BUTTON_RELEASED || B_BUTTON_RELEASED || X_BUTTON_RELEASED || Y_BUTTON_RELEASED) 


///	enums
//Game states.
//The current state the game is in. Used on boards where the player character can move around.
enum gameStates
{
	play, //Lets the player character, NPCs, and projectiles move around normally.
	dialogue //pauses player and NPC dialogue.
}


//alignment
enum faction
{
	player, neutral, enemy	
}


///states for objects.

//player states. What the player character is being instructed to do by the user.
enum playerStates
{
	idle,	//The player is not being given orders
	run,	//The player is being ordered to move horizontally. 
	melee,	//The player is performing a melee attack
	skill,	//The player is firing a skill.
	dash	//The player is using their dash.
}

//Hockey player.
enum hockeyPlayerStates
{
	idle, melee, run	
}

//Hockey player.
enum pilotStates
{
	idle, shoot, run	
}

enum grades
{
	A, B, C, D, F	
}
