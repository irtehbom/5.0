private["_grp", "_grpMembers"];

if (getPlayerUID player == ((group player) getVariable "gangLeader")) exitWith { hint "The gang leader can not simply leave the gang!"; };

[player] joinSilent (createGroup civilian);

[[player], "life_fnc_gangLeaveRequest", false, false] spawn life_fnc_MP;
closeDialog 0;