private[];

_group = [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;

_gangId = _group getVariable["gangId", -1];

// Kick everyone
_query = format["UPDATE players SET gang = 0 WHERE gang = '%1'", _gangId];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;

// Notify all current gang members
[[_group], "life_fnc_gangDisbanded", units _group, false] call life_fnc_MP;



//
waitUntil {!DB_Async_Active};
_queryResult = [format["SELECT * FROM build where gangId = %1 AND objectType = 'Pole_F'", _gangId], 2, true] call DB_fnc_asyncCall;

if (count _queryResult == 0) exitWith {};

{
	_plotpole = _x;
	_pos = [_plotpole select 3] call DB_fnc_mresToArray;
	_dir = _pos select 0;
	_position = _pos select 1;
	
	{
		if (_x getVariable["objectID", -1] != -1) then {
			deleteVehicle _x;
		};
	} forEach nearestObjects[_position, ["Static", "Thing"], 55];
} forEach _queryResult;

_query = format["DELETE FROM build where gangId = %1", _gangId];
waitUntil {!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;
