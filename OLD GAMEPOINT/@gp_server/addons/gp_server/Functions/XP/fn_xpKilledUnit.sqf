private["_unit", "_killer", "_xp"];

_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_killer = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;

if (!(isPlayer _killer)) exitWith { };

_xp = [];

if (_unit isKindOf "Man") then {
	_xp = [_unit] call life_fnc_xpCalculateKillXPGain;
} else {

	_serverID = owner (missionNamespace getVariable ["bis_functions_mainscope", ObjNull]);
	_unit setOwner _serverID;
	
	_xp = [_unit] call life_fnc_xpCalculateDestroyXPGain;
};



[_xp, _killer] call life_fnc_xpHandleXPGain;