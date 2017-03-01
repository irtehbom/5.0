
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_name = [_this, 1, "", [""]] call BIS_fnc_param;


if (!isNil {grpPlayer getVariable "gangName"}) exitWith {
	[[1, "You are already in a gang."], "life_fnc_broadcast", owner _unit, false] spawn life_fnc_MP;
	life_action_gangInUse = nil;
	life_action_gangInUse publicVariableClient (owner _unit);
};

_query = format["SELECT ID FROM gang WHERE name = '%1'", _name];
waitUntil{!DB_Async_Active};
_queryResult = [_query, 2] call DB_fnc_asyncCall;

if (count _queryResult > 0) exitWith {
	[[1, "A gang with this name already exists."], "life_fnc_broadcast", owner _unit, false] spawn life_fnc_MP;
	life_action_gangInUse = nil;
	life_action_gangInUse publicVariableClient (owner _unit);
	
};

_query = format["INSERT INTO gang (leader, name) VALUES ('%1', '%2')", getPlayerUID _unit, _name];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;

_query = format["SELECT ID FROM gang WHERE leader = '%1' and name = '%2'", getPlayerUID _unit, _name];
waitUntil{!DB_Async_Active};
_queryResult = [_query, 2] call DB_fnc_asyncCall;

_query = format["UPDATE players SET gang = %1 WHERE playerid = '%2'", _queryResult select 0, getPlayerUID _unit];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;

_group = createGroup civilian;
_group setVariable["gangId", _queryResult select 0, true];
_group setVariable["gangName", _name, true];
_group setVariable["gangLeader", getPlayerUID _unit, true];
_group setVariable["gangLevel", 1, true];
_group setVariable["gangBank", 0, true];

_unit setVariable["gangRank", 5, true];

[[_group], "life_fnc_gangCreated", owner _unit, false] call life_fnc_MP;
