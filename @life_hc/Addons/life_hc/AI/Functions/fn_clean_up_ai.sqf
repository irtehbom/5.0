// =========================================================================================================
//  Author: Rob
// =========================================================================================================

_unit = _this select 0;
_killer = _this select 1;

if (_unit getVariable "scientist") then {
	[_killer] remoteExecCall ["life_fnc_bankMissionReward",_killer];
};

removeallweapons _unit;
removebackpack _unit;
deleteVehicle _unit;



