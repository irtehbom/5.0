
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;



if (player != _player && _group != grpNull) then {
	_group selectLeader _player;
	_player setRank "COLONEL";
};