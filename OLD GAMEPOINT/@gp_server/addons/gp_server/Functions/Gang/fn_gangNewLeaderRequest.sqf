
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_group = [_this, 1, grpNull, [grpNull]] call BIS_fnc_param;
_unitId = getPlayerUID _unit;

_groupId = _group getVariable["gangId", -1];

_query = format["UPDATE gang SET leader = '%1' WHERE ID = '%2'", _unitId, _groupId];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;

[[_unit, _group], "life_fnc_gangLeader", units _group, false] call life_fnc_MP; // Send to all group members that a new leader has been selected. This will update the HUD.