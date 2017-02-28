#include "..\..\script_macros.hpp"
/*
	Author Rob
	Gets data on market selection and returns the price.
*/

disableSerialization;
_dialog = findDisplay 43000;
_listbox = _dialog displayCtrl 43700;
_priceControl = _dialog displayCtrl 43600;
_index = lbCurSel _listbox;
_currentPrice = _listbox lbData _index;

if (_currentPrice == "-1") then {
	_currentPrice = "No Sell Price";
} else {
	_currentPrice = "$" + _currentPrice; 
};

_priceControl ctrlSetText _currentPrice; 