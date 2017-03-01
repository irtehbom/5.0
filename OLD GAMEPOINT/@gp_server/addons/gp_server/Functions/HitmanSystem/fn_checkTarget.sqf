/*
	File: fn_checkTarget.sqf
	Author: Lars 'Levia' Wesselius
	
	Description:
	Compares the dead target to the hit list.
*/

private["_ret","_list","_data"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};
if(isNull _killer) exitWith {};

_uid = getPlayerUID _ret;
_ret = owner _ret;

diag_log format["Checking %1", _uid];

_query = format["SELECT contractorID, victimID, victimName, amount FROM hitman WHERE victimID='%1' AND active=1",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith {};

if (count _queryResult != 0) then {
	_amount = _queryResult select 0 select 3;
	
	// This player was on the hitlist. Let's see if _killer took a contract.
	_contractUid = _killer getVariable["contractAccepted", -1];
	if (!(isNil "_contractUid") && _contractUid == _uid) then {
		// The killer has this guy as a contract.
	
		[[2,"You were killed by a hitman!"],"life_fnc_broadcast",_ret,false] spawn life_fnc_MP;
		[[2,"A hitman killed your target!"],"life_fnc_broadcast",_queryResult select 0 select 0,false] spawn life_fnc_MP;
		[[2,format["You've completed your contract. $%1 has been added to your bank account.",[_amount] call life_fnc_numberText]],"life_fnc_broadcast",owner _killer,false] spawn life_fnc_MP;
		
		[[_amount],"life_fnc_hitmanContractBountyReceive",_killer,false] spawn life_fnc_MP;
		_query = format["UPDATE hitman SET active = 0, amount = 0 WHERE victimID='%1'",_uid];
		waitUntil {!DB_Async_Active};
		[_query,1] call DB_fnc_asyncCall;
	};
};