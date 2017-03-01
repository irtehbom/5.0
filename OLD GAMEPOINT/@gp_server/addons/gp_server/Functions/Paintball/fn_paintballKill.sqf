private[];

_player = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_killer = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;

{
	[[0,format["%1 got rinsed by %2", name _player, name _killer]], "life_fnc_broadcast", owner (_x select 0), false] spawn life_fnc_MP;
	
	if (_x select 0 == _player) then {
		_x set[1, false];
	};
	
	if (_x select 0 == _killer) then {
		_x set[2, _x select 2 + 1];
	};
} forEach life_paintball_blue_team + life_paintball_red_team;


_redLose = true;
{
	if ((_x select 1)) exitWith {
		_redLose = false;
	};
} forEach life_paintball_red_team;

_blueLose = true;
{
	if ((_x select 1)) exitWith {
		_blueLose = false;
	};
} forEach life_paintball_blue_team;

if (_blueLose || _redLose) then {
	{
		if ((_x select 1)) then {
			[[true], "life_fnc_paintballKilled", owner (_x select 0), false] spawn life_fnc_MP; 
		};
	} forEach life_paintball_blue_team + life_paintball_red_team;
	
	life_paintball_blue_team = [];
	life_paintball_red_team = [];
	life_paintball_inprogress = false;
};