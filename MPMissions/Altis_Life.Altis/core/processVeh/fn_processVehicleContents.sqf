#include "..\..\script_macros.hpp"
/*
Author: Rob:
*/
private["_newItemName","_oldItemName","_vendor","_type","_itemInfo","_oldItem","_newItemWeight","_newItem","_oldItemWeight","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_materialsRequired","_materialsGiven","_noLicenseCost","_text","_filter","_totalConversions","_minimumConversions"];

_trader = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_itemType = [_this,3,"",[""]] call BIS_fnc_param;
_itemInVeh = "";
_playerID = getPlayerUID player;
_amount = 0;
_vehicleWeight = 0;
_vehicleArr = [];
_multipleVehicles = 0;
_sleep_amount = 0;
_multipleItems = false;
 
{
      if (_x isKindOf "Air" || _x isKindOf "Car") then
      {
        _vehicleID = _x getVariable["vehicle_info_owners",-1] select 0 select 0;
        if (_vehicleID == _playerID) then
        {
            _trunkContents = _x getVariable ["Trunk",[[],0]];
			_count_items = _trunkContents select 0;
			
			if (count _count_items > 1) then {
				_multipleItems = true;
			};
			
            _vehicleWeight = _trunkContents select 1;
            _itemInVeh = _trunkContents select 0 select 0 select 0;
            _amount = _trunkContents select 0 select 0 select 1;
            _position = getPosATL _x;
            _vehicleArr pushBack _x;
            _multipleVehicles = count _vehicleArr;
        };
      };
     
} foreach (nearestObjects [player,[],25]);

if (_multipleVehicles == 0) exitWith { hint format["You need a vehicle that is owned by you to process %1",_itemType] };
if (_multipleVehicles > 1) exitWith {  hint 'Only one vehicle owned by you can be within 25 meters of the trader'; };
if (isNil "_amount") exitWith { hint format["You don't have any %1 in your vehicle",_itemType] };
if (_multipleItems) exitWith { _multipleItems = false; hint format["Only %1 can be in your vehicle when using vehicle processing - remove the other items",_itemType] };
if (_itemInVeh find _itemType == -1) exitWith { hint format["You can only process %1 at this trader.",_itemType] };

if (_itemType == "cannabis") then {

	_itemType = "marijuana";

};

if (_itemType == "rock") then {

	_itemType = "cement";

};


if (_amount <= 10) 
	then { _sleep_amount =  0.3; }; //0:30
if (_amount > 10) 
	then { _sleep_amount =  1.2; }; //2:00
if (_amount > 49) 
	then { _sleep_amount =  2.1; }; //3:30
if (_amount > 99) 
	then { _sleep_amount =  3.0; }; //5:00
if (_amount > 149) 
	then { _sleep_amount =  3.9; }; //6:30
if (_amount > 199) 
	then { _sleep_amount =  4.8; }; //8:00
if (_amount > 249) 
	then { _sleep_amount =  6.0; }; //10:00


if (isClass (missionConfigFile >> "ProcessAction" >> _itemType)) then {
    _filter = false;
    _materialsRequired = M_CONFIG(getArray,"ProcessAction",_itemType,"MaterialsReq");
    _materialsGiven = M_CONFIG(getArray,"ProcessAction",_itemType,"MaterialsGive");
    _noLicenseCost = M_CONFIG(getNumber,"ProcessAction",_itemType,"NoLicenseCost");
    _text = M_CONFIG(getText,"ProcessAction",_itemType,"Text");
} else {_filter = true;};


_itemInfo = [_materialsRequired,_materialsGiven,_noLicenseCost,(localize format ["%1",_text])];
 
_action = [
    format["Process <t color='#8cff9b'>%1</t> <t color='#ffffff'>%2</t>",
    _amount,
    _itemType], "Process","Accept","Cancel"
] call BIS_fnc_guiMessage;
 
 
if (_action) then {
 
_vehicle = _vehicleArr select 0;
_vehicle setVariable["trunk_in_use",true,true];
 
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_upp = _itemInfo select 3;





_oldItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _oldItemWeight = _oldItemWeight + _weight;
	_oldItemName = _x select 0;
} count _oldItem;

_newItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _newItemWeight = _newItemWeight + _weight;
	_newItemName = _x select 0;

	
} count _newItem;

_totalWeight = _amount * _newItemWeight;

 
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
life_is_processing = true;
aborted_process = false; 
 
 
 
while{true} do


{
    sleep _sleep_amount;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if(_cP >= 1) exitWith {};
	if(_vehicle distance _trader > 25) exitWith {hint "Your vehicle needs to stay within 25 meters of the trader"; 5 cutText ["","PLAIN"]; life_is_processing = false; aborted_process = true;};
	
};


if (count _vehicleArr > 0 && !aborted_process) then {
    _vehicle setVariable["Trunk",[[[_newItemName,_amount]],_totalWeight],true];
};

if (!aborted_process) then {

	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldItemName,_upp],"PLAIN"];

} else {

   5 cutText ["","PLAIN"];
	titleText ["Processing cancelled your moved too far from the trader ", "PLAIN"];

};

life_is_processing = false;
aborted_process = false; 
_vehicle setVariable["trunk_in_use",false,true];

};