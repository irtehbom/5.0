/*
	File: fn_hitlistFetch.sqf
	Author: Lars 'Levia' Wesselius
	
	Description:
	Displays hit list information sent from the server.
*/
private["_ret","_list","_jailedUnits","_targetGangName"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};
_query = format["SELECT contractorID, victimID, victimName, amount, gangName FROM hitman WHERE active=1"];

waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith {};

_gangName = (group _ret) getVariable["gang_name", ""];
_ret = owner _ret;
_new = [];
{
	_entry = _x;
	{
		_targetGangName = _x select 4;
		
		
		if (getPlayerUID(_entry) == _x select 1) then {
			// Check if the gangname of the target is the same as the gangname of the requester.
			if (!(!(isNil "_gangName") && !(isNil "_targetGangName") && _gangName != "" && _targetGangName != "" && _gangName == _targetGangName)) then {
				// They're NOT in the same gang.
				_new set [count _new, [_x select 0, _x select 1, _x select 2, _x select 3, _x select 4, _entry]];
			};
		};
	} forEach _queryResult;
} forEach playableUnits;
diag_log "hitlistFetch; " + format["%1", (count _queryResult)];
[[_new],"life_fnc_hitmanContractList",_ret,false] spawn life_fnc_MP;
