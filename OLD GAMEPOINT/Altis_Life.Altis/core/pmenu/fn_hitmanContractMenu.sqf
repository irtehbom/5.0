#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_hitmanContract_menu";

_display = findDisplay 60000;
_list = _display displayCtrl 60002;
lbClear _list;
_units = [];


[[player],"life_fnc_hitlistFetch",false,false] spawn life_fnc_MP;
/*
{
	_list lbAdd format["%1", (_x getVariable["realname",name _x])];
	_list lbSetData [(lbSize _list)-1,str(_x)];
} forEach playableUnits;
*/