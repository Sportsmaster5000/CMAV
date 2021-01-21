/// @description Overrides parent for testing. Changes dialogue text.

//Sets the dialogue array.



if (!global.tutorialFinished)
{
	var _array;
	_array[0] = "Welcome to UNO! You're just in time for orientation!";
	_array[1] = "I'll give you a brief overview of what life will be like here at UNO. Now, your end goal should be to graduate, and in order to do that, you need to attend various classes. But classes ain't free kiddo. You'll need to earn some cash in order to pay for the class!";
	_array[2] = "What's that? You don't have a job? Well don't worry, there are plenty of people around campus who have their own problems and need some help, and I'm sure they'll float you a few bucks if you help them out!";
}
else
{
	var _array;
	_array[0] = "Jeez what's his problem? I should probably go talk to him. Anyways, that about covers it. You'll be living on campus this year, so I recommend heading over to the dorms to get situated. Just head west, they're located across the street from the Fine Arts Building! Good luck and have fun!";	
	_array[1] = "If a ! appears over your head, you can press C to interact with objects. You can use that to leave.";
}

dialogue_enter(_array, spr_portraitJim);