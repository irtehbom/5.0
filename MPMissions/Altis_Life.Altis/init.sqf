/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;

if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
};
[] execVM "KRON_Strings.sqf";
[] execVM "findKeyValue.sqf";

/* This is for the sitdown and standup script */
MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim; 
};

/* Disable fatigue */
if (local player) then {
  player enableFatigue false;
  player addEventhandler ["Respawn", {player enableFatigue false}];
};

StartProgress = true;
