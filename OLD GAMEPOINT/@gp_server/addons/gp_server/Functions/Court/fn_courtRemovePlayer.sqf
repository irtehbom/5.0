/*
Adds civ to court list
*/
private["_civ","_curUid","_getPlayerName","_wantedList","_uid"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;

newArray = [];
{
    _getTheIndexUID = _x select 2;
    if (_uid != _getTheIndexUID) then {
        newArray pushBack _x;
    };
} forEach gp_court_list;

gp_court_list = newArray;
publicVariable "gp_court_list";
