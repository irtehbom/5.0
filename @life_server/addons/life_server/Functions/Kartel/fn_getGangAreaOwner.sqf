// =========================================================================================================
//  Author: Rob
// =========================================================================================================

#include "\life_server\script_macros.hpp"

private ["_query","_queryResult"];

_captureZone = _this select 0;
_price =  _this select 1;

if (_captureZone == "arms_capture") then {

	_price = 5 / 100 * _price;
	
} else {

	_price = _price / 10;

};

_query = format ["SELECT id, bank FROM gangs WHERE %1='1'",_captureZone];
_queryResult = [_query,2] call DB_fnc_asyncCall;


_gangBank = _queryResult select 1;

_newBank = _gangBank + _price;

_query = format ["UPDATE gangs SET bank ='%1' WHERE id='%2'",round _newBank,_queryResult select 0];
[_query,2] call DB_fnc_asyncCall;




