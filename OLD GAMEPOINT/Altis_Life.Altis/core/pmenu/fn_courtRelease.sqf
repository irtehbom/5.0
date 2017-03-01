#include <macro.h>
private["_display","_list","_data","_playerUnit","_playerName","_playerUID"];

disableSerialization;


_display = findDisplay 9400;
_list = _display displayCtrl 9402;
_data = lbData[9401,(lbCurSel 9401)];

_data = call compile format["%1", _data];

_playerUnit = _data select 0;
_playerName = _data select 1;
_playerUID = _data select 2;


_playerUnit setPos (getMarkerPos "jail_release");


[[_playerUID],"life_fnc_courtRemovePlayer",false,false] spawn life_fnc_MP;