private[];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint "You need to select a player to promote to leader."; };
_unit = call compile format["%1",lbData[2621,(lbCurSel 2621)]];
if(isNull _unit) exitWith {}; // Possible in this case.
if(_unit == player) exitWith { hint "You are already the gang leader."; };


_action = [
	format["Are you sure you would like to transfer leadership to %1?", _unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	// User clicked OK on the GUI window.
	_group = group player;
	_group setVariable["gangLeader", getPlayerUID _unit, true];
	
	// In fact, do that from the server again.
	[[_unit, _group], "life_fnc_gangNewLeaderRequest", false, false] call life_fnc_MP;
};

[] call life_fnc_gangMenu;