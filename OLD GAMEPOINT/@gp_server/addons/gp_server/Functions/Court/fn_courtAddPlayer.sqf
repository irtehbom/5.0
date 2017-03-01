/*
Adds civ to court list
*/
private["_civ","_curUid","_getPlayerName","_wantedList","_uid"];

_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_curUid = getPlayerUID _civ;
_getPlayerName = _civ getVariable["realname",name _civ];
_wantedList = [];
{
_uid = _x select 1;

if (_curUid == _uid) then {
_wantedList pushBack _x;
};
} foreach life_wanted_list;

gp_court_list pushBack [_civ,_getPlayerName,_curUid,_wantedList];
publicVariable "gp_court_list";