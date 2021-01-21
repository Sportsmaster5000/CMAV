/// @description Adds event flags before speaking.

/// @description Changes dialogue text.



var _array;
_array[0] = "In your college life, you will meet a variety of different people.  Some are friendly and kind while others are mean, rude,  and aggressive. This is the part where I teach you about combat. It's a dog-eat-dog world out there sometimes, and more often than not you are going to end up running into some less than reputable individuals. ";
_array[1] = "Now, fighting shouldn't be your first option, but if it comes down to it you're gonna want to defend yourself! You can use the 'Z' button to attack and the 'X' button to use a skill.";
_array[2] = "What's a skill you ask? Skills are unique ranged attacks that you can earn by attending classes. Skills have a limit to their use, which is measured by the SP bar at the top of the screen. Your HP is up there too. Don't run out of HP, or you'll be forced to sleep off your injuries.";

global.tutorialFinished = true;
dialogue_enter(_array, spr_portraitMicheal)