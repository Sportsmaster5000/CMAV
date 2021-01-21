/// @function meter_draw(x1, y1, x2, y2, bgcolor, fgcolor, outlineColor, shadowColor, shadowOffset, val, maxval)
/// @description draws a horizontal meter.
/// @param x1 the x coordinate the top left of the meter will be drawn at.
/// @param y1 the y coordinate the top left of the meter will be drawn at.
/// @param x2 the x coordinate of the bottom right of the meter.
/// @param y2 the y coordinate of the bottom right of the meter.
/// @param bgcolor the background color of the meter.
/// @param fgcolor the color of the actual meter (part that moves)
/// @param outlinecolor The color of the outline. -1 means no outline will be drawn.
/// @param shadowColor the color of the shadow. -1 means no shadow will be drawn.
/// @param shadowOffset How far beneath the meter the drop shadow is.
/// @param val The current value of the stat being represented.
/// @param maxVal the maximum value of the stat being represented.
function meter_draw(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

	//Input parameters
	var _x1 = argument0;
	var _y1 = argument1;
	var _x2 = argument2;
	var _y2 = argument3;
	var _bgColor = argument4;
	var _fgColor = argument5;
	var _outlineColor = argument6;
	var _shadowColor = argument7;
	var _shadowOffset = argument8;
	var _val = argument9;
	var _maxVal = argument10;

	var _width = _x2 - _x1;


	//Drop shadow
	if (_shadowColor != -1)
	{
		draw_roundrect_color(_x1, _y1 + _shadowOffset, _x2, _y2 + _shadowOffset, _shadowColor, _shadowColor, false);
	}

	//Background
	draw_roundrect_color(_x1, _y1, _x2, _y2, _bgColor, _bgColor, false);

	//Meter. Scales with hp / maxHP
	draw_roundrect_color(_x1,_y1, _x1 + (_width * (_val / _maxVal)), _y2, _fgColor, _fgColor, false);


	//Outline.
	if (_outlineColor != -1)
	{
		draw_roundrect_color(_x1, _y1, _x2, _y2, c_white, c_white, true);
	}


}
