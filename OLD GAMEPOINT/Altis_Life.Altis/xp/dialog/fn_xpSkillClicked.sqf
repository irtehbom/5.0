private[];
disableSerialization;


_skill = [_this, 0, 0, [0]] call BIS_fnc_param;

_level = player getVariable["Level", -1];
_skillPoints = player getVariable["SkillPoints", 0];

_display = findDisplay 909090;
if (_display == displayNull) exitWith {};

_icon = _display displayCtrl 200;
_name = _display displayCtrl 201;
_description = _display displayCtrl 202;
_maxRank = _display displayCtrl 203;
_levelReq = _display displayCtrl 204;
_currentRank = _display displayCtrl 205;
_button = _display displayCtrl 206;
_button ctrlShow true;
_button ctrlEnable true; // Reset enabled.
(_display displayCtrl 207) ctrlShow true;
_maxRank ctrlShow true;
_levelReq ctrlShow true;

_skillArray = [_skill] call xp_findSkillByID;

// Level req and skill point req
if (_skillPoints == 0 || (_skillArray select 5) > _level) then {
	_button ctrlEnable false;
};

// Separately check for prereqs.
_prereq = _skillArray select 6;
if (_prereq > 0) then {
	// There is a prereq - make sure it's satisfied.
	
	_prereqArray = [_prereq] call xp_findChosenSkillByID;
	if (count _prereqArray <= 0) then {
		// Player does NOT have the prereq
		_button ctrlEnable false;
	};
};


_button ctrlSetEventHandler["ButtonClick", format["[%1] call life_fnc_xpIncreaseSkill;", _skill]];




_icon ctrlSetText format["xp\textures\skills\%1.paa", _skill];
_name ctrlSetText (_skillArray select 2);
_description ctrlSetStructuredText parseText (_skillArray select 3);
_maxRank ctrlSetText format["Max rank: %1", (_skillArray select 4)];
_levelReq ctrlSetText format["Level required: %1", (_skillArray select 5)];

_chosenSkill = [_skill] call xp_findChosenSkillByID;

_tempCurrentRank = 0;
if (count _chosenSkill > 0) then {
	// Player has this skill
	_tempCurrentRank = _chosenSkill select 1;
	
	if (_tempCurrentRank == _skillArray select 4) then {
		_button ctrlEnable false; // Disables the button when max rank has been reached.
	};
};

_currentRank ctrlSetText format["%1", _tempCurrentRank];