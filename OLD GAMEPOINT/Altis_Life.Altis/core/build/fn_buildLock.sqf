private[];

_object = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;


_locked = _object getVariable["bis_disabled_Door_1", 0];

if (_locked == 0) then {
	_object setVariable["bis_disabled_Door_1", 1, true];
	_object setVariable["bis_disabled_Door_2", 1, true];
} else {
	_object setVariable["bis_disabled_Door_1", 0, true];
	_object setVariable["bis_disabled_Door_2", 0, true];
};