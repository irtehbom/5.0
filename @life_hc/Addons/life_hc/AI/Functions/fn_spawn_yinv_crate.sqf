// =========================================================================================================
//  Author: Rob
// =========================================================================================================

_positionToSpawn = _this select 0;

_randomAmount = [20,200] call BIS_fnc_randomInt;

_items = [["marijuana",_randomAmount],["cocaine_processed",_randomAmount],["heroin_processed",_randomAmount]] call BIS_fnc_selectRandom;

_crate = "Box_IND_AmmoVeh_F" createVehicle (getPos _positionToSpawn);
_crate allowDamage false;
clearItemCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

_crate setVariable ["Trunk",[[_items],0],true];

_crate;
