#include "hc_macros.hpp"
/*
    File: fn_initHCAI.sqf
    Author: Rob
*/
private ["_timeStamp"];

[] execVM "\dummy_hc\KRON_Strings.sqf";

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------ Starting AI HC ------------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

dummy_hc_MPAllowedFuncs = [
    "dummy_hc_fnc_spawn_ai"
];

CONSTVAR(dummy_hc_MPAllowedFuncs);

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["End of AI HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";