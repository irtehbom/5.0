#include "\life_hc\hc_macros.hpp"
/*
	Author Rob
	Saves the tuning data to the vehicles table
*/
private["_query","_queryResult"];

_vehicleID = _this select 0;
_dataString = _this select 1;

_query = format["UPDATE vehicles SET tuning_data='%2' WHERE id='%1';",_vehicleID, _dataString];

[_query,2,true] call HC_fnc_asyncCall;

