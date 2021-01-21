/// @description Doesn't draw self. Draws an arrow if player is near.

if (distance_to_object(PLAYER) <MID_RANGE)
{
		
		//Draws the arrow.
		var _y = PLAYER.y;
		var _x = x;
		var _facing = sign(x - (room_width/2) );
		
		draw_sprite_ext(spr_moveIcon, 0, _x, _y, _facing / 2, 0.5, 0, c_white, 1);
		
		if (typeof(name) != "string")
		{
			//Implementation for Dr. Lilly's special sprites.
			if (sprite_exists(name))
			{
				draw_sprite_ext(name, 0, _x, _y, 0.5, 0.5, 0, c_white, 1);
			}
		}
		
}