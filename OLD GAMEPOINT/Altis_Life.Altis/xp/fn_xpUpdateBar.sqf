disableSerialization;
private[];

_level = player getVariable["Level", -1];
_experience = player getVariable["Experience", -1];

if (_level == -1 || _experience == -1) exitWith {};

_levelConfig = [_level + 1] call life_fnc_xpGetLevelConfig;
if (count _levelConfig == 0) exitWith {
	_display = uiNamespace getVariable "XPBar";
	_bar = _display displayCtrl 1;
	_bar progressSetPosition 0;
};

_expRequired = _levelConfig select 1;
_value = _experience / _expRequired;

_display = uiNamespace getVariable "XPBar";
_bar = _display displayCtrl 1;
_bar progressSetPosition _value;