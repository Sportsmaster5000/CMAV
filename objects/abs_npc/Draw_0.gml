/// @description draws self, flickering if need be.
if (flicker % 2 == 0)
{
	draw_self();	
}

//If it's an enemy draws a tiny health bar.
if (alignment = faction.enemy)
{
	
	draw_set_color(c_red);
	draw_roundrect(bbox_left, bbox_bottom + 3, bbox_left + (bbox_right - bbox_left), bbox_bottom + 11, false)		

	draw_set_color(c_lime);
	draw_roundrect(bbox_left, bbox_bottom + 3, bbox_left + ((bbox_right - bbox_left) * hp/maxHP), bbox_bottom + 11, false)	
}

//Draws name above head.
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(x, y + sprite_get_height(sprite_index)/2, name);

//Draws interactable thigns too if the player can interact.
interactable_draw();