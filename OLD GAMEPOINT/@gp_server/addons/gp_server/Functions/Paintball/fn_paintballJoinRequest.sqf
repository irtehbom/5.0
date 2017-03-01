private[];

_player = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

_bail = false;
{
	if (_x == _player) exitWith { _bail = true; };
} forEach life_paintball_queued;

if (_bail) exitWith {
	[[1, "You are already queued for paintball."], "life_fnc_broadcast", owner _player, false] spawn life_fnc_MP;
};

life_paintball_queued pushBack _player;

if (life_paintball_inprogress) then {
	[[1, format["You've been queued for a paintball match but it is currently in progress so it could take a bit. You are in the queue with %1 others.", (count life_paintball_queued) - 1]], "life_fnc_broadcast", owner _player, false] spawn life_fnc_MP;
} else {
	[[1, format["You've been queued for a paintball match. You are in the queue with %1 others. If there are enough players, it can take up to 60 seconds for the match to start.", (count life_paintball_queued) - 1]], "life_fnc_broadcast", owner _player, false] spawn life_fnc_MP;
};