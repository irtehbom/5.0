disableSerialization;
private["_ctrl", "_var"];

_ctrl = _this select 0;
_var = _this select 1;
uiNamespace setVariable[_var, true];

_startTime = floor(time);

_continue = true;
waitUntil {
	_currTime = floor(time);
	
	_continue = uiNamespace getVariable[_var, true];
	_currTime - _startTime >= 5 || !_continue;
};

if (!_continue) exitWith {};

_ctrl ctrlSetFade 2;
_ctrl ctrlCommit 0.5;

sleep 0.5;

_ctrl ctrlSetText "";
_ctrl ctrlSetFade 0;
_ctrl ctrlCommit 0;
_ctrl ctrlShow true;
uiNamespace setVariable[_var, false];