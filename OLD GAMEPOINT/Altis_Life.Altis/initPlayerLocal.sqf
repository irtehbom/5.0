/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};


if (!hasInterface) exitWith {
	// Hello, I'm the HC
	
	waitUntil {!(isNull player)};
	
	diag_log format["Headless client %1 loading...", name player];
	[] spawn {
		"BIS_fnc_MP_packet" addPublicVariableEventHandler { _this call life_fnc_MPexec };
		"life_fnc_MP_packet" addPublicVariableEventHandler { [_this select 0,_this select 1] call life_fnc_MPexec; };
	};
	
	[] spawn gphc_fnc_initialize;
};

#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "SpyGlass\fn_initSpy.sqf";
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};
#include "heliRopes.sqf"