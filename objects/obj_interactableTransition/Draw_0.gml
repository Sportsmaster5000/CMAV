/// @description Inherits parent code. Also may draw an arrow if it has a graphic for it.
// Inherit the parent event
event_inherited();


if (distance_to_object(PLAYER) <MID_RANGE) && (typeof(name) != "string")
{
		//Draws the arrow.
		var _y = bbox_top - ((sprite_height * image_yscale)/2);
		var _x = x;
		
		//Draws the arrow.
		draw_sprite_ext(spr_moveIcon, 0, _x, _y, 0.5, 0.5, -90, c_white, 1);
		
		//Implementation for Dr. Lilly's special sprites.
		if (sprite_exists(name))
		{
			draw_sprite_ext(name, 0, _x, _y, 0.5, 0.5, 0, c_white, 1);
		}
}
