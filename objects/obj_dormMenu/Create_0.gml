/// @description Overrides parent, initializes own options.
event_inherited(); 

var _array;
_array[0] = "Sleep 3h";
_array[1] = "Sleep 6h";
_array[2] = "Sleep 12h";
_array[3] = "Sleep 24h";
_array[4] = "Save";
_array[5] = "Load";
_array[6] = "Exit";



menu_create(_array);

//Also includes a room transition.
transition_create(room_overworld2, 1290, 2000);