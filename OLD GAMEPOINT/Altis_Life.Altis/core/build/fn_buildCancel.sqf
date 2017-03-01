private[];
_range = [_this,0,false,[false]] call BIS_fnc_param;


if (!life_build_active) exitWith {};

_config = [typeOf life_build_active_object] call build_getObject;
_name = _config select 0;

_remove = life_build_active_object getVariable["removing", false];

if (!_remove) then {
	deleteVehicle life_build_active_object;
};

_moveDistance = 15;
if (count _config > 8) then {
	if (_config select 8) then {
		_moveDistance = 30;
	};
};

if (_range) then {
	if (_remove) then {
		hint format["Cancelled removing %1, you moved %2m away from your initial position.", _name, _moveDistance];
	} else {
		hint format["Cancelled building %1, you or the object moved %2m away from your/its initial position.", _name, _moveDistance];
	};
} else {
	if (_remove) then {
		hint format["Cancelled removing %1", _name];
	} else {
		hint format["Cancelled building %1", _name];
	};
};

[] call life_fnc_buildCleanup;