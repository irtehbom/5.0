#include <fixvehicles.h>
private["_vehicle","_vColor"];

{
	if (alive _x) then
	{
		_vehicle = _x;
		_vColor = _vehicle getVariable["vehicle_color",[]];

		_list = ["landVehicle","Ship","Air"];
		
		_isVehicle = if(KINDOF_ARRAY(_vehicle,_list)) then {true} else {false};	
	
		if(!_isVehicle) exitWith {};
	
		//Check if color is null
		if (isNil "_vColor") exitWith{ };

		[_vehicle,_vColor] remoteExecCall ["life_fnc_colorVehicle",-2];
		
	};
} forEach vehicles;