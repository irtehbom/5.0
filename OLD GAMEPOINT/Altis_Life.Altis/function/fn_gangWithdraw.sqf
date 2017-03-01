#include <macro.h>
/*
	Author: ME
	
	Description:
	Geld vom Gangkonto abheben
*/
private["_value"];



_value = parseNumber(ctrlText 2702);
__SUB__(_gFund,_value);
_gFund = grpPlayer getVariable ["gangBank",0];


if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > _gFund) exitWith {hint "You don't have that much money in the account"};
if(_value < 100 && _gFund > 20000000) exitWith {hint "You cannot withdraw less than a $100."};


ftp_cash = ftp_cash + _value;
_gFund = _gFund - _value;
grpPlayer setVariable ["gangBank",_gFund,true];

hint format["You have withdrawn $%1 from your gang bank account",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest;
[[1, grpPlayer], "life_fnc_gangUpdate", false, false] spawn life_fnc_MP;