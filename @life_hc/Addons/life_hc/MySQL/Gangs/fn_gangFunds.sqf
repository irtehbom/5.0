// =========================================================================================================
//  Author: Rob
// =========================================================================================================

#include "\life_hc\hc_macros.hpp"


_gangName = _this select 0;
_query = format ["SELECT bank FROM gangs WHERE name='%1'",_gangName];
_queryResult = [_query,2] call HC_fnc_asyncCall;
result = _queryResult select 0;
result;