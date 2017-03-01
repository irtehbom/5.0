private["_unit", "_params"];


_serverID = owner (missionNamespace getVariable ["bis_functions_mainscope", ObjNull]);

while {life_ai_respawn_enabled} do {
	// Retedermine HC owner id in case it connected later.
	_hcID = -1;

	if (!isNull(GP_HC)) then {
		_hcID = owner GP_HC;
	};
	
	
	_newArray = [];
	{
		_add = true;
		_unit = _x select 0;
		_original = _x;
	
		_dead = false;
		if (typeName _unit == typeName grpNull) then {
			_dead = { alive _x && (owner _x == _serverID || owner _x == _hcID) } count (units _unit) == 0;
		} else {
			if (typeName _unit == typeName []) then {
			
				_dead = true;
				{
					_entry = _x;
					
					_groupDead = { alive _x && (owner _x == _serverID || owner _x == _hcID) } count (units _entry) == 0;
					
					if (!_groupDead) exitWith { _dead = false; };
				} forEach _unit;
			} else {
				_dead = !alive _unit || (owner _x == _serverID || owner _x == _hcID);
			};
		};
		if (_dead) then {
			_lastSpawn = _original select 3;
			_timer = _original select 2;
			_currTime = time;
			
			if (_lastSpawn == -1) then {
				_original set[3, _currTime];
			} else {
				if (_lastSpawn + _timer <= _currTime) then {
					[[], _original select 1] call HC_fnc_spawn;
					_add = false;
				};
			};
		};
		if (_add) then {
			_newArray set[count _newArray, _original];
		};
	} forEach life_ai_respawn_list;
	
	life_ai_respawn_list = _newArray;

	sleep life_ai_respawn_tick;
};