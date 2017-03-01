private["_level"];

_level = [_this, 0, 0, [0]] call BIS_fnc_param;

_return = [];

{
	if (_x select 0 == _level) exitWith { _return = _x; };
} forEach GP_Levels;

_return;