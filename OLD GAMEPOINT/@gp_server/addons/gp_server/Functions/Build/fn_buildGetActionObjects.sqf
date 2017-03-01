private[];

_group = [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;
_owner = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;


_gangId = _group getVariable["gangId", -1];
if (_gangId == -1) exitWith {};


_queryResult = [format["SELECT position FROM build WHERE gangID = %1 AND objectType = '%2'", _gangId, "Pole_F"], 2, true] call DB_fnc_asyncCall;

_pos = [(_queryResult select 0) select 0] call DB_fnc_mresToArray;
if (count _pos > 0) then {
	[[_pos select 1], "life_fnc_buildActions", owner _owner, false] spawn life_fnc_MP;
} else {
	[[[]], "life_fnc_buildActions", owner _owner, false] spawn life_fnc_MP;
};