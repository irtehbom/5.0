private[];
disableSerialization;

_plotpole = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_boundaryObjects = _plotpole getVariable["boundaryObjects", []];

if (life_action_inUse) exitWith {};
life_action_inUse = true;

// Count boundary objects.
if (count _boundaryObjects > 0) then {
	// Already in the world. Delete them.
	{
		deleteVehicle _x;
	} forEach _boundaryObjects;
	_plotpole setVariable["boundaryObjects", []];
} else {
	// Fail safe.
	{
		deleteVehicle _x;
	} forEach (nearestObjects[_plotpole, ["RoadCone_L_F"], life_build_plot_radius]);
	
	
	
	// Create the objects
	_center = getPos _plotpole;
	_objects = [];

	for "_i" from 0 to 360 step (270 / life_build_plot_radius) do {
		_location = [(_center select 0) + ((cos _i) * life_build_plot_radius), (_center select 1) + ((sin _i) * life_build_plot_radius), _center select 2];
		_object = "RoadCone_L_F" createVehicle _location;
		_object setPos _location;
		_objects set[count _objects, _object];
	};
	
	_plotpole setVariable["boundaryObjects", _objects];
};

life_action_inUse = false;