private[];

_player = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

_group = group _player;
_gangId = _group getVariable["gangId", -1];
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

[[true, "build_Pole_F", 1], "life_fnc_handleInv", owner _player, false] spawn life_fnc_MP;

[[1, "All your gang objects have been removed and a plot pole has been added to your inventory."], "life_fnc_broadcast", owner _player, false] spawn life_fnc_MP;