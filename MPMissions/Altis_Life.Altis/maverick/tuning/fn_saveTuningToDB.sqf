scriptName "fn_saveTuningToDB";

#include "..\..\script_macros.hpp"

#define __filename "fn_saveTuningToDB.sqf"

_vehicleID = param[0,-1,[-1]];
_data = param[1,[],[[]]];
if (_vehicleID == -1) exitWith {};
if (!isServer && hasInterface) exitWith {};
if (count _data == 0) exitWith {};
_dataString = [true,str _data] call mav_tuning_fnc_tuning_prepareString;

if (life_HC_isActive) then {
	[_vehicleID, _dataString] remoteExecCall ["HC_fnc_saveVehicleTuningData",HC_Life];
} else {
	[_vehicleID, _dataString] remoteExecCall ["TON_fnc_saveVehicleTuningData",RSERV];
};