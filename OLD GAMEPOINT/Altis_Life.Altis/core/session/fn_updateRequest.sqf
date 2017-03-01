/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,ftp_cash,ftp_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"opfor"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[false] call life_fnc_saveGear;
_packet pushBack life_gear;
_packet pushBack player;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
		case east: {
		_packet pushBack life_is_arrested;
	};
};
[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;