private["_name","_group"];

_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
_name = [_this, 1, "", [""]] call BIS_fnc_param;

if(!isNil {(group player) getVariable "gangName"}) exitWith { hint "You are already in a gang"; };


_gangName = _group getVariable "gangName";
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[[player, _group], "life_fnc_gangJoin", false, false] spawn life_fnc_MP;
} else {
	hint "You have rejected the invitation.";
};