/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
	
	Because you're a prick
	
	// Added the heli spawn
*/
private["_spawnPos","_dir","_type"];
_type = [_this,1,"",[""]] call BIS_fnc_param;
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Real Estate Spawn Check

_heliSpawn = nearestObjects [player, ["Land_HelipadCircle_F"],20] select 0;

_laptopCheck = nearestObjects [player, ["Land_Laptop_unfolded_F"],5];
_laptopCheckFilter = _laptopCheck select 0;

if (count _laptopCheck > 0) then {
	if(((_laptopCheckFilter getVariable "heli_owned") select 0) == (getPlayerUID player)) then {
		life_garage_sp = [(_heliSpawn modelToWorld [0,0,0]),(getDir _heliSpawn)];
		} else {
		life_garage_sp = [(_spawnPos modelToWorld [-15,0,0]),(getDir _spawnPos)-90];
	}; 
} else {
	life_garage_sp = [(_spawnPos modelToWorld [-15,0,0]),(getDir _spawnPos)-90];
};




life_garage_type = _type;
[[getPlayerUID player,playerSide,_type,player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];