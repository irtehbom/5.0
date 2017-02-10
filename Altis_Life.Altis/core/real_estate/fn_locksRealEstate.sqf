/*
  Locks stuff up
*/

_estate = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_estatePosition = getPosATL _estate;
_storage = nearestObjects [_estatePosition, ["CargoNet_01_box_F"],20];

_estateLockCheck = _estate getVariable["estate_locked",true];

if(_estateLockCheck) then {
	_estate setVariable["estate_locked",false,true];
	{
	_x setVariable["estate_locked",false,true];

	} foreach _storage;
	titleText[localize "Storage Unlocked","PLAIN"];
	
} else {

	_estate setVariable["estate_locked",true,true];
	{
	_x setVariable["estate_locked",true,true];

	} foreach _storage;
	titleText["Storage Locked","PLAIN"];
};