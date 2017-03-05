#include "..\..\script_macros.hpp"
/*
    File: fn_safeOpenDrugStash.sqf
*/


if (dialog) exitWith {};
drugs_stash = param [0,objNull,[objNull]];
if (isNull drugs_stash) exitWith {};
if (playerSide != east) exitWith {};
if (count (drugs_stash getVariable ["seized_drugs_array",[]]) isEqualTo 0) exitWith {hint localize "STR_Civ_VaultEmpty";};
if (drugs_stash getVariable ["inUse",false]) exitWith {hint localize "STR_Civ_VaultInUse"};
if (!createDialog "Drugs_Stash") exitWith {localize "STR_MISC_DialogError"};

disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[drugs_stash] call life_fnc_safeInventoryDrugsStash;
drugs_stash setVariable ["inUse",true,true];

[drugs_stash] spawn {
    waitUntil {isNull (findDisplay 9999)};
    (_this select 0) setVariable ["inUse",false,true];
};