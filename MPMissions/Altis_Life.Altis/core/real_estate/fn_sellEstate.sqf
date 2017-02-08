#include "..\..\script_macros.hpp"
/*
Sells the realEstate
*/
private[];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if (!isNil {_house getVariable "house_sold"} && (_house getVariable "house_sold")) exitWith {};
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "estate_owned"}) exitWith {hint "There is no owner for this estate."};
closeDialog 0;


_real_estate_prices = [(typeOf _house)] call life_fnc_realEstatePrices;

_action = [
	format["This Real Estate can be sold for <t color='#8cff9b'>$%1</t>
	<br/>
	Do you want to sell the Estate?",
	[(_real_estate_prices select 0)] call life_fnc_numberText,
	(_real_estate_prices select 1)], "Sell Estate?","Accept","Cancel"
] call BIS_fnc_guiMessage;


if(_action) then {

	if (life_HC_isActive) then {
		[_house] remoteExec ["HC_fnc_sellEstate",HC_Life];
	} else {
		[_house] remoteExec ["TON_fnc_sellEstate",RSERV];
	};
	
	_house setVariable["locked",false,true];
	_house setVariable["Trunk",nil,true];
	_house setVariable["estate_owned",nil,true];
	_house setVariable["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable["uid",nil,true];
	
	_garage = nearestObjects [player, ["Land_i_Garage_V1_F"],20] select 0;
	_foundGaragePos = getPosATL _garage;
	_garage setVariable["garage_owned",nil,true];
	_garage removeAction 0;
	
	_heli = nearestObjects [player, ["Land_Laptop_unfolded_F"],20] select 0;
	_heliPos = getPosATL _heli;
	_heli setVariable["heli_owned",nil,true];
	_heli removeAction 0;

	BANK = BANK + (_real_estate_prices select 0);
	
	
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
};
