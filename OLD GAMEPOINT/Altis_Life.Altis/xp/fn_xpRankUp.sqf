disableSerialization;

private["_level", "_experience", "_levelConfig"];

_level = [_this, 0, 0, [0]] call BIS_fnc_param;
_experience = [_this, 1, 0, [0]] call BIS_fnc_param;

["xpRankUp"] spawn life_fnc_xpPlaySoundExclusive;

5 cutRsc["Transcend_RankUpIcon", "PLAIN"];


_levelConfig = [_level] call life_fnc_xpGetLevelConfig;

_display = displayNull;
waitUntil {
	_display = uiNamespace getVariable["RankUpIcon", displayNull];
	!isNull (_display);
};

_pic = _display displayCtrl 1;
_text = _display displayCtrl 2;

_pic ctrlSetText format["xp\textures\%1.paa", _levelConfig select 0];
_text ctrlSetText format["You've been promoted to %1!", _levelConfig select 2];