private[];

_display = findDisplay 909090;
if (_display == displayNull) exitWith {};

// Ok, gotta do tons of shit here.
_level = player getVariable["Level", -1];
_experience = player getVariable["Experience", -1];
_skillPoints = player getVariable["SkillPoints", 0];

// First of all, get all skills and go through them
{
	_id = _x select 1;
	_icon = _display displayCtrl _id;
	
	// Ok, check active?
	_chosenSkill = [_id] call xp_findChosenSkillByID;
	
	if (count _chosenSkill == 0) then {
		// Not picked. Available, though?
		
		// Check level req
		_levelReq = _x select 5;
		
		_enabledArrow = "xp\textures\arrow-down.paa";
		_disabledArrow = "xp\textures\arrow-down-disabled.paa";
		
		if (_levelReq == 10) then {
			_enabledArrow = "xp\textures\arrow-down-alt.paa";
			_disabledArrow = "xp\textures\arrow-down-alt-disabled.paa";
		};
		
		if (_levelReq == 0 || _level >= _levelReq) then {
			// So far so good. Check prerequisite
			_prereq = _x select 6;
			
			_ok = false;
			if (_prereq == 0) then {
				_ok = true;
			} else { // No || in if because arma checks both instead of short circuiting.
				_prereqArray = [_prereq] call xp_findChosenSkillByID;
				_ok = count _prereqArray > 0;
			};
			
			if (_ok) then {
				// Available
				if (_prereq > 0) then {
					_arrow = _display displayCtrl (_id * 100);
					_arrow ctrlSetText _enabledArrow;
				};
				
				_icon ctrlSetText format["xp\textures\skills\%1_a.paa", _id];
			} else {
				// Unavailable.
				if (_prereq > 0) then {
					_arrow = _display displayCtrl (_id * 100);
					_arrow ctrlSetText _disabledArrow;
				};
				_icon ctrlSetText format["xp\textures\skills\%1_u.paa", _id];
			};
		} else {
			// Unavailable.
			if (_x select 6 > 0) then {
				// Has a prereq, so has an arrow. Disable that.
				_arrow = _display displayCtrl (_id * 100);
				_arrow ctrlSetText _disabledArrow;
			};
			_icon ctrlSetText format["xp\textures\skills\%1_u.paa", _id];
		};
	} else {
		if (_x select 6 > 0) then {
			// Has a prereq, so has an arrow. Disable that.
			_arrow = _display displayCtrl (_id * 1000);
			_arrow ctrlSetText _enabledArrow;
		};
		_icon ctrlSetText format["xp\textures\skills\%1.paa", _id];
	};
} forEach (GP_Skills);


_sp = _display displayCtrl 300;
_sp ctrlSetText format["%1", _skillPoints];
