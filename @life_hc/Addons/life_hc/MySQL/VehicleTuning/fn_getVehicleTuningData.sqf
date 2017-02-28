#include "\life_hc\hc_macros.hpp"
/*
	Author Rob
	Saves the tuning data to the vehicles table
*/
private["_query","_queryResult"];

_vehicleID = _this select 0;

_query = format["SELECT tuning_data FROM vehicles WHERE id='%1'",_vehicleID];
_queryResult = [_query,2,true] call HC_fnc_asyncCall;

_queryResult;