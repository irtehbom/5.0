/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;


if(_veh == "O_MRAP_02_F") then 
{
	_vehicle removeMagazinesTurret ["SmokeLauncherMag",[-1]];
};

if(_veh == "B_MRAP_01_F") then 
{
	_vehicle removeMagazinesTurret ["SmokeLauncherMag",[-1]];
};

if(_veh == "I_MRAP_03_F") then 
{
	_vehicle removeMagazinesTurret ["SmokeLauncherMag",[-1]];
};

if(_veh == "I_MRAP_03_hmg_F") then 
{
	_vehicle removeMagazinesTurret ["SmokeLauncherMag",[-1]];
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;