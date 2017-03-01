
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_group = [_this, 1, grpNull, [grpNull]] call BIS_fnc_param;
_unitId = getPlayerUID _unit;


_query = format["UPDATE players SET gang = 0 WHERE playerid = '%1'", _unitId];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;

[[_group], "life_fnc_gangKicked", owner _unit, false] call life_fnc_MP; // Now send to the specific client that he got kicked.