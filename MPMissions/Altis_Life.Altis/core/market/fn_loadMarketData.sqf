#include "..\..\script_macros.hpp"
/*
	Author Rob
	Loads items to the market dialog
*/

disableSerialization;
_dialog = findDisplay 43000;
_listbox = _dialog displayCtrl 43700;
_duplicateCheck = [];
_resourceCfg = missionConfigFile >> "VirtualItems";

{
	_itemName = _x select 0;
	_price = _x select 1;
	_icon = M_CONFIG(getText,"VirtualItems",_itemName,"icon");
	_item = M_CONFIG(getText,"VirtualItems",_itemName,"displayname");
	_item = localize _item;
	_listbox lbAdd format ["%1",_item];
	_listbox lbSetData [(lbSize _listbox )-1, format["%1", _price]];
	_listbox lbSetPicture [(lbSize _listbox )-1,_icon];
	
	_duplicateCheck pushBack _itemName; 
		
		
} forEach MarketPrices;

{

	_className = configName _x;
	
	if (!(_className in _duplicateCheck)) then {
	
		_icon = (getText(_x >> "icon"));
		_price = (getNumber(_x >> "sellPrice"));
		_itemName = (getText(_x >> "displayName"));
		_itemName = localize _itemName;
		_listbox lbAdd format ["%1",_itemName];
		_listbox lbSetData [(lbSize _listbox )-1, format["%1", _price]];
		_listbox lbSetPicture [(lbSize _listbox )-1,_icon];
	
	};

} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
