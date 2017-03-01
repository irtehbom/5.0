private["_plotpole"];
_plotpole = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

// Check for gang.
if ((group player) getVariable["gangId", -1] == -1) exitWith { hint "You are not in a gang."; };

_rank = player getVariable["gangRank", -1];
_rankConfig = [_rank] call life_fnc_gangGetRank;

if (!(_rankConfig select 6)) exitWith { hint "You are not high enough rank in the gang to be able to maintain objects on your gang plot."; };

_objects = nearestObjects[_plotpole, ["Static", "Thing"], life_build_plot_radius + 20];
_totalCost = 0;
{
	_damage = _x getVariable["damage", 0];
	
	if (_damage > 0) then {
		// Damaged object.
		_object = [typeOf _x] call build_getObject;
		
		_buyCost = _object select 3;
		if (_buyCost > 0) then {
			_add = (_buyCost / 20) * _damage;
			_totalCost = _totalCost + round(_add);
		};
	};
} forEach _objects;

_bank = (group player) getVariable["gangBank", 0];

if (_totalCost == 0) exitWith { hint "No maintenance necessary."; };
if (_totalCost > _bank) exitWith { hint format["You do not have enough money in your gang bank to pay the $%1 fee.", [_totalCost] call life_fnc_numberText]; };

_action = [
	format["Maintaining the area costs $%1. This will be taken out of your gang bank. Do you wish to continue?", [_totalCost] call life_fnc_numberText],
	"Maintain area",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;


if (_action) then {
	_bank = _bank - _totalCost;
	
	(group player) setVariable["gangBank", _bank, true];
	
	{
		_x setVariable["damage", 0, true];
		_x setDamage 0;
	} forEach _objects;
	[[group player], "life_fnc_buildMaintained", false, false] spawn life_fnc_MP;
};

