/*
If guilty, send to jail
*/
private["_bad","_unit","_display","_list","_data","_uid"];

disableSerialization;

_display = findDisplay 9400;
_list = _display displayCtrl 9402;
_data = lbData[9401,(lbCurSel 9401)];

_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_playerUnit = _data select 0;
_playerName = _data select 1;
_playerUID = _data select 2;


_unit = _playerUnit;

if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_unit setVariable["restrained",false,true];
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
_unit setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive _unit};
	sleep 1;
};

//Check to make sure they goto check
if(_unit distance (getMarkerPos "jail_marker") > 40) then
{
	_unit setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_firearms > 0) then {[false,"firearms",life_inv_firearms] call life_fnc_handleInv;};
if(life_inv_opium > 0) then {[false,"opium",life_inv_opium] call life_fnc_handleInv;};
life_is_arrested = true;

removeAllWeapons _unit;
{_unit removeMagazine _x} foreach (magazines _unit);

[[_unit,_bad],"life_fnc_jailSys",false,false] spawn life_fnc_MP;
[[_playerUID],"life_fnc_courtRemovePlayer",false,false] spawn life_fnc_MP;
[5] call SOCK_fnc_updatePartial;