/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];

if (side player == independent) exitWith {};
switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 3;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 3;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 3;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 3;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 3;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _val = 3;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _val = 3;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 3;};

	case (player distance (getMarkerPos "silver_marker") < 120) : {_mine = "usilver"; _val = 3;};
	case (player distance (getMarkerPos "clay_marker") < 120): {_mine = "uclay"; _val = 3;};
	case (player distance (getMarkerPos "cobalt_marker") < 120) : {_mine = "ucobalt"; _val = 3;};
	case (player distance (getMarkerPos "lead_marker") < 120) : {_mine = "ulead"; _val = 3;};
	case (player distance (getMarkerPos "titanium_marker") < 120): {_mine = "utitanium"; _val = 3;};	
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
	//[[8, player, (call life_donator)], "life_fnc_xpGenericXPGain", false, false] spawn life_fnc_MP;
};

life_action_inUse = false;