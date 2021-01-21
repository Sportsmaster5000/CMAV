/// @function dialogue_enter(_array, _portrait)
/// @description enters the dialogue state.
/// @param _array the dialogue array.
/// @param _portrait the portrait that the dialogue screen will display.
function dialogue_enter(_array, _portrait)
{
	global.dialogueArray = _array;
	global.dialoguePortrait = _portrait;
	pause_enter(DIALOGUE_ROOM);
}


/// @function dialogue_menu_create(_array)
/// @description initializes dialogue menu variables.
/// @param _dialogueArray
function dialogue_menu_create(_dialogueArray, _portrait)
{
	dialogueArray = _dialogueArray;
	index = 0;
	text = dialogueArray[index];
	portrait = _portrait;
}

/// @function dialogue_check_line()
/// @description Checks the given line of dialogue. Perfoms actions based on that. Recurses for some items.
/// @param _item Whatever item in the dialogue array needs to be checked.
function dialogue_check_line()
{
	
	//At the end exits dialogue.
	if (index >= array_length(dialogueArray))
	{
		global.dialogueArray = noone;
		pause_exit();
		return;
	}
	
	switch (typeof(dialogueArray[index])) 
	{
	case "string":
	    text = dialogueArray[index]
	    break;
	case "number":
		index++;
		dialogue_check_line();
	    break;
	default:
		break;
	}
}

function dialogue_menu_draw_gui()
{
	//Draw textbox.
	draw_roundrect_color(0, (room_height * 0.75) - 5, room_width, room_height - 10, c_white, c_white, false);

	//Draw text.
	var _stringHeight = string_height(text);
	var _margin = 10;
	var _portraitWidth = sprite_get_width(portrait);
	var _portraitHeight = sprite_get_height(portrait);
	var _fulltext;
	
	if ((index + 1) == array_length(dialogueArray))
	{
		_fullText = text + " (" + string(index + 1) + "/" + string(array_length(dialogueArray)) + ")";
	}
	else
	{
		_fullText = text + "...(" + string(index + 1) + "/" + string(array_length(dialogueArray)) + ")";
	}
	draw_text_ext_color((_margin * 2) +  _portraitWidth, room_height * 0.75, _fullText, _stringHeight, room_width - (_margin * 4) - _portraitWidth, c_black, c_black, c_black, c_black, 1);

	//Draw portrait.
	draw_sprite(portrait, 10, _margin, (room_height * 0.75) + _margin);
}