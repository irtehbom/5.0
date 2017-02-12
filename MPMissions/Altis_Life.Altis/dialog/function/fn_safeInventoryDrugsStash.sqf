#include "..\..\script_macros.hpp"
/*
    File: fn_safeInventoryOilRig.sqf
    
    Fills up the oil inventory.
*/
private ["_safe","_tInv","_pInv","_safeInfo","_str","_shrt","_icon"];
_safe = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _safe) exitWith {closeDialog 0;};
disableSerialization;

_tInv = (findDisplay 9999) displayCtrl 9999;
lbClear _tInv;
_safeInfo = _safe getVariable ["seized_drugs_array",[]];
if (count (drugs_stash getVariable ["seized_drugs_array",[]]) isEqualTo 0) exitWith {hint localize "STR_Civ_VaultEmpty";};
{
	_stringName = M_CONFIG(getText,"VirtualItems",_x select 0,"displayName");
	_variableName = M_CONFIG(getText,"VirtualItems",_x select 0,"variable");
	_tInv lbAdd format ["[%1] - %2",_x select 1,(localize _stringName)];
	_tInv lbSetData [(lbSize _tInv)-1,_variableName];
	_icon = M_CONFIG(getText,"VirtualItems",_x select 0,"icon");
	if (!(_icon isEqualTo "")) then {
		_tInv lbSetPicture [(lbSize _tInv)-1,_icon]; 
	};
}
foreach _safeInfo;
