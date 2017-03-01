
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_playerId = getPlayerUID _player;

_query = format["UPDATE players SET gang = 0 WHERE playerid = '%1'", _playerId];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;