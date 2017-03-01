/*
Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
File: fn_wantedList.sqf
Author: Bryan "Tonic" Boardwine"

Description:
Displays wanted list information sent from the server.
*/
private["_info","_display","_list","_units","_entry"];
disableSerialization;
_info = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 60000;
_list = _display displayctrl 60002;

{
	_targetGangName = _x select 4;
	if (isNil "_targetGangName" || _targetGangName == "") then {
		_list lbAdd format["%1", format["Unaffiliated player",_targetGangName]];
	} else {
		_list lbAdd format["%1", format["[%1] member",_targetGangName]];
	};
	_list lbSetData [(lbSize _list)-1,str(_x)];
} forEach _info;