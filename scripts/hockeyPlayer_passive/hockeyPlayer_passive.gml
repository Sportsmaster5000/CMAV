/// @function hockeyPlayer_passive()
/// @description makes this NPC move around a little.
function hockeyPlayer_passive() {

	if (passiveTimer > 0)
	{
		passiveTimer--;	
	}

	//every 3 seconds decides to either wait for a bit or move around.
	if (passiveTimer <= 0)
	{
		facing = -facing;
		passiveTimer = passiveTime;
	
		state = choose(hockeyPlayerStates.idle, hockeyPlayerStates.run);
	}


}
