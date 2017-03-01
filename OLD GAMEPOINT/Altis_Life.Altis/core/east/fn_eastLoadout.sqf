#include <macro.h>
/*
	File: fn_eastLoadout.sqf
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};


player forceAddUniform "U_B_CombatUniform_mcam_worn";
player addBackpack "B_AssaultPack_blk";
player addGoggles "NVGoggles_OPFOR";

/* ITEMS */
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "Toolkit";

[] call life_fnc_eastSkin;


[false] call life_fnc_saveGear;
