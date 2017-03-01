/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then {
	_house = lineIntersectsWith [getPosASL player, ATLtoASL screenToWorld[0.5,0.5]];
	
	switch(true) do {
		case (count _house == 0): {_exit = true;};
		case (count _house == 1): {_house = _house select 0;};
		default {
			{if(_x isKindOf "House_F") exitWith {_house = _x;};} foreach _house;
		};
	};
	if(!isNil "_exit" OR !(_house isKindOf "House_F")) exitWith {systemChat localize "STR_House_ContainerError"};
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
} else {
	if ((typeOf _container) in life_build_storage_crates) then {
		[[_container], "life_fnc_buildSaveInventory", false, false] spawn life_fnc_MP;
	};
	
	if ((typeOf _container) in real_estate_storage) then {
        _estate = nearestObject [player, "Land_i_House_Big_01_V1_F"];
		[[_estate], "TON_fnc_saveInventoryRealEstate", false, false] spawn life_fnc_MP;
	};
};

