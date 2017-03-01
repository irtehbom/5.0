/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pardons the selected player.
*/
private["_display","_list","_data","_player","_target","_amount","_name"];
disableSerialization;

_display = findDisplay 60000;
_data = lbData[60002,(lbCurSel 60002)];
_amount = ctrlText 60005;
_data = call compile format["%1", _data];
if (isNil "_data") exitWith {};
if!(isNil "(player getVariable ['contractAccepted', 1])") exitWith {hint "You've already accepted a contract.";};
_unit = _data select 5;
if (!(alive _unit) || damage _unit >= 1) exitWith { hint "The player is dead. Try accepting this contract again in a few minutes."; };

_player = _data select 0;
_target = _data select 1;
_name = _data select 2;
_amount = _data select 3;
_gangName = _data select 4;

hint parseText format["You've accepted a contract. Check your map for his/her last known location, complete it before somebody else does! Your target is:<br/><br/><t color='#FF0000'>%1</t>", _name];

player setVariable["contractAccepted",_target,true];

_marker = createMarkerLocal ["mrkHitmanTarget", visiblePosition _unit];
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTypeLocal "Mil_dot";
_marker setMarkerTextLocal format["%1", _name];

[[2,"A bounty hunter has accepted your contract!"],"life_fnc_broadcast",owner _unit,false] spawn life_fnc_MP;