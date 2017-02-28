#include "\life_server\script_macros.hpp"
/*
	Author Rob
	Saves the tuning data to the vehicles table
*/
private["_query","_queryResult"];

_vehicleID = _this select 0;

_query = format["SELECT tuning_data FROM vehicles WHERE id='%1'",_vehicleID];

waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

_queryResult;

