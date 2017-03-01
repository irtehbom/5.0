#include <macro.h>
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type"];

if(!life_use_atm) exitWith
{
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2",[ftp_atmcash] call life_fnc_numberText,[ftp_cash] call life_fnc_numberText];

{
	if(alive _x) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
			case east: {_type = "OPFOR"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

_rank = player getVariable["gangRank", -1];
_rankConfig = [_rank] call life_fnc_gangGetRank;

if (_rank == -1) then {
	(getControl(2700,2706)) ctrlEnable false;
} else {
	if (!(_rankConfig select 4)) then {
		(getControl(2700,2706)) ctrlEnable false;
	};
};