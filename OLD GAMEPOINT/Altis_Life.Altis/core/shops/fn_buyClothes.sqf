/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if ((call life_donator) > 0) then {
	// Change all prices according to donator level.
	
	_percentageDecrease = (call life_donator) * 10;
	if (_percentageDecrease == 40) then {
		_percentageDecrease = 50;
	};
	
	_price = _price - (_price / 100 * _percentageDecrease);
};

if(_price > ftp_cash) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
ftp_cash = ftp_cash - _price;

life_clothesPurchased = true;
[] call life_fnc_skins;
closeDialog 0;