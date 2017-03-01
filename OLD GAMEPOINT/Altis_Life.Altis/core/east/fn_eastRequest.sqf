private["_unit", "_pos"];

_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_type = [_this, 1, "", [""]] call BIS_fnc_param;

// _unit could either be a vehicle or a player but either way it doesn't really matter.
_pos = position _unit;

// Attempt to determine what's wrong

_bail = false;
if (_unit isKindOf "Man") then {
	// Try to get nearby vehicle anyway.
	_foundVeh = nearestObject[_unit, "LandVehicle"];
	
	if (!(isNull _foundVeh)) then {
		_unit = _foundVeh;
	} else {
		_bail = true;
	};
};

if (_bail) exitWith { hint "No suitable vehicle found to call mechanic for."; };


if (_type == "") then {
	// Vehicle
	_damage = damage _unit;
	_fuel = fuel _unit;

	if (_damage > 0) then {
		_type = "Damage";
	} else {
		if (_fuel <= 0.1) then {
			_type = "Fuel";
		} else {
			_type = "Person";
		};
	};
};
_unit setVariable["HATORequested", true, true];

[[_unit, _type, player], "life_fnc_eastRequested", false, false] spawn life_fnc_MP;