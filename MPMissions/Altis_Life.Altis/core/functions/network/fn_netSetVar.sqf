/*
	Edited by Rob for 5.0
*/
disableSerialization;
private["_varName","_ns","_value","_mailbox"];
_varName = param [0,"",[""]];
_value = _this select 1;
if(_varName == "life_messages") exitWith {
	_isEqual = param [2,false,[false]];
	if(_isEqual) then {life_messages = _value} else {life_messages pushBack _value};
};
_ns = param [2,missionNamespace,[missionNamespace]];
_mailbox = param [3,false,[false]];
if(_mailbox) exitWith {
	_item = param [4,false,[false]];
	if(_item) exitWith {
		_checkForExisting = false;
		{if((_value select 0) == (_x select 0)) exitWith {_checkForExisting = true; life_mailbox set[_forEachIndex,[_x select 0,((_x select 1) + (_value select 1))]]};} forEach life_mailbox;
		if(!_checkForExisting) then {
			life_mailbox pushBack _value;
		};
	};
	life_mailbox pushBack _value;
};

if(_varName == "") exitWith {}; /*Error checking*/
_ns setVariable[_varName,_value];
