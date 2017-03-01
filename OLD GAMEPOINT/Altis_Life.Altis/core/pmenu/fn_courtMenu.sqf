#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_court_menu";

_display = findDisplay 9400;
_list = _display displayCtrl 9401;
lbClear _list;
_units = [];

ctrlSetText[9404,"Establishing connection..."];

[] call life_fnc_courtList;