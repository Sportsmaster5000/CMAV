/// @description Inherits, allows event selection.
event_inherited();



switch	(optionSelected)
{
	//Sets player's sprite set.
	case 0:
		if (LEFT_BUTTON_RELEASED) || (RIGHT_BUTTON_RELEASED)
		{
			spritesetIndex += (LEFT_BUTTON_RELEASED - RIGHT_BUTTON_RELEASED);
			
			if (spritesetIndex < 0)
			{
				spritesetIndex = array_length_1d(global.spriteSets) - 1;
			}
			
			if (spritesetIndex >= array_length_1d(global.spriteSets))
			{
				spritesetIndex = 0;
			}
			
			var _spriteSet = global.spriteSets[spritesetIndex];
			
			global.playerIdleSprite = _spriteSet[0];
			global.playerRunSprite = _spriteSet[1];
			global.playerMeleeSprite = _spriteSet[2];
			global.playerJumpSprite = _spriteSet[3];
			global.playerDashSprite = _spriteSet[4];
			global.playerFireSprite = _spriteSet[5];
			
		}
	break;
}
		if (CONTINUE_BUTTON_RELEASED)
		{
			transition_board(xTo, yTo, roomTo);
		}

	