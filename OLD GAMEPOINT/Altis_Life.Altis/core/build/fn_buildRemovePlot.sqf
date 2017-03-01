private[];

if ((group player) getVariable["gangLeader", -1] != getPlayerUID player) exitWith { hint "Only the leader can perform this action."; };

_action = [
	"This will remove the plot pole and all the objects surrounding it. If for some reason you had multiple plot poles, it will remove those aswell. You will get your plot pole back but NOT any of the objects or storage crates! Use at your own risk. Make sure you have atleast one space in your virtual inventory. Are you sure?",
	"Remove plot pole",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;


if (_action) then {
	[[player], "life_fnc_buildRemovePlotRequest", false, false] spawn life_fnc_MP;
};