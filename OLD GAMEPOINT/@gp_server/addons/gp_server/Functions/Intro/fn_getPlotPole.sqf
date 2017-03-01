private[];

_queryResult = ["SELECT * FROM build WHERE objectType='Pole_F'",2,true] call DB_fnc_asyncCall;

_owner = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

_tempArr = [];
waitUntil{!DB_Async_Active};
{
	_pos = [_x select 3] call DB_fnc_mresToArray;
	_position = _pos select 1;
	_tempArr pushBack _position;
	
} forEach _queryResult;

[[_tempArr],"life_fnc_intro",owner _owner,false] spawn life_fnc_MP;

