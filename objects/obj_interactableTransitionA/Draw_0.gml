/// @description Inherits parent code. Also may draw an arrow if it has a graphic for it.
// Inherit the parent event


if (distance_to_object(PLAYER) <MID_RANGE) && (typeof(name) != "string")
{
		//Draws the arrow.
		var _y = y;
		var _x = bbox_right  + sprite_get_width(spr_moveIcon) / 5;
		
		//Draws the arrow.
		draw_sprite_ext(spr_moveIcon, 0, _x, _y,-0.5, 0.5, 0, c_white, 1);
		
		//Implementation for Dr. Lilly's special sprites.
		if (sprite_exists(name))
		{
			draw_sprite_ext(name, 0, _x, _y, 0.5, 0.5, 0, c_white, 1);
		}
}
