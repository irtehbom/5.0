private[];
disableSerialization;


_display = findDisplay 909090;
if (!isNull _display) exitWith {};

createDialog "XPMenu";
_display = findDisplay 909090;

_button = _display displayCtrl 206;
_button ctrlEnable false; // Initially disabled

(_display displayCtrl 203) ctrlShow false;
(_display displayCtrl 204) ctrlShow false;
(_display displayCtrl 206) ctrlShow false;
(_display displayCtrl 207) ctrlShow false;

// Update XP Bar
_xpBar = _display displayCtrl 1;

_level = player getVariable["Level", -1];
_experience = player getVariable["Experience", -1];

if (_level == -1 || _experience == -1) exitWith {};


_levelConfig = [_level + 1] call life_fnc_xpGetLevelConfig;

_expRequired = 0;
_value = 0;
if (count _levelConfig > 0) then {
	_expRequired = _levelConfig select 1;
	_value = _experience / _expRequired;
};

_xpBar progressSetPosition _value;
// End update XP bar

// Update current rank text
_currentRankName = "Recruit";

if (_level >= 2) then {
	_currentRank = [_level] call life_fnc_xpGetLevelConfig;
	_currentRankName = _currentRank select 2;
};

_rankText = _display displayCtrl 2;
_rankText ctrlSetText format["Your current rank is %1 (%2)", _currentRankName, _level];

// End update current rank text



// Update third skill tree speciality

_treeThreeHeader = _display displayCtrl 3;
_treeText = "";

switch (side player) do {
	case civilian: {
		_treeText = "Rebel";
	};
	
	case west: {
		_treeText = "Police officer";
	};
	
	case east: {
		_treeText = "Mechanic";
	};
	
	case independent: {
		_treeText = "Medic";
	};
};

_treeThreeHeader ctrlSetText format["%1 %2", _treeText, " (coming soon!)"];

// End update third skill tree speciality

// Update XP.
_xpText = _display displayCtrl 4;
_xpText ctrlSetText format["XP: %1 / %2", _experience, _expRequired];

_nextRankIcon = _display displayCtrl 5;
_nextRankText = _display displayCtrl 6;
_currentRankIcon = _display displayCtrl 7;

if (count _levelConfig > 0) then {
	_nextRankIcon ctrlSetText format["xp\textures\%1.paa", _levelConfig select 0];
	_nextRankText ctrlSetText format["Next rank: %1 (%2)", _levelConfig select 2, _levelConfig select 0];
} else {
	_nextRankIcon ctrlSetText "";
	_nextRankText ctrlSetText "";
};

if (_level <= 1) then {
	_currentRankIcon ctrlSetText "";
} else {
	_currentRankIcon ctrlSetText format["xp\textures\%1.paa", _level];
};


// Skill update
[] call life_fnc_xpUpdateSkillMenu;
