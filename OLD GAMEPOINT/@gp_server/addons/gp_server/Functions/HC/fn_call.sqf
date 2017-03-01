private["_params", "_code"];

_params = [_this, 0, []] call BIS_fnc_param;
_code = [_this, 1, "", [""]] call BIS_fnc_param;
_exclusivelyHC = [_this, 2, false, [false]] call BIS_fnc_param;

if (_exclusivelyHC && isNull GP_HC) exitWith {}; // Cancel excecution

if (!isNull GP_HC) then {
	diag_log format["[HC] Execing '%1' on HC", _code];
	[_params, _code, owner GP_HC] spawn life_fnc_MP;
} else {
	diag_log format["[HC] Execing '%1' on server", _code];
	_params call (missionNamespace getVariable[_code, { diag_log "[HC] Execing on server failed - function not found in missionNamespace"; }]);
};