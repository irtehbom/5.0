/*
Pays the rent
*/

_estate = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_getEstateID = _estate getVariable["house_id", 0];

_query = format["UPDATE realestate SET rent = 0 where id = %1",_getEstateID];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;