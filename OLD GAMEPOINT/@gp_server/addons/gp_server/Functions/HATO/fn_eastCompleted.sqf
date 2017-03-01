private[];

_veh = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;


_newList = [];

{
	if (_x select 0 != _veh) then {
		_newList pushBack _x;
	};
} foreach life_hato_requests;


life_hato_requests = _newList;