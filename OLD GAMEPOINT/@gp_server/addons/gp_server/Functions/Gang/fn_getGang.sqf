private[];

_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_playerId = getPlayerUID _player;


_query = format["SELECT gang, gangRank FROM players WHERE playerid='%1'", _playerId];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log format["Gang Debug: %1",_queryResult];
if (isNil "_queryResult" || {count _queryResult == 0 || _queryResult select 0 == ""}) exitWith {
	[[], "life_fnc_gangInfoReceived", owner _player, false] spawn life_fnc_MP;
};

_gangId = _queryResult select 0;
_gangRank = _queryResult select 1;

// Find the gang in the DB.
_query = format["SELECT * FROM gang WHERE ID='%1'", _gangId];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (_queryResult select 1 == _playerId) then {
	_player setVariable["gangRank", 5, true];
} else {
	_player setVariable["gangRank", _gangRank, true];
};

_ownerId = owner _player;
[[_queryResult], "life_fnc_gangInfoReceived", _ownerId, false] spawn life_fnc_MP;