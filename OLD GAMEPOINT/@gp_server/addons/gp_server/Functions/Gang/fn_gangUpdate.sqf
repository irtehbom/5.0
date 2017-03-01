private["_query"];

_update = [_this, 0, 0, [0]] call BIS_fnc_param;
_gang = [_this, 1, grpNull, [grpNull]] call BIS_fnc_param;

_query = "";
_gangId = _gang getVariable["gangId", -1];

switch (_update) do {
	case 1: // Update bank
	{
		_bank = _gang getVariable["gangBank", -1];
		if (_bank != -1) then {
			_query = format["UPDATE gang SET bank = '%1' WHERE ID='%2'", [_bank] call DB_fnc_numberSafe, _gangId];
		};
	};
		
	case 10: // Combined update: upgrade + bank
	{
		_newLevel = _gang getVariable["gangLevel", -1];
		_bank = _gang getVariable["gangBank", -1];
		
		if (_bank != -1 && _newLevel != -1) then {
			_query = format["UPDATE gang SET bank = '%1', level = %2 WHERE ID='%3'", [_bank] call DB_fnc_numberSafe, _newLevel, _gangId];
		};
	};
};

if(!isNil "_query" && _query != "") then {
	waitUntil{!DB_Async_Active};
	[_query, 1] call DB_fnc_asyncCall;
};