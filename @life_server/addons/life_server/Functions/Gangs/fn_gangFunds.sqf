// =========================================================================================================
//  Author: Rob
// =========================================================================================================

#include "\life_server\script_macros.hpp"


_gangName = _this select 0;
_query = format ["SELECT bank FROM gangs WHERE name='%1'",_gangName];
_queryResult = [_query,2] call DB_fnc_asyncCall;
_result = _queryResult select 0;
_result;