/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint "You can't withdraw more then $999,999";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint "That isn't in an actual number format."};
if(_val > ftp_atmcash) exitWith {hint "You don't have that much in your bank account!"};
if(_val < 100 && ftp_atmcash > 20000000) exitWith {hint "You can't withdraw less then $100"}; //Temp fix for something.

ftp_cash = ftp_cash + _val;
ftp_atmcash = ftp_atmcash - _val;
hint format ["You have withdrawn $%1 from your bank account",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;