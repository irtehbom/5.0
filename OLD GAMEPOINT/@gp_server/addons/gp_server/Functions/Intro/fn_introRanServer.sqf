private[];
_playerUID = [_this, 0, "", [""]] call BIS_fnc_param;
_query = format["UPDATE players SET introran='1' WHERE playerid='%1'",_playerUID];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

