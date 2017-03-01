private[];
disableSerialization;

_rank = [_this, 0, 0, [0]] call BIS_fnc_param;

if ((lbCurSel 2621) == -1) exitWith { hint "You must select a person to rank."; };
_unit = call compile format["%1", lbData[2621,(lbCurSel 2621)]];
if(isNull _unit) exitWith {}; //This is actually possible if the player logs out when the window is open.
//if(_unit == player) exitWith {hint "You can not rank yourself."; };

_leader = (group player) getVariable["gangLeader", -1];
if (getPlayerUID _unit == _leader) exitWith { hint "The leader can not be ranked lower or higher."; };

_currentRank = _unit getVariable["gangRank", -1];
_newRank = _currentRank + _rank;

_gangRankCount = count (call life_gang_ranks);
if (_newRank  < 0 || _newRank >= _gangRankCount) exitWith { hint "You can't rank this player any higher/lower."; };

_unit setVariable["gangRank", _newRank, true];

_rank = [_newRank] call life_fnc_gangGetRank;

[[_unit, _newRank, _rank select 1], "life_fnc_gangRankPlayerRequest", false, false] call life_fnc_MP;
[] call life_fnc_gangMenu;