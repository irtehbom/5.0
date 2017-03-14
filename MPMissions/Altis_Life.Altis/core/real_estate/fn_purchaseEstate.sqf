#include "..\..\script_macros.hpp"

/*

Purchase Estate

Buys the house

*/

_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


if(!(_house isKindOf "House_F")) exitWith {};
if(isNull _house) exitWith {};

_uid = getPlayerUID player;
_houseID = round(random 99999);

_real_estate_prices = [(typeOf _house)] call life_fnc_realEstatePrices;

_action = [
	format["This Real Estate is available for <t color='#8cff9b'>$%1</t>
	<br/><br/>
	<t color='#8cff9b'>Features</t><br/><br/>
	
	Vehicle Garage<br/>
	Air Garage<br/>
	Spawn Point<br/>
	3 Large Storage Containers<br/>
	15000 Virtual Inventory Space<br/>
	Online Bank<br/>
	Online Clothing Shop<br/>
	Online Markets<br/>
	Can not be raided by civilians or cops<br/>
	<br/><br/>",
	[(_real_estate_prices select 0)] call life_fnc_numberText,
	(_real_estate_prices select 1)], "Buy Estate?","Accept","Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(BANK < (_real_estate_prices select 0)) exitWith {hint format ["You don't have enough money to purchase this."]};
	
	hint "This estate now belongs to you. Press U to unlock the doors.
	Remember to pay rent, if rent is unpaid you'll lose your house!
	";
	
	_estatePosition = getPosATL _house;
	
	
	//Set up the house
	
	_house setVariable["estate_owned",[_uid,profileName],true];	
	_house setVariable["house_id",_houseID,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["rent",0,true];
	_house setVariable["estate_locked",true,true];
	
	_garage = nearestObjects [_estatePosition, ["Land_i_Garage_V1_F"],20] select 0;
	_garage setVariable["garage_owned",[_uid,profileName],true];
	_garage addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Garage",life_fnc_realEstateGarageMenu,"",0,false,false,"",'vehicle player == player && player distance _target < 5'];
	
	_heli = nearestObjects [_estatePosition, ["Land_Laptop_unfolded_F"],20] select 0;
	_heli setVariable["heli_owned",[_uid,profileName],true];
	_heli addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Air Garage",life_fnc_realEstateGarageMenu,"",0,false,false,"",'vehicle player == player && player distance _target < 5'];
	
	_computer = nearestObjects [_estatePosition, ["Land_PCSet_01_screen_F"],20] select 0;
	_computer setVariable["computer_owned",[_uid,profileName],true];
	
	_computer addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Online Rebel Market",life_fnc_virt_menu,"rebel"];
	_computer addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Online Market",life_fnc_virt_menu,"market"];
	_computer addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Online Clothing Shop",life_fnc_clothingMenu,"reb",0,false,false,"",'playerSide == east'];
	_computer addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Bank",life_fnc_atmMenu,"",0,false,false,"",'vehicle player == player && player distance _target < 5'];
	
	//Set the storage creates variable
	
	_storage = nearestObjects [player, ["CargoNet_01_box_F"],20];
	{
	_x setVariable["estate_storage",_uid,true];
	
	}
	foreach _storage;
	
	_house setVariable["containers",_storage,true];
	
	//Take the cash & add to main variable
	
	BANK = BANK - (_real_estate_prices select 0);
	[6] call SOCK_fnc_updatePartial;
	real_estate pushBack _house;
	real_estate_houses pushBack [str(getPosATL _house),[]];
	
	//Create the marker
	
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_marker setMarkerTextLocal "Real Estate";
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	
	//Lock the doors
	
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		_house setVariable[format["disable_boltcutter",_i],true,true];
	};
	if (life_HC_isActive) then {
		[_uid,_house,profileName] remoteExec ["HC_fnc_insertRealEstate",HC_Life];
	} else {
		[_uid,_house,profileName] remoteExec ["TON_fnc_insertRealEstate",RSERV];
	};
	
};