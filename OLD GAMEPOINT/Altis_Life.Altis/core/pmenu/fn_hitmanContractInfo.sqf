/*
	File: fn_wantedInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls back information about the wanted criminal.
*/
private["_display","_list","_crimes","_bounty","_mylist"];
disableSerialization;

_display = findDisplay 60000;
//_list = _display displayCtrl 60002;
_data = lbData[60002,(lbCurSel 60002)];
_data = call compile format["%1", _data];

_bounty = _data select 3;
ctrlSetText[60006,format["Bounty: $%1",[_bounty] call life_fnc_numberText]];