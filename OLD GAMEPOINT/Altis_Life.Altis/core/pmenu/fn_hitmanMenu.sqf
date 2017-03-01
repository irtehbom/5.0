#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_hitman_menu";

_display = findDisplay 50000;
_list = _display displayCtrl 50002;
lbClear _list;
_units = [];


{
	_list lbAdd format["%1", (_x getVariable["realname",name _x])];
	_list lbSetData [(lbSize _list)-1,str(_x)];
} forEach playableUnits;