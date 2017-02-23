#include "..\..\script_macros.hpp"
/*
    File: fn_escortAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description: Attaches the desired person(_unit) to the player(player) and "escorts them".
*/
private ["_unit"];



_unit = cursorObject;

diag_log format["_unit 1 %1",_unit];

if (!isNull(player getVariable ["escortingPlayer",objNull])) exitWith {};

diag_log format["_unit 2 %1",_unit];

if (isNil "_unit" || isNull _unit || !isPlayer _unit) exitWith {};

diag_log format["_unit 3 %1",_unit];

if (!(side _unit in [east,independent])) exitWith {};

diag_log format["_unit 4 %1",_unit];

if (player distance _unit > 3) exitWith {};


diag_log format["_unit 5 %1",_unit];

_unit attachTo [player,[0.1,1.1,0]];
player setVariable ["escortingPlayer",_unit];
player setVariable ["isEscorting",true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["Escorting",true,true];
player reveal _unit;

[_unit] spawn {
    _unit = _this select 0;
    waitUntil {(!(_unit getVariable ["Escorting",false]))};
    player setVariable ["escortingPlayer",nil];
    player setVariable ["isEscorting",false];
};