private[];
disableSerialization;

if ((lbCurSel 2621) == -1) exitWith { hint "You must select a person to kick."; };
_unit = call compile format["%1", lbData[2621,(lbCurSel 2621)]];
if(isNull _unit) exitWith {}; //This is actually possible if the player logs out when the window is open.
if(_unit == player) exitWith {hint "You cannot kick yourself from the gang."; };


[[_unit, grpPlayer], "life_fnc_gangKickRequest", false, false] spawn life_fnc_MP; //Update the database.

[] call life_fnc_gangMenu;