#include <macro.h>
/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
[] call life_fnc_stripDownPlayer;

//Load player with default cop gear.
/*player forceAddUniform "U_O_OfficerUniform_ocamo";
player linkItem "NVGoggles_OPFOR";
player addGoggles "G_Tactical_Clear";*/

player forceAddUniform "U_B_CombatUniform_mcam_worn";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";
player addVest "V_TacVest_blk_POLICE";
player addHeadgear "H_Cap_Police";
player addBackpack "B_AssaultPack_blk";


player addWeapon "hgun_P07_snds_F";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";


if (__GETC__(life_donator) == 2) then {
player addBackpack "B_Carryall_khk";
player addItem "NVGoggles";
player assignItem "NVGoggles";
hint "Level 2 Donation Gear Loaded";
};

if (__GETC__(life_donator) == 3) then {
player addBackpack "B_Carryall_khk";
player addItem "Toolkit";
player addItem "FirstAidKit";
player addItem "NVGoggles";
player assignItem "NVGoggles";
hint "Level 3 Donation Gear Loaded";
};

if (__GETC__(life_donator) == 4) then {
player addBackpack "B_Carryall_khk";
player addItem "Toolkit";
player addItem "FirstAidKit";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "NVGoggles";
player assignItem "NVGoggles";
player addWeapon "srifle_DMR_01_ACO_F";
player addMagazine "10Rnd_762x54_Mag";
player addMagazine "10Rnd_762x54_Mag";
player addMagazine "10Rnd_762x54_Mag";
player addMagazine "10Rnd_762x54_Mag";
player addMagazine "10Rnd_762x54_Mag";
hint "Level 4 Donation Gear Loaded";
};

[player] execVM "scripts\fn_cop_skin.sqf";

[] call life_fnc_skins;
[false] call life_fnc_saveGear;