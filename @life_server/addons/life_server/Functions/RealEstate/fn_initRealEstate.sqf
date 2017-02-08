/*
Gets the real estate and sets the variables
*/

private[];
waitUntil{!DB_Async_Active};
_queryResult = ["SELECT id, pid, pos, rent, playername FROM realestate WHERE owned='1'",2,true] call DB_fnc_asyncCall;

waitUntil{!DB_Async_Active};
{
    _playerUID = _x select 1;
	_houseID = _x select 0;

    _pos = call compile format["%1",_x select 2];
	_realEstate = nearestObject [_pos, "Land_i_House_Big_01_V1_F"];
	_realEstate setVariable["estate_owned",[_x select 1,_x select 4],true];
	_realEstate setVariable["house_id",_houseID,true];
	_realEstate setVariable["rent",_x select 3,true];
	_realEstate setVariable["estate_locked",true,true];
	
	//_realEstate setVariable["locked",true,true]; //Lock up all the stuff.
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _realEstate) >> "numberOfDoors");
	
	for "_i" from 1 to _numOfDoors do {
		_realEstate setVariable[format["bis_disabled_Door_%1",_i],1,true];
		_realEstate setVariable[format["disable_boltcutter",_i],true,true];
	};
	
	_garage = nearestObjects [_pos, ["Land_i_Garage_V1_F"],20] select 0;
	_garage setVariable["garage_owned",[_x select 1,_x select 4],true];
	
	_heli = nearestObjects [_pos, ["Land_Laptop_unfolded_F"],20] select 0;
	_heli setVariable["heli_owned",[_x select 1,_x select 4],true];
	
	_computer = nearestObjects [_pos, ["Land_PCSet_01_screen_F"],20] select 0;
	_computer setVariable["computer_owned",[_x select 1,_x select 4],true];
	
	_storage = nearestObjects [_pos, ["CargoNet_01_box_F"],20];
	{
		_x setVariable["estate_storage",_playerUID,true];
		_x setVariable["estate_locked",true,true];
	} foreach _storage;
	
	_realEstate setVariable["containers",_storage,true];
    
	
} forEach _queryResult;


