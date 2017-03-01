/*
Called in court.hpp - Get's the list of people in court
*/
private["_info","_display","_list","_units","_entry"];

disableSerialization;

_display = findDisplay 9400;
_list = _display displayctrl 9401;

{
        _playerName = _x select 1;
		_list lbAdd format["%1", _playerName];
		_list lbSetData [(lbSize _list)-1,str(_x)];
		
} foreach gp_court_list;

publicVariable "gp_court_list";

ctrlSetText[9404,"Connection Established"];
