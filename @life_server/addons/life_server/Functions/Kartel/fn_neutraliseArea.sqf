// =========================================================================================================
//  Author: Rob
// =========================================================================================================

#include "\life_server\script_macros.hpp"

private ["_query","_queryResult"];

_captureZone = _this select 0;
_gangName = _this select 1;

_query = format ["UPDATE gangs SET %1='0' WHERE name='%2'",_captureZone,_gangName];
[_query,2] call DB_fnc_asyncCall;





