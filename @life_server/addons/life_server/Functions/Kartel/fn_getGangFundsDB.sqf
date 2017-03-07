// =========================================================================================================
//  Author: Rob
// =========================================================================================================

#include "\life_server\script_macros.hpp"

private ["_gangName","_query","_queryResult","_result"];

_gangName = _this select 0;
_player = _this select 1;

_query = format ["SELECT bank FROM gangs WHERE name='%1'",_gangName];
_queryResult = [_query,2] call DB_fnc_asyncCall;
_result = _queryResult select 0;

_player setVariable["gang_bank_db",_result,true];