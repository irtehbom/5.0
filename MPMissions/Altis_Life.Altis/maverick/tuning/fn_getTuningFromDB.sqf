scriptName "fn_getTuningFromDB";

#include "..\..\script_macros.hpp"

#define __filename "fn_getTuningFromDB.sqf"

_vehicleID = param[0,-1,[-1]];
_vehicle = param[1,objNull,[objNull]];
_delay = param[2,0,[0]];
if (!isServer && hasInterface) exitWith {};
if (_vehicleID == -1) exitWith {};

sleep _delay;

_vehicle setVariable ["vehicleID",_vehicleID, true];

_data = [];

if (life_HC_isActive) then {
    _data = [_vehicleID] call HC_fnc_getVehicleTuningData;
} else {
    _data = [_vehicleID] call TON_fnc_getVehicleTuningData;
};


if (count _data > 0) then {
	_result = _data select 0;
	

	if (count _result > 0) then {
	
		_resultConverted = call compile ([false,(_result select 0)] call mav_tuning_fnc_tuning_prepareString);
		
		if (count _resultConverted == 0) then {
			[_vehicle] call mav_tuning_fnc_applyDefaults;
			
			
			_resultConverted = _vehicle getVariable ["mav_tuning",[]];
		};
		_vehicle setVariable ["mav_tuning", _resultConverted, true];
		[_resultConverted, _vehicle, 1] spawn mav_tuning_fnc_loadVehicleModification;
	};
};