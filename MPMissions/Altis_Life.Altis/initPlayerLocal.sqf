#include "script_macros.hpp"
/*
    File: initPlayerLocal.sqf
    Author:

    Description:
    Starts the initialization of the player.
*/

if (!hasInterface && !isServer) exitWith {
	_selectHC = name player;
	
	if (_selectHC == "life_hc") then {
		[] call compile preprocessFileLineNumbers "\life_hc\initHC.sqf";
	};
	
	if (_selectHC == "ai_hc") then {
		[] call compile preprocessFileLineNumbers "\ai_hc\initHCAI.sqf";
	};
	
}; //This is a headless client.

#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
if (LIFE_SETTINGS(getNumber,"spyGlass_toggle") isEqualTo 1) then {[] execVM "SpyGlass\fn_initSpy.sqf";};

if (hasInterface) then {
    player addEventHandler ["GetOutMan", {
        life_seatbelt = false;
       
    }];
};

if (hasInterface) then {
    player addEventHandler ["GetInMan", {
        life_seatbelt = false;
    }];
};

[] execVM "core\init.sqf";
