/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the gold inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
life_herObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull life_herObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_herObj getVariable["heroind",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if((life_herObj getVariable["inUse",false])) exitWith {hint localize "STR_Civ_VaultInUse"};
if(!createDialog "Heroin_Safe") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_herObj] call life_fnc_safeInvHer;
life_herObj setVariable["inUse",true,true];
[life_herObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};