/*
Sets up the house - deleted tonics system
*/



private[];
waitUntil{!DB_Async_Active};
_queryResult = ["SELECT id, pid, pos, rent, playername FROM houses WHERE owned='1'",2,true] call DB_fnc_asyncCall;

waitUntil{!DB_Async_Active};
{
        _pos = call compile format["%1",_x select 2];
		_house = nearestBuilding _pos;
		_house setVariable["rent",_x select 3,true];
		_house setVariable["house_owner",[_x select 1,_x select 4],true];
		_house setVariable["house_id",_x select 0,true];
		_house setVariable["locked",true,true]; //Lock up all the stuff.
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
    
	
} forEach _queryResult;