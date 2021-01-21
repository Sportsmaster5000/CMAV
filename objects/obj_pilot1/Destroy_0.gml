/// @description drops brushes on death.
if (global.storySophie1) && !(global.storySophieBrushesSaved)
{
	instance_create_depth(x, y, depth, obj_brushes);
}