private["_xp", "_vehicle", "_result"];
_vehicle = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

_xp = 200;

// Default xp numbers
if (_vehicle isKindOf "Tank") then {
	_xp = _xp + 150;
};
if (_vehicle isKindOf "Car_F") then {
	_xp = _xp + 75;
};
if (_vehicle isKindOf "Plane") then {
	_xp = _xp + 100;
};
if (_vehicle isKindOf "Helicopter") then {
	_xp = _xp + 100;
};

// Specific vehicles extras
switch (typeOf _vehicle) do {
	case "B_Plane_CAS_01_F":
	{
		_xp = _xp + 100;
	};
	
	case "B_Heli_Attack_01_F":
	{
		_xp = _xp + 100;
	};
	
	case "B_MBT_01_mlrs_F":
	{
		_xp = _xp + 100;
	};
	
	case "B_UAV_02_CAS_F":
	{
		_xp = _xp + 75;
	};
	
	case "O_MBT_02_arty_F":
	{
		_xp = _xp + 100;
	};
};

_result = [
	2,
	_xp
];

_result;
