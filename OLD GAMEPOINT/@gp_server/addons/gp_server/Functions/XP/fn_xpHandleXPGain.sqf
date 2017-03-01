private["_arr", "_player", "_level", "_experience", "_levelConfig", "_xpGained", "_newExperience", "_newLevel"];

_arr = [_this, 0, [], [[]]] call BIS_fnc_param;
_player = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;

_level = _player getVariable["Level", 1];
_experience = _player getVariable["Experience", 0];
_skillPoints = _player getVariable["SkillPoints", 0];

diag_log format["Current Level: %1 XP: %2", _level, _experience];

_levelConfig = [_level + 1] call life_fnc_xpGetLevelConfig;
if (count _levelConfig == 0) exitWith {
	[[_arr select 0 , _arr select 1], "life_fnc_xpExperienceEarned", owner _player, false] spawn life_fnc_MP;
};
_xpGained = _arr select 1;


// Experienced skill.
_skillRank = [_player, 102] call life_fnc_xpSkillRank; // Experience gain
if (_skillRank > 0) then {
	_xpGained = _xpGained * (1.0 + ((_skillRank * 10) / 100)); // 1.0 + 0.4 100 * 1.4 = 140
};
//

// Lucky man skill
if ([_player, 103] call life_fnc_xpHasSkill) then {
	_r = floor random 100;
	if (_r <= 5) then {
		// OMG.
		_xpGained = _xpGained * 2;
		[[1, "Lucky Man!"], "life_fnc_broadcast", owner _player, false] spawn life_fnc_MP;
	};
};



_newExperience = _experience + _xpGained;

diag_log format["%1 %2 %3", _level, _levelConfig, _newExperience];

if (_newExperience >= _levelConfig select 1) then {
	// Rank up
	_newLevel = _level + 1;
	_newExperience = _newExperience - (_levelConfig select 1);
	_player setVariable["Level", _newLevel, true];
	_player setVariable["Experience", _newExperience, true];
	
	_spGain = 1;
	if ([_player, 106] call life_fnc_xpHasSkill) then { // Skillful
		_spGain = 2;
	};
	_player setVariable["SkillPoints", _skillPoints + _spGain, true];
	
	[[_newLevel, _newExperience], "life_fnc_xpRankUp", owner _player, false] spawn life_fnc_MP;
} else {
	_player setVariable["Experience", _newExperience, true];
};

[[_arr select 0 , _xpGained], "life_fnc_xpExperienceEarned", owner _player, false] spawn life_fnc_MP;