/// @description Overrides parent, initializes own options.
var _array;
_array[0] = "< Character Select >";

menu_create(_array);


//Also includes a room transition.
transition_create(room_startingCutscene, 1040, 1200);

//Sprite set currently being selected.
spritesetIndex = 0;