// =========================================================================================================
//  Author: Rob
// =========================================================================================================

_positionToSpawn = _this select 0;

_defaultCrateWeapons =
[
	["srifle_EBR_ACO_F", "20Rnd_762x51_Mag", 6],
	["SMG_01_F", "30Rnd_45ACP_Mag_SMG_01", 4],
	["arifle_MX_SW_F", "100Rnd_65x39_caseless_mag_Tracer", 2]
];

_defaultCrateItems =
[
	["NVGoggles_OPFOR", 1],
	["ToolKit", 1],
	["FirstAidKit", 4],
	["optic_LRPS", 1],
	["optic_Holosight", 1],
	["optic_Aco", 1],
	["Rangefinder", 1]
];


// Format: weaponClass, magazineClass, magazines, weight (chance to be picked)
_rareCrateWeapons =
[
	["arifle_MX_GL_Black_Hamr_pointer_F", "1Rnd_HE_Grenade_shell", 3, 0.1],
	["arifle_Katiba_GL_F", "1Rnd_HE_Grenade_shell", 3, 0.1],
	["MMG_01_hex_ARCO_LP_F", "150Rnd_93x64_Mag", 2, 0.1],
	["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 3, 0.3],
	["srifle_DMR_05_KHS_LP_F", "10Rnd_93x64_DMR_05_Mag", 3, 0.3],
	["srifle_DMR_03_ACO_F", "20Rnd_762x51_Mag", 3, 0.3],
	["srifle_DMR_02_sniper_AMS_LP_S_F", "10Rnd_338_Mag", 3, 0.3],
	["srifle_EBR_ACO_F", "20Rnd_762x51_Mag", 4, 0.7]
];

_rareCrateWeaponWeights = [];
{
	_rareCrateWeaponWeights set [_forEachIndex, if (count _x > 1) then { _x select 3 } else { 1 }];
} forEach _rareCrateWeapons;


_crate = "Box_IND_AmmoVeh_F" createVehicle (getPos _positionToSpawn);
_crate allowDamage false;
clearItemCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

{
	_crate addWeaponCargoGlobal [(_x select 0),1];
	_crate addMagazineCargoGlobal [_x select 1, _x select 2];
} forEach _defaultCrateWeapons;

{
	_crate addItemCargoGlobal [_x select 0, _x select 1];
} forEach _defaultCrateItems;

_weaponOne = [_rareCrateWeapons, _rareCrateWeaponWeights] call BIS_fnc_selectRandomWeighted;
_rareCrateWeapons - _weaponOne;
_rareCrateWeaponWeights = [];
{
	_rareCrateWeaponWeights set [_forEachIndex, if (count _x > 1) then { _x select 3 } else { 1 }];
} forEach _rareCrateWeapons;

_weaponTwo = [_rareCrateWeapons, _rareCrateWeaponWeights] call BIS_fnc_selectRandomWeighted;

_crate addWeaponCargoGlobal [(_weaponOne select 0), 1];
_crate addMagazineCargoGlobal [(_weaponOne select 1), (_weaponOne select 2)];

_crate addWeaponCargoGlobal [(_weaponTwo select 0), 1];
_crate addMagazineCargoGlobal [(_weaponTwo select 1), (_weaponTwo select 2)];

_crate;
