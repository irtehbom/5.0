#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
east_spawn_1 = nearestObjects[getMarkerPos  "east_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
east_spawn_2 = nearestObjects[getMarkerPos  "east_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
east_spawn_2 = nearestObjects[getMarkerPos  "east_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
east_spawn_2 = nearestObjects[getMarkerPos  "east_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};
player addRating 9999999;

if((life_pmc_whitelist) == 0) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
};

[] call life_fnc_hudUpdate;

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.



[] spawn life_fnc_placeablesInit;
// Start HATO specific loop
[] spawn life_fnc_eastCheckCompletion;