#include "..\..\script_macros.hpp"
/*
Pays the rent on the real estate
*/
private[];
_estate = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_rent = _estate getVariable["rent", 0];

_total = 0;

if (_rent > 0) then {
	_total = _rent * real_estate_rent;
};

if (_total == 0) exitWith { hint "You're up to date with your rent!"; };
if (_total > BANK) exitWith { hint format["You do not have enough money in your bank to pay the $%1 fee.", [_total] call life_fnc_numberText]; };

_action = [
	format["Paying rent for this property costs <t color='#8cff9b'>$%1</t>. This will be taken from your bank account, do you wish to continue?", [_total] call life_fnc_numberText],
	"Pay rent",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;


if(_action) then {

	BANK = BANK - _total;
	_estate setVariable["rent", 0, true];
	if (life_HC_isActive) then {
		[_estate] remoteExec ["HC_fnc_payRentRealEstate",HC_Life];
	} else {
		[_estate] remoteExec ["TON_fnc_payRentRealEstate",RSERV];
	};
	
};