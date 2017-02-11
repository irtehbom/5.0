#include "hc_macros.hpp"
/*
    File: fn_initHCAI.sqf
    Author: Rob
*/
private ["_timeStamp"];

[] execVM "\ai_hc\KRON_Strings.sqf";

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------ Starting AI HC ------------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

AI_HC_MPAllowedFuncs = [
    "AI_HC_fnc_spawn_ai"
];

CONSTVAR(AI_HC_MPAllowedFuncs);

[0,"AI HC Connected - Ready for Instructions"] remoteExecCall ["life_fnc_broadcast",RCLIENT];

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["End of AI HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";

[] spawn AI_HC_fnc_spawn_ai;