/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something
*/
private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "life_weapon_shop")) exitwith {};

_config = [_this select 3] call life_fnc_weaponShopCfg;

if ((call life_donator) > 0) then {
	// Change all prices according to donator level.
	
	_percentageDecrease = (call life_donator) * 10;
	if (_percentageDecrease == 40) then {
		_percentageDecrease = 50;
	};
	
	{
		_price = _x select 2;
		
		_price = _price - (_price / 100 * _percentageDecrease);
		_x set[2, _price];
	} forEach (_config select 1);
};

if(typeName _config == "STRING") exitWith {hint _config; closeDialog 0;};

ctrlSetText[38401,_config select 0];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";

_filters lbSetCurSel 0;