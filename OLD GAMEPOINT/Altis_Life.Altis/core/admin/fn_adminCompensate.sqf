#include <macro.h>
/*
	File: fn_adminCompensate.sqf
	Author: ColinM9991
	
	Description:
	Figure it out.
*/
private["_value","_action"];
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
_value = parseNumber(ctrlText 9922);
if(_value < 0) exitWith {};
if(_value > 999999) exitWith {hint localize "STR_ANOTF_Fail"};
//if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};

_action = [
	format ["Are you sure you want to give yourself %1?",[_value] call life_fnc_numberText],
	"Compensate",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	ftp_atmcash = ftp_atmcash + _value;
	hint format [localize "STR_ANOTF_Success",[_value] call life_fnc_numberText];
	closeDialog 0;
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
};