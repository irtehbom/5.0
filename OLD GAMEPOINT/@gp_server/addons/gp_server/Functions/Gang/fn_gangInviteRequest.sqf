
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_inviter = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
_group = [_this, 2, grpNull, [grpNull]] call BIS_fnc_param;


_gangId = _group getVariable["gangId", -1];

_query = format["SELECT COUNT(*) FROM players WHERE gang='%1'", _gangId];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

_level = _group getVariable["gangLevel", -1];
_maxMembers = 6 + ((_level - 1) * 2);

if (_queryResult select 0 < _maxMembers) then {
	// Send the invite!
	_name = name _inviter;
	[[_group, _name], "life_fnc_gangInvite", owner _unit, false] call life_fnc_MP;
} else {
	[[1, "Your gang is already at max capacity."], "life_fnc_broadcast", owner _inviter, false] spawn life_fnc_MP;
};