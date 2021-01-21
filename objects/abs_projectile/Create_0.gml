/// @description Inherits, initializes physics variables.
event_inherited();

//Is not a physics object, but still uses physics code. Collision should usually be set to false.
phys_create(0, 0, 0, 0, false);