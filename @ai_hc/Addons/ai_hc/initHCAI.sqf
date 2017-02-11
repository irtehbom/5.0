#include "hc_macros.hpp"
/*
    File: fn_initHCAI.sqf
    Author: Rob
*/
private ["_timeStamp"];
if (EXTDB_SETTING(getNumber,"HeadlessSupport") isEqualTo 0) exitWith {};
[] execVM "\life_hc\KRON_Strings.sqf";



_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------ Starting AI HC ------------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";


HC_MPAllowedFuncs = [
    
];

CONSTVAR(HC_MPAllowedFuncs);

[0,"AI HC Connected"] remoteExecCall ["life_fnc_broadcast",RCLIENT];

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["                 End of AI HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
