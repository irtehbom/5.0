private[];

_player = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_skill = [_this, 1, 0, [0]] call BIS_fnc_param;
_rankRequired = [_this, 2, 0, [0]] call BIS_fnc_param;


_skills = _player getVariable["Skills", []];
_return = false;
{
	if (_x select 0 == _skill) then {
		if (_rankRequired == 0 || _rankRequired >= _x select 1) then {
			_return = true;
		};
	};
	
	if (_return) exitWith {	};
} forEach (_skills);

_return;