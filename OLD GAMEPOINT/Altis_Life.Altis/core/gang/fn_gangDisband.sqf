private[];

_action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint localize "STR_GNOTF_DisbandGangPro";
	[[(group player)], "life_fnc_gangDisbandRequest", false, false] spawn life_fnc_MP;
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
};