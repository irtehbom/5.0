#include <macro.h>
/*
File: fn_unimpound.sqf
Author: Bryan "Tonic" Boardwine

Description:
Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;

_houseSpawn = false;
if (typeName life_garage_sp != "STRING") then {
	_houseSpawn = true;
};

_sp = [];
if (_houseSpawn) then {
	_sp = life_garage_sp;
} else {
	_sp = getMarkerPos life_garage_sp;
};
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "The selection had a error..."};

_price = [_vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
if(ftp_atmcash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};


//_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
_nearVehicles = [];
if (_houseSpawn) then {
	_nearVehicles = nearestObjects[_sp select 0,["Car","Air","Ship"],10];
} else {
	_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
};


if(count _nearVehicles > 0) exitWith{[[1,(localize "STR_Garage_SpawnPointError")],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;};

if(typeName life_garage_sp == "ARRAY") then {
[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
[[_vid,_pid,life_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
};
};

hint localize "STR_Garage_SpawningVeh";

ftp_atmcash = ftp_atmcash - _price;