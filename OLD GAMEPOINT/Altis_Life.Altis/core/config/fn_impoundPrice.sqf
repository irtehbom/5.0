/*
	File: fn_impoundPrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sort of a config for the price of unimpounding a vehicle based on damage states.
	Will be whiped on new system.
*/
private["_veh","_price"];
_veh = _this select 0;
if(isNull _veh) exitWith {};

switch (true) do
{
	case (_veh isKindOf "Car") :
	{
		_price = 10000;
	};
	
	case (_veh isKindOf "Air") :
	{
		_price = 20000;
	};

	case (_veh isKindOf "Ship") :
	{
		_price = 20000;
	};
};

_price;