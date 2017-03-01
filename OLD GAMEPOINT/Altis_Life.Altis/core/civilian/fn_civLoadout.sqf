#include <macro.h>
/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

diag_log format ["%1, %2", life_aff_whitelist];

_affwhitelist = parseNumber(life_aff_whitelist);

if(_affwhitelist >= 1) then
{
player addUniform 'U_I_CombatUniform';

} else {

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
player addUniform (_clothings select (floor(random (count _clothings))));
};

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "NVGoggles";
player assignItem "NVGoggles";


if (__GETC__(life_donator) == 2) then {
player addBackpack "B_Carryall_khk";
hint "Level 2 Donation Gear Loaded";
};

if (__GETC__(life_donator) == 3) then {
player addBackpack "B_Carryall_khk";
player addItem "Toolkit";
player addItem "FirstAidKit";
hint "Level 3 Donation Gear Loaded";
};

if (__GETC__(life_donator) == 4) then {
player addBackpack "B_Carryall_khk";
player addItem "Toolkit";
player addItem "FirstAidKit";
player addItem "ItemGPS";
player assignItem "ItemGPS";
hint "Level 4 Donation Gear Loaded";
};


[] call life_fnc_skins;
[false] call life_fnc_saveGear;