/// @function cam_create()
/// @description initializes variables for the camera object.
/// @param _target Target to be followed. This is used in the camera_step()
/// @param _width Width of the area to display.
/// @param _height Height of the area to display.
/// @param _hBorder Horizontal border. Should be between 0 and 1, so like 0.5 or 1/3.
/// @param _vBorder Vertical border.
/// @param _hSpeed Horizontal speed.
/// @param _vSpeed Vertical speed.
/// @param _zoom Base zoom.
/// @param _zoomTo Zoom to zoom towards.
/// @param _zoomSpeed Speed to zoom at.
function cam_create(_target, _width, _height, _hBorder, _vBorder, _hSpeed, _vSpeed, _zoom, _zoomTo, _zoomSpeed)
{
	target = _target;
	width = _width;
	height = _height;
	hBorder = _hBorder;
	vBorder = _vBorder;
	hSpeed = _hSpeed;
	vSpeed = _vSpeed;
	
	camera  = camera_create_view(x, y, width, height, 0, -1, -1, -1, hBorder, vBorder);
	
	//Initializes zoom as 1.
	cam_set_zoom(_zoom);
	
	//Initializes zoomTo and zoomSpeed.
	cam_set_zoomTo(_zoomTo, _zoomSpeed);
	
	return camera;
}


/// @function cam_step()
/// @description controls the camera  with each step as it follows the target.
function cam_step() 
{
	//Exits if there is no target.
	if (!instance_exists(target))
	{
		return;	
	}

	//Camera zooming code.
	//Zooms camera in the given direction.
	if (zoomTo != zoom)
	{
		//The direction that will be zoomed towards.
		_zDir = sign (zoom - zoomTo);
		
		//If the camera needs to zoom in...
		if (-1 == _zDir)
		{
			if ((zoom + zoomSpeed) < zoomTo)
			{
				zoom += zoomSpeed;
				cam_zoom(zoom);
				show_debug_message("Zooming iiiiiiiiin");
			}
		}
		//If the camera needs to zoom out...
		else
		{
			
			if ((zoom - zoomSpeed) > zoomTo)
			{
				zoom -= zoomSpeed;
				cam_zoom(zoom);
				show_debug_message("Zooming oooooout");
			}
		}
		
	}
	
	
	//Makes view follow target.
	// -1 speed just makes the camera snap towards the target.
	if (hSpeed == -1)
	{
		x = target.x;
	}
	else
	{
		var _hDist = target.x - x;
		var _hDir = sign (target.x - x);
		var _hsp = hSpeed * _hDir;
		
		if (abs(_hDist) > hSpeed)
		{
			x += _hsp;
		}
	}
	
	if (vSpeed == -1)
	{
		y = target.y;
	}
	else
	{
		var _vDist = target.y - y;
		var _vDir = sign (target.y - y);
		var _vsp = vSpeed * _vDir;
		
		if (abs(_vDist) > vSpeed)
		{
			y += _vsp;
		}
	}
	
	camera_set_view_pos(camera, x - (width * hBorder), y - (height * vBorder));
	
	
}

/// @function cam_set_zoom(_zoom)
/// @description Sets zoom variables directly.
function cam_set_zoom(_zoom)
{
	zoom = _zoom;
	width = zoom * width;
	height = zoom * height;
	
	camera_set_view_size(camera, width,  height);
	
	return zoom;
}

/// @function cam_zoom(_zoom)
/// @description Increments zoom.
function cam_zoom(_zoom)
{
	zoom = _zoom;
	width += zoom * zoomDir;
	height += zoom * zoomDir;
	
	camera_set_view_size(camera, width,  height);
	
	return zoom;
}


/// @function cam_set_zoomTo(_zoomTo, _zoomSpeed)
/// @description Sets the camera to start zooming in to the given magnification at the given speed.
/// @param _zoomTo the magnification the camera will zoom in towards.
/// @param _zoomSpeed The amount to add to zoom by every step.Should usually be a small value like 0.001 or 0.01.
function cam_set_zoomTo(_zoomTo, _zoomSpeed)
{
	zoomTo = _zoomTo;
	zoomSpeed = _zoomSpeed;
	zoomDir = sign(zoom - zoomTo);
}






















