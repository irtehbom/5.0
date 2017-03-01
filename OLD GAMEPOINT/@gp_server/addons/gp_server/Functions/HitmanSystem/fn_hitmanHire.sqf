/*
	File: fn_hitmanHire.sqf
	Author: Lars 'Levia' Wesselius
	
	Description:
	Adds or appends a unit to the hit list.
*/
private["_player","_target","_amount","_index","_data","_name","_gangName"];
_player = [_this,0,"",[""]] call BIS_fnc_param;
_target = [_this,1,"",[""]] call BIS_fnc_param;
_name = [_this,2,"",[""]] call BIS_fnc_param;
_amount = [_this,3,"",[""]] call BIS_fnc_param;
_gangName = [_this,4,"",[""]] call BIS_fnc_param;
if(isNil "_player" OR isNil "_target" OR parseNumber(_amount) <= 0) exitWith {}; //Bad data passed.

_query = format["SELECT victimID, victimName FROM hitman WHERE victimID='%1'",_target];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (count _queryResult != 0) then {
	_query = format["UPDATE hitman SET amount = amount + '%1', active = 1, victimName = '%3' WHERE victimID='%2'",_amount,_target,_name];
	waitUntil {!DB_Async_Active};
	[_query,1] call DB_fnc_asyncCall;
} else {
	_query = format["INSERT INTO hitman (contractorID, victimID, victimName, amount, active, gangName) VALUES('%1', '%2', '%3', '%4', 1, '%5')",_player,_target,_name,_amount,_gangName];
	waitUntil {!DB_Async_Active};
	[_query,1] call DB_fnc_asyncCall;
};