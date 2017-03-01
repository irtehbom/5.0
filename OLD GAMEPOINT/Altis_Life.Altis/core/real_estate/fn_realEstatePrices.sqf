/*
Sets the prices & cargo containers
*/
private[];
_estate = [_this,0,"",[""]] call BIS_fnc_param;
if(_estate == "") exitWith {[]};

switch (true) do {
	case (_estate in ["Land_i_House_Big_01_V1_F"]): {[20000000,4]};
	default {[]};
};