#include "..\..\script_macros.hpp"
/*
    File: fn_medicLoadout.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads the medic out with the default gear.
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_B_CombatUniform_mcam";
player addbackpack "B_FieldPack_oli";
player addItem "Medikit";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";


[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
