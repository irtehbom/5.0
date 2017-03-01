private[];

if (count life_paintball_queued <= 1) exitWith {};

_red = true;

{
	if (_x == ObjNull || vehicle _x != _x || !(alive _x)) then {
		// In a vehicle or dead.
		[[5, "You've been removed from the paintball queue as you were either in a vehicle or dead at the time it started."], "life_fnc_broadcast", owner _x,false] spawn life_fnc_MP;
	} else {
		if (_red) then {
			life_paintball_red_team pushBack [_x, true, 0];
			_red = false;
		} else {
			life_paintball_blue_team pushBack [_x, true, 0];
			_red = true;
		};
	};
} forEach life_paintball_queued;


if (count life_paintball_blue_team <= 0) exitWith {};
if (count life_paintball_red_team <= 0) exitWith {};

{
	[[false], "life_fnc_paintballStart", owner (_x select 0), false] spawn life_fnc_MP;
} forEach life_paintball_blue_team;

{
	[[true], "life_fnc_paintballStart", owner (_x select 0), false] spawn life_fnc_MP;
} forEach life_paintball_red_team;

life_paintball_inprogress = true;
life_paintball_timer_start = serverTime;
life_paintball_timer_stop = serverTime + 60 * 5;