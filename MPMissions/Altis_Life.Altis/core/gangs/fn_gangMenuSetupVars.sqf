#include "..\..\script_macros.hpp"
/*
	Rob
*/
private ["_ownerID","_gangBank","_gangName"];

_ownerID = group player getVariable ["gang_owner",""];

if (_ownerID isEqualTo "") exitWith {closeDialog 0;};

_gangName = group player getVariable "gang_name";

if (life_HC_isActive) then {
	[_gangName,player] remoteExecCall ["HC_fnc_getGangFundsDB",HC_Life];
} else {
	[_gangName,player] remoteExecCall ["TON_fnc_getGangFundsDB",RSERV];
};

sleep 0.5;

_gangBank = player getVariable["gang_bank_db",0];

[_ownerID,_gangName,_gangBank] call life_fnc_gangMenu;