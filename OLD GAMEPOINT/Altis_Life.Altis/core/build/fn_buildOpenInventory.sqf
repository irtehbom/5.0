private["_storageCrate","_veh_data"];
if(dialog) exitWith {};

_storageCrate = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

diag_log "--------------------------------- BASE BUILDING ----------------------------------";

_gangId = _storageCrate getVariable["gang", -1];
_playerGang = (group player) getVariable["gangId", -1];
if (_gangId != _playerGang) exitWith { hint "You are not allowed to view the contents of another gang's storage crates."; };

if((_storageCrate getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
_storageCrate setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;


ctrlSetText[3501, "Storage crate"];

private["_mWeight"];
_mWeight = 0;
{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_storageCrate getVariable["containers",[]]);
_veh_data = [_mWeight,(_storageCrate getVariable["Trunk",[[],0]]) select 1];


ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_storageCrate] call life_fnc_vehInventory;
life_trunk_vehicle = _storageCrate;

_storageCrate spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use",false,true];
	if(typeOf _this in life_build_storage_crates) then {
		[[_this], "life_fnc_buildSaveInventory", false, false] spawn life_fnc_MP;
	};
};