if(dialog) exitWith {}; //A dialog is already open.
life_OilObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull life_OilObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_OilObj getVariable["safe_bonds",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if((life_OilObj getVariable["inUse",false])) exitWith {hint localize "STR_Civ_VaultInUse"};
//if({side _x == west} count playableUnits <= 0) exitWith {hint localize "STR_Civ_NotEnoughCops"};
if(!createDialog "Oil_Dialog") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_OilObj] call life_fnc_safeInvOil;
life_OilObj setVariable["inUse",true,true];
[life_OilObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};