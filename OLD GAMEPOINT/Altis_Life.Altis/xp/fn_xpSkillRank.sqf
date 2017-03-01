private[];

_player = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_skill = [_this, 1, 0, [0]] call BIS_fnc_param;


_skills = _player getVariable["Skills", []];
_return = 0;
{
	if (_x select 0 == _skill) then {
		_return = _x select 1;
	};
	
	if (_return > 0) exitWith {	};
} forEach (_skills);

_return;