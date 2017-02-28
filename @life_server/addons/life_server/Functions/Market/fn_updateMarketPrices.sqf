#include "\life_server\script_macros.hpp"
/*
	Author Rob
	Fetches the market and updates the prices per server restart
*/
private["_query","_queryResult"];

MarketPrices = [];

_query = format["SELECT * FROM market"];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

{
	_itemName = _x select 1;
	_minimum  = _x select 2;
	_maximum  = _x select 3;
	_current  = _x select 4;

	_newPrice = [_minimum,_maximum] call BIS_fnc_randomInt;

	_query = format ["UPDATE market SET currentPrice='%1' WHERE itemName='%2'",_newPrice, _itemName];
	waitUntil{!DB_Async_Active};
	[_query,2,true] call DB_fnc_asyncCall;
	
	MarketPrices pushBack [_itemName,_newPrice];

} foreach _queryResult;

publicVariable "MarketPrices";


