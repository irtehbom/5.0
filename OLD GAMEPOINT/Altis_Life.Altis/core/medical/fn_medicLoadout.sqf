/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_Rangemaster";
player addBackpack "B_Carryall_oli";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "Medikit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[[player,0,"textures\medic_uniform.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

[] call life_fnc_skins;
[false] call life_fnc_saveGear;