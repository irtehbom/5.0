
_group = [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;

_query = format["UPDATE build SET damage = 0 where gangId = %1", _group getVariable["gangId", -1]];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;