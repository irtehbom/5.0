// =========================================================================================================
//  Author: Rob
// =========================================================================================================

#include "\life_hc\hc_macros.hpp"

private ["_query","_queryResult"];

_captureZone = _this select 0;
_gangName = _this select 1;

_query = format ["SELECT id FROM gangs WHERE %1='1'",_captureZone];
_queryResult = [_query,2] call HC_fnc_asyncCall;

if (count _queryResult isEqualTo 0) then {
	_query = format ["UPDATE gangs SET %1='1' WHERE name='%2'",_captureZone,_gangName];
	[_query,2] call HC_fnc_asyncCall;
} else {

	_query = format ["UPDATE gangs SET %1='0' WHERE id='%2'",_captureZone,_queryResult select 0];
	[_query,2] call HC_fnc_asyncCall;
	
	_query = format ["UPDATE gangs SET %1='1' WHERE name='%2'",_captureZone,_gangName];
	[_query,2] call HC_fnc_asyncCall;
	
};





