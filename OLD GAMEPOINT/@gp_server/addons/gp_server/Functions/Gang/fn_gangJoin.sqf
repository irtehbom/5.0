private[];

_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_group = [_this, 1, grpNull, [grpNull]] call BIS_fnc_param;

_groupId = _group getVariable["gangId", -1];
_unit setVariable["gangRank", 0, true];

_query = format["UPDATE players SET gang = %2, gangRank = 0 WHERE playerid = '%1'", getPlayerUID _unit, _groupId];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;