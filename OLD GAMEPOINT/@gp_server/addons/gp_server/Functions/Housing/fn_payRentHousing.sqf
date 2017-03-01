/*
Pays the rent
*/

_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_getHouseID = _house getVariable["house_id", 0];

_query = format["UPDATE houses SET rent = 0 where id = %1",_getHouseID];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;