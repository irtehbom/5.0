/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pardons the selected player.
*/
private["_display","_list","_uid","_data","_amount"];
disableSerialization;

_display = findDisplay 50000;
//_list = _display displayCtrl 50002;
_data = lbData[50002,(lbCurSel 50002)];
_amount = ctrlText 50005;
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};

if (side _data == independent) exitWith { hint "Medics can not be targeted for a hit."; };
if (parseNumber(_amount) < 200000) exitWith { hint "The bounty must be $200,000 or higher."; };
if ((ftp_atmcash - parseNumber(_amount)) <= 0) exitWith { hint "You don't have enough money!"; };

ftp_atmcash = ftp_atmcash - parseNumber(_amount);

_group = group _data;
_groupName = _group getVariable["gang_name",""];
[[getPlayerUID(player),getPlayerUID(_data), _data getVariable["realname", name _data],_amount,_groupName],"life_fnc_hitmanHire",false,false] spawn life_fnc_MP;

hint "Your hit has been listed.";