private[];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_newRank = [_this, 1, 0, [0]] call BIS_fnc_param;
_rankName = [_this, 2, "", [""]] call BIS_fnc_param;


_query = format["UPDATE players SET gangRank = %2 WHERE playerid = '%1'", getPlayerUID _unit, _newRank];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;

[[1, format["You've been ranked up to %1 in your gang!", _rankName]], "life_fnc_broadcast", owner _unit, false] call life_fnc_MP;