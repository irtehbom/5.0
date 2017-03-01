private[];
disableSerialization;

_gangName = ctrlText ((findDisplay 2520) displayCtrl 2522);
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_length > 32) exitWith {hint localize "STR_GNOTF_Over32"; };
_badChar = false;

{
	if (!(_x in _allowed)) exitWith { _badChar = true; };
} foreach _chrByte;

if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar"; };

if(ftp_atmcash < (call life_gangPrice)) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney", [((call life_gangPrice) - ftp_atmcash)] call life_fnc_numberText];};

[[player, _gangName], "life_fnc_gangCreateRequest", false, false] spawn life_fnc_MP;

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;