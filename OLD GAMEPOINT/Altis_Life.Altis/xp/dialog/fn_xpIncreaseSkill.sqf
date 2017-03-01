private[];
disableSerialization;

_skill = [_this, 0, 0, [0]] call BIS_fnc_param;

_chosenSkills = player getVariable["Skills", []];
_skillPoints = player getVariable["SkillPoints", 0];

if (_skillPoints == 0) exitWith { hint "You do not have enough skillpoints."; }; // Shouldn't happen as the button is disabled when there are not enough skillpoints
_chosenSkill = [_skill] call xp_findChosenSkillByID;


if (count _chosenSkill > 0) then {
	// Player already had this skill but is choosing to increase it.
	// First remove it
	_chosenSkills = _chosenSkills - _chosenSkill;
	
	_chosenSkill set[1, (_chosenSkill select 1) + 1];
	
	_chosenSkills pushBack _chosenSkill;
} else {
	// Player did not already have this.
	_chosenSkills pushBack [_skill, 1];
};

player setVariable["Skills", _chosenSkills, true];
player setVariable["SkillPoints", _skillPoints - 1, true];

[] call life_fnc_xpUpdateSkillMenu;
[_skill] call life_fnc_xpSkillClicked; // Force update panel