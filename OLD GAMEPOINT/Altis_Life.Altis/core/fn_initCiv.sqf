#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if((life_is_arrested) || (life_in_court)) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

switch(parseNumber(life_aff_whitelist)) do 			
	{	             
		case 1: {life_paycheck = life_paycheck + 500;};               
		case 2: {life_paycheck = life_paycheck + 1500;};             
		case 3: {life_paycheck = life_paycheck + 2500;};  	             
		case 4: {life_paycheck = life_paycheck + 3500;};           
		case 5: {life_paycheck = life_paycheck + 4500;};               
		case 6: {life_paycheck = life_paycheck + 5500;};   	             
		case 7: {life_paycheck = life_paycheck + 6500;}; 		

	};


player addRating 9999999;

[] call life_fnc_hudUpdate;
